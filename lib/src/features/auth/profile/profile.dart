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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/icons/user.png'),
            radius: 35,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carlo Marcs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Статус: в поиске',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserTitles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildUserTile(
            context,
            icon: Icons.account_circle,
            title: 'Редактировать профиль',
            subtitle: 'Имя, номер телефона, почта...',
            onTap: () => print('Карточка Редактировать профиль нажата'),
          ),
          _buildUserTile(
            context,
            icon: Icons.add_chart_outlined,
            title: 'Документы',
            subtitle: 'Документы об образовании',
            onTap: () => print('Карточка Документы нажата'),
          ),
          _buildUserTile(
            context,
            icon: Icons.output,
            title: 'Выход',
            subtitle: '',
            onTap: () => print('Карточка Выход нажата'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 42, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 14)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff0560FA),
        ),
        onTap: onTap,
      ),
    );
  }
}

class mainInfo extends StatelessWidget {
  const mainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Вакансии',
            // Здесь вызываем функцию для установки заголовка
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
        body: Column(
          children: [
            cUserHeader(),
          ],
        ));
  }
}

class cUserHeader extends StatelessWidget {
  const cUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/HomePage/arpicon.png'),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carlo Marcs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Статус: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
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
            ],
          ),
        ],
      ),
    );
  }
}

class Page_2 extends StatelessWidget {
  const Page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        CompanyTile(
          icon: 'assets/images/HomePage/arpicon.png',
          title: 'Arpicon',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainInfo()),
            );
          },
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/shipyard.png',
          title: 'ЩЕРБИНСКИЙ ЛИФТОСТРОИТЕЛЬНЫЙ ЗАВОД',
          onTap: () {},
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/avialift.png',
          title: 'Avialift',
          onTap: () {},
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/eonessi.png',
          title: 'Eonessi',
          onTap: () {},
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff0560FA),
            ),
          ],
        ),
      ),
    );
  }
}

class Page_3 extends StatelessWidget {
  const Page_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        children: const [
          ServiceCard(title: 'Монтажник', route: '/AvailableVacation'),
          SizedBox(height: 10),
          ServiceCard(
              title: 'Техник по обслуживанию', route: '/AvailableVacation'),
          SizedBox(height: 10),
          ServiceCard(
              title: 'Программист оборудования', route: '/AvailableVacation'),
          SizedBox(height: 10),
          ServiceCard(
              title: 'Инженер-конструктор', route: '/AvailableVacation'),
          SizedBox(height: 10),
          ServiceCard(
              title: 'Менеджер по продукции', route: '/AvailableVacation'),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String route;

  const ServiceCard({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Установка elevation в 0 убирает тень
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff0560FA),
        ),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: NavigationExample());
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
    final List<Widget> _pages = [
      // Экран Главное
      const Page_2(), // Экран Вакансий
      const Page_3(), // Услуги
      const Page_1(), // Экран Профиль
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitle(currentPageIndex),
          // Здесь вызываем функцию для установки заголовка
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
