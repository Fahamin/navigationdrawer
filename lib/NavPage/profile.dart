import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double _width = 0.0;
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfilePage"),
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1485160497022-3e09382fb310?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&w=1000&q=80'),
              ),
              Positioned(
                bottom: -50.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        'https://scontent.ftun7-1.fna.fbcdn.net/v/t39.30808-6/s552x414/255729438_2061962933967301_6536194202848894171_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=8WN5tCaKhNQAX8wbDdB&_nc_ht=scontent.ftun7-1.fna&oh=00_AT-vQcebr_3_dyt5y7xkSu5mO6tTdZSL7pr80y15zU8aOQ&oe=61CD0B9D'),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Center(child: Text('Iheb Meftah')),
            subtitle: Center(child: Text('Computer Science Student ')),
          ),
          ListTile(
            title: Text('About me '),
            subtitle: Text(
                'Iheb Meftah ,étudiant en Licence Science Inforamtiques specialite Anlayse De Donnees et Big Data  '),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Education'),
            subtitle: Text(
                'Higher Institute of Computer Science and Multimedia of Sfax '),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Social'),
            subtitle: Row(
              children: [
                Expanded(
                  child: Icon(Icons.female),
                ),
                Expanded(
                  child: Icon(Icons.female),
                ),
                Expanded(
                  child: Icon(Icons.female),
                ),
                Expanded(
                  child: Icon(Icons.female),
                ),
                Expanded(
                  child: Icon(Icons.female),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
