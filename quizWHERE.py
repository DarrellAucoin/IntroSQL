pd.read_sql_query(
"SELECT * \
FROM event \
WHERE name LIKE 'Intro%'", con)
