import pandas as pd


def article_views(views: pd.DataFrame) -> pd.DataFrame:
    # Apply the condition in statement to extract out required data from database.
    filtered = views[views['author_id'] == views['viewer_id']]

    # Select distinct values for 'author_id', remove duplicates and rename the column as 'id'
    result = filtered[['author_id']].drop_duplicates().rename(columns={
        'author_id': 'id'})

    # Sort the result by 'id'
    return result.sort_values('id')
