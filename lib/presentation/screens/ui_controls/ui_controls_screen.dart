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

enum Transportation { car, boat, plane, submarine }

class _UiControlsViewsState extends State<_UiControlsViews> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantBreakFast = false;
  bool wantLunch = false;
  bool wantDinner = false;

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
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('incluir desayuno?'),
          value: wantBreakFast,
          onChanged: (value) => setState(() {
            wantBreakFast = !wantBreakFast;
          }),
        ),
        CheckboxListTile(
          title: const Text('incluir Lunch?'),
          value: wantLunch,
          onChanged: (value) => setState(() {
            wantLunch = !wantLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('incluir Cena?'),
          value: wantDinner,
          onChanged: (value) => setState(() {
            wantDinner = !wantDinner;
          }),
        ),
      ],
    );
  }
}


//nota, en el radiolisttile, si la propiedad value, coincide con la propiedad groupvalue, entonces el radiolist
//se toma como seleccionado