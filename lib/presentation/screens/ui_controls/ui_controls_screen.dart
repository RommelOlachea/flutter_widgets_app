import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsViews(),
    );
  }
}

class _UiControlsViews extends StatefulWidget {
  const _UiControlsViews();

  @override
  State<_UiControlsViews> createState() => _UiControlsViewsState();
}

enum Transportation { car,boat, plane, submarine }

class _UiControlsViewsState extends State<_UiControlsViews> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              isDeveloper = !isDeveloper;
              setState(() {});
            }),
        RadioListTile(
          value: Transportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) {
            setState(() {
            selectedTransportation = Transportation.car;              
            });
          },
        ),
        RadioListTile(
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) {
            setState(() {
            selectedTransportation = Transportation.boat;              
            });
          },
        ),
        RadioListTile(
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) {
            setState(() {
            selectedTransportation = Transportation.plane;              
            });
          },
        ),
        RadioListTile(
          value: Transportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) {
            setState(() {
            selectedTransportation = Transportation.submarine;   
            });
          },
        ),
      ],
    );
  }
}
