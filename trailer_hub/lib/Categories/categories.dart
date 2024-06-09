// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/Categories/action_part.dart';
import 'package:xten_project/Categories/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:xten_project/Categories/comedy_part.dart';
import 'package:xten_project/Categories/crime_part.dart';
import 'package:xten_project/Categories/scifi_part.dart';
import 'package:xten_project/home_page.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryApi> fetchedData = [];

  void navigateToCategoryScreen(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'action':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ActionList()));
        break;
      case 'sci_fi':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ScifiList()));
        break;
      case 'crime':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const CrimeList()));
        break;
      case 'comedy':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Comedylist()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(
      context,
      designSize:
          const Size(360, 690), // Adjust the design size to match your layout
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.023),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePageScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28.h,
                          ),
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.h,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fetchedData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: CategoryPart(
                                    context,
                                    fetchedData[index].image,
                                    fetchedData[index].name, () {
                                  navigateToCategoryScreen(
                                      fetchedData[index].name);
                                }),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      },
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

  Future<List<CategoryApi>> getData() async {
    final response = await http.get(
      Uri.parse('https://trailerhub.itkura.com/api/category/'),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        fetchedData.add(CategoryApi.fromJson(index));
      }
      return fetchedData;
    } else {
      return fetchedData;
    }
  }
}

Widget CategoryPart(
    BuildContext context, String imagePath, String text, VoidCallback onTap) {
  return Row(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 219, 198, 209).withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(24)),
          ),
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ],
  );
}
