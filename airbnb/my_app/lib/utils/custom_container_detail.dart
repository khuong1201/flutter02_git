import 'package:flutter/material.dart';

class CustomContainerDetail extends StatelessWidget {
  final Widget widget;
  final bool isFirstWidget;
  const CustomContainerDetail({
    super.key,
    required this.widget,
    required this.isFirstWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Container(
        padding: EdgeInsets.only(top: isFirstWidget ? 24 : 0, bottom: 24),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 2.0)),
        ),
        child: widget,
      ),
    );
  }
}

class CustomeContainerReview extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String timeAgo;
  final String comment;
  final int rating;
  const CustomeContainerReview({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.timeAgo,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 297,
      height: 211,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: Image.network(
                    avatarUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ).image,
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(
                rating,
                (index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              comment,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
