import 'package:flutter/material.dart';

class blocksign extends StatelessWidget {
  const blocksign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Block Sign'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/block_sign.jpg'),
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
              child: Text('The remarkable hall named after UTAR Chancellor Tun Dr Ling Liong Sik. Tun Dr Ling Liong Sik is a prominent figure in Malaysian politics and education. He was born on 6 August 1943 in Batu Pahat, Johor, Malaysia. He graduated with a Bachelor of Engineering degree from the University of Malaya in 1965 and later pursued a Master of Science degree in Structural Engineering at the University of California, Berkeley, in the United States.'
                  '\n\nIn 1971, Tun Ling joined the Malaysian Chinese Association (MCA), a political party representing the interests of the ethnic Chinese community in Malaysia. He was elected to the Malaysian Parliament in 1974, representing the constituency of Rasah in Negeri Sembilan. He served as Minister of Transport from 1986 to 1995 and as Minister of Trade and Industry from 1995 to 1999.'
                  '\n\nIn 2001, Tun Ling was appointed as the Chancellor of Universiti Tunku Abdul Rahman (UTAR), a private university in Malaysia. As Chancellor, he played a pivotal role in the development and growth of UTAR. He worked closely with the university''s management team and the Board of Trustees to improve the quality of education and research at the university.'
                  '\n\nUnder his leadership, UTAR expanded its academic programmes and established several new faculties and centres. The university also developed strong partnerships with industry and government agencies, leading to the establishment of research centres in areas such as renewable energy, biotechnology, and advanced materials.'
                  '\n\nTun Ling stepped down as UTAR Chancellor in 2019 after serving in the role for 18 years. During his tenure, he received numerous awards and honours for his contributions to education and the community, including the prestigious Tokoh Maal Hijrah award from the Malaysian government in 2012.'
                  '\n\nIn addition to his work in education and politics, Tun Ling has also been active in various community and charitable organisations. He is a respected figure in Malaysia and continues to be an influential voice on matters of national importance.',
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
