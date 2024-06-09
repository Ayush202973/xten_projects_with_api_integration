import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/Videos/Sci_Fi/kalki_video.dart';

class WatchListKalki extends StatefulWidget {
  const WatchListKalki({super.key});

  @override
  State<WatchListKalki> createState() => _WatchListKalkiState();
}

class _WatchListKalkiState extends State<WatchListKalki> {
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
          height: 1.12.sh,
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
                        'assets/images/SciFi/kalki.jpg',
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
                    top: 0.2.sh - 30.w,
                    left: 0.5.sw - 30.w,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KalkiVideo(),
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
                'Kalki',
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
                  '"Kalki, an intelligent police officer, is assigned to investigate the mysterious murder of Sekhar, the brother of Narsappa, who rules the Kollapuram village. He starts getting deep into the case but to his surprise, there is much more to the murder mystery. It is an action thriller film. The second half of the film is quite engaging and credit should be given to its director Prashan Varma."',
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
            'assets/images/Screenshots/kalki1.jpg',
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
            'assets/images/Screenshots/kalki2.jpg',
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
            'assets/images/Screenshots/kalki3.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
