import 'package:app/src/ballistic_skill.dart';
import 'package:app/src/strength_toughness.dart';
import 'package:app/src/weapon_skill.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

    static const routeName = '/main';

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const WeaponSkillPage(),
    const StrengthToughnessPage(),
    const BallisticSkillPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Switch between pages based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.api_rounded),
            label: 'Weapon Skill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Wound Roll',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bullseye),
            label: 'Ballistic Skill',
          ),
        ],
      ),
    );
  }
}
