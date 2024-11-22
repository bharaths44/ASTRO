import json
from datetime import datetime


# Load the forecast data from a JSON file
def load_forecast_data(file_path):
    with open(file_path, "r") as file:
        data = json.load(file)
    return data["forecast"]


# Convert string date to datetime object
def parse_date(date_str):
    return datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")


# Calculate the total number of days required to reach the minimum order quantity
def calculate_days_to_reach_quantity(forecast_data, target_quantity):
    cumulative_quantity = 0
    total_days = 0

    for entry in forecast_data:
        trend_value = entry["yhat1_trend"]
        cumulative_quantity += trend_value
        total_days += 1  # Count each day

        # Stop if the cumulative quantity has reached or exceeded the target
        if cumulative_quantity >= target_quantity:
            break

    return total_days, cumulative_quantity


if __name__ == "__main__":
    file_path = (
        "response_data.json"  # Update this path to the location of your JSON file
    )
    target_order_quantity = 100  # Set your target order quantity here

    # Load the data
    forecast_data = load_forecast_data(file_path)

    # Calculate the number of days required to reach the target quantity
    days_required, final_quantity = calculate_days_to_reach_quantity(
        forecast_data, target_order_quantity
    )

    print(f"Total Days to Reach {target_order_quantity}: {days_required}")
    print(f"Final Aggregated Quantity after {days_required} days: {final_quantity:.2f}")
