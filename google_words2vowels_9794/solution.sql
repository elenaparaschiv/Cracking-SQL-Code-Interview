with words as 
(
    SELECT 
      UNNEST(STRING_TO_ARRAY(words1,',')) as word
    from google_word_lists
    UNION
    SELECT
    UNNEST(STRING_TO_ARRAY(words2,',')) as word
    from google_word_lists
) 


SELECT
*
FROM
words
WHERE word ~ '([aeiou].*){2}'
AND NOT word ~ '([aeiou].*){3}'

