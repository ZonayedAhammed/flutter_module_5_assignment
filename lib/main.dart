import 'package:flutter/material.dart';

void main() => runApp(TabbedApp());

class TabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    Page(color: Colors.red, number: 1),
    Page(color: Colors.green, number: 2),
    Page(color: Colors.blue, number: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _navigateToPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _navigateToPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _navigateToPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _navigateToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Page extends StatelessWidget {
  final Color color;
  final int number;

  const Page({required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
      ),
      body: Center(
        child: Text(
          'Page $number',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}