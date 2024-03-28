import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Challenge Image or Banner
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.leaderboard,
                      size: 64,
                      color: Colors.white,
                    ),
                    Text(
                      'Nutrimate Challenge',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Leaderboard Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Leaderboard',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Leaderboard List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leaderboardData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        leaderboardColors[index % leaderboardColors.length],
                    child: Text(
                      leaderboardData[index]['name'][0],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(leaderboardData[index]['name']),
                  trailing: Text(
                    leaderboardData[index]['score'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Mock leaderboard data
  final List<Map<String, dynamic>> leaderboardData = [
    {'name': 'John Doe', 'score': 200},
    {'name': 'Alice Smith', 'score': 180},
    {'name': 'Emma Johnson', 'score': 150},
    {'name': 'David ', 'score': 100},
    {'name': 'John Smith', 'score': 90},
    {'name': 'Raj Singh', 'score': 50},
    // Add more data as needed
  ];

  // Colors for leaderboard avatars
  final List<Color> leaderboardColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    // Add more colors as needed
  ];
}
