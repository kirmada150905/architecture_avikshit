import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/generics/model_factory.dart';
import '../../../utils/generics/service_generic.dart';

import '../data/detail_repo.dart';
import '../model/detail_model.dart';

part 'detail_service.g.dart';

class DetailService
    extends ServiceGeneric<DetailModel, DetailRepo, ModelFactory<DetailModel>> {
  DetailService({required super.ref});

  @override
  ModelFactory<DetailModel> createModelFactory() {
    return DetailModelFactory();
  }

  @override
  DetailRepo get repoProvider => ref.read(detailRepoProvider);
}

@riverpod
DetailService detailService(DetailServiceRef ref) {
  return DetailService(ref: ref);
}
