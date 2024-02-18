import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

// when working with Stateful widgets you will always work with 2 classes
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// _ means the class is private
class _DiceRollerState extends State<DiceRoller> {  

  var currentDiceRoll = 1;

  void rollDiceHandler() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/dice-$currentDiceRoll.png',
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: rollDiceHandler,
            style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(top: 20,),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 28,
                )),
            child: const Text('Roll Dice'),
          )
        ],
      );
  }
}