import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../constant.dart';
import '../home/drawer/drawer_screen.dart';

class Reminder_page1 extends StatelessWidget {
  const Reminder_page1({super.key});
  static String id = 'Reminder1 Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_widget(),
      appBar: AppBar(
        title: const Text('Medication Reminder'),
        backgroundColor: KprimaryColor2,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ReminderForm(),
      ),
    );
  }
}

class ReminderForm extends StatefulWidget {
  const ReminderForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final TextEditingController medicationNameController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController dailyTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Logger logger = Logger();

  Future<void> _selectStartDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      startDateController.text = picked.toLocal().toString();
    }
  }

  Future<void> _selectEndDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      endDateController.text = picked.toLocal().toString();
    }
  }

  Future<void> _selectDailyTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      dailyTimeController.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: medicationNameController,
            decoration: const InputDecoration(
              labelText: 'Medicine Name',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: startDateController,
                  decoration: const InputDecoration(labelText: 'Start Date'),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: KprimaryColor2),
                onPressed: _selectStartDate,
                child: const Text(
                  'Start Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: endDateController,
                  decoration: const InputDecoration(labelText: 'End Date'),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: KprimaryColor2),
                onPressed: _selectEndDate,
                child: const Text(
                  'End Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: dailyTimeController,
                  decoration: const InputDecoration(labelText: 'Daily Time'),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: KprimaryColor2),
                onPressed: _selectDailyTime,
                child: const Text(
                  'Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: KprimaryColor2),
            onPressed: () async {
              if (mounted) {
                String medicationName = medicationNameController.text;
                String startDate = startDateController.text;
                String endDate = endDateController.text;
                String dailyTime = dailyTimeController.text;
                String description = descriptionController.text;

                logger.i('Medicine Name: $medicationName');
                logger.i('Start Date: $startDate');
                logger.i('End Date: $endDate');
                logger.i(' Daily Time: $dailyTime');
                logger.i('Description: $description');
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
