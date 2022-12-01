import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),
        onPressed: onPressed,
        // padding: EdgeInsets.all(12),
        // color: Colors.lightBlueAccent,
        child:
            const Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
      ),
    );
    ;
  }
}
