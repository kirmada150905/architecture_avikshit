import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import '../../constants/textstyles.dart';
import '../listPage/model/detail_model.dart';

import 'base_container_widget.dart';

class LastScreen extends StatelessWidget {
  final DetailModel? detailModel;
  const LastScreen({super.key, required this.detailModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Text(
              "Product #${detailModel?.id}",
              style: v500.size20.colorWhite,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  detailModel!.image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.blue.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BaseContainerWidget(
                        subtitle: 'Price',
                        mainText: '\u{20B9} ${detailModel!.price}',
                        maintextcolor: BrandColor.priceHighlightColor,
                      ),
                      const Spacer(),
                      BaseContainerWidget(
                        subtitle: 'Ratings',
                        mainText:
                            '${detailModel!.rating.rate} (${detailModel!.rating.count} ratings)',
                        maintextcolor: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  BaseContainerWidget(
                    subtitle: 'Title',
                    mainText: detailModel!.title,
                    maintextcolor: Colors.white.withOpacity(0.9),
                  ),
                  BaseContainerWidget(
                    subtitle: 'Description',
                    mainText: detailModel!.description,
                    maintextcolor: Colors.white.withOpacity(0.9),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
