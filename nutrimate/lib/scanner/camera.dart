import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PhotoCalorieScreen extends StatefulWidget {
  @override
  _PhotoCalorieScreenState createState() => _PhotoCalorieScreenState();
}

class _PhotoCalorieScreenState extends State<PhotoCalorieScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller
    _controller = CameraController(
      // Use the first available camera
      CameraDescription(
        name: '0',
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 90,
      ),
      ResolutionPreset.medium,
    );

    // Initialize the camera controller asynchronously
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the camera preview
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              try {
                // Ensure that the camera is initialized before attempting to take a picture
                await _initializeControllerFuture;

                // Capture the image
                final XFile imageFile = await _controller.takePicture();

                // Process the image and show calorie details
                _showCalorieDetailsDialog(context);
              } catch (e) {
                // If an error occurs, log the error to the console
                print('Error: $e');
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                    "Check Calories",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }

  void _showCalorieDetailsDialog(BuildContext context) {
    // Mocking calorie details for demonstration
    final mealName = 'Example Meal';
    final calories = 350;
    final protein = 25;
    final carbs = 40;
    final fat = 12;

    // Show dialog with calorie details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calorie Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meal Name: $mealName'),
              SizedBox(height: 8),
              Text('Calories: $calories kcal'),
              Text('Protein: $protein g'),
              Text('Carbs: $carbs g'),
              Text('Fat: $fat g'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
