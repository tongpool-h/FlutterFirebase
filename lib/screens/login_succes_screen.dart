import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/my_botton.dart';

import 'login_screen.dart';

class LoginSuccessPage extends StatelessWidget {
  LoginSuccessPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  
  //sign user in method
  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    const SignInScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Shops'),
        actions: [
          IconButton(
              onPressed: signOutUser,
              icon: const Icon(
                Icons.login,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("Hello, " + user!.email.toString()),
            const SizedBox(
              height: 30,
            ),
            MyButton(onTap: signOutUser, hinText: 'Logout')
          ],
        ),
      ),
    );
  }
}
