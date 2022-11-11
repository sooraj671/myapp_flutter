import 'package:flutter/material.dart';

import 'secondpage/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String buttonName = 'Click';

  int currentIndex = 0;

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                color: Colors.green,
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const SecondPage();
                            },
                          ),
                        );
                      },
                      child: const Text('Next Page'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonName = 'Clicked';
                        });
                      },
                      child: Text(buttonName),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _isClicked = !_isClicked;
                    },
                  );
                },
                child: _isClicked
                    ? Image.asset('images/pic.jpeg')
                    : Image.network(
                        'https://images.pexels.com/photos/355508/pexels-photo-355508.jpeg'),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool _isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () => _isClicked = !_isClicked,
          child: _isClicked
              ? Image.asset('images/pic.jpeg')
              : Image.network(
                  'https://images.pexels.com/photos/355508/pexels-photo-355508.jpeg'),
        ),
      ),
    );
  }
}
