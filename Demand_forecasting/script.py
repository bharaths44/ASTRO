# %%
import numpy as np
import pandas as pd
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import logging
import lightgbm as lgb
import itertools


logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
loaded_model = lgb.Booster(model_file="final_model.txt")


def create_predict_csv(
    train_file_path, output_file_path, period_type="D", num_periods=365
):
    """
    Create a CSV file for prediction with a specified period type and number of periods.

    Parameters:
    - train_file_path: str, path to the training data CSV file.
    - output_file_path: str, path to save the output prediction CSV file.
    - period_type: str, type of period ('D' for days, 'M' for months, 'Y' for years).
    - num_periods: int, number of periods to generate.
    """
    # Load the training data to get the last date
    train_data = pd.read_csv(train_file_path, parse_dates=["date"])
    last_date = train_data["date"].max()

    # Generate a date range based on the specified period type and number of periods
    if period_type == "Y":
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1), periods=num_periods * 365, freq="D"
        )
    elif period_type == "M":
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1), periods=num_periods * 30, freq="D"
        )
    else:
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1),
            periods=num_periods,
            freq=period_type,
        )

    # Get unique stores and items
    stores = train_data["store"].unique()
    items = train_data["item"].unique()

    # Create combinations of stores and items
    combinations = list(itertools.product(stores, items))

    # Create a DataFrame with the combinations and date range
    predict_data = pd.DataFrame(combinations, columns=["store", "item"])
    predict_data = (
        predict_data.assign(key=1)
        .merge(pd.DataFrame(date_range, columns=["date"]).assign(key=1), on="key")
        .drop("key", axis=1)
    )
    predict_data = predict_data.sort_values(by=["store", "item", "date"])

    # Save the DataFrame to a CSV file
    predict_data.to_csv(output_file_path, index=False)
    logging.info(f"Predict CSV file created at {output_file_path}")


csv_file_path = "train.csv"
data = pd.read_csv(csv_file_path, parse_dates=["date"])
data1 = pd.read_csv(csv_file_path, parse_dates=["date"])

create_predict_csv(
    "train.csv",
    "predict.csv",
    period_type="M",
    num_periods=1,
)
predict = pd.read_csv("predict.csv", parse_dates=["date"])
# %%
data = pd.concat([data, predict], sort=False)


def create_date_features(df):
    df["month"] = df.date.dt.month
    df["day_of_month"] = df.date.dt.day
    df["day_of_year"] = df.date.dt.dayofyear
    df["week_of_year"] = df.date.dt.isocalendar().week.astype(np.int32)
    df["day_of_week"] = df.date.dt.dayofweek
    df["year"] = df.date.dt.year
    df["is_wknd"] = df.date.dt.weekday // 4
    df["is_month_start"] = df.date.dt.is_month_start.astype(int)
    df["is_month_end"] = df.date.dt.is_month_end.astype(int)

    return df


data = create_date_features(data)
data = data.drop(columns=["date"])
print(data.dtypes)

# %%


def create_predict_csv(
    train_file_path, output_file_path, period_type="D", num_periods=365
):
    """
    Create a CSV file for prediction with a specified period type and number of periods.

    Parameters:
    - train_file_path: str, path to the training data CSV file.
    - output_file_path: str, path to save the output prediction CSV file.
    - period_type: str, type of period ('D' for days, 'M' for months, 'Y' for years).
    - num_periods: int, number of periods to generate.
    """
    # Load the training data to get the last date
    train_data = pd.read_csv(train_file_path, parse_dates=["date"])
    last_date = train_data["date"].max()

    # Generate a date range based on the specified period type and number of periods
    if period_type == "Y":
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1), periods=num_periods * 365, freq="D"
        )
    elif period_type == "M":
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1), periods=num_periods * 30, freq="D"
        )
    else:
        date_range = pd.date_range(
            start=last_date + pd.DateOffset(days=1),
            periods=num_periods,
            freq=period_type,
        )

    # Get unique stores and items
    stores = train_data["store"].unique()
    items = train_data["item"].unique()

    # Create combinations of stores and items
    combinations = list(itertools.product(stores, items))

    # Create a DataFrame with the combinations and date range
    predict_data = pd.DataFrame(combinations, columns=["store", "item"])
    predict_data = (
        predict_data.assign(key=1)
        .merge(pd.DataFrame(date_range, columns=["date"]).assign(key=1), on="key")
        .drop("key", axis=1)
    )
    predict_data = predict_data.sort_values(by=["store", "item", "date"])

    # Save the DataFrame to a CSV file
    predict_data.to_csv(output_file_path, index=False)
    logging.info(f"Predict CSV file created at {output_file_path}")


