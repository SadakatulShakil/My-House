import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar commonAppBar(context) {
  return AppBar(
    // elevation: 0,
    // titleSpacing: 0,
    leadingWidth: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: ClipOval(
              child: Image.asset('assets/images/profile.jpg', width: 40, fit: BoxFit.cover,),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mr. Jhon Smith',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'ECB, Dhaka cantonment, Dhaka',
              style: const TextStyle(fontSize: 12, color: Colors.white),
            )
          ],
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: 32,
              ),
              onPressed: (){
                print('Clicked notify');
              },
              // onPressed: () => Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //       builder: (context) => const NotificationScreen()),
              // ).then((response) => null),
            ),
            Positioned(
              right: 12,
              top: 15,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
                child: null,
              ),
            )
          ],
        ),
      ),
    ],
  );
}