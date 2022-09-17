( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b482 - block
    b667 - block
    b338 - block
    b710 - block
    b588 - block
    b158 - block
    b498 - block
    b336 - block
    b203 - block
    b606 - block
    b853 - block
    b52 - block
    b475 - block
    b823 - block
    b969 - block
    b579 - block
    b855 - block
    b656 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b667 b482 )
    ( on b338 b667 )
    ( on b710 b338 )
    ( on b588 b710 )
    ( on b158 b588 )
    ( on b498 b158 )
    ( on b336 b498 )
    ( on b203 b336 )
    ( on b606 b203 )
    ( on b853 b606 )
    ( on b52 b853 )
    ( on b475 b52 )
    ( on b823 b475 )
    ( on b969 b823 )
    ( on b579 b969 )
    ( on b855 b579 )
    ( on b656 b855 )
    ( on b223 b656 )
    ( clear b223 )
  )
  ( :tasks
    ( Make-18Pile b667 b338 b710 b588 b158 b498 b336 b203 b606 b853 b52 b475 b823 b969 b579 b855 b656 b223 )
  )
)
