import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

enum Time { nos, eles }

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pontosNos = 0;
  int pontosEles = 0;

  int partidasGanhasNos = 0;
  int partidasGanhasEles = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Marcador de pontos",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "Nós",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => mudarPontuacao(Time.nos, -1),
                        child: Text("-1"),
                      ),
                      Text("$pontosNos", style: TextStyle(fontSize: 25)),
                      ElevatedButton(
                        onPressed: () => mudarPontuacao(Time.nos, 1),
                        child: Text("+1"),
                      ),
                      Text("🏆: $partidasGanhasNos"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "Eles",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => mudarPontuacao(Time.eles, -1),
                        child: Text("-1"),
                      ),
                      Text("$pontosEles", style: TextStyle(fontSize: 25)),
                      ElevatedButton(
                        onPressed: () => mudarPontuacao(Time.eles, 1),
                        child: Text("+1"),
                      ),
                      Text("🏆: $partidasGanhasEles"),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: zerarPartidas, child: Text("Zerar partidas"))
          ],
        ),
      ),
    );
  }

  void mudarPontuacao(Time time, int qtdPonto) {
    setState(() {
      if (time == Time.nos) {
        pontosNos += qtdPonto;

        if (validaPontuacaoMenorZero(pontosNos)) pontosNos = 0;
        if (validaPontuacaoMaiorOnze(pontosNos)) somarPartida(Time.nos);
      } else {
        pontosEles += qtdPonto;

        if (validaPontuacaoMenorZero(pontosEles)) pontosEles = 0;
        if (validaPontuacaoMaiorOnze(pontosEles)) somarPartida(Time.eles);
      }
    });
  }

  bool validaPontuacaoMenorZero(int pontos) {
    return pontos < 0;
  }

  bool validaPontuacaoMaiorOnze(int pontos) {
    return pontos > 11;
  }

  void somarPartida(Time time) {
    time == Time.nos ? partidasGanhasNos++ : partidasGanhasEles++;
    pontosNos = 0;
    pontosEles = 0;
  }

  void zerarPartidas(){
    setState(() {
      partidasGanhasNos  = 0;
      partidasGanhasEles = 0;
    });
  }
}
