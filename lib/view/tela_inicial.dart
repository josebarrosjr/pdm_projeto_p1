import 'package:flutter/material.dart';
import 'package:p1_projeto/view/model/lista.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<Lista> dados = [];
  var txtNomeLista = TextEditingController();
  var editNomeLista = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Preencher a lista
    dados = Lista.gerarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black)),
        backgroundColor: Colors.red.shade400,
      
      //CARRINHO
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, 'carrinho');
            },
           ),
        ],
      ),
      
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //ENTRADAS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Entradas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            //Exibir
            _buildSection(0, 3),

            //PRATO PRINCIPAL"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Prato Principal',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            //Exibir
            _buildSection(3, 8),

            //BEBIDAS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Bebidas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            //Exibir
            _buildSection(8, 11),

            //SOBREMESA
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Sobremesa',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            //Exibir
            _buildSection(11, 13),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int startIndex, int endIndex) {
    return Column(
      children: List.generate(endIndex - startIndex, (index) {
        var item = dados[startIndex + index];
        return Card(
          child: ListTile(
            title: Text(
              item.nome,
              style: TextStyle(fontSize: 22),
            ),
            subtitle: Text(
              'R\$ ${item.preco.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            leading: Container(
              height: 50,
              width: 50,
              child: Image.asset(
                item.foto,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            hoverColor: Colors.blue.shade100,
            onTap: () {
              var itemSelecionado = item;
              Navigator.pushNamed(
                context,
                'detalhes',
                arguments: itemSelecionado,
              );
            },
          ),
        );
      }),
    );
  }
}
