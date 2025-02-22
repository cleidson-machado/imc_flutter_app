import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imc_calc_app/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Login", style: GoogleFonts.lato()),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoTextField(
                placeholder: "E-mail",
                keyboardType: TextInputType.emailAddress,
                padding: EdgeInsets.all(16),
              ),
              const SizedBox(height: 16),
              const CupertinoTextField(
                placeholder: "Senha",
                obscureText: true,
                padding: EdgeInsets.all(16),
              ),
              const SizedBox(height: 16),
              CupertinoButton.filled(
                child: const Text("Entrar"),
                onPressed: () {
                  // Ação de login
                },
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                child: const Text("Criar conta"),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
