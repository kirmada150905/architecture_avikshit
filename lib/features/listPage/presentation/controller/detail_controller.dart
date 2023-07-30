import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../logic/detail_service.dart';
import '../../model/detail_model.dart';

part 'detail_controller.g.dart';

@riverpod
class DetailController extends _$DetailController {
  @override
  FutureOr build() {}

  Future<void> getData() async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => ref.read(detailServiceProvider).getData());
  }
}

final modelProvider = StateProvider<DetailModel>((ref) {
  return DetailModel(
    id: '',
    title: '',
    price: '',
    image: '',
    description: '',
    rating: Rating(rate: '', count: ''),
  );
});
