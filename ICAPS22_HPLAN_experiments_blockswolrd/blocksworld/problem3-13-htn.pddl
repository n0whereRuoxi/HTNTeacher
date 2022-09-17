( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b37 - block
    b416 - block
    b22 - block
    b866 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b37 )
    ( on b416 b37 )
    ( on b22 b416 )
    ( on b866 b22 )
    ( clear b866 )
  )
  ( :tasks
    ( Make-3Pile b416 b22 b866 )
  )
)
