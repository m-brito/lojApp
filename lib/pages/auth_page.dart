import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 0.5),
                  Color.fromRGBO(215, 188, 177, 0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        // cascade operator
                        transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 70,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange.shade900,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, 2),
                            )
                          ]
                        ),
                        child: Text(
                          'Minha loja',
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Anton',
                            color: Theme.of(context).textTheme.headline6?.color,
                          ),
                        ),
                      ),
                      const AuthForm()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// // Exemplo usado para explicar o cascade operator
// void main() {
//   List<int> a = [1, 2, 3];
//   a.add(4);
//   a.add(5);
//   a.add(6);

//   // erro pelo fato do metodo add retornar void

//   a.add(7).add(8).add(9)

//   // cascade operator - Funciona pois dps de executar o primeiro add retorna a lista de resultado

//   a.add(7)..add(8)..add(9);

//   print(a);

// }