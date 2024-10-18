import 'package:flutter/material.dart';

class NovaSenha extends StatefulWidget {
  const NovaSenha({super.key});

  @override
  State<NovaSenha> createState() => _NovaSenhaState();
}

class _NovaSenhaState extends State<NovaSenha> {

  var txtMail = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar senha', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.red.shade400,
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              50, 60, 50, 60),
          child: Column(
          children: [
            
            SizedBox(height: 100),

                TextFormField(
                  controller: txtMail,
                  style: TextStyle(fontSize: 20),
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

              SizedBox(height: 150),

              //Confirmar lembrete de senha
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  ),
              
                  //EVENTO
                  onPressed: () {  
                    if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Sua senha é: Senha@123',
                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700)),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 5),
                            ));                  
                    };
                  }, child: Text('Confirmar', style:TextStyle(fontSize: 20)),
              ),


              SizedBox(height: 10),

              //Voltar
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
