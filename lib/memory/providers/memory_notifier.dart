import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../memory.dart';

part 'memory_notifier.g.dart';

@riverpod
class MemoryNotifier extends _$MemoryNotifier {
  @override
  Future<List<Memory>> build() async {
    _initMemoryChannel();
    return ref.read(memoryRepositoryProvider).getMemories();
  }

  void _initMemoryChannel() {
    ref.read(memoryRepositoryProvider).memoryChannel.on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: '*',
        schema: 'public',
        table: 'memories',
      ),
      (payload, [_]) async {
        if (['INSERT', 'UPDATE', 'DELETE'].contains(payload['eventType'])) {
          state = await AsyncValue.guard(
            () async => ref.read(memoryRepositoryProvider).getMemories(),
          );
        }
      },
    ).subscribe();
  }
}
