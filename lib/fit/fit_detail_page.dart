import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/fit_data.dart';

class FitDetailPage extends StatefulWidget {
  final int fitDataIndex;

  const FitDetailPage({super.key, required this.fitDataIndex});

  @override
  State<FitDetailPage> createState() => _FitDetailPageState();
}

class _FitDetailPageState extends State<FitDetailPage> {
  double _progressValue = 0;
  int _timerDurationInSeconds = 60;
  late int _elapsedSeconds;

  Timer? timer;

  bool showNextExercise = false;

  late int index;
  late Fit currentFit;

  @override
  void initState() {
    index = widget.fitDataIndex;
    currentFit = fitData[index];
    _elapsedSeconds = currentFit.seconds;
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer timer) {
        if (_elapsedSeconds <= 0) {
          _elapsedSeconds = 60;
          showNextExercise = false;
          timer.cancel();
        } else {
          setState(() {
            _elapsedSeconds -= 1;
            if (_elapsedSeconds < 10) {
              showNextExercise = true;
            }
            var temp = _timerDurationInSeconds - _elapsedSeconds;
            _progressValue = temp / _timerDurationInSeconds;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                currentFit.gitPath,
                fit: BoxFit.cover,
                width: 350, // Ширина изображения
                height: 350, // Высота изображения
              ),

              const SizedBox(height: 90),
              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (index <= 0) {
                        return;
                      }
                      index = index - 1;

                      setState(() {
                        currentFit = fitData[index];
                        _elapsedSeconds = currentFit.seconds;
                      });
                    },
                    child: const Icon(
                      Icons.skip_previous,
                      size: 48, // Custom size of the icon
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    highlightColor: Colors.indigo.shade100,
                    onTap: () {
                      if (timer == null || !timer!.isActive) {
                        startTimer();
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            backgroundColor: Colors.indigo.shade400,
                            value: _progressValue,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 205, 205, 205)),
                          ),
                        ),
                        Text(
                          '$_elapsedSeconds',
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (index >= fitData.length - 1) {
                        return;
                      }
                      index = index + 1;
                      log(fitData[index].title);

                      setState(() {
                        currentFit = fitData[index];
                        _elapsedSeconds = currentFit.seconds;
                      });
                    },
                    child: const Icon(
                      Icons.skip_next,
                      size: 48, // Custom size of the icon
                    ),

                  ),
                ],
              ),
              const Expanded(child: SizedBox(height: 20)),
              showNextExercise
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (index >= fitData.length - 1) {
                            return;
                          }
                          index = index + 1;
                          log(fitData[index].title);

                          setState(() {
                            currentFit = fitData[index];
                            _elapsedSeconds = currentFit.seconds;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 20,
                            )),
                        child: const Row(
                          children: [
                            Icon(Icons.abc), // Change to Image
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Next"),
                                Text("Seated Leg Stretch • 30 sec"),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),

              // Slider(
              //   value: _progressValue,
              //   onChanged: (newValue) {
              //     print(newValue);
              //     setState(() {
              //       _progressValue = newValue;
              //     });
              //   },
              //   min: 0,
              //   max: 1,
              // ),
              const SizedBox(height: 20),
            ],
          ),

        ),
      ),
    );
  }
}
