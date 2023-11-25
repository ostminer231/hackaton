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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Заполните поля для дальнейшей работы',
                      style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(height: 16),
                    _buildCard('СОИСКАТЕЛЬ', Colors.blue.withOpacity(0.7)),
                    SizedBox(height: 10),
                    _buildCard('СОИСКАТЕЛЬ-БРИГАДИР', Colors.blue.withOpacity(0.7)),
                    SizedBox(height: 10),
                    _buildCard('РАБОТОДАТЕЛЬ', Colors.blue.withOpacity(0.7)),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: selectedRole.isNotEmpty
                            ? () {
                          // Обработка нажатия кнопки "Далее" в зависимости от выбранной роли
                          if (selectedRole == 'СОИСКАТЕЛЬ') {
                            // Перейти на страницу для СОИСКАТЕЛЯ
                            Navigator.pushNamed(context, '/session_2/register');
                          } else if (selectedRole == 'СОИСКАТЕЛЬ-БРИГАДИР') {
                            // Перейти на страницу для СОИСКАТЕЛЯ-БРИГАДИРА
                            Navigator.pushNamed(context, '/brigadier_applicant_page');
                          } else if (selectedRole == 'РАБОТОДАТЕЛЬ') {
                            // Перейти на страницу для РАБОТОДАТЕЛЯ
                            Navigator.pushNamed(context, '/employer_page');
                          }
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text('Далее', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
        width: 326,
        height: 105,
        decoration: BoxDecoration(
          color: selectedRole == text ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedRole == text ? Colors.blue : Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: selectedRole == text ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
