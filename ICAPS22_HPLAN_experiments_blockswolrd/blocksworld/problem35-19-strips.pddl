( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b666 - block
    b516 - block
    b874 - block
    b161 - block
    b177 - block
    b155 - block
    b701 - block
    b235 - block
    b367 - block
    b525 - block
    b610 - block
    b437 - block
    b604 - block
    b425 - block
    b876 - block
    b875 - block
    b319 - block
    b51 - block
    b787 - block
    b761 - block
    b325 - block
    b17 - block
    b184 - block
    b571 - block
    b229 - block
    b233 - block
    b776 - block
    b216 - block
    b912 - block
    b264 - block
    b897 - block
    b251 - block
    b31 - block
    b482 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b666 b825 )
    ( on b516 b666 )
    ( on b874 b516 )
    ( on b161 b874 )
    ( on b177 b161 )
    ( on b155 b177 )
    ( on b701 b155 )
    ( on b235 b701 )
    ( on b367 b235 )
    ( on b525 b367 )
    ( on b610 b525 )
    ( on b437 b610 )
    ( on b604 b437 )
    ( on b425 b604 )
    ( on b876 b425 )
    ( on b875 b876 )
    ( on b319 b875 )
    ( on b51 b319 )
    ( on b787 b51 )
    ( on b761 b787 )
    ( on b325 b761 )
    ( on b17 b325 )
    ( on b184 b17 )
    ( on b571 b184 )
    ( on b229 b571 )
    ( on b233 b229 )
    ( on b776 b233 )
    ( on b216 b776 )
    ( on b912 b216 )
    ( on b264 b912 )
    ( on b897 b264 )
    ( on b251 b897 )
    ( on b31 b251 )
    ( on b482 b31 )
    ( on b635 b482 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b825 )
    )
  )
)
