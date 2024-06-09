// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:xten_project/Videos/Crime/cult_killer_video.dart';
import 'package:xten_project/Videos/Crime/lift_video.dart';
import 'package:xten_project/Videos/Crime/mirza_video.dart';
import 'package:xten_project/Videos/Crime/pursuit_video.dart';
import 'package:xten_project/Videos/Crime/sleepingdogs_video.dart';
import 'package:xten_project/Videos/Crime/thepainter_video.dart';
import 'package:xten_project/Videos/starwarsvideo.dart';

class CrimeList extends StatefulWidget {
  const CrimeList({super.key});

  @override
  State<CrimeList> createState() => _CrimeListState();
}

class _CrimeListState extends State<CrimeList> {
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
                      'Popular Crime Movies',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CategoryPart(
                context,
                'assets/images/Crime/cult_killer.jpg',
                'Cult Killer',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CultKillerVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Crime/lift.jpg',
                'Lift',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LiftVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Crime/mirza.jpg',
                'Mirza',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MirzaVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Crime/pursuit.jpg',
                'Pursuit',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PursuitVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Crime/sleeping_dogs.jpg',
                'Sleeping Dogs',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SleepingDogsVideo()),
                  );
                },
              ),
              const SizedBox(height: 15),
              CategoryPart(
                context,
                'assets/images/Crime/the_painter.jpg',
                'The Painter',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThePainterVideo()),
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
