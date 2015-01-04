pd.read_sql_query(
"SELECT name, email \
FROM member \
UNION \
SELECT name, email \
FROM exec", con)
