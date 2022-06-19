import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:VWallet/home/navigation_bar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:VWallet/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signupForm extends StatefulWidget {
  signupForm({Key? key}) : super(key: key);

  @override
  State<signupForm> createState() => _signupFormState();
}

class _signupFormState extends State<signupForm> {
  Color suffixColor = Colors.black38;
  Color suffixColor1 = Colors.black38;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  bool _passwordVisible = false;
  final format = DateFormat('dd/MM/yyyy');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  PanelController _pc = new PanelController();
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 620.h,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 15.h)),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.0.w,
                          //right: 30.0,
                          //bottom: 20.0,
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
                          width: 150.w,
                          //height: 46,
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            validator: RequiredValidator(errorText: "Required"),
                            //controller: _nameController,
                            autofocus: false,
                            decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 9.sp, height: 0.3.h),
                              isCollapsed: true,
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.black38),
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 15.0,
                                  right: 0.0,
                                  bottom: 0.0),
                              fillColor: Colors.white70,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Color(0xFF809EDC)),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              suffixIcon: Align(
                                widthFactor: 1.0.w,
                                heightFactor: 1.0.h,
                                child: Icon(
                                  Icons.person,
                                  size: 20.sp,
                                  color: suffixColor1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0.w,
                          //right: 30.0,
                          //bottom: 20.0,
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
                          width: 150.w,
                          //height: 46,
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            validator: RequiredValidator(errorText: "Required"),
                            controller: _nameController,
                            autofocus: false,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 9, height: 0.3),
                              isCollapsed: true,
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.black38),
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 15.0,
                                  right: 0.0,
                                  bottom: 0.0),
                              fillColor: Colors.white70,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Color(0xFF809EDC)),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              suffixIcon: Align(
                                widthFactor: 1.0.w,
                                heightFactor: 1.0.h,
                                child: Icon(
                                  Icons.person,
                                  size: 20.sp,
                                  color: suffixColor1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
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
                        enableInteractiveSelection: false,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(
                              errorText: "Please enter a valid email address"),
                        ]),
                        controller: _emailController,
                        autofocus: false,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 9.sp, height: 0.3.h),
                          isCollapsed: true,
                          hintText: "Email Address",
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Color(0xFF809EDC)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          suffixIcon: Align(
                            widthFactor: 1.0.w,
                            heightFactor: 1.0.h,
                            child: Icon(
                              Icons.email,
                              size: 20.sp,
                              color: suffixColor1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
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
                        obscureText: !_passwordVisible,
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
                        autofocus: false,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 9.sp, height: 0.3.h),
                          isCollapsed: true,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Color(0xFF809EDC)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.w, color: Colors.red),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
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
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return "Password does not match";
                          }
                        },
                        controller: _confirmPasswordController,
                        autofocus: false,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 9.sp, height: 0.3.h),
                          isCollapsed: true,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Color(0xFF809EDC)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          suffixIcon: Align(
                            widthFactor: 1.0.w,
                            heightFactor: 1.0.h,
                            child: Icon(
                              Icons.security,
                              size: 20.sp,
                              color: suffixColor1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
                    ),
                  ),
                  SizedBox(
                    width: 308.w,
                    // height: 48,
                    child: DateTimeField(
                      validator: (date) => date == null ? 'Invalid date' : null,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 9.sp, height: 0.3.h),
                        hintText: "Birth Date",
                        hintStyle: TextStyle(color: Colors.black38),
                        contentPadding: const EdgeInsets.only(
                            left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.w, color: Color(0xFF809EDC)),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.w, color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        suffixIcon: Align(
                          widthFactor: 1.0.w,
                          heightFactor: 1.0.h,
                          child: Icon(
                            Icons.calendar_today,
                            size: 20.sp,
                            color: suffixColor1,
                          ),
                        ),
                      ),
                      cursorColor: Colors.red,
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Color(
                                        0xFF809EDC), // header background color
                                    onPrimary:
                                        Colors.white, // header text color
                                    onSurface:
                                        Color(0xFF809EDC), // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Color(
                                          0xFF809EDC), // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
                    ),
                  ),
                  genderToggle(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 15.0.h,
                    ),
                  ),
                  phoneNumber(),
                ],
              ),
              Positioned(
                left: 100.w,
                top: 512.h,
                child: RaisedButton(
                  onPressed: () {
                    //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
                    if (_formKey.currentState!.validate()) {
                      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white,content: Text('Validation Successful',style: TextStyle(color: Colors.black, ),  ), ),    );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    }
                    ;
                  },
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
                          BoxConstraints(maxWidth: 180.0.w, minHeight: 50.0.h),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign UP",
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
            ],
          ),
        ),
      ),
    );
  }
}

class borderLessTextField extends StatefulWidget {
  final String hint;

  final double hight;
  final double width;
  final IconData fieldIcon;
  final double iconSize;
  final bool password;
  final TextInputType inputType;

  const borderLessTextField({
    Key? key,
    required this.hint,
    required this.hight,
    required this.width,
    required this.fieldIcon,
    required this.iconSize,
    required this.inputType,
    required this.password,
  }) : super(key: key);

  @override
  State<borderLessTextField> createState() => _borderLessTextFieldState();
}

Color suffixColor = Colors.black38;
List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
];
FocusNode focus = FocusNode();

