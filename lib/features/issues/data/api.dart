import '../../../environmentes.dart';

/// POST Создать новую заявку
late final API_CREATE_ISSUE = '$SERVER/api/v1/issue';

/// GET Получить список заявок
late final API_ISSUES = '$SERVER/api/v1/issues';

/// GET Получить заявку по ID
late final API_ISSUE = (int id) => '$SERVER/api/v1/issue/$id';
