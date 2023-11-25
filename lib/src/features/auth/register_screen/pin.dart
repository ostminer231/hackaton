import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PIN_page extends StatefulWidget {
  const PIN_page({super.key});

  @override
  _PINPageState createState() => _PINPageState();
}

class _PINPageState extends State<PIN_page> {
  late TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Установите ПИН-код',
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Text(
              'Введите 4-значное число, которое будет использоваться для входа в приложение',
              style: TextStyle(fontSize: 20.0, color: Colors.black.withOpacity(0.5)),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: pinController,
              decoration: InputDecoration(
                labelText: 'Введите ПИН-код',
                labelStyle: TextStyle(
                  fontSize: 20, // Установка размера шрифта для метки
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                String enteredPin = pinController.text;
                if (enteredPin.length == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmPINPage(pin: enteredPin)),
                  );
                } else {
                  // Показать ошибку, если PIN-код недостаточной длины
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("PIN-код должен состоять из 4 цифр"),
                        actions: [
                          TextButton(
                            child: Text('ОК'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              // Ваши стили для ElevatedButton
              child: Text('Установить PIN-код'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPINPage extends StatelessWidget {
  final String pin;
  final TextEditingController pinController = TextEditingController();

  ConfirmPINPage({required this.pin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Подтвердите ваш ПИН-код',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: pinController,
              decoration: InputDecoration(
                labelText: 'ПИН-код',
                labelStyle: TextStyle(
                  fontSize: 20, // Установка размера шрифта для метки
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                if (pinController.text == pin) {
                  // Показать диалоговое окно с подтверждением
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("PIN-код подтвержден!"),
                        actions: [
                          TextButton(
                            child: Text('ОК'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Закрыть диалоговое окно
                              Navigator.pushNamed(context, '/profile'); // Переход на страницу профиля
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Показать сообщение об ошибке
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Неверный PIN-код"),
                        actions: [
                          TextButton(
                            child: Text('Повторить'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Подтвердить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}