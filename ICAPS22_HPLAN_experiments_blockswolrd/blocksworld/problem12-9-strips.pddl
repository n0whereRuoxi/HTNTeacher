( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b622 - block
    b835 - block
    b43 - block
    b344 - block
    b6 - block
    b916 - block
    b836 - block
    b704 - block
    b699 - block
    b305 - block
    b576 - block
    b475 - block
    b19 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b622 )
    ( on b835 b622 )
    ( on b43 b835 )
    ( on b344 b43 )
    ( on b6 b344 )
    ( on b916 b6 )
    ( on b836 b916 )
    ( on b704 b836 )
    ( on b699 b704 )
    ( on b305 b699 )
    ( on b576 b305 )
    ( on b475 b576 )
    ( on b19 b475 )
    ( clear b19 )
  )
  ( :goal
    ( and
      ( clear b622 )
    )
  )
)
