( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b666 - block
    b921 - block
    b797 - block
    b890 - block
    b55 - block
    b309 - block
    b403 - block
    b565 - block
    b74 - block
    b550 - block
    b440 - block
    b81 - block
    b21 - block
    b749 - block
    b800 - block
    b71 - block
    b530 - block
    b20 - block
    b920 - block
    b784 - block
    b99 - block
    b596 - block
    b408 - block
    b165 - block
    b290 - block
    b275 - block
    b75 - block
    b986 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b666 )
    ( on b921 b666 )
    ( on b797 b921 )
    ( on b890 b797 )
    ( on b55 b890 )
    ( on b309 b55 )
    ( on b403 b309 )
    ( on b565 b403 )
    ( on b74 b565 )
    ( on b550 b74 )
    ( on b440 b550 )
    ( on b81 b440 )
    ( on b21 b81 )
    ( on b749 b21 )
    ( on b800 b749 )
    ( on b71 b800 )
    ( on b530 b71 )
    ( on b20 b530 )
    ( on b920 b20 )
    ( on b784 b920 )
    ( on b99 b784 )
    ( on b596 b99 )
    ( on b408 b596 )
    ( on b165 b408 )
    ( on b290 b165 )
    ( on b275 b290 )
    ( on b75 b275 )
    ( on b986 b75 )
    ( clear b986 )
  )
  ( :goal
    ( and
      ( clear b666 )
    )
  )
)
