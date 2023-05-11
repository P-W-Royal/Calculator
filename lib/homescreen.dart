import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homescren extends StatefulWidget {
  const Homescren({Key? key}) : super(key: key);

  @override
  State<Homescren> createState() => _HomescrenState();
}

class _HomescrenState extends State<Homescren> {
  var UserInput = '';
  var answer = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            UserInput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Btn_Button(
                              title: 'AC',
                              onPress: () {
                                UserInput = '';
                                answer = '';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '=/-',
                              onPress: () {
                                UserInput += '=/-';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '%',
                              onPress: () {
                                UserInput += '%';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '/',
                              color: Colors.orange,
                              onPress: () {
                                UserInput += '/';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Btn_Button(
                              title: '7',
                              onPress: () {
                                UserInput += '7';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '8',
                              onPress: () {
                                UserInput += '8';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '9',
                              onPress: () {
                                UserInput += '9';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: 'x',
                              color: Colors.orange,
                              onPress: () {
                                UserInput += 'x';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Btn_Button(
                              title: '4',
                              onPress: () {
                                UserInput += '4';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '5',
                              onPress: () {
                                UserInput += '5';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '6',
                              onPress: () {
                                UserInput += '6';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '-',
                              color: Colors.orange,
                              onPress: () {
                                UserInput += '-';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Btn_Button(
                              title: '1',
                              onPress: () {
                                UserInput += '1';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '2',
                              onPress: () {
                                UserInput += '2';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '3',
                              onPress: () {
                                UserInput += '3';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '+',
                              color: Colors.orange,
                              onPress: () {
                                UserInput += '+';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Btn_Button(
                              title: '0',
                              onPress: () {
                                print('tap');
                                UserInput += '0';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '.',
                              onPress: () {
                                UserInput += '.';
                                setState(() {});
                              }),
                          Btn_Button(
                              title: 'DEL',
                              onPress: () {
                                UserInput = UserInput.substring(
                                    0, UserInput.length - 1);
                                setState(() {});
                              }),
                          Btn_Button(
                              title: '=',
                              color: Colors.orange,
                              onPress: () {
                                equalPress();
                                setState(() {

                                });
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void equalPress() {
    String finalUserInput = UserInput;
    finalUserInput= UserInput.replaceAll("x", "*");

    Parser p = Parser();
    Expression exception = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exception.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

class Btn_Button extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const Btn_Button(
      {Key? key,
      required this.title,
      this.color = Colors.grey,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
                child: Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
          ),
        ),
      ),
    );
  }
}
