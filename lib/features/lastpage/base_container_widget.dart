import 'package:flutter/material.dart';

import '../../constants/textstyles.dart';

class BaseContainerWidget extends StatelessWidget {
  const BaseContainerWidget(
      {super.key,
      required this.subtitle,
      required this.mainText,
      required this.maintextcolor});

  final String subtitle, mainText;
  final Color maintextcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Spacer(),
          Text(
            subtitle,
            style: w600.size19
                .copyWith(color: const Color.fromARGB(255, 161, 208, 247)),
          ),
          const SizedBox(height: 2),
          Text(mainText, style: w500.size17.copyWith(color: maintextcolor)),
          // const Spacer(),
        ],
      ),
    );
  }
}
