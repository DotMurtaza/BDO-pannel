class BDOtodaysMeetingModels {
  String meetingabout;
  int time;
  BDOtodaysMeetingModels({
    this.meetingabout,
    this.time,
  });
}

List<BDOtodaysMeetingModels> todaysmeetings = [
  BDOtodaysMeetingModels(
    meetingabout: "Mobile application project",
    time: 3,
  ),
  BDOtodaysMeetingModels(
    meetingabout: "Web project",
    time: 10,
  ),
  BDOtodaysMeetingModels(
    meetingabout: "Data Science project",
    time: 5,
  ),
  BDOtodaysMeetingModels(
    meetingabout: "Word press project",
    time: 7,
  ),
  BDOtodaysMeetingModels(meetingabout: "React Native project", time: 12)
];
