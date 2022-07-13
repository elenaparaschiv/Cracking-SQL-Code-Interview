WITH latest_dates AS(
    SELECT 
        user_firstname,
        user_lastname,
        max(reviewed_date) latest_date
   FROM user_flags AS uf
   INNER JOIN flag_review AS fr
   ON uf.flag_id = fr.flag_id
   WHERE reviewed_by_yt
   GROUP BY 1,2
 ),
   
n_removed_by_date AS( 
    SELECT 
        reviewed_date,
        count(DISTINCT video_id) n_removed
   FROM user_flags AS uf
   INNER JOIN flag_review AS fr
   ON uf.flag_id = fr.flag_id
   WHERE LOWER(reviewed_outcome) = 'removed'
   GROUP BY reviewed_date
)

SELECT ld.*,
       coalesce(nr.n_removed, 0) n_removed
FROM latest_dates ld
LEFT JOIN n_removed_by_date nr
ON ld.latest_date = nr.reviewed_date