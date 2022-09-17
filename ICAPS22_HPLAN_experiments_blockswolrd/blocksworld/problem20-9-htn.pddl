( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b731 - block
    b914 - block
    b798 - block
    b966 - block
    b300 - block
    b429 - block
    b259 - block
    b632 - block
    b634 - block
    b615 - block
    b679 - block
    b707 - block
    b413 - block
    b347 - block
    b581 - block
    b904 - block
    b771 - block
    b170 - block
    b383 - block
    b718 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b731 )
    ( on b914 b731 )
    ( on b798 b914 )
    ( on b966 b798 )
    ( on b300 b966 )
    ( on b429 b300 )
    ( on b259 b429 )
    ( on b632 b259 )
    ( on b634 b632 )
    ( on b615 b634 )
    ( on b679 b615 )
    ( on b707 b679 )
    ( on b413 b707 )
    ( on b347 b413 )
    ( on b581 b347 )
    ( on b904 b581 )
    ( on b771 b904 )
    ( on b170 b771 )
    ( on b383 b170 )
    ( on b718 b383 )
    ( on b716 b718 )
    ( clear b716 )
  )
  ( :tasks
    ( Make-20Pile b914 b798 b966 b300 b429 b259 b632 b634 b615 b679 b707 b413 b347 b581 b904 b771 b170 b383 b718 b716 )
  )
)
