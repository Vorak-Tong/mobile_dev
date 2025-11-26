import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: JokesScreen(),
    ));

class JokesScreen extends StatefulWidget {
  const JokesScreen({
    super.key,
  });

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  int _favoriteIndex = -1; // mean not selected

  void _setFavorite(int index){
    setState(() {
      if (_favoriteIndex == index) {
        _favoriteIndex = -1;
      } else {
        _favoriteIndex = index;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: randomJokesList.length,
        itemBuilder: (context, index){
          final joke = randomJokesList[index];
          return FavoriteCard(
            title: joke.title,
            description: joke.answer,
            isFavorite: index == _favoriteIndex,
            onFavoriteClick: () => _setFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;
  
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey)
        ),
      ),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description)
              ],
            ),
          ),
           IconButton(
              onPressed: onFavoriteClick, // Calls the parent's function
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}