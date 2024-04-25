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
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 88.0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Text(
                'Ronda: ',
                style: TextStyle(fontSize: 24.0, color: Color(0xFF636363)),
              ),
              Text(
                '3/7',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xFF636363),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton.outlined(
                  onPressed: () => provider.restartGame(),
                  icon: const Icon(Icons.refresh_outlined),
                ),
                const SizedBox(width: 10.0),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app_outlined),
                ),
                const SizedBox(width: 10.0),
              ],
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("lib/assets/background.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 124.0,
                height: 54.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(width: 10.0),
                      Text(
                        '0:15',
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Color(0xFF636363),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
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
                                    color: Colors.transparent,
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
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TurnBox(
                      screenSize: screenSize,
                      picture: 'nezuko',
                      turn: provider.isXturn,
                    ),
                    const SizedBox(width: 15.0),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                    const SizedBox(width: 15.0),
                    TurnBox(
                      screenSize: screenSize,
                      picture: 'tanjiro',
                      turn: !provider.isXturn,
                    ),
                  ],
                ),
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
