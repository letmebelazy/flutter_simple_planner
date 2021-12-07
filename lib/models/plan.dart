enum PlanType {
  schedule,
  deadline,
}

class Plan {
  PlanType type;
  String time;
  String title;
  Plan(this.type, this.time, this.title);
}
