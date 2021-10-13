import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> formKey;
  const Button({
    Key key,this.title = 'no title', this.formKey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
                          print("validation sucks us");
                        } else {
                          print("validation failed");
                        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 4.0,
        minimumSize: const Size(88.0, 45.0),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFf66e44),
                Color(0xFFfa9c74),
              ]),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 45.0),
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
