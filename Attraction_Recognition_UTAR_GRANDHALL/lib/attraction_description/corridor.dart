import 'package:flutter/material.dart';

class corridor extends StatelessWidget {
  const corridor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Corridor'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/corridor.jpg'),
              width: 400,
              height: 400,
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
              child: Text('The corridor is a long, narrow passageway that connects Block M to Block K, which is one of the way walk to Student Pavilion 2 which is one of the canteens at UTAR. The walls of the corridor are painted a neutral color, providing a clean and bright atmosphere. The floor is made of smooth, polished tiles that reflect the fluorescent lighting overhead, creating a well-lit space that is easy to navigate.'
                  '\n\nThe corridor is spacious enough to accommodate a large number of students walking to and from class, but not so wide that it feels empty or cavernous. Along the sides of the corridor, there are bulletin boards displaying announcements and notices from various student organizations, adding a vibrant and dynamic element to the space.',
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
