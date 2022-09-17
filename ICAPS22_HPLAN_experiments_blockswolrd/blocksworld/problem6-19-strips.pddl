( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b391 - block
    b840 - block
    b118 - block
    b724 - block
    b503 - block
    b656 - block
    b52 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b391 )
    ( on b840 b391 )
    ( on b118 b840 )
    ( on b724 b118 )
    ( on b503 b724 )
    ( on b656 b503 )
    ( on b52 b656 )
    ( clear b52 )
  )
  ( :goal
    ( and
      ( clear b391 )
    )
  )
)
