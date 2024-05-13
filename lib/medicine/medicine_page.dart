import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/common/dialogs/dialogs.dart';
import 'package:projects/common/model/medicine_model.dart';

import '../common/widgets/custom_text_field.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _medicationName = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _takenAt = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();

  bool isLoading = false;

  bool switchValue = false;

  var frequencies = ["Daily", "Weekly", "Monthly"];

  String selectedFrequency = "";

  TimeOfDay selectedTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
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
                        backgroundColor:
                            const Color.fromARGB(255, 216, 216, 216),
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
                              controller: _dosageController,
                              backgroundColor:
                                  const Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Units',
                              keyboardType: TextInputType.text,
                              controller: _unitController,
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
                            child: GestureDetector(
                              onTap: () {
                                DateDialogs.showDate(
                                  context,
                                  (dateTime) => _startDateController.text =
                                      dateTime.toString().substring(0, 10),
                                );
                              },
                              child: CustomTextField(
                                enabled: false,
                                hintText: 'Start date',
                                keyboardType: TextInputType.text,
                                controller: _startDateController,
                                backgroundColor:
                                    const Color.fromARGB(255, 216, 216, 216),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _selectTime(context);
                              },
                              child: CustomTextField(
                                enabled: false,
                                hintText: 'Taken at',
                                keyboardType: TextInputType.text,
                                controller: _takenAt,
                                backgroundColor:
                                    const Color.fromARGB(255, 216, 216, 216),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Fill this field";
                                  }
                                  return null;
                                },
                              ),
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
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade400,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () async {
                    var userId = FirebaseAuth.instance.currentUser?.uid;
                    if (_formKey.currentState?.validate() ?? false) {
                      if (userId != null) {
                        setState(() {
                          isLoading = true;
                        });
                        var data = {
                          'name': _medicationName.text,
                          'dosage': _dosageController.text,
                          'units': _unitController.text,
                          "frequency": _frequencyController.text,
                          "start_date": _startDateController.text,
                          "taken":
                              "${selectedTime.hour}:${selectedTime.minute}",
                        };

                        await RealtimeDatabase.write(
                            userId: userId, data: data);

                        if (context.mounted) Navigator.pop(context);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        _takenAt.text = "${selectedTime.hour}:${selectedTime.minute}";
      });
    }
  }

  Widget _medicineDropDownBuild() {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (value) {
        setState(() {
          _frequencyController.text = value;
        });
      },
      itemBuilder: (BuildContext context) {
        return frequencies
            .map(
              (e) => PopupMenuItem<String>(
                value: e,
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
        controller: _frequencyController,
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      ),
    );
  }
}
