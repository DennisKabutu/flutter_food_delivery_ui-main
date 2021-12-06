import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: (){},
      color: Theme.of(context).primaryColor,
        child: Text(
            label,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
          ),
        ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
