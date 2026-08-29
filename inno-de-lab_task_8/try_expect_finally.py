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
    """
    function calculates the overdue free in the given film
    :param film_name: name of the film
    :param days_overdue: days of overdue payment
    :param fine_rate: fine rate
    :return: overdue free in the given film or None
    """
    try:
        numeric_days = float(days_overdue)
        total_fine: float = numeric_days * fine_rate
        return_index: float = DEFAULT_RETURN_INDEX_BASE / numeric_days
        print(f"Фильм: {film_name} | Итоговый штраф: {total_fine}$ | Индекс: {return_index}")
        return total_fine, return_index
    except TypeError:
        print(f"[ОШИБКА ТИПА] Некорректный тип данных для '{film_name.title()}': float() argument must be a string or a real number, not '{type(days_overdue).__name__}' ")
    except ValueError:
        print(f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число для '{film_name.title()}': could not convert string to float: '{days_overdue}'")
    except ZeroDivisionError:
        print(f"[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки для '{film_name.title()}': float division by zero ")
    except Exception as e:
        print(e)
    finally:
        print(" --- Проверка транзакции возврата завершена ---\n\n")

for name, data_tuple in initialize_data.items():
    calculate_overdue_fine(name, data_tuple[0], data_tuple[1])