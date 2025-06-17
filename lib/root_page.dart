import 'package:flutter/material.dart';
import 'package:projeto_/screens/search_page.dart';
import 'package:projeto_/screens/home_page.dart';
import 'package:projeto_/screens/profile.dart';
import 'package:projeto_/components/custom_navigationbar.dart';
import 'package:projeto_/screens/history_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          const SearchPage(),
          const HistoryPage(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}