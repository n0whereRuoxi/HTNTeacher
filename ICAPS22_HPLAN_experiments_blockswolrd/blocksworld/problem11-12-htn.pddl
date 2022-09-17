( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b291 - block
    b138 - block
    b365 - block
    b1 - block
    b552 - block
    b555 - block
    b756 - block
    b750 - block
    b839 - block
    b735 - block
    b609 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b291 )
    ( on b138 b291 )
    ( on b365 b138 )
    ( on b1 b365 )
    ( on b552 b1 )
    ( on b555 b552 )
    ( on b756 b555 )
    ( on b750 b756 )
    ( on b839 b750 )
    ( on b735 b839 )
    ( on b609 b735 )
    ( on b502 b609 )
    ( clear b502 )
  )
  ( :tasks
    ( Make-11Pile b138 b365 b1 b552 b555 b756 b750 b839 b735 b609 b502 )
  )
)
