import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({Key? key}) : super(key: key);
  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

enum menuitem { item1, item2, item3, item4 }

class _PopupWidgetState extends State<PopupWidget> {
  menuitem? _mitem = menuitem.item1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[200],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 9,
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text('SignUp',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_textField('First Name','Enter First Name'), SizedBox(width: 10),_textField('Last Name','Enter Last Name')],
              ),
              SizedBox(height: 10),
              _textField('Email / Mobile Number','Enter email or mobile number'),
              SizedBox(height: 10),
              _textField('Password','Enter password'),
              // Row(
              //   children: <Widget>[
              //     Container(
              //       padding: EdgeInsets.all(20.0),
              //       child: DropdownButton<ListItem>(
              //           value: _selectedItem,
              //           items: _dropdownMenuItems,
              //           onChanged: (value) {
              //             setState(() {
              //               _selectedItem = value;
              //             });
              //           }),
              //     ),
              //     // _dropDown('Day','1', ['1', '2', '3', '4', '5', '6', '7', '8','9','10']),
              //     // _dropDown('Month','jan', ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct','Nov','Dec']),
              //     // _dropDown('Year','1990', ['1990', '1991',  '1992',  '1993',  '1994',  '1995',  '1996',  '1997']),
              //   ],
              // ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      width: 160,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: const Center(
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDown(String labelText, String _currentSelectedValue, var list){
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.yellow,
      ),
      child: Expanded(
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: new TextStyle(
                      color: Colors.black54, fontSize: 16.0),
                  errorStyle: TextStyle(
                      color: Colors.redAccent, fontSize: 8.0),
                  hintText: 'Please select carat',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(5.0))),
              isEmpty: _currentSelectedValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _currentSelectedValue,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentSelectedValue = newValue!;
                      state.didChange(newValue);
                    });
                  },
                  items: list.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget _textField(String labelText, String validateMsg ) {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.yellow,
      ),
      child: Expanded(
        child: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return validateMsg;
            }
            return null;
          },
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26, width: 1.0),
            ),
            border: const OutlineInputBorder(),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.green,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }
}
