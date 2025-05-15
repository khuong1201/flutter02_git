import 'dart:io';

void main() {
  var baitap;
  do {
    print("chon bai tap 1,2,3,4,5: ");
    baitap = int.parse(stdin.readLineSync().toString());
    switch (baitap) {
      case 1:
        var n;
        var tong = 0;
        print("nhap n: ");
        n = int.parse(stdin.readLineSync().toString());
        for (int i = 1; i <= n; i++) {
          tong += i;
        }
        print("tong tu 1 den $n: $tong");
        break;
      case 2:
        var n;
        do {
          print("nhap n: ");
          n = int.parse(stdin.readLineSync().toString());
          if (n < 1 || n >= 10) {
            print("nhap sai, nhap lai");
          }
        } while (n < 1 || n >= 10);
        for (int i = 1; i <= 10; i++) {
          print("$n x $i = ${n * i}");
        }
        break;
      case 3:
        var n;
        print("nhap n: ");
        n = int.parse(stdin.readLineSync().toString());
        var i = 1;
        var cnt = 0;
        while (i <= n) {
          if (i % 2 == 0) {
            cnt++;
          }
          i++;
        }
        print("so chan tu 1 den $n: $cnt");
        break;
      case 4:
        var n;
        print("nhap n: ");
        n = int.parse(stdin.readLineSync().toString());
        var tong = 1;
        for (int i = 2; i <= n; i++) {
          tong = tong * i;
        }
        print("$n co giai thua la: $tong");
        break;
      case 5:
        var n;
        print("nhap n: ");
        n = int.parse(stdin.readLineSync().toString());
        var soDaoNguoc = 0;
        while (n > 0) {
          int i = n % 10;
          soDaoNguoc = soDaoNguoc * 10 + i;
          n ~/= 10;
        }
        print(soDaoNguoc);
        break;
      default:
        print("khong co bai tap nay");
        break;
    }
  } while (baitap > 0 && baitap < 6);
}
