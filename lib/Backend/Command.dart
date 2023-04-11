abstract class ICommand{
  num execute();
}

class Addition extends ICommand{
  num num1;
  num num2;

  Addition(this.num1, this.num2);

  @override
  num execute() {
    return num1 + num2;
  }

}class Subtraction extends ICommand{
  num num1;
  num num2;

  Subtraction(this.num1, this.num2);
  @override
  num execute() {
    return num1 - num2;
  }

}class Multiply extends ICommand{
  num num1;
  num num2;

  Multiply(this.num1, this.num2);
  @override
  num execute() {
    return num1 * num2;
  }

}class Division extends ICommand{
  num num1;
  num num2;

  Division(this.num1, this.num2);
  @override
  num execute() {
    return num1 / num2;
  }
}