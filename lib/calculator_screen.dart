import 'package:calculator/bloc/calculation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();

  Widget calculatorButton(
      String btnText, Color btnColor, Color textColor, CalculationBloc bloc) {
    return Container(
      child: ElevatedButton(
        child: Text(
          btnText,
          style: TextStyle(color: textColor),
        ),
        onPressed: () {
          if (btnText == 'AC' || btnText == '%') {
            bloc.inputPressed(btnText);
          } else {
            bloc.inputPressed(btnText);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          fixedSize: const Size(70, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CalculationBloc calculationBloc =
        BlocProvider.of<CalculationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator with Bloc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<CalculationBloc, String>(
                  builder: (context, state) {
                    return Text(
                      state,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    'AC', Colors.grey[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '+/-', Colors.grey[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '%', Colors.grey[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '/', Colors.amber[700]!, Colors.white, calculationBloc),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    '7', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '8', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '9', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '*', Colors.amber[700]!, Colors.white, calculationBloc),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    '5', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '6', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '7', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '-', Colors.amber[700]!, Colors.white, calculationBloc),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    '1', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '2', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '3', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '+', Colors.amber[700]!, Colors.white, calculationBloc),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    '00', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '0', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '.', Colors.blue[700]!, Colors.white, calculationBloc),
                calculatorButton(
                    '=', Colors.amber[700]!, Colors.white, calculationBloc),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
