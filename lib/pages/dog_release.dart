import 'package:dogcatcher/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class StrayDogReleasePage extends StatelessWidget {
  final Random random = Random();

  List<String> _generateRandomData() {
    List<String> data = [];
    for (int i = 0; i < 5; i++) {
      String randomDate = _getRandomDate();
      String randomTime = _getRandomTime();
      String randomPlace = _getRandomPlace();
      data.add('$randomDate | $randomTime | $randomPlace');
    }
    return data;
  }

  String _getRandomDate() {
    return '${random.nextInt(31) + 1}/${random.nextInt(12) + 1}/${random.nextInt(5) + 2020}';
  }

  String _getRandomTime() {
    return '${random.nextInt(24)}:${random.nextInt(60)}';
  }

  String _getRandomPlace() {
    List<String> places = ['Park', 'Street', 'Rescue Center', 'Wilderness'];
    return places[random.nextInt(places.length)];
  }

  @override
  Widget build(BuildContext context) {
    List<String> randomData = _generateRandomData();

    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Stray Dog Release Details',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
       leading: IconButton(onPressed: () {
         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
       }, icon: Icon(Icons.arrow_back,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: randomData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      randomData[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Perform actions on button press, e.g., save details
            print('Date: ${_getRandomDate()}');
            print('Time: ${_getRandomTime()}');
            print('Place: ${_getRandomPlace()}');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text('Save Details',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
    );
  }
}
