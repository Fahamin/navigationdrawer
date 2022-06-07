import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  _featchData(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 14,
                  ),
                  Text("Loading..Please Wait")
                ],
              ),
            ),
          );
        });
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Dialog "),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _featchData(context);
          },
          child: Text("Load Data "),
        ),
      ),
    );
  }
}
