import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'segment_provider.g.dart';

enum SegmentType { all, done, pending }

@riverpod
class Segment extends _$Segment {
  @override
  SegmentType build() {
    return SegmentType.all;
  }

  void changeSegment(SegmentType newSegment) {
    state = newSegment;
  }
}
