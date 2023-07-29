import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/generics/repo_generic.dart';
import '../model/detail_model.dart';

part 'detail_repo.g.dart';

class DetailRepo extends RepoGeneric<List<DetailModel>?> {
  DetailRepo({required super.ref});

  @override
  String get relativeUrl => '/category/electronics';

  @override
  String get keyForList => '';

  @override
  bool get isList => true;
}

@riverpod
DetailRepo detailRepo(DetailRepoRef ref) {
  return DetailRepo(ref: ref);
}

final detailStreamProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(detailRepoProvider).dataStream());
