// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'roll_button_group.dart';

class WeaponSkillPage extends StatefulWidget {
  const WeaponSkillPage({super.key});
  static const routeName = '/weapon_skill';

  @override
  State<StatefulWidget> createState() => _WeaponSkillPageState();
}

class _WeaponSkillPageState extends State<WeaponSkillPage> {
  int attackerWS = 3;
  int targetWS = 3;
  int rollValue = 4;

  void _calculateRoll(int attackerWS, int targetWS) {
    setState(() {
      rollValue =
          js.context.callMethod('resolveWeaponSkill', [attackerWS, targetWS]);
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
              'MELEE HIT ROLL',
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
                    RollButtonGroup(
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

  @override
  Widget build(BuildContext context) {
    return getCard();
  }
}
