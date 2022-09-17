( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b562 - block
    b582 - block
    b380 - block
    b971 - block
    b668 - block
    b972 - block
    b802 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b562 b902 )
    ( on b582 b562 )
    ( on b380 b582 )
    ( on b971 b380 )
    ( on b668 b971 )
    ( on b972 b668 )
    ( on b802 b972 )
    ( clear b802 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
