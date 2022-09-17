( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b916 - block
    b651 - block
    b829 - block
    b517 - block
    b102 - block
    b545 - block
    b198 - block
    b853 - block
    b56 - block
    b467 - block
    b502 - block
    b596 - block
    b783 - block
    b904 - block
    b982 - block
    b650 - block
    b761 - block
    b776 - block
    b483 - block
    b101 - block
    b430 - block
    b732 - block
    b617 - block
    b600 - block
    b771 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b916 )
    ( on b651 b916 )
    ( on b829 b651 )
    ( on b517 b829 )
    ( on b102 b517 )
    ( on b545 b102 )
    ( on b198 b545 )
    ( on b853 b198 )
    ( on b56 b853 )
    ( on b467 b56 )
    ( on b502 b467 )
    ( on b596 b502 )
    ( on b783 b596 )
    ( on b904 b783 )
    ( on b982 b904 )
    ( on b650 b982 )
    ( on b761 b650 )
    ( on b776 b761 )
    ( on b483 b776 )
    ( on b101 b483 )
    ( on b430 b101 )
    ( on b732 b430 )
    ( on b617 b732 )
    ( on b600 b617 )
    ( on b771 b600 )
    ( clear b771 )
  )
  ( :goal
    ( and
      ( clear b916 )
    )
  )
)
