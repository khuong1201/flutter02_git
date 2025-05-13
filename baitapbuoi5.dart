import 'dart:io';

void main() {
  var hello;
  do {
    print("nhap 1 or 2 de chon bai tap: ");
    hello = int.parse(stdin.readLineSync().toString());
    switch (hello) {
      case 1:
        {
          print("nhap ho ten: ");
          var name = stdin.readLineSync();
          print("nhao so gio lam viec: ");
          var hourWork = double.parse(stdin.readLineSync().toString());
          print("nhap luong moi gio: ");
          var salaryOfHour = double.parse(stdin.readLineSync().toString());
          var salary = hourWork * salaryOfHour;
          if (hourWork > 40) {
            salary = salary + salary * (20 / 100);
          }
          var tax;
          if (salary > 10000000) {
            tax = salary * (10 / 100);
          } else if (salary > 7000000) {
            tax = salary * (5 / 100);
          } else {
            tax = 0;
          }
          var lastSalary = salary - tax;
          print("ho ten: $name");
          print("tong luong truoc thue: $salary");
          print("thue thu nhap: $tax");
          print("luong thuc lanh : $lastSalary");
          break;
        }
      case 2:
        {
          print("nhap ten san pham: ");
          var nameProduct = stdin.readLineSync();
          print("nhap so luong: ");
          var quantity = int.parse(stdin.readLineSync().toString());
          print("nhap gia san pham: ");
          var price = double.parse(stdin.readLineSync().toString());
          var totalPrice = quantity * price;
          var discount;
          if (totalPrice >= 1000000) {
            discount = totalPrice * (10 / 100);
          } else if (totalPrice >= 500000) {
            discount = totalPrice * (5 / 100);
          } else {
            discount = 0;
          }
          const VAT = 0.08;
          var lastTotalPrice = totalPrice - discount - (totalPrice * VAT);
          print(
            "$nameProduct"
            "\n"
            "so luong: $quantity"
            "\n"
            "gia san pham: $price",
          );
          print(
            "thanh tien: $totalPrice"
            "\n"
            "giam gia: $discount"
            "\n"
            "thue VAT: $VAT"
            "\n"
            "tong thanh toan cuoi cung : $lastTotalPrice",
          );
        }
      default:
        return;
    }
  } while (hello == 1 || hello == 2);
}
