import 'package:flutter/material.dart';

class TCM extends StatelessWidget {
  const TCM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('T&CM Centre'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/T&CM.png'),
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
              child: Text('Traditional and Complementary Medicine Centre (TCM). '
                  'The hospital will consist of an initial phase of 100 beds for TCM and a future phase of additional 250 beds. '
                  'There are multiple services provided by TCM such as TCM Internal Medicine, Acupuncture & Moxibustion, Tuina, TCM Oncology, '
                  'Gynecology, TCM Pediatric, TCM Dermatology, TCM Rehabilitation, TCM ENT, Ayurvedic Medicine, Traditional Malay Medicine and '
                  'Counselling Services. \n\nBesides, UTAR Hospital T&CM Centre caters for patients by providing affordable, clean and quality accommodation. '
                  'There are three room type provided for patients, Four-bedded room, Twin-bedded room, Standard single room and the prices of room rates per night '
                  'are RM 60, RM 120, RM 250 respectively. ',
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
