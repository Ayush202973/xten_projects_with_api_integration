// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:xten_project/Videos/Actions/ironresign_video.dart';
import 'package:xten_project/Videos/Actions/landofbad_video.dart';
import 'package:xten_project/Videos/Actions/yoddhavideo.dart';
import 'package:xten_project/Videos/avengersvideo.dart';
import 'package:xten_project/Videos/enterthewild_video.dart';
import 'package:xten_project/Videos/starwarsvideo.dart';
import 'package:xten_project/Videos/thorvideo.dart';

class ActionList extends StatefulWidget {
  const ActionList({super.key});

  @override
  State<ActionList> createState() => _ActionListState();
}

class _ActionListState extends State<ActionList> {
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
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Popular Action Movies',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CategoryPart(
                context,
                'assets/images/Action/yodha.jpg',
                'Yoddha',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Yoddhavideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Action/land_of_god.jpg',
                'Land Of Bad',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LandOfBadVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/enterthewild.png',
                'Enter The Wild',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterthewildVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/disney.png',
                'Star Wars',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Starwarsvideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/avengers.png',
                'Avengers: End Game',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Avengersvideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Action/iron_ones.jpg',
                'Iron Resign',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IronResignVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/thor.png',
                'Thor: Love & Thunder',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThorVideo()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CategoryPart(
    BuildContext context, String imagePath, String text, VoidCallback onPress) {
  return Row(
    children: [
      Container(
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
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(24),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Barry Jenkins',
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  '2017',
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(
                  Colors.purpleAccent.shade100,
                ),
                shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: Colors.pink.shade100,
                    width: 2,
                  ),
                ),
                shadowColor: WidgetStateProperty.all(
                  Colors.white54,
                ),
                backgroundColor: WidgetStateProperty.all(
                  Colors.white.withOpacity(0.4),
                ),
              ),
              onPressed: onPress,
              child: const Text(
                'Watch Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.1,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
