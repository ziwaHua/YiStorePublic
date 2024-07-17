import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yistore/until/log_util.dart';

class YiBanner extends StatefulWidget {
  final List<String> imagesUrls;
  final Duration duration;
  final Function(int)? onBannerTap;

  YiBanner({
    required this.imagesUrls,
    required this.duration,
    this.onBannerTap,
  });

  @override
  _YiBannerState createState() => _YiBannerState();

}

class _YiBannerState extends State<YiBanner>{
  final PageController pageController = PageController();
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer = Timer.periodic(widget.duration, (timer) {
      if(pageController.hasClients){
        if (currentIndex < widget.imagesUrls.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
        pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn);
        logV("Timer triggered, currentIndex: $currentIndex");
      }
    });
  }

  @override
  dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              if (widget.onBannerTap != null) {
                widget.onBannerTap!(currentIndex);
              }
            },
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.imagesUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.imagesUrls[index],
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
        ),
        Positioned(
          bottom: 10.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imagesUrls.map((url){
              int index = widget.imagesUrls.indexOf(url);
              logD("currentIndex: $currentIndex, index: $index");
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? Colors.yellow
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}