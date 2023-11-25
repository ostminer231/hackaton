import 'package:flutter/material.dart';
import 'package:hackaton/src/constants/colors.dart';
import 'package:hackaton/src/features/auth/profile/profile.dart';

class Vacancies extends StatefulWidget {
  const Vacancies({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Vacancies();
  }
}

class _Vacancies extends State<Vacancies> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacancies Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Вакансии',
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: primaryColor,),
            onPressed: () {},
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: NavigationBarApp(),
      ),
    );
  }
}

class Page_2 extends StatelessWidget {
  const Page_2({super.key});
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

    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Page_1(), // Экран Explore
      Page_2(), // Экран Commute
      Center(child: Text('Saved Screen')),   // Экран Saved
      Center(child: Text('Saved Screen')),   // Экран Saved
    ];

    return Scaffold(
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
            label: 'Главное',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Услуги',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore_outlined),
            icon: Icon(Icons.explore),
            label: 'Вакансии',
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