( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b300 - block
    b630 - block
    b996 - block
    b613 - block
    b852 - block
    b216 - block
    b513 - block
    b776 - block
    b719 - block
    b172 - block
    b564 - block
    b482 - block
    b754 - block
    b922 - block
    b573 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b300 )
    ( on b630 b300 )
    ( on b996 b630 )
    ( on b613 b996 )
    ( on b852 b613 )
    ( on b216 b852 )
    ( on b513 b216 )
    ( on b776 b513 )
    ( on b719 b776 )
    ( on b172 b719 )
    ( on b564 b172 )
    ( on b482 b564 )
    ( on b754 b482 )
    ( on b922 b754 )
    ( on b573 b922 )
    ( clear b573 )
  )
  ( :goal
    ( and
      ( clear b300 )
    )
  )
)
