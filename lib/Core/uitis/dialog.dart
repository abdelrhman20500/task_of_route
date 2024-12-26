import 'package:flutter/material.dart';
void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            errorMessage,
            style: const TextStyle(color: Colors.blue),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
        );
      });
}
