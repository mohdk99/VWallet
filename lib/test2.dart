import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:form_field_validator/form_field_validator.dart';

get prefixIcon => null;
bool _checkbox = false;

class loginForm extends StatefulWidget {
  loginForm({Key? key}) : super(key: key);

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
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
  get prefixIcon => null;
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Form(
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
                validator: EmailValidator(errorText: "Enter valid Email"),
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
                    borderSide: BorderSide(width: 1, color: Color(0xFF809EDC)),
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
                      errorText: "Password must contain atleast 6 characters"),
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
                    borderSide: BorderSide(width: 1, color: Color(0xFF809EDC)),
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
          Container(
            width: 338,
            height: 20,
            margin:
                EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    activeColor: Color(0xFF809EDC),
                    //controlAffinity: ListTileControlAffinity.leading,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: BorderSide(color: Colors.black45, width: 1.5),

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
                    fontSize: 15,
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
                SizedBox(width: 0),
                Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Validation Successful',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }
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
                            BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
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
                ),
                SizedBox(width: 15),
                Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
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
                            BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.fingerprint,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.transparent,
            height: 100,
            width: 308,
          ),
        ],
      ),
    );
  }
}
