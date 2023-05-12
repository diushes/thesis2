import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import 'package:thesis2/elements/drawer.dart';
import '../elements/card1.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: MyAppBar(
        context: context,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  size: 24,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
                children: [
                  Card1(
                    title: 'Title 1',
                    subtitle: 'Subtitle 1',
                    image: 'assets/images/image1.jpg',
                    onTap: () {},
                  ),
                  Card1(
                    title: 'Title 2',
                    subtitle: 'Subtitle 2',
                    image: 'assets/images/image2.jpg',
                    onTap: () {},
                  ),
                  Card1(
                    title: 'Title 3',
                    subtitle: 'Subtitle 3',
                    image: 'assets/images/image1.jpg',
                    onTap: () {},
                  ),
                  Card1(
                    title: 'Title 4',
                    subtitle: 'Subtitle 3',
                    image: 'assets/images/image2.jpg',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
