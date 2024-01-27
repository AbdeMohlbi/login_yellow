import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  final Uri _url = Uri.parse('https://github.com/AbdeMohlbi');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode1.unfocus();
        _focusNode2.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.yellowAccent.shade700,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent.shade700,
          title: const Text('Sing In'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(children: [
                  Image.asset(
                    'assets/image1.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Welcome Back",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "provide your informations here",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "join our community",
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w100),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _focusNode1,
                  showCursor: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    label: Text('user name'),
                    prefixIcon: Icon(Icons.account_circle, color: Colors.black),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _focusNode2,
                  showCursor: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    label: Text('password'),
                    prefixIcon: Icon(Icons.password, color: Colors.black),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellowAccent.shade400,
                    shadowColor: Colors.white,
                    fixedSize: const Size(140, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("LOGIN")),
              const Text('OR'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellowAccent.shade100,
                  shadowColor: Colors.white,
                  fixedSize: const Size(140, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onPressed: () {},
                child: Wrap(
                  children: [
                    const Text("continue with "),
                    Center(
                      child: SvgPicture.asset(
                        'assets/google.svg',
                        height: 40,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('made by '),
                  GestureDetector(
                    onTap: () {
                      _launchUrl();
                    },
                    child: const Text(
                      'AbdeMohlbi',
                      style: TextStyle(
                        color: Colors.blue, // Set the desired text color here
                        fontSize:
                            24.0, // You can also customize other text properties
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
