import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/controllers/question_vm.dart';
import 'package:thesis2/elements/theory/card2.dart';
import 'package:thesis2/screens/quizzes/quizzpage.dart';
import '../../elements/bottombar.dart';

class QuizzesPage extends StatefulWidget {
  final MyBottomNavBar bottomNavBar;

  const QuizzesPage({Key? key, required this.bottomNavBar}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  late Future<void> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = Future<void>.delayed(Duration(milliseconds: 50), () async {
      await context.read<TestVM>().getTests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final testVM = context.read<TestVM>();
    final categoryTests = testVM.categoryTests;
    return Scaffold(
      body: FutureBuilder<void>(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Customize as needed
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/educationpic.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: categoryTests.length,
                          child: Column(
                            children: [
                              TabBar(
                                tabs: categoryTests.entries.map((entry) {
                                  final categoryTitle = entry.key;
                                  return Tab(
                                    child: Text(
                                      categoryTitle!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Raleway-Regular"),
                                    ),
                                  );
                                }).toList(),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                indicator: BoxDecoration(
                                  color:
                                      mainThemeColor, // Set your desired color here
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color:
                                      mainThemeColor, // Set your desired background color here
                                  child: TabBarView(
                                    children:
                                        categoryTests.entries.map((entry) {
                                      final amount = entry.value.length;
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                          itemCount:
                                              amount, // Replace with the desired number of items
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              height: 100.0,
                                              child: Card2(
                                                cardColor: mainThemeColor
                                                    .withOpacity(0.8),
                                                title: 'Test ${index + 1}',
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          QuizPage(
                                                        testId: index,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
