import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> decodedData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse("https://mysaving.in/WonderMaths/api/myaddresssample.php"));

    if (response.statusCode == 200) {
      setState(() {
        decodedData = json.decode(response.body);
      });
    } else {
      print("Api fetching failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('J2 Infotech Task'),
      ),
      body: ListView.builder(
        itemCount: decodedData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 109, 227, 94),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    decodedData[index]["name"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Age of ${decodedData[index]["name"]} : ${decodedData[index]["age"]} ",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address of ${decodedData[index]["name"]} : ${decodedData[index]["address"]} ",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
