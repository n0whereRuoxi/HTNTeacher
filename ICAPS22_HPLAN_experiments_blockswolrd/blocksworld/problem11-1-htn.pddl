( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b57 - block
    b554 - block
    b112 - block
    b883 - block
    b688 - block
    b29 - block
    b340 - block
    b749 - block
    b676 - block
    b972 - block
    b502 - block
    b47 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b57 )
    ( on b554 b57 )
    ( on b112 b554 )
    ( on b883 b112 )
    ( on b688 b883 )
    ( on b29 b688 )
    ( on b340 b29 )
    ( on b749 b340 )
    ( on b676 b749 )
    ( on b972 b676 )
    ( on b502 b972 )
    ( on b47 b502 )
    ( clear b47 )
  )
  ( :tasks
    ( Make-11Pile b554 b112 b883 b688 b29 b340 b749 b676 b972 b502 b47 )
  )
)
