import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class TurnBox extends StatelessWidget {
  const TurnBox({
    super.key,
    required this.screenSize,
    required this.picture,
    required this.turn,
  });

  final Size screenSize;
  final String picture;
  final bool turn;

  @override
  Widget build(BuildContext context) {
    // provider
    final provider = Provider.of<TicTacToeProvider>(context);
    
    return Container(
      height: screenSize.width * 0.3,
      width: screenSize.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
      ),
    child: Padding(
        padding: turn ? const EdgeInsets.all(5.0) : const EdgeInsets.all(12.0),
        child: Center(
          child: SvgPicture.asset(
            'lib/assets/$picture.svg',
          ),
        ),
      ),);
  }
}
