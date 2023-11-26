import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnBoarding();
  }
}

class _OnBoarding extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        onLastPage
            ? Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 700),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/role_page');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          fixedSize: const Size(346, 50)),
                      child: Text(
                        'Зарегистрироваться',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('У вас уже есть аккаунт? ',
                            style: GoogleFonts.roboto(
                              color: grayColorDark,
                              fontSize: 14,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login_page');
                          },
                          child: Text(
                            'Войти',
                            style: GoogleFonts.roboto(
                              color: primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Container(
                alignment: const Alignment(0, 0.9),
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {

                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: const Text('SKIP'),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const SwapEffect(
                        activeDotColor: primaryColor,
                        dotColor: grayColorDark,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Дальше'),
                    )
                  ],
                ),
              )
      ],
    ));
  }
}
