import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects/medicine/medicine_page.dart';

import '../common/model/medicine_model.dart';

///
/// Here is the list of medicines
///
class MedicineListPage extends StatefulWidget {
  const MedicineListPage({super.key});

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  @override
  void initState() {
    super.initState();

    /// При открытии страницы получаем данные
    getMedicines();
  }

  /// The method to get data
  getMedicines() async {
    var data = await RealtimeDatabase.read(
        userId: FirebaseAuth.instance.currentUser!.uid);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MedicinePage(),
            ),
          ).then((value) {
            setState(() {
              getMedicines();
            });
          });
        },
      ),
      body: FutureBuilder(
          future: getMedicines(),
          builder: (context, snapshot) {
            var data = snapshot.data != null
                ? snapshot.data as Map<dynamic, dynamic>
                : null;
            return data != null
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: data.entries
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  /// Здесь можно сделать переход на детальную страницу Medicine
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.value['name'],
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("UNITS"),
                                          Text(
                                            e.value['units'],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("TAKEN"),
                                          Text(
                                            e.value['taken'],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("frequency"),
                                          Text(
                                            e.value['frequency'],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                : const SizedBox();
          }),
    );
  }
}
