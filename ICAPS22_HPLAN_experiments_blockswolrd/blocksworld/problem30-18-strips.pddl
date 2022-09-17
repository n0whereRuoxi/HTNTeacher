( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b675 - block
    b176 - block
    b603 - block
    b641 - block
    b972 - block
    b676 - block
    b660 - block
    b213 - block
    b305 - block
    b955 - block
    b658 - block
    b374 - block
    b295 - block
    b484 - block
    b791 - block
    b63 - block
    b220 - block
    b500 - block
    b408 - block
    b13 - block
    b368 - block
    b323 - block
    b175 - block
    b526 - block
    b36 - block
    b284 - block
    b812 - block
    b839 - block
    b434 - block
    b91 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b675 b424 )
    ( on b176 b675 )
    ( on b603 b176 )
    ( on b641 b603 )
    ( on b972 b641 )
    ( on b676 b972 )
    ( on b660 b676 )
    ( on b213 b660 )
    ( on b305 b213 )
    ( on b955 b305 )
    ( on b658 b955 )
    ( on b374 b658 )
    ( on b295 b374 )
    ( on b484 b295 )
    ( on b791 b484 )
    ( on b63 b791 )
    ( on b220 b63 )
    ( on b500 b220 )
    ( on b408 b500 )
    ( on b13 b408 )
    ( on b368 b13 )
    ( on b323 b368 )
    ( on b175 b323 )
    ( on b526 b175 )
    ( on b36 b526 )
    ( on b284 b36 )
    ( on b812 b284 )
    ( on b839 b812 )
    ( on b434 b839 )
    ( on b91 b434 )
    ( clear b91 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
