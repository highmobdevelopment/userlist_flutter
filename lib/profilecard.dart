import 'user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(List<User> this.data, int this.index);
  List<User> data;
  int index;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: data[index].name + " " + data[index].surname,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(data[index].name + " " + data[index].surname),
        ),
        body: new ProfileWidget(data, index),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  ProfileWidget(List<User> this.userlist, int this.index);
  List<User> userlist;
  int index;
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          height: 200.0,
          color: Colors.blueAccent,
          child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(userlist[index].image))),
          ),
          alignment: FractionalOffset.center,
        ),
        new Column(
          children: <Widget>[
            new Container(
              height: 50.0,
              child: new Text(
                  userlist[index].name + " " + userlist[index].surname,
                  style: const TextStyle(fontSize: 24.0, color: Colors.blue)),
              alignment: FractionalOffset.center,
            ),
            new Container(
                height: 2.0,
                color: Colors.blue,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                alignment: FractionalOffset.center),
            new Container(
                height: 60.0,
                child: new ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('email'),
                    subtitle: new Text(
                      userlist[index].email,
                      style: const TextStyle(fontSize: 16.0),
                    ))),
            new Container(
                height: 60.0,
                child: new ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text('address'),
                    subtitle: new Text(
                      userlist[index].address,
                      style: const TextStyle(fontSize: 16.0),
                    ))),
            new Container(
                height: 60.0,
                child: new ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('home phone'),
                    subtitle: new Text(
                      userlist[index].home,
                      style: const TextStyle(fontSize: 16.0),
                    ))),
            new Container(
                height: 60.0,
                child: new ListTile(
                    leading: const Icon(Icons.phone_android),
                    title: const Text('mobile phone'),
                    subtitle: new Text(
                      userlist[index].work,
                      style: const TextStyle(fontSize: 16.0),
                    )))
          ],
        )
      ],
    );
  }
}
