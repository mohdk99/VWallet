import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
export 'signupPanel.dart';
import 'package:form_field_validator/form_field_validator.dart';

class signupPanel extends StatefulWidget {
  signupPanel({Key? key}) : super(key: key);

  @override
  State<signupPanel> createState() => _signupPanelState();
}

class _signupPanelState extends State<signupPanel> {
  Color suffixColor = Colors.black38;
  Color suffixColor1 = Colors.black38;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  PanelController _pc = new PanelController();
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
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
                width: 308,
                //height: 46,
                child: TextFormField(
                  enableInteractiveSelection: false,
                  validator: RequiredValidator(errorText: "Required"),
                  controller: _nameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: "First Name",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: const EdgeInsets.only(
                        left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                    fillColor: Colors.white70,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF809EDC)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.person,
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
                width: 308,
                //height: 46,
                child: TextFormField(
                  enableInteractiveSelection: false,
                  validator: RequiredValidator(errorText: "Required"),
                  controller: _nameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: "Last Name",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: const EdgeInsets.only(
                        left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                    fillColor: Colors.white70,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF809EDC)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.person,
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
                width: 308,
                //height: 46,
                child: TextFormField(
                  enableInteractiveSelection: false,
                  validator: EmailValidator(errorText: "Enter valid Email"),
                  controller: _emailController,
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
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF809EDC)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
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
                width: 308,
                //height: 46,
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required"),
                    MinLengthValidator(6,
                        errorText:
                            "Password must contain atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText: "Password cannot be more 15 characters"),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                        errorText:
                            "Password must have atleast one special character"),
                  ]),
                  controller: _passwordController,
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
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF809EDC)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.security,
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
                width: 308,
                //height: 46,
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required"),
                    MinLengthValidator(6,
                        errorText:
                            "Password must contain atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText: "Password cannot be more 15 characters"),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                        errorText:
                            "Password must have atleast one special character"),
                  ]),
                  controller: _passwordController,
                  autofocus: false,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: const EdgeInsets.only(
                        left: 20.0, top: 15.0, right: 0.0, bottom: 0.0),
                    fillColor: Colors.white70,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF809EDC)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.lock,
                        size: 20,
                        color: suffixColor1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
