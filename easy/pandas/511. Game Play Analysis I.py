import pandas as pd


def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:

    return activity.groupby(['player_id'], as_index=False).agg(min).drop(columns=['device_id', 'games_played']).rename(columns={'event_date': 'first_login'})
