// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'roll_button_group.dart';

class StrengthToughnessPage extends StatefulWidget {
  const StrengthToughnessPage({super.key});
  static const routeName = '/strength_toughness';

  @override
  State<StatefulWidget> createState() => _StrengthToughnessPageState();
}

class _StrengthToughnessPageState extends State<StrengthToughnessPage> {
  int strength = 3;
  int toughness = 3;
  int rollValue = 4;

  void _calculateRoll(int strength, int toughness) {
    setState(() {
      rollValue = js.context
          .callMethod('resolveStrengthToughness', [strength, toughness]);
    });
  }

  Card getCard() {
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
              'WOUND ROLL',
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
                    RollButtonGroup(
                      label: 'Strength',
                      initialValue: strength,
                      onChanged: (value) {
                        setState(() {
                          strength = value;
                        });
                        _calculateRoll(strength, toughness);
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
                  rollValue == 0 ? '-' : '$rollValue+', // rollValue of 0 means impossible attack
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    RollButtonGroup(
                      label: 'Toughness',
                      initialValue: toughness,
                      onChanged: (value) {
                        setState(() {
                          toughness = value;
                        });
                        _calculateRoll(strength, toughness);
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

  @override
  Widget build(BuildContext context) {
    return getCard();
  }
}
