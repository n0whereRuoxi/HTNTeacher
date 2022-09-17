( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b361 - block
    b163 - block
    b360 - block
    b965 - block
    b655 - block
    b925 - block
    b455 - block
    b72 - block
    b95 - block
    b349 - block
    b372 - block
    b542 - block
    b829 - block
    b321 - block
    b64 - block
    b238 - block
    b91 - block
    b474 - block
    b933 - block
    b885 - block
    b501 - block
    b783 - block
    b481 - block
    b587 - block
    b226 - block
    b331 - block
    b695 - block
    b661 - block
    b190 - block
    b850 - block
    b320 - block
    b107 - block
    b822 - block
    b741 - block
    b227 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b361 )
    ( on b163 b361 )
    ( on b360 b163 )
    ( on b965 b360 )
    ( on b655 b965 )
    ( on b925 b655 )
    ( on b455 b925 )
    ( on b72 b455 )
    ( on b95 b72 )
    ( on b349 b95 )
    ( on b372 b349 )
    ( on b542 b372 )
    ( on b829 b542 )
    ( on b321 b829 )
    ( on b64 b321 )
    ( on b238 b64 )
    ( on b91 b238 )
    ( on b474 b91 )
    ( on b933 b474 )
    ( on b885 b933 )
    ( on b501 b885 )
    ( on b783 b501 )
    ( on b481 b783 )
    ( on b587 b481 )
    ( on b226 b587 )
    ( on b331 b226 )
    ( on b695 b331 )
    ( on b661 b695 )
    ( on b190 b661 )
    ( on b850 b190 )
    ( on b320 b850 )
    ( on b107 b320 )
    ( on b822 b107 )
    ( on b741 b822 )
    ( on b227 b741 )
    ( clear b227 )
  )
  ( :goal
    ( and
      ( clear b361 )
    )
  )
)
