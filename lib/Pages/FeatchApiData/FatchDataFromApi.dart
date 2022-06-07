import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navigationdrawer/Pages/FeatchApiData/api_display_model.dart';
import 'package:http/http.dart' as http;

class FatchDataFromApi extends StatefulWidget {
  const FatchDataFromApi({Key? key}) : super(key: key);

  @override
  State<FatchDataFromApi> createState() => _FatchDataFromApiState();
}

class _FatchDataFromApiState extends State<FatchDataFromApi> {
  String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List> FetchApi() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var toJson = jsonDecode(response.body);
        return toJson;
      } else {
        return Future.error("Server Error");
      }
    } catch (SocketExpection) {
      return Future.error("error Fetching data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    FetchApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data From Api"),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(20),
          child: Expanded(
            child: FutureBuilder<List>(
              future: FetchApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Map post = snapshot.data![index];
                      return Api_Display(
                          id: post["id"],
                          title: post["title"],
                          status: post["completed"]);
                    },
                  );
                }
                return Center(
                  child: Transform.scale(
                    scale: 1,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
