import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/models/feature_model.dart';
import 'package:my_app/models/phong_model.dart';
import 'package:my_app/models/review_model.dart';
import 'package:my_app/utils/custom_container_detail.dart';
import 'package:my_app/utils/custom_showmore_text.dart';
import 'package:my_app/utils/custome_showmore_feature.dart';

class PageDetail extends StatefulWidget {
  final Phong phong;
  const PageDetail({super.key, required this.phong});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 375,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.phong.images.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.phong.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    top: 44,
                    left: 12,
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black12, width: 2.0),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF000000),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 44,
                    right: 78,
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black12, width: 2.0),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/Download.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 44,
                    right: 16,
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black12, width: 2.0),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/Menu.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          Null;
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: (400 - (widget.phong.images.length * 12)) / 2,
                    child: Row(
                      children: List.generate(
                        widget.phong.images.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.amber
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: true,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.phong.namePlace,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 20),
                      Text(
                        '5.0・3 reviews',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Yonkers, New York, United States',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.phong.namePlace,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A0A0A),
                          ),
                        ),
                        Text(
                          '2 guests ∙ 1 bedroom ∙ 1 bed',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3D3F40),
                          ),
                        ),
                        Text(
                          '1 private bath',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3D3F40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        widget.phong.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.phong.price,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3D3F40),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD42F4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      null;
                    },
                    child: Center(
                      child: Text(
                        'Reserve',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Door.svg',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Self check-in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Check yourself in with the keypad.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Location.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Great location',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '100% of recent guests gave the location a 5-star rating.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Calendar-2.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Free cancellation before Feb 12.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: CustomExpandableTextRow(
                text:
                    'Enjoy a private and quiet bedroom and bathroom in Yonkers. '
                    'Bus and train station are only minutes away. '
                    'Train will take you to Manhattan in about 45 minutes. '
                    'Cross County Mall and many restaurants are close by. Free parking. '
                    'Fast WiFi. You have access.'
                    'Enjoy a private and quiet bedroom and bathroom in Yonkers. '
                    'Bus and train station are only minutes away. '
                    'Train will take you to Manhattan in about 45 minutes. '
                    'Cross County Mall and many restaurants are close by. Free parking. '
                    'Fast WiFi. You have access.'
                    'Enjoy a private and quiet bedroom and bathroom in Yonkers. '
                    'Bus and train station are only minutes away. '
                    'Train will take you to Manhattan in about 45 minutes. '
                    'Cross County Mall and many restaurants are close by. Free parking. '
                    'Fast WiFi. You have access.',
                charLimit: 200,
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where you’ll sleep',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 1.0),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Bed.svg',
                            height: 32,
                            width: 32,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'Bedroom',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1 queen bed',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //can set tinh linh hoat cua nhieu doi tuong
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What this place offers',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ShowMoreFeatures(features: features),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where you’ll be',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/Location.png',
                          width: double.infinity,
                          height: 218,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 12,
                            bottom: 10,
                          ),
                          child: Text(
                            'Exact location provided after booking.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF717375),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Nantes, Pays de la Loire, France',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3D3F40),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomExpandableTextRow(
                    text:
                        'This is a great place to stay in Nantes, located in the heart of the city. '
                        'You will be close to all the main attractions and have easy access to public transport.',
                    charLimit: 100,
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 20),
                      Text(
                        ' 5.0・3 reviews',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 221,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mock_review.length,
                      itemBuilder: (context, index) {
                        final review = mock_review[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CustomeContainerReview(
                            avatarUrl: review.avatarUrl,
                            userName: review.userName,
                            timeAgo: review.timeAgo.toString(),
                            comment: review.comment,
                            rating: review.rating,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      null;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: Center(
                        child: Text(
                          'Rate this room',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomContainerDetail(
              isFirstWidget: false,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hosted by Craig',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Joined in January 2020',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        '3 reviews',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3D3F40),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Verification.svg',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Identity verified',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3D3F40),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Military: US Air Force Reserves',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3D3F40)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                              TextSpan(
                                text:
                                    'Civilian: Director of Distribution Operations at a NY hospital... ',
                              ),
                              TextSpan(
                                text: 'Read more',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // xử lý mở rộng
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
