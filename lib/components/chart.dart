import 'package:Programa/components/chart_Bar.dart';
import 'package:Programa/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_Bar.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransaction; // Usando o final para a funão não ser uma função  que possa ser alterada

  Chart(
    this.recentTransaction
  ); // Pra pegar essas transaç~oes e passar para o => final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions { // Dentro desse MAP tem dois valores que são String, Object
    return List.generate(7, (index) { //Pega os ultimos 7 dias e o gerenciador é o index 
      final weekDay = DateTime.now().subtract(
        Duration(days: index), // Cada vez que executar o generate vai  
      );

      double totalSum = 0.0;

      for(var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value; // Fazendo um a tribuição aditiva da recentTransaction que caiu na condição acima
        }      
      }
      
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value':  totalSum,
      };
      // Não avia esse método, foi implementado para reverter as barras e colocar o dia atual para a direirta 
    }).reversed.toList();
  }

  // Nessa expressão é criado um novo get referido-se a porcentagem total gasta na semana
  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) { // fold(initialValue, (previousValue, element) => null)  
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
     groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ROW engloba todos os componentes como linha
          children: groupedTransactions.map((tr){
           return Flexible(
             fit: FlexFit.tight, // FlexFit.tight torna o espaçamento entre as barrar mais rigorosa deixando com o mesma distância entre ambas as barras
             child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                /*  Aqui como se trata de um valor Object 
                colocamos as double 
                */
                porcentagem: (tr['value'] as double) / _weekTotalValue,
              ),
            );
           //Text('${tr['day']} : ${tr['value']}'); //Retornar um WIDGET já que o children recebe uma lista de componente => WIDGET
          }).toList(),
        ),
      ),
    );
  }
}
