import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scissors_home_screen/screens/categorieslist_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.cyan[700],//blueGrey[700],
          body: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10.0,)),

                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    ClipRRect(
                     borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "images/logo scissors project.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 8,),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "Scissor's",
                     style: GoogleFonts.robotoMono(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Services",
                     style: GoogleFonts.courierPrime(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),
                    )
                  ],
                ),
                Expanded(
                  child: CategoriesListScreen(),
                ),
              ]
          ),
        ));
  }
}