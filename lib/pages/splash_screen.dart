import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logletter/auth/main_page.dart';

class LoadingLogin extends StatefulWidget {
  const LoadingLogin({
    super.key,
  });

  @override
  State<LoadingLogin> createState() => _LoadingLoginState();
}

class _LoadingLoginState extends State<LoadingLogin> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const Text(
                "Log Letter",
                style: TextStyle(
                  fontFamily: "Blackhansans",
                  fontSize: 40,
                  color: Color.fromARGB(255, 91, 102, 202),
                ),
              ),
              const Text(
                "감정을 쓰고 나누는, 익명의 일기 앱",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
