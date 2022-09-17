( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b20 - block
    b209 - block
    b480 - block
    b444 - block
    b837 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b20 b91 )
    ( on b209 b20 )
    ( on b480 b209 )
    ( on b444 b480 )
    ( on b837 b444 )
    ( clear b837 )
  )
  ( :goal
    ( and
      ( clear b91 )
    )
  )
)
