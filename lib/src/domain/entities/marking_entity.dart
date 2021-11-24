import 'note_entity.dart';
import 'passage_entity.dart';

class MarkingEntity {
  List<PassageEntity> passages;
  num bibleVersion;
  NoteEntity note;
  
  MarkingEntity({
    required this.passages,
    required this.bibleVersion,
    required this.note,
  });
}
