import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 50, 100),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25,),

              // shop name
              Text(
                "Bazaar of  HSIs",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25,),

              // icon
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Image.asset('lib/images/satellite (4).png'),
              ),

              const SizedBox(height: 25,),

              // title
              Text(
                'EVERYTHING ABOUT HSIs HERE',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              // subtitle
              Text(
                'You can find any data and algorithms related to hyperspectral image processing.',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 15,
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),

              const SizedBox(height: 25,),

              // get strated button
              MyButton(
                text: "Get Started",
                onTap: (){
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          )
      )

    );
  }
}