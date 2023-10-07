import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/bottombar.dart';

class TopicDetailsPage extends StatelessWidget {
  final MyBottomNavBar bottomNavBar;
  final dynamic topic;

  const TopicDetailsPage({
    Key? key,
    required this.topic,
    required this.bottomNavBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topicDetail = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 40.0,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 90.0,
            child: Divider(color: Colors.black),
          ),
        ),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            topic["title"],
            style: TextStyle(
                color: Colors.black, fontSize: 30.0, fontFamily: "Raleway"),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/theorydetailpic.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: mainThemeColor.withOpacity(0.9)),
          child: topContentText,
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
      ],
    );

    final bottomContentText = Text(
      topic['content'],
      style: TextStyle(fontSize: 18.0, fontFamily: "Raleway"),
    );
    final readButton = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}
