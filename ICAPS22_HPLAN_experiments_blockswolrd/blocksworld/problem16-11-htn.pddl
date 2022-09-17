( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b79 - block
    b410 - block
    b391 - block
    b844 - block
    b760 - block
    b996 - block
    b93 - block
    b875 - block
    b203 - block
    b366 - block
    b427 - block
    b792 - block
    b237 - block
    b258 - block
    b554 - block
    b793 - block
    b104 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b79 )
    ( on b410 b79 )
    ( on b391 b410 )
    ( on b844 b391 )
    ( on b760 b844 )
    ( on b996 b760 )
    ( on b93 b996 )
    ( on b875 b93 )
    ( on b203 b875 )
    ( on b366 b203 )
    ( on b427 b366 )
    ( on b792 b427 )
    ( on b237 b792 )
    ( on b258 b237 )
    ( on b554 b258 )
    ( on b793 b554 )
    ( on b104 b793 )
    ( clear b104 )
  )
  ( :tasks
    ( Make-16Pile b410 b391 b844 b760 b996 b93 b875 b203 b366 b427 b792 b237 b258 b554 b793 b104 )
  )
)
