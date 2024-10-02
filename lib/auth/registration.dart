import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  final planNameController = TextEditingController();
  final planDaysController = TextEditingController();
  final planScanCountController = TextEditingController();
  final planPriceController = TextEditingController();
  final uniqueIdController = TextEditingController();
  final planStatusController = TextEditingController();
  final planStartDateController = TextEditingController();
  final planStartTimeController = TextEditingController();
  final planTicketTypeController = TextEditingController();
  final imagePathController = TextEditingController();
  final scanTicketController = TextEditingController();

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a new document in Firestore
        await FirebaseFirestore.instance.collection('kf_registered_user').add({
          'kf_regi_basic_name': nameController.text,
          'kf_regi_basic_contact': contactController.text,
          'kf_regi_basic_address': addressController.text,
          'kf_plan_name': planNameController.text,
          'kf_plan_days': int.parse(planDaysController.text),
          'kf_plan_scan_count': int.parse(planScanCountController.text),
          'kf_plan_price': double.parse(planPriceController.text),
          'kf_regi_unique_id': uniqueIdController.text,
          'kf_plan_status': planStatusController.text,
          'kf_plan_sdate': planStartDateController.text,
          'kf_plan_stime': planStartTimeController.text,
          'kf_isdate': false, // Update based on your logic
          'kf_plan_tckt_type': planTicketTypeController.text,
          'kf_imgpath': imagePathController.text,
          'kf_scanticket': scanTicketController.text,
          'kf_scan_date': DateTime.now().toIso8601String(), // Use current date
          'kf_scan_time': TimeOfDay.now().format(context), // Use current time
        });

        // Clear the fields after submission
        _formKey.currentState!.reset();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User Registered')));
      } catch (e) {
        // Handle any errors here
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your contact' : null,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your address' : null,
              ),
              TextFormField(
                controller: planNameController,
                decoration: InputDecoration(labelText: 'Plan Name'),
              ),
              TextFormField(
                controller: planDaysController,
                decoration: InputDecoration(labelText: 'Plan Days'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: planScanCountController,
                decoration: InputDecoration(labelText: 'Plan Scan Count'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: planPriceController,
                decoration: InputDecoration(labelText: 'Plan Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: uniqueIdController,
                decoration: InputDecoration(labelText: 'Unique ID'),
              ),
              TextFormField(
                controller: planStatusController,
                decoration: InputDecoration(labelText: 'Plan Status'),
              ),
              TextFormField(
                controller: planStartDateController,
                decoration: InputDecoration(labelText: 'Plan Start Date'),
              ),
              TextFormField(
                controller: planStartTimeController,
                decoration: InputDecoration(labelText: 'Plan Start Time'),
              ),
              TextFormField(
                controller: planTicketTypeController,
                decoration: InputDecoration(labelText: 'Plan Ticket Type'),
              ),
              TextFormField(
                controller: imagePathController,
                decoration: InputDecoration(labelText: 'Image Path'),
              ),
              TextFormField(
                controller: scanTicketController,
                decoration: InputDecoration(labelText: 'Scan Ticket'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
