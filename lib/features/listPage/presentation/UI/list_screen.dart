import 'package:architecture_avikshit/constants/colors.dart';

import 'package:architecture_avikshit/utils/generics/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common widgets/async_value.dart';
import '../../../../constants/textstyles.dart';
import '../../data/detail_repo.dart';
import '../../model/detail_model.dart';
import '../controller/detail_controller.dart';
import 'list_card_widget.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListScreen> createState() => ListScreenState();
}

class ListScreenState extends ConsumerState<ListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(detailControllerProvider.notifier).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      detailControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return const DetailsList();
  }
}

class DetailsList extends ConsumerWidget {
  const DetailsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailList = ref.watch(detailStreamProvider).value;
    return AsyncValueWidget(
      value: ref.watch(detailControllerProvider),
      data: (_) {
        if (detailList == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (detailList.isEmpty) {
          return const Text('empty');
        }

        return MainList(detailList: detailList);
      },
    );
  }
}

class MainList extends StatelessWidget {
  const MainList({
    super.key,
    required this.detailList,
  });

  final List<DetailModel> detailList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 45,
      ),
      backgroundColor: BrandColor.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Products", style: v500.size25.colorWhite),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: detailList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListCard(
                  detailModel: detailList[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
