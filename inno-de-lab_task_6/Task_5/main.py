# import random for generate random value
from random import randint

# number of remaining attempts
attempts = 5
start_number = 1
end_number = 20
rand_num = randint(start_number, end_number)

# number-guessing game process cycle
while attempts > 0:
    man_number = int(input("Введите ваше число: "))

    if man_number == rand_num:
        print("Ты угадал! Отличная работа")
        break

    attempts -= 1

    if man_number > rand_num:
        print(f"Слишком много! Осталось попыток: {attempts}\n")

    if man_number < rand_num:
        print(f"Слишком мало! Осталось попыток: {attempts}\n")
else:
    print("Ты не угадал! Ужасная работа")
