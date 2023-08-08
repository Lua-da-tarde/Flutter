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
              height: 40,
            ),
            Text("Formulário de Cadastro", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: campoRa,
                    decoration: const InputDecoration(
                      labelText: "RA",
                      labelStyle: TextStyle(color: Colors.black), 
                    ),
                    focusNode: primaryFocus,
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
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.black), 
                    ),
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
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  ra = int.parse(campoRa.text);
                  nome = campoNome.text;
                  mostrarMsgSucesso();
                  setState(() {
                  
                  });
                }
              },
              child: Text("Cadastrar")
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Valores digitados: $ra, $nome"),
          ],
        ) 
      ),
    );
  }
  void mostrarMsgSucesso(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Aluno cadastrado com sucesso')
      )
    );
  }
}