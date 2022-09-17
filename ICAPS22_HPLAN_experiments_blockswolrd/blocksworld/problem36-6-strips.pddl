( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b864 - block
    b376 - block
    b562 - block
    b788 - block
    b247 - block
    b478 - block
    b321 - block
    b214 - block
    b420 - block
    b201 - block
    b156 - block
    b305 - block
    b654 - block
    b380 - block
    b657 - block
    b937 - block
    b750 - block
    b847 - block
    b659 - block
    b52 - block
    b918 - block
    b261 - block
    b974 - block
    b923 - block
    b473 - block
    b22 - block
    b320 - block
    b733 - block
    b15 - block
    b967 - block
    b569 - block
    b872 - block
    b495 - block
    b593 - block
    b982 - block
    b953 - block
    b358 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b864 )
    ( on b376 b864 )
    ( on b562 b376 )
    ( on b788 b562 )
    ( on b247 b788 )
    ( on b478 b247 )
    ( on b321 b478 )
    ( on b214 b321 )
    ( on b420 b214 )
    ( on b201 b420 )
    ( on b156 b201 )
    ( on b305 b156 )
    ( on b654 b305 )
    ( on b380 b654 )
    ( on b657 b380 )
    ( on b937 b657 )
    ( on b750 b937 )
    ( on b847 b750 )
    ( on b659 b847 )
    ( on b52 b659 )
    ( on b918 b52 )
    ( on b261 b918 )
    ( on b974 b261 )
    ( on b923 b974 )
    ( on b473 b923 )
    ( on b22 b473 )
    ( on b320 b22 )
    ( on b733 b320 )
    ( on b15 b733 )
    ( on b967 b15 )
    ( on b569 b967 )
    ( on b872 b569 )
    ( on b495 b872 )
    ( on b593 b495 )
    ( on b982 b593 )
    ( on b953 b982 )
    ( on b358 b953 )
    ( clear b358 )
  )
  ( :goal
    ( and
      ( clear b864 )
    )
  )
)
