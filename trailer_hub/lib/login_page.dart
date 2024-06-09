// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xten_project/home_page.dart';
import 'package:xten_project/register_page.dart';
import 'dart:convert';
import 'package:xten_project/Connectivity/network_controller.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final networkController = Get.put(NetworkController());

  bool isChecked = false;
  bool isObsecure = true;
  final emailrReGex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[a-z]{2,})$');
  var email_Controller = TextEditingController();
  var password_Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map<String, String>? userData;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      final email = email_Controller.text;
      final password = password_Controller.text;

      try {
        final url = Uri.parse('https://trailerhub.itkura.com/api/login/');
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          // Authentication successful, navigate to home screen
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          Get.off(() => const HomePageScreen());
        } else {
          // Authentication failed, show error message
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: const Text('Incorrect email or password'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        // Handle any errors that occur during the API call
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
            padding: EdgeInsets.only(top: 0.05.sh),
            height: 1.09.sh,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF8F00FF), Color(0xFFFFB4DC)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40.sp,
                            backgroundImage:
                                const AssetImage('assets/images/logo.png'),
                          ),
                          SizedBox(width: 10.sp),
                        ],
                      ),
                      Text(
                        ' Hello, \n Welcome !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Container(
                    height: 0.41.sh,
                    width: 0.93.sw,
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.08.sw, vertical: 20.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38.withOpacity(0.2),
                          offset: const Offset(6, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 28),
                        TextFormField(
                          controller: email_Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            } else if (!emailrReGex.hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Username/Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide: const BorderSide(
                                  color: Colors.purple, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: password_Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Required';
                            } else if (value.length <= 7) {
                              return 'Password length must be greater than 7';
                            } else {
                              return null;
                            }
                          },
                          obscureText: isObsecure,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecure = !isObsecure;
                                });
                              },
                              icon: isObsecure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide: const BorderSide(
                                  color: Colors.purple, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            const Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 0.08.sh,
                  width: 0.8.sw,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all<Color>(
                        Colors.white.withOpacity(0.3),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color(0xFF8F00FF),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const RegisterPage());
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register(String name, String location, String phone,
      String email, String password, String confirmPassword) async {
    final url = Uri.parse('https://trailerhub.itkura.com/api/register/');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'full_name': name,
        'location': location,
        'phone': phone,
        'email': email,
        'password': password,
        'password_confirm': confirmPassword,
      }),
    );

    if (response.statusCode == 201) {
      print('Registration successful: ${response.body}');
    } else {
      print('Response body: ${response.body}');
    }
  }
}
