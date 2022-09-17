( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b752 - block
    b244 - block
    b605 - block
    b236 - block
    b951 - block
    b63 - block
    b78 - block
    b982 - block
    b379 - block
    b164 - block
    b242 - block
    b959 - block
    b676 - block
    b49 - block
    b813 - block
    b907 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b752 b942 )
    ( on b244 b752 )
    ( on b605 b244 )
    ( on b236 b605 )
    ( on b951 b236 )
    ( on b63 b951 )
    ( on b78 b63 )
    ( on b982 b78 )
    ( on b379 b982 )
    ( on b164 b379 )
    ( on b242 b164 )
    ( on b959 b242 )
    ( on b676 b959 )
    ( on b49 b676 )
    ( on b813 b49 )
    ( on b907 b813 )
    ( clear b907 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
