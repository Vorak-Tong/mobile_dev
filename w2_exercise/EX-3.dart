class CustomDuration {
  final int _milliseconds;

  CustomDuration([int milliseconds = 0]) : _milliseconds = milliseconds, assert(milliseconds >= 0, "Duration cannot be negative");

  // Named Constructor
  CustomDuration.fromHours(int hours) : _milliseconds = hours * 3600000, assert(hours >= 0, "Hours cannot be negative");
  CustomDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60000, assert(minutes >= 0, "Minutes cannot be negative");
  CustomDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000, assert(seconds >= 0,"Seconds cannot be negative");

  // Operator
  bool operator> (CustomDuration other){
    return this._milliseconds > other._milliseconds;
  }

  CustomDuration operator+ (CustomDuration other){
    return CustomDuration(_milliseconds + other._milliseconds);
  }

  CustomDuration operator- (CustomDuration other){
    final result = _milliseconds - other._milliseconds;
    return CustomDuration(result < 0 ? 0 : result);
  }

  int get inMilliseconds => _milliseconds;
  double get inSeconds => _milliseconds / 1000;
  double get inMinutes => _milliseconds / 60000;
  double get inHours => _milliseconds / 3600000;

  @override
  String toString() => 'Custom Duration: ${_milliseconds}ms';

}

void main() {
  final duration1 = CustomDuration(5000);
  final duration2 = CustomDuration.fromSeconds(60);
  final duration3 = CustomDuration.fromMinutes(30);
  final duration4 = CustomDuration.fromHours(3);

  print(duration1);
  print(duration2);

  print(duration1 > duration2);

  final sum = duration3 + duration4;
  print('${sum.inMinutes}mn');

  final minus = duration2 - duration1;
  print('${minus.inSeconds}s');
}