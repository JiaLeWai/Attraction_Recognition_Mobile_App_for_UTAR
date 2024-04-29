import 'package:flutter/material.dart';
import 'package:fyp003/attraction_description/ambulance.dart';
import 'package:fyp003/attraction_description/ceiling.dart';
import 'package:fyp003/attraction_description/roundwall.dart';
import '../TianYuanDiFang.dart';
import '../attraction_description/T&CM.dart';
import '../attraction_description/blocksign.dart';
import '../attraction_description/corridor.dart';
import '../attraction_description/gesture.dart';
import '../attraction_description/inkblock.dart';
import '../attraction_description/main_entrance.dart';
import '../attraction_description/staff.dart';
import '../attraction_description/BronzeSculptureCE.dart';
import '../attraction_description/arch_of_virtue_and_knowledge.dart';
import '../attraction_description/Confucius.dart';
import '../attraction_description/Einstein.dart';
import '../attraction_description/chess.dart';
import '../attraction_description/description_block.dart';

class ListBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          ListTile(
            title: Text('List of Attraction',
            style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
          Divider(),
          ListTile(
              title: Text('Ambulance Parking',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ambulance()));
              }
          ),
          ListTile(
              title: Text('Arch of Virtue and Knowledge',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> arch()));
              }
          ),
          ListTile(
              title: Text('Block Sign',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> blocksign()));
              }
          ),
          ListTile(
              title: Text('Bronze Sculpture of Confucius and Einstein',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CE()));
              }
          ),
          ListTile(
              title: Text('Ceiling Artifacts',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ceiling()));
              }
          ),
          ListTile(
              title: Text('Chess',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> chess()));
              }
          ),
          ListTile(
              title: Text('Confucius',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> confucius()));
              }
          ),
          ListTile(
              title: Text('Corridor',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> corridor()));
              }
          ),
          ListTile(
              title: Text('Description Block',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> descriptionBlock()));
              }
          ),
          ListTile(
              title: Text('Einstein',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> einstein()));
              }
          ),
          ListTile(
              title: Text('Ink Block',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> inkblock()));
              }
          ),
          ListTile(
              title: Text('Inviting Reception Pavilion',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TianYuanDiFang()));
              }
          ),
          ListTile(
            title: Text('Main Entrance',
              style: TextStyle(
                  fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> main_entrance()));
            }
          ),
          ListTile(
              title: Text('Moon Gate',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RoundWall()));
              }
          ),
          ListTile(
              title: Text('Staff Residence',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Staff()));
              }
          ),
          ListTile(
              title: Text('The Gesture',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> gesture()));
              }
          ),
          ListTile(
            title: Text('T&CM Centre',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TCM()));
              }
          ),
        ]
      ),
    );
  }
}