class _borderLessTextFieldState extends State<borderLessTextField> {
  late FocusNode myFocusNode;
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.hight.h,
      child: Focus(
        //onFocusChange: (hasFocus) {setState(() {(hasFocus)? suffixColor = Color(0xFF809EDC): suffixColor = Colors.black38;});},
        child: TextField(
          obscureText: widget.password,
          focusNode: myFocusNode,
          onTap: () {
            setState(() {
              FocusScope.of(context).requestFocus(myFocusNode);
            });
          },
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            isCollapsed: true,

            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.black38),
            contentPadding: const EdgeInsets.only(
                left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
            fillColor: Colors.white70,
            filled: true,
            //labelText: "Email Address",
            //labelStyle: TextStyle(color: Colors.black38),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Color(0xFF809EDC)),
              borderRadius: BorderRadius.circular(50.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.red),
              borderRadius: BorderRadius.circular(50.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            suffixIcon: Align(
              widthFactor: 1.0.w,
              heightFactor: 1.0.h,
              child: Icon(
                widget.fieldIcon,
                size: 20.sp,
                color: myFocusNode.hasFocus ? Color(0xFF809EDC) : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        //boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.1),blurRadius: 12,offset: const Offset(0, 3), ),]
      ),
    );
  }
}

/*class datePicker extends StatefulWidget {
  @override
  State<datePicker> createState() => _datePickerState();
}

dynamic selectedDateTime = "Select Date";
bool pressed = false;

class _datePickerState extends State<datePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 308,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
            color: Colors.grey.shade400,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: () {
                setState(() {
                  pressed = true;

                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      locale: LocaleType.en,
                      minTime: DateTime(1980),
                      maxTime: DateTime(2022),
                      theme: DatePickerTheme(
                          cancelStyle: TextStyle(
                            color: Color(0xFF809EDC),
                          ),
                          doneStyle: TextStyle(color: Color(0xFF809EDC)),
                          itemStyle: TextStyle(color: Color(0xFF809EDC))),
                      onChanged: (date) {
                    setState(() {
                      selectedDateTime = DateFormat.yMMMd().format(date);
                    });
                    print(
                      DateFormat.yMMMd().format(date),
                    );
                  }, onConfirm: (date) {
                    setState(() {
                      selectedDateTime = DateFormat.yMMMd().format(date);
                    });
                  }, currentTime: DateTime(2004));
                });
              },
              child: Text(
                '$selectedDateTime',
                style: TextStyle(color: Color(0xFF809EDC), fontSize: 25),
              )),
        ],
      ),
    );
  }
}*/

class genderToggle extends StatefulWidget {
  genderToggle({Key? key}) : super(key: key);

  @override
  State<genderToggle> createState() => _genderToggleState();
}

class _genderToggleState extends State<genderToggle> {
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 150.0.w,
      minHeight: 46,
      fontSize: 20.sp,
      initialLabelIndex: 0,
      cornerRadius: 50.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey.shade400,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['Male', 'Female'],
      icons: [Icons.male, Icons.female],
      activeBgColors: [
        [Color(0xFF809EDC)],
        [Color(0xFF809EDC)]
      ],
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}

class phoneNumber extends StatefulWidget {
  phoneNumber({Key? key}) : super(key: key);

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 50.0, top: 400.0, right: 0.0, bottom: 0.0),
      width: 330.w,
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w),
      //decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50)),border: Border.all(color: Colors.grey.shade400, )),
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            initialValue: PhoneNumber(isoCode: "OM"),
            //countries: ["+968", "+971"],
            selectorButtonOnErrorPadding: 10,
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },

            selectorConfig: SelectorConfig(
              leadingPadding: 10.w,
              showFlags: true,
              setSelectorButtonAsPrefixIcon: true,
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            textFieldController: controller,
            formatInput: false,
            maxLength: 9,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            cursorColor: Colors.black,
            inputDecoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 9.sp, height: 0.3.h),
              contentPadding: EdgeInsets.only(bottom: 15.h, left: 0.w),
              //border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Color(0xFF809EDC)),
                borderRadius: BorderRadius.circular(50.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.red),
                borderRadius: BorderRadius.circular(50.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Phone Number',
              hintStyle:
                  TextStyle(color: Colors.grey.shade500, fontSize: 16.sp),
              suffixIcon: Align(
                widthFactor: 1.0.w,
                heightFactor: 1.0.h,
                child: Icon(
                  Icons.phone,
                  size: 20.sp,
                  color: suffixColor1,
                ),
              ),
            ),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
          Positioned(
            left: 87.w,
            top: 10.h,
            bottom: 19.h,
            child: Container(
              //height: 20,
              width: 1.w,
              color: Colors.black.withOpacity(0.13),
            ),
          ),
        ],
      ),
    );
  }
}

Widget nextBotton(String s) {
  return GetMaterialApp(
    home: Container(
      margin: EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
      height: 50.h,
      child: RaisedButton(
        onPressed: () {
          //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
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
            constraints: BoxConstraints(maxWidth: 180.0.w, minHeight: 50.0.h),
            alignment: Alignment.center,
            child: Text(
              "$s",
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
  );
}

class submitButton extends StatefulWidget {
  submitButton({Key? key}) : super(key: key);

  @override
  State<submitButton> createState() => _submitButtonState();
}

class _submitButtonState extends State<submitButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget createAccountBotton(String s) {
  return Container(
    margin: EdgeInsets.only(left: 0.0, top: 70.0, right: 0.0, bottom: 0.0),
    height: 50,
    child: RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
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
          constraints: BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "$s",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    ),
  );
}
