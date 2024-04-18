import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infor = "Informe seus Dados";

  void resetCampos() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      infor = "Informe seus Dados";
    });
  }

  void calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.5) {
        infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        infor = "Peso normal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        infor = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        infor = "Obesidade grau 1(${imc.toStringAsPrecision(3)})";
      } else {
        infor = "Obesidade grau 2(${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Calculadora IMC"),
            centerTitle: true,
            backgroundColor: Colors.indigo[400],
            foregroundColor: Colors.black87,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  size: 30,
                  color: Colors.black87,
                ),
                onPressed: () {
                  resetCampos();
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outlined,
                size: 120,
                color: Colors.indigo[400],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 50, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: pesoController,
                  decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(
                      color: Colors.indigo[400],
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.indigo[400], fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 50, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: alturaController,
                  decoration: InputDecoration(
                    labelText: "Altura",
                    labelStyle: TextStyle(
                      color: Colors.indigo[400],
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.indigo[400], fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 70, right: 70, top: 25, bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    calcular();
                  },
                  child: Text("Calcular"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 25,
                      )),
                ),
              ),
              Text(
                infor,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo[400], fontSize: 25),
              )
            ],
          )),
    );
  }
}
