import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xten_project/model.dart';
// ignore: unused_import
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationApi> fetchedData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 27,
              color: Colors.white,
            )),
        title: const Center(
            child: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    itemCount: fetchedData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.24,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 231, 231),
                          child: ListTile(
                            leading: const Icon(
                              Icons.notifications,
                              size: 35.0,
                              color: Colors.purple,
                            ),
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(fetchedData[index].id.toString()),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width -
                                          123, // Adjust 180 as needed
                                      child: Text(
                                        fetchedData[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  fetchedData[index].message,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                // SizedBox(height: 16.0),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    fetchedData[index].createdAt,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<NotificationApi>> getData() async {
    final response = await http
        .get(Uri.parse('https://trailerhub.itkura.com/api/notification/'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        fetchedData.add(NotificationApi.fromJson(index));
      }
      return fetchedData;
    } else {
      return fetchedData;
    }
  }
}
