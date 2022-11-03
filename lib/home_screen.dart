import 'package:flutter/material.dart';
import 'package:last_session_in_cairo/screens/view/account_screen.dart';
import 'package:last_session_in_cairo/screens/view/home_screen.dart';
import 'package:last_session_in_cairo/screens/view/notification_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectScreen = 0;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey[900],
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const FlutterLogo(
                            size: 75.0,
                            textColor: Colors.blue,
                            style: FlutterLogoStyle.stacked,
                          ),
                          const SizedBox(
                            width: 124.0,
                          ),
                          _iconButton(Icons.wb_sunny),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Flutter Round 1',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: const [
                          Text(
                            '+201027324902',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.blueGrey[800],
                height: 5,
                thickness: 1.2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _iconButton(Icons.group),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('New Group'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.person),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Contacts'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.person_add_alt_1_sharp),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('People Nearbly'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.save_alt),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Saved Message'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.phone),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Calls'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.settings),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Settings'),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.blueGrey[800],
                height: 10,
                thickness: 1.2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _iconButton(Icons.person_add),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Invite Freinds'),
                      ],
                    ),
                    Row(
                      children: [
                        _iconButton(Icons.add_box_rounded),
                        const SizedBox(
                          width: 18,
                        ),
                        _text('Connect Features'),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.blueGrey[800],
                height: 10,
                thickness: 0.8,
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                child: SizedBox(
                  width: 220,
                  child: MaterialButton(
                    splashColor: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _iconButton(Icons.east),
                          _text('Go Home'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        titleSpacing: 10,
        title: !isSearch
            ? const Text(
                'Connect',
              )
            : TextField(
                cursorColor: Colors.blueGrey[900],
                minLines: 1,
                maxLines: 100,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
        actions: [
          isSearch
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  }),
        ],
        backgroundColor: Colors.blueGrey[600],
        elevation: 8.0,
      ),
      body: _gettScreens(),
      bottomNavigationBar: _bottomNavigationBAr(),
    );
  }

  _bottomNavigationBAr() {
    return BottomNavigationBar(
      currentIndex: selectScreen,
      backgroundColor: Colors.blueGrey[600],
      onTap: (tappedScreen) {
        setState(() {
          selectScreen = tappedScreen;
        });
      },
      elevation: 9,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: 'Account',
        ),
      ],
    );
  }

  _gettScreens() {
    switch (selectScreen) {
      case 0:
        return HomeScreen();
      case 1:
        return NotificationScreen();
      case 2:
        return AccountScreen();
    }
  }

  _iconButton(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.white,
    );
  }

  _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
  }
}
