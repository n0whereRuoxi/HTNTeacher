( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b650 - block
    b810 - block
    b378 - block
    b377 - block
    b151 - block
    b749 - block
    b34 - block
    b639 - block
    b981 - block
    b362 - block
    b251 - block
    b210 - block
    b688 - block
    b873 - block
    b191 - block
    b383 - block
    b113 - block
    b829 - block
    b280 - block
    b936 - block
    b186 - block
    b53 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b650 b874 )
    ( on b810 b650 )
    ( on b378 b810 )
    ( on b377 b378 )
    ( on b151 b377 )
    ( on b749 b151 )
    ( on b34 b749 )
    ( on b639 b34 )
    ( on b981 b639 )
    ( on b362 b981 )
    ( on b251 b362 )
    ( on b210 b251 )
    ( on b688 b210 )
    ( on b873 b688 )
    ( on b191 b873 )
    ( on b383 b191 )
    ( on b113 b383 )
    ( on b829 b113 )
    ( on b280 b829 )
    ( on b936 b280 )
    ( on b186 b936 )
    ( on b53 b186 )
    ( clear b53 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)
