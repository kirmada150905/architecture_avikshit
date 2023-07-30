import 'package:architecture_avikshit/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

import '../login screen/login_controller.dart';
import 'home_card_widget.dart';

class CategoryData {
  final String name;
  final String imageUrl;

  CategoryData({required this.name, required this.imageUrl});
}

final List<CategoryData> cardData = [
  CategoryData(name: 'electronics', imageUrl: PngAssets.electroIcon),
  CategoryData(name: 'jewelery', imageUrl: PngAssets.jewelIcon),
  CategoryData(name: "men's clothing", imageUrl: PngAssets.menIcon),
  CategoryData(name: "women's clothing", imageUrl: PngAssets.womenIcon),
];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider.notifier).state;
    final imageUrl = ref.watch(imageProvider.notifier).state;
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Row(
                children: [
                  const Spacer(),
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(
                      PngAssets.appLogo,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('X',
                      style: w800.size15.copyWith(
                        color: const Color.fromARGB(255, 125, 191, 246),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Text("Welcome to ShopLy",
                style: v500.size20.copyWith(
                  color: const Color.fromARGB(255, 125, 191, 246),
                )),
            Text("${name.split(' ').first}!",
                //style: w800.size36.colorWhite,
                style: v500.size20.copyWith(
                  color: const Color.fromARGB(255, 125, 191, 246),
                )),
            const SizedBox(
              height: 50,
            ),
            Text("Select Category ", style: v500.size30.colorWhite),
            const SizedBox(
              height: 40,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return HomeCardWidget(carddata: cardData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
