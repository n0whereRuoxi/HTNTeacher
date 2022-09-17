( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b860 - block
    b10 - block
    b332 - block
    b793 - block
    b794 - block
    b840 - block
    b892 - block
    b111 - block
    b323 - block
    b643 - block
    b133 - block
    b501 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b860 )
    ( on b10 b860 )
    ( on b332 b10 )
    ( on b793 b332 )
    ( on b794 b793 )
    ( on b840 b794 )
    ( on b892 b840 )
    ( on b111 b892 )
    ( on b323 b111 )
    ( on b643 b323 )
    ( on b133 b643 )
    ( on b501 b133 )
    ( clear b501 )
  )
  ( :goal
    ( and
      ( clear b860 )
    )
  )
)
