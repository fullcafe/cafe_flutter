import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  // 예제 데이터를 위해 알림 목록을 생성합니다.
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "새로운 메시지가 도착했습니다",
      "content": "잠시 후 도착할 메시지를 확인하세요.\n\n리뷰를 써주시고 포인트를 모아 다양한 혜택을 받아보세요",
      "image": "assets/images/Frame 394.png",
      "isRead": false
    },
    {
      "title": "친구 요청이 도착했습니다",
      "content": "새로운 친구 요청이 도착했습니다. 프로필을 확인하세요.",
      "image": "assets/images/Frame 394.png",
      "isRead": false
    },
    {
      "title": "이벤트 참여가 완료되었습니다",
      "content": "이벤트에 성공적으로 참여하였습니다. 결과를 확인하세요.",
      "image": "assets/images/Frame 394.png",
      "isRead": false
    },
  ];

  // 알림을 읽은 상태로 변경하는 함수
  void _markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const OnlyBackButtonAppBar(text: "알림"),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                return GestureDetector(
                  onTap: () => _markAsRead(index), // 클릭 시 알림을 읽은 상태로 변경
                  child: Container(
                    color: notification['isRead'] ? Colors.grey[300] : Colors.white, // 읽은 알림은 회색 배경
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // 아이템 정렬 수정
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.bold, // 읽지 않은 알림은 볼드 처리
                                  color: notification['isRead'] ? Colors.grey : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4), // 제목과 내용 사이의 간격
                              Text(
                                notification['content'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: notification['isRead'] ? Colors.grey : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20), // 이미지와 텍스트 사이 간격 추가
                        Image.asset(
                          notification['image'],
                          width: 99, // 이미지 너비 설정
                          height: 99,
                          fit: BoxFit.cover,// 이미지 높이 설정
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
