import 'package:admob/widgets/trending_widget.dart';
import 'package:flutter/material.dart';

class Trending extends StatefulWidget {

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrendingWidget(trending: 'trending',),
    );
  }
}