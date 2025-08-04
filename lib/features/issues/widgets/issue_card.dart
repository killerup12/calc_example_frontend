import 'package:flutter/material.dart';

import '../domain/entities/issue_entity.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({required this.issue, this.onPressed, super.key});

  final IssueEntity issue;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(leading: const Icon(Icons.person), title: Text(issue.fullName)),
                ),
                Text(issue.status),
              ],
            ),
            ListTile(title: Text(issue.expectedDeliveryDate), subtitle: Text(issue.productDescription)),
          ],
        ),
      ),
    );
  }
}
