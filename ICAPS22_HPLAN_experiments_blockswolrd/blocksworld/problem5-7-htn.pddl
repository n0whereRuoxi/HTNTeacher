( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b883 - block
    b380 - block
    b16 - block
    b134 - block
    b316 - block
    b954 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b883 )
    ( on b380 b883 )
    ( on b16 b380 )
    ( on b134 b16 )
    ( on b316 b134 )
    ( on b954 b316 )
    ( clear b954 )
  )
  ( :tasks
    ( Make-5Pile b380 b16 b134 b316 b954 )
  )
)
