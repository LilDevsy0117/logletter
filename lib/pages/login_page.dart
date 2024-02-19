import 'package:flutter/material.dart';
import 'package:logletter/components/login_textfield.dart';
import 'package:logletter/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Log Letter",
              style: TextStyle(
                fontFamily: "Blackhansans",
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "로그인",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "User name",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: usernameController,
              hintText: 'Enter your user name',
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "비밀번호를 잊어버렸나요?",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: signUserIn,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
