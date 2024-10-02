import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Login here!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Company Logo
                  Image.asset(
                    'assets/colonyforumlogo.png', // Replace with your logo path
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  // Name Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Phone Number Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  // Address Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Proceed Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the ticket page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded edges
                      ),
                    ),
                    child: Text(
                      'Proceed to Your Ticket',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