# %%
def random_noise(dataframe):
    return np.random.normal(scale=1.6, size=(len(dataframe)))


def lag_features(dataframe, lags):
    logging.info("Creating lag features...")
    for lag in lags:
        dataframe["sales_lag_" + str(lag)] = dataframe.groupby(["store", "item"])[
            "sales"
        ].transform(lambda x: x.shift(lag)) + random_noise(dataframe)
    logging.info("Lag features created.")
    return dataframe


data = lag_features(data, [91, 98, 105, 112, 119, 126, 182, 364, 546, 728])


def roll_mean_features(dataframe, windows):
    logging.info("Creating rolling mean features...")
    for window in windows:
        dataframe["sales_roll_mean_" + str(window)] = dataframe.groupby(
            ["store", "item"]
        )["sales"].transform(
            lambda x: x.shift(1)
            .rolling(window=window, min_periods=10, win_type="triang")
            .mean()
        ) + random_noise(
            dataframe
        )
    logging.info("Rolling mean features created.")
    return dataframe


data = roll_mean_features(data, [365, 546])


def ewm_features(dataframe, alphas, lags):
    logging.info("Creating exponentially weighted mean features...")
    for alpha in alphas:
        for lag in lags:
            dataframe[
                "sales_ewm_alpha_" + str(alpha).replace(".", "") + "_lag_" + str(lag)
            ] = dataframe.groupby(["store", "item"])["sales"].transform(
                lambda x: x.shift(lag).ewm(alpha=alpha).mean()
            )
    logging.info("Exponentially weighted mean features created.")
    return dataframe


alphas = [0.95, 0.9, 0.8, 0.7, 0.5]
lags = [91, 98, 105, 112, 180, 270, 365, 546, 728]

data = ewm_features(data, alphas, lags)

data = pd.get_dummies(
    data, columns=["store", "item", "day_of_week", "month"], drop_first=True, dtype=int
)

# %%


def plot_importance(model, features):
    logging.info("Plotting feature importance...")

    # Retrieve feature importances
    feature_importances = model.feature_importance()
    feature_names = features.columns

    # Debugging statements
    logging.info(f"Feature importances length: {len(feature_importances)}")
    logging.info(f"Feature names length: {len(feature_names)}")
    logging.info(f"Feature importances: {feature_importances}")
    l = list(feature_names)
    l.sort()
    logging.info(f"Feature names: {l}")

    # Filter feature names to match feature importances
    if len(feature_importances) != len(feature_names):
        logging.warning(
            "Feature importances and feature names lengths do not match. Dropping unmatched features."
        )
        feature_names = feature_names[: len(feature_importances)]

    # Create DataFrame for feature importances
    feature_imp = pd.DataFrame({"Value": feature_importances, "Feature": feature_names})

    feature_imp = feature_imp.sort_values(by="Value", ascending=False)
    return feature_imp


# Example usage
cols = [col for col in data.columns if col not in ["date", "id", "sales", "year"]]
# y_train = data["sales"]
X_train = data[cols]

# y_val = data["sales"]
# X_val = data[cols]
feat_imp = plot_importance(loaded_model, X_train)
importance_low = feat_imp[feat_imp["Value"] < 50]["Feature"].values

imp_feats = [col for col in cols if col not in importance_low]

train = data.loc[~data.sales.isna()]
# y_train = train["sales"]
X_train = train[imp_feats]

test = data.loc[data.sales.isna()]
X_test = test[imp_feats]

# %%
from tabnanny import verbose


