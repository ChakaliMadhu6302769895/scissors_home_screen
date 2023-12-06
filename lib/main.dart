import 'package:flutter/material.dart';
import 'package:scissors_home_screen/models/theme.dart';
import 'package:scissors_home_screen/screens/categorieslist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [

            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("images/Background image.jpg"),
                  fit:BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255,255, 0.8)
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 35.0)),
                    ClipRRect(
                      child: Image.asset(
                        "images/Scissors_Main_logo-removebg-preview.png",
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "Scissor's",
                     style: AppFonts.getHeadingStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Services", style: AppFonts.getHeadingStyle(),
                    )
                  ],
                ),
                Expanded(
                  child: CategoriesListScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
