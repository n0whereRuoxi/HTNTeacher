( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b211 - block
    b488 - block
    b594 - block
    b862 - block
    b151 - block
    b337 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b211 )
    ( on b488 b211 )
    ( on b594 b488 )
    ( on b862 b594 )
    ( on b151 b862 )
    ( on b337 b151 )
    ( clear b337 )
  )
  ( :goal
    ( and
      ( clear b211 )
    )
  )
)
