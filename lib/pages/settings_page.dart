import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/services/settings_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.settingsService});

  final ISettingsService settingsService;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDoubleRide;
  double _busPrice;

  _SettingsPageState()
      : _isDoubleRide = false,
        _busPrice = 0.0;

  @override
  void initState() {
    super.initState();
    widget.settingsService.getSettings().then((settings) {
      setState(() {
        _isDoubleRide = settings.isDoubleRide;
        _busPrice = settings.busPrice;
      });
    });
  }

  _saveSettings() async {
    return await widget.settingsService.saveSettings(
        SettingContext(isDoubleRide: _isDoubleRide, busPrice: _busPrice));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveSettings().then((value) => Navigator.pop(context));
        },
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text("Bus price: "),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Current bus price: $_busPrice",
                      prefixIcon: const Icon(Icons.price_change_outlined)),
                  onChanged: (value) => setState(() {
                    _busPrice = double.tryParse(value) ?? 0;
                  }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
