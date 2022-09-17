( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b772 - block
    b787 - block
    b227 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b787 b772 )
    ( on b227 b787 )
    ( clear b227 )
  )
  ( :tasks
    ( Make-2Pile b787 b227 )
  )
)
