import 'package:flutter/material.dart';
import 'package:flutter_simple_planner/models/plan.dart';

class PlanProvider extends ChangeNotifier {
  Map<String, List<Plan>> planMap = {};
  List<String> keyList = [];
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  String get parsedSelectedDay => selectedDay.year.toString() + '/' + selectedDay.month.toString() + '/' + selectedDay.day.toString();

  void addKey() {
    keyList.add(parsedSelectedDay);
    notifyListeners();
  }

  void changeSelectedDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }

  void changeFocusedDay(DateTime day) {
    focusedDay = day;
    notifyListeners();
  }

  void addPlan(Plan plan) {
    planMap[parsedSelectedDay]!.add(plan);
    notifyListeners();
  }
}