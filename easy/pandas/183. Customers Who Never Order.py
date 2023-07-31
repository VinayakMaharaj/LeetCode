import pandas as pd


def customers_who_never_order(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = pd.merge(customers, orders, how='left',
                  left_on='id', right_on='customerId')
    df.rename(columns={'name': 'Customers'}, inplace=True)

    return pd.DataFrame(df[df['customerId'].isnull()]['Customers'])
