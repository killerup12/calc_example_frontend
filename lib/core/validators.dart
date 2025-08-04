abstract class Validators {
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }
}
