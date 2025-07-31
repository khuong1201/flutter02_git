class ReviewModel {
  final String avatarUrl;
  final String userName;
  final String comment;
  final int rating;
  final String? timeAgo;
  ReviewModel({
    required this.avatarUrl,
    required this.userName,
    required this.comment,
    required this.rating,
    this.timeAgo,
  });

  @override
  String toString() {
    return 'ReviewModel(avatarUrl: $avatarUrl, userName: $userName, comment: $comment, rating: $rating, timeAgo: $timeAgo)';
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      avatarUrl: json['avatarUrl'] as String,
      userName: json['userName'] as String,
      comment: json['comment'] as String,
      rating: json['rating'] as int,
      timeAgo: json['timeAgo'] as String? ?? 'Just now',
    );
  }
}
List<ReviewModel> mock_review = [
  ReviewModel(
    avatarUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small_2x/default-avatar-icon-of-social-media-user-vector.jpg',
    comment:
        'Great place to stay! Very clean and well located. Highly recommend!',
    userName: 'John Doe',
    timeAgo: '2 days ago',
    rating: 5,
  ),
  ReviewModel(
    avatarUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small_2x/default-avatar-icon-of-social-media-user-vector.jpg',
    userName: 'Jane Smith',
    timeAgo: '1 week ago',
    comment: 'Very clean and comfortable. Will come back again!',
    rating: 5,
  ),
  ReviewModel(
    avatarUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small_2x/default-avatar-icon-of-social-media-user-vector.jpg',
    userName: 'Alice Johnson',
    timeAgo: '3 weeks ago',
    comment: 'Amazing experience, loved the location!',
    rating: 5,
  ),
];
