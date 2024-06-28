import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/router/constant_go_router.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/custom_button.dart';
import 'package:graduation_project/ui/widgets/viewpage/viewpage1.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewPages extends StatefulWidget {
  const ViewPages({super.key});

  @override
  State<ViewPages> createState() => _ViewPagesState();
}

class _ViewPagesState extends State<ViewPages> {
  PageController _controller = PageController();

  String lang = 'English';
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    var strings = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: 500,
          width: 500,
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              onLastPage = (index == 2);
              setState(() {});
            },
            children: const [
              ViewPage1(
                img: 'assets/images/course.jpg',
              ),
              ViewPage1(
                img: 'assets/images/4.jpg',
              ),
              ViewPage1(
                img: 'assets/images/online.jpg',
              ),
            ],
          ),
        ),
        const Positioned(
          child: Text(
            'Welcom to Derosy',
            style: TextStyle(
              fontSize: 50,
              fontFamily: 'Pacifico',
            ),
          ),
          bottom: 280,
        ),
        Container(
          alignment: const Alignment(0, 0.5),
          child: SmoothPageIndicator(
            effect: const WormEffect(
              activeDotColor: mainColor,
            ),
            controller: _controller,
            count: 3,
          ),
        ),
        onLastPage == false
            ? CustomButton(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Next')
            : CustomButton(
                onTap: () {
                  context.go(logInPage);
                },
                text: 'Start')
      ]),
    );
  }
}
