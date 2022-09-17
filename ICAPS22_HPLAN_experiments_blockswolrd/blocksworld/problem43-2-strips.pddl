( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b384 - block
    b478 - block
    b161 - block
    b301 - block
    b828 - block
    b111 - block
    b341 - block
    b44 - block
    b318 - block
    b574 - block
    b319 - block
    b106 - block
    b104 - block
    b488 - block
    b821 - block
    b223 - block
    b347 - block
    b333 - block
    b841 - block
    b119 - block
    b68 - block
    b771 - block
    b495 - block
    b464 - block
    b185 - block
    b534 - block
    b205 - block
    b954 - block
    b324 - block
    b570 - block
    b853 - block
    b774 - block
    b502 - block
    b695 - block
    b168 - block
    b888 - block
    b522 - block
    b124 - block
    b292 - block
    b200 - block
    b297 - block
    b868 - block
    b921 - block
    b114 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b384 )
    ( on b478 b384 )
    ( on b161 b478 )
    ( on b301 b161 )
    ( on b828 b301 )
    ( on b111 b828 )
    ( on b341 b111 )
    ( on b44 b341 )
    ( on b318 b44 )
    ( on b574 b318 )
    ( on b319 b574 )
    ( on b106 b319 )
    ( on b104 b106 )
    ( on b488 b104 )
    ( on b821 b488 )
    ( on b223 b821 )
    ( on b347 b223 )
    ( on b333 b347 )
    ( on b841 b333 )
    ( on b119 b841 )
    ( on b68 b119 )
    ( on b771 b68 )
    ( on b495 b771 )
    ( on b464 b495 )
    ( on b185 b464 )
    ( on b534 b185 )
    ( on b205 b534 )
    ( on b954 b205 )
    ( on b324 b954 )
    ( on b570 b324 )
    ( on b853 b570 )
    ( on b774 b853 )
    ( on b502 b774 )
    ( on b695 b502 )
    ( on b168 b695 )
    ( on b888 b168 )
    ( on b522 b888 )
    ( on b124 b522 )
    ( on b292 b124 )
    ( on b200 b292 )
    ( on b297 b200 )
    ( on b868 b297 )
    ( on b921 b868 )
    ( on b114 b921 )
    ( clear b114 )
  )
  ( :goal
    ( and
      ( clear b384 )
    )
  )
)
