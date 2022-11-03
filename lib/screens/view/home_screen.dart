import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_session_in_cairo/screens/view/chats/chat_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.blueGrey[500],
        child: Column(
          children: [
            const SizedBox(height: 15),
            for (int i = 1; i <= 10; i++)
              _getUsers("How are You now ?, You Feel Better ?", '1', 'User $i'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _getUsers(String messageText, String numberOfMessage, String nameOfUser) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatWidget()));
      },
      child: Row(
        children: [
          Column(
            children: const [
              FlutterLogo(
                size: 75.0,
                textColor: Colors.blue,
                style: FlutterLogoStyle.stacked,
              ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    nameOfUser,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                      height: 1,
                    ),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    messageText,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.blueGrey[200],
            child: Text(
              numberOfMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  _getDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Divider(
        color: Colors.blueGrey[400],
        thickness: 1,
        height: 1,
      ),
    );
  }
}
