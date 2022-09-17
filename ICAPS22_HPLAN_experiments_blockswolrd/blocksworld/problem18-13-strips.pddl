( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b310 - block
    b542 - block
    b932 - block
    b431 - block
    b967 - block
    b445 - block
    b33 - block
    b439 - block
    b743 - block
    b208 - block
    b254 - block
    b224 - block
    b59 - block
    b814 - block
    b882 - block
    b937 - block
    b430 - block
    b716 - block
    b783 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b310 )
    ( on b542 b310 )
    ( on b932 b542 )
    ( on b431 b932 )
    ( on b967 b431 )
    ( on b445 b967 )
    ( on b33 b445 )
    ( on b439 b33 )
    ( on b743 b439 )
    ( on b208 b743 )
    ( on b254 b208 )
    ( on b224 b254 )
    ( on b59 b224 )
    ( on b814 b59 )
    ( on b882 b814 )
    ( on b937 b882 )
    ( on b430 b937 )
    ( on b716 b430 )
    ( on b783 b716 )
    ( clear b783 )
  )
  ( :goal
    ( and
      ( clear b310 )
    )
  )
)
