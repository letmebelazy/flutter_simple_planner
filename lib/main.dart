import 'package:flutter/material.dart';
import 'package:flutter_simple_planner/providers/plan_provider.dart';
import 'package:flutter_simple_planner/screens/planner.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlanProvider>(
      create: (context) => PlanProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Planner(),
      ),
    );
  }
}
