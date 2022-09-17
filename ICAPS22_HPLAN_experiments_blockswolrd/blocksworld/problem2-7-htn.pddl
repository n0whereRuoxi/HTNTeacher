( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b262 - block
    b694 - block
    b586 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b262 )
    ( on b694 b262 )
    ( on b586 b694 )
    ( clear b586 )
  )
  ( :tasks
    ( Make-2Pile b694 b586 )
  )
)
