import '../../Backend/Stack.dart';

class CalculatorState{
  List<String> numberOfStrings = [];
  HistoricalStack historical = HistoricalStack();
  StackNum stack = StackNum();
  List<num> copyStack = [];
  String result = '';
}