import 'package:flutter/material.dart';
import 'package:pesa/widgets/invest_screen.dart';
import 'package:pesa/widgets/news_screen.dart';
import 'package:pesa/widgets/spends_screen.dart';
import 'package:pesa/widgets/trends_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const _screens = [
    SpendsScreen(),
    InvestScreen(),
    TrendsScreen(),
    NewsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() {
                _selectedIndex = value;
              }),
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_outlined),
              label: 'Spends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_outlined),
              label: 'Invest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_outlined),
              label: 'Trends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined),
              label: 'News',
            ),
          ]),
      body: SafeArea(child: _screens[_selectedIndex]),
    );
  }
}
