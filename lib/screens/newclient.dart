import 'package:appointment/databsae/models/clientmodel.dart';
import 'package:appointment/widgets/textfield.dart';
import 'package:flutter/material.dart';

class NewClient extends StatefulWidget {
  const NewClient({Key key}) : super(key: key);

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController whatsappnocontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController projectcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: Container(
          // color: Colors.black45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Add a new Client'),
                    ),
                  ],
                ),
                Textfield(
                  title: 'First Name',
                  controller: firstnamecontroller,
                ),
                Textfield(title: 'Last Name', controller: lastnameController),
                Textfield(
                  title: 'Whatsapp no',
                  controller: whatsappnocontroller,
                ),
                Textfield(title: 'email', controller: emailcontroller),
                Textfield(
                  title: 'Location',
                  controller: locationcontroller,
                ),
                Textfield(
                  title: 'Project Name',
                  controller: projectcontroller,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      ClientModel data =  ClientModel(
                          firstname: firstnamecontroller.text.toString(),
                          lastname: lastnameController.text.toString(),
                          whatsappNo: whatsappnocontroller.text.toString(),
                          email: emailcontroller.text.toString(),
                          location: locationcontroller.text
                              .toString(),
                          project: projectcontroller.text.toString());

                      // print("validation sucks us");
                    } else {
                      // print("validation failed");
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
                      constraints:
                          const BoxConstraints(minWidth: 88.0, minHeight: 45.0),
                      alignment: Alignment.center,
                      child: const Text('Save'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  savedata(GlobalKey<FormState> key) {
    if (_formKey.currentState.validate()) {
      print("validation sucks us");
    } else {
      print("validation failed");
    }
    return true;
  }
}
