import '../../data/dto/issue_dto.dart';

class IssueEntity {
  final int? id;
  final String fullName;
  final String contactInfo;
  final String preferredContactMethod;
  final bool hasChinaExperience;
  final bool hasSupplierContacts;
  final String productDescription;
  final String? existingProductLinks;
  final double? volume;
  final double? weight;
  final double? density;
  final String? previousInvoiceFile;
  final String expectedDeliveryDate;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  IssueEntity({
    this.id,
    required this.fullName,
    required this.contactInfo,
    required this.preferredContactMethod,
    required this.hasChinaExperience,
    required this.hasSupplierContacts,
    required this.productDescription,
    this.existingProductLinks,
    this.volume,
    this.weight,
    this.density,
    this.previousInvoiceFile,
    required this.expectedDeliveryDate,
    this.status = 'open',
    this.createdAt,
    this.updatedAt,
  });

  factory IssueEntity.fromDto(IssueDto dto) {
    return IssueEntity(
      id: dto.id,
      fullName: dto.fullName,
      contactInfo: dto.contactInfo,
      preferredContactMethod: dto.preferredContactMethod,
      hasChinaExperience: dto.hasChinaExperience,
      hasSupplierContacts: dto.hasSupplierContacts,
      productDescription: dto.productDescription,
      existingProductLinks: dto.existingProductLinks,
      volume: dto.volume,
      weight: dto.weight,
      density: dto.density,
      previousInvoiceFile: dto.previousInvoiceFile,
      expectedDeliveryDate: dto.expectedDeliveryDate,
      status: dto.status,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
