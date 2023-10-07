import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import '../../API/theory/api_service.dart';
import '../../elements/theory/card1.dart';
import '../../controllers/theme_provider.dart';

class MyHomePage extends StatefulWidget {
  final MyBottomNavBar bottomNavBar; // Define the required argument

  const MyHomePage({
    Key? key,
    required this.bottomNavBar, // Mark the argument as required
  }) : super(key: key);

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

  Future<void> _refreshData() async {
    await fetchData(); // Fetch data when the user pulls down to refresh
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.getCurrentTheme().backgroundColor,
      appBar: MyAppBar(context: context),
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
              child: RefreshIndicator(
                onRefresh: _refreshData, // Pull-to-refresh callback
                child: GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  children: categories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    return Card1(
                      title: category['title'],
                      subtitle: "${category['topics'].length} topics",
                      image: "assets/images/pic${index}.jpg",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/topics',
                          arguments: category,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
