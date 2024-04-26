import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class TurnBox extends StatelessWidget {
  const TurnBox({
    super.key,
    required this.screenSize,
    required this.pictureIndex,
    required this.turn,
  });

  final Size screenSize;
  final int pictureIndex;
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
        color: turn ? Colors.white : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SvgPicture.asset(
            'lib/assets/characters/character_$pictureIndex.svg',
          ),
        ),
      ),
    );
  }
}
