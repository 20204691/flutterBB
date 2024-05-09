import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/widgets/custom_text_field.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final TextEditingController _medicationName = TextEditingController();
  bool switchValue = true;

  var frequencies = ["Daily", "Weekly", "Monthly"];

  String selectedFrequency = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("What is the med name"),
                    CustomTextField(
                      hintText: 'Name of medicine',
                      keyboardType: TextInputType.text,
                      controller: _medicationName,
                      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Alias for Notification"),
                        CupertinoSwitch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Dosage',
                            keyboardType: TextInputType.text,
                            controller: _medicationName,
                            backgroundColor:
                                const Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Units',
                            keyboardType: TextInputType.text,
                            controller: _medicationName,
                            backgroundColor:
                                const Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 10,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("How Often is the medication"),
                    const SizedBox(height: 20),
                    _medicineDropDownBuild(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Start date',
                            keyboardType: TextInputType.text,
                            controller: _medicationName,
                            backgroundColor:
                                const Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Taken at',
                            keyboardType: TextInputType.text,
                            controller: _medicationName,
                            backgroundColor:
                                const Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade400,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _medicineDropDownBuild() {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (value) {
        setState(() {
          selectedFrequency = value;
        });
      },
      itemBuilder: (BuildContext context) {
        return frequencies
            .map(
              (e) => PopupMenuItem<String>(
                child: Text(e),
              ),
            )
            .toList();
      },
      child: CustomTextField(
        enabled: false,
        hintText:
            selectedFrequency.isEmpty ? 'Name of medicine' : selectedFrequency,
        keyboardType: TextInputType.text,
        controller: _medicationName,
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      ),
    );
  }
}
