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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log",
                style: TextStyle(
                  fontFamily: "Blackhansans",
                  fontSize: 40,
                ),
              ),
              Text(
                "Letter",
                style: TextStyle(
                  fontFamily: "Blackhansans",
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ));
  }
}
