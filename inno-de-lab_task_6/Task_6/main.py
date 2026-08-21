import operator

actions = {
    "+": operator.add,
    "-": operator.sub,
    "*": operator.mul,
    "/": operator.floordiv,
}

first_number = float(input("Введите 1-ое число: "))
second_number = float(input("Введите 2-ое число: "))
math_operator = input("Введите оператор операции: ")

if math_operator in "+-*/":
    result = actions[math_operator](first_number, second_number)
    print(f"Результат: {first_number} {math_operator} {second_number} = {result}")
else:
    print("Нет такого оператора")

