( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b371 - block
    b213 - block
    b187 - block
    b503 - block
    b752 - block
    b651 - block
    b321 - block
    b507 - block
    b903 - block
    b936 - block
    b15 - block
    b536 - block
    b978 - block
    b241 - block
    b193 - block
    b242 - block
    b387 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b371 )
    ( on b213 b371 )
    ( on b187 b213 )
    ( on b503 b187 )
    ( on b752 b503 )
    ( on b651 b752 )
    ( on b321 b651 )
    ( on b507 b321 )
    ( on b903 b507 )
    ( on b936 b903 )
    ( on b15 b936 )
    ( on b536 b15 )
    ( on b978 b536 )
    ( on b241 b978 )
    ( on b193 b241 )
    ( on b242 b193 )
    ( on b387 b242 )
    ( on b424 b387 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b371 )
    )
  )
)
