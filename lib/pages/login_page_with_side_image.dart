import 'package:flutter/material.dart';
import 'package:flutter_ui_components/buttons/fast_button.dart';
import 'package:flutter_ui_components/ui_elements/fast_text_field.dart';

class LoginPageWithSideImage extends StatelessWidget {
  final double? pageMaxWidth;
  final double? loginWidgetsMaxWidth;
  final EdgeInsetsGeometry? imagePadding;
  final double? imageCornerRadius;
  final ImageProvider image;
  final Widget? title;
  final Widget? subtitle;
  final Function(String)? onEmailChanged;
  final Function(String)? onPasswordChanged;
  final bool rememberMe;
  final Function(bool?)? onRememberMeChanged;
  final Function()? onLoginButtonPressed;
  final Function()? onForgotPasswordPressed;
  final Function()? onSignUpPressed;

  const LoginPageWithSideImage({
    super.key,
    this.pageMaxWidth,
    this.loginWidgetsMaxWidth,
    this.imagePadding,
    this.imageCornerRadius,
    required this.image,
    this.title,
    this.subtitle,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.rememberMe = false,
    this.onRememberMeChanged,
    this.onLoginButtonPressed,
    this.onForgotPasswordPressed,
    this.onSignUpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: pageMaxWidth ?? double.infinity),
        child: Row(
          spacing: 48,
          children: [
            /// Login content
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: loginWidgetsMaxWidth ?? 500),
                    child: Column(
                      spacing: 24,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null || subtitle != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              if (title != null) title!,
                              if (subtitle != null) subtitle!,
                              const SizedBox(height: 16),
                            ],
                          ),

                        /// Email
                        FastTextField(
                          title: 'Email',
                          placeholder: 'johndoe@email.com',
                          onChanged: onEmailChanged,
                        ),

                        /// Password
                        FastTextField(
                          title: 'Password',
                          placeholder: '••••••••••',
                          obscureText: true,
                          suffix: const Icon(
                            Icons.visibility_off,
                            color: Colors.red,
                          ),
                          onChanged: onPasswordChanged,
                        ),

                        /// Login button
                        FastButton(
                          text: 'Sign in',
                          borderRadius: 8,
                          onPressed: onLoginButtonPressed,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Remember me
                            Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  side: const BorderSide(color: Colors.grey, width: 1),
                                  value: rememberMe,
                                  onChanged: (value) => onRememberMeChanged?.call(value),
                                ),
                                const Text('Remember me',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),

                            /// Forgot password
                            TextButton(
                              onPressed: onForgotPasswordPressed,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.blue,
                                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                    ),
                              ),
                              child: const Text('Forgot password?'),
                            ),
                          ],
                        ),

                        /// Don't have an account?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                )),
                            TextButton(
                              onPressed: onSignUpPressed,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey.shade700,
                                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey.shade700,
                                    ),
                              ),
                              child: const Text('Sign up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Image
            Expanded(
              child: Padding(
                padding: imagePadding ?? EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: imagePadding != null ? BorderRadius.circular(imageCornerRadius ?? 16) : null,
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
