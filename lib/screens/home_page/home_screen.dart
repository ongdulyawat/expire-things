import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/screens/home_page/widgets/food_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.bgBackground,
      body: FoodCard(),
    );
  }
}
