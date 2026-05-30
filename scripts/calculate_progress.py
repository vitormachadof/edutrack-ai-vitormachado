import argparse
import json
from typing import Any, Dict, Union

Number = Union[int, float]


def calculate_progress(completed: Number, total: Number) -> Dict[str, float]:
    """Calculate progress percentage and return a result dictionary."""
    try:
        completed_value = float(completed)
        total_value = float(total)
    except (TypeError, ValueError) as exc:
        raise ValueError("completed and total must be numeric values") from exc

    if total_value <= 0:
        progress_percentage = 0.0
    else:
        progress_percentage = round((completed_value / total_value) * 100, 2)

    return {
        "completed": completed_value,
        "total": total_value,
        "progress_percentage": progress_percentage,
    }


def result_to_json(result: Dict[str, Any]) -> str:
    """Convert the progress result to a JSON string."""
    return json.dumps(result)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Calculate progress percentage and output the result as JSON."
    )
    parser.add_argument("--completed", type=float, required=True, help="Number of completed items")
    parser.add_argument("--total", type=float, required=True, help="Total number of items")
    args = parser.parse_args()

    result = calculate_progress(args.completed, args.total)
    print(result_to_json(result))


if __name__ == "__main__":
    main()
