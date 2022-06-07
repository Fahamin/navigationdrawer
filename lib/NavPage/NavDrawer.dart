import 'package:flutter/material.dart';
import 'package:navigationdrawer/NavPage/contact.dart';
import 'package:navigationdrawer/main.dart';
import 'FavoriteOptions/FavHomeScreen.dart';
import 'profile.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Center(
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Text(
                      "Flutter Design",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Profile"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Favorite List"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FavHomeScreenPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Contact"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => contact()));
            },
          )
        ],
      ),
    );
  }
}
