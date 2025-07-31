import 'package:flutter/material.dart';

class CustomCardDetail extends StatefulWidget {
  final List<String> images;
  final String namePlace;
  final String description;
  final String date;
  final String price;

  const CustomCardDetail({
    super.key,
    required this.namePlace,
    required this.description,
    required this.date,
    required this.price,
    required this.images,
  });

  @override
  State<CustomCardDetail> createState() => _CustomCardDetailState();
}

class _CustomCardDetailState extends State<CustomCardDetail> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 310,
            width: 327,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final image = widget.images[index];
                    return Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: 310,
                      width: 327,
                    );
                  },
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: (327 - (widget.images.length * 12)) / 2,
                  child: Row(
                    children: List.generate(
                      widget.images.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
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
          Container(
            height: 84,
            width: 327,
            margin: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.namePlace,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A0A0A),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '4.8 (71)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0A0A0A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF717375),
                  ),
                ),
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF717375),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0A0A0A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
