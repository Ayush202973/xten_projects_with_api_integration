// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_starwars.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_thor.dart';
import 'package:xten_project/Videos/avengersvideo.dart';
import 'package:xten_project/home_page.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePageScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28.h,
                      ),
                    ),
                    Text(
                      'Favourites List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.h,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CategoryPart(
                context,
                'assets/images/thor.png',
                'Thor Love & Thunder',
                Colors.yellow,
                () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WatchListThor()));
                  });
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(context, 'assets/images/avengers.png',
                  'Avengers: EndGame', Colors.white, () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Avengersvideo()));
                });
              }),
              // const SizedBox(height: 15),
              // CategoryPart(context, 'assets/images/enterthewild.png',
              //     'Enter The Wild', Colors.yellow, () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const WatchListEnterTheWild()));
              // }),
              const SizedBox(height: 15),
              CategoryPart(context, 'assets/images/disney.png', 'Star Wars',
                  Colors.yellow, () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WatchListStarWars()));
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CategoryPart(BuildContext context, String imagePath, String text,
    Color color, VoidCallback onTap) {
  return Row(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset(
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
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: color,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Barry Jenkins',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text('2017'),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
