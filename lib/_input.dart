import 'package:crud/_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInput extends StatefulWidget {
  const MyInput({Key? key}) : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  var _controller = TextEditingController();
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Text('User Input'),
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                validator: (nam) {
                  if (nam!.isEmpty) {
                    return 'Name is required.';
                  }
                },
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: 'Name',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  controller: _controller1,
                  validator: (mail) {
                    if (mail!.isEmpty) {
                      return 'Email is Required.';
                    }
                    if (!RegExp(r"^[a-zA-z0-9+_.-]+@[a-zA-Z.-]+\.[a-zA-Z]")
                        .hasMatch(mail)) {
                      return 'Invalid Email Entered!';
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  controller: _controller2,
                  validator: (phone) {
                    if (phone!.isEmpty) {
                      return 'Mobile Number is Required.';
                    }
                    if (phone.length < 10) {
                      return 'Mobile Number Must Be 10 Digits.';
                    }
                  },
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Mobile',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      setState(
                        () {
                          if (_key.currentState!.validate()) {
                            var name = _controller.text;
                            var email = _controller1.text;
                            var mobile = _controller2.text;

                            _controller.clear();
                            _controller1.clear();
                            _controller2.clear();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyUser(
                                  name: name,
                                  mail: email,
                                  mobile: mobile,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
