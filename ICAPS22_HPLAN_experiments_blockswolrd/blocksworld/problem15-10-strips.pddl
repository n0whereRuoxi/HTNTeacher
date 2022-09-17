( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b732 - block
    b658 - block
    b867 - block
    b991 - block
    b928 - block
    b100 - block
    b423 - block
    b718 - block
    b334 - block
    b786 - block
    b111 - block
    b573 - block
    b216 - block
    b202 - block
    b470 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b732 b324 )
    ( on b658 b732 )
    ( on b867 b658 )
    ( on b991 b867 )
    ( on b928 b991 )
    ( on b100 b928 )
    ( on b423 b100 )
    ( on b718 b423 )
    ( on b334 b718 )
    ( on b786 b334 )
    ( on b111 b786 )
    ( on b573 b111 )
    ( on b216 b573 )
    ( on b202 b216 )
    ( on b470 b202 )
    ( clear b470 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
