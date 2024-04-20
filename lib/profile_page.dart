import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:home_genie/Connect.dart';
import './main.dart';
import './Connect.dart';
import 'Inventory.dart';
import 'todo.dart';

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}


class SettingsPage extends StatefulWidget {

  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentPageIndex = 3; // Initialize with the index of the Profile page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          // Assuming ProfileScreen is the main content
          Container(
            height: 700,
            child: Center(
              child: ProfileScreen(),

            ),
          ),
          Container(
            height: 200,
            color: Colors.green,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to another Dart file
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Connect()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set background color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
                  elevation: MaterialStateProperty.all<double>(0), // No shadow
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Set border radius
                    ),
                  ),
                ),
                child: Text(
                  'Access Family',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index; // Update the current page index
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HG_App(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Inventory(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Todo(),
                ),
              );
              break;
          }
        },
        selectedIndex: _currentPageIndex, // Use the current page index
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.door_sliding_outlined),
            label: 'Pantry',
          ),
          NavigationDestination(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}