( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b606 - block
    b397 - block
    b518 - block
    b203 - block
    b802 - block
    b246 - block
    b635 - block
    b768 - block
    b811 - block
    b307 - block
    b253 - block
    b703 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b606 b144 )
    ( on b397 b606 )
    ( on b518 b397 )
    ( on b203 b518 )
    ( on b802 b203 )
    ( on b246 b802 )
    ( on b635 b246 )
    ( on b768 b635 )
    ( on b811 b768 )
    ( on b307 b811 )
    ( on b253 b307 )
    ( on b703 b253 )
    ( clear b703 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
