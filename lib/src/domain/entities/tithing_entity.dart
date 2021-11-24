import '../helpers/frequency_type.dart';
import 'user_entity.dart';

class TithingEntity {
  num value;
  String description;
  UserEntity member;
  FrequencyType frequencyType;
  
  TithingEntity({
    required this.value,
    required this.description,
    required this.member,
    required this.frequencyType,
  });
}
