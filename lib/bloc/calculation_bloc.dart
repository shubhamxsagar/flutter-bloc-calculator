import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

class CalculationBloc extends Cubit<String> {
  CalculationBloc() : super('0');
  void inputPressed(String input) {
    String currentValue = state;
    if (currentValue == 'Error') {
      currentValue = '0';
    }
    if (input == 'AC') {
      emit('0');
    } else if (input == '=') {
      try {
        String result = _claculator(currentValue);
        emit(result);
      } catch (e) {
        emit('Error');
      }
    } else {
      if (currentValue == '0' && input != '.') {
        emit(input);
      } else {
        emit(currentValue + input);
      }
    }
  }

  String _claculator(String expression) {
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('%', '/100');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }
}
