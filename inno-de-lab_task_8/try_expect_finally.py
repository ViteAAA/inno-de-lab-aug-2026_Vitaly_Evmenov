from typing import Any
from CONSTANTS import DEFAULT_RETURN_INDEX_BASE

# initialize_data
initialize_data = {
    "matrix": (5, 1.5),
    "inception": ("пять", 2.0),
    "avatar": (0, 2.5),
    "interstellar": ([3, ], 3.0)
}


def calculate_overdue_fine(film_name: str, days_overdue: Any, fine_rate: Any) -> tuple[float, float] | None:
    """Calculates the overdue fine for a given film.

    Converts days_overdue to a float, computes the total fine and a return index,
    and handles various exceptions (TypeError, ValueError, ZeroDivisionError).

    Args:
        film_name: The name of the film.
        days_overdue: The number of days the film is overdue. Must be convertible to float.
        fine_rate: The daily fine rate. Multiplied by the numeric days to get total fine.

    Returns:
        A tuple containing (total_fine, return_index) if calculation succeeds,
        or None if an exception occurs.
    """
    try:
        numeric_days = float(days_overdue)
        total_fine: float = numeric_days * fine_rate
        return_index: float = DEFAULT_RETURN_INDEX_BASE / numeric_days
        print(f"Фильм: {film_name.title()} | Итоговый штраф: {total_fine}$ | Индекс: {return_index}")
        return total_fine, return_index
    except TypeError as e:
        print(f"[ОШИБКА ТИПА] Некорректный тип данных для '{film_name.title()}': {e}")
    except ValueError as e:
        print(f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число для '{film_name.title()}': {e}")
    except ZeroDivisionError as e:
        print(f"[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки для '{film_name.title()}': {e}")
    except Exception as e:
        print(e)
    finally:
        print(" --- Проверка транзакции возврата завершена ---\n\n")


for name, data_tuple in initialize_data.items():
    calculate_overdue_fine(name, data_tuple[0], data_tuple[1])