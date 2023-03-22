import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/screens/add_product/add_product_screen.dart';
import 'package:expire_app/screens/calendar/calendar_screen.dart';
import 'package:expire_app/screens/home_page/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final screens = [
    const HomeScreen(),
    const AddProductScreen(),
    const CalendarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Styles.bgStartApp,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: const BackButton(color: Colors.transparent,),
        title:
        const Text("Expire Things", style: TextStyle(color: Styles.colorStartApp)),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Styles.bgStartApp,
        animationDuration: const Duration(milliseconds: 300),
        index: index,
        onTap: (index) => setState(() {
          this.index  = index;
        }),
        items: const [
          Icon(Icons.home, color: Styles.colorStartApp, size: 35),
          Icon(Icons.add_circle_outline, color: Styles.colorStartApp, size: 35),
          Icon(Icons.calendar_month_outlined, color: Styles.colorStartApp, size: 35),
        ],
      ),
    );
  }
}
