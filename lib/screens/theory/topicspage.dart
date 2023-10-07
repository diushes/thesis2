import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import '../../elements/theory/card2.dart';

class TopicsPage extends StatelessWidget {
  final MyBottomNavBar bottomNavBar;
  final dynamic category;
  const TopicsPage({
    Key? key,
    required this.bottomNavBar,
    this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topics = category['topics'];
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: MyAppBar(context: context, hasBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              category['title'],
              style: TextStyle(fontSize: 24, fontFamily: "Raleway-Regular"),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final cardHeight =
                    constraints.maxHeight * 0.2; // 10% of screen height
                return ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: cardHeight,
                      child: Card2(
                        title: topics[index]['title'],
                        onTap: () {
                          Navigator.pushNamed(context, '/topicDetail',
                              arguments: topics[index]);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
