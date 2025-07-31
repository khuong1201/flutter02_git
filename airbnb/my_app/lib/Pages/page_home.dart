import 'package:flutter/material.dart';
import 'package:my_app/Pages/page_detail.dart';
import 'package:my_app/models/phong_model.dart';
import 'package:my_app/utils/custom_card_detail.dart';
import 'package:my_app/utils/custom_navigabar_menu.dart';
import 'package:my_app/utils/custom_searchbar.dart';

List<Phong> mock_phong = [
  Phong(
    namePlace: 'Abiansemal, Indonesia',
    description: '1,669 kilometer',
    date: 'July 2 - 7',
    price: '\$360 night',
    images: [
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
    ],
  ),
  Phong(
    namePlace: 'The Cozy Place',
    description: '2 guests, 1 bedroom, 1 bed, 1.5 baths',
    date: 'Free cancellation for 48 hours',
    price: '\$100 per night',
    images: [
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
    ],
  ),
  Phong(
    namePlace: 'The Cozy Place',
    description: '2 guests, 1 bedroom, 1 bed, 1.5 baths',
    date: 'Free cancellation for 48 hours',
    price: '\$100 per night',
    images: [
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
    ],
  ),
  Phong(
    namePlace: 'The Cozy Place',
    description: '2 guests, 1 bedroom, 1 bed, 1.5 baths',
    date: 'Free cancellation for 48 hours',
    price: '\$100 per night',
    images: [
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
    ],
  ),
  Phong(
    namePlace: 'The Cozy Place',
    description: '2 guests, 1 bedroom, 1 bed, 1.5 baths',
    date: 'Free cancellation for 48 hours',
    price: '\$100 per night',
    images: [
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
      'assets/images/Picture1.png',
    ],
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          children: [
            Container(
              height: 69,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 16),
              child: CustomSearchBar(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: CustomNavigaBarMenu(),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: mock_phong.length,
                itemBuilder: (context, index) {
                  final phong = mock_phong[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PageDetail(phong: mock_phong[index]),
                        ),
                      );
                    },
                    child: CustomCardDetail(
                      namePlace: phong.namePlace,
                      description: phong.description,
                      date: phong.date,
                      price: phong.price,
                      images: phong.images,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
