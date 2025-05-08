import 'dart:io';

void main() {
  // var num1 = int.parse(stdin.readLineSync().toString());
  // var num2 = int.parse(stdin.readLineSync().toString());
  // if (num1 == num2) {
  //   print("a bang b");
  // } else {
  //   print("a khac b");
  // }
  // var x = int.parse(stdin.readLineSync().toString());
  // var y = int.parse(stdin.readLineSync().toString());
  // if (x > y) {
  //   print("x lon hon y");
  // } else if(x<y) {
  //   print("x nho hon y");
  // }else{
  //   print("x bang y");
  // }
  // double q = double.parse(stdin.readLineSync().toString());
  // double p = double.parse(stdin.readLineSync().toString());
  // if (p >= q) {
  //   print("P lon hon hoac bang q");
  // } else {
  //   print("q lon hon p");
  // }
  stdout.write("nhap ten:");
  var name = stdin.readLineSync();
  stdout.write("Diem toan: ");
  var diemToan = double.parse(stdin.readLineSync().toString());
  stdout.write("Diem Ly: ");
  var diemLy = double.parse(stdin.readLineSync().toString());
  stdout.write("Diem Hoa: ");
  var diemHoa = double.parse(stdin.readLineSync().toString());
  if (diemHoa < 4 && diemLy < 4 && diemToan < 4) {
    print("truot mon");
  } else {
    var DTB = (diemToan + diemLy + diemHoa) / 3;
    if (DTB >= 8) {
      print("gioi");
    }else if (DTB >= 6.5 ) {
      print("kha");
    } else if (DTB >= 5) {
      print("trung binh");
    } else {
      print("yeu");
    } 
  }
}
