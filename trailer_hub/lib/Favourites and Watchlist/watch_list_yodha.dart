import 'package:flutter/material.dart';
import 'package:xten_project/Videos/Actions/yoddhavideo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchListYoddhaWars extends StatefulWidget {
  const WatchListYoddhaWars({super.key});

  @override
  State<WatchListYoddhaWars> createState() => _WatchListYoddhaWarsState();
}

class _WatchListYoddhaWarsState extends State<WatchListYoddhaWars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 201, 124, 236),
                Color.fromARGB(255, 228, 206, 217),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          height: 1.1.sh,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(178),
                        bottomRight: Radius.circular(178),
                      ),
                    ),
                    height: 0.41.sh,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(178),
                        bottomRight: Radius.circular(178),
                      ),
                      child: Image.asset(
                        'assets/images/Action/yodha.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 45, left: 25),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 35,
                    ),
                  ),
                  Positioned(
                    top: 0.205.sh - 30.w, // Center the play button
                    left: 0.5.sw - 30.w, // Center the play button
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Yoddhavideo(),
                            ),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Text(
                          'Watch List',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: const Text(
                          'Download',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                'Yoddha',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
              ),
              const Text('Movie'),
              Container(
                margin: EdgeInsets.only(left: 0.2.sw),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                'Barry Jenkins',
                style: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.only(left: 0.01.sh),
                child: Text(
                  '"When a group of terrorists hijack a passenger plane, an off-duty soldier crafts a plan to thwart the hijackers and safeguard the passengers survival despite the engines failure."',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 0.03.sw),
                child: const Text(
                  'Screenshots',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 8.h),
              screenShot(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget screenShot(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.asset(
            'assets/images/Screenshots/yodha1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.asset(
            'assets/images/Screenshots/yodha2.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.asset(
            'assets/images/Screenshots/yodha3.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
