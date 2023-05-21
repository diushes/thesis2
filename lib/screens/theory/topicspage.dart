import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';

class TopicsPage extends StatelessWidget {
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
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/topicDetail',
                        arguments: topics[index]);
                    print('Selected topic: ${topics[index].name}');
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Image.asset(
                            topics[index].image,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 16),
                          Text(
                            topics[index].name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class Topic {
  final String name;
  final String image;
  final List<dynamic> content;

  Topic({required this.name, required this.image, required this.content});
}

List<Topic> topics = [
  Topic(
    name: 'Topic 1',
    image: 'assets/images/image1.jpg',
    content: [
      'This is some text content.And some additional text.',
    ],
  ),
  Topic(name: 'Topic 2', image: 'assets/images/image2.jpg', content: ["abc"]),
  Topic(name: 'Topic 3', image: 'assets/images/image1.jpg', content: ["abc"]),
  // Add more topics as needed
];
