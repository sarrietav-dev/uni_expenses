import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDoubleRide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.save),
      ),
      body: Column(children: [
        CheckboxListTile(
          value: _isDoubleRide,
          onChanged: (value) => setState(() {
            _isDoubleRide = value ?? false;
          }),
          title: const Text("Double ride"),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ]),
    );
  }
}
