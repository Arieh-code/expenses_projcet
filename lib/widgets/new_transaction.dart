import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx, {super.key});

  void submittedData() {
    final enteredTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enterAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submittedData(),
              ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submittedData(),
              ),
              TextButton(
                  onPressed: submittedData,
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: const Text('Add Transaction'))
            ]),
      ),
    );
  }
}
