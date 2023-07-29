import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/generics/repo_generic.dart';
import '../model/detail_model.dart';

part 'detail_repo.g.dart';

class DetailRepo extends RepoGeneric<List<DetailModel>?> {
  DetailRepo({required super.ref});

  @override
  String get relativeUrl {
    if (ref.read(categoryId) == null) {
      throw Exception('No stall is selected');
    }
    return '/category/${ref.read(categoryId)}';
  }

  @override
  String get keyForList => '';

  @override
  bool get isList => true;
}

@riverpod
DetailRepo detailRepo(DetailRepoRef ref) {
  return DetailRepo(ref: ref);
}

final categoryId = StateProvider<String?>((ref) => null);

final detailStreamProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(detailRepoProvider).dataStream());
