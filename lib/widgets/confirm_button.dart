import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.label, required this.action});

  final String label;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: action,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.amber,
                ),
                foregroundColor: WidgetStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
