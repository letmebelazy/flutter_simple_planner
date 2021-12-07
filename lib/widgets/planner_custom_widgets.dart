import 'package:flutter/material.dart';
import 'package:flutter_simple_planner/providers/plan_provider.dart';

class PlanListTile extends StatelessWidget {
  final PlanProvider p;
  final int index;
  PlanListTile(this.p, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(p.keyList[index]),
          for (int i = 0; i < p.planMap[p.keyList[index]]!.length; i++) ...[
            Text(p.planMap[p.keyList[index]]![i].title)
          ]
        ],
      ),
    );
  }
}
