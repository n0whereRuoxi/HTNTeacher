( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b959 - block
    b363 - block
    b733 - block
    b776 - block
    b243 - block
    b178 - block
    b58 - block
    b146 - block
    b23 - block
    b271 - block
    b432 - block
    b436 - block
    b781 - block
    b980 - block
    b890 - block
    b249 - block
    b431 - block
    b171 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b959 )
    ( on b363 b959 )
    ( on b733 b363 )
    ( on b776 b733 )
    ( on b243 b776 )
    ( on b178 b243 )
    ( on b58 b178 )
    ( on b146 b58 )
    ( on b23 b146 )
    ( on b271 b23 )
    ( on b432 b271 )
    ( on b436 b432 )
    ( on b781 b436 )
    ( on b980 b781 )
    ( on b890 b980 )
    ( on b249 b890 )
    ( on b431 b249 )
    ( on b171 b431 )
    ( clear b171 )
  )
  ( :goal
    ( and
      ( clear b959 )
    )
  )
)
