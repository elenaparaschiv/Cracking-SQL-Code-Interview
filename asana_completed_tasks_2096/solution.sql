
SELECT
    a_u.user_id,
    COALESCE(SUM(
        CASE WHEN 
            action_name = 'CompleteTask' THEN num_actions
            ELSE null END
        ),0)
FROM asana_users as a_u
LEFT JOIN asana_actions as a_a 
ON a_u.user_id = a_a.user_id
WHERE company = 'ClassPass'
AND  to_char(date, 'YY-MM') = '22-01'
GROUP BY 1

