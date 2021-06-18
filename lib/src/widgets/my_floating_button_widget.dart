import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget {

  final Color primaryColor;
  final Color secundaryColor;
  final bool hasGradient;
  final Widget child;
  final Function() onPressed;

  MyFloatingButton({
    required this.primaryColor, 
    required this.onPressed, 
    required this.child, 
    this.secundaryColor = Colors.white, 
    this.hasGradient = false
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: this.primaryColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: this.child,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff3895F5),
              Color(0xff27DFFB)
            ]
          )
        ),
      ),
      onPressed: this.onPressed
    );
  }
}