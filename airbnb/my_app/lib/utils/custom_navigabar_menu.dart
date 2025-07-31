import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, String>> customListBar = [
  {'title': 'OMG!', 'img': 'assets/icons/U.F.O..svg'},
  {'title': 'Beach', 'img': 'assets/icons/Beach.svg'},
  {'title': 'Amazing Pools', 'img': 'assets/icons/Pool.svg'},
  {'title': 'Islands', 'img': 'assets/icons/Island.svg'},
  {'title': 'Arctic', 'img': 'assets/icons/Arctic.svg'},
];

class CustomNavigaBarMenu extends StatefulWidget {
  const CustomNavigaBarMenu({super.key});

  @override
  State<CustomNavigaBarMenu> createState() => _CustomListBarState();
}

class _CustomListBarState extends State<CustomNavigaBarMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF7F7F7), width: 1.0),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: customListBar.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CardBar(
                title: customListBar[index]['title'],
                img: customListBar[index]['img'],
                isSelected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardBar extends StatelessWidget {
  final String? title;
  final String? img;
  final bool isSelected;

  const CardBar({super.key, this.title, this.img, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img ?? 'assets/icons/Filter.svg',
            fit: BoxFit.contain,
            height: 24,
            width: 24,
            color: isSelected ? Color(0xFF0A0A0A) : Color(0xFF717375),
          ),
          SizedBox(height: 4),
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Color(0xFF0A0A0A) : Color(0xFF717375),
            ),
          ),
        ],
      ),
    );
  }
}
