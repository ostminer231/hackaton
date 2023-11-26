import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  String selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Role Page',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Заполните поля для дальнейшей работы',
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildCard('СОИСКАТЕЛЬ', Colors.blue.withOpacity(0.7)),
                SizedBox(height: 10),
                _buildCard('СОИСКАТЕЛЬ-БРИГАДИР', Colors.green.withOpacity(0.7)),
                SizedBox(height: 10),
                _buildCard('РАБОТОДАТЕЛЬ', Colors.red.withOpacity(0.7)),
                SizedBox(height: 20),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = text;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          color: selectedRole == text ? primaryColor : grayColorLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: selectedRole == text ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: selectedRole.isNotEmpty ? () {
          // Обработка нажатия кнопки "Далее"
        } : null,
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Text('Далее', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}