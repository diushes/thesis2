import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import '../../API/theory/fake_api.dart';
import '../../elements/theory/card2.dart';

class TopicsPage extends StatelessWidget {
  final MyBottomNavBar bottomNavBar;

  const TopicsPage({Key? key, required this.bottomNavBar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: MyAppBar(
        context: context,
        drawerIcon: null,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Subject Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        title: topics[index].name,
                        onTap: () {
                          Navigator.pushNamed(context, '/topicDetail',
                              arguments: topics[index]);
                          print('Selected topic: ${topics[index].name}');
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
