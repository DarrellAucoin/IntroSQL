pd.read_sql_query(
"SELECT event, COUNT(*) AS attendance \
FROM attendance \
GROUP BY event", con)
