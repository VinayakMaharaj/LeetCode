import pandas as pd


def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    second_highest_df = employee['salary'].sort_values(
        ascending=False).drop_duplicates()
    if len(second_highest_df) > 1:
        second_highest_val = second_highest_df.iloc[1]
    else:
        second_highest_val = None
    return pd.DataFrame({'SecondHighestSalary': [second_highest_val]})
