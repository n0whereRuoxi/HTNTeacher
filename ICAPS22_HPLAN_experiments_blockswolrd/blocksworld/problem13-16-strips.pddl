( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b955 - block
    b265 - block
    b146 - block
    b567 - block
    b876 - block
    b452 - block
    b762 - block
    b113 - block
    b351 - block
    b527 - block
    b881 - block
    b96 - block
    b677 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b955 )
    ( on b265 b955 )
    ( on b146 b265 )
    ( on b567 b146 )
    ( on b876 b567 )
    ( on b452 b876 )
    ( on b762 b452 )
    ( on b113 b762 )
    ( on b351 b113 )
    ( on b527 b351 )
    ( on b881 b527 )
    ( on b96 b881 )
    ( on b677 b96 )
    ( on b63 b677 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b955 )
    )
  )
)
