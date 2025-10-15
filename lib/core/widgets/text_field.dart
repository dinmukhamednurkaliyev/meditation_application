import 'package:flutter/material.dart';

@immutable
class ApplicationTextFieldStyle {
  final TextStyle? hintStyle;
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;

  const ApplicationTextFieldStyle({
    this.hintStyle,
    this.fillColor,
    this.border,
    this.contentPadding,
  });

  ApplicationTextFieldStyle copyWith({
    TextStyle? hintStyle,
    Color? fillColor,
    InputBorder? border,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return ApplicationTextFieldStyle(
      hintStyle: hintStyle ?? this.hintStyle,
      fillColor: fillColor ?? this.fillColor,
      border: border ?? this.border,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }
}

class ApplicationTextFieldTheme
    extends ThemeExtension<ApplicationTextFieldTheme> {
  final ApplicationTextFieldStyle? style;

  const ApplicationTextFieldTheme({this.style});

  @override
  ThemeExtension<ApplicationTextFieldTheme> copyWith({
    ApplicationTextFieldStyle? style,
  }) {
    return ApplicationTextFieldTheme(style: style ?? this.style);
  }

  @override
  ThemeExtension<ApplicationTextFieldTheme> lerp(
    ThemeExtension<ApplicationTextFieldTheme>? other,
    double t,
  ) {
    if (other is! ApplicationTextFieldTheme) {
      return this;
    }
    return ApplicationTextFieldTheme(
      style: ApplicationTextFieldStyle(
        hintStyle: TextStyle.lerp(style?.hintStyle, other.style?.hintStyle, t),
        fillColor: Color.lerp(style?.fillColor, other.style?.fillColor, t),
        border: t < 0.5 ? style?.border : other.style?.border,
        contentPadding: EdgeInsetsGeometry.lerp(
          style?.contentPadding,
          other.style?.contentPadding,
          t,
        ),
      ),
    );
  }
}

class ApplicationTextField extends StatelessWidget {
  const ApplicationTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.hintText,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText = false;
  final Widget? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final textFieldTheme = Theme.of(
      context,
    ).extension<ApplicationTextFieldTheme>();

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: textFieldTheme?.style?.fillColor,
        border: textFieldTheme?.style?.border,
        hintStyle: textFieldTheme?.style?.hintStyle,
        contentPadding: textFieldTheme?.style?.contentPadding,
      ),
    );
  }
}
