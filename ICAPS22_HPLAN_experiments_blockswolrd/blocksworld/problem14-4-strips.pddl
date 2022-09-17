( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b931 - block
    b313 - block
    b958 - block
    b657 - block
    b776 - block
    b236 - block
    b342 - block
    b789 - block
    b763 - block
    b782 - block
    b966 - block
    b286 - block
    b536 - block
    b127 - block
    b306 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b931 )
    ( on b313 b931 )
    ( on b958 b313 )
    ( on b657 b958 )
    ( on b776 b657 )
    ( on b236 b776 )
    ( on b342 b236 )
    ( on b789 b342 )
    ( on b763 b789 )
    ( on b782 b763 )
    ( on b966 b782 )
    ( on b286 b966 )
    ( on b536 b286 )
    ( on b127 b536 )
    ( on b306 b127 )
    ( clear b306 )
  )
  ( :goal
    ( and
      ( clear b931 )
    )
  )
)
