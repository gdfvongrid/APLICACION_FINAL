import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/tariff_repository.dart';

final tariffRepositoryProvider = Provider<TariffRepository>((ref) {
  return TariffRepository();
});

final tariffBundleProvider = FutureProvider<TariffBundle>((ref) async {
  final repo = ref.watch(tariffRepositoryProvider);
  return repo.loadTariffs();
});
