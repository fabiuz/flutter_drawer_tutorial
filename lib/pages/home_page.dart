import 'package:flutter/material.dart';
import './other_page.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://avatars1.githubusercontent.com/u/12419623?s=460&v=4";
  String otherProfilePicture = "http://www.google.com/google.jpg";

  void switchUser() {
    String backupString = mainProfilePicture;

    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("fabiuz"),
                accountEmail: Text("ccmaismais@yahoo.com"),
                currentAccountPicture: GestureDetector(
                    onTap: () => print("This is the current user."),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture))),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                      onTap: () => switchUser(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(otherProfilePicture),
                      )),
                ],
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg")))),
            ListTile(
              title: Text("First Page"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => OtherPage("FirstPage")));
              },
            ),
            ListTile(
                title: Text("Second Page"),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => OtherPage("Second Page")));
                }),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("HomePage", style: TextStyle(fontSize: 35.0)),
      ),
    );
  }
}
