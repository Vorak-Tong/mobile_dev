import 'package:flutter/material.dart';

enum Season{
  fall(image: 'assets/season/fall.jpg', name: 'Fall'),
  spring(image: 'assets/season/spring.jpg', name: 'Spring'),
  summer(image: 'assets/season/summer.jpg', name: 'Summer'),
  winter(image: 'assets/season/winter.jpg', name: 'Winter');

  final String image;
  final String name;
  const Season({required this.image, required this.name});

  Season get next{
    // 0->1->2->3->0
    return Season.values[(index + 1) % Season.values.length]; 
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Season Card'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SeasonWidget(
            children: [
              SeasonCard(country: "Cambodia", initSeason: Season.spring),
              SizedBox(width: 15),
              SeasonCard(country: "France", initSeason: Season.winter),
            ],
          ),
        ),
      ),
    ),
  )
);

class SeasonWidget extends StatelessWidget {
  final List<Widget> children;
  const SeasonWidget({super.key, required this.children });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'SEASON',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        ],
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final Season initSeason;
  final String country;
  const SeasonCard({
    super.key,
    this.initSeason = Season.fall,
    required this.country
  });

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Season _currentSeason;

  @override
  void initState() {
    super.initState();
    _currentSeason = widget.initSeason;
  }

  void _cycleSeason(){
    setState(() {
      _currentSeason = _currentSeason.next;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // image
          GestureDetector(
            onTap: _cycleSeason,
            child: SizedBox(
              height: 250,
              width: 200,
              child: Image.asset(
                _currentSeason.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text for country
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  _currentSeason.name.toUpperCase(),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.country,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}