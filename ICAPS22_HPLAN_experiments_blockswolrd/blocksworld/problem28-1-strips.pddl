( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b87 - block
    b240 - block
    b936 - block
    b753 - block
    b42 - block
    b189 - block
    b591 - block
    b830 - block
    b155 - block
    b840 - block
    b548 - block
    b925 - block
    b305 - block
    b572 - block
    b13 - block
    b613 - block
    b489 - block
    b998 - block
    b57 - block
    b725 - block
    b149 - block
    b934 - block
    b540 - block
    b466 - block
    b99 - block
    b996 - block
    b859 - block
    b168 - block
    b602 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b87 )
    ( on b240 b87 )
    ( on b936 b240 )
    ( on b753 b936 )
    ( on b42 b753 )
    ( on b189 b42 )
    ( on b591 b189 )
    ( on b830 b591 )
    ( on b155 b830 )
    ( on b840 b155 )
    ( on b548 b840 )
    ( on b925 b548 )
    ( on b305 b925 )
    ( on b572 b305 )
    ( on b13 b572 )
    ( on b613 b13 )
    ( on b489 b613 )
    ( on b998 b489 )
    ( on b57 b998 )
    ( on b725 b57 )
    ( on b149 b725 )
    ( on b934 b149 )
    ( on b540 b934 )
    ( on b466 b540 )
    ( on b99 b466 )
    ( on b996 b99 )
    ( on b859 b996 )
    ( on b168 b859 )
    ( on b602 b168 )
    ( clear b602 )
  )
  ( :goal
    ( and
      ( clear b87 )
    )
  )
)
