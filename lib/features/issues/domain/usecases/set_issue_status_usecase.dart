import '../../data/services/issues_service.dart';

class SetIssueStatusUsecase {
  final IssuesService service;

  SetIssueStatusUsecase(this.service);

  Future<void> call(int id, String status) => service.updateIssueStatus(id, status);
}
