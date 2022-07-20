import 'package:bdo_pannel/Binding/auth_binding.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/SplashScreen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'SizeConfig/size_config.dart';
import 'Views/BDOviews/BDOscreens/BDObottomNavBar/BDO_bottom_nav_bar.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
      Get.off(() => BDObottomNaveBar());
    } else {
      print("palyload is null");
    }
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // configOneSignel();
  }

//   void configOneSignel() {
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//     OneSignal.shared.setAppId(kAppid);

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//     //   print("Accepted permission: $accepted");
//     // });
//     OneSignal.shared.setNotificationWillShowInForegroundHandler(
//         (OSNotificationReceivedEvent event) {
//       //Get.to(() => ConfirmClients());
//       // Will be called whenever a notification is received in foreground
//       // Display Notification, pass null param for not displaying the notification
//       event.complete(event.notification);
//     });
//     OneSignal.shared
//         .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//       Get.to(() => ConfirmClients());
//       // Will be called whenever a notification is opened/button pressed.
//     });
//     OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//       // Will be called whenever the permission changes
//       // (ie. user taps Allow on the permission prompt in iOS)
//     });
//     OneSignal.shared
//         .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//       // Will be called whenever the subscription changes
//       // (ie. user gets registered with OneSignal and gets a user ID)
//     });
//     OneSignal.shared.setEmailSubscriptionObserver(
//         (OSEmailSubscriptionStateChanges emailChanges) {
//       // Will be called whenever then user's email subscription changes
//       // (ie. OneSignal.setEmail(email) is called and the user gets registered
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return GetMaterialApp(
          initialBinding: AuthBinding(),
          title: "BDO Management",
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ),
          debugShowCheckedModeBanner: false,
          home:
              // HomePage()
              //DateTimePiker()
              //AlarmPage(),
              SplashScreen(),
        );
      });
    });
  }
}
