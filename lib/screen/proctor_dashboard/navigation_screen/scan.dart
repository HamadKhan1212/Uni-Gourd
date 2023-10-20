import 'package:flutter/material.dart';

import '../../../wedgits/reusable_text.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              width: 355,
              height: 144,
              decoration: BoxDecoration(
                  color: const Color(0xffEFF0F4),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  ReusableText(
                    title: ('Scan QR Code'),
                    size: 28,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    'Lorem ipsum dolor sit amet\nconsectetur. Fermentum ipsum venenatis scelerisque risus.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Color(0xff7E7E7E)),
                  ))
                ],
              ),
            ),
            const QRCode(),
          ],
        ),
      ),
    );
  }
}

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 2,
                height: 30,
                color: Colors.deepPurple,
              ),
              Container(
                height: 2,
                width: 30,
                color: Colors.deepPurple,
              ),
              const Spacer(),
              Container(
                height: 2,
                width: 30,
                color: Colors.deepPurple,
              ),
              Container(
                width: 2,
                height: 30,
                color: Colors.deepPurple,
              )
            ],
          ),
          Image.asset(
            'images/icon/qrcode.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 2,
                height: 30,
                color: Colors.deepPurple,
              ),
              Container(
                height: 2,
                width: 30,
                color: Colors.deepPurple,
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 2,
                color: Colors.deepPurple,
              ),
              Container(
                height: 30,
                width: 2,
                color: Colors.deepPurple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
