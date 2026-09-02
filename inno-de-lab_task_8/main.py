from CONSTANTS import MAX_RENTAL_BATCH_LIMIT


def calculate_rental_batch(quantity: int, rental_rate: float, discount: float = 0.0) -> tuple[float, bool]:
    """Calculates the total cost for a rental batch.

    Computes the final sum by applying the discount, rounding to two decimal places,
    and checks whether the result exceeds the maximum rental batch limit.

    Args:
        quantity: The number of items in the batch.
        rental_rate: The cost of a single item.
        discount: The discount rate to apply (e.g., 0.1 for 10%). Defaults to 0.0.

    Returns:
        A tuple where the first element is the final rounded sum (float)
        and the second element is a boolean indicating whether the limit was exceeded.
    """
    final_sum: float = quantity * rental_rate * (1 - discount)
    final_sum = round(final_sum, 2)
    is_limit_exited: bool = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_limit_exited


# Academy Dinosaur
print("Партия 1 (Academy Dinosaur):")
rental_batch: tuple[float, bool] = calculate_rental_batch(30, 2.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch: tuple[float, bool] = calculate_rental_batch(quantity=30, rental_rate=2.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}\n\n")


# Affair Prejudice
print("Партия 2 (Affair Prejudice):")
rental_batch = calculate_rental_batch(40, 4.99, 0.1)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch = calculate_rental_batch(quantity=40, rental_rate=4.99, discount=0.1)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}\n\n")

# Agent Truman
print("Партия 3 (Agent Truman):")
rental_batch: tuple[float, bool] = calculate_rental_batch(10, 1.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch: tuple[float, bool] = calculate_rental_batch(quantity=10, rental_rate=1.99)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}\n\n")


# African Egg
print("Партия 4 (African Egg):")
rental_batch = calculate_rental_batch(50, 3.50, 0.2)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}")

rental_batch = calculate_rental_batch(quantity=50, rental_rate=3.50, discount=0.2)
print(f"Сумма: {rental_batch[0]}. Превышение лимита: {rental_batch[1]}\n\n")