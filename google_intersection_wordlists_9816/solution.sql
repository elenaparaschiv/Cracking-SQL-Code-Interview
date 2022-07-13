
with words1 as (
select 
    UNNEST(STRING_TO_ARRAY(words1, ',')) words_1
from google_word_lists
),

words2 as (
select 
    UNNEST(STRING_TO_ARRAY(words2, ',')) words_2
from google_word_lists
)


SELECT 
    words_2
FROM words2
INTERSECT
SELECT 
    words_1
FROM words1