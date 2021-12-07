import 'package:flutter/material.dart';
import 'package:flutter_simple_planner/models/plan.dart';
import 'package:flutter_simple_planner/providers/plan_provider.dart';
import 'package:flutter_simple_planner/widgets/planner_custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Planner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlanProvider p = Provider.of<PlanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: p.keyList.length,
          itemBuilder: (_, index) {
            return PlanListTile(p, index);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.black,),
          onPressed: ()=> showDialog(
            context: context,
            builder: (_) {
              return ChangeNotifierProvider.value(
                value: p,
                child: Consumer<PlanProvider>(
                  builder: (context, model, child) {
                    String tempValue = '';
                    return Dialog(
                      child: Container(
                        height: 460.0,
                        child: Column(
                          children: [
                            TableCalendar(
                              focusedDay: p.focusedDay,
                              firstDay: DateTime.utc(2000, 01, 01),
                              lastDay: DateTime.utc(2050, 12, 31),
                              headerStyle: HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false),
                              selectedDayPredicate: (day) {
                                return isSameDay(p.selectedDay, day);
                              },
                              onDaySelected: (sDay, fDay) {
                                p.changeFocusedDay(fDay);
                                p.changeSelectedDay(sDay);
                              },
                            ),
                            Container(
                              width: double.infinity,
                              height: 115.0,
                              child: Column(
                                children: [
                                  Text(p.parsedSelectedDay),
                                  TextField(
                                    onChanged: (value) {
                                      tempValue = value;
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      p.keyList.add(p.parsedSelectedDay);
                                      if (p.planMap[p.parsedSelectedDay] == null) {
                                        p.planMap[p.parsedSelectedDay] = [];
                                        p.addPlan(Plan(PlanType.schedule, '20:00', tempValue));
                                      } else {
                                        p.addPlan(Plan(PlanType.schedule, '20:00', tempValue));
                                      }
                                      print(p.keyList);
                                      print(p.planMap);
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK', style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          )
      ),
    );
  }
}
