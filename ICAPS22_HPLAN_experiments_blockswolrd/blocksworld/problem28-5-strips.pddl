( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b520 - block
    b389 - block
    b940 - block
    b482 - block
    b459 - block
    b962 - block
    b392 - block
    b374 - block
    b294 - block
    b542 - block
    b402 - block
    b369 - block
    b797 - block
    b956 - block
    b390 - block
    b644 - block
    b113 - block
    b998 - block
    b961 - block
    b698 - block
    b787 - block
    b565 - block
    b739 - block
    b551 - block
    b662 - block
    b289 - block
    b589 - block
    b184 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b520 b93 )
    ( on b389 b520 )
    ( on b940 b389 )
    ( on b482 b940 )
    ( on b459 b482 )
    ( on b962 b459 )
    ( on b392 b962 )
    ( on b374 b392 )
    ( on b294 b374 )
    ( on b542 b294 )
    ( on b402 b542 )
    ( on b369 b402 )
    ( on b797 b369 )
    ( on b956 b797 )
    ( on b390 b956 )
    ( on b644 b390 )
    ( on b113 b644 )
    ( on b998 b113 )
    ( on b961 b998 )
    ( on b698 b961 )
    ( on b787 b698 )
    ( on b565 b787 )
    ( on b739 b565 )
    ( on b551 b739 )
    ( on b662 b551 )
    ( on b289 b662 )
    ( on b589 b289 )
    ( on b184 b589 )
    ( clear b184 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
