import 'package:equatable/equatable.dart';

class ErorrModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErorrModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessage});
  factory ErorrModel.fromjson(Map<String, dynamic> json) {
    return ErorrModel(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message']);
  }

  @override
  List<Object?> get props => [success, statusCode, statusMessage];
}
