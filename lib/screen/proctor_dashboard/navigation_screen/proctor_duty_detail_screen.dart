import 'package:flutter/material.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

class ProctorDutyDetailScreen extends StatefulWidget {
  const ProctorDutyDetailScreen({super.key});

  @override
  State<ProctorDutyDetailScreen> createState() =>
      _ProctorDutyDetailScreenState();
}

class _ProctorDutyDetailScreenState extends State<ProctorDutyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Duty Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              title: 'Duty Detail',
            )
          ],
        ),
      ),
    );
  }
}
