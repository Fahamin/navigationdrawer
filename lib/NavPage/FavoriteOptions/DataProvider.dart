import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'DataModel.dart';

// A list of movies
final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Moview $index",
        runtime: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  // All movies (that will be displayed on the Home screen)
  final List<Movie> _movies = initialData;

  // Retrieve all movies
  List<Movie> get movies => _movies;

  //geter
  // Favorite movies (that will be shown on the MyList screen)
  final List<Movie> _myList = [];

  //geter
  // Retrieve favorite movies
  List<Movie> get myList => _myList;

  // Adding a movie to the favorites list
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  // Removing a movie from the favorites list
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
