import 'package:calc_example_frontend/features/issues/issues.dart';
import 'package:calc_example_frontend/navigation/routes/routes.dart';
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

class IssuesScreen extends StatefulWidget {
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  final getIssuesUseCase = GetIssuesUseCase(IssuesServiceImpl());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IssueEntity>>(
      future: getIssuesUseCase.call(),
      builder: (BuildContext context, AsyncSnapshot<List<IssueEntity>> snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: snapshot.data!.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) => IssueCard(
            onPressed: () => IssueRoute(snapshot.data![index].id!).go(context),
            issue: snapshot.data![index],
          ),
        );
      },
    );
  }
}
