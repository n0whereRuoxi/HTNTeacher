( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b354 - block
    b485 - block
    b212 - block
    b147 - block
    b402 - block
    b436 - block
    b353 - block
    b978 - block
    b682 - block
    b711 - block
    b509 - block
    b643 - block
    b759 - block
    b789 - block
    b647 - block
    b852 - block
    b991 - block
    b576 - block
    b348 - block
    b554 - block
    b516 - block
    b210 - block
    b678 - block
    b871 - block
    b754 - block
    b108 - block
    b999 - block
    b302 - block
    b232 - block
    b705 - block
    b427 - block
    b175 - block
    b125 - block
    b475 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b354 )
    ( on b485 b354 )
    ( on b212 b485 )
    ( on b147 b212 )
    ( on b402 b147 )
    ( on b436 b402 )
    ( on b353 b436 )
    ( on b978 b353 )
    ( on b682 b978 )
    ( on b711 b682 )
    ( on b509 b711 )
    ( on b643 b509 )
    ( on b759 b643 )
    ( on b789 b759 )
    ( on b647 b789 )
    ( on b852 b647 )
    ( on b991 b852 )
    ( on b576 b991 )
    ( on b348 b576 )
    ( on b554 b348 )
    ( on b516 b554 )
    ( on b210 b516 )
    ( on b678 b210 )
    ( on b871 b678 )
    ( on b754 b871 )
    ( on b108 b754 )
    ( on b999 b108 )
    ( on b302 b999 )
    ( on b232 b302 )
    ( on b705 b232 )
    ( on b427 b705 )
    ( on b175 b427 )
    ( on b125 b175 )
    ( on b475 b125 )
    ( clear b475 )
  )
  ( :goal
    ( and
      ( clear b354 )
    )
  )
)
