import 'package:flutter/material.dart';

import '../navigation/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.navigator, required this.selectedTab, super.key});

  final Widget navigator;
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigator,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            CreateIssueRoute().go(context);
          } else {
            IssuesRoute().go(context);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Добавить заявку'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Список заявок'),
        ],
        currentIndex: selectedTab,
      ),
    );
  }
}
