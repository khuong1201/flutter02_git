import 'dart:io';

void main() {
  print("Chương trình");
  print("Quản lý hóa đơn bán hàng");
  var dungCT = 1;
  List<Map<String, dynamic>> listSanPham = [];
  while (dungCT == 1) {
    print("1: thêm sản phẩm vào giỏ hàng ");
    print("2: sửa, xóa sản phẩm trong giỏ hàng");
    print("3: hiển thị giỏ hàng");
    print("4: tính tổng hóa đơn giỏ hàng");
    print("=============================");
    var chucNang = int.parse(stdin.readLineSync().toString());
    switch (chucNang) {
      case 1:
        listSanPham.add(ThemSanPham());
        break;
      case 2:
        stdout.write("Nhập tên sản phẩm cần sửa: ");
        var tenSanPham = stdin.readLineSync();
        if (listSanPham.any((sp) => sp['ten'] == tenSanPham)) {
          var index = listSanPham.indexWhere((sp) => sp['ten'] == tenSanPham);
          listSanPham[index] = SXSanPham(tenSanPham!);
        } else {
          print("Sản phẩm không tồn tại trong giỏ hàng.");
        }
        break;
      case 3:
        if (listSanPham.isEmpty) {
          print("Giỏ hàng trống.");
        } else {
          HienThiGioHang(listSanPham);
        }
        break;
      case 4:
        if (listSanPham.isEmpty) {
          print("Giỏ hàng trống, không có hóa đơn.");
        } else {
          TongHoaDonGioHang(listSanPham);
        }
        break;
      default:
        dungCT = 0;
        break;
    }
  }
}

ThemSanPham() {
  stdout.write("Nhập tên sản phẩm: ");
  var tenSanPham = stdin.readLineSync();
  stdout.write("Nhập giá sản phẩm: ");
  var giaSanPham = double.parse(stdin.readLineSync().toString());
  stdout.write("Nhập số lượng sản phẩm: ");
  var soLuongSanPham = int.parse(stdin.readLineSync().toString());
  return {"ten": tenSanPham, "gia": giaSanPham, "soLuong": soLuongSanPham};
}

SXSanPham(String tenSanPham) {
  stdout.write("sửa tên sản phẩm: ");
  var suaTenSanPham = stdin.readLineSync();
  stdout.write("sửa giá sản phẩm: ");
  var suaGiaSanPham = double.parse(stdin.readLineSync().toString());
  stdout.write("sửa số lượng sản phẩm: ");
  var suaSoLuongSanPham = int.parse(stdin.readLineSync().toString());
  return {
    "ten": suaTenSanPham,
    "gia": suaGiaSanPham,
    "soLuong": suaSoLuongSanPham,
  };
}
HienThiGioHang(List listSanPham){
  print("Danh sách sản phẩm trong giỏ hàng:");
  print("Tên sản phẩm\tGiá\t\tSố lượng");
  for (var sp in listSanPham) {
    print("${sp['ten']}\t\t${sp['gia']}\t\t${sp['soLuong']}");
  }
}
TongHoaDonGioHang(List listSanPham) {
  double tong = 0;
  for (var sp in listSanPham) {
    tong += sp['gia'] * sp['soLuong'];
  }
  print("Tổng hóa đơn giỏ hàng: $tong");
}