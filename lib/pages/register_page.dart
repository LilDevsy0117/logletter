import 'package:flutter/material.dart';
import 'package:logletter/components/login_textfield.dart';
import 'package:logletter/components/my_button.dart';
import 'package:logletter/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  "회원 가입",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
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
                  "이름",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
            hintText: 'Enter your name',
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
                  "Email",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
            hintText: 'Enter your email',
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
                  "비밀번호",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
            hintText: 'Enter your Password',
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
                  "비밀번호 확인",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
            hintText: 'Confirm your Password',
            obscureText: false,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            buttonname: "가입하기",
            onTap: registerUserIn,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "이미 계정이 있으신가요?",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
