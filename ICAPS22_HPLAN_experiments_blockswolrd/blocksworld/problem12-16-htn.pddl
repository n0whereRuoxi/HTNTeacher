( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b100 - block
    b245 - block
    b256 - block
    b576 - block
    b445 - block
    b560 - block
    b72 - block
    b431 - block
    b44 - block
    b448 - block
    b752 - block
    b734 - block
    b348 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b100 )
    ( on b245 b100 )
    ( on b256 b245 )
    ( on b576 b256 )
    ( on b445 b576 )
    ( on b560 b445 )
    ( on b72 b560 )
    ( on b431 b72 )
    ( on b44 b431 )
    ( on b448 b44 )
    ( on b752 b448 )
    ( on b734 b752 )
    ( on b348 b734 )
    ( clear b348 )
  )
  ( :tasks
    ( Make-12Pile b245 b256 b576 b445 b560 b72 b431 b44 b448 b752 b734 b348 )
  )
)
