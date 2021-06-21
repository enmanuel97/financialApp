import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color color;
  final double width;
  final double height;

  OptionButton({
    required this.title, 
    required this.icon, 
    required this.color, 
    this.width = 60.0, 
    this.height = 60.0
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
            color: this.color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(this.icon, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(this.title, style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ))
      ],
    );
  }
}