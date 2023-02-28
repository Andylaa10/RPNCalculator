abstract class IStack{
  //Delete
  void pop(num number);

  //Read
  List<num> peek();

  //Add
  void push(num number);

  //Clear
  void clear();

}

class StackNum extends IStack{
  List<num> numbers = [];

  @override
  peek() {
    return numbers;
  }

  @override
  pop(num number) {
    numbers.remove(number);
  }

  @override
  push(num number) {
    numbers.add(number);
  }

  @override
  void clear() {
    numbers.clear();
  }

  @override
  String toString() {
    return numbers.join(', ');
  }
}

class HistoricalStack{
  List<List<num>> historicalStack = [];

  List<List<num>> peek(){
    return historicalStack;
  }

  void push(List<num> stack){
    historicalStack.add(stack);
  }

  void pop(List<num> stack){
    historicalStack.remove(stack);
  }

  void clear(){
    historicalStack.clear();
  }
}
