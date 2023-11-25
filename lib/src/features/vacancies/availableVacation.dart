import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackaton/src/features/auth/profile/profile.dart';

import 'package:hackaton/src/constants/colors.dart';

class AvailableVacation extends StatefulWidget {
  const AvailableVacation({Key? key}) : super(key: key);

  @override
  _AvailableVacationState createState() => _AvailableVacationState();
}

class _AvailableVacationState extends State<AvailableVacation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YourCustomHeader(),
          SizedBox(height: 16), // Add some space between the headers
          FirstPerson(),
          SizedBox(height: 16),
          SecondPerson(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class YourCustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(width: 10), // Add some space on the left
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/TEST');
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
            },
            child: Transform.translate(
              offset: Offset(0, 32), // Move icon down
              child: Icon(
                IconData(0xe094, fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Color(0xff0560FA),
              ),
            ),
          ),
          SizedBox(width: 115), // Add space between icon and text
          Transform.translate(
            offset: Offset(0, 33), // Move text lower
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Монтажники',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor, // Change to the desired color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/'); // Replace YOUR_ROUTE_NAME with the actual route name
        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
      },
      child: Container(
        height: 50,
        width: 362,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                'Абдул Денис',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                IconData(0xe09c, fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Color(0xff0560FA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/'); // Replace YOUR_ROUTE_NAME with the actual route name
        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
      },
      child: Container(
        height: 50,
        width: 362,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                'Иванов Иван',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                IconData(0xe09c, fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Color(0xff0560FA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
