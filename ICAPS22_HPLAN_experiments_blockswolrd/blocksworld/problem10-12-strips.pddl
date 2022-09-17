( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b686 - block
    b412 - block
    b76 - block
    b360 - block
    b561 - block
    b132 - block
    b72 - block
    b741 - block
    b289 - block
    b840 - block
    b280 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b686 )
    ( on b412 b686 )
    ( on b76 b412 )
    ( on b360 b76 )
    ( on b561 b360 )
    ( on b132 b561 )
    ( on b72 b132 )
    ( on b741 b72 )
    ( on b289 b741 )
    ( on b840 b289 )
    ( on b280 b840 )
    ( clear b280 )
  )
  ( :goal
    ( and
      ( clear b686 )
    )
  )
)
