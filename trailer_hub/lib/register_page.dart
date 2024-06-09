// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/login_page.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var password_confirm = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var name = TextEditingController();
  var location = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), // Use .r for responsive radius
            topRight: Radius.circular(20.r),
          ),
          child: Container(
            height: 1.3.sh, // Use .sh for responsive height
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8F00FF), Color(0xFFFFB4DC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 45.h, left: 30.w, right: 30.w),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/logo.png'),
                      radius: 30.r, // Use .r for responsive radius
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24.sp), // Use .sp for responsive size
                      ),
                      Text(
                        'Welcome Back !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                30.sp), // Use .sp for responsive font size
                      ),
                      SizedBox(height: 50.h), // Use .h for responsive height
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.r)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38.withOpacity(0.2),
                          offset: Offset(
                              6.w, 8.h), // Use .w and .h for responsive offsets
                        ),
                      ],
                    ),
                    height: 0.75.sh, // Use .sh for responsive height
                    width: 0.92.sw, // Use .sw for responsive width
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                prefixIcon: Icon(Icons.person,
                                    size: 24
                                        .sp), // Use .sp for responsive icon size
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width:
                                          1.w), // Use .w for responsive width
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: location,
                              validator: (value) {
                                if (location.text.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Address',
                                prefixIcon:
                                    Icon(Icons.location_on, size: 24.sp),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (value.length != 10) {
                                  return 'Invalid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                prefixIcon: Icon(Icons.phone, size: 24.sp),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (!emailRegex.hasMatch(value)) {
                                  return 'Invalid E-mail';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'UserName/Email',
                                prefixIcon: Icon(Icons.email, size: 24.sp),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password Required';
                                } else if (value.length < 7) {
                                  return 'Password length must be greater than 7';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: isObsecure,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock, size: 24.sp),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                  icon: isObsecure
                                      ? Icon(Icons.visibility_off, size: 24.sp)
                                      : Icon(Icons.visibility, size: 24.sp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Container(
                            height: 0.09.sh,
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              controller: password_confirm,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password Required';
                                } else if (value != password.text) {
                                  return 'Password Does not Match';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: isObsecure,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock, size: 24.sp),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                  icon: isObsecure
                                      ? Icon(Icons.visibility_off, size: 24.sp)
                                      : Icon(Icons.visibility, size: 24.sp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.r),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.w),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 27.h),
                  SizedBox(
                    width: 0.69.sw, // Use .sw for responsive width
                    height: 0.057.sh, // Use .sh for responsive height
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all<Color>(
                          Colors.white.withOpacity(0.3),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFF8F00FF),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await register(name.text, location.text, phone.text,
                              email.text, password.text, password_confirm.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                'Account registered',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Please fix the errors in the form',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                20.sp), // Use .sp for responsive font size
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'By creating an account you are agreeing to comply with the ',
                          style: TextStyle(
                              fontSize:
                                  14.sp), // Use .sp for responsive font size
                        ),
                        TextSpan(
                          text: 'terms and conditions',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: ' & ',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        TextSpan(
                          text: 'privacy policies',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Already a Member?',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(1.5.w,
                                1.5.h), // Use .w and .h for responsive offsets
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
