import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackaton/src/features/auth/profile/profile.dart';

import 'package:hackaton/src/constants/colors.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: ServicesPage(),

    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YourCustomHeader(),
          SizedBox(height: 16), // Add some space between the headers
          ServicesMontage(),
          SizedBox(height: 10),
          ServicesTechnician(),
          SizedBox(height: 10),
          ServicesProgrammer(),
          SizedBox(height: 10),
          ServicesEngineer(),
          SizedBox(height: 10),
          ServicesMeneger()
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
          SizedBox(width: 138), // Add space between icon and text
          Transform.translate(
            offset: Offset(0, 33), // Move text lower
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Услуги',
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

class ServicesMontage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/AvailableVacation'); // Replace YOUR_ROUTE_NAME with the actual route name
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
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Монтажник',
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

class ServicesTechnician extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Техник по обслуживания',
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
    );
  }
}

class ServicesProgrammer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Программист оборудования',
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
    );
  }
}

class ServicesEngineer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Инженер-конструктор',
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
    );
  }
}

class ServicesMeneger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Менеджер по продукции',
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
    );
  }
}


