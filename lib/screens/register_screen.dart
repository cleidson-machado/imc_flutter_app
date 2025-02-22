import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cadastro", style: GoogleFonts.lato()),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoTextField(
                placeholder: "Nome",
                padding: EdgeInsets.all(16),
              ),
              const SizedBox(height: 16),
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
                child: const Text("Cadastrar"),
                onPressed: () {
                  // Ação de cadastro
                },
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                child: const Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
