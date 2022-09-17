( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b973 - block
    b320 - block
    b572 - block
    b188 - block
    b485 - block
    b903 - block
    b501 - block
    b161 - block
    b232 - block
    b482 - block
    b698 - block
    b211 - block
    b786 - block
    b728 - block
    b587 - block
    b793 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b973 b143 )
    ( on b320 b973 )
    ( on b572 b320 )
    ( on b188 b572 )
    ( on b485 b188 )
    ( on b903 b485 )
    ( on b501 b903 )
    ( on b161 b501 )
    ( on b232 b161 )
    ( on b482 b232 )
    ( on b698 b482 )
    ( on b211 b698 )
    ( on b786 b211 )
    ( on b728 b786 )
    ( on b587 b728 )
    ( on b793 b587 )
    ( clear b793 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
