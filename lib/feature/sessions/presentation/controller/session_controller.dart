import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/session_api_service.dart';
import '../../data/repository/session_repository_impl.dart';
import '../../domain/entites/session_entity.dart';
import '../../domain/usecase/fetch_sessions_usecase.dart';

class SessionController extends ChangeNotifier {
  final FetchSessionsUseCase fetchSessionsUseCase;
  String selectedTab = "Ongoing";

  List<SessionEntity> sessions = [
    SessionEntity(name: "Mohamed Halwani", date: "May 5, 2024, 16:00 PM", status: "Cancelled", duration: "15 min", group: 'Ongoing'),
    SessionEntity(name: "Mohamed Halwani", date: "May 3, 2024, 16:00 PM", status: "Schedule", duration: "15 min", group: 'History'),
    SessionEntity(name: "Mohamed Halwani", date: "May 1, 2024, 16:00 PM", status: "Ongoing", duration: "15 min", group: 'Ongoing'),
    SessionEntity(name: "Mohamed ", date: "May 7, 2024, 16:00 PM", status: "Ongoing", duration: "15 min", group: 'History'),
    SessionEntity(name: "Mohamed ", date: "May 7, 2024, 16:00 PM", status: "Done", duration: "15 min", group: 'Ongoing'),

    SessionEntity(name: "Mohamed Halwani", date: "May 5, 2024, 16:00 PM", status: "Cancelled", duration: "15 min", group: 'History'),
    SessionEntity(name: "Mohamed Halwani", date: "May 3, 2024, 16:00 PM", status: "Schedule", duration: "15 min", group: 'History'),
    SessionEntity(name: "Mohamed Halwani", date: "May 1, 2024, 16:00 PM", status: "Ongoing", duration: "15 min", group: 'Ongoing'),
    SessionEntity(name: "Mohamed ", date: "May 7, 2024, 16:00 PM", status: "Ongoing", duration: "15 min", group: 'Ongoing'),
    SessionEntity(name: "Mohamed ", date: "May 7, 2024, 16:00 PM", status: "Done", duration: "15 min", group: 'Ongoing'),
  ];
  List<SessionEntity> get filteredSessions {
    if (selectedTab == "Ongoing") {
      return sessions.where((session) => session.group == "Ongoing").toList();
    } else if (selectedTab == "History") {
      return sessions.where((session) => session.group == "History").toList();
    }
    return sessions;
  }


  bool isLoading = true;
  String? errorMessage;

  SessionController({required this.fetchSessionsUseCase});

  Future<void> loadSessions() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

    //  sessions = await fetchSessionsUseCase.execute();
    } catch (e) {
      errorMessage = 'Failed to load sessions';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setTab(String tab) {
    selectedTab = tab;
    loadSessions();
    notifyListeners();
  }

  static SessionController init() {
    final repository = SessionRepositoryImpl(SessionApiService(Dio()));
    final fetchSessionsUseCase = FetchSessionsUseCase(repository);
    return SessionController(fetchSessionsUseCase: fetchSessionsUseCase);
  }
}
