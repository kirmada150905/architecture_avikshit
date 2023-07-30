import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../constants/textstyles.dart';
import '../listPage/data/detail_repo.dart';
import 'home_screen.dart';

class HomeCardWidget extends ConsumerWidget {
  const HomeCardWidget({
    super.key,
    required this.carddata,
  });

  final CategoryData carddata;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(categoryId.notifier).state = carddata.name;
        context.push("/home/:name/:url/listScreen"); //TODO:
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(3, 0, 13, 1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.blue.withOpacity(0.5))),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipOval(
                    child: Image.asset(
                      carddata.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  carddata.name,
                  textAlign: TextAlign.center,
                  style: w400.size16.colorWhite,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
