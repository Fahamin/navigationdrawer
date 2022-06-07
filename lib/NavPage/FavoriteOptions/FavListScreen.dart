import 'package:flutter/material.dart';
import 'package:navigationdrawer/NavPage/FavoriteOptions/DataProvider.dart';

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class FavListScreen extends StatefulWidget {
  const FavListScreen({Key? key}) : super(key: key);

  @override
  State<FavListScreen> createState() => _FavListScreenState();
}

class _FavListScreenState extends State<FavListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${_myList.length})"),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentMoive = _myList[index];
            return Card(
              key: ValueKey(currentMoive.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMoive.title),
                subtitle: Text(currentMoive.runtime ?? ''),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMoive);
                  },
                ),
              ),
            );
          }),
    );
  }
}
