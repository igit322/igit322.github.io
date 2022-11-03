import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Layout());
  }
}

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('레이아웃 연습!!'),
        ),
        body: ListView(
          // 이미지 섹션
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2022/04/29/14/28/woman-7163866_960_720.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
              // 이미지 꽉 채우는!
            ),

            // 타이틀섹션
            Container(
              padding: EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text('41'),
                ],
              ),
            ),

            // 버튼섹션
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    Text(
                      'CALL',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.near_me,
                      color: Colors.blue,
                    ),
                    Text(
                      'ROUTE',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                    Text(
                      'SHARE',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ],
            ),

            // Text Section
            Container(
              padding: EdgeInsets.all(32),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
        ));
  }
}
