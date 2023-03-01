enum Operator {
  addition('+'),
  subtraction('-'),
  multiply('*'),
  division('/');

  const Operator(this.value);
  final String value;
}