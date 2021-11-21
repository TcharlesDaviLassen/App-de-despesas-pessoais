import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple[900],
                    width: 3,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}', // toStringAsFixed Usado para exibir quantas casa decimais irá ser exibido aqui no caso 2
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                //Desafio Estilo Titulo & Data os tem as //
                crossAxisAlignment: CrossAxisAlignment.start, // coloca as linhas em estado inicial com o .start
                children: <Widget> [
                  Text(
                    //
                    tr.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ), // 

                  // Esse parametro chama e compõe a DATA
                  Text(
                    DateFormat('d MMM y')
                        .format(tr.date), // Formato de esposiçao da data
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(), // Ajuda a Tranformar o MAP em um modelo de lista
    );
  }
}
