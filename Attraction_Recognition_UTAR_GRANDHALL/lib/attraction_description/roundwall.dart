import 'package:flutter/material.dart';

class RoundWall extends StatelessWidget {
  const RoundWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Round Wall'),),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/roundwall.png'),
            width: 500,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Description',
            style: TextStyle(fontSize: 40),
          ),
          Text('- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
            style: TextStyle(fontSize: 15),
          ),

          Container(
            padding: EdgeInsets.all(20),
            child: Text('Round Wall is one of the attraction located at Dewan Tun Dr Ling Liong Sik, UTAR Kampar. '
                '\n\nIt is an integral part of the architectural design of the hall are two full-moon windows at two corners of the hall’s main entrance which afford framed views of the scenery of mountains, '
                'scenic lakes and other buildings of the campus.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ),
    );
  }
}
