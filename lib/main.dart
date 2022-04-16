import 'package:flutter/material.dart';
import 'package:lite_dex/http/webclient.dart';
import 'package:lite_dex/screens/PokemonInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return MaterialApp(
      title: 'Lite Dex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        key: _formKey,
        appBar: AppBar(title: const Text('Lite Dex')),
        body: RequestForm(key: key),
      ),
    );
  }
}

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);
  static const appName = 'Lite Dex';

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm>
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
              hintText: 'type a pokemon name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a pokemon name';
              }
              return null;
            },
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
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
