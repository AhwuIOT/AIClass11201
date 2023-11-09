import 'package:flutter/material.dart';

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.black,
    ),
    Icon(
      Icons.star,
      color: Colors.black,
    ),
  ],
);

final ratings = Container(
    // width: 100,
    // height: 100,
    decoration: BoxDecoration(color: Colors.white),
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("123"),
        stars,
        Text(
          '170 Reviews',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.umbrella),
            Icon(Icons.access_alarm),
          ],
        )
      ],
    ));

class myrow extends StatelessWidget {
  myrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ratings,
        Container(
          child: Text("544"),
        )
      ],
    );
  }
}
