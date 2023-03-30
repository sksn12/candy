import 'package:flutter/material.dart';

import 'package:candy/api/statistics_api_service.dart';
import 'package:candy/models/user/user_statistics.model.dart';
import 'package:candy/widgets/my_page/statistics/staistics_text.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_beer.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_country.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  Future<UserStatisticsModel> statistics() async {
    return await StatisticsApiService.getUserStatistics(email: 'ac@naver.com');
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return FutureBuilder(
        future: statistics(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                  height: 500,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: [
                      StatisticsChartCountry(
                          pieCountry: snapshot.data!.pieCountry),
                      StatisticsChartBeer(pieStyle: snapshot.data!.pieStyle),
                    ],
                  ),
                ),
              ]),
            );
          }
          return const SizedBox();
        });
  }
}
