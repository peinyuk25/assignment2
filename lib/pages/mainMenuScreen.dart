import 'package:assignment2_277209/User.dart';
import 'package:assignment2_277209/pages/customerScreen.dart';
import 'package:assignment2_277209/pages/homeScreen.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  final User user;
  const MainMenuScreen({super.key, required this.user});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.user.email.toString()),
            accountEmail: Text(widget.user.name.toString()),
            currentAccountPicture: const CircleAvatar(radius: 25.0),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => HomeScreen(user: widget.user)));
              //  Navigator.push(
              //    context,
              // enterExitRoute(
              //   exitPage: MainScreen(), enterPage: MainScreen()));
            },
          ),
          ListTile(
            title: const Text('Customer Screen'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => CustomerScreen(user: widget.user)));
              //  Navigator.push(
              //    context,
              // enterExitRoute(
              //   exitPage: MainScreen(), enterPage: MainScreen()));
            },
          ),
        ],
      ),
    );
  }
}
