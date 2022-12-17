import 'dart:convert';

import 'package:assignment2_277209/User.dart';
import 'package:assignment2_277209/config.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CustomerScreen extends StatefulWidget {
  final User user;

  const CustomerScreen({super.key, required this.user});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  late String name, email, phone;
  var regDate;
  int userid = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Screen"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Customer Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "User ID",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  //id
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "User Name",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  //name
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onChanged: (value) {
                    setState(() {
                      value = name;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "User Email",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  //email
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onChanged: (value) {
                    setState(() {
                      value = email;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "User Phone",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  //phone
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onChanged: (value) {
                    setState(() {
                      value = phone;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Date Registered",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  //date register
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onChanged: (value) {
                    setState(() {
                      value = regDate;
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }

  getInfo() async {
    var url = Uri.parse('${Config.SERVER}homestayraya_new/php/login_user.php');
    var response = await http.get(url);
    var rescode = response.statusCode;

    if (rescode == 200) {
      var jsonData = response.body;
      var parsedJson = json.decode(jsonData);

      setState(() {
        name = parsedJson['user_name'];
        email = parsedJson['user_email'];
        phone = parsedJson['user_phone'];
        userid = parsedJson['user_id'];
        regDate = parsedJson['date_reg'];
      });
    }
  }
}
