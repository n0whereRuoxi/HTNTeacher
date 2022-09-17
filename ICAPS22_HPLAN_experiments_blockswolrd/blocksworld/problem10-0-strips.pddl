( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b496 - block
    b965 - block
    b894 - block
    b401 - block
    b536 - block
    b602 - block
    b15 - block
    b182 - block
    b729 - block
    b56 - block
    b162 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b496 )
    ( on b965 b496 )
    ( on b894 b965 )
    ( on b401 b894 )
    ( on b536 b401 )
    ( on b602 b536 )
    ( on b15 b602 )
    ( on b182 b15 )
    ( on b729 b182 )
    ( on b56 b729 )
    ( on b162 b56 )
    ( clear b162 )
  )
  ( :goal
    ( and
      ( clear b496 )
    )
  )
)
