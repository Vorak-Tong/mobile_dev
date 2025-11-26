import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _fahrenheit;
  String? _errorText;

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
    ),
    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 14),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  void _compute(){
    final value = _controller.text;
    if(value.isEmpty){
      setState(() {
        _fahrenheit = null;
        _errorText = null;
      });
      return;
    }
    try{
      final double tempInDegree = double.parse(value);
      setState(() {
        _fahrenheit = (tempInDegree * 1.8) + 32;
        _errorText = null;
      });
    }
    catch(e){
      setState(() {
        _fahrenheit = null;
        _errorText = 'The input must be number';
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: inputDecoration.copyWith(errorText: _errorText),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (value) => _compute(),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _fahrenheit == null ? '' : _fahrenheit!.toStringAsFixed(2),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
