class Point{
    final num x;
    final num y;

    const Point(this.x, this.y);

    Point translate(num dx, num dy){
        return Point(x + dx, y + dy);
    }

    @override
    String toString() {
    return 'x = $x, y = $y';
    // return '($x, $y)';
  }
}

void main() {
    Point point1 = Point(10, 2);
    Point point2 = point1.translate(5,4);

    print(point1);
    print(point2);
}

// =========================================

// class Point {
//   num x;
//   num y;

//   Point(this.x, this.y);

//   @override
//   String toString() {
//     return "($x, $y)";
//   }
// }

// class Rectangle {
//     Point topLeft;
//     Point bottomRight;

//     Rectangle({required this.bottomRight, required this.topLeft});

//     num getArea(){
//         num width = bottomRight.x - topLeft.x;
//         num height = topLeft.y - bottomRight.y;
//         return width * height;
//     }
// }

// main() {
//   Point bottomRight = Point(10, 5);
//   Point topLeft = Point(5, 10);
  
//   Rectangle r1 = Rectangle(bottomRight: bottomRight, topLeft: topLeft);
//   print('Area = ' + r1.getArea().toString());
  
// }

// =================================================

// class Person {
//     String firstname;
//     String lastname;

//     Person(this.firstname, this.lastname);

//     String get fullname => '$firstname $lastname';
// }

// main(){
//     Person p = Person('Tong', 'Vorak');
//     print('First name: ${p.firstname}');
//     print('Last name: ${p.lastname}');
//     print('Fullname: ${p.fullname}');
// }