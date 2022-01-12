import 'package:Programa/components/chart.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

void main() {
  runApp(ProgramaApp());
}

class ProgramaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      
      // Colocando de modo geral um tema ou uma fonte especifíca
      theme: ThemeData(
        primarySwatch: Colors.purple, // => uma cor definida de forma mais especifíca vai sobrepor uma cor de modo genérico, => Da um Lista de cores
        accentColor: Colors.amber[900], // Cor de realse, realso o botão flutuante e botões que estão em elevação 
        fontFamily: 'Quicksand',//=> Altera as fontes do APP menos o AppBar de modo global, caso não estiver específicado os parâmetros abaixo
        
        // => Só foi possivel alterar as FONTES DEVIDO A ADIÇÃO AS FONTES NO PUBSPEC.YAML
        //=> Mexe de modo global no tema de título
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
              fontFamily: 'OpenSans',//=> Muda o titulo do APPBAR
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            
        ),
        
        //=> Muda o titulo do APPBAR
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith (
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// => Aqui era um componemte StatelessWidget, mas como foi trago as informações do componente TransactionUser vai alterar para um StatefulWidget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction>_transactions = [ //Notifica o App a pegar a lista de Transaction para não gerar um erro na aplicação
    Transaction(
      id: 't0',
      title: 'Novo',
      value: 450.9 ,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.7,
      date:DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2', 
      title: 'Conta de Luz', 
      value: 211.30, 
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract( // Aqui o resultado de isAfter é sepre um booleano 
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // => componente que faz o MODAL de digítação fechar
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent[700],
        title: Text('Despesas da Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>  _openTransactionFormModal(context),// Função do button superior da tela 
          )
        ],
      ),

      body: SingleChildScrollView(
        // Toda a tela fica rolavel por conta da função SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Chart(_recentTransactions), // Havia um Conteiner aqui fazendo os parâmetros do Grafico, agora esta sendo implementado 
            TransactionList(_transactions),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context), // onPressed => Função anônima vazia só para deixar o button flutuante habilitado
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Localização do button
    );
  }
}
