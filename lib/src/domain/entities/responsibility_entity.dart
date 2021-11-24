import 'permission_entity.dart';

class ResponsibilityEntity {
  String name;
  List<PermissionEntity> permissions;
  
  ResponsibilityEntity({
    required this.name,
    required this.permissions,
  });
}
