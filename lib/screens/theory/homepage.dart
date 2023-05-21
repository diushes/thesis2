import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import 'package:thesis2/elements/drawer.dart';
import '../../API/theory/api_service.dart';
import '../../elements/theory/card1.dart';
// Import the data service file

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> categories = []; // Store the fetched categories here

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the data fetching method when the widget initializes
  }

  Future<void> fetchData() async {
    try {
      List<dynamic> fetchedCategories = await APIService.fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      // Handle error if fetching fails
      print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: MyAppBar(
        hasBackButton: false,
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
                children: categories.map((category) {
                  return Card1(
                    title: category['title'],
                    subtitle: 'subtitle',
                    image: category['image'],
                    onTap: () {
                      Navigator.pushNamed(context, '/topics');
                    },
                  );
                }).toList(),
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
