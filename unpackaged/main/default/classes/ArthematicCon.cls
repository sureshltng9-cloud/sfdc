public class ArthematicCon {

    public decimal result { get; set; }
    
    public integer number2 { get; set; }

    public integer number1 { get; set; }

    public void Multiplication() {
        result = number1 * number2;
    }


    public void Substract() {
        result = number1 - number2;
    }


    public void Add() {
        result = number1 + number2;
    }

}