import 'package:flutter/material.dart';

import '../reusables/custom_text_form.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _dateBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          children: [
            CustomTextForm(
              controller: _userNameController,
              label: 'User Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextForm(
              controller: _firstNameController,
              label: 'First Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextForm(
              controller: _lastNameController,
              label: 'Last Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextForm(
              controller: _dateBirthController,
              label: 'Date of Birth',
            ),
          ],
        ),
      ),
    );
  }

  dateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 50),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.pink,
              onPrimary: Colors.white,
              surface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white),
        child: child ?? const Text(''),
      ),
    );

    if (newDate == null) {
      return;
    }

    setState(() {
      _dateBirthController.text = newDate.toIso8601String();
    });
  }
}
