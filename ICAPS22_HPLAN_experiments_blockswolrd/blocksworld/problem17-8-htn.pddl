( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b304 - block
    b154 - block
    b176 - block
    b469 - block
    b325 - block
    b217 - block
    b475 - block
    b684 - block
    b661 - block
    b270 - block
    b67 - block
    b767 - block
    b812 - block
    b340 - block
    b147 - block
    b267 - block
    b567 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b154 b304 )
    ( on b176 b154 )
    ( on b469 b176 )
    ( on b325 b469 )
    ( on b217 b325 )
    ( on b475 b217 )
    ( on b684 b475 )
    ( on b661 b684 )
    ( on b270 b661 )
    ( on b67 b270 )
    ( on b767 b67 )
    ( on b812 b767 )
    ( on b340 b812 )
    ( on b147 b340 )
    ( on b267 b147 )
    ( on b567 b267 )
    ( on b468 b567 )
    ( clear b468 )
  )
  ( :tasks
    ( Make-17Pile b154 b176 b469 b325 b217 b475 b684 b661 b270 b67 b767 b812 b340 b147 b267 b567 b468 )
  )
)
