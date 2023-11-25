import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:hackaton/src/constants/colors.dart';

void main() => runApp(const Profile());


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarApp();
  }
}

class Page_1 extends StatelessWidget {
  const Page_1({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserHeader(),
        UserTitles(),
      ],
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: ListTile(
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
        child: Column(
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  print('Карточка нажата');
                },
                child: const ListTile(
                  leading: Icon(Icons.account_circle, size: 42, color: grayColorDark),
                  title: Text(
                    'Редактировать профиль',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Имя, номер телефона, почта...',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  isThreeLine: true,
                ),
              ),
            ),

            Card(
              child: InkWell(
                onTap: () {
                  // Действие при нажатии на карточку
                  print('Карточка Документы нажата');
                },
                child: const ListTile(
                  leading: Icon(Icons.add_chart_outlined, size: 42, color: grayColorDark),
                  title: Text(
                    'Документы',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Документы об образовании',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  isThreeLine: true,
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0), // Установка внутреннего отступа
                child: InkWell(
                  onTap: () {
                    // Действие при нажатии на карточку
                    print('Карточка Выход нажата');
                  },
                  child: const ListTile(
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
            )

          ],
        )
    );
  }
}

class Page_2 extends StatelessWidget {
  const Page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
        SizedBox(
          height: 40,
        ),
        CompanyTile(
          icon: 'assets/images/HomePage/arpicon.png', // Путь к вашему локальному файлу иконки в формате PNG
          title: 'Arpicon',
          onTap: () {
            // Обработка нажатия
          },
        ),
        CompanyTile(
          icon: 'assets/images/HomePage/shipyard.png',
          title: 'ЩЕРБИНСКИЙ ЛИФТОСТРОИТЕЛЬНЫЙ ЗАВОД',
          onTap: () {
            // Обработка нажатия
          },
        ),
        CompanyTile(
          icon: 'assets/images/HomePage/avialift.png',
          title: 'Avialift',
          onTap: () {
            // Обработка нажатия
          },
        ),
        CompanyTile(
          icon: 'assets/images/HomePage/eonessi.png',
          title: 'Eonessi',
          onTap: () {
            // Обработка нажатия
          },
        ),
      ],
    );
  }
}

class CompanyTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const CompanyTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
            icon,
            width: 50,
            height: 50,
        ), // Использование Image.asset для PNG/JPG иконок
        title: Text(title),
        trailing: IconButton(
          icon: const Icon(
            IconData(0xe09c, fontFamily: 'MaterialIcons', matchTextDirection: true),
            color: Color(0xff0560FA),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Вакансии';
      case 1:
        return 'Услуги';
      case 2:
        return 'Профиль';
      default:
        return 'Страница';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [ // Экран Главное
      const Page_2(), // Экран Вакансий
      const Center(child: Text('Saved Screen')),
      const Page_1(), // Экран Профиль
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitle(currentPageIndex), // Здесь вызываем функцию для установки заголовка
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Вакансии',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Услуги',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle_outlined),
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Профиль',
          ),
        ],
      ),
      body: _pages[currentPageIndex], // Отображение выбранной страницы
    );
  }
}



