import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/provider.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // provider
    final TicTacToeProvider provider = Provider.of<TicTacToeProvider>(context);

    // screen size
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFFFF644A),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24.0),
                  strokeWidth: 5.0,
                  dashPattern: const [24, 12],
                  color: const Color(0xFFAA1A28),
                  child: SizedBox(
                    width: screenSize.width * 0.85,
                    height: screenSize.width * 0.85,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: screenSize.width * 0.85,
                            height: screenSize.width * 0.85,
                            child: CustomPaint(
                              painter: MiPainterPersonalizado(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            clipBehavior: Clip.hardEdge,
                            itemBuilder: (BuildContext context, int index) {
                              if (provider.xPlayer.contains(index)) {
                                return const XPlayerContainer();
                              } else if (provider.oPlayer.contains(index)) {
                                return const OPlayerContainer();
                              } else {
                                return InkWell(
                                  onTap: !provider.gameFinish
                                      ? () {
                                          provider.addToBoard(index);
                                        }
                                      : null,
                                  child: Container(
                                    color: const Color(0xFFFF644A),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TurnBox(
                      screenSize: screenSize,
                      picture: 'nezuko',
                      turn: provider.isXturn),
                  TurnBox(
                      screenSize: screenSize,
                      picture: 'tanjiro',
                      turn: !provider.isXturn),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiPainterPersonalizado extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFAA1A28)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    final path = Path();

    // primer palo vertical
    path.moveTo(size.width * 0.3333, 0);
    path.lineTo(size.width * 0.3333, size.height);
    // segundo palo vertical
    path.moveTo(size.width * 0.6666, 0);
    path.lineTo(size.width * 0.6666, size.height);
    // primer palo horizontal
    path.moveTo(0, size.height * 0.3333);
    path.lineTo(size.width, size.height * 0.3333);
    // segundo palo horizontal
    path.moveTo(0, size.height * 0.6666);
    path.lineTo(size.width, size.height * 0.6666);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MiPainterPersonalizado oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MiPainterPersonalizado oldDelegate) => true;
}
