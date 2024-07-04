import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcont = TextEditingController();
    forgotpassword(String email) async {
      if (email == "") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Enter your email address to reset your password",
        )));
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email sent Successfully!")));
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2b1615),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF2b1615),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Reset Password",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter your email address to reset your password",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailcont,
              style: const TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                forgotpassword(emailcont.text.toString());
              },
              child: const Text("Reset Password"),
            )
          ],
        ),
      ),
    );
  }
}
