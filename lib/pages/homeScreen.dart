import 'package:assignment2_277209/User.dart';
import 'package:assignment2_277209/pages/customerScreen.dart';
import 'package:assignment2_277209/pages/loginScreen.dart';
import 'package:assignment2_277209/pages/mainMenuScreen.dart';
import 'package:assignment2_277209/pages/registrationScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Homestay Raya!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please choose the service:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              MaterialButton(
                onPressed: () {
                  _registrationForm();
                },
                color: Theme.of(context).colorScheme.primary,
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _loginForm();
                },
                color: Theme.of(context).colorScheme.primary,
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _customerProfile();
                },
                color: Theme.of(context).colorScheme.primary,
                child: const Text(
                  "Customer Profile",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        drawer: MainMenuScreen(user: widget.user),
      ),
    );
  }

  void _registrationForm() {
    Navigator.push(context,
        MaterialPageRoute(builder: (content) => const RegistrationScreen()));
  }

  void _loginForm() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => LoginScreen(user: widget.user)));
  }

  void _customerProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => CustomerScreen(user: widget.user)));
  }
}
