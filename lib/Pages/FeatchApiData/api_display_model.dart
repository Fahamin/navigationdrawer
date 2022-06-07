import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Api_Display extends StatelessWidget {
  final int? id;
  final String? title;
  final bool? status;
  const Api_Display({this.id, this.title, this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
     /* height: MediaQuery.of(context).size.height * 0.05,*/
      child: Column(
        children: [
          Row(
            children: [
              Text(id.toString()),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(title!),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(status!.toString())
            ],
          )
        ],
      ),
    );
  }
}
