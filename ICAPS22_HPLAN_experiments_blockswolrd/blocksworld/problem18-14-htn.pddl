( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b901 - block
    b878 - block
    b742 - block
    b683 - block
    b574 - block
    b691 - block
    b905 - block
    b28 - block
    b650 - block
    b976 - block
    b274 - block
    b601 - block
    b66 - block
    b319 - block
    b927 - block
    b333 - block
    b726 - block
    b950 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b878 b901 )
    ( on b742 b878 )
    ( on b683 b742 )
    ( on b574 b683 )
    ( on b691 b574 )
    ( on b905 b691 )
    ( on b28 b905 )
    ( on b650 b28 )
    ( on b976 b650 )
    ( on b274 b976 )
    ( on b601 b274 )
    ( on b66 b601 )
    ( on b319 b66 )
    ( on b927 b319 )
    ( on b333 b927 )
    ( on b726 b333 )
    ( on b950 b726 )
    ( on b738 b950 )
    ( clear b738 )
  )
  ( :tasks
    ( Make-18Pile b878 b742 b683 b574 b691 b905 b28 b650 b976 b274 b601 b66 b319 b927 b333 b726 b950 b738 )
  )
)
