import 'package:flutter/material.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int index = 0;
  final pages = [
    Container(
          alignment: Alignment.center,
          child: Text('11', style: TextStyle(fontSize: 15)),
        ),
      Container(
        alignment: Alignment.center,
        child: Text('11', style: TextStyle(fontSize: 15)),
      ),
      Container(
        alignment: Alignment.center,
        child: Text('11', style: TextStyle(fontSize: 15)),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("CRDB"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Color.fromARGB(255, 9, 71, 41),
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
        body: pages[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          height: 60,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_balance_outlined),
              selectedIcon: Icon(Icons.account_balance_sharp),
              label: 'Bank',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ));
  }
}
