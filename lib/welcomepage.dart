import 'package:flutter/material.dart';

class Welcomepage extends StatelessWidget {
  String name,email,phone;

  Welcomepage({required this.name,required this.email,required this.phone});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${name}'),
            Text('email: ${email}'),
            Text('phone number: ${phone}')
          ],
        ),
      )
    );
  }
}