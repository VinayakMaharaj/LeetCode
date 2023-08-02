import pandas as pd


def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    data = pd.merge(employee, department, left_on='departmentId',
                    right_on='id', how='left')
    df = data.groupby('name_y').apply(lambda x: x[x.salary == x.salary.max()])
    df = df.rename(columns={'name_y': 'Department', 'name_x': 'Employee'})
    df = df.drop(columns=['id_x', 'id_y']).reset_index()
    return df[['Department', 'Employee', 'salary']]
