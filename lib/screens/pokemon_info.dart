import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_dex/model/pokemon.dart';

class PokemonInfo extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: showInformation(),
    );
  }

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name);
    } else {
      return const Text("Pokemon");
    }
  }

  Flex showInformation() {
    if (pokemon != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage('${pokemon?.sprite}'),
                fit: BoxFit.cover,
                height: 128.0,
                width: 128.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "#${pokemon?.id}",
                        style: const TextStyle(
                            fontSize: 64.0, color: Colors.amber),
                      ),
                      Text(
                        "${pokemon?.name}",
                        style: const TextStyle(
                            fontSize: 64.0, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "No information",
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
              Text(
                "Maybe the name is wrong?",
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ],
          ),
        ],
      );
    }
  }
}
