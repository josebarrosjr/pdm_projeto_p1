import 'package:flutter/material.dart';
import 'package:p1_projeto/view/model/cart.dart';
import 'package:p1_projeto/view/model/lista.dart';


class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  final TextEditingController quantidadeController = TextEditingController(text: '1'); // Controlador para a quantidade

  @override
  Widget build(BuildContext context) {
    Lista dados = ModalRoute.of(context)!.settings.arguments as Lista;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Item'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Image.asset(
                  dados.foto,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  subtitle: Text(
                    dados.nome,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ListTile(
                  title: Text('Descrição', style: TextStyle(fontSize: 22)),
                  subtitle: Text(
                    dados.descricao,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  title: Text('Preço', style: TextStyle(fontSize: 18)),
                  subtitle: Text(
                    'R\$ ${dados.preco.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                
                //CAMPO QUANTIDADE
                ListTile(
                  title: Text('Quantidade', style: TextStyle(fontSize: 18)),
                  subtitle: TextField(
                    controller: quantidadeController,
                    keyboardType: TextInputType.number, // Tipo de teclado numérico
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //labelText: 'Informe a quantidade',
                    ),
                  ),
                ),

                SizedBox(height: 20),
                
                //BOTAO ADICIONAR
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  ),

                  onPressed: () {
                    //VALIDACAO NUMERICA
                    int quantidade = int.tryParse(quantidadeController.text) ?? 1;
                    if (quantidade < 1) {
                      quantidade = 1;
                    }

                    setState(() {
                      Cart.addItem(CartItem(
                        nome: dados.nome,
                        preco: dados.preco,
                        quantidade: quantidade,
                      ));
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${quantidade}x ${dados.nome} adicionado!', style: TextStyle(fontSize: 20)),
                            backgroundColor: Colors.blue, duration: Duration(seconds: 2),
                        ),
                      );
                  },
                  child: Text('Adicionar ao Carrinho', style:TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ),
          
          //CARRINHO
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total do Carrinho:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'R\$ ${Cart.getTotalPrice().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}