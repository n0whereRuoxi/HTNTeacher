( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b262 - block
    b396 - block
    b773 - block
    b613 - block
    b804 - block
    b840 - block
    b775 - block
    b755 - block
    b662 - block
    b435 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b262 )
    ( on b396 b262 )
    ( on b773 b396 )
    ( on b613 b773 )
    ( on b804 b613 )
    ( on b840 b804 )
    ( on b775 b840 )
    ( on b755 b775 )
    ( on b662 b755 )
    ( on b435 b662 )
    ( clear b435 )
  )
  ( :goal
    ( and
      ( clear b262 )
    )
  )
)
