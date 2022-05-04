import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firstrip/widgets/category_item.dart';
import 'package:firstrip/widgets/icon_box.dart';
import 'package:firstrip/widgets/notification_box.dart';
import 'package:firstrip/widgets/popular_item.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/recommend_item.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: buildAppbar(),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          buildHeader(),
          const SizedBox(
            height: 15,
          ),
          buildCategory(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Popüler Yerler",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          buildPopular(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Tavsiye edilen Yerler",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          buildRecommend(),
        ],
      ),
    );
  }

  Widget buildAppbar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 34,
          height: 34,
          child: IconBox(
            child: SvgPicture.asset("assets/icons/menu1.svg"),
            radius: 15,
            bgColor: appBgColor,
          ),
        ),
        const NotificationBox(
          notifiedNumber: 1,
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Profil ',
                  style: TextStyle(
                    height: 1.3,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: 'Recep,',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: '\nBugün Ne Bulmana Yardım Edebiliriz? ',
                  style: TextStyle(
                    height: 1.3,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int selectedCategoryIndex = 3;
  Widget buildCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 7, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              data: categories[index],
              isSelected: index == selectedCategoryIndex,
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPopular() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        populars.length,
        (index) => Container(
          margin: const EdgeInsets.only(right: 15),
          child: PopularItem(
            data: populars[index],
            onFavoriteTap: () {
              setState(() {
                populars[index]["is_favorited"] =
                    !populars[index]["is_favorited"];
              });
            },
            onTap: () {},
          ),
        ),
      )),
    );
  }

  Widget buildRecommend() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 15),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {},
              onFavoriteTap: () {
                setState(() {
                  recommends[index]["is_favorited"] =
                      !recommends[index]["is_favorited"];
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
