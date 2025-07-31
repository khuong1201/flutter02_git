import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        children: [
          // Phần trên có đáy cong
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.green,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
            child: Column(
              children: [
                Text(
                  "Complete your\ngrocery need\neasily",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    iconColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
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

// dung chatgpt :3
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  //duong ve
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 24);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 24,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

final List<Map<String, String>> items = [
  {
    'title': 'Fruit',
    'imageUrl':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'title': 'Vegetable',
    'imageUrl':
        'https://img.freepik.com/premium-vector/easy-vegetables-drawing-cute-veggie-herbs-vector-icon-funny-cartoon-vegetable-elements-family-fru_1068407-345.jpg',
  },
  {
    'title': 'Cookies',
    'imageUrl':
        'https://static.vecteezy.com/system/resources/previews/055/229/880/non_2x/hand-drawing-of-chocolate-cookies-with-sweet-and-delicious-details-vector.jpg',
  },
  {
    'title': 'Meat',
    'imageUrl':
        'https://thumbs.dreamstime.com/b/vector-cartoon-illustration-raw-piece-meat-77412655.jpg',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.grey[100]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Your Balance",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$1,700,00",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(backgroundColor: Colors.green),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                height: 200,
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Buy Orange 10 Kg\nGet discount 25%",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "For you",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 450,
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(title: items[index]['title']!),
                        ),
                      );
                    },
                    child: CardSomething(
                      title: items[index]['title']!,
                      imageUrl: items[index]['imageUrl']!,
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

class CardSomething extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CardSomething({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(8.0),

      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Text(title),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> fruitData = [
  {'name': 'Orange', 'stock': 1000, 'price': 15},
  {'name': 'Apple', 'stock': 1000, 'price': 20},
  {'name': 'Banana', 'stock': 1000, 'price': 5},
  {'name': 'Mango', 'stock': 1000, 'price': 15},
  {'name': 'Orange', 'stock': 1000, 'price': 15},
  {'name': 'Apple', 'stock': 1000, 'price': 20},
  {'name': 'Banana', 'stock': 1000, 'price': 5},
  {'name': 'Mango', 'stock': 1000, 'price': 15},
  {'name': 'Orange', 'stock': 1000, 'price': 15},
  {'name': 'Apple', 'stock': 1000, 'price': 20},
  {'name': 'Banana', 'stock': 1000, 'price': 5},
  {'name': 'Mango', 'stock': 1000, 'price': 15},
  {'name': 'Orange', 'stock': 1000, 'price': 15},
  {'name': 'Apple', 'stock': 1000, 'price': 20},
  {'name': 'Banana', 'stock': 1000, 'price': 5},
  {'name': 'Mango', 'stock': 1000, 'price': 15},
];
final List<Map<String, dynamic>> vegetableData = [
  {'name': 'Carrot', 'stock': 500, 'price': 2},
  {'name': 'Broccoli', 'stock': 300, 'price': 3},
  {'name': 'Spinach', 'stock': 400, 'price': 1.5},
  {'name': 'Cabbage', 'stock': 250, 'price': 2.5},
  {'name': 'Tomato', 'stock': 600, 'price': 2},
  {'name': 'Carrot', 'stock': 500, 'price': 2},
  {'name': 'Broccoli', 'stock': 300, 'price': 3},
  {'name': 'Spinach', 'stock': 400, 'price': 1.5},
  {'name': 'Cabbage', 'stock': 250, 'price': 2.5},
  {'name': 'Tomato', 'stock': 600, 'price': 2},
  {'name': 'Carrot', 'stock': 500, 'price': 2},
  {'name': 'Broccoli', 'stock': 300, 'price': 3},
  {'name': 'Spinach', 'stock': 400, 'price': 1.5},
  {'name': 'Cabbage', 'stock': 250, 'price': 2.5},
  {'name': 'Tomato', 'stock': 600, 'price': 2},
];
final List<Map<String, dynamic>> meatData = [
  {'name': 'Beef', 'stock': 200, 'price': 10},
  {'name': 'Chicken', 'stock': 300, 'price': 7},
  {'name': 'Pork', 'stock': 250, 'price': 8},
  {'name': 'Duck', 'stock': 150, 'price': 9},
  {'name': 'Lamb', 'stock': 100, 'price': 12},
  {'name': 'Beef', 'stock': 200, 'price': 10},
  {'name': 'Chicken', 'stock': 300, 'price': 7},
  {'name': 'Pork', 'stock': 250, 'price': 8},
  {'name': 'Duck', 'stock': 150, 'price': 9},
  {'name': 'Lamb', 'stock': 100, 'price': 12},
  {'name': 'Beef', 'stock': 200, 'price': 10},
  {'name': 'Chicken', 'stock': 300, 'price': 7},
  {'name': 'Pork', 'stock': 250, 'price': 8},
  {'name': 'Duck', 'stock': 150, 'price': 9},
  {'name': 'Lamb', 'stock': 100, 'price': 12},
];
final List<Map<String, dynamic>> cookiesData = [
  {'name': 'Chocolate Chip', 'stock': 1000, 'price': 5},
  {'name': 'Oatmeal Raisin', 'stock': 800, 'price': 4},
  {'name': 'Butter Cookie', 'stock': 1200, 'price': 3},
  {'name': 'Sugar Cookie', 'stock': 950, 'price': 3.5},
  {'name': 'Peanut Butter', 'stock': 700, 'price': 5},
  {'name': 'Chocolate Chip', 'stock': 1000, 'price': 5},
  {'name': 'Oatmeal Raisin', 'stock': 800, 'price': 4},
  {'name': 'Butter Cookie', 'stock': 1200, 'price': 3},
  {'name': 'Sugar Cookie', 'stock': 950, 'price': 3.5},
  {'name': 'Peanut Butter', 'stock': 700, 'price': 5},
  {'name': 'Chocolate Chip', 'stock': 1000, 'price': 5},
  {'name': 'Oatmeal Raisin', 'stock': 800, 'price': 4},
  {'name': 'Butter Cookie', 'stock': 1200, 'price': 3},
  {'name': 'Sugar Cookie', 'stock': 950, 'price': 3.5},
  {'name': 'Peanut Butter', 'stock': 700, 'price': 5},
];

class DetailScreen extends StatelessWidget {
  final String title;
  const DetailScreen({super.key, required this.title});
  List<Map<String, dynamic>>? checkTitle(String title) {
    if (title == 'Fruit') return fruitData;
    if (title == 'Vegatable') return vegetableData;
    if (title == 'Meat') return meatData;
    if (title == 'Cookies') return cookiesData;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final data = checkTitle(title);
    if (data == null) {
      return const Center(child: Text('No data found'));
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: double.infinity,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '1000 ready stock',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '\$${item['price']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite_border),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<Map<String, String>> itemExplore = [
  {
    'title': 'Lamp',
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'title': 'Car',
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'title': 'Plant',
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
];

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f4e66),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 24,
          right: 24,
          bottom: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Find products easier here',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.green,
                    child: null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: itemExplore.length,
                itemBuilder: (context, index) {
                  final items = itemExplore[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CardHuge(title: items['title']!, img: items['img']!),
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

class CardHuge extends StatelessWidget {
  final String title;
  final String img;
  const CardHuge({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(img, fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF1f4e66),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> itemPage = [
  {
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
  {
    'img':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
  },
];
final List<Map<String, dynamic>> categoryItems = [
  {'icon': Icons.music_note, 'title': 'Music'},
  {'icon': Icons.apartment, 'title': 'Property'},
  {'icon': Icons.videogame_asset, 'title': 'Game'},
  {'icon': Icons.phone_android, 'title': 'Gadget'},
  {'icon': Icons.tv, 'title': 'Electronic'},
  {'icon': Icons.apartment, 'title': 'Property'}, // Property lần 2
  {'icon': Icons.videogame_asset, 'title': 'Game'}, // Game lần 2
  {'icon': Icons.book, 'title': 'Book'},
];
final List<Map<String, dynamic>> itemCardDetail = [
  {
    'title': 'Plant',
    'image':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
    'rating': '5.0',
  },
  {
    'title': 'Lamp',
    'image':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
    'rating': '5.0',
  },
  {
    'title': 'Chair',
    'image':
        'https://ih1.redbubble.net/image.2285482330.1594/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
    'rating': '5.0',
  },
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 16,
            right: 8,
            bottom: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back,', style: TextStyle(fontSize: 18)),
                      Text(
                        'Samatha William',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(Icons.shopping_cart, size: 42, color: Colors.green),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        width: 50,
                        height: 50,
                        child: Icon(Icons.tune, size: 42, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 200,
                color: Colors.blue[100],
                child: PageView.builder(
                  itemCount: itemPage.length,
                  itemBuilder: (context, index) {
                    return CardImage(img: itemPage[index]['img']!);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  itemPage.length,
                  (index) => Container(
                    margin: const EdgeInsets.all(4.0),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.orange : Colors.grey[600],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    final item = categoryItems[index];
                    return InkWell(
                      onTap: () {
                        null;
                      },
                      child: BuildButton(
                        title: item['title']!,
                        icon: Icon(item['icon']),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCardDetail.length,
                  itemBuilder: (context, index) {
                    final item = itemCardDetail[index];
                    return SizedBox(
                      height: 200,
                      child: CardDetail(
                        title: item['title'] ?? '',
                        imageUrl: item['image'] ?? '',
                        rate: item['rating'] ?? '',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String img;
  const CardImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: Image.network(img, fit: BoxFit.fill),
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final String title;
  final Icon icon;
  const BuildButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.green,
            width: 50,
            height: 50,
            child: Center(
              child: Icon(icon.icon, size: 20, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 16, color: Colors.green)),
      ],
    );
  }
}

class CardDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rate;

  const CardDetail({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 80),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.yellow, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    rate,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
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
