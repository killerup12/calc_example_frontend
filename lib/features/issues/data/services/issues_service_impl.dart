import 'dart:developer';

import 'package:calc_example_frontend/features/issues/data/dto/issue_dto.dart';
import 'package:dio/dio.dart';

import '../api.dart';
import 'issues_service.dart';

class IssuesServiceImpl implements IssuesService {
  final _dio = Dio(BaseOptions(headers: {'content-type': 'application/json'}))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Был отправлен запрос ${options.path} | ${options.method}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          log(
            'Запрос ${response.requestOptions.path} | ${response.requestOptions.method} -> ${response.statusCode}: ${response.statusMessage}',
          );
          handler.next(response);
        },
        onError: (exception, handler) async {
          log(
            'Ошибка ${exception.requestOptions.path} | ${exception.requestOptions.method} произошла ошибка ${exception.response?.statusCode ?? '?'}: ${exception.response?.statusMessage ?? '?'}:\n${exception.message}',
          );
          handler.next(exception);
          log(exception.requestOptions.headers.toString());
        },
      ),
    );

  @override
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
  }) async {
    await _dio.post(
      API_CREATE_ISSUE,
      data: {
        "fullName": fullName,
        "contactInfo": contactInfo,
        "preferredContactMethod": preferredContactMethod,
        "hasChinaExperience": hasChinaExperience,
        "hasSupplierContacts": hasSupplierContacts,
        "productDescription": productDescription,
        "existingProductLinks": existingProductLinks,
        "density": density,
        "previousInvoiceFile": "invoice.pdf",
        "expectedDeliveryDate": expectedDeliveryDate,
      },
    );
  }

  @override
  Future<List<IssueDto>> getIssues() {
    return _dio.get(API_ISSUES).then((value) => (value.data as List).map((e) => IssueDto.fromJson(e)).toList());
  }

  Future<IssueDto> getIssue(int id) {
    return _dio.get(API_ISSUE(id)).then((value) => IssueDto.fromJson(value.data));
  }

  @override
  Future<void> updateIssueStatus(int id, String status) {
    return _dio.patch(
      API_ISSUE(id),
      options: Options(method: 'PATCH'),
      data: {"status": status},
    );
  }
}
