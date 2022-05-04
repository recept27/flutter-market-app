import 'package:firstrip/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "Yolculuğunuz için en iyi yeri bulun",
        description:
            "Rahatlayabileceğiniz destinasyonlar için en iyi ipuçlarımızı paylaşmaktan mutluluk duyuyoruz. Ama aynı zamanda en güzel şehir gezilerini de bulacaksınız!",
        pathImage: "assets/images/slide-1.png",
        styleTitle: const TextStyle(color: Colors.black),
      ),
    );
    slides.add(
      Slide(
        title: "Bir sonraki seyahatiniz için ilham alın",
        description:
            "Rahatlayabileceğiniz destinasyonlar için en iyi ipuçlarımızı paylaşmaktan mutluluk duyuyoruz. Ama aynı zamanda en güzel şehir gezilerini de bulacaksınız!",
        pathImage: "assets/images/slide-2.png",
        styleTitle: const TextStyle(color: Colors.black),
      ),
    );
    slides.add(
      Slide(
        title: "Firs İle En iyi Seçimleri Yapın",
        description:
            "Now eat well, don't leave the house,You can choose your favorite food only with one click",
        pathImage: "assets/images/slide-3.png",
        styleTitle: const TextStyle(color: Colors.black),
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    currentSlide.pathImage!,
                    matchTextDirection: true,
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title!,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: const Color.fromRGBO(250, 249, 249, 1),
      renderSkipBtn: const Text(
        "Atla",
        style: TextStyle(
            color: Color.fromRGBO(75, 85, 99, 1), fontWeight: FontWeight.bold),
      ),
      renderNextBtn: const Icon(
        Icons.arrow_forward,
        color: Color.fromRGBO(50, 183, 104, 1),
        size: 30.0,
      ),
      renderDoneBtn: const Text(
        "Başla",
        style: TextStyle(
          color: Color.fromRGBO(75, 85, 99, 1),
        ),
      ),
      colorDot: const Color.fromRGBO(50, 183, 104, 1),
      colorActiveDot: const Color.fromRGBO(230, 230, 230, 1),
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthPage(),
        ),
      ),
    );
  }
}
