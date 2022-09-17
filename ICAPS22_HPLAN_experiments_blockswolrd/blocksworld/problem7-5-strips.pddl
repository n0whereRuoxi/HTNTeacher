( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b274 - block
    b182 - block
    b606 - block
    b212 - block
    b33 - block
    b174 - block
    b63 - block
    b918 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b274 )
    ( on b182 b274 )
    ( on b606 b182 )
    ( on b212 b606 )
    ( on b33 b212 )
    ( on b174 b33 )
    ( on b63 b174 )
    ( on b918 b63 )
    ( clear b918 )
  )
  ( :goal
    ( and
      ( clear b274 )
    )
  )
)
