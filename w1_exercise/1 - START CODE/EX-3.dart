void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var passedScore = scores.where((score) => score >= 50);
  print(passedScore.toList());
  print('${passedScore.length} students passed');
}