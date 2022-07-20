import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:bdo_pannel/controllers/auth_controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class SigninScreen extends StatelessWidget {
  final userController =
      Get.put(UserController()); //Get.find<UserController>();
  final ClientMeetingController clientMeetingController =
      Get.put(ClientMeetingController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print("user id is ${userController.users.uid}");
    // SizeConfig.initSize(context);
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPadding * 1.5,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Sign in",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            const SizedBox(height: kPadding),
                            BDOinputField(
                              validator: (value) {
                                if (!GetUtils.isEmail(value))
                                  return 'Invalid Email';
                                else
                                  return null;
                              },
                              maxLines: 1,
                              hint: "mail@example.com",
                              label: 'Email',
                              textInputType: TextInputType.emailAddress,
                              controller: userController.emailTextController,
                            ),
                            const SizedBox(height: kPadding * 0.75),
                            BDOinputField(
                              validator: (value) {
                                if (value.length < 6)
                                  return 'Password is short';
                                else
                                  return null;
                              },
                              maxLines: 1,
                              hint: "Password",
                              label: 'Password',
                              textInputType: TextInputType.visiblePassword,
                              controller: userController.passwordTextController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: kPadding,
                        top: kPadding,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot your password?',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kPrimaryColor,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: kPadding * 2.5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: BDOmyButton(
                        width: SizeConfig.screenWidth,
                        color: kPrimaryColor,
                        label: "Sign In",
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            userController.login(
                                userController.emailTextController.text,
                                userController.passwordTextController.text);
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.caption,
                          children: [
                            TextSpan(
                              text: 'REGISTER',
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: kPrimaryColor,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

// class SizeTransition4 extends PageRouteBuilder {
//   final Widget page;

//   SizeTransition4(this.page)
//       : super(
//           pageBuilder: (context, animation, anotherAnimation) => page,
//           transitionDuration: Duration(milliseconds: 1000),
//           reverseTransitionDuration: Duration(milliseconds: 200),
//           transitionsBuilder: (context, animation, anotherAnimation, child) {
//             animation = CurvedAnimation(
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 parent: animation,
//                 reverseCurve: Curves.fastOutSlowIn);
//             return Align(
//               alignment: Alignment.centerLeft,
//               child: SizeTransition(
//                 axis: Axis.horizontal,
//                 sizeFactor: animation,
//                 child: page,
//                 axisAlignment: 0,
//               ),
//             );
//           },
//         );
// }
