class Topic {
  final String name;
  final String image;
  final List<dynamic> content;

  Topic({required this.name, required this.image, required this.content});
}

List<Topic> topics = [
  Topic(
    name: 'Triangles',
    image: 'assets/images/math.jpg',
    content: [
      'This is some text content.And some additional text.',
    ],
  ),
  Topic(name: 'Equations', image: 'assets/images/math.jpg', content: ["abc"]),
  Topic(
      name: 'Possibility theory',
      image: 'assets/images/math.jpg',
      content: ["abc"]),
  // Add more topics as needed
];
