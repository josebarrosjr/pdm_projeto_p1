import 'package:flutter/material.dart';
import 'package:p1_projeto/view/model/cart.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    final items = Cart.items;
    final total = Cart.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              // Lógica do carrinho aqui
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.nome),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                          Row(
                            children: [
                              Text('Quantidade:'),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  //REDUZIR ITEM
                                  setState(() {
                                    if (item.quantidade > 1) {
                                      item.quantidade--;
                                    }
                                  });
                                },
                              ),
                              Text('${item.quantidade}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  //AUMENTAR ITEM
                                  setState(() {
                                    item.quantidade++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //REMOVER ITEM
                          setState(() {
                            Cart.removeItem(item);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            //VALOR DO CARRINHO
            Text(
              'Total: R\$ ${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            //BOTAO FINALIZAR COMPRA
            ElevatedButton(
              onPressed: () {
                //LIMPAR CARRINHO
                Cart.clearCart(); 
                Navigator.pushNamed(context, 'tela_inicial');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Pedido feito!',
                                style: TextStyle(fontSize: 20)),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 2),
                            ));
                /*
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.green, 
                    content: Text(
                      'Compra concluída!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, 
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'tela_inicial');
                        },
                        child: Text('OK', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );*/
              },
              child: Text('Finalizar Compra', style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
