( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b686 - block
    b189 - block
    b537 - block
    b163 - block
    b79 - block
    b561 - block
    b296 - block
    b112 - block
    b250 - block
    b640 - block
    b850 - block
    b996 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b686 )
    ( on b189 b686 )
    ( on b537 b189 )
    ( on b163 b537 )
    ( on b79 b163 )
    ( on b561 b79 )
    ( on b296 b561 )
    ( on b112 b296 )
    ( on b250 b112 )
    ( on b640 b250 )
    ( on b850 b640 )
    ( on b996 b850 )
    ( clear b996 )
  )
  ( :tasks
    ( Make-11Pile b189 b537 b163 b79 b561 b296 b112 b250 b640 b850 b996 )
  )
)
