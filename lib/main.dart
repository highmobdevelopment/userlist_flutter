import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listcard.dart';
import 'dart:convert';
import 'user.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

List data;
List<User> userlist = new List();

class HomePageState extends State<HomePage> {
  Future<String> fetchData() async {
    final url =
        'https://raw.githubusercontent.com/highmobdevelopment/userlist/master/contacts.json';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('succesfull parse');

      this.setState(() {
        data = JSON.decode(response.body);
        data.forEach((element) => userlist.add(new User.fromJson(element)));
      });
    }

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UserList Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('UserList Flutter'),
        ),
        body: new UserListWidget(),
      ),
    );
  }
}

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: userlist == null ? 0 : userlist.length,
      itemBuilder: (context, rowNumber) {
        return new Column(
          children: <Widget>[
            new ListCard(rowNumber, userlist),
            new Divider(
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}
