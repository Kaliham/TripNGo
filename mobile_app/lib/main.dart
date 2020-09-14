import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mobile_app/constants.dart';
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
    return NeumorphicApp(
      title: 'TripNGo',
      themeMode: ThemeMode.light, //or dark / system
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xff333333),
        accentColor: Colors.green,
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.3,
      ),
      theme: NeumorphicThemeData(
        baseColor: Color(0xffDDDDDD),
        accentColor: Colors.cyan,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
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
  LiquidController liquidController;
  AnimationController animController, botAnimCont;
  Animation curvedAnim, colorAnim, colorAnim2, botAnim;
  @override
  void initState() {
    super.initState();
    _index = 1;
    liquidController = new LiquidController();
    animController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    curvedAnim =
        new CurvedAnimation(parent: animController, curve: Curves.easeIn);
    colorAnim =
        ColorTween(begin: Colors.deepPurple[200], end: lightBackgroundColor)
            .animate(curvedAnim);
    colorAnim2 =
        ColorTween(begin: Colors.deepPurple[300], end: lightBackgroundColor)
            .animate(curvedAnim);
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return buildMainScreen(context);
  }

  List<Widget> buildPages(BuildContext context) {
    return [
      AnimatedBuilder(
        animation: colorAnim,
        builder: (context, val) => Container(
          width: double.infinity,
          color: colorAnim.value,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: TripsScreen(),
            ),
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
        disableUserGesture: false,
        pages: buildPages(context),
        initialPage: 1,
        liquidController: liquidController,
        onPageChangeCallback: (activePageIndex) {
          _index = activePageIndex;
          animController.reset();
          animController.forward();
        },
        slidePercentCallback: (slidePercentHorizontal, slideVertical) {
          if (slidePercentHorizontal > 30) {
            animController.reset();
          }
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: colorAnim,
        builder: (context, _) => CurvedNavigationBar(
          color: Colors.deepPurple[400],
          backgroundColor: colorAnim.value,
          // these are place holders
          index: _index,
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
      ),
    );
  }
}
