import 'package:flutter/material.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

class ComplaintDetail extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ComplaintDetail(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  State<ComplaintDetail> createState() => _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplaintDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(widget.imageUrl),
          SizedBox(
            height: 50,
          ),
          ReusableText(
            title: widget.title,
          ),
          SizedBox(
            height: 50,
          ),
          ReusableText(
            title: widget.subtitle,
          )
        ],
      ),
    );
  }
}
