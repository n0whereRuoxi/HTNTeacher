( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b721 - block
    b534 - block
    b141 - block
    b46 - block
    b596 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b534 b721 )
    ( on b141 b534 )
    ( on b46 b141 )
    ( on b596 b46 )
    ( clear b596 )
  )
  ( :tasks
    ( Make-4Pile b534 b141 b46 b596 )
  )
)
