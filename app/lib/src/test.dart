// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

class HitRollCard extends StatefulWidget {
  const HitRollCard({super.key});

  @override
  State<StatefulWidget> createState() => _HitRollCardState();
}

class _HitRollCardState extends State<HitRollCard> {
  int attackerWS = 3;
  int targetWS = 3;
  int rollValue = 4;

  // Function to calculate roll value based on attacker and target WS
  void _calculateRoll(int attackerWS, int targetWS) {
    setState(() {
      rollValue = js.context.callMethod('resolveWeaponSkill', [attackerWS, targetWS]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'HIT ROLL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    HitRollButtonGroup(
                      label: 'Attacker WS',
                      initialValue: attackerWS,
                      onChanged: (value) {
                        setState(() {
                          attackerWS = value;
                        });
                        _calculateRoll(attackerWS, targetWS);
                      },
                    ),
                  ],
                ),
                const Text(
                  'Roll',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$rollValue+',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    HitRollButtonGroup(
                      label: 'Target WS',
                      initialValue: targetWS,
                      onChanged: (value) {
                        setState(() {
                          targetWS = value;
                        });
                        _calculateRoll(attackerWS, targetWS);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HitRollButtonGroup extends StatefulWidget {
  final String label;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const HitRollButtonGroup({super.key, 
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _HitRollButtonGroupState();
}

class _HitRollButtonGroupState extends State<HitRollButtonGroup> {
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
        widget.onChanged(_value); // Call the provided callback when value changes
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 1) {
        _value--;
        widget.onChanged(_value); // Call the provided callback when value changes
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