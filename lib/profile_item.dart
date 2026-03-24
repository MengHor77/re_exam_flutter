import 'package:flutter/material.dart';

// Reusable StatelessWidget
class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({
    
    required this.title,
    required this.value,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),
        ],
      ),
    );
  }
}