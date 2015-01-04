pd.read_sql_query(
"SELECT DISTINCT exec.name, exec.email, exec.phone \
FROM exec INNER JOIN event ON exec.questid = event.organizer", con)
