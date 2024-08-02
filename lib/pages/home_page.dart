// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_import, use_key_in_widget_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:robosoc/screens/profile_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:robosoc/utilities/component_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenHeight = 0;

  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi!",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    child: Container(
                      height: screenHeight / 8,
                      width: screenWidth / 6,
                      child: Image.asset("assets/images/defaultPerson.png"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Component',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<ComponentProvider>(
                  builder: (context, componentProvider, child) {
                return GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: componentProvider.components.length,
                  itemBuilder: (context, index) {
                    final component = componentProvider.components[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/arduino.png', height: 80),
                          SizedBox(height: 8),
                          //Component Name
                          Text(
                            component.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,),
                          ),
                          //Quantity
                          Text(
                            '${component.quantity}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromARGB(255, 189, 0, 196),
                            ),
                          ),
                          //Description
                          Text(
                            component.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 224, 75, 11),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
