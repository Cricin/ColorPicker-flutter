import 'package:flutter/material.dart';

import 'color_picker.dart';

void main() => runApp(ColorPickerApp());

class ColorPickerApp extends StatefulWidget {
  @override
  _ColorPickerAppState createState() => _ColorPickerAppState();
}

class _ColorPickerAppState extends State<ColorPickerApp> {
  Color currentColor = Color(0xffff0000);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ColorPicker",
      home: Scaffold(
        appBar: AppBar(title: Text("ColorPicker"),),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              CircleColorPicker(
                thumbRadius: 10,
                colorListener: (int value) {
                  setState(() {
                    currentColor = Color(value);
                  });
                },
              ),
              SizedBox(height: 20),
              BarColorPicker(
                width: 300,
                thumbColor: Colors.white,
                cornerRadius: 10,
                pickMode: PickMode.Color,
                colorListener: (int value) {
                  setState(() {
                    currentColor = Color(value);
                  });
                }),
              SizedBox(height: 20),
              BarColorPicker(
                cornerRadius: 10,
                pickMode: PickMode.Grey,
                colorListener: (int value) {
                  setState(() {
                    currentColor = Color(value);
                  });
                }),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 50,
                color: currentColor,
                alignment: Alignment.center,
                child: Text(currentColor.value.toRadixString(16).toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
