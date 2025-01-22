import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/session_controller.dart';

final sessionControllerProvider = ChangeNotifierProvider<SessionController>(
      (ref) => SessionController.init()..loadSessions(),
);
