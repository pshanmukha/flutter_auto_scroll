import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalAutoScrollScreen extends StatefulWidget {
  const HorizontalAutoScrollScreen({Key? key}) : super(key: key);

  @override
  State<HorizontalAutoScrollScreen> createState() => _HorizontalAutoScrollScreenState();
}

class _HorizontalAutoScrollScreenState extends State<HorizontalAutoScrollScreen> {

  final _scrollController = ScrollController();
  List<String> urls = [
    'https://picsum.photos/1200/600',
    'https://picsum.photos/1200/700',
    'https://picsum.photos/1200/630',
    'https://picsum.photos/1200/512',
    'https://picsum.photos/1200/627',
    'https://picsum.photos/1200/620',
    'https://picsum.photos/1200/720',
    'https://picsum.photos/1200/550',
  ];

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    if(_scrollController.hasClients){
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292526),
      body: Center(
        child: Container(
          height: 350,
          child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: urls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child:
                    Image.network(
                      urls[index],
                      width: MediaQuery.of(context).size.width * 0.90,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
