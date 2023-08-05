import pandas as pd


def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    examinations = examinations.groupby(['student_id', 'subject_name'])
    examinations = examinations.agg(attended_exams=(
        'subject_name', 'count')).reset_index()
    df = pd.merge(students, subjects, how='cross')
    df = df.sort_values(by=['student_id', 'subject_name'])
    df = pd.merge(df, examinations, how='left', on=[
                  'student_id', 'subject_name'])
    df = df.fillna(0)
    return df[['student_id', 'student_name', 'subject_name', 'attended_exams']]
