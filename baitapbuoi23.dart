import 'package:flutter/material.dart';

class Baitapbuoi23 extends StatefulWidget {
  const Baitapbuoi23({super.key});

  @override
  State<Baitapbuoi23> createState() => _Baitapbuoi23State();
}

final List<Map<String, dynamic>> shoeList = [
  {
    'tenSanPham': 'Nike Air Max',
    'giaSanPham': 120.0,
    'hinhSanPham':
        'https://cdn-images.farfetch-contents.com/19/25/52/61/19255261_42657720_600.jpg',
  },
  {
    'tenSanPham': 'Adidas Ultraboost',
    'giaSanPham': 150.0,
    'hinhSanPham':
        'https://assets.adidas.com/images/w_600,f_auto,q_auto/d2a64cf9cd824e5d9fcc950b5eb0b2c8_9366/Giay_Ultraboost_5_Mau_xanh_da_troi_ID8817_HM1.jpg',
  },
  {
    'tenSanPham': 'Puma RS-X',
    'giaSanPham': 110.0,
    'hinhSanPham':
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/393772/08/sv01/fnd/VNM/fmt/png/Gi%C3%A0y-th%E1%BB%83-thao-n%E1%BB%AF-RS-X-Soft',
  },
  {
    'tenSanPham': 'New Balance 574',
    'giaSanPham': 100.0,
    'hinhSanPham':
        'https://bizweb.dktcdn.net/thumb/1024x1024/100/347/923/products/ml574evg-9.jpg',
  },
  {
    'tenSanPham': 'Converse Chuck Taylor',
    'giaSanPham': 60.0,
    'hinhSanPham':
        'https://www.converse.vn/media/catalog/product/0/8/0882-CONM9160C00011H-1.jpg',
  },
  {
    'tenSanPham': 'Vans Old Skool',
    'giaSanPham': 65.0,
    'hinhSanPham':
        'https://bizweb.dktcdn.net/100/140/774/products/vans-old-skool-black-white-vn000d3hy28-2.jpg?v=1625905148527',
  },
  {
    'tenSanPham': 'Asics Gel-Kayano 30',
    'giaSanPham': 140.0,
    'hinhSanPham':
        'https://authentic-shoes.com/wp-content/uploads/2024/05/Giay-Asics-Gel-Kayano-30-Oatmeal-1011B548-250-7.png',
  },
  {
    'tenSanPham': 'Reebok Club C 85',
    'giaSanPham': 75.0,
    'hinhSanPham':
        'https://authentic-shoes.com/wp-content/uploads/2023/04/134625_01.jpg_78f52d6f139d4f08aad84804e736293d.jpeg',
  },
  {
    'tenSanPham': 'Jordan 1 Mid',
    'giaSanPham': 130.0,
    'hinhSanPham':
        'https://bizweb.dktcdn.net/100/467/909/products/z5110816159578-d339bc64cf6b442e67fda976986150a8.jpg?v=1722763170470',
  },
  {
    'tenSanPham': 'Under Armour HOVR',
    'giaSanPham': 125.0,
    'hinhSanPham':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqR66MQR3KzJajDeFNOxv_y1_VTsHQDxjm-A&s',
  },
];
final List<Map<String, dynamic>> cartList = [];
double totalgiaSanPham = 0.0;
Future<bool> checkShoeInCart(String shoeName) async {
  for (var shoe in cartList) {
    if (shoe['tenSanPham'] == shoeName) {
      return true;
    }
  }
  return false;
}

Future<void> removeFromCart(String shoeName) async {
  for (var i = 0; i < cartList.length; i++) {
    if (cartList[i]['tenSanPham'] == shoeName) {
      totalgiaSanPham -= cartList[i]['giaSanPham'];
      cartList.removeAt(i);
      break;
    }
  }
}

Future<void> addToCard(Map<String, dynamic> shoe) async {
  if (await checkShoeInCart(shoe['tenSanPham'])) {
    for (var cartItem in cartList) {
      if (cartItem['tenSanPham'] == shoe['tenSanPham']) {
        cartItem['soLuong'] = (cartItem['soLuong'] ?? 1) + 1;
        totalgiaSanPham += shoe['giaSanPham'];
        break;
      }
    }
  } else {
    cartList.add(shoe);
    totalgiaSanPham += shoe['giaSanPham'];
  }
}

class _Baitapbuoi23State extends State<Baitapbuoi23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Shoe store',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'shopping cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 400,
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final item = cartList[index];
                  return CardInfo(
                    soLuong: item['soLuong'] ?? 1,
                    hinhSanPham: item['hinhSanPham'],
                    tenSanPham: item['tenSanPham'],
                    giaSanPham: item['giaSanPham'],
                    onUpdate: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng tiền:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$totalgiaSanPham\$',
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shoeList.length,
                itemBuilder: (context, index) {
                  return CardShoe(
                    hinhSanPham: shoeList[index]['hinhSanPham'],
                    tenSanPham: shoeList[index]['tenSanPham'],
                    giaSanPham: shoeList[index]['giaSanPham'],
                    onUpdate: () {
                      setState(() {});
                    },
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

class CardInfo extends StatefulWidget {
  final int soLuong;
  final String hinhSanPham;
  final String tenSanPham;
  final double giaSanPham;
  final VoidCallback onUpdate;
  const CardInfo({
    super.key,
    required this.soLuong,
    required this.hinhSanPham,
    required this.tenSanPham,
    required this.giaSanPham,
    required this.onUpdate,
  });

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: 100,
              width: 100,
              child: Image.network(
                widget.hinhSanPham,
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.tenSanPham,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gia tien: ${widget.giaSanPham} \$',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Số lượng: ${widget.soLuong}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                removeFromCart(widget.tenSanPham);
                widget.onUpdate();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardShoe extends StatefulWidget {
  final String tenSanPham;
  final double giaSanPham;
  final String hinhSanPham;
  final VoidCallback onUpdate;

  const CardShoe({
    super.key,
    required this.tenSanPham,
    required this.giaSanPham,
    required this.hinhSanPham,
    required this.onUpdate,
  });

  @override
  State<CardShoe> createState() => _CardShoeState();
}

class _CardShoeState extends State<CardShoe> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.hinhSanPham,
                height: 100,
                width: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                widget.tenSanPham,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${widget.giaSanPham}',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                await addToCard({
                  'tenSanPham': widget.tenSanPham,
                  'giaSanPham': widget.giaSanPham,
                  'hinhSanPham': widget.hinhSanPham,
                });
                widget.onUpdate();
              },
              child: Text(
                'thêm vào giỏ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
