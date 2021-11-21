import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

//Por qual motivo agora é StatefulWidget, pq agora irá ser alterado e mexido na lista _transaction em main embora ela possa ser final o conteúdo da lista pode ir evoluindo 
class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

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
    return Column(
      children: <Widget> [
        TransactionForm(),
        TransactionList(_transactions)
      ],
      
    );
  }
}