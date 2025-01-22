
import '../../domain/entites/session_entity.dart';

class SessionModel extends SessionEntity {
  const SessionModel({
    required String name,
    required String date,
    required String status,
    required String duration,
    required String group
  }) : super(name: name, date: date, status: status, duration: duration,group: group);

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      duration: json['duration'] ?? '', group: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'status': status,
      'duration': duration,
    };
  }
}
