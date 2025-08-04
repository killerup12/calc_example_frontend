import 'package:json_annotation/json_annotation.dart';

part 'issue_dto.g.dart';

@JsonSerializable()
class IssueDto {
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

  IssueDto({
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

  factory IssueDto.fromJson(Map<String, dynamic> json) => _$IssueDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IssueDtoToJson(this);
}
