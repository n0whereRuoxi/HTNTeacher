( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b285 - block
    b477 - block
    b883 - block
    b375 - block
    b303 - block
    b43 - block
    b920 - block
    b660 - block
    b568 - block
    b576 - block
    b217 - block
    b457 - block
    b7 - block
    b67 - block
    b887 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b285 )
    ( on b477 b285 )
    ( on b883 b477 )
    ( on b375 b883 )
    ( on b303 b375 )
    ( on b43 b303 )
    ( on b920 b43 )
    ( on b660 b920 )
    ( on b568 b660 )
    ( on b576 b568 )
    ( on b217 b576 )
    ( on b457 b217 )
    ( on b7 b457 )
    ( on b67 b7 )
    ( on b887 b67 )
    ( on b80 b887 )
    ( clear b80 )
  )
  ( :tasks
    ( Make-15Pile b477 b883 b375 b303 b43 b920 b660 b568 b576 b217 b457 b7 b67 b887 b80 )
  )
)
