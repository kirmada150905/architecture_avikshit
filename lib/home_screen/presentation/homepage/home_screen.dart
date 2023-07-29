import 'package:architecture_avikshit/home_screen/data/detail_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/textstyles.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String? name;
  final String? imageUrl;
  const HomeScreen({required this.name, required this.imageUrl, Key? key})
      : super(key: key);
  //const HomeScreen(this.name, this.imageUrl, {super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<String> cardData = [
    'Electronics',
    'jewelery',
    "men's clothing",
    "women's clothing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'Online Shopping App',
          style: w600.size20.colorWhite,
        ),
        backgroundColor: Colors.transparent,
        //centerTitle: true,
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      widget.imageUrl!,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome!',
                          style: w500.size10.copyWith(color: Colors.blue)),
                      Text('${widget.name}', style: w500.size15.colorWhite),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Select Category ",
                //style: w800.size36.colorWhite,
                style: GoogleFonts.archivoBlack(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),

            SizedBox(
              height: 40,
            ),

            FractionallySizedBox(
              widthFactor: 0.8, // Adjust this value to control the card width
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final cardText = cardData[index];
                  return HomeCardWidget(card: cardText);
                },
              ),
            ),
            // Expanded(
            //     child: Container(
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage('assets/bg.png')))))
          ],
        ),
      ),
    );
  }
}

class HomeCardWidget extends ConsumerWidget {
  const HomeCardWidget({
    super.key,
    required this.card,
  });

  final String card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(categoryId.notifier).state = card;
        context.go("/home/:name/:url/listScreen");
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(3, 0, 13, 1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.blue.withOpacity(0.5))),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  height: 45,
                  width: 45,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/jewel.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  card,
                  textAlign: TextAlign.center,
                  style: w400.size18.colorWhite,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
