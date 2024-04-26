import 'package:flutter/material.dart';
import 'package:projects/fit/fit_detail_page.dart';

class FitGetStartedPage extends StatefulWidget {
  const FitGetStartedPage({super.key});

  @override
  State<FitGetStartedPage> createState() => _FitGetStartedPage();
}

class _FitGetStartedPage extends State<FitGetStartedPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("BodyBoost"),
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        backgroundColor: const Color.fromRGBO(94, 113, 183, 1),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "WALKING IN PLACE",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex1.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "STEPS TO THE SIDES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex2.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "SHIN OVERLAP",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex3.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "SPREAD OF THE ARMS",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex4.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex5.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex6.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex7.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/ex8.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/Ex9.gif',
              ),
              const SizedBox(height: 3),
              fitContainerBuild(
                title: "RAISES THE KNEES",
                subTitle: "Repeat 2 Times",
                time: "01:00 MIN",
                gifPath: 'assets/images/gifs/Ex10.gif',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fitContainerBuild({
    required String title,
    required String subTitle,
    required String time,
    required String gifPath,
  }) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 96, 88, 88),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 123, 0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  gifPath,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FitDetailPage(
                          fitDataIndex: 0), // Need to refactor
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}
