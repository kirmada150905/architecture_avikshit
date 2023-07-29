import 'package:architecture_avikshit/utils/generics/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common widgets/async_value.dart';

import '../../data/detail_repo.dart';
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
    return const PendingList();
  }
}

class PendingList extends ConsumerWidget {
  const PendingList({
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
        print('testtttttttttttttttttttttt${detailList.length}');
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: detailList.length,
          itemBuilder: (BuildContext context, int index) {
            print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${detailList}");
            return ListCard(
              detailModel: detailList[index],
            );
          },
        );
      },
    );
  }
}
