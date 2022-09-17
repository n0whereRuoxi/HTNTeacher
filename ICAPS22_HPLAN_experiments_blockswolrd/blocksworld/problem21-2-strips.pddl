( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b508 - block
    b577 - block
    b894 - block
    b896 - block
    b155 - block
    b784 - block
    b105 - block
    b216 - block
    b41 - block
    b389 - block
    b379 - block
    b622 - block
    b961 - block
    b588 - block
    b815 - block
    b430 - block
    b292 - block
    b870 - block
    b926 - block
    b673 - block
    b84 - block
    b91 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b508 )
    ( on b577 b508 )
    ( on b894 b577 )
    ( on b896 b894 )
    ( on b155 b896 )
    ( on b784 b155 )
    ( on b105 b784 )
    ( on b216 b105 )
    ( on b41 b216 )
    ( on b389 b41 )
    ( on b379 b389 )
    ( on b622 b379 )
    ( on b961 b622 )
    ( on b588 b961 )
    ( on b815 b588 )
    ( on b430 b815 )
    ( on b292 b430 )
    ( on b870 b292 )
    ( on b926 b870 )
    ( on b673 b926 )
    ( on b84 b673 )
    ( on b91 b84 )
    ( clear b91 )
  )
  ( :goal
    ( and
      ( clear b508 )
    )
  )
)
