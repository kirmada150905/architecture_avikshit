import 'package:architecture_avikshit/features/listPage/model/detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
