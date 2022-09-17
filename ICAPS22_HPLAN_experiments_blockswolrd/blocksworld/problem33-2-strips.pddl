( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b783 - block
    b299 - block
    b924 - block
    b720 - block
    b473 - block
    b791 - block
    b403 - block
    b760 - block
    b433 - block
    b260 - block
    b835 - block
    b731 - block
    b4 - block
    b933 - block
    b662 - block
    b904 - block
    b499 - block
    b199 - block
    b329 - block
    b586 - block
    b712 - block
    b277 - block
    b166 - block
    b124 - block
    b636 - block
    b935 - block
    b137 - block
    b524 - block
    b198 - block
    b397 - block
    b862 - block
    b960 - block
    b804 - block
    b842 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b783 )
    ( on b299 b783 )
    ( on b924 b299 )
    ( on b720 b924 )
    ( on b473 b720 )
    ( on b791 b473 )
    ( on b403 b791 )
    ( on b760 b403 )
    ( on b433 b760 )
    ( on b260 b433 )
    ( on b835 b260 )
    ( on b731 b835 )
    ( on b4 b731 )
    ( on b933 b4 )
    ( on b662 b933 )
    ( on b904 b662 )
    ( on b499 b904 )
    ( on b199 b499 )
    ( on b329 b199 )
    ( on b586 b329 )
    ( on b712 b586 )
    ( on b277 b712 )
    ( on b166 b277 )
    ( on b124 b166 )
    ( on b636 b124 )
    ( on b935 b636 )
    ( on b137 b935 )
    ( on b524 b137 )
    ( on b198 b524 )
    ( on b397 b198 )
    ( on b862 b397 )
    ( on b960 b862 )
    ( on b804 b960 )
    ( on b842 b804 )
    ( clear b842 )
  )
  ( :goal
    ( and
      ( clear b783 )
    )
  )
)
