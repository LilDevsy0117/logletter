import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logletter/components/login_textfield.dart';
import 'package:logletter/components/my_button.dart';
import 'package:logletter/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _userNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordConfirmed()) {
      // create user
      try {
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // add user details
        createUserDocument(userCredential);
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'name': _userNameController.text,
        'age': int.parse(_ageController.text),
      });
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      Navigator.pop(context);
      displayMessageToUser("비밀번호가 일치하지 않습니다!.", context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "logletter",
              style: TextStyle(
                fontFamily: "Blackhansans",
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: _userNameController,
              hintText: '이름',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _ageController,
              hintText: '나이',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _emailController,
              hintText: '이메일',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _passwordController,
              hintText: '비밀번호',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _confirmpasswordController,
              hintText: '비밀번호 확인',
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              buttonname: "가입하기",
              onTap: signUp,
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
                  onTap: widget.showLoginPage,
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
        ),
      )),
    );
  }
}
