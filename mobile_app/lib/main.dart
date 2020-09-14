import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mobile_app/view/screens/home_screen.dart';
import 'package:mobile_app/view/screens/people_screen.dart';
import 'package:mobile_app/view/screens/profile_screen.dart';
import 'package:mobile_app/view/screens/trips_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripNGo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MainState createState() => MainState();
}

class MainState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _index;
  static LiquidController globalLiqController;
  LiquidController liquidController;
  AnimationController animController;
  Animation curvedAnim, colorAnim, colorAnim2;
  @override
  void initState() {
    super.initState();
    globalLiqController = new LiquidController();
    _index = 0;
    liquidController = new LiquidController();
    animController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    curvedAnim =
        new CurvedAnimation(parent: animController, curve: Curves.easeIn);
    colorAnim = ColorTween(begin: Colors.deepPurple[200], end: Colors.white)
        .animate(curvedAnim);
    colorAnim2 = ColorTween(begin: Colors.deepPurple[300], end: Colors.white)
        .animate(curvedAnim);
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        buildMainScreen(context),
        ProfileScreen(),
      ],
      liquidController: globalLiqController,
    );
  }

  List<Widget> buildPages(BuildContext context) {
    return [
      AnimatedBuilder(
        animation: colorAnim,
        builder: (context, val) => Container(
          width: double.infinity,
          color: colorAnim.value,
          child: SafeArea(
            child: TripsScreen(),
          ),
        ),
      ),
      AnimatedBuilder(
        animation: colorAnim,
        builder: (context, val) => Container(
          width: double.infinity,
          color: colorAnim2.value,
          child: SafeArea(
            child: HomeScreen(),
          ),
        ),
      ),
      AnimatedBuilder(
        animation: colorAnim,
        builder: (context, val) => Container(
          width: double.infinity,
          color: colorAnim.value,
          child: SafeArea(
            child: PeopleScreen(),
          ),
        ),
      ),
    ];
  }

  Widget buildMainScreen(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: buildPages(context),
        liquidController: liquidController,
        onPageChangeCallback: (activePageIndex) {
          animController.reset();
          animController.forward();
        },
        slidePercentCallback: (slidePercentHorizontal, slideVertical) {
          if (slidePercentHorizontal > 10 || slideVertical > 10) {
            animController.reset();
          }
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurple[400],
        backgroundColor: Colors.white,
        // these are place holders
        items: [
          Icon(
            Icons.airport_shuttle,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          _index = index;
          animController.reset();
          liquidController.animateToPage(page: _index, duration: 200);
        },
      ),
    );
  }
}
