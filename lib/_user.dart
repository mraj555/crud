import 'package:crud/_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyUser extends StatefulWidget {
  var name;
  var mail;
  var mobile;

  MyUser({Key? key, this.name, this.mail, this.mobile}) : super(key: key);

  @override
  _MyUserState createState() => _MyUserState();
}

class _MyUserState extends State<MyUser> {
  static List<MyUser> _userdata = [];

  bool _name = false;
  bool _mail = false;
  bool _phn = false;

  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(
      () {
        if (_userdata.any((element) => element.name == widget.name) &&
            _userdata.any((element) => element.mail == widget.mail) &&
            _userdata.any((element) => element.mobile == widget.mobile)) {
          return null;
        } else {
          _userdata.add(
            MyUser(
              name: widget.name,
              mail: widget.mail,
              mobile: widget.mobile,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          leading: IconButton(
            onPressed: () {
              setState(
                () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyInput(),
                    ),
                    (route) => false,
                  );
                },
              );
            },
            icon: Icon(Icons.add),
            padding: EdgeInsets.only(left: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton.icon(
                onPressed: () {
                  setState(
                    () {
                      _userdata.clear();
                    },
                  );
                },
                icon: Icon(Icons.clear_all),
                label: Text('Clear'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    GoogleFonts.alegreya(),
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
          title: Text('Users Data'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: Colors.black,
          titleTextStyle: GoogleFonts.share(fontSize: 20),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _userdata.length,
            itemBuilder: (context, index) => Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name: ${_userdata[index].name}',
                          style: GoogleFonts.alata(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email: ${_userdata[index].mail}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mobile: ${_userdata[index].mobile}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonBar(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder: (context, setState) => Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 12,
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            'Which Field You Want To Update?',
                                            style: GoogleFonts.alumniSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            bottom: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 135,
                                                height: 50,
                                                alignment: Alignment.centerLeft,
                                                child: CheckboxListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  value: _name,
                                                  onChanged: (val) {
                                                    setState(
                                                      () {
                                                        _name = val!;
                                                      },
                                                    );
                                                  },
                                                  title: Text('Name'),
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                ),
                                              ),
                                              Container(
                                                width: 135,
                                                height: 50,
                                                alignment: Alignment.centerLeft,
                                                child: CheckboxListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  value: _mail,
                                                  onChanged: (val) {
                                                    setState(
                                                      () {
                                                        _mail = val!;
                                                      },
                                                    );
                                                  },
                                                  title: Text('Email'),
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                ),
                                              ),
                                              Container(
                                                width: 135,
                                                height: 50,
                                                alignment: Alignment.centerLeft,
                                                child: CheckboxListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  value: _phn,
                                                  onChanged: (val) {
                                                    setState(
                                                      () {
                                                        _phn = val!;
                                                      },
                                                    );
                                                  },
                                                  title: Text('Mobile'),
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20,
                                          ),
                                          child: _name == true
                                              ? TextField(
                                                  controller: name,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Name',
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.2),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    prefixIcon: Icon(
                                                        Icons.account_circle),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20,
                                          ),
                                          child: _mail == true
                                              ? TextField(
                                                  controller: email,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Email',
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.2),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    prefixIcon:
                                                        Icon(Icons.mail),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 20),
                                          child: _phn == true
                                              ? TextField(
                                                  controller: phone,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Phone',
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.2),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    prefixIcon:
                                                        Icon(Icons.phone),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20,
                                          ),
                                          child: _name == true ||
                                                  _mail == true ||
                                                  _phn == true
                                              ? Center(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      this.setState(
                                                        () {
                                                          if (name.text
                                                              .isNotEmpty) {
                                                            _userdata[index]
                                                                    .name =
                                                                name.text;
                                                          }
                                                          if (email.text
                                                              .isNotEmpty) {
                                                            _userdata[index]
                                                                    .mail =
                                                                email.text;
                                                          }
                                                          if (phone.text
                                                              .isNotEmpty) {
                                                            _userdata[index]
                                                                    .mobile =
                                                                phone.text;
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                    child: Text('Update'),
                                                  ),
                                                )
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            label: Text('Edit'),
                            icon: Icon(Icons.edit),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              setState(
                                () {
                                  _userdata.removeAt(index);
                                },
                              );
                            },
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            label: Text('Delete'),
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
