import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import 'package:thesis2/elements/theory/card2.dart';
import '../../API/hardcoded.dart';
import '../../API/theory/api_service.dart';

class QuizzesPage extends StatefulWidget {
  final MyBottomNavBar bottomNavBar;

  QuizzesPage({Key? key, required this.bottomNavBar}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  late Future<List<dynamic>> _fetchTests;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTests = APIService.fetchTestsAndCache().then((data) {
      setState(() {
        _isLoading = false;
      });
      return data;
    });
  }

  Future<List<dynamic>> _fetchTestsByCategory(int category) {
    return APIService.fetchTestsByCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<dynamic>>(
              future: _fetchTests,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(); // Show an empty container or a placeholder
                } else if (snapshot.hasData) {
                  List<dynamic> fetchedTests = snapshot.data as List<dynamic>;
                  List<String> nonEmptyCategories = fetchedTests
                      .map((test) => test['category'].toString())
                      .toSet()
                      .toList();
                  //to fix later

                  return DefaultTabController(
                    length: nonEmptyCategories.length,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: hardCodedCategories.map((category) {
                            return Tab(text: category);
                          }).toList(),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                        ),
                        Expanded(
                          child: TabBarView(
                            children: nonEmptyCategories.map((category) {
                              int categoryId = int.parse(category);
                              return FutureBuilder<List<dynamic>>(
                                future: _fetchTestsByCategory(categoryId),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasData) {
                                    List<dynamic> tests = snapshot.data!;
                                    return LayoutBuilder(builder:
                                        (BuildContext context,
                                            BoxConstraints constraints) {
                                      return ListView.builder(
                                        itemCount: tests.length,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            height: constraints.maxHeight * 0.2,
                                            child: Card2(
                                              onTap: () {},
                                              title: tests[index]['title'],
                                            ),
                                          );
                                        },
                                      );
                                    });
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        'Error: ${snapshot.error}',
                                      ),
                                    );
                                  } else {
                                    return Container(); // Show an empty container or a placeholder
                                  }
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Container(); // Show an empty container or a placeholder
                }
              },
            ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
