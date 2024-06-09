// ignore_for_file: unnecessary_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xten_project/login_page.dart';
// ignore: unused_import
import 'package:xten_project/home_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitchedDarkMode = false;
  bool isSwitchedNotification = false;
  bool isSwitchedLanguage = false;
  bool isSwitchedAccount = false;
  bool isSwitchedApp = false;
  int myIndex = 0;
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out?'),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                const Text('Are you sure you want to log out?'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.black38),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xFF8F00FF)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _logout();
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8F00FF),
                    Color.fromARGB(255, 219, 198, 209),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.065,
                    left: MediaQuery.of(context).size.width * 0.78,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.061,
                    left: MediaQuery.of(context).size.width * 0.15,
                    child: const Text(
                      'Setting',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.12,
                    left: MediaQuery.of(context).size.width * 0.35,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/ayush.jpg'),
                      radius: 54,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.21,
                    left: MediaQuery.of(context).size.width * 0.65,
                    child: const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.pencil,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: MediaQuery.of(context).size.width * 0.29,
                    child: const Text(
                      'Ayush Poudel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  RowContext(
                    context,
                    isSwitchedDarkMode,
                    (value) {
                      setState(() {
                        isSwitchedDarkMode = value;
                      });
                    },
                    'Dark Mode',
                    Icons.dark_mode_rounded,
                  ),
                  const Divider(),
                  RowContext(
                    context,
                    isSwitchedNotification,
                    (value) {
                      setState(() {
                        isSwitchedNotification = value;
                      });
                    },
                    'Notification',
                    Icons.notifications,
                  ),
                  const Divider(),
                  RowContext(
                    context,
                    isSwitchedLanguage,
                    (value) {
                      setState(() {
                        isSwitchedLanguage = value;
                      });
                    },
                    'Language',
                    Icons.language,
                  ),
                  const Divider(),
                  RowContext(
                    context,
                    isSwitchedAccount,
                    (value) {
                      setState(() {
                        isSwitchedAccount = value;
                      });
                    },
                    'Account',
                    Icons.person,
                  ),
                  const Divider(),
                  RowContext(
                    context,
                    isSwitchedApp,
                    (value) {
                      setState(() {
                        isSwitchedApp = value;
                      });
                    },
                    'App',
                    Icons.star,
                  ),
                  const Divider(),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xFF8F00FF)),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(),
                        ),
                      ),
                      onPressed: _showLogoutDialog,
                      child: const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget RowContext(BuildContext context, bool switchValue,
    Function(bool) onChange, String text, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Transform.scale(
        scaleX: 1.1,
        scaleY: 0.8,
        child: Switch(
          activeTrackColor: const Color(0xFF8F00FF),
          inactiveTrackColor: Colors.white,
          value: switchValue,
          onChanged: onChange,
        ),
      ),
    ],
  );
}

Future<void> _logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  Get.offAll(() => const LoginPage());
}
