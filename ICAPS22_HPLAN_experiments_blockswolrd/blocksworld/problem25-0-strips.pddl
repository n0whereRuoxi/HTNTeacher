( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b558 - block
    b828 - block
    b708 - block
    b735 - block
    b337 - block
    b697 - block
    b836 - block
    b381 - block
    b41 - block
    b15 - block
    b332 - block
    b612 - block
    b751 - block
    b321 - block
    b851 - block
    b175 - block
    b96 - block
    b841 - block
    b862 - block
    b560 - block
    b292 - block
    b517 - block
    b314 - block
    b957 - block
    b222 - block
    b679 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b558 )
    ( on b828 b558 )
    ( on b708 b828 )
    ( on b735 b708 )
    ( on b337 b735 )
    ( on b697 b337 )
    ( on b836 b697 )
    ( on b381 b836 )
    ( on b41 b381 )
    ( on b15 b41 )
    ( on b332 b15 )
    ( on b612 b332 )
    ( on b751 b612 )
    ( on b321 b751 )
    ( on b851 b321 )
    ( on b175 b851 )
    ( on b96 b175 )
    ( on b841 b96 )
    ( on b862 b841 )
    ( on b560 b862 )
    ( on b292 b560 )
    ( on b517 b292 )
    ( on b314 b517 )
    ( on b957 b314 )
    ( on b222 b957 )
    ( on b679 b222 )
    ( clear b679 )
  )
  ( :goal
    ( and
      ( clear b558 )
    )
  )
)
