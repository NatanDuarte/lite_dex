import 'package:flutter/material.dart';
import 'package:lite_dex/resources/constants.dart';
import 'package:lite_dex/screens/find_pokemon.dart';

class LiteDex extends StatelessWidget {
  const LiteDex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        key: _formKey,
        appBar: AppBar(),
        body: FindPokemonByName(key: key),
      ),
    );
  }
}
