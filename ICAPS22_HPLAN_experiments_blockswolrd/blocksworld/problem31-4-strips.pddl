( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b68 - block
    b616 - block
    b923 - block
    b222 - block
    b822 - block
    b370 - block
    b199 - block
    b774 - block
    b573 - block
    b63 - block
    b604 - block
    b877 - block
    b258 - block
    b131 - block
    b590 - block
    b598 - block
    b836 - block
    b485 - block
    b453 - block
    b927 - block
    b46 - block
    b254 - block
    b780 - block
    b434 - block
    b309 - block
    b875 - block
    b963 - block
    b326 - block
    b809 - block
    b137 - block
    b431 - block
    b489 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b68 )
    ( on b616 b68 )
    ( on b923 b616 )
    ( on b222 b923 )
    ( on b822 b222 )
    ( on b370 b822 )
    ( on b199 b370 )
    ( on b774 b199 )
    ( on b573 b774 )
    ( on b63 b573 )
    ( on b604 b63 )
    ( on b877 b604 )
    ( on b258 b877 )
    ( on b131 b258 )
    ( on b590 b131 )
    ( on b598 b590 )
    ( on b836 b598 )
    ( on b485 b836 )
    ( on b453 b485 )
    ( on b927 b453 )
    ( on b46 b927 )
    ( on b254 b46 )
    ( on b780 b254 )
    ( on b434 b780 )
    ( on b309 b434 )
    ( on b875 b309 )
    ( on b963 b875 )
    ( on b326 b963 )
    ( on b809 b326 )
    ( on b137 b809 )
    ( on b431 b137 )
    ( on b489 b431 )
    ( clear b489 )
  )
  ( :goal
    ( and
      ( clear b68 )
    )
  )
)
