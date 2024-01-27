import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'SingInScreeen/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login_ui_model',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.8, end: 1.5).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent.shade700,
      extendBody: true,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(
              flex: 3,
            ),
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/image.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              "Login UI model 2",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Yellow Login Model",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const Text(
              "made by AbdeMohlbi",
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w100),
            ),
            const Spacer(
              flex: 1,
            ),
            Wrap(
              spacing: 50,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellowAccent.shade400,
                      shadowColor: Colors.white,
                      fixedSize: const Size(140, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("LOGIN")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shadowColor: Colors.white,
                      fixedSize: const Size(140, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: LogIn(),
                          pageAnimationType: RightToLeftTransition()));
                    },
                    child: const Text("SINGUP")),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
