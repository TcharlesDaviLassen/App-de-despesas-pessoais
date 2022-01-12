import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// A qui era uma class  StatelessWidget, porém virou uma class StatefulWidget devido a uma alteração na class MAIN em relação ao => onPressed: () =>  _openTransactionFormModal(context)
class TransactionForm extends StatefulWidget {
  // Aqui esqueci de adicionar os controller para tittle e value
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    // =>
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;// ?? - operador se nulo, tryParse são usados para converter uma representação de string de um número em um inteiro. 

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      // se esses dados estiverem corretos chama a função
      return; // caso contrario sai da função
    }
    
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), 
      lastDate: DateTime.now()
    ).then((pickedDate) { // Chama uma ação futura quando executado o click, retorna a ler todo o argumento e cai aqui, se não passaria até a  Última linha
      if(pickedDate == null) {
        return;
      }

      // Aqui para aparecer os dados da data no logar de , Nenhuma data selecionada,  deve se setar o estado para aparecer na aba flutuante
      setState(() {
      _selectedDate = pickedDate;        
      });

    });

    // Última linha
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, //Borduado do Card
      child: Padding(
        padding: const EdgeInsets.all(10), //Distância transversal da caixa de texto a caixa do padding
        child: Column(
          children: <Widget>[
           
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(), // usando o (_) ignora a função declarada mas a utiliza // Submete diretamente no teclado não precisa clicar no button de nova transação para criar o dado
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
           
            Padding( // Aqui coloquei o Padding para definir um espaçamento mais coerente em relação ao espaçamento do título 
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ) ,
              child: TextField(
                  controller: _valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal:true), // usando o numberWithOptions vai funcionar tanto no Android como no IOS o teclado númerico
                  onSubmitted: (_) => _submitForm(), // Submete diretamente no teclado não precisa clicar no button de nova transação para criar o dado
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                  )
                ),
            ),
                
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded( // Expande e empurra o botão Selecionar Data para a direita
                        child: Text(
                        _selectedDate == null 
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM /y').format(_selectedDate)}'
                        ),
                      ),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          'Selecionar Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _showDatePicker, 
                      )
                    ],
                  ),
                ),
              
           
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Nova transação'
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
