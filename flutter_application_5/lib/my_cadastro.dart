import 'package:flutter/material.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  //variaveis
  int ra = 0;
  String nome = '';
  //controllers
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: campoRa,
                    //validator retorna string ou null
                    validator: (value) {
                      if (value!.isEmpty){
                        return("O RA não pode ser vazio");
                      }else{
                        if(int.parse(campoRa.text) < 10){
                          return("O RA deve ser maior que 10");
                        }
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: campoNome,
                    validator: (value) {
                      if(value!.isEmpty){
                        return("O nome não pode ser vazio.");
                      }else{
                        if(campoNome.text.length < 4){
                          return("Nome precisa ter mais de 4 caracteres");
                        }
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  ra = int.parse(campoRa.text);
                  nome = campoNome.text;
                  setState(() {
                  
                  });
                }
              },
              child: Text("Cadastrar")
            ),
            Text("Valores digitados: $ra, $nome"),
          ],
        ) 
      ),
    );
  }
}