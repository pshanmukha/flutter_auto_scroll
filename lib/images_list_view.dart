import 'dart:async';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  final int startIndex;

  const ImageListView({required this.startIndex});

  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final _scrollController = ScrollController();
  List<String> urls = [
    'https://picsum.photos/600/1400',
    'https://picsum.photos/700/1500',
    'https://picsum.photos/800/1600',
    'https://picsum.photos/1000/1700',
    'https://picsum.photos/1100/1800',
    'https://picsum.photos/1200/1900',
    'https://picsum.photos/1300/2000',
    'https://picsum.photos/1400/2100',
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients) {
        double minScrollExtent = _scrollController.position.minScrollExtent;
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 25,
            _scrollController);
      }
    });
    super.initState();
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    if(_scrollController.hasClients) {
      scrollController
          .animateTo(direction,
          duration: Duration(seconds: seconds), curve: Curves.linear)
          .then((value) {
        direction = direction == max ? min : max;
        animateToMaxMin(max, min, direction, seconds, scrollController);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return /*CachedNetworkImage(
                  imageUrl: urls[widget.startIndex + index],
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      margin: const EdgeInsets.only(
                          right: 8.0, left: 8.0, top: 10.0),
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  })*/
                Container(
                  margin: const EdgeInsets.only(
                      right: 8.0, left: 8.0, top: 10.0),
                  height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)),
                  child: Image.network(
                    urls[widget.startIndex + index],
                    width: MediaQuery.of(context).size.width * 0.90,
                    fit: BoxFit.cover,
                  ),
                )
                ;
            },
          )),
    );
  }
}
