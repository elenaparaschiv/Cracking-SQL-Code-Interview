WITH all_connections AS 
(    
    SELECT
        origin AS origin,
        destination AS destination,
        cost AS cost,
        0 AS n_stops
    FROM da_flights
    
    UNION ALL
    
    SELECT 
        a.origin AS origin,
        b.destination AS destination,
        a.cost  + b.cost AS cost,
        1 AS n_stops
    FROM da_flights a
    LEFT join da_flights b
    ON a.destination = b.origin
    WHERE b.destination IS NOT NULL
    
    UNION ALL
    
    SELECT
        a.origin AS origin,
        c.destination AS destination,
        a.cost + b.cost + c.cost AS cost,
        2 AS n_stops
    FROM da_flights a
    LEFT join da_flights b
    ON a.destination = b.origin
    LEFT JOIN da_flights c
    ON b.destination = c.origin
    WHERE c.destination IS NOT NULL
),

min_cost_flights AS 
(
    SELECT 
        *,
        DENSE_RANK() OVER (
            PARTITION BY origin, destination
            ORDER BY cost ASC,
        n_stops DESC) AS rnk
    FROM all_connections
)
    
SELECT origin, destination, cost, n_stops
FROM min_cost_flights
WHERE rnk = 1
ORDER BY 1, 2 , 4