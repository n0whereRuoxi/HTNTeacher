( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b398 - block
    b165 - block
    b566 - block
    b648 - block
    b203 - block
    b810 - block
    b25 - block
    b960 - block
    b366 - block
    b915 - block
    b364 - block
    b937 - block
    b646 - block
    b620 - block
    b168 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b398 )
    ( on b165 b398 )
    ( on b566 b165 )
    ( on b648 b566 )
    ( on b203 b648 )
    ( on b810 b203 )
    ( on b25 b810 )
    ( on b960 b25 )
    ( on b366 b960 )
    ( on b915 b366 )
    ( on b364 b915 )
    ( on b937 b364 )
    ( on b646 b937 )
    ( on b620 b646 )
    ( on b168 b620 )
    ( clear b168 )
  )
  ( :goal
    ( and
      ( clear b398 )
    )
  )
)
