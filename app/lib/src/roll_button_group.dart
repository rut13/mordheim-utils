import 'package:flutter/material.dart';

class RollButtonGroup extends StatefulWidget {
  final String label;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const RollButtonGroup({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _RollButtonGroupState();
}

class _RollButtonGroupState extends State<RollButtonGroup> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _increment() {
    setState(() {
      if (_value < 10) {
        _value++;
        widget
            .onChanged(_value); // Call the provided callback when value changes
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 1) {
        _value--;
        widget
            .onChanged(_value); // Call the provided callback when value changes
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _increment,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.grey[200],
            elevation: 0,
          ),
          child: const Icon(Icons.add, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          '$_value',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _decrement,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.grey[200],
            elevation: 0,
          ),
          child: const Icon(Icons.remove, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}