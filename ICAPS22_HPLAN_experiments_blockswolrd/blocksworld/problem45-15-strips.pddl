( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b614 - block
    b777 - block
    b734 - block
    b5 - block
    b684 - block
    b360 - block
    b725 - block
    b571 - block
    b122 - block
    b203 - block
    b949 - block
    b54 - block
    b607 - block
    b575 - block
    b709 - block
    b491 - block
    b402 - block
    b839 - block
    b40 - block
    b426 - block
    b632 - block
    b502 - block
    b29 - block
    b545 - block
    b864 - block
    b260 - block
    b368 - block
    b362 - block
    b976 - block
    b555 - block
    b135 - block
    b710 - block
    b192 - block
    b52 - block
    b862 - block
    b137 - block
    b883 - block
    b197 - block
    b999 - block
    b956 - block
    b970 - block
    b760 - block
    b406 - block
    b131 - block
    b893 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b614 b64 )
    ( on b777 b614 )
    ( on b734 b777 )
    ( on b5 b734 )
    ( on b684 b5 )
    ( on b360 b684 )
    ( on b725 b360 )
    ( on b571 b725 )
    ( on b122 b571 )
    ( on b203 b122 )
    ( on b949 b203 )
    ( on b54 b949 )
    ( on b607 b54 )
    ( on b575 b607 )
    ( on b709 b575 )
    ( on b491 b709 )
    ( on b402 b491 )
    ( on b839 b402 )
    ( on b40 b839 )
    ( on b426 b40 )
    ( on b632 b426 )
    ( on b502 b632 )
    ( on b29 b502 )
    ( on b545 b29 )
    ( on b864 b545 )
    ( on b260 b864 )
    ( on b368 b260 )
    ( on b362 b368 )
    ( on b976 b362 )
    ( on b555 b976 )
    ( on b135 b555 )
    ( on b710 b135 )
    ( on b192 b710 )
    ( on b52 b192 )
    ( on b862 b52 )
    ( on b137 b862 )
    ( on b883 b137 )
    ( on b197 b883 )
    ( on b999 b197 )
    ( on b956 b999 )
    ( on b970 b956 )
    ( on b760 b970 )
    ( on b406 b760 )
    ( on b131 b406 )
    ( on b893 b131 )
    ( clear b893 )
  )
  ( :goal
    ( and
      ( clear b64 )
    )
  )
)
