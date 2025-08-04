import 'package:calc_example_frontend/features/issues/issues.dart';
import 'package:flutter/material.dart';

class IssueScreen extends StatelessWidget {
  const IssueScreen({required this.issueId, super.key});

  final int issueId;

  @override
  Widget build(BuildContext context) {
    final getIssueUseCase = GetIssueUseCase(IssuesServiceImpl());

    return Scaffold(
      appBar: AppBar(title: Text('Заявка No ${issueId}')),
      body: FutureBuilder(
        future: getIssueUseCase.call(issueId),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return _IssueScreen(issue: snapshot.data!);
        },
      ),
    );
  }
}

class _IssueScreen extends StatefulWidget {
  const _IssueScreen({required this.issue});

  final IssueEntity issue;

  @override
  State<_IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<_IssueScreen> {
  final setIssueStatusUseCase = SetIssueStatusUsecase(IssuesServiceImpl());

  @override
  Widget build(BuildContext context) {
    final fields = [
      ListTile(
        leading: const Icon(Icons.check_box_outline_blank),
        title: Text('Статус'),
        subtitle: Text(widget.issue.status),
      ),
      ListTile(leading: const Icon(Icons.person), title: Text('ФИО'), subtitle: Text(widget.issue.fullName)),
      ListTile(
        leading: const Icon(Icons.call),
        title: Text('Контактная информация'),
        subtitle: Text(widget.issue.contactInfo),
      ),
      ListTile(
        leading: const Icon(Icons.star),
        title: Text('Предпочтительный способ связи'),
        subtitle: Text(widget.issue.preferredContactMethod),
      ),
      ListTile(
        leading: const Icon(Icons.check_box),
        title: Text('Работал ли с Китаем ранее'),
        subtitle: Text(widget.issue.hasChinaExperience ? 'Да' : 'Нет'),
      ),
      ListTile(
        leading: const Icon(Icons.check_box),
        title: Text('Имеются ли контакты поставщиков в Китае'),
        subtitle: Text(widget.issue.hasSupplierContacts ? 'Да' : 'Нет'),
      ),
      ListTile(
        leading: const Icon(Icons.description),
        title: Text('Описание товара'),
        subtitle: Text(widget.issue.productDescription),
      ),
      ListTile(
        leading: const Icon(Icons.link),
        title: Text('Ссылки на существующие товары'),
        subtitle: Text(widget.issue.existingProductLinks ?? '-'),
      ),
      ListTile(
        leading: const Icon(Icons.add_business_rounded),
        title: Text('Плотность'),
        subtitle: Text(widget.issue.density.toString()),
      ),
      ListTile(
        leading: const Icon(Icons.calendar_month),
        title: Text('Ожидает следующую поставку'),
        subtitle: Text(widget.issue.expectedDeliveryDate),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: const Text('Принять'),
            onPressed: () =>
                setIssueStatusUseCase.call(widget.issue.id!, 'open').then((value) => Navigator.pop(context)),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Отклонить'),
            onPressed: () =>
                setIssueStatusUseCase.call(widget.issue.id!, 'closed').then((value) => Navigator.pop(context)),
          ),
        ],
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: fields.length,
      separatorBuilder: (context, index) => const Divider(height: 8),
      itemBuilder: (context, index) => fields[index],
    );
  }
}
