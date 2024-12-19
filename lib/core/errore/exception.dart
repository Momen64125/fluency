import 'package:fluency/core/network/errore_message_model.dart';

class ServerException implements Exception {
final ErroreMessageModel erroreMessageModel;
const ServerException({required this.erroreMessageModel});
}