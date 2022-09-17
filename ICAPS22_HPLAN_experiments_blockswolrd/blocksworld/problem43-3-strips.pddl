( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b731 - block
    b923 - block
    b39 - block
    b708 - block
    b452 - block
    b349 - block
    b74 - block
    b480 - block
    b33 - block
    b389 - block
    b117 - block
    b753 - block
    b810 - block
    b898 - block
    b904 - block
    b529 - block
    b662 - block
    b716 - block
    b89 - block
    b720 - block
    b332 - block
    b367 - block
    b743 - block
    b256 - block
    b893 - block
    b669 - block
    b558 - block
    b781 - block
    b159 - block
    b371 - block
    b35 - block
    b793 - block
    b356 - block
    b899 - block
    b982 - block
    b589 - block
    b507 - block
    b657 - block
    b572 - block
    b991 - block
    b258 - block
    b771 - block
    b306 - block
    b185 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b731 )
    ( on b923 b731 )
    ( on b39 b923 )
    ( on b708 b39 )
    ( on b452 b708 )
    ( on b349 b452 )
    ( on b74 b349 )
    ( on b480 b74 )
    ( on b33 b480 )
    ( on b389 b33 )
    ( on b117 b389 )
    ( on b753 b117 )
    ( on b810 b753 )
    ( on b898 b810 )
    ( on b904 b898 )
    ( on b529 b904 )
    ( on b662 b529 )
    ( on b716 b662 )
    ( on b89 b716 )
    ( on b720 b89 )
    ( on b332 b720 )
    ( on b367 b332 )
    ( on b743 b367 )
    ( on b256 b743 )
    ( on b893 b256 )
    ( on b669 b893 )
    ( on b558 b669 )
    ( on b781 b558 )
    ( on b159 b781 )
    ( on b371 b159 )
    ( on b35 b371 )
    ( on b793 b35 )
    ( on b356 b793 )
    ( on b899 b356 )
    ( on b982 b899 )
    ( on b589 b982 )
    ( on b507 b589 )
    ( on b657 b507 )
    ( on b572 b657 )
    ( on b991 b572 )
    ( on b258 b991 )
    ( on b771 b258 )
    ( on b306 b771 )
    ( on b185 b306 )
    ( clear b185 )
  )
  ( :goal
    ( and
      ( clear b731 )
    )
  )
)
