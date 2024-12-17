// ignore_for_file: avoid_print

abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  final double length, width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() => length * width;
}

void main() {
  Shape circle = Circle(5);
  print('Circle Area: ${circle.calculateArea()}'); // Output: 78.5

  Shape rectangle = Rectangle(4, 6);
  print('Rectangle Area: ${rectangle.calculateArea()}'); // Output: 24
}
