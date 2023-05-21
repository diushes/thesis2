import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/elements/bottombar.dart';
import 'package:thesis2/screens/theory/topicspage.dart';

class TopicDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Topic topic = ModalRoute.of(context)!.settings.arguments as Topic;
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                topic.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: topic.content.length,
              itemBuilder: (context, index) {
                final item = topic.content[index];
                if (item is String) {
                  // Render text
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item),
                  );
                }
                return SizedBox
                    .shrink(); // Return an empty container if the item type is unsupported
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
