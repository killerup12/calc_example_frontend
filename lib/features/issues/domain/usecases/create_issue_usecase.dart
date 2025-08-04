import '../../data/services/issues_service.dart';

class CreateIssueUseCase {
  final IssuesService service;

  CreateIssueUseCase(this.service);

  // "full_name": fullNameController.text,
  // "contact_info": contactInfoController.text,
  // "preferred_contact_method": preferredContactMethodController.text,
  // "has_china_experience": hasChinaExperienceController.value,
  // "has_supplier_contacts": hasSupplierContactsController.value,
  // "product_description": productDescriptionController.text,
  // "existing_product_links": "https://example.com/product1",
  // "density": 0.5,
  // "previous_invoice_file": "invoice.pdf",
  // "expected_delivery_date": "2024-12-01",
  Future<void> call({
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
  }) async {
    await service.createIssue(
      fullName: fullName,
      contactInfo: contactInfo,
      preferredContactMethod: preferredContactMethod,
      hasChinaExperience: hasChinaExperience,
      hasSupplierContacts: hasSupplierContacts,
      productDescription: productDescription,
      existingProductLinks: existingProductLinks,
      density: density,
      // previousInvoiceFile: previousInvoiceFile,
      expectedDeliveryDate: expectedDeliveryDate,
    );
  }
}
