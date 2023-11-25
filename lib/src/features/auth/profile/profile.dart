import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    UserTitles(), // Экран профиля пользователя
    Text('Страница 2'), // Замените на ваши виджеты
    Text('Страница 3'), // Замените на ваши виджеты
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text(
          'Профиль',
          style: TextStyle(
              color: primaryColor
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 1,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            selectedIcon: Icon(Icons.account_circle_outlined),
            label: 'Профиль',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings_outlined),
            label: 'Настройки',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            selectedIcon: Icon(Icons.info_outline),
            label: 'Информация',
          ),
        ],
      ),
    );
  }
}


class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/icons/user.png'),
          backgroundColor: grayColorLight,
          radius: 35,
        ),
        title: Text('Ken Nwaeze'),
        subtitle: Row(
          children: [
            Text(
              'Статус: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'в поиске',
              style: TextStyle(
                fontSize: 16,
                color: successColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class UserTitles extends StatefulWidget {
  const UserTitles({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTitles();
  }
}

class _UserTitles extends State<UserTitles> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: const Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.account_circle, size: 42, color: grayColorDark,),
                title: Text(
                  'Редактировать профиль',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle:
                Text(
                  'Имя, номер телефона, почта...',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
                isThreeLine: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add_chart_outlined, size: 42, color: grayColorDark,),
                title: Text(
                  'Документы',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle:
                Text(
                  'Документы об образовании',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
                isThreeLine: true,
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0), // Установка внутреннего отступа
                child: ListTile(
                  leading: Icon(Icons.output, size: 42, color: errorColor),
                  title: Text(
                    'Выход',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward), // Добавлена иконка стрелки
                ),
              ),
            ),
          ],
        )
    );
  }
}

