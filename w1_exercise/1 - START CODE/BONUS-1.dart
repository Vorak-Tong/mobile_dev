enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 3;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "AAAA";

  // Process the instructions and get the final position and direction
  for(var command in instructions.split('')){
    if(command == 'R'){
      direction = turnRight(direction);
    }
    else if(command == 'L'){
      direction = turnLeft(direction);
    }
    else if(command == 'A'){
      var newPosition = advance(x, y, direction);
      x = newPosition[0];
      y = newPosition[1];
    }
  }

  // Print the final position and direction
  print("Final position: {$x, $y}");
  print("Facing: ${direction.name}");
}

Direction turnRight(Direction current){
  switch(current){
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}

Direction turnLeft(Direction current){
  switch(current){
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
  }
}

List<int> advance(int x, int y, Direction direction){
  switch(direction){
    case Direction.north:
      return [x, y+1];
    case Direction.south:
      return [x, y - 1];
    case Direction.west:
      return [x - 1, y];
    case Direction.east:
      return [x + 1, y];
  }
}