import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  double goal = 84.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Nutrimate",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hello, Gaurav!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Track You Progrss",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 10.0,
                        animation: true,
                        percent: goal / 100,
                        center: Text(
                          goal.toString() + "%",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        backgroundColor: Colors.purple,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.green,
                      ),
                      Text(
                        "Today's Goal",
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Chart 1: Daily Nutrient Intake
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 300,
                  padding: EdgeInsets.all(20),
                  child: charts.LineChart(
                    _createSampleData(),
                    animate: true,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                // Chart 2: Weekly Progress
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 300,
                  padding: EdgeInsets.all(16),
                  child: charts.BarChart(
                    _createSampleData2(),
                    animate: true,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  // Mock data for daily nutrient intake chart
  List<charts.Series<Nutrient, int>> _createSampleData() {
    final data = [
      Nutrient(0, 100), // Replace with actual data
      Nutrient(1, 200),
      Nutrient(2, 150),
      Nutrient(3, 300),
      Nutrient(4, 250),
      Nutrient(5, 180),
      Nutrient(6, 220),
    ];

    return [
      charts.Series<Nutrient, int>(
        id: 'Nutrient Intake',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Nutrient nutrient, _) => nutrient.day,
        measureFn: (Nutrient nutrient, _) => nutrient.intake,
        data: data,
      )
    ];
  }

  // Mock data for weekly progress chart
  List<charts.Series<Progress, String>> _createSampleData2() {
    final data = [
      Progress('Mon', 80), // Replace with actual data
      Progress('Tue', 120),
      Progress('Wed', 100),
      Progress('Thu', 150),
      Progress('Fri', 200),
      Progress('Sat', 180),
      Progress('Sun', 220),
    ];

    return [
      charts.Series<Progress, String>(
        id: 'Weekly Progress',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Progress progress, _) => progress.day,
        measureFn: (Progress progress, _) => progress.progress,
        data: data,
      )
    ];
  }
}

// Mock class for daily nutrient intake
class Nutrient {
  final int day;
  final int intake;

  Nutrient(this.day, this.intake);
}

// Mock class for weekly progress
class Progress {
  final String day;
  final int progress;

  Progress(this.day, this.progress);
}
