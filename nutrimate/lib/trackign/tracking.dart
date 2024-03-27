import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Hello, Gaurav!",
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            "Track You Progrss",
            style: TextStyle(fontSize: 16),
          ),
          // Chart 1: Daily Nutrient Intake
          Container(
            height: 300,
            padding: EdgeInsets.all(16),
            child: charts.LineChart(
              _createSampleData(),
              animate: true,
            ),
          ),
          // Chart 2: Weekly Progress
          Container(
            height: 300,
            padding: EdgeInsets.all(16),
            child: charts.BarChart(
              _createSampleData2(),
              animate: true,
            ),
          ),
        ],
      ),
    ));
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
