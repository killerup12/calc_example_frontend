import 'package:calc_example_frontend/features/issues/issues.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';

class CreateIssueScreen extends StatefulWidget {
  const CreateIssueScreen({super.key});

  @override
  State<CreateIssueScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CreateIssueScreen> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier _isLoading = ValueNotifier(false);

  final createIssueUseCase = CreateIssueUseCase(IssuesServiceImpl());

  final fullNameController = TextEditingController();
  final contactInfoController = TextEditingController();
  final preferredContactMethodController = TextEditingController();
  final hasChinaExperienceController = ValueNotifier(false);
  final hasSupplierContactsController = ValueNotifier(false);
  final productDescriptionController = TextEditingController();
  final existingProductLinksController = TextEditingController();
  final volumeController = TextEditingController();
  final weightController = TextEditingController();
  final densityController = TextEditingController();
  final whereToShipController = ValueNotifier('Нет конкретных сроков');

  @override
  void dispose() {
    _isLoading.dispose();
    fullNameController.dispose();
    contactInfoController.dispose();
    preferredContactMethodController.dispose();
    hasChinaExperienceController.dispose();
    hasSupplierContactsController.dispose();
    productDescriptionController.dispose();
    existingProductLinksController.dispose();
    volumeController.dispose();
    weightController.dispose();
    densityController.dispose();
    whereToShipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('Новая заявка')),
      body: Builder(
        builder: (context) {
          final children = [
            InputStandard(controller: fullNameController, label: 'ФИО', required: true),
            InputStandard(controller: contactInfoController, label: 'Контактная информация', required: true),
            InputStandard(
              label: 'Предпочтительный способ связи',
              controller: preferredContactMethodController,
              required: true,
            ),
            ValueListenableBuilder(
              valueListenable: hasChinaExperienceController,
              builder: (context, value, child) {
                return CheckBox(
                  title: 'Работали ли вы с Китаем ранее',
                  value: value,
                  onChange: (value) => hasChinaExperienceController.value = value ?? false,
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: hasSupplierContactsController,
              builder: (context, value, child) {
                return CheckBox(
                  title: 'Имеются ли у Вас контакты поставщиков в Китае',
                  value: value,
                  onChange: (value) => hasSupplierContactsController.value = value ?? false,
                );
              },
            ),
            InputMultiline(label: 'Опишите товар', controller: productDescriptionController, required: true),
            InputMultiline(
              label: 'Ссылки на уже существующий товар (Ozon, WB, Poizon...)',
              controller: existingProductLinksController,
            ),
            Row(
              children: [
                Expanded(
                  child: InputDouble(label: 'Плотность', controller: densityController, required: true),
                ),
                IconButton(
                  icon: Icon(Icons.question_mark_outlined),
                  iconSize: 32,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Плотность'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Чтобы рассчитать плотность, необходимо ввести объем и вес.'),
                            InputDouble(label: 'Объем', controller: volumeController),
                            Divider(height: 16, color: Colors.black),
                            InputDouble(label: 'Вес', controller: weightController),
                            const SizedBox(height: 16),
                            ListenableBuilder(
                              listenable: Listenable.merge([volumeController, weightController]),
                              builder: (context, _) {
                                final volume = double.tryParse(volumeController.text) ?? 0;
                                final weight = double.tryParse(weightController.text) ?? 0;

                                final double result;
                                if (weight == 0) {
                                  result = 0;
                                } else {
                                  result = volume / weight;
                                }

                                return Row(
                                  children: [
                                    Text('Плотность: ${result.toStringAsFixed(2)}'),
                                    IconButton(
                                      icon: Icon(Icons.copy),
                                      iconSize: 32,
                                      onPressed: () =>
                                          Clipboard.setData(ClipboardData(text: result.toStringAsFixed(2))),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: whereToShipController,
              builder: (context, value, _) {
                return RadioList(
                  title: 'Когда Вы ожидаете следующую поставку',
                  options: ['Ближайшие 2 недели', 'Ближайший месяц', 'Нет конкретных сроков'],
                  value: whereToShipController.value,
                  onChanged: (value) => whereToShipController.value = value ?? 'Нет конкретных сроков',
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, value, child) => value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        if (!(_formKey.currentState?.validate() ?? false)) return;

                        _isLoading.value = true;
                        createIssueUseCase
                            .call(
                              fullName: fullNameController.text,
                              contactInfo: contactInfoController.text,
                              preferredContactMethod: preferredContactMethodController.text,
                              hasChinaExperience: hasChinaExperienceController.value,
                              hasSupplierContacts: hasSupplierContactsController.value,
                              productDescription: productDescriptionController.text,
                              existingProductLinks: existingProductLinksController.text,
                              density: double.tryParse(densityController.text) ?? 0.0,
                              expectedDeliveryDate: whereToShipController.value,
                            )
                            .then((_) {
                              _isLoading.value = false;
                              return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Успех'),
                                  content: const Text('Ваша заявка успешно отправлена.'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                                  ],
                                ),
                              );
                            })
                            .onError((error, stackTrace) {
                              _isLoading.value = false;
                              return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Ошибка'),
                                  content: Text(error.toString()),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Text('Отправить'),
                    ),
            ),
          ];

          return Form(
            key: _formKey,
            child: ListView.separated(
              itemCount: children.length,
              padding: const EdgeInsets.all(16.0),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => children[index],
            ),
          );
        },
      ),
    );
  }
}
