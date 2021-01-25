import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';
import 'package:music_player/components/album_art.dart';
import 'package:music_player/components/naivagationBar.dart';
import 'package:music_player/components/playerControls.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderValue = 2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          NavBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AlbumArt();
                }),
          ),
          Text(
            "Gidget",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            "The Free Nationals",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: darkPrimaryColor),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),

            ),
            child: Slider(
              value: sliderValue,
              activeColor:darkPrimaryColor ,
              inactiveColor: darkPrimaryColor.withOpacity(0.5),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              min: 0,
              max: 20,
            ),
          ),

          PlayerControls(),
          SizedBox(height: 100,)

        ],
      ),
    );
  }
}
