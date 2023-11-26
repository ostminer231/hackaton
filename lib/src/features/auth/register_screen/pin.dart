import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackaton/src/constants/colors.dart';

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
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600,),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Text(
              'Введите 4-значное число, которое будет использоваться для входа в приложение',
              style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: pinController,
              decoration: InputDecoration(
                labelText: 'Введите ПИН-код',
                labelStyle: TextStyle(
                  fontSize: 18, // Установка размера шрифта для метки
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
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(342, 46),
                backgroundColor: primaryColor,
              ),
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

  ConfirmPINPage({super.key, required this.pin});

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
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: pinController,
              decoration: InputDecoration(
                labelText: 'Введите ПИН-код',
                labelStyle: TextStyle(fontSize: 18),
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
                  // ПИН-код подтвержден, действие при успешном подтверждении
                  Navigator.pushNamed(context, '/profile');
                } else {
                  // Показать ошибку, если PIN-код не совпадает
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Введенный ПИН-код не совпадает"),
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
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(342, 46),
                backgroundColor: primaryColor,
              ),
              child: Text('Подтвердить ПИН-код'),
            ),
          ],
        ),
      ),
    );
  }
}