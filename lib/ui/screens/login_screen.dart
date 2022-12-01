import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/authentication_cubit.dart';
import '../../cubit/authentication_state.dart';
import '../widgets/login_screen/email_text.dart';
import '../widgets/login_screen/login_button.dart';
import '../widgets/login_screen/login_logo.dart';
import '../widgets/login_screen/password_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String tag = 'login-page';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _performLogin() {
    context.read<AuthenticationCubit>().login(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    // blocB

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(builder: (context, state) {
      const logo = LoginLogo();
      final email = EmailText(controller: _emailController);
      final password = PasswordText(
        controller: _passwordController,
      );

      final loginButton = LoginButton(onPressed: _performLogin);

      final forgotLabel = TextButton(
        child: const Text(
          '¿Olvidó su Contraseña?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
      );

      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              const SizedBox(height: 48.0),
              email,
              const SizedBox(height: 8.0),
              password,
              const SizedBox(height: 24.0),
              if (state is AuthenticationFailure)
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                )
              else
                Container(),
              loginButton,
              forgotLabel
            ],
          ),
        ),
      );
    });
  }
}
