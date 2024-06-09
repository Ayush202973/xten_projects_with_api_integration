import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/Videos/thorvideo.dart';
import 'dart:ui';

class WatchSection extends StatefulWidget {
  const WatchSection({super.key});

  @override
  State<WatchSection> createState() => _WatchSectionState();
}

class _WatchSectionState extends State<WatchSection> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 0.6.sh,
              width: double.infinity,
              child: Image.asset(
                'assets/images/thor.png',
                fit: BoxFit.fitWidth,
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
            Container(
              margin: EdgeInsets.only(
                  top: 145.h, right: 140.w, bottom: 50.h, left: 142.w),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThorVideo()));
                  });
                },
                icon: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 55.sp,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 310.h),
              height: 0.655.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  topRight: Radius.circular(60.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  topRight: Radius.circular(60.r),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                        width: 100.w,
                        child: Divider(
                          color: Colors.white,
                          thickness: 6.h,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        '          Thor \n Love & Thunder',
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Synopsis',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Cast',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Rewards',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Twitter',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 48.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Release Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Subtitles',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Story Line',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              '"Thor: Love and Thunder" follows Thor and Jane Foster as they confront their pasts and unite against the threat of Gorr, the God Butcher. With Jane wielding the power of Mighty Thor, they must rally allies, including Valkyrie and Korg, to save the cosmos from destruction. As they face perilous challenges and unlikely alliances, they discover that the true power comes from love, friendships, and the strength to rise above their paths.',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xFF8F00FF)),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.add_box, size: 18.sp),
                                    SizedBox(width: 5.w),
                                    Text('Add to List',
                                        style: TextStyle(fontSize: 14.sp))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xFF8F00FF)),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.local_activity, size: 18.sp),
                                    SizedBox(width: 5.w),
                                    Text('Buy Tickets',
                                        style: TextStyle(fontSize: 14.sp))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
