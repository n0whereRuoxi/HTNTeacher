( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b59 - block
    b513 - block
    b762 - block
    b864 - block
    b391 - block
    b802 - block
    b672 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b59 b210 )
    ( on b513 b59 )
    ( on b762 b513 )
    ( on b864 b762 )
    ( on b391 b864 )
    ( on b802 b391 )
    ( on b672 b802 )
    ( on b421 b672 )
    ( clear b421 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)
