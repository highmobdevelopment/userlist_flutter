import 'user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profilecard.dart';

class ListCard extends StatelessWidget {
  ListCard(int this.rowNumber, List<User> this.userlist);
  int rowNumber;
  List<User> userlist;
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileCard(userlist, rowNumber)));
        },
        child: new Row(
          children: <Widget>[
            new Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 40.0, bottom: 10.0, top: 10.0),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(userlist[rowNumber].image)))),
            new Expanded(
                child: new Text(
              userlist[rowNumber].name + " " + userlist[rowNumber].surname,
              style: const TextStyle(fontSize: 20.0),
            ))
          ],
        ));
  }
}
