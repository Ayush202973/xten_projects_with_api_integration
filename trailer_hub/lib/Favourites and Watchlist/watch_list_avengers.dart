import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:xten_project/Videos/enterthewild_video.dart';

class WatchListAvengers extends StatefulWidget {
  const WatchListAvengers({super.key});

  @override
  State<WatchListAvengers> createState() => _WatchListAvengersState();
}

class _WatchListAvengersState extends State<WatchListAvengers> {
  bool isFavourite = false;
  List<EnterTheWildApi> fetchedData = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EnterTheWildApi>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container(
              margin: const EdgeInsets.all(100),
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            fetchedData = snapshot.data!;
            return SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fetchedData.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 0.6.sh,
                        width: double.infinity,
                        child: Image.network(
                          fetchedData[index].thumbnail,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 45, left: 25),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 145.h,
                            right: 140.w,
                            bottom: 50.h,
                            left: 142.w),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EnterthewildVideo(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 55.sp,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 376.h),
                        height: 0.9.sh,
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(90),
                                    ),
                                  ),
                                  width: 100.w,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 6.h,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  fetchedData[index].title,
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 50.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Cast:  ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 265,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        fetchedData[index].cast,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: const Text(
                                        'Director:  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      fetchedData[index].director,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: const Text(
                                        'Duration:  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${fetchedData[index].duration} hour 36 minutes ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: const Text(
                                        'Language:  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      fetchedData[index].language,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: const Text(
                                        'Release Date:  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      fetchedData[index].releaseDate.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20.w),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Synopsis',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Text(
                                        fetchedData[index].synopsis,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 13.h),
                                    screenShot(
                                        context, fetchedData[index].screenshot),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.white),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    const Color(0xFF8F00FF)),
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add_box,
                                                size: 18.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                'Add to List',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.white),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    const Color(0xFF8F00FF)),
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.local_activity,
                                                size: 18.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                'Buy Tickets',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No data found'),
            );
          }
        },
      ),
    );
  }

  Future<List<EnterTheWildApi>> getData() async {
    final response =
        await http.get(Uri.parse('https://trailerhub.itkura.com/api/trailer/'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        fetchedData.add(EnterTheWildApi.fromJson(index));
      }
      return fetchedData;
    } else {
      return fetchedData;
    }
  }
}

class EnterTheWildApi {
  int id;
  String categoryName;
  String datePosted;
  String title;
  String description;
  String thumbnail;
  String screenshot;
  double rating;
  bool isActive;
  String youtubeLink;
  DateTime releaseDate;
  int duration;
  String synopsis;
  String director;
  String cast;
  String language;
  int category;

  EnterTheWildApi({
    required this.id,
    required this.categoryName,
    required this.datePosted,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.screenshot,
    required this.rating,
    required this.isActive,
    required this.youtubeLink,
    required this.releaseDate,
    required this.duration,
    required this.synopsis,
    required this.director,
    required this.cast,
    required this.language,
    required this.category,
  });

  factory EnterTheWildApi.fromJson(Map<String, dynamic> json) =>
      EnterTheWildApi(
        id: json["id"],
        categoryName: json["category_name"],
        datePosted: json["date_posted"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        screenshot: json["screenshot"],
        rating: json["rating"],
        isActive: json["is_active"],
        youtubeLink: json["youtube_link"],
        releaseDate: DateTime.parse(json["release_date"]),
        duration: json["duration"],
        synopsis: json["synopsis"],
        director: json["director"],
        cast: json["cast"],
        language: json["language"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "date_posted": datePosted,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
        "screenshot": screenshot,
        "rating": rating,
        "is_active": isActive,
        "youtube_link": youtubeLink,
        "release_date": releaseDate.toIso8601String(),
        "duration": duration,
        "synopsis": synopsis,
        "director": director,
        "cast": cast,
        "language": language,
        "category": category,
      };
}

Widget screenShot(BuildContext context, String imagePath) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 0.32.sw,
        height: 0.15.sh,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
