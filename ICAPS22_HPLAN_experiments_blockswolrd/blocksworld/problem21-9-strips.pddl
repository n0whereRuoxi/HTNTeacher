( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b865 - block
    b276 - block
    b111 - block
    b841 - block
    b987 - block
    b34 - block
    b771 - block
    b343 - block
    b41 - block
    b414 - block
    b873 - block
    b223 - block
    b2 - block
    b494 - block
    b281 - block
    b542 - block
    b288 - block
    b138 - block
    b348 - block
    b371 - block
    b134 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b865 )
    ( on b276 b865 )
    ( on b111 b276 )
    ( on b841 b111 )
    ( on b987 b841 )
    ( on b34 b987 )
    ( on b771 b34 )
    ( on b343 b771 )
    ( on b41 b343 )
    ( on b414 b41 )
    ( on b873 b414 )
    ( on b223 b873 )
    ( on b2 b223 )
    ( on b494 b2 )
    ( on b281 b494 )
    ( on b542 b281 )
    ( on b288 b542 )
    ( on b138 b288 )
    ( on b348 b138 )
    ( on b371 b348 )
    ( on b134 b371 )
    ( on b742 b134 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b865 )
    )
  )
)
