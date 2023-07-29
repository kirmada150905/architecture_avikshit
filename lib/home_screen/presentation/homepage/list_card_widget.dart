import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/textstyles.dart';
import '../../model/detail_model.dart';

class ListCard extends StatelessWidget {
  //final Map<String, dynamic> data;
  final DetailModel detailModel;
  const ListCard({super.key, required this.detailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: BrandColor.bookingCardColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    Text(
                      detailModel.title.substring(0, 30),
                      // formatTimeofJourney(widget.data['time_of_journey']),
                      style: w400.size14.colorWhite,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.currency_rupee,
                        color: BrandColor.costColor,
                        size: 15,
                      ),
                    ),
                    Text(
                      detailModel.price,
                      //widget.data['trip_cost'].toString(),
                      textAlign: TextAlign.left,
                      style: w400.size14.copyWith(color: BrandColor.costColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 58,
                      child: Column(
                        children: [
                          Text(
                            detailModel.price,
                            //widget.data['trip']['start_location'],
                            textAlign: TextAlign.left,
                            style: w400.size15.colorWhite,
                          ),
                          Spacer(),
                          Text(
                            detailModel.price,
                            //widget.data['trip']['end_location'],
                            textAlign: TextAlign.left,
                            style: w400.size15.colorWhite,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 58,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
