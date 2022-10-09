import 'package:flutter/material.dart';
import 'package:thanghoang/themes/custom_theme.dart';
import 'package:thanghoang/widgets/custom_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.brown,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget get bottomNavigationBar{
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedItemColor: Theme.of(context).priceColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.home_filled,
                  size: 40),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.category,
                  size: 40),
              label: 'Emails',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.heart_broken,
                  size: 40),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.shopping_cart,
                  size: 40),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}