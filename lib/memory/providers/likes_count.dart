import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/auth.dart';
import '../memory.dart';

part 'likes_count.g.dart';

@riverpod
Stream<LikesInfo> likesCount(LikesCountRef ref, Memory data) async* {
  final likesStream = ref.read(memoryRepositoryProvider).likes;
  final user = ref.watch(authUserProvider).asData?.value;

  await for (final likes in likesStream) {
    yield LikesInfo(
      count: likes.where((like) => like['memory_id'] == data.id).length,
      hasLiked: likes.any(
        (like) =>
            like['memory_id'] == data.id && like['profile_id'] == user?.id,
      ),
    );
  }
}
