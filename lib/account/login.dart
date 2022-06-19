import 'dart:ffi';

import 'package:VWallet/biometrics_authentication/db_provider.dart';
import 'package:VWallet/biometrics_authentication/local_auth_api.dart';
import 'package:VWallet/biometrics_authentication/screen_lock_provider.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'signupPanel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:VWallet/account/signUpW.dart';
import 'package:VWallet/test3.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:VWallet/home/navigation_bar.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:VWallet/data/loyalty_doc_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
Color suffixColor = Colors.black38;
Color suffixColor1 = Colors.black38;
List<FocusNode> _focusNodes = [
  FocusNode(),
  FocusNode(),
];

bool _passwordVisible = false;

PanelController _pc = new PanelController();
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  get prefixIcon => null;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SlidingUpPanel(
        isDraggable: false,
        header: Container(
          width: 364.w,
          margin: EdgeInsets.only(
              left: 34.0.w, top: 35.0.h, right: 0.0.w, bottom: 0.0.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                  onPressed: () => _pc.close(),
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ),
              SizedBox(width: 45.w),
              Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xFF809EDC),
                  fontSize: 30.sp,
                ),
              ),
            ],
          ),
        ),
        renderPanelSheet: false,
        //margin: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0),
        maxHeight: 772.h,
        minHeight: 0.h,
        slideDirection: SlideDirection.UP,
        panel: _signupPanel(),
        collapsed: Container(
          decoration: BoxDecoration(color: Colors.blue, borderRadius: radius),
        ),
        controller: _pc,
        borderRadius: radius,

        body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.grey.shade200],
            ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(0.0, -0.7),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 300.w,
                  height: 300.h,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          (hasFocus)
                              ? suffixColor = Color(0xFF809EDC)
                              : suffixColor = Colors.black38;
                        });
                      },
                      child: SizedBox(
                        width: 308.w,
                        //height: 46,
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(
                                errorText:
                                    "Please enter a valid email address"),
                          ]),
                          controller: _emailController,
                          focusNode: _focusNodes[0],
                          autofocus: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            hintText: "Email Address",
                            hintStyle: TextStyle(color: Colors.black38),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                            fillColor: Colors.white70,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFF809EDC)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            suffixIcon: Align(
                              widthFactor: 1.0.w,
                              heightFactor: 1.0.h,
                              child: Icon(
                                Icons.email,
                                size: 20,
                                color: suffixColor1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        bottom: 20.0,
                      ),
                    ),
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          (hasFocus)
                              ? suffixColor = Color(0xFF809EDC)
                              : suffixColor = Colors.black38;
                        });
                      },
                      child: SizedBox(
                        width: 308.w,
                        //height: 46,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password must contain atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password cannot be more 15 characters"),
                            PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                errorText:
                                    "Password must have atleast one special character"),
                          ]),
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          autofocus: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black38),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                            fillColor: Colors.white70,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFF809EDC)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            suffixIcon: Align(
                              widthFactor: 1.0.w,
                              heightFactor: 1.0.h,
                              child: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: suffixColor1,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 338.w,
                      height: 20.h,
                      margin: EdgeInsets.only(
                          left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 0.9.sp,
                            child: Checkbox(
                              activeColor: Color(0xFF809EDC),
                              //controlAffinity: ListTileControlAffinity.leading,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side:
                                  BorderSide(color: Colors.black45, width: 1.5),

                              value: _checkbox,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox = !_checkbox;
                                });
                              },
                            ),
                          ),
                          Text(
                            "Remember Password",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 0.w),
                          Container(
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white,content: Text('Validation Successful',style: TextStyle(color: Colors.black, ),  ), ),    );
                                  Navigator.of(context)
                                      .pushAndRemoveUntil<dynamic>(
                                          MaterialPageRoute<dynamic>(
                                              builder: (context) => home()),
                                          (Route<dynamic> route) => false);
                                  ElegantNotification.success(
                                          toastDuration: Duration(seconds: 2),
                                          height: 70.h,
                                          animation: ANIMATION.fromTop,
                                          title: Text("Logged In"),
                                          description: Text(
                                              "You logged in successfully"))
                                      .show(context);
                                }
                                ;
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF809EDC),
                                        Color(0xFF6982B4)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 180.0.w, minHeight: 50.0.h),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Container(
                            height: 50,
                            child: RaisedButton(
                              onPressed: () async {
                                /*final isAuthenticated =
                                    await LocalAuthApi.authenticate();

                                if (isAuthenticated) {
                                  Navigator.of(context)
                                      .pushAndRemoveUntil<dynamic>(
                                          MaterialPageRoute<dynamic>(
                                              builder: (context) => home()),
                                          (Route<dynamic> route) => false);
                                  ElegantNotification.success(
                                          toastDuration: Duration(seconds: 2),
                                          height: 70,
                                          animation: ANIMATION.fromTop,
                                          title: Text("Logged In"),
                                          description: Text(
                                              "You logged in successfully"))
                                      .show(context);
                                }*/
                                //.........................................

                                DbProvider().getAuthState().then((value) {
                                  if (value == false) {
                                    ElegantNotification.error(
                                            toastDuration: Duration(seconds: 2),
                                            height: 70.h,
                                            animation: ANIMATION.fromTop,
                                            title: Text("Denied"),
                                            description: Text(
                                                "Fingerprint is not enabled"))
                                        .show(context);
                                  } else {
                                    print("Fingerprint Failed");
                                    ScreenLock(ctx: context).authenticateUser(
                                        path: 'loginPage',
                                        message:
                                            "Please Authenticate to access your wallet");
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF809EDC),
                                        Color(0xFF6982B4)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 110.0.w, minHeight: 50.0.h),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.fingerprint,
                                    size: 45.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.transparent,
                      height: 100.h,
                      width: 308.w,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 25, color: Colors.black38),
                ),
              ),
              Container(
                height: 55,
                child: RaisedButton(
                  onPressed: () => _pc.open(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF809EDC), Color(0xFF6982B4)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 308.0.w, minHeight: 50.0.h),
                      alignment: Alignment.center,
                      child: Text(
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final controller = PageController(
  initialPage: 0,
);
@override
Widget _signupPanel() {
  int pageIndex = 0;

  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey.shade400,
            ),
          ]),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      //child: Center(child: Text("Test Content"),),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 90.0.h, right: 0.0, bottom: 0.0),
                child: signupForm(),
              ),
              //nextBotton("Create Account"),
            ],
          ),

          /*PageView(
            controller: controller,
            //physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 90.0, right: 0.0, bottom: 0.0),
                    child: signupForm(),
                  ),
                  //nextBotton("Create Account"),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 100.0, right: 180.0, bottom: 15.0),
                    child: Text(
                      "Date of Birth",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  //datePicker(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 20.0, right: 225.0, bottom: 15.0),
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  genderToggle(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 20.0, right: 150.0, bottom: 15.0),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  phoneNumber(),
                  createAccountBotton("Sign Up")
                ],
              ),
            ],
          ),*/
          /*Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 2,

                    effect: WormEffect(
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xFF809EDC),
                    ), // your preferred effect
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
    ),
  );
}
