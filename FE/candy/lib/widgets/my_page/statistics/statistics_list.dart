import 'package:flutter/material.dart';

import 'package:candy/widgets/my_page/statistics/staistics_text.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_country.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_beer.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(children: [
        const StatisticsText(),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: 400,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 430,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: const [
              StatisticsChartCountry(),
              StatisticsChartBeer(),
            ],
          ),
        ),
      ]),
    );
  }
}
