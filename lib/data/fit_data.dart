class Fit {
  final String title;
  final String subTitle;
  final String time;
  final String gitPath;
  final int seconds;

  Fit(
      {required this.title,
      required this.subTitle,
      required this.time,
      required this.seconds,
      required this.gitPath});
}

var fitData = [
  Fit(
    title: "Exersice 1",
    subTitle: 'Repeat 2 Times',
    time: "01:00 MIN",
    seconds: 90,
    gitPath: 'assets/images/gifs/ex1.gif',
  ),
  Fit(
    title: "Exersice 2",
    subTitle: 'Repeat 1 Times',
    time: "01:00 MIN",
    seconds: 30,
    gitPath: 'assets/images/gifs/ex2.gif',
  ),
  Fit(
    title: "Exersice 3",
    subTitle: 'Repeat 3 Times',
    time: "01:00 MIN",
    seconds: 40,
    gitPath: 'assets/images/gifs/ex3.gif',
  ),
  Fit(
    title: "Exersice 4",
    subTitle: 'Repeat 4 Times',
    time: "10 sec",
    seconds: 10,
    gitPath: 'assets/images/gifs/ex4.gif',
  ),
  Fit(
    title: "Exersice 5",
    subTitle: 'Repeat 2 Times',
    time: "01:00 MIN",
    seconds: 90,
    gitPath: 'assets/images/gifs/ex1.gif',
  ),
  Fit(
    title: "Exersice 6",
    subTitle: 'Repeat 2 Times',
    time: "01:00 MIN",
    seconds: 90,
    gitPath: 'assets/images/gifs/ex6.gif',
  ),
];
