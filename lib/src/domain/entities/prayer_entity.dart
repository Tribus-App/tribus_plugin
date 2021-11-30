library church_plugin;
class PrayerEntity {
  String reason;
  String description;
  String member;
  bool receiveVisit;
  bool receivePhoneCall;
  
  PrayerEntity({
    required this.reason,
    required this.description,
    required this.member,
    required this.receiveVisit,
    required this.receivePhoneCall,
  });
}
