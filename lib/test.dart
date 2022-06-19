import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class page1 extends StatefulWidget {
  page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  String value = 'Navigate back'; // data that we want to pass
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => page2(
                          value:
                              value) // passing data to the secont page while navigaing
                      ));
            },
            child: Text('Navigate to page2')));
  }
}

class page2 extends StatefulWidget {
  final String value; // storing the passed data type String
  const page2({
    Key? key,
    required this.value, // the second page is expected to get a value from the previous page since it is required
  }) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  String value = 'Local variable';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(widget
                .value) // Using widget to get the passed data otherwise it'll use the local variable
            ));
  }
}
