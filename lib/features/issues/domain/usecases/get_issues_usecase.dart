import '../../data/services/issues_service.dart';
import '../entities/issue_entity.dart';

class GetIssuesUseCase {
  final IssuesService service;

  GetIssuesUseCase(this.service);

  Future<List<IssueEntity>> call() async {
    final response = await service.getIssues();

    return response.map((e) => IssueEntity.fromDto(e)).toList();
  }
}
