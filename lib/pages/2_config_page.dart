import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class SecondConfigPage extends StatefulWidget {
  const SecondConfigPage({super.key});

  @override
  State<SecondConfigPage> createState() => _SecondConfigPageState();
}

class _SecondConfigPageState extends State<SecondConfigPage> {
  @override
  Widget build(BuildContext context) {
    // provider
    final TicTacToeProvider provider = Provider.of<TicTacToeProvider>(context);

    // screen size
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('lib/assets/tictactoe_title_2.svg'),
              Container(
                color: const Color(0xFFAA1A28),
                width: screenSize.width,
                height: 56.0,
                child: const Center(
                  child: Text(
                    '2/3 CONFIGURAR PARTIDA',
                    style: TextStyle(
                      fontFamily: 'Animeace2',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset('lib/assets/config_step_2.svg'),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 24.0,
                ),
                width: screenSize.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Nombre jugador 2',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Escribe tu nombre',
                        hintStyle: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF898989),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        counterText: '',
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Soy un jugador habitual',
                          style: TextStyle(
                            color: Color(0xFF424242),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      children: [
                        Text(
                          'Selecciona tu ficha',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      clipBehavior: Clip.hardEdge,
                      itemBuilder: (BuildContext context, int index) {
                        if (provider.xPlayerChar == index) {
                          return Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: const Color(0xFFF35B62),
                              ),
                            ),
                            child: SvgPicture.asset(
                                'lib/assets/characters/character_$index.svg'),
                          );
                        } else {
                          if (provider.oPlayerChar == index) {
                            return Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: const Color(0xFF2B96EE),
                                ),
                              ),
                              child: SvgPicture.asset(
                                  'lib/assets/characters/character_$index.svg'),
                            );
                          } else {
                            return InkWell(
                              onTap: () => provider.characterSelect(index, 1),
                              child: Container(
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color: const Color(0xFFD9D9D9),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                    'lib/assets/characters/character_$index.svg'),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'IR A LA PARTIDA',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Animeace2',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
