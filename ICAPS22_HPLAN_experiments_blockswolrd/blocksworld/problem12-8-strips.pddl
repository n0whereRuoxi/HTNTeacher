( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b506 - block
    b220 - block
    b936 - block
    b441 - block
    b850 - block
    b999 - block
    b133 - block
    b600 - block
    b31 - block
    b10 - block
    b162 - block
    b751 - block
    b504 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b506 )
    ( on b220 b506 )
    ( on b936 b220 )
    ( on b441 b936 )
    ( on b850 b441 )
    ( on b999 b850 )
    ( on b133 b999 )
    ( on b600 b133 )
    ( on b31 b600 )
    ( on b10 b31 )
    ( on b162 b10 )
    ( on b751 b162 )
    ( on b504 b751 )
    ( clear b504 )
  )
  ( :goal
    ( and
      ( clear b506 )
    )
  )
)
