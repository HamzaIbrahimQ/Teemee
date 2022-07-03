// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:teemee/Core/Style.dart';
// import 'package:teemee/Core/Widgets/MainButton.dart';
// import 'package:teemee/Ui/BasePage/BasePage.dart';
// import 'package:teemee/Utils/AppSnackBar.dart';
//
// import 'package:teemee/Utils/SizeConfig.dart';
// import 'package:teemee/data/sharedPref_helper/SharedPrefHelper.dart';
// import 'package:teemee/generated/l10n.dart';
// import 'package:teemee/injections.dart';
// import 'package:twilio_flutter/twilio_flutter.dart';
//
// class PhoneAuthPage extends StatefulWidget {
//   PhoneAuthPage(this.phoneNumber, this.sentAlready, {Key key})
//       : super(key: key);
//   final String phoneNumber;
//   final bool sentAlready;
//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }
//
// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//   @override
//   void initState() {
//     textEditingController = TextEditingController(text: widget.phoneNumber);
//     showResend = widget.sentAlready;
//     super.initState();
//     twilioFlutter = TwilioFlutter(
//         accountSid: 'AC519e70152e228e00cea77dd605e382d5',
//         authToken: '2d6393e34fe16b2994d3724a0ac03ac4',
//         twilioNumber: '+13236498162');
//     if (!widget.sentAlready) {
//       sendCode();
//     } else {
//       getOldCode();
//     }
//   }
//
//   getOldCode() async {
//     generatedCode = await sl<PrefsHelper>().getPhoneCode();
//     print(generatedCode);
//     setState(() {});
//   }
//
//   TwilioFlutter twilioFlutter;
//   Random random = Random();
//
//   bool showResend;
//   String generatedCode;
//   sendCode() async {
//     numberOfMessages++;
//     generatedCode = random.nextInt(1000000000).toString();
//     print(generatedCode);
//     sl<PrefsHelper>().setPhoneCode(generatedCode);
//
//     int result = await twilioFlutter.sendSMS(
//         toNumber: widget.phoneNumber, messageBody: generatedCode);
//     setState(() {});
//     if (result == 201) {
//       sl<PrefsHelper>().setNeedVerify(true);
//
//       Future.delayed(Duration(seconds: 3)).then((value) {
//         setState(() {
//           showResend = true;
//         });
//       });
//     } else
//       AppSnackBar.show(context, "Error $result", ToastType.Error);
//   }
//
//   String code;
//   TextEditingController textEditingController;
//   resendCode() async {
//     setState(() {
//       showResend = false;
//     });
//     if (numberOfMessages <= 3)
//       sendCode();
//     else
//       AppSnackBar.show(context, "too many attempts", ToastType.Error);
//   }
//
//   int numberOfMessages = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Verifying Phone number."),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: SizeConfig.h(100),
//           ),
//           Text("Please enter the code that was sent to ${widget.phoneNumber}."),
//           // Padding(
//           //   padding: const EdgeInsets.all(15.0),
//           //   child: Row(
//           //     children: [
//           //       Expanded(
//           //         child: TextFormField(
//           //           controller: textEditingController,
//           //           decoration: InputDecoration(
//           //             border: OutlineInputBorder(),
//           //           ),
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(), hintText: "*******"),
//                     onChanged: (c) {
//                       setState(() {
//                         code = c;
//                       });
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//           generatedCode == null
//               ? CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
//                 )
//               : MainButton(
//                   text: "Continue",
//                   onTap: () async {
//                     if (code == generatedCode) {
//                       sl<PrefsHelper>().setNeedVerify(false);
//
//                       AppSnackBar.show(context, "Phone Authentication Success.",
//                           ToastType.Success);
//                       sl<PrefsHelper>().setIsLogin();
//
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => BasePage()));
//                     } else {
//                       AppSnackBar.show(context, "Wrong Code.", ToastType.Error);
//                     }
//                   }),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 S.of(context).have_account,
//                 style: TextStyle(fontSize: SizeConfig.w(14)),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   " " + S.of(context).login,
//                   style: TextStyle(
//                       fontSize: SizeConfig.w(14),
//                       color: secondryColor,
//                       decoration: TextDecoration.underline),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
