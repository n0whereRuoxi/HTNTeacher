( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b855 - block
    b993 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b855 )
    ( on b993 b855 )
    ( on b803 b993 )
    ( clear b803 )
  )
  ( :tasks
    ( Make-2Pile b993 b803 )
  )
)
