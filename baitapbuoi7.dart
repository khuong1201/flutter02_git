import 'dart:io';

void main() {
  print("Chương trình");
  print("1: Quản lý sinh viên");
  print("2: Quản lý sản phẩm");
  var chuongTrinh = int.parse(stdin.readLineSync().toString());
  switch (chuongTrinh) {
    case 1:
      QuanLiSinhVien();
      break;
    case 2:
      QuanLiSanPham();
      break;
    case 3:
      exit(0);
    default:
      return;
  }
}

QuanLiSinhVien() {
  var chucNang;
  dynamic sinhVien = [
    {
      "id": 1,
      "ten": "Nguyen Van A",
      "diemToan": 8.5,
      "diemLy": 7.0,
      "diemHoa": 9.0,
      "diemTrungBinh": tinhDTB(8.5, 7.0, 9.0),
      "xepLoai": xepLoai(8.5, 7.0, 9.0),
    },
    {
      "id": 2,
      "ten": "Tran Thi B",
      "diemToan": 6.0,
      "diemLy": 5.5,
      "diemHoa": 7.0,
      "diemTrungBinh": tinhDTB(6.0, 5.5, 7.0),
      "xepLoai": xepLoai(6.0, 5.5, 7.0),
    },
    {
      "id": 3,
      "ten": "Le Van C",
      "diemToan": 9.0,
      "diemLy": 8.5,
      "diemHoa": 9.5,
      "diemTrungBinh": tinhDTB(9.0, 8.5, 9.5),
      "xepLoai": xepLoai(9.0, 8.5, 9.5),
    },
    {
      "id": 4,
      "ten": "Pham Thi D",
      "diemToan": 7.5,
      "diemLy": 6.5,
      "diemHoa": 8.0,
      "diemTrungBinh": tinhDTB(7.5, 6.5, 8.0),
      "xepLoai": xepLoai(7.5, 6.5, 8.0),
    },
    {
      "id": 5,
      "ten": "Hoang Van E",
      "diemToan": 5.0,
      "diemLy": 4.5,
      "diemHoa": 6.0,
      "diemTrungBinh": tinhDTB(5.0, 4.5, 6.0),
      "xepLoai": xepLoai(5.0, 4.5, 6.0),
    },
  ];
  do {
    print(
      "Chức năng: \n1: Thêm sinh viên\n2: Hiển thị danh sách\n3:Tìm sinh viên có điểm trung bình cao nhất",
    );
    chucNang = int.parse(stdin.readLineSync().toString());
    switch (chucNang) {
      case 1:
        var create = ThemSinhVien(sinhVien.length);
        sinhVien.add(create);
        break;
      case 2:
        hienThiDanhSachSinhVien(sinhVien, sinhVien.length);
        break;
      case 3:
        sinhVienCoDTBCaoNhat(sinhVien, sinhVien.length);
      default:
        return;
    }
  } while (chucNang == 1 || chucNang == 2 || chucNang == 3);
}

dynamic ThemSinhVien(int sinhVien) {
  stdout.write("Nhập họ tên sinh viên: ");
  var ten = stdin.readLineSync();
  stdout.write("Nhập Điểm toán của ${ten}: ");
  var diemToan = double.parse(stdin.readLineSync().toString());
  stdout.write("Nhập điểm Lý của ${ten}: ");
  var diemLy = double.parse(stdin.readLineSync().toString());
  stdout.write("Nhập điểm Hóa của ${ten}: ");
  var diemHoa = double.parse(stdin.readLineSync().toString());
  return {
    "id": sinhVien + 1,
    "ten": ten,
    "diemToan": diemToan,
    "diemLy": diemLy,
    "diemHoa": diemHoa,
    "diemTrungBinh": tinhDTB(diemToan, diemLy, diemHoa),
    "xepLoai": xepLoai(diemToan, diemLy, diemHoa),
  };
}

dynamic tinhDTB(double diemToan, double diemLy, double diemHoa) {
  return double.parse(((diemToan + diemLy + diemHoa) / 3).toStringAsFixed(2));
}

dynamic xepLoai(double diemToan, double diemLy, double diemHoa) {
  var dtb = tinhDTB(diemToan, diemLy, diemHoa);
  if (dtb > 9) {
    return "Xuất sắc";
  } else if (dtb > 7) {
    return "Giỏi";
  } else if (dtb >= 5) {
    return "Khá";
  } else {
    return "Yếu";
  }
}

dynamic hienThiDanhSachSinhVien(dynamic sinhVien, int soLuong) {
  print("Danh sách sinh viên");
  print("ID\tTên\t\tĐiểm trung bình\t\tXếp loại");
  for (int index = 0; index < soLuong; index++) {
    print(
      "${sinhVien[index]["id"]}"
      "\t"
      "${sinhVien[index]["ten"]}"
      "\t     "
      "${sinhVien[index]["diemTrungBinh"]}"
      "\t\t"
      "${sinhVien[index]["xepLoai"]}",
    );
  }
}

