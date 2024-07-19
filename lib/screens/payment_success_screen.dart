import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支付'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).primaryColor,
              size: 56,
            ),
            const SizedBox(height: 24),
            Text(
              '支付成功',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
