import 'package:flutter/material.dart';
import 'package:passing_data/welcomepage.dart';

final _formKey = GlobalKey<FormState>();

class Home extends StatelessWidget {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                focusNode: fieldOne,
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
                validator: (_name) => _name!.length < 3
                    ? 'Name should be at least 3 characters'
                    : "",
                onFieldSubmitted: (value) {
              fieldTwo.requestFocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                focusNode: fieldTwo,
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email id',
                ),
                validator: (_email) => _email!.length < 6 ? 'invalid' : "",
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(fieldThree);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                focusNode: fieldThree,
                controller: _phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your phone number',
                ),
                validator: (_phone) =>
                    _phone!.length < 10 ? 'Enter a valid number' : "",
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(fieldFour);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if( _formKey.currentState!.validate()){

                
               
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Welcomepage(
                        name: _name.text,
                        email: _email.text,
                        phone: _phone.text)));}
                        else {

                        }
                      
              },
              child: Text('Summit'),
              focusNode: fieldFour,
            )
          ],
        ),
      ),
    ));
  }
}
