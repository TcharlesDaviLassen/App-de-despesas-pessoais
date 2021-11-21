import 'package:flutter/material.dart';
import 'components/transaction_user.dart';



void main() {
  runApp(ProgramaApp());
}

class ProgramaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  
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
         // E depois em outra 
         TransactionUser(),
        ],
      ),
    );
  }
}
