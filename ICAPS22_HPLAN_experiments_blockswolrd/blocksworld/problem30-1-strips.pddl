( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b66 - block
    b115 - block
    b541 - block
    b183 - block
    b979 - block
    b391 - block
    b578 - block
    b396 - block
    b956 - block
    b56 - block
    b502 - block
    b904 - block
    b533 - block
    b271 - block
    b270 - block
    b555 - block
    b219 - block
    b819 - block
    b583 - block
    b307 - block
    b812 - block
    b370 - block
    b980 - block
    b992 - block
    b606 - block
    b282 - block
    b142 - block
    b280 - block
    b972 - block
    b54 - block
    b842 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b66 )
    ( on b115 b66 )
    ( on b541 b115 )
    ( on b183 b541 )
    ( on b979 b183 )
    ( on b391 b979 )
    ( on b578 b391 )
    ( on b396 b578 )
    ( on b956 b396 )
    ( on b56 b956 )
    ( on b502 b56 )
    ( on b904 b502 )
    ( on b533 b904 )
    ( on b271 b533 )
    ( on b270 b271 )
    ( on b555 b270 )
    ( on b219 b555 )
    ( on b819 b219 )
    ( on b583 b819 )
    ( on b307 b583 )
    ( on b812 b307 )
    ( on b370 b812 )
    ( on b980 b370 )
    ( on b992 b980 )
    ( on b606 b992 )
    ( on b282 b606 )
    ( on b142 b282 )
    ( on b280 b142 )
    ( on b972 b280 )
    ( on b54 b972 )
    ( on b842 b54 )
    ( clear b842 )
  )
  ( :goal
    ( and
      ( clear b66 )
    )
  )
)
