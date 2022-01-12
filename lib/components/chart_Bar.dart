import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double value;
  final double porcentagem;

  // Quando alguma palavra estiver com parenteses  ChartBar() dessa froma quer dizer que é um construtor
  ChartBar({
    this.label,
    this.value,
    this.porcentagem,
  }); // Isso aqui se chama um Argumento Nomeado 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ //children você utiliza quando quer utilizar uma LISTA de widgets. //Por exemplo, dentro de uma Column você colocaria vários textos children:[ Text('primeiro child') , Text('segundo child'), Text('ultimo child')] Neste caso, quando você passa o children:[ ] você informa para o seu compilador que o tipo de entrava vai ser uma lista de widgets (vários filhos).
        
        //Responsavel por adaptar e alinhar o texto dentro do tamanho proposto na caixa do
        Container(
          height: 20,
          child: FittedBox(
            child: Text('R\$${value.toStringAsFixed(2)}'),// Mostra quantas casas são mostrada depois da vírgula FittedBox
          ),
        ),

        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,// Faz com que o cursor de preenchimento da Barra inicie de baixo para cima 
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),// Arredonda as colunas 

                ),
              ),
             
              FractionallySizedBox(// É como se fosse um SizeBox fracionado onde cria a barra de porcentagem de acordo com o por cento %, estipulado 
                heightFactor: porcentagem, // O heightFactor Age como um fator de pintuta na quantia de quantos por cento é utilizado
                child: Container(
                  decoration: BoxDecoration(//Cria um widget que combina widgets comuns de pintura, posicionamento e dimensionamento.
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

            ],
          ), 
        ),
       
        SizedBox(height: 5),
        Text(label), // Coloca os dias da semana no SizeBox
      ],
    );
  }
}

// child utiliza um único Widget. Por exemplo, dentro de um widget container você irá colocar apenas UM widget texto. child: Text('Exemplo de child');