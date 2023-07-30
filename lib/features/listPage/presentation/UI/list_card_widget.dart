import 'package:flutter/material.dart';

import '../../../../constants/textstyles.dart';
import '../../../lastpage/last_screen.dart';
import '../../model/detail_model.dart';

class ListCard extends StatelessWidget {
  final DetailModel detailModel;
  const ListCard({super.key, required this.detailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: GestureDetector(
        onTap: () {
          //context.pushNamed('/listScreen/model', extra: detailModel);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LastScreen(detailModel: detailModel), //TODO:
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.blue.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xffD9D9D9),
                  backgroundImage: NetworkImage(
                    detailModel.image,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\u{20B9} ${detailModel.price}/-',
                            style: w600.size17.copyWith(
                                color:
                                    const Color.fromARGB(255, 168, 207, 240)),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star_border_rounded,
                            size: 22,
                            color: Colors.yellow,
                          ),
                          Text(
                            detailModel.rating.rate,
                            style: w600.size12.copyWith(
                                color:
                                    const Color.fromARGB(255, 168, 207, 240)),
                          ),
                          const SizedBox(width: 17),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        detailModel.title,
                        style: w500.size12.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
