import 'package:flutter/material.dart';

class criarConta extends StatefulWidget {
  const criarConta({super.key});

  @override
  State<criarConta> createState() => _criarContaState();
}

class _criarContaState extends State<criarConta> {
  
  var txtNome = TextEditingController();
  var txtMail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtConfirmaSenha = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.red.shade400,
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              50, 60, 50, 60),
          child: Column(
          children: [
            
            //SizedBox(height: 10),

            //NOME
            Row(
                children: [
                  Text('Nome', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 05),

                TextFormField(
                  controller: txtNome,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Digite seu nome',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

                  //VALIDADOR
                  validator: (value) {
                    if (value == null) {
                      return 'Digite seu nome';
                    } else if (value.isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  }),

              SizedBox(height: 20),

              //e-mail
              Row(
                children: [
                  Text('e-mail', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 05),

                TextFormField(
                  controller: txtMail,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Digite seu e-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

            	validator: (value) {
                    if (value == null) {
                      return 'Digite seu e-mail';
                    } else if (value.isEmpty) {
                      return 'Digite seu e-mail';
                    } else if (value != 'email@email.com') {
                      return 'E-mail inválido';
                    } //else if (value != 'teste') {
                      //return 'Digite um e-mail válido';
                    //}
                    return null;
                  }),
              
              SizedBox(height: 20),

              //SENHA + CONFIRMAÇÃO
              Row(
                children: [
                  Text('Senha', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 05),

              TextFormField(
                  controller: txtSenha,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Digite uma senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

                  //VALIDADOR
                  validator: (value) {
                    if (value == null) {
                      return 'Digite uma senha';
                    } else if (value.isEmpty) {
                      return 'Digite uma senha';
                    }
                    return null;
                  }),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Confirme sua senha', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 05),

              TextFormField(
                  controller: txtConfirmaSenha,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Digite novamente a senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

                  //VALIDADOR
                  validator: (value) {
                    if (value == null) {
                      return 'Digite novamente a senha';
                    } else if (value.isEmpty) {
                      return 'Digite novamente a senha';
                    } else if (value != txtSenha.text) {
                      return 'As senhas são diferentes';
                    }
                    return null;
                  }),

                  SizedBox(height: 40),

              //CONFIRMAR CADASTRO
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  ),
              
                  //EVENTO
                  onPressed: () {  
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, 'tela_inicial');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Usuário cadastrado com sucesso!',
                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700)),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 3),
                            ));                  
                    };
                  }, child: Text('Cadastrar', style:TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 10),

              //VOLTAR
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.black,
                  ),
              
                  //EVENTO
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');                 
                  }, child: Text('Voltar', style:TextStyle(fontSize: 20)),
                ),
            ],
          )
        ),
      ),
    );
  }
}