SELECT 
  COUNT("id") 
FROM 
  "players" 
WHERE 
  (
    "throws" = 'R' 
    AND "bats" = 'L'
  ) 
  OR (
    "throws" = 'L' 
    AND "bats" = 'R'
  )
