import 'package:auto_scroll/images_list_view.dart';
import 'package:flutter/material.dart';

class VerticalAutoScrollScreen extends StatelessWidget {
  const VerticalAutoScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292526),
      body: Stack(
        alignment: Alignment.center,
        children:[
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const [
                ImageListView(startIndex: 0),
                ImageListView(startIndex: 1),
                ImageListView(startIndex: 2),
                ]
          ),
          ),
        ],
      ),
    );
  }
}