predictions = loaded_model.predict(X_test, predict_disable_shape_check=True, verbose=2)

# %%
predictions = np.expm1(predictions)
print(predictions)

# %%
forecast = pd.DataFrame(
    {
        "date": predict["date"],
        "store": predict["store"],
        "item": predict["item"],
        "sales": predictions,
    }
)
print(forecast)


# %%
def predicted_graph(store_num, item_num, train, forecast):
    logging.info(f"Plotting predicted graph for store {store_num}, item {item_num}...")
    train_data = train[(train.store == store_num) & (train.item == item_num)]
    forecast_data = forecast[
        (forecast.store == store_num) & (forecast.item == item_num)
    ]

    fig = make_subplots(rows=1, cols=1, shared_xaxes=True)

    fig.add_trace(
        go.Scatter(
            x=train_data.date,
            y=train_data.sales,
            name=f"Store {store_num} Item {item_num} Sales",
            mode="lines",
        )
    )

    fig.add_trace(
        go.Scatter(
            x=forecast_data.date,
            y=forecast_data.sales,
            name=f"Store {store_num} Item {item_num} Forecast",
            mode="lines",
        )
    )

    fig.update_layout(
        title=f"Sales and Forecast for Store {store_num}, Item {item_num}",
        xaxis_title="Date",
        yaxis_title="Sales",
        legend_title="Legend",
        hovermode="x unified",
    )

    fig.update_xaxes(
        rangeslider_visible=True,
        rangeselector=dict(
            buttons=list(
                [
                    dict(count=1, label="1m", step="month", stepmode="backward"),
                    dict(count=6, label="6m", step="month", stepmode="backward"),
                    dict(count=1, label="YTD", step="year", stepmode="todate"),
                    dict(count=1, label="1y", step="year", stepmode="backward"),
                    dict(step="all"),
                ]
            )
        ),
    )

    fig.show()
    logging.info(f"Predicted graph for store {store_num}, item {item_num} plotted.")


predicted_graph(store_num=2, item_num=23, train=data1, forecast=forecast)


# %%
def predicted_graph_for_item_all_stores(item_num, train, forecast):
    """
    Generate a single graph for a specific item across all stores.

    Parameters:
    - item_num: int, the item number to generate predictions for.
    - train: DataFrame, the training data.
    - forecast: DataFrame, the forecast data.
    """
    logging.info(f"Generating a single graph for item {item_num} across all stores...")

    # Filter data for the specified item
    train_data = train[train.item == item_num]
    forecast_data = forecast[forecast.item == item_num]

    # Aggregate sales data across all stores
    train_agg = train_data.groupby("date").sales.sum().reset_index()
    forecast_agg = forecast_data.groupby("date").sales.sum().reset_index()

    # Plot the aggregated data
    fig = make_subplots(rows=1, cols=1, shared_xaxes=True)

    fig.add_trace(
        go.Scatter(
            x=train_agg.date,
            y=train_agg.sales,
            name=f"Item {item_num} Sales (All Stores)",
            mode="lines",
        )
    )

    fig.add_trace(
        go.Scatter(
            x=forecast_agg.date,
            y=forecast_agg.sales,
            name=f"Item {item_num} Forecast (All Stores)",
            mode="lines",
        )
    )

    fig.update_layout(
        title=f"Sales and Forecast for Item {item_num} Across All Stores",
        xaxis_title="Date",
        yaxis_title="Sales",
        legend_title="Legend",
        hovermode="x unified",
    )

    fig.update_xaxes(
        rangeslider_visible=True,
        rangeselector=dict(
            buttons=list(
                [
                    dict(count=1, label="1m", step="month", stepmode="backward"),
                    dict(count=6, label="6m", step="month", stepmode="backward"),
                    dict(count=1, label="YTD", step="year", stepmode="todate"),
                    dict(count=1, label="1y", step="year", stepmode="backward"),
                    dict(step="all"),
                ]
            )
        ),
    )

    fig.show()
    logging.info(f"Single graph for item {item_num} across all stores generated.")


predicted_graph_for_item_all_stores(item_num=5, train=data1, forecast=forecast)
