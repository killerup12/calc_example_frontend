// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueDto _$IssueDtoFromJson(Map<String, dynamic> json) => IssueDto(
  id: (json['id'] as num?)?.toInt(),
  fullName: json['fullName'] as String,
  contactInfo: json['contactInfo'] as String,
  preferredContactMethod: json['preferredContactMethod'] as String,
  hasChinaExperience: json['hasChinaExperience'] as bool,
  hasSupplierContacts: json['hasSupplierContacts'] as bool,
  productDescription: json['productDescription'] as String,
  existingProductLinks: json['existingProductLinks'] as String?,
  volume: (json['volume'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  density: (json['density'] as num?)?.toDouble(),
  previousInvoiceFile: json['previousInvoiceFile'] as String?,
  expectedDeliveryDate: json['expectedDeliveryDate'] as String,
  status: json['status'] as String? ?? 'open',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$IssueDtoToJson(IssueDto instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'contactInfo': instance.contactInfo,
  'preferredContactMethod': instance.preferredContactMethod,
  'hasChinaExperience': instance.hasChinaExperience,
  'hasSupplierContacts': instance.hasSupplierContacts,
  'productDescription': instance.productDescription,
  'existingProductLinks': instance.existingProductLinks,
  'volume': instance.volume,
  'weight': instance.weight,
  'density': instance.density,
  'previousInvoiceFile': instance.previousInvoiceFile,
  'expectedDeliveryDate': instance.expectedDeliveryDate,
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
