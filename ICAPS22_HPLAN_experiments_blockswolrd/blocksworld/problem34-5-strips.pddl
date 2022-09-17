( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b146 - block
    b416 - block
    b628 - block
    b973 - block
    b921 - block
    b393 - block
    b627 - block
    b353 - block
    b828 - block
    b342 - block
    b860 - block
    b777 - block
    b982 - block
    b426 - block
    b845 - block
    b276 - block
    b849 - block
    b131 - block
    b856 - block
    b772 - block
    b766 - block
    b427 - block
    b503 - block
    b165 - block
    b686 - block
    b893 - block
    b691 - block
    b535 - block
    b472 - block
    b575 - block
    b665 - block
    b513 - block
    b585 - block
    b570 - block
    b882 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b146 )
    ( on b416 b146 )
    ( on b628 b416 )
    ( on b973 b628 )
    ( on b921 b973 )
    ( on b393 b921 )
    ( on b627 b393 )
    ( on b353 b627 )
    ( on b828 b353 )
    ( on b342 b828 )
    ( on b860 b342 )
    ( on b777 b860 )
    ( on b982 b777 )
    ( on b426 b982 )
    ( on b845 b426 )
    ( on b276 b845 )
    ( on b849 b276 )
    ( on b131 b849 )
    ( on b856 b131 )
    ( on b772 b856 )
    ( on b766 b772 )
    ( on b427 b766 )
    ( on b503 b427 )
    ( on b165 b503 )
    ( on b686 b165 )
    ( on b893 b686 )
    ( on b691 b893 )
    ( on b535 b691 )
    ( on b472 b535 )
    ( on b575 b472 )
    ( on b665 b575 )
    ( on b513 b665 )
    ( on b585 b513 )
    ( on b570 b585 )
    ( on b882 b570 )
    ( clear b882 )
  )
  ( :goal
    ( and
      ( clear b146 )
    )
  )
)
