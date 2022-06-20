import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool darkMode = false;
  // int gender = 1;
  // String nameUser = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: const SideMenuWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
          ),
          const Divider(),
          SwitchListTile.adaptive(
            value: Preferences.isDarkMode,
            title: const Text("DarkMode"),
            onChanged: (value) {
              Preferences.isDarkMode = value;
              value ? provider.setThemeDark() : provider.setThemeLight();
              setState(() {});
            },
          ),
          RadioListTile<int>(
            value: 1,
            groupValue: Preferences.gender,
            title: const Text("Masculino"),
            onChanged: (value) {
              Preferences.gender = value ?? 1;
              setState(() {});
            },
          ),
          RadioListTile<int>(
            value: 2,
            groupValue: Preferences.gender,
            title: const Text("Femenino"),
            onChanged: (value) {
              Preferences.gender = value ?? 2;
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              initialValue: Preferences.name,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del Usuario',
                  hintText: 'Nombre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (value) {
                Preferences.name = value;
                setState(() {});
              },
            ),
          )
        ],
      )),
    );
  }
}
