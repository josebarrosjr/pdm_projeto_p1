import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  //Identificador do formulário
  var formKey = GlobalKey<FormState>(); //validar o formulário

  //Controladores dos campos de texto
  var txtMail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          //padding: const EdgeInsets.all(50.0), //automático para todas as bordas
          padding: const EdgeInsets.fromLTRB(
              50, 60, 50, 60), // left-top-right-bottom
          child: Column(
            children: [

              Icon(Icons.food_bank , size: 100),
              Text('Cardápio Online', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),

              SizedBox(height: 80),

              Row(
                children: [
                  Text('Login', style: TextStyle(fontSize: 25)),
                ],
              ),

              //CAMPO EMAIL
              TextFormField(
                  controller: txtMail,
                  style: TextStyle(fontSize: 28),
                  decoration: InputDecoration(
                      labelText: 'e-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

                  //VALIDADOR
                  validator: (value) {
                    if (value == null) {
                      return 'Digite seu e-mail';
                    } else if (value.isEmpty) {
                      return 'Digite seu e-mail';
                    } else if (value != 'email@email.com') {
                      return 'E-mail inválido';
                    } //else if (value != 'teste') {
                      //return 'E-mail inválido';
                    //}
                    return null;
                  }),

              SizedBox(height: 20),

              //CAMPO SENHA
              TextFormField(
                  controller: txtSenha,
                  style: TextStyle(fontSize: 28),
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),

                  //VALIDADOR
                  validator: (value) {
                    if (value == null) {
                      return 'Digite sua senha';
                    } else if (value.isEmpty) {
                      return 'Digite sua senha';
                    } else if (value != 'Senha@123'){
                      return 'Senha inválida!';
                    } //else if (value != 'teste') {
                      //return 'E-mail inválido';
                    //}
                    return null;
                  }),

              SizedBox(height: 10),

              //BOTÃO REDEFINIR SENHA
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'nova_senha');
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),),

              SizedBox(height: 30),

              //BOTÃO LOGIN
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  ),
              
                  //EVENTO
                  onPressed: () {
                  //disparar o validador
                    if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, 'tela_inicial');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Bem Vindo de volta!',
                                style: TextStyle(fontSize: 20)),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 2),
                            ));                  
                    };
                    }, child: Text('Login', style:TextStyle(fontSize: 20)),
                    ),

                  SizedBox(height: 10),

              //BOTÃO CRIAR CONTA
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                backgroundColor: const Color.fromARGB(255, 192, 192, 192),
                foregroundColor: Colors.black,
                ),

                //EVENTO
                onPressed: () {
                  Navigator.pushNamed(context, 'criar_conta');
                  }, child: Text('Criar uma conta', style:TextStyle(fontSize: 20)),
                  ),
            
          ],      
        ),
      ),
     
    )); 
  }
}