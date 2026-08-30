import time

from CONSTANTS import PERFORMANCE_LOG_PREFIX, TIME_DECIMALS

# initialize data
case_standard:  list[dict[str, str | float]] = [
    {"category": "Action", "total_sales": 4311.85},
    {"category": "Animation", "total_sales": 4656.30},
    {"category": "Children", "total_sales": 3655.55}
]
case_identical_revenue:  list[dict[str, str | float]] = [
    {"category": "Classics", "total_sales": 1200.10},
    {"category": "Comedy", "total_sales": 4000.00},
    {"category": "Documentary", "total_sales": 4000.00}
]
case_single_item:  list[dict[str, str | float]] = [
    {"category": "Drama", "total_sales": 500.00}
]

def print_result(result: list[dict[str, str | float]], test_index: int) -> None:
    """
    prints result
    :param result: dictionary list to print
    :param test_index: index of test
    :return: no return value
    """
    print("Топ категорий по выручке:")
    for index, item in enumerate(result):
        print(f"{index + 1}: {item['category']}: {item['total_sales']}")
    print("\n\n")

def performance_logger(func):
    """
    decorator for performance logger
    :param func: function, which execution time calculates
    :return: return function
    """
    def wrapper(*args, **kwargs):
        """
        calculates execution time
        :param args: *args
        :param kwargs: **kwargs
        :return: execution time
        """
        time_start = time.perf_counter()
        result = func(*args, **kwargs)
        time_end = time.perf_counter()
        execution_time = time_end - time_start
        print(f"{PERFORMANCE_LOG_PREFIX} Функция '{func.__name__}' выполнена за {execution_time:{TIME_DECIMALS}f} сек")
        return result
    return wrapper

@performance_logger
def get_sorted_report(unsorted_report: list[dict[str, str | float]]) -> list[dict[str, str | float]]:
    """
    sorts unsorted_report
    :param unsorted_report: unsorted_data
    :return: sorted_data
    """
    result = sorted(unsorted_report, key=lambda x: x["total_sales"], reverse=True)
    return result

# printing results
print(f"--- ТЕСТ 1 ---")
print_result(get_sorted_report(case_standard), 1)
print(f"--- ТЕСТ 2 ---")
print_result(get_sorted_report(case_identical_revenue), 2)
print(f"--- ТЕСТ 3 ---")
print_result(get_sorted_report(case_single_item), 3)
