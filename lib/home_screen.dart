import 'package:calculator_ui/components/components.dart';
import 'package:calculator_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput='';
  var answer='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,
                        ),
                        Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),
                        ),
                        SizedBox(height: 15,),
                        Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
               Expanded(
                 flex: 6,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         MyComponents(title: 'AC',onPress: (){
                           userInput='';
                           answer='';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '+/-',onPress: (){
                           userInput+='+/-';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '%',onPress: (){
                           userInput+='%';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '/',color:Color(0xffffa00a),onPress: (){
                           userInput+='/';
                           setState(() {

                           });
                         },),
                       ],
                     ),
                     Row(
                       children: [
                         MyComponents(title: '7',onPress: (){
                           userInput+='7';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '8',onPress: (){
                           userInput+='8';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '0',onPress: (){
                           userInput+='0';
                           setState(() {

                           });
                         },),
                         MyComponents(title: 'X',color:const Color(0xffffa00a),onPress: (){
                           userInput+='X';
                           setState(() {

                           });
                         },),
                       ],
                     ),
                     Row(
                       children: [
                         MyComponents(title: '4',onPress: (){
                           userInput+='4';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '5',onPress: (){
                           userInput+='5';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '6',onPress: (){
                           userInput+='6';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '-',color:Color(0xffffa00a),onPress: (){
                           userInput+='-';
                           setState(() {

                           });
                         },),
                       ],
                     ),
                     Row(
                       children: [
                         MyComponents(title: '1',onPress: (){
                           userInput+='1';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '2',onPress: (){
                           userInput+='2';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '3',onPress: (){
                           userInput+='3';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '+',color:Color(0xffffa00a),onPress: (){
                           userInput+='+';
                           setState(() {

                           });
                         },),
                       ],
                     ),
                     Row(
                       children: [
                         MyComponents(title: '0',onPress: (){
                           userInput+='0';
                           setState(() {

                           });
                         },),
                         MyComponents(title: '.',onPress: (){
                           userInput+='.';
                           setState(() {

                           });
                         },),
                         MyComponents(title: 'DEL',onPress: (){
                           userInput=userInput.substring(0,userInput.length-1);
                           setState(() {

                           });
                         },),
                         MyComponents(title: '=',color:Color(0xffffa00a),onPress: (){
                           equalPress();
                           setState(() {

                           });
                         },),
                       ],
                     ),
                   ],
                 ),
               )


              ],
            ),
          ),
        ),
      ),
    );

  }
  void equalPress(){
    String finalUserInput=userInput;
        finalUserInput=userInput.replaceAll('X', '*');
    Parser parser=Parser();
    Expression expression=parser.parse(finalUserInput);
    ContextModel contextModel=ContextModel();

    double eval=expression.evaluate(EvaluationType.REAL, contextModel);
    answer=eval.toString();


  }
}



