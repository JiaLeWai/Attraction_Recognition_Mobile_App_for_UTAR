import 'package:flutter/material.dart';

class arch extends StatelessWidget {
  const arch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Arch of Virtue and Knowledge'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/archvirtue.jpg'),
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
              child: Text('Located at both entrances of the UTAR Kampar Campus, each arch is designed in the form of two inclined intersecting steel structures that form one single stable portal. The two arches express the structural form in its utmost simplicity, pureness, and wholeness.'
                  '\n\nThe merging of the two inclined intersecting steel structures into one arch signifies the unity of theory and practice resulting in the birth of dynamism and innovation. It also signifies UTAR’s wholesome education in technical competency and morality. Each arch, in its pure structural form, when viewed from below and above, visualises a pair of wings taking flight, symbolising success upon acquiring knowledge.'
                  '\n\nThe resultant arch at both entrances of the Kampar Campus is simple in appearance but complex in construction. Each arch is constructed from approximately 45 tonnes of mild steel tubes. The colourful lighting at night symbolises harmony within the multi-racial, multi-ethnic and international community of UTAR.',
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
