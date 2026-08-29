from CONSTANTS import MAX_RENTAL_BATCH_LIMIT

def print_result(value: tuple[float, bool], test_index: int):
    print(f"Тест {test_index + 1}")
    print(f"Сумма: {value[0]}. Превышение лимита: {value[1]}")



def calculate_rental_batch(quantity: int, rental_rate: float, discount: float = 0.0) -> tuple[float, bool]:
    """
    function calculates the rental batch
    :param quantity: quantity of items
    :param rental_rate: cost of one item
    :param discount: discount for one item
    :return: tuple, with data about final sum and limit
    """
    final_sum: float = quantity * rental_rate * (1 - discount)
    final_sum = round(final_sum, 2)
    is_limit_exited: bool = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_limit_exited


# test-1
print("Тест-1")
rental_batch: tuple[float, bool] = calculate_rental_batch(30, 2.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch: tuple[float, bool] = calculate_rental_batch(quantity=30, rental_rate=2.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}\n\n")


# test-2
print("Тест-2")
rental_batch = calculate_rental_batch(40, 4.99, 0.1)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch = calculate_rental_batch(quantity=40, rental_rate=4.99, discount=0.1)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")