( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b704 - block
    b364 - block
    b588 - block
    b180 - block
    b983 - block
    b421 - block
    b691 - block
    b155 - block
    b376 - block
    b15 - block
    b608 - block
    b296 - block
    b415 - block
    b222 - block
    b331 - block
    b717 - block
    b621 - block
    b242 - block
    b225 - block
    b993 - block
    b796 - block
    b362 - block
    b488 - block
    b809 - block
    b493 - block
    b209 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b704 )
    ( on b364 b704 )
    ( on b588 b364 )
    ( on b180 b588 )
    ( on b983 b180 )
    ( on b421 b983 )
    ( on b691 b421 )
    ( on b155 b691 )
    ( on b376 b155 )
    ( on b15 b376 )
    ( on b608 b15 )
    ( on b296 b608 )
    ( on b415 b296 )
    ( on b222 b415 )
    ( on b331 b222 )
    ( on b717 b331 )
    ( on b621 b717 )
    ( on b242 b621 )
    ( on b225 b242 )
    ( on b993 b225 )
    ( on b796 b993 )
    ( on b362 b796 )
    ( on b488 b362 )
    ( on b809 b488 )
    ( on b493 b809 )
    ( on b209 b493 )
    ( clear b209 )
  )
  ( :tasks
    ( Make-25Pile b364 b588 b180 b983 b421 b691 b155 b376 b15 b608 b296 b415 b222 b331 b717 b621 b242 b225 b993 b796 b362 b488 b809 b493 b209 )
  )
)
