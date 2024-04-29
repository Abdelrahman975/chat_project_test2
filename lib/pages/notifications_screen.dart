import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Notifications extends StatelessWidget {
  static String id = 'Notifications Page';
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Notifications'),
          backgroundColor: Colors.greenAccent,
        ),
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _listViewItem(index);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 13,
        );
      },
      itemCount: 15,
    );
  }

  Widget _listViewItem(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _prefixIcon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _message(index),
                  _timeAndDate(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.greenAccent,
      ),
      child:
          const Icon(Icons.notifications, size: 25, color: Colors.amberAccent),
    );
  }

  Widget _message(int index) {
    double textSize = 14;
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: 'message',
        style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: const [
          TextSpan(
            text: ' description',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeAndDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '01/01/2024',
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
          Text(
            '12:00 pm',
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
