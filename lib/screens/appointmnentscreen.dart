import 'package:appointment/databsae/helper.dart';
import 'package:appointment/databsae/models/clientmodel.dart';
import 'package:appointment/widgets/button.dart';
import 'package:appointment/widgets/drodowm.dart';
import 'package:appointment/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController siteVistController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController clientController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    intitfun();

    super.initState();
  }

  intitfun()async{
    int i = await Databasehelper.instance.insert({
      ClientModel(firstname: "firstname",lastname: "last",email: "email@as.cs",whatsappNo: "asdasdasdasd",location: "hyd",project: "proj");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: const [
            Icon(Icons.arrow_back_rounded, color: Colors.black54),
            Text(
              "New Appointment",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Text('sLabel'),
                const SizedBox(
                  height: 15,
                ),
                Dropdown(
                  title: 'Site Vist',
                  controller: siteVistController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdown(
                  title: 'select client',
                  controller: clientController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Textfield(
                  title: 'Pick a Date',
                  controller: dateController,
                  isdate: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Textfield(
                  title: 'pick a Time',
                  controller: timeController,
                  isdate: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Button(
                  title: 'Schedule',
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState.validate();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
