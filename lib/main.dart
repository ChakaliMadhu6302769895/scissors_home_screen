import 'package:flutter/material.dart';
import 'package:scissors_home_screen/screens/categorieslist_screen.dart';
import 'models/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row(
              children: [
               Padding(padding: EdgeInsets.only(left: 20.0)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "images/Scissors logo.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15)),
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
                  "Services",
                    style:AppFonts.getHeadingStyle()
                )
              ],
            ),
            Expanded(
              child: CategoriesListScreen(),
            ),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
