( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b889 - block
    b226 - block
    b671 - block
    b215 - block
    b41 - block
    b193 - block
    b541 - block
    b344 - block
    b984 - block
    b123 - block
    b487 - block
    b596 - block
    b231 - block
    b635 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b889 )
    ( on b226 b889 )
    ( on b671 b226 )
    ( on b215 b671 )
    ( on b41 b215 )
    ( on b193 b41 )
    ( on b541 b193 )
    ( on b344 b541 )
    ( on b984 b344 )
    ( on b123 b984 )
    ( on b487 b123 )
    ( on b596 b487 )
    ( on b231 b596 )
    ( on b635 b231 )
    ( on b554 b635 )
    ( clear b554 )
  )
  ( :tasks
    ( Make-14Pile b226 b671 b215 b41 b193 b541 b344 b984 b123 b487 b596 b231 b635 b554 )
  )
)
