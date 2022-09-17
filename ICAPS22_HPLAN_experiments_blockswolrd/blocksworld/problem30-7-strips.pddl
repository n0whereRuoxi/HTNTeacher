( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b707 - block
    b521 - block
    b940 - block
    b624 - block
    b834 - block
    b330 - block
    b581 - block
    b383 - block
    b531 - block
    b508 - block
    b951 - block
    b796 - block
    b17 - block
    b197 - block
    b329 - block
    b40 - block
    b634 - block
    b766 - block
    b741 - block
    b232 - block
    b458 - block
    b792 - block
    b281 - block
    b175 - block
    b22 - block
    b475 - block
    b129 - block
    b822 - block
    b978 - block
    b916 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b521 b707 )
    ( on b940 b521 )
    ( on b624 b940 )
    ( on b834 b624 )
    ( on b330 b834 )
    ( on b581 b330 )
    ( on b383 b581 )
    ( on b531 b383 )
    ( on b508 b531 )
    ( on b951 b508 )
    ( on b796 b951 )
    ( on b17 b796 )
    ( on b197 b17 )
    ( on b329 b197 )
    ( on b40 b329 )
    ( on b634 b40 )
    ( on b766 b634 )
    ( on b741 b766 )
    ( on b232 b741 )
    ( on b458 b232 )
    ( on b792 b458 )
    ( on b281 b792 )
    ( on b175 b281 )
    ( on b22 b175 )
    ( on b475 b22 )
    ( on b129 b475 )
    ( on b822 b129 )
    ( on b978 b822 )
    ( on b916 b978 )
    ( on b366 b916 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b707 )
    )
  )
)
