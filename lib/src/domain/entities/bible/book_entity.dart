import 'chapter_entity.dart';

class BookEntity {
  final String name;
  final String abbrev;
  final List<ChapterEntity> chapters;

  BookEntity({
    required this.name,
    required this.abbrev,
    required this.chapters,
  });
}
