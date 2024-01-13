import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';


class DogAttackReportPage extends StatefulWidget {
  @override
  _DogAttackReportPageState createState() => _DogAttackReportPageState();
}

class _DogAttackReportPageState extends State<DogAttackReportPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otherDetailsController = TextEditingController();
  TextEditingController dogDescriptionController = TextEditingController();
  TextEditingController injuriesController = TextEditingController();
  TextEditingController witnessesController = TextEditingController();

  void _submitReport() {
    // Your existing logic
    print('Address: ${addressController.text}');
    print('Mobile Number: ${mobileNumberController.text}');
    print('Dog Description: ${dogDescriptionController.text}');
    print('Injuries Sustained: ${injuriesController.text}');
    print('Witnesses: ${witnessesController.text}');
    print('Other Details: ${otherDetailsController.text}');

    // Show a notification
    Fluttertoast.showToast(
      msg: 'Thank you for your message. Our team will reach your location soon.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Clear input fields
    _clearData();
  }

  void _clearData() {
    addressController.clear();
    mobileNumberController.clear();
    dogDescriptionController.clear();
    injuriesController.clear();
    witnessesController.clear();
    otherDetailsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Report Stray Dog Attack',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Mobile Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your mobile number',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Dog Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: dogDescriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter a description of the stray dog',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Injuries Sustained',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: injuriesController,
                decoration: InputDecoration(
                  hintText: 'Describe any injuries sustained (if applicable)',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Witnesses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: witnessesController,
                decoration: InputDecoration(
                  hintText: 'Provide names/contact details of any witnesses',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Other Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: otherDetailsController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter other details about the incident',
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: _submitReport,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Submit Report',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
