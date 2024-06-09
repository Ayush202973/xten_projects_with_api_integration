import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xten_project/Categories/categories.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/favourites.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_avengers.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_enterthewild.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_starwars.dart';
import 'package:xten_project/Videos/avengersvideo.dart';
import 'package:xten_project/Videos/enterthewild_video.dart';
import 'package:xten_project/Videos/starwarsvideo.dart';
import 'package:xten_project/custom_notification.dart';
import 'package:xten_project/drawer.dart';
import 'package:xten_project/profile.dart';
import 'package:xten_project/homepage_watchnow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePageScreen(),
        );
      },
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int myIndex = 0;
  final List<Widget> barIndex = [
    const HomeContent(),
    const FavouriteList(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications)),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF8F00FF),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 238, 232, 235),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.purple, size: 28),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Star',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: 'Square',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
      ),
      body: barIndex[myIndex],
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.12,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8F00FF),
                  Color.fromARGB(255, 219, 198, 209),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryButton('Featured'),
                      categoryButton('Drama'),
                      categoryButton('Action'),
                      categoryButton('Comedy'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15.w),
                  child: const Text(
                    'Trending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Stack(
                  children: [
                    SizedBox(
                      height: 0.34.sh,
                      width: 1.sw,
                      child: Image.asset(
                        'assets/images/thor.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.24.sh,
                        left: 0.55.sw,
                        right: 0.1.sw,
                      ),
                      child: ElevatedButton(
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WatchSection(),
                            ),
                          );
                        },
                        child: const Text(
                          'Watch Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: const Text(
                        'For You',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Container(
                    //   margin: EdgeInsets.only(right: 15.w),
                    //   child: Row(
                    //     children: [
                    //       // const Text(
                    //       //   'View More',
                    //       //   style: TextStyle(
                    //       //     fontSize: 18,
                    //       //     fontWeight: FontWeight.w400,
                    //       //   ),
                    //       // ),
                    //       IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //           Icons.keyboard_double_arrow_right,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      forYou(context, 'assets/images/enterthewild.png',
                          'Enter The Wild', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EnterthewildVideo()));
                      }, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WatchListEnterTheWild()));
                      }),
                      forYou(context, 'assets/images/avengers.png', 'Avengers',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Avengersvideo()));
                      }, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WatchListAvengers()));
                      }),
                      forYou(context, 'assets/images/disney.png', 'Star Wars',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Starwarsvideo()));
                      }, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WatchListStarWars()));
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.black45],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 0.6.sh,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 216, 95, 95),
                  Color.fromARGB(0, 78, 64, 64),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15.w, top: 15.h),
                  child: const Text(
                    'Popular This Week',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      popular(context, 'assets/images/avengers.png', 'Avengers',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Avengersvideo()));
                      }),
                      popular(context, 'assets/images/disney.png', 'Disney',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Starwarsvideo()));
                      }),
                      popular(context, 'assets/images/enterthewild.png',
                          'Enter The Wild', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EnterthewildVideo()));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget categoryButton(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.deepPurple),
        backgroundColor: WidgetStateProperty.all(Colors.pink.shade100),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget popular(
    BuildContext context, String imagePath, String text, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 0.46.sh,
      width: 0.7.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 225, 199, 230),
            Colors.lightBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '4.8',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          const Center(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              style: TextStyle(color: Colors.white, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 130.w,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: onTap,
                child: const Text('Play')),
          )
        ],
      ),
    ),
  );
}

Widget forYou(BuildContext context, String imagePath, String text,
    VoidCallback onTap, VoidCallback onTap2) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 8, top: 70),
        height: 0.28.sh,
        width: 140.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color(0xFF8F00FF),
              Color(0xFFFFB4DC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(onPressed: onTap, child: const Text('Play'))
            ],
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 40, left: 45),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: InkWell(
            onTap: onTap2,
            child: Image.asset(
              imagePath,
              height: 0.09.sh,
              width: 65.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
