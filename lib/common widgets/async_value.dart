import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function()? loading;
  final Widget Function(Object e, StackTrace st)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) =>
          error != null ? error!(e, st) : const Center(child: Text('error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    required this.error,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function(Object err, StackTrace st) error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator())),
      error: error,
    );
  }
}
