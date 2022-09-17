( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b531 - block
    b568 - block
    b968 - block
    b785 - block
    b575 - block
    b639 - block
    b30 - block
    b392 - block
    b962 - block
    b513 - block
    b285 - block
    b239 - block
    b394 - block
    b148 - block
    b739 - block
    b945 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b531 )
    ( on b568 b531 )
    ( on b968 b568 )
    ( on b785 b968 )
    ( on b575 b785 )
    ( on b639 b575 )
    ( on b30 b639 )
    ( on b392 b30 )
    ( on b962 b392 )
    ( on b513 b962 )
    ( on b285 b513 )
    ( on b239 b285 )
    ( on b394 b239 )
    ( on b148 b394 )
    ( on b739 b148 )
    ( on b945 b739 )
    ( clear b945 )
  )
  ( :tasks
    ( Make-15Pile b568 b968 b785 b575 b639 b30 b392 b962 b513 b285 b239 b394 b148 b739 b945 )
  )
)
