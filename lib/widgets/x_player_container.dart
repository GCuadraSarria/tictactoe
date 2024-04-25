import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class XPlayerContainer extends StatelessWidget {
  const XPlayerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // provider
    final provider = Provider.of<TicTacToeProvider>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SvgPicture.asset(
            'lib/assets/characters/nezuko.svg',
          )
              .animate(
                target: provider.xPlayerWon ? 1 : 0,
              )
              .rotate(
                duration: const Duration(milliseconds: 500),
                end: 0.10,
              )
              .then()
              .rotate(
                duration: const Duration(milliseconds: 1000),
                end: -0.20,
              )
              .then()
              .rotate(
                duration: const Duration(milliseconds: 500),
                end: 0.10,
              ),
        ),
      ),
    );
  }
}
