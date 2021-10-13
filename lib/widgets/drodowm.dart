import 'package:appointment/databsae/helper.dart';
import 'package:appointment/databsae/models/clientmodel.dart';
import 'package:appointment/screens/newclient.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const Dropdown({Key key, @required this.title, @required this.controller})
      : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool isopen;

  @override
  void initState() {
    isopen = false;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.white,
          boxShadow: isopen
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            ClayContainer(
                emboss: true,
                depth: 50,
                color: const Color(0xFFFFFFFF),
                borderRadius: 3,
                child: TextFormField(
                  controller: widget.controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isopen = !isopen;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: widget.title),
                )),
            if (isopen)
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 80,
                      child: FutureBuilder<List<ClientModel>>(
                          future: Databasehelper.instance.getAllClients(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  String name = snapshot.data[index].firstname +' '+ snapshot.data[index].lastname;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        widget.controller.text = name;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text(name),
                                          Text(snapshot.data[index].location
                                            ,
                                            style: const TextStyle(
                                                color: Colors.blueAccent),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          })),
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Divider(
                      color: Colors.black38,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            //                    Navigator.push(
                            // context,
                            // MaterialPageRoute(builder: (context) => const NewClient()),
                            // );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(18, 25, 18, 25),
                                      child: NewClient(),
                                    ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Color(0xFFf66e44),
                                radius: 13,
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('new client'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
