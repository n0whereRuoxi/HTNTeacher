( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b455 - block
    b811 - block
    b785 - block
    b433 - block
    b637 - block
    b919 - block
    b85 - block
    b142 - block
    b393 - block
    b285 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b455 )
    ( on b811 b455 )
    ( on b785 b811 )
    ( on b433 b785 )
    ( on b637 b433 )
    ( on b919 b637 )
    ( on b85 b919 )
    ( on b142 b85 )
    ( on b393 b142 )
    ( on b285 b393 )
    ( clear b285 )
  )
  ( :tasks
    ( Make-9Pile b811 b785 b433 b637 b919 b85 b142 b393 b285 )
  )
)
