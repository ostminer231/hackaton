import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Функции, которые будут вызываться при нажатии на кнопки
  void function1() {

  }

  void function2() {

  }

  void function3() {

  }

  // Виджет для создания кнопки с текстом и функцией
  Widget buildButton(String buttonText, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Множество кнопок'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton("Регистрация", function1),
            SizedBox(height: 20),
            buildButton("Вход", function2),
            SizedBox(height: 20),
            buildButton("Профиль", function3),
            // Добавьте дополнительные кнопки, если нужно
          ],
        ),
      ),
    );
  }
}