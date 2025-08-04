import '../../data/services/issues_service.dart';
import '../entities/issue_entity.dart';

class GetIssueUseCase {
  final IssuesService service;

  GetIssueUseCase(this.service);

  Future<IssueEntity> call(int id) async {
    final issueDto = await service.getIssue(id);

    return IssueEntity.fromDto(issueDto);
  }
}
