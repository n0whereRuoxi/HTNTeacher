( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b493 - block
    b856 - block
    b988 - block
    b973 - block
    b305 - block
    b611 - block
    b21 - block
    b956 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b856 b493 )
    ( on b988 b856 )
    ( on b973 b988 )
    ( on b305 b973 )
    ( on b611 b305 )
    ( on b21 b611 )
    ( on b956 b21 )
    ( on b716 b956 )
    ( clear b716 )
  )
  ( :tasks
    ( Make-8Pile b856 b988 b973 b305 b611 b21 b956 b716 )
  )
)
