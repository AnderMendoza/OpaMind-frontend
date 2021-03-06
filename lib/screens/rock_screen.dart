//Importamos los paquetes
import 'package:OpaMind/models/rock.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/search/rock_search_delegate.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_list_tile.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';

import '../providers/rock_provider.dart';

class RockScreen extends StatefulWidget {
  const RockScreen({Key? key}) : super(key: key);

  @override
  createState() => _RockScreen();
}

class _RockScreen extends State<RockScreen> {
  //Asignamos valores la variables para titulo de la cancion, cover y cantante
  String currentTitle = "";
  String currentCover = "";
  String currentSinger = "";
  IconData btnIcon = Icons.play_arrow;

  //Creamos el player
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  //Creamos la barra de reproduccion
  Duration duration = const Duration();
  Duration position = const Duration();

  //Creamos los botones de reproduccion y pausa
  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.play_arrow;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration p) {
      setState(() {
        duration = p;
        print('duration:$duration');
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
        print('position:$position');
      });
    });
  }

  //Creamos el area de trabajo
  @override
  Widget build(BuildContext context) {
    final rockProvider = Provider.of<RockProvider>(context);
    final List<Rock> listaRocks = rockProvider.listaRocks;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 54, 99),
        title: const Text(
          "Rock",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: RockSearchDelegate(listaRocks));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      //Mostramos las canciones
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: listaRocks.length,
                itemBuilder: (context, index) => customListTile(
                      onTap: () {
                        playMusic(listaRocks[index].url);
                        setState(() {
                          currentTitle = listaRocks[index].cancion;
                          currentCover = listaRocks[index].portada;
                          currentSinger = listaRocks[index].banda;
                        });
                      },
                      title: listaRocks[index].cancion,
                      cover: listaRocks[index].portada,
                      singer: listaRocks[index].banda,
                    )),
          ),
          //Creamos el espacio del player
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 56, 39, 98),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x55212121),
                    blurRadius: 8.0,
                  ),
                ]),
            child: Column(
              children: [
                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                  },
                ),
                //Agregamos los covers de cada cancion
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                                image: NetworkImage(currentCover))),
                      ),
                      //Agregamos el nombre del cantante y nombre de la cnacion
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTitle,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 251, 251, 251),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              currentSinger,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 251, 251, 251),
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      //Funcion para reproducir y pausar las canciones
                      IconButton(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.pause;
                              isPlaying = false;
                            });
                          } else {
                            audioPlayer.pause();
                            setState(() {
                              btnIcon = Icons.play_arrow;
                              isPlaying = true;
                            });
                          }
                        },
                        iconSize: 42.0,
                        icon: Icon(btnIcon),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
