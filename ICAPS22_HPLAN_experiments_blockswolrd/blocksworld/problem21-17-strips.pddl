( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b130 - block
    b422 - block
    b245 - block
    b161 - block
    b542 - block
    b822 - block
    b755 - block
    b137 - block
    b88 - block
    b176 - block
    b250 - block
    b757 - block
    b479 - block
    b984 - block
    b499 - block
    b771 - block
    b834 - block
    b799 - block
    b517 - block
    b75 - block
    b484 - block
    b314 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b130 )
    ( on b422 b130 )
    ( on b245 b422 )
    ( on b161 b245 )
    ( on b542 b161 )
    ( on b822 b542 )
    ( on b755 b822 )
    ( on b137 b755 )
    ( on b88 b137 )
    ( on b176 b88 )
    ( on b250 b176 )
    ( on b757 b250 )
    ( on b479 b757 )
    ( on b984 b479 )
    ( on b499 b984 )
    ( on b771 b499 )
    ( on b834 b771 )
    ( on b799 b834 )
    ( on b517 b799 )
    ( on b75 b517 )
    ( on b484 b75 )
    ( on b314 b484 )
    ( clear b314 )
  )
  ( :goal
    ( and
      ( clear b130 )
    )
  )
)
