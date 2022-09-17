( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b162 - block
    b716 - block
    b427 - block
    b912 - block
    b928 - block
    b511 - block
    b647 - block
    b767 - block
    b551 - block
    b392 - block
    b205 - block
    b2 - block
    b627 - block
    b871 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b162 )
    ( on b716 b162 )
    ( on b427 b716 )
    ( on b912 b427 )
    ( on b928 b912 )
    ( on b511 b928 )
    ( on b647 b511 )
    ( on b767 b647 )
    ( on b551 b767 )
    ( on b392 b551 )
    ( on b205 b392 )
    ( on b2 b205 )
    ( on b627 b2 )
    ( on b871 b627 )
    ( clear b871 )
  )
  ( :tasks
    ( Make-13Pile b716 b427 b912 b928 b511 b647 b767 b551 b392 b205 b2 b627 b871 )
  )
)
