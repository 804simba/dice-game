import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // using named parameter
  // final List<Color> colors;
  final Color colorOne;
  final Color colorTwo;

  // GradientContainer({super.key, required this.colors});
  const GradientContainer(this.colorOne, this.colorTwo, {super.key});
  //GradientContainer({key}): super(key: key);

  const GradientContainer.purple({super.key})
    : colorOne = Colors.deepPurple,
      colorTwo = Colors.indigo;

  

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorOne, colorTwo],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
          child: DiceRoller(),
    ));
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer(this.colorOne, this.colorTwo, {super.key});

//   // using positional parameters
//   final Color colorOne;
//   final Color colorTwo;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [colorOne, colorTwo], 
//             begin: startAlignment, 
//             end: endAlignment),
//       ),
//       child: const Center(
//         child: StyledText('Hello World!'),
//       ),
//     );
//   }
// }