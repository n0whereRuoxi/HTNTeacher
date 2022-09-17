( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b946 - block
    b477 - block
    b72 - block
    b207 - block
    b780 - block
    b14 - block
    b260 - block
    b490 - block
    b627 - block
    b446 - block
    b3 - block
    b384 - block
    b734 - block
    b290 - block
    b49 - block
    b152 - block
    b642 - block
    b904 - block
    b574 - block
    b914 - block
    b470 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b477 b946 )
    ( on b72 b477 )
    ( on b207 b72 )
    ( on b780 b207 )
    ( on b14 b780 )
    ( on b260 b14 )
    ( on b490 b260 )
    ( on b627 b490 )
    ( on b446 b627 )
    ( on b3 b446 )
    ( on b384 b3 )
    ( on b734 b384 )
    ( on b290 b734 )
    ( on b49 b290 )
    ( on b152 b49 )
    ( on b642 b152 )
    ( on b904 b642 )
    ( on b574 b904 )
    ( on b914 b574 )
    ( on b470 b914 )
    ( clear b470 )
  )
  ( :tasks
    ( Make-20Pile b477 b72 b207 b780 b14 b260 b490 b627 b446 b3 b384 b734 b290 b49 b152 b642 b904 b574 b914 b470 )
  )
)
