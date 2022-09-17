( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b74 - block
    b103 - block
    b125 - block
    b155 - block
    b300 - block
    b343 - block
    b805 - block
    b720 - block
    b50 - block
    b319 - block
    b937 - block
    b472 - block
    b459 - block
    b226 - block
    b876 - block
    b936 - block
    b193 - block
    b401 - block
    b752 - block
    b403 - block
    b282 - block
    b986 - block
    b99 - block
    b59 - block
    b127 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b74 )
    ( on b103 b74 )
    ( on b125 b103 )
    ( on b155 b125 )
    ( on b300 b155 )
    ( on b343 b300 )
    ( on b805 b343 )
    ( on b720 b805 )
    ( on b50 b720 )
    ( on b319 b50 )
    ( on b937 b319 )
    ( on b472 b937 )
    ( on b459 b472 )
    ( on b226 b459 )
    ( on b876 b226 )
    ( on b936 b876 )
    ( on b193 b936 )
    ( on b401 b193 )
    ( on b752 b401 )
    ( on b403 b752 )
    ( on b282 b403 )
    ( on b986 b282 )
    ( on b99 b986 )
    ( on b59 b99 )
    ( on b127 b59 )
    ( on b874 b127 )
    ( clear b874 )
  )
  ( :goal
    ( and
      ( clear b74 )
    )
  )
)
