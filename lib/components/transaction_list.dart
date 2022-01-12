import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
//import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //Estipula o tamanho da caixa onde vai a imagem
      child: transactions.isEmpty
          ? Column(
              // Se o guia de transação estiver vazio vai interpreta esse parametro ate os ///

              children: <Widget>[
                SizedBox(height: 20), // Espaçamento da linha entre os widgets
                Text(
                  'Nenhuma Transação Cadastrata!',
                  style: Theme.of(context).textTheme.headline6,
                ),

                SizedBox(height: 20),

                Container(
                  height: 200, // Aumenta a dimensão da imagem em altura
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover, // Ajusta ao tamanho da caixa Estipulado
                  ),
                ),
              ],
            )

          ///

          // Caso contrário lerá abaixo
          : ListView.builder(
              // Este construtor é apropriado para visualizações de lista com um grande (ou infinito) número de filhos porque o construtor é chamado apenas para aqueles filhos que estão realmente visíveis.
              // Essa função deixa a aplicação mais leve dando uma experiência mais fluida
              itemCount: transactions.length, //=> quantidade de itens na lista
              itemBuilder: (ctx, index) {
                //=>Analisa e mostra quando e quantos elementos são necessários para exibição
                //

                final tr = transactions[index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                 
                  child: ListTile(
                    //Com essa fumção faz com que as caixas de valores fiquem redondas
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                       
                        child: FittedBox(
                          //  Fez com que o texto se encaixasse dentro do circulo
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),

                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

/*
Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15, 
                    vertical: 10
                    ),
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
                      color: Theme.of(context).primaryColor, // Definição de cor principal no  APP 
                      //color: Colors.purple,
                    ),
                  ),
                ),

                Column(
                  //Desafio Estilo Titulo & Data os tem as //
                  crossAxisAlignment: CrossAxisAlignment.start, // coloca as linhas em estado inicial com o .start
                  children: <Widget>[
                    Text(
                      //
                      tr.title,
                      style: Theme.of(context).textTheme.headline6, // Alteradno de modo específico o tema do título
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
                )
              ],
            ),
          ); */