dynamic sinhVienCoDTBCaoNhat(dynamic sinhVien, int soLuong) {
  var maxDiem = sinhVien[0]["diemTrungBinh"];
  var danhSachSinhVien = [sinhVien[0]];

  for (int i = 1; i < soLuong; i++) {
    if (sinhVien[i]["diemTrungBinh"] > maxDiem) {
      maxDiem = sinhVien[i]["diemTrungBinh"];
      danhSachSinhVien = [sinhVien[i]];
    } else if (sinhVien[i]["diemTrungBinh"] == maxDiem) {
      danhSachSinhVien.add(sinhVien[i]);
    }
  }
  print("Sinh viên có điểm trung bình cao nhất là:");
  for (var sv in danhSachSinhVien) {
    print("Tên: ${sv["ten"]}, Điểm trung bình: ${sv["diemTrungBinh"]}");
  }
}

QuanLiSanPham() {
  var chucNang;
  dynamic sanPham = [
    {"id": 1, "ten": "Điện thoại Apple", "giaTien": 15000, "soLuongKho": 10},
    {"id": 2, "ten": "Laptop Dell", "giaTien": 25000, "soLuongKho": 5},
    {"id": 3, "ten": "Tai nghe Sony", "giaTien": 5000, "soLuongKho": 20},
    {"id": 4, "ten": "Máy ảnh Canon", "giaTien": 30000, "soLuongKho": 3},
    {"id": 5, "ten": "Đồng hồ Casio", "giaTien": 2000, "soLuongKho": 15},
  ];
  do {
    print(
      "Chức năng: \n1: Thêm sản phẩm\n2: Hiển thị danh sách sản phẩm\n3: Tìm kiếm sản phẩm theo tên\n4: Bán sản phẩm.",
    );
    chucNang = int.parse(stdin.readLineSync().toString());
    switch (chucNang) {
      case 1:
        sanPham.add(themSanPham(sanPham.length));
        break;
      case 2:
        hienThiDanhSachSanPham(sanPham, sanPham.length);
        break;
      case 3:
        timKiemSanPhamTheoTen(sanPham, sanPham.length);
        break;
      case 4:
        banSanPham(sanPham, sanPham.length);
        break;
      default:
        return;
    }
  } while (chucNang == 1 || chucNang == 2 || chucNang == 3 || chucNang == 4);
}

dynamic themSanPham(int sanPham) {
  stdout.write("Nhập tên sản phẩm: ");
  var ten = stdin.readLineSync();
  stdout.write("Nhập giá tiền của ${ten}: ");
  var giaTien = double.parse(stdin.readLineSync().toString());
  stdout.write("Nhập số lượng kho của ${ten}: ");
  var soLuongKho = double.parse(stdin.readLineSync().toString());
  return {
    "id": sanPham + 1,
    "ten": ten,
    "giaTien": giaTien,
    "soLuongKho": soLuongKho,
  };
}

dynamic hienThiDanhSachSanPham(dynamic sanPham, int soLuong) {
  print("Danh sách san pham");
  print("ID\tTên\t\t\tgiá Tiền\t\tSố lượng trong kho");
  for (int index = 0; index < soLuong; index++) {
    print(
      "${sanPham[index]["id"]}"
      "\t"
      "${sanPham[index]["ten"]}"
      "\t\t"
      "${sanPham[index]["giaTien"]}"
      "\t\t\t"
      "${sanPham[index]["soLuongKho"]}",
    );
  }
}

dynamic timKiemSanPhamTheoTen(dynamic sanPham, int soLuong) {
  stdout.write("Nhập tên sản phẩm cần tìm: ");
  var ten = stdin.readLineSync()?.toLowerCase();
  var danhSachSanPham = [];
  for (int index = 0; index < soLuong; index++) {
    if (sanPham[index]["ten"].toString().toLowerCase().contains(ten!)) {
      danhSachSanPham.add(sanPham[index]);
    }
  }
  if (danhSachSanPham.isEmpty) {
    print("Không tìm thấy sản phẩm nào");
  } else {
    hienThiDanhSachSanPham(danhSachSanPham, danhSachSanPham.length);
  }
}

dynamic banSanPham(dynamic sanPham, int soLuong) {
  stdout.write("Nhập tên sản phẩm cần bán: ");
  var ten = stdin.readLineSync()?.toLowerCase();
  stdout.write("Nhập số lượng cần bán: ");
  var soLuongBan = int.parse(stdin.readLineSync().toString());

  for (var sp in sanPham) {
    if (sp["ten"].toString().toLowerCase().contains(ten!)) {
      if (sp["soLuongKho"] >= soLuongBan) {
        sp["soLuongKho"] -= soLuongBan;
        print("Đã bán $soLuongBan sản phẩm $ten");
        return;
      } else {
        print("Không đủ số lượng trong kho");
        return;
      }
    }
  }
  print("Không tìm thấy sản phẩm $ten");
}
