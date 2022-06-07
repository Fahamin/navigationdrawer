import 'package:flutter/material.dart';
import 'package:navigationdrawer/Pages/MultiSelectedCheckbox/MultiSelect.dart';

// Implement a multi select on the Home screen
class MultiCheckBozHomePage extends StatefulWidget {
  const MultiCheckBozHomePage({Key? key}) : super(key: key);

  @override
  _MultiCheckBozHomePageState createState() => _MultiCheckBozHomePageState();
}

class _MultiCheckBozHomePageState extends State<MultiCheckBozHomePage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple CheckBox'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // use this button to open the multi-select dialog
              ElevatedButton(
                child: const Text('Select Your Favorite Topics'),
                onPressed: _showMultiSelect,
              ),
              const Divider(
                height: 30,
              ),
              // display selected items
              Wrap(
                children: _selectedItems
                    .map((e) =>
                    Chip(
                      label: Text(e),
                    ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}