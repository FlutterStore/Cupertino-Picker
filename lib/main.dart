import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

void main() => runApp(const CupertinoPickerApp());

class CupertinoPickerApp extends StatelessWidget {
  const CupertinoPickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPickerExample(),
    );
  }
}

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  State<CupertinoPickerExample> createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  int _selectedFruit = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: child,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("CupertinoPicker",style: TextStyle(fontSize: 15),),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Selected fruit: '),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(_fruitNames.length, (int index) {
                      return Center(
                        child: Text(
                          _fruitNames[index],
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }),
                  ),
                ),
                child: Text(
                  _fruitNames[_selectedFruit],
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
