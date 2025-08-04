import '../dto/issue_dto.dart';

abstract interface class IssuesService {
  Future<void> createIssue({
    required String fullName,
    required String contactInfo,
    String? preferredContactMethod,
    required bool hasChinaExperience,
    required bool hasSupplierContacts,
    required String productDescription,
    String? existingProductLinks,
    required double density,
    // File? previousInvoiceFile,
    required String expectedDeliveryDate,
  });

  Future<List<IssueDto>> getIssues();

  Future<IssueDto> getIssue(int id);

  Future<void> updateIssueStatus(int id, String status);
}
