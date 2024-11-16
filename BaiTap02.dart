import 'dart:io';
import 'dart:math';

// Hàm kiểm tra input có phải là số không
double? validateInput(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print('Vui lòng không để trống!');
      continue;
    }

    try {
      return double.parse(input);
    } catch (e) {
      print('Lỗi: Vui lòng nhập số!');
    }
  }
}

// Hàm nhập hệ số a và đảm bảo a khác 0
double getA() {
  while (true) {
    double? a = validateInput('Nhập hệ số a: ');
    if (a != null && a != 0) {
      return a;
    }
    print('Hệ số a phải khác 0! Vui lòng nhập lại.');
  }
}

// Hàm giải phương trình bậc 2
void solve(double a, double b, double c) {
  print('\nPhương trình là: ${a}x² + ${b}x + $c = 0');

  // Tính delta
  double delta = b * b - 4 * a * c;
  print('Delta = $delta');

  // Kiểm tra và giải phương trình dựa vào delta
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép x1 = x2 = ${x.toStringAsFixed(2)}');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = ${x1.toStringAsFixed(2)}');
    print('x2 = ${x2.toStringAsFixed(2)}');
  }
}

void main() {
  print('GIẢI PHƯƠNG TRÌNH BẬC 2');
  print('Phương trình có dạng: ax² + bx + c = 0');

  try {
    // Nhập hệ số a (đảm bảo khác 0)
    double a = getA();

    // Nhập hệ số b
    double? b = validateInput('Nhập hệ số b: ');
    while (b == null) {
      b = validateInput('Nhập hệ số b: ');
    }

    // Nhập hệ số c
    double? c = validateInput('Nhập hệ số c: ');
    while (c == null) {
      c = validateInput('Nhập hệ số c: ');
    }

    // Giải phương trình
    solve(a, b, c);
  } catch (e) {
    print('Đã xảy ra lỗi: $e');
  }
}
