( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b941 - block
    b448 - block
    b315 - block
    b300 - block
    b380 - block
    b614 - block
    b805 - block
    b14 - block
    b886 - block
    b449 - block
    b747 - block
    b420 - block
    b895 - block
    b185 - block
    b115 - block
    b552 - block
    b236 - block
    b201 - block
    b625 - block
    b891 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b941 )
    ( on b448 b941 )
    ( on b315 b448 )
    ( on b300 b315 )
    ( on b380 b300 )
    ( on b614 b380 )
    ( on b805 b614 )
    ( on b14 b805 )
    ( on b886 b14 )
    ( on b449 b886 )
    ( on b747 b449 )
    ( on b420 b747 )
    ( on b895 b420 )
    ( on b185 b895 )
    ( on b115 b185 )
    ( on b552 b115 )
    ( on b236 b552 )
    ( on b201 b236 )
    ( on b625 b201 )
    ( on b891 b625 )
    ( clear b891 )
  )
  ( :goal
    ( and
      ( clear b941 )
    )
  )
)
