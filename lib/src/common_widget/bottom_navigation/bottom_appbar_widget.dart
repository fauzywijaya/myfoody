import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/shared.dart';

class BottomAppBarWidget extends StatefulWidget {
  final Widget child;
  final int currentPage;
  final TabController tabController;
  final List<Color> colors;
  final Color backgroundColor;
  final Color unselectedColor;
  final Color selectedColor;
  final double end;
  final double start;
  const BottomAppBarWidget({
    required this.child,
    required this.currentPage,
    required this.tabController,
    required this.colors,
    required this.unselectedColor,
    required this.backgroundColor,
    required this.end,
    required this.start,
    Key? key,
    required this.selectedColor,
  }) : super(key: key);

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget>
    with SingleTickerProviderStateMixin {
  ScrollController scrollBottomAppBarWidgetController = ScrollController();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isScrollingDown = false;
  bool isOnTop = true;

  @override
  void initState() {
    myScroll();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, widget.end),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  void showBottomBar() {
    if (mounted) {
      setState(() {
        _controller.forward();
      });
    }
  }

  void hideBottomBar() {
    if (mounted) {
      setState(() {
        _controller.reverse();
      });
    }
  }

  Future<void> myScroll() async {
    scrollBottomAppBarWidgetController.addListener(() {
      if (scrollBottomAppBarWidgetController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          isOnTop = false;
          hideBottomBar();
        }
      }
      if (scrollBottomAppBarWidgetController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          isOnTop = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollBottomAppBarWidgetController.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        InheritedDataProvider(
          scrollController: scrollBottomAppBarWidgetController,
          child: widget.child,
        ),
        Positioned(
          bottom: widget.start,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: isOnTop == true ? 0 : 40,
            height: isOnTop == true ? 0 : 40,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        scrollBottomAppBarWidgetController
                            .animateTo(
                          scrollBottomAppBarWidgetController
                              .position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                            .then((value) {
                          if (mounted) {
                            setState(() {
                              isOnTop = true;
                              isScrollingDown = false;
                            });
                          }
                          showBottomBar();
                        });
                      },
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: widget.unselectedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: widget.start,
          child: SlideTransition(
            position: _offsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Material(
                    color: widget.backgroundColor,
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                      controller: widget.tabController,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: widget.currentPage >= 0
                                  ? widget.selectedColor
                                  : widget.unselectedColor,
                              width: 4),
                          insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
                      tabs: [
                        SizedBox(
                          height: AppSizes.customHeight(70),
                          width: AppSizes.customWidth(40),
                          child: Center(
                              child: Icon(
                            Icons.home,
                            color: widget.currentPage == 0
                                ? widget.selectedColor
                                : widget.unselectedColor,
                          )),
                        ),
                        SizedBox(
                          height: AppSizes.customHeight(70),
                          width: AppSizes.customHeight(40),
                          child: Center(
                              child: Icon(
                            Icons.favorite,
                            color: widget.currentPage == 1
                                ? widget.selectedColor
                                : widget.unselectedColor,
                          )),
                        ),
                        SizedBox(
                          height: AppSizes.customHeight(70),
                          width: AppSizes.customWidth(40),
                          child: Center(
                              child: Icon(
                            Icons.settings_rounded,
                            color: widget.currentPage == 2
                                ? widget.selectedColor
                                : widget.unselectedColor,
                          )),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
