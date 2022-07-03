import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:temee_app/SignUp.dart';


import '../AppSnackBar.dart';

import '../SizeConfig.dart';
import '../Style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Timer? timer;
  double waveRadius = 0.0;
  double waveGap = 95.0;
  Animation<double>? _animation;
  late AnimationController controller;
  Animation<double>? _loginAnimation;
  late AnimationController loginController;
  Animation? _loginScaleAnimation;
  Animation? _loginOpacityAnimation;
  int currentPage = 1;
  String phone = '';
  bool showPassword = false;
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    AppSnackBar.appContext = context;
    loginController = AnimationController(vsync: this);
    controller = AnimationController(vsync: this);

    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    controller.forward();
    loginController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _loginAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: loginController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    _loginOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(loginController);
    _loginScaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: loginController));

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (2 < 4) {
        animationStarted = true;
        isLogged = true;
        if (controller.status == AnimationStatus.completed ||
            controller.status == AnimationStatus.dismissed) {
          controller.reset();
          controller.forward();
        }
        timer = Timer.periodic(Duration(milliseconds: 1200), (timer) {
          if (timer.tick < 3) {
            setState(() {
              currentPage = timer.tick + 1;
            });
            if (controller.status == AnimationStatus.completed ||
                controller.status == AnimationStatus.dismissed) {
              controller.reset();
              controller.forward();
            }
          } else {
            timer.cancel();
            checkIfLoggedUser();
          }
        });
      }
    });
  }

  bool isLogged = false;
  // final bloc = LoginBloc(sl());
  bool animationStarted = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    waveGap = SizeConfig.w(256 / 2);
    _animation = Tween(begin: 0.0, end: waveGap)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {
              waveRadius = _animation!.value;
            });
          });

    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                Color(0xffDFB8FF),
                Color(0xff6B33AF),
                Color(0xff49207A)
              ])),
          child: Stack(
            children: [
              buildFirstPage(),
              buildSecondWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Transform buildSecondWidget() {
    return Transform.translate(
      offset:
          Offset(0.0, SizeConfig.screenHeight * _loginAnimation!.value * 0.97),
      child: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.w(28),
          right: SizeConfig.w(28),
        ),
        // bottom: MediaQuery.of(context).viewInsets.bottom),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(
                    150 * _loginAnimation!.value, 50 * _loginAnimation!.value),
                topRight: Radius.elliptical(
                    150 * _loginAnimation!.value, 50 * _loginAnimation!.value)),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Opacity(
            opacity: _loginOpacityAnimation!.value,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.h(180),
                ),
                Text(
                  'welcome to',
                  style: TextStyle(fontSize: SizeConfig.h(20)),
                ),
                Transform.scale(
                  scale: _loginScaleAnimation!.value,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.h(31),
                      ),
                      SvgPicture.asset(
                        "assets/teemeeColored.svg",
                        height: SizeConfig.h(30.29),
                        width: SizeConfig.w(30.29),
                      ),
                      SizedBox(
                        height: SizeConfig.h(39),
                      ),
                      SvgPicture.asset(
                        "assets/teemeeColoredText.svg",
                        height: SizeConfig.h(26.73),
                        width: SizeConfig.w(240.45),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Team Up Together",
                            style: TextStyle(
                                fontSize: SizeConfig.h(14),
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.h(130),
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone or Email',
                            style: TextStyle(fontSize: SizeConfig.w(13)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (v) {
                          phone = v;
                        },
                        validator: (v) {
                          if (v?.isEmpty ?? false) {
                            return 'this field cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Your Phone Number or Email",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(11),
                      ),
                      Row(
                        children: [
                          Text(
                            'password',
                            style: TextStyle(fontSize: SizeConfig.w(13)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: !showPassword,
                        onChanged: (v) {
                          setState(() {
                            password = v;
                          });
                        },
                        validator: (v) {
                          if (v!.length < 6) {
                            return 'connot be less than 6 character';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.remove_red_eye_outlined
                                // FontAwesomeIcons.eyeSlash
                                    : Icons.remove_red_eye_outlined,
                                // FontAwesomeIcons.eye,
                                size: SizeConfig.h(25),
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                            hintText: "************",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(11),
                      ),
                      SizedBox(
                        height: SizeConfig.h(27),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have account',
                            style: TextStyle(fontSize: SizeConfig.w(14)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));
                            },
                            child: Text(
                              " " + 'Sign up' + " ",
                              style: TextStyle(
                                  fontSize: SizeConfig.w(14),
                                  color: secondryColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack buildFirstPage() {
    return Stack(
      children: [
        CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: CircleWavePainter(waveRadius, animationStarted),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/splashTeemee.svg",
                height: SizeConfig.h(42.07),
                width: SizeConfig.w(114.4),
              ),
              SizedBox(
                height: SizeConfig.h(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Team Up Together",
                    style: TextStyle(
                        fontSize: SizeConfig.h(12), color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.h(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: currentPage == 1 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle,
                        boxShadow: currentPage == 1
                            ? [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6,
                                )
                              ]
                            : []),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: currentPage == 2 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle,
                        boxShadow: currentPage == 2
                            ? [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6,
                                )
                              ]
                            : []),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: currentPage == 3 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle,
                        boxShadow: currentPage == 3
                            ? [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6,
                                )
                              ]
                            : []),
                  )
                ],
              )
            ],
          ),
        ),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(79.33),
              SizeConfig.h(139.54),
            ),
            child: SvgPicture.asset("assets/shapes5.svg")),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(30),
              SizeConfig.h(328),
            ),
            child: SvgPicture.asset("assets/shapes1.svg")),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(344),
              SizeConfig.h(438),
            ),
            child: SvgPicture.asset("assets/shapes2.svg")),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(212.37),
              SizeConfig.h(486.55),
            ),
            child: SvgPicture.asset("assets/shapes6.svg")),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(79),
              SizeConfig.h(518),
            ),
            child: SvgPicture.asset("assets/shapes3.svg")),
        Transform.translate(
            offset: Offset(
              SizeConfig.w(323),
              SizeConfig.h(88),
            ),
            child: SvgPicture.asset("assets/shapes3.svg")),
        Positioned(
          top: SizeConfig.h(620),
          left: SizeConfig.w(125),
          child: SvgPicture.asset(
            "assets/teemee.svg",
            height: SizeConfig.h(15.28),
            width: SizeConfig.w(137.47),
          ),
        ),
        Positioned(
            top: SizeConfig.h(660),
            left: SizeConfig.w(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isLogged)
                  Container(
                    width: SizeConfig.w(255),
                    height: SizeConfig.h(50),
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          animationStarted = true;

                          if (controller.status == AnimationStatus.completed ||
                              controller.status == AnimationStatus.dismissed) {
                            controller.reset();
                            controller.forward();
                          }
                          timer = Timer.periodic(Duration(milliseconds: 1200),
                              (timer) {
                            if (timer.tick < 3) {
                              setState(() {
                                currentPage = timer.tick + 1;
                              });
                              if (controller.status ==
                                      AnimationStatus.completed ||
                                  controller.status ==
                                      AnimationStatus.dismissed) {
                                controller.reset();
                                controller.forward();
                              }
                            } else {
                              timer.cancel();
                              checkIfLoggedUser();
                            }
                          });
                        },
                        child: Center(
                            child: Text(
                          'get started',
                          style: TextStyle(
                              color: Color(0xff607953),
                              fontSize: SizeConfig.w(16)),
                        )),
                      ),
                    ),
                  )
                else
                  Container(
                    width: SizeConfig.w(255),
                    height: SizeConfig.h(50),
                    color: Colors.transparent,
                  ),
                SizedBox(
                  height: SizeConfig.h(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('copyrights',
                        style: TextStyle(
                            color: Colors.white54, fontSize: SizeConfig.w(10))),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void checkIfLoggedUser() async {
    // if (await sl<PrefsHelper>().getIsLogin()) {
    //   if ((await sl<PrefsHelper>().getNeedVerify())) {
    //     String phone = await sl<PrefsHelper>().getPhone();
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (_) => PhoneAuthPage(phone, true)));
    //   } else {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => BasePage()));
    //   }
    // }
    // else {
      loginController.forward();
    // }
  }
}

class CircleWavePainter extends CustomPainter {
  final double waveRadius;
  var wavePaint;
  bool isStarted;
  CircleWavePainter(this.waveRadius, this.isStarted) {
    wavePaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0
      ..isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double maxRadius = hypot(centerX, centerY);

    var currentRadius = waveRadius;
    while (currentRadius < (isStarted ? maxRadius : maxRadius * 0.7)) {
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 70;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }

  double hypot(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
