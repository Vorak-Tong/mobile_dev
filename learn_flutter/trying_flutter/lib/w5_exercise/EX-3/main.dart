import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      ),
    )
  );
}

enum Product{
  dart(
    'Dart', 
    'the best object language', 
    'assets/ex3/dart.png'
  ),
  flutter(
    'Flutter', 
    'the best mobile widget library', 
    'assets/ex3/flutter.png'
  ),
  firebase(
    'Firebase', 
    'the best cloud database', 
    'assets/ex3/firebase.png'
  );

  final String title;
  final String description;
  final String imgPath;

  const Product(
    this.title,
    this.description,
    this.imgPath,
  );
}

class ProductCard extends StatelessWidget{
  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imgPath,
              width: 80,
              height: 80,
            ),

            const SizedBox(height: 15),

            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}