import 'package:flutter/material.dart';

class Friend {
  final String imagePath;
  final String name;

  Friend({required this.imagePath, required this.name});
}

final List<Friend> friendList = [
  Friend(imagePath: 'assets/images/Ellipse 80.png', name: '최수빈'),
  Friend(imagePath: 'assets/images/Ellipse 244.png', name: '윤수민'),
  Friend(imagePath: 'assets/images/Ellipse 245.png', name: '신도윤'),
  Friend(imagePath: 'assets/images/Ellipse 245.png', name: '신도윤'),
  Friend(imagePath: 'assets/images/Ellipse 245.png', name: '신도윤'),
];

Widget buildFriendList() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          '또 다른 내 친구들의 취향이 궁금하다면?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            final friend = friendList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        friend.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    friend.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
