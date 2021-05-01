import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/presentations/screens/home_screen.dart';
import 'package:weather_app/presentations/screens/weather_screen.dart';
import 'package:weather_app/presentations/screens/welcome_screen.dart';

class BottomNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  final List<TabItem> _tabItems = [
    TabItem(
      icon: const Icon(Icons.ad_units_rounded),
      title: 'Welcome',
      widget: WelcomeScreen(),
    ),
    TabItem(
      icon: const Icon(Icons.home),
      title: 'Home',
      widget: HomeScreen(),
    ),
    TabItem(
      icon: const Icon(Icons.map),
      title: 'Weather',
      widget: WeatherScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _tabItems[_selectedIndex].widget,
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        ..._tabItems.map((item) =>
            BottomNavigationBarItem(icon: item.icon, label: item.title))
      ],
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      onTap: _onItemTapped,type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class TabItem {
  final Icon icon;
  final String title;
  final Widget widget;

  TabItem({
    @required this.icon,
    @required this.title,
    @required this.widget,
  })  : assert(icon != null),
        assert(widget != null),
        assert(title != null);
}
