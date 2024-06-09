import 'package:flutter/material.dart';
import 'package:xten_project/model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationApi> fetchedData = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          backgroundColor: Colors.purple,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FittedBox(
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    title: Column(
                      children: [
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Notification Title',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry!",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '11/Feb/2021 04:42 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    title: Column(
                      children: [
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Notification Title',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry!",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '11/Feb/2021 04:42 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    title: Column(
                      children: [
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Notification Title',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry!",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '11/Feb/2021 04:42 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    title: Column(
                      children: [
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Notification Title',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry!",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '11/Feb/2021 04:42 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    title: Column(
                      children: [
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Notification Title',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry!",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '11/Feb/2021 04:42 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
