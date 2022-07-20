class BDOnotificationModel {
  String notification;
  String time;
  BDOnotificationModel({
    this.notification,
    this.time,
  });
}

List<BDOnotificationModel> notification = [
  BDOnotificationModel(
      notification:
          'Abrar Ahmad is inviting you in a meeting of an Android Mobile application.',
      time: '3.00 Pm'),
  BDOnotificationModel(
      notification:
          'Amad Zahid is inviting you in a meeting of an IOS Mobile application.',
      time: '7.12 Pm'),
  BDOnotificationModel(
      notification:
          'Ihtisham Javed is inviting you in a meeting of a Web Project.',
      time: '1.49 Am'),
  BDOnotificationModel(
      notification:
          'Ahmad Ali is inviting you in a meeting of a Data Science Project.',
      time: '10.42 Pm'),
  BDOnotificationModel(
      notification:
          'Usama ashraf is inviting you in a meeting of a React JS project.',
      time: '12.00 Pm'),
];
