import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'SizeConfig.dart';
import 'Style.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = false;

  bool isUser = true;
  String password = '';
  String confirmPassword = '';
  String email = '';
  String name = '';
  String country = '';
  String phone = '';
  String image = '';
  String cover = '';
  //business props
  String bName = '', bEmail = '';
  int bType = 1;
  List<String> bServices = [];
  // List<Category> bTypes = [];
  double blong = 0, blat = 0;
  List<File> bImages = [];
  TextEditingController servicesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // getBtypes();
  }

  // getBtypes() async {
  //   bTypes = await sl<Repository>().getCategories();
  //   bType = bTypes.first.id;
  //   setState(() {});
  // }

  String userImageUrl  = '';
  List<String> imagesUrls = [];
  Asset? userImage;
  String about = '';
  String contactInfo = '';
  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formState,
          child: Container(
            padding: EdgeInsets.only(
              left: SizeConfig.w(28),
              right: SizeConfig.w(28),
            ),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.h(50),
                  ),
                  Text(
                   'Welcome to',
                    style: TextStyle(fontSize: SizeConfig.h(14)),
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.h(18),
                      ),
                      SvgPicture.asset(
                        "assets/teemeeColored.svg",
                        height: SizeConfig.h(25.29),
                        width: SizeConfig.w(25.29),
                      ),
                      SizedBox(
                        height: SizeConfig.h(30),
                      ),
                      SvgPicture.asset(
                        "assets/teemeeColoredText.svg",
                        height: SizeConfig.h(26.73),
                        width: SizeConfig.w(240.45),
                      ),
                      SizedBox(
                        height: SizeConfig.h(15),
                      ),
                      if (userImage != null)
                        GestureDetector(
                          onTap: () {
                            // loadUserImage();
                          },
                          child: Center(
                            child: SizedBox(
                              width: SizeConfig.w(75),
                              height: SizeConfig.w(75),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: AssetThumb(
                                  asset: userImage!,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: () {
                            // loadUserImage();
                          },
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: SizeConfig.h(50),
                              child: Center(
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: SizeConfig.h(50),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          Text(
                            'phone number',
                            style: TextStyle(fontSize: SizeConfig.w(13)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (v) {
                          setState(() {
                            phone = v;
                          });
                        },
                        validator: (v) {
                          if (v!.length < 10 || !v.startsWith("+")) {
                            return 'use valid number please';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "+x xxxxxxxxx",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(12),
                      ),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(fontSize: SizeConfig.w(13)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (v) {
                          setState(() {
                            email = v;
                          });
                        },
                        validator: (v) {
                          if (!(RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(v!))) {
                            return 'use valid email please';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "My_Email@email.com",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(12),
                      ),
                      Row(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(fontSize: SizeConfig.w(13)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (v) {
                          setState(() {
                            name = v;
                          });
                        },
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Your Full Name",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(12),
                      ),
                      Row(
                        children: [
                          Text(
                            'Password',
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
                            return 'cannot be less than 6 character';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "*********",
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      SizedBox(
                        height: SizeConfig.h(2),
                      ),
                      Row(
                        children: [
                          Text(
                            "     " + 'use valid password please',
                            style: TextStyle(fontSize: SizeConfig.h(12)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.h(10),
                      ),
                      Row(
                        children: [
                          Text(
                            'Confirm password',
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
                            confirmPassword = v;
                          });
                        },
                        validator: (v) {
                          if (password != null &&
                              confirmPassword != null &&
                              password == confirmPassword) {
                            return null;
                          }
                          return 'passwords not match';
                        },
                        decoration: InputDecoration(
                            hintText: "**********",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.h(13),
                                horizontal: SizeConfig.w(17)),
                            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(30)))),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: isUser,
                                  onChanged: (v) {
                                    setState(() {
                                      isUser = true;
                                    });
                                  }),
                              Text('User account'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: false,
                                  groupValue: isUser,
                                  onChanged: (v) {
                                    setState(() {
                                      isUser = false;
                                    });
                                  }),
                              Text('Business account'),
                            ],
                          ),
                        ],
                      ),
                      if (!isUser) ...buildBusinessProps(),
                      SizedBox(
                        height: SizeConfig.h(20),
                      ),
                      // BlocBuilder(
                      //   bloc: bloc,
                      //   builder: (context, state) {
                      //     if (state is SigningUp) {
                      //       return Center(
                      //         child: CircularProgressIndicator(
                      //           valueColor: AlwaysStoppedAnimation<Color>(
                      //               primaryColor),
                      //         ),
                      //       );
                      //     }
                      //
                      //     return MainButton(
                      //       text: S.of(context).sign_up,
                      //       onTap: () async {
                      //         if (userImage == null) {
                      //           AppSnackBar.show(
                      //               context,
                      //               "please select a profile image",
                      //               ToastType.Error);
                      //         } else if (formState.currentState.validate()) {
                      //           bloc.add(SetLoading());
                      //
                      //           if (!isUser && images.isEmpty) {
                      //             AppSnackBar.show(
                      //                 context,
                      //                 "at least one image is required",
                      //                 ToastType.Error);
                      //             return;
                      //           }
                      //           if (userImage != null &&
                      //               userImageUrl == null) {
                      //             bloc.add(SetLoading());
                      //
                      //             var path = await FlutterAbsolutePath
                      //                 .getAbsolutePath(userImage.identifier);
                      //             final url = await sl<Repository>().setImage(
                      //                 File.fromUri(Uri.parse(path)));
                      //             if (url != null) {
                      //               userImageUrl = url;
                      //             }
                      //           }
                      //           if (!isUser) {
                      //             String servicesString = "";
                      //             bServices.forEach((element) {
                      //               servicesString += element + "|";
                      //             });
                      //             servicesString = servicesString.substring(
                      //                 0, servicesString.length - 1);
                      //             final User user = User(
                      //                 businessEmail: bEmail,
                      //                 businessName: bName,
                      //                 businessTypeId: bType,
                      //                 name: name,
                      //                 email: email,
                      //                 description: about,
                      //                 contact_info: contactInfo,
                      //                 services: servicesString,
                      //                 image: userImageUrl,
                      //                 password: password,
                      //                 phone: phone);
                      //             bloc.add(TrySignUp(user));
                      //           } else {
                      //             final User user = User(
                      //                 name: name,
                      //                 email: email,
                      //                 image: userImageUrl,
                      //                 password: password,
                      //                 phone: phone);
                      //             bloc.add(TrySignUp(user));
                      //           }
                      //         }
                      //       },
                      //     );
                      //   },
                      // ),
                      SizedBox(
                        height: SizeConfig.h(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have account',
                            style: TextStyle(fontSize: SizeConfig.w(14)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              " " + 'Login',
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
                  // ),
                ],
              ),
            ),
          )),
    );
  }

  // Future uploadImages(BuildContext context) async {
  //   if (!isUser) {
  //     bloc.add(SetLoading());
  //
  //     for (int i = 0; i < images.length; i++) {
  //       if (!imagesUploaded[i]) {
  //         var path =
  //             await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
  //         final url = await sl<Repository>()
  //             .setUserImage(File.fromUri(Uri.parse(path)));
  //         if (url != null) {
  //           imagesUrls.add(url);
  //           imagesUploaded[i] = true;
  //         }
  //       }
  //     }
  //     bool allImagesUploaded = true;
  //     for (int i = 0; i < images.length; i++) {
  //       if (!imagesUploaded[i]) {
  //         allImagesUploaded = false;
  //       }
  //     }
  //     if (allImagesUploaded) {
  //       return;
  //     } else {
  //       bloc.add(RemoveLoading());
  //       AppSnackBar.show(context, "Error While Uploading images , try again",
  //           ToastType.Error);
  //     }
  //   }
  // }

  List<Widget> buildBusinessProps() {
    return [
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Business name',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        onChanged: (v) {
          setState(() {
            bName = v;
          });
        },
        validator: (v) {
          if (v!.isEmpty) {
            return 'use valid name please';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "My Store",
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(13), horizontal: SizeConfig.w(17)),
            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeConfig.h(30)))),
      ),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Business email',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        onChanged: (v) {
          setState(() {
            bEmail = v;
          });
        },
        validator: (v) {
          if (!(RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(v!))) {
            return 'use valid email please';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "myStore@ae.com",
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(13), horizontal: SizeConfig.w(17)),
            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeConfig.h(30)))),
      ),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        maxLines: 3,
        onChanged: (v) {
          setState(() {
            contactInfo = v;
          });
        },
        validator: (v) {
          if (v?.isEmpty ?? false) {
            return "this field is required ";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "ex. Email or phone and address",
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(13), horizontal: SizeConfig.w(17)),
            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeConfig.h(30)))),
      ),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Contact info',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        maxLines: 2,
        onChanged: (v) {
          setState(() {
            about = v;
          });
        },
        validator: (v) {
          if (v?.isEmpty ?? false) {
            return "this field is required ";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "Brief description about your business",
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(13), horizontal: SizeConfig.w(17)),
            hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeConfig.h(30)))),
      ),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Business type',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      // bTypes == null
      //     ? Container()
      //     :
      Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: SizeConfig.h(50),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(SizeConfig.h(30))),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                              underline: Container(),
                              isExpanded: true,
                              value: bType,
                              items: ['type1', 'type2', 'type3']
                                  .map((e) => DropdownMenuItem<int>(
                                        child: Text('nName'),
                                        value: 0,
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                bType = v??0;
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Add services',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: servicesController,
              decoration: InputDecoration(
                  hintText: "My Service",
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.h(13), horizontal: SizeConfig.w(17)),
                  hintStyle: TextStyle(fontSize: SizeConfig.h(14)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.h(30)))),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (servicesController.text.trim().isNotEmpty) {
                  bServices.add(servicesController.text);
                  servicesController.clear();
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(SizeConfig.h(7)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: SizeConfig.h(35),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      Wrap(
          spacing: 8,
          children: bServices
              .map(
                (e) => Chip(
                  onDeleted: () {
                    setState(() {
                      bServices.remove(e);
                    });
                  },
                  deleteIconColor: primaryColor,
                  backgroundColor: Colors.white,
                  elevation: 4,
                  label: Text(e),
                ),
              )
              .toList()),
      SizedBox(
        height: SizeConfig.h(12),
      ),
      Row(
        children: [
          Text(
            'Business pictures',
            style: TextStyle(fontSize: SizeConfig.w(13)),
          )
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // loadAssets();
              },
              child: Container(
                  padding: EdgeInsets.all(8),
                  height: SizeConfig.h(50),
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(SizeConfig.h(30))),
                  child: Center(
                      child: Text(
                    'Upload pictures',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
        ],
      ),
      if (images.isNotEmpty)
        SizedBox(
          height: SizeConfig.h(130),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                Asset asset = images[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      AssetThumb(
                        asset: asset,
                        width: SizeConfig.h(100).toInt(),
                        height: SizeConfig.h(100).toInt(),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              images.removeAt(index);
                            });
                          },
                          child: Container(
                            // padding: EdgeInsets.all(value),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.close,
                              size: SizeConfig.h(18),
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
    ];
  }

  List<Asset> images = [];
  List<bool> imagesUploaded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  // Future<void> loadAssets() async {
  //   List<Asset> resultList = [];
  //   String error = 'No Error Detected';
  //
  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 10,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#886AAD",
  //         actionBarTitle: S.of(context).businessPictures,
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     error = e.toString();
  //   }
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     images = resultList;
  //   });
  // }

  // Future<void> loadUserImage() async {
  //   List<Asset> resultList = [];
  //   String error = 'No Error Detected';
  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 1,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#886AAD",
  //         actionBarTitle: S.of(context).businessPictures,
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     error = e.toString();
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     userImage = resultList[0];
  //   });
  // }
}
