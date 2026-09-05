import time
from typing import Any, Callable

from CONSTANTS import PERFORMANCE_LOG_PREFIX, TIME_DECIMALS

# initialize data
case_standard: list[dict[str, str | float]] = [
    {"category": "Action", "total_sales": 4311.85},
    {"category": "Animation", "total_sales": 4656.30},
    {"category": "Children", "total_sales": 3655.55}
]
case_identical_revenue: list[dict[str, str | float]] = [
    {"category": "Classics", "total_sales": 1200.10},
    {"category": "Comedy", "total_sales": 4000.00},
    {"category": "Documentary", "total_sales": 4000.00}
]
case_single_item: list[dict[str, str | float]] = [
    {"category": "Drama", "total_sales": 500.00}
]


def print_result(result: list[dict[str, str | float]]) -> None:
    """Prints the top categories by revenue.

    Prints a numbered list of categories with their total sales.
    The test_index parameter is passed for interface compatibility,
    but is not used when generating the output.

    Args:
        result: A list of dictionaries with keys 'category' and 'total_sales'.
        test_index: The test index (integer).

    Returns:
        None
    """
    print("Top categories by revenue:")
    for index, item in enumerate(result):
        print(f"{index + 1}: {item['category']}: {float(item['total_sales'])}")
    print("\n\n")


def performance_logger(func: Callable[..., Any]) -> Callable[..., Any]:
    """Decorator for measuring and logging function execution time.

    Wraps the target function, measuring its execution time
    using time.perf_counter().

    Args:
        func: The function whose execution time needs to be measured.

    Returns:
        A wrapper function that performs the time measurement,
        prints a log message, and returns the result of the original function.
    """
    def wrapper(*args: Any, **kwargs: Any):
        """Executes the time measurement and calls the decorated function.

        Records the time before and after the original function execution,
        calculates the duration, and prints a message to the console.

        Args:
            *args: Positional arguments passed to the decorated function.
            **kwargs: Keyword arguments passed to the decorated function.

        Returns:
            The result of the decorated function execution.
        """
        time_start: float = time.perf_counter()
        result: Any = func(*args, **kwargs)
        time_end: float = time.perf_counter()
        execution_time: float = time_end - time_start
        print(f"{PERFORMANCE_LOG_PREFIX} Function '{func.__name__}' executed in {execution_time:.{TIME_DECIMALS}f} sec")
        return result
    return wrapper


@performance_logger
def get_sorted_report(unsorted_report: list[dict[str, str | float]]) -> list[dict[str, str | float]]:
    """Sorts the report by categories in descending order of revenue.

    Uses the built-in sorted function with a lambda function
    as the sorting key based on the 'total_sales' field.

    Args:
        unsorted_report: An unsorted list of dictionaries
            containing category data and its revenue.

    Returns:
        A new list of dictionaries sorted by the 'total_sales' field
        in descending order.
    """
    result: list[dict[str, str | float]] = sorted(unsorted_report, key=lambda x: x["total_sales"], reverse=True)
    return result


# printing results
print("=== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ === \n")
print(f"--- TEST 1 ---")
print_result(get_sorted_report(case_standard))
print(f"--- TEST 2 ---")
print_result(get_sorted_report(case_identical_revenue))
print(f"--- TEST 3 ---")
print_result(get_sorted_report(case_single_item))