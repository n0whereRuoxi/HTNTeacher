( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b749 - block
    b163 - block
    b591 - block
    b767 - block
    b470 - block
    b311 - block
    b971 - block
    b127 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b749 )
    ( on b163 b749 )
    ( on b591 b163 )
    ( on b767 b591 )
    ( on b470 b767 )
    ( on b311 b470 )
    ( on b971 b311 )
    ( on b127 b971 )
    ( on b95 b127 )
    ( clear b95 )
  )
  ( :tasks
    ( Make-8Pile b163 b591 b767 b470 b311 b971 b127 b95 )
  )
)
