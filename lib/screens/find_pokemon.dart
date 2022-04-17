import 'package:flutter/material.dart';
import 'package:lite_dex/http/webclient.dart';
import 'package:lite_dex/resources/constants.dart';
import 'package:lite_dex/screens/pokemon_info.dart';

class FindPokemonByName extends StatefulWidget {
  const FindPokemonByName({Key? key}) : super(key: key);

  @override
  State<FindPokemonByName> createState() => _FindPokemonByNameState();
}

class _FindPokemonByNameState extends State<FindPokemonByName>
    with SingleTickerProviderStateMixin {
  final TextEditingController _formFieldController = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _formFieldController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: Constants.findPokemonFormHintText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                final uri = _formFieldController.text.toLowerCase().trim();
                _formFieldController.text = '';
                fetch(uri).then(
                  (pokemon) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PokemonInfo(pokemon: pokemon),
                    ),
                  ),
                );
              },
              child: const Text(Constants.submitButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
