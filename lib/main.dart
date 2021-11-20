import 'package:Programa/components/transaction_form.dart';
import 'package:Programa/components/transaction_list.dart';
import 'package:Programa/models/transaction.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(ProgramaApp());
}

class ProgramaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now()
    ),
    
    Transaction(
      id: 't2', 
      title: 'Conta de Luz', 
      value: 211.30, 
      date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Despesas da Pessoais'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            //width: double.infinity, como esta sendo usado no CrossAxisAlignment com o stretch não é preciso definir o width
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
         // Aqui nesses dois Transactions forma divididos em duas class para tornar a arvore de componenete menor 
         TransactionList(_transactions),
         TransactionForm(),
        ],
      ),
    );
  }
}
