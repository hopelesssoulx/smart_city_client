import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.errorDetails});

  final errorDetails;

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blue,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "error...",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    // return Text(errorDetails.toString());
  }
}
