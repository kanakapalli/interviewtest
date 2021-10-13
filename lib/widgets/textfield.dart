import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String title;
  final bool isdate;
  final TextEditingController controller;
  const Textfield({Key key, @required this.title, this.controller, this.isdate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClayContainer(
          emboss: true,
          depth: 50,
          color: const Color(0xFFFFFFFF),
          borderRadius: 3,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              print(value);
              if (value == "") {
                return 'value cant be empty';
              } else {
                return null;
              }
            },
            cursorColor: Colors.black,
            // keyboardType: inputType,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 15, bottom: 11, top: 11, right: 15),
                hintText: title,
                suffixIcon:isdate ?
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.date_range_rounded),
                ) : null,
                ),
          )),
    );
  }
}
