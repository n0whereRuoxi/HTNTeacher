( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b393 - block
    b229 - block
    b50 - block
    b608 - block
    b421 - block
    b260 - block
    b889 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b393 b210 )
    ( on b229 b393 )
    ( on b50 b229 )
    ( on b608 b50 )
    ( on b421 b608 )
    ( on b260 b421 )
    ( on b889 b260 )
    ( clear b889 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)