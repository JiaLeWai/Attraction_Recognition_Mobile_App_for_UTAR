import 'package:flutter/material.dart';
import 'dummyAttraction.dart';

class AttractionGrid extends StatelessWidget {
  final Data data;
  final double h;
  final double w;

  const AttractionGrid({required this.data, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: GridView.builder(
        itemCount: data.allattraction.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(data.allattraction[index]['name']),
                  content: SingleChildScrollView(
                    child: Text(
                      data.allattraction[index]['description'],
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[600],
              ),
              height: h * 0.9,
              width: w * 0.3,
              child: Column(
                children: [
                  Container(
                    height: h * 0.12,
                    width: w,
                    child: Image(
                      image: AssetImage(data.allattraction[index]['image']),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: Text(
                      data.allattraction[index]['name'],
                      maxLines: null,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        "${data.allattraction[index]['distance']} KM",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}