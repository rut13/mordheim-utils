// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'roll_button_group.dart';

class BallisticSkillPage extends StatefulWidget {
  const BallisticSkillPage({super.key});
  static const routeName = '/ballistic_skill';

  @override
  State<StatefulWidget> createState() => _BallisticSkillPageState();
}

class _BallisticSkillPageState extends State<BallisticSkillPage> {
  int ballisticSkill = 3;
  int rollValue = 4;

  void _calculateRoll(int ballisticSkill) {
    setState(() {
      rollValue =
          js.context.callMethod('resolveBallisticSkill', [ballisticSkill]);
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
              'RANGED HIT ROLL',
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
                      label: 'Ballistic Skill',
                      initialValue: ballisticSkill,
                      onChanged: (value) {
                        setState(() {
                          ballisticSkill = value;
                        });
                        _calculateRoll(ballisticSkill);
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
                  rollValue >= 0 ? '$rollValue+' : '$rollValue',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
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
