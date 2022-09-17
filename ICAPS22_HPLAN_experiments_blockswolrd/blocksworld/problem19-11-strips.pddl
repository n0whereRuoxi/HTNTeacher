( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b114 - block
    b990 - block
    b437 - block
    b965 - block
    b252 - block
    b134 - block
    b729 - block
    b162 - block
    b271 - block
    b685 - block
    b764 - block
    b165 - block
    b139 - block
    b546 - block
    b138 - block
    b858 - block
    b494 - block
    b726 - block
    b276 - block
    b940 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b114 )
    ( on b990 b114 )
    ( on b437 b990 )
    ( on b965 b437 )
    ( on b252 b965 )
    ( on b134 b252 )
    ( on b729 b134 )
    ( on b162 b729 )
    ( on b271 b162 )
    ( on b685 b271 )
    ( on b764 b685 )
    ( on b165 b764 )
    ( on b139 b165 )
    ( on b546 b139 )
    ( on b138 b546 )
    ( on b858 b138 )
    ( on b494 b858 )
    ( on b726 b494 )
    ( on b276 b726 )
    ( on b940 b276 )
    ( clear b940 )
  )
  ( :goal
    ( and
      ( clear b114 )
    )
  )
)
