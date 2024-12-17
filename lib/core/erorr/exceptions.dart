import 'package:movie_app/core/erorr/erorrmodel.dart';

class ServerException implements Exception {
  final ErorrModel erorrModel;

 const ServerException({required this.erorrModel});
}