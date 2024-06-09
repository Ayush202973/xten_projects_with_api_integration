// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
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
                // margin: EdgeInsets.only(
                //     top: MediaQuery.of(context).size.height * 0.1),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Watch List',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CategoryPart(context, 'assets/images/thor.png',
                  'Thor Love & Thunder', Colors.yellow),
              const SizedBox(height: 15),
              CategoryPart(context, 'assets/images/avengers.png',
                  'Avengers: EndGame', Colors.white),
              const SizedBox(height: 15),
              CategoryPart(context, 'assets/images/enterthewild.png',
                  'Enter The Wild', Colors.yellow),
              const SizedBox(height: 15),
              CategoryPart(context, 'assets/images/disney.png', 'Star Wars',
                  Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CategoryPart(
    BuildContext context, String imagePath, String text, Color color) {
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
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 198, 209).withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(24)),
        ),
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                )
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
            )
          ],
        ),
      ),
    ],
  );
}
