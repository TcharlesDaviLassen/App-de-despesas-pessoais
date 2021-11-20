import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {

  // Aqui esqueci de adicionar os controllesr para tittle e value
  final titleController = TextEditingController();
  final valueController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, //Borduado do Card
      child: Padding(
        padding: const EdgeInsets.all(
            10), //Distância transversal da caixa de texto a caixa do padding
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
                decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Nova transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    // =>
                    print(titleController.text);
                    print(valueController.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
