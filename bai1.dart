
void main() {
  // Hệ số của phương trình bậc 2
  var a = 10;
  var b = 12;
  var c = 23;
  var h = 5;
  var chuViHinhTamGiac = a + b + c;
  var DienTichHinhTamGiac = (a * h) / 2;

  print("chu vi hinh tam giac a = $a, b = $b, c = $c: ${chuViHinhTamGiac}");
  print("dien tich hinh tam giac a = $a, b = $b, c = $c, h= $h: $DienTichHinhTamGiac");

  var chuViHinhChuNhat = (a + b) * 2;
  var dienTichHinhChuNhat = a * b;

  print("chu vi hinh chu nhat a = $a, b = $b, la $chuViHinhChuNhat");
  print("duen tich hinh chu nhat la $dienTichHinhChuNhat");
  // Kiểm tra nếu a == 0
  if (a == 0) {
    print("Đây không phải là phương trình vo nghiem.");
    return;
  }
  print("phuong trinh co nghiem x = ${-b / a}");
}
