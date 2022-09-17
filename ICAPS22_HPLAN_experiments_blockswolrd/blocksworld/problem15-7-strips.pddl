( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b34 - block
    b142 - block
    b239 - block
    b855 - block
    b631 - block
    b50 - block
    b305 - block
    b358 - block
    b232 - block
    b516 - block
    b927 - block
    b745 - block
    b473 - block
    b144 - block
    b174 - block
    b934 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b34 )
    ( on b142 b34 )
    ( on b239 b142 )
    ( on b855 b239 )
    ( on b631 b855 )
    ( on b50 b631 )
    ( on b305 b50 )
    ( on b358 b305 )
    ( on b232 b358 )
    ( on b516 b232 )
    ( on b927 b516 )
    ( on b745 b927 )
    ( on b473 b745 )
    ( on b144 b473 )
    ( on b174 b144 )
    ( on b934 b174 )
    ( clear b934 )
  )
  ( :goal
    ( and
      ( clear b34 )
    )
  )
)
