( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b686 - block
    b844 - block
    b158 - block
    b275 - block
    b49 - block
    b390 - block
    b729 - block
    b343 - block
    b585 - block
    b827 - block
    b667 - block
    b592 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b686 )
    ( on b844 b686 )
    ( on b158 b844 )
    ( on b275 b158 )
    ( on b49 b275 )
    ( on b390 b49 )
    ( on b729 b390 )
    ( on b343 b729 )
    ( on b585 b343 )
    ( on b827 b585 )
    ( on b667 b827 )
    ( on b592 b667 )
    ( clear b592 )
  )
  ( :tasks
    ( Make-11Pile b844 b158 b275 b49 b390 b729 b343 b585 b827 b667 b592 )
  )
)
