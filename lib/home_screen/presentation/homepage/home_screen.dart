import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/textstyles.dart';

class HomeScreen extends StatelessWidget {
  final List<String> cardData = [
    'Electronics',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
    'Card 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        title: Text(
          'Online Shopping',
          style: w400.size20.colorWhite,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5, // Adjust this value to control the card width
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              final card = cardData[index];
              return GestureDetector(
                onTap: () => context.go("/listScreen"),
                child: Card(
                  child: Center(
                    child: Text(card),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
