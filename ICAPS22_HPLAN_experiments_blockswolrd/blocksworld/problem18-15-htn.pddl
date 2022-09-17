( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b958 - block
    b929 - block
    b392 - block
    b46 - block
    b171 - block
    b538 - block
    b91 - block
    b212 - block
    b865 - block
    b807 - block
    b153 - block
    b924 - block
    b754 - block
    b369 - block
    b452 - block
    b914 - block
    b305 - block
    b652 - block
    b961 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b958 )
    ( on b929 b958 )
    ( on b392 b929 )
    ( on b46 b392 )
    ( on b171 b46 )
    ( on b538 b171 )
    ( on b91 b538 )
    ( on b212 b91 )
    ( on b865 b212 )
    ( on b807 b865 )
    ( on b153 b807 )
    ( on b924 b153 )
    ( on b754 b924 )
    ( on b369 b754 )
    ( on b452 b369 )
    ( on b914 b452 )
    ( on b305 b914 )
    ( on b652 b305 )
    ( on b961 b652 )
    ( clear b961 )
  )
  ( :tasks
    ( Make-18Pile b929 b392 b46 b171 b538 b91 b212 b865 b807 b153 b924 b754 b369 b452 b914 b305 b652 b961 )
  )
)
