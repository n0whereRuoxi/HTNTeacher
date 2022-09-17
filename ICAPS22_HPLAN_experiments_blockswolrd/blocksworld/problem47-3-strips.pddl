( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b648 - block
    b902 - block
    b259 - block
    b314 - block
    b503 - block
    b81 - block
    b392 - block
    b721 - block
    b67 - block
    b11 - block
    b950 - block
    b767 - block
    b741 - block
    b660 - block
    b350 - block
    b951 - block
    b677 - block
    b549 - block
    b12 - block
    b451 - block
    b154 - block
    b958 - block
    b904 - block
    b954 - block
    b156 - block
    b927 - block
    b466 - block
    b113 - block
    b473 - block
    b527 - block
    b260 - block
    b385 - block
    b20 - block
    b786 - block
    b854 - block
    b69 - block
    b995 - block
    b172 - block
    b948 - block
    b289 - block
    b971 - block
    b179 - block
    b270 - block
    b623 - block
    b586 - block
    b221 - block
    b372 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b648 )
    ( on b902 b648 )
    ( on b259 b902 )
    ( on b314 b259 )
    ( on b503 b314 )
    ( on b81 b503 )
    ( on b392 b81 )
    ( on b721 b392 )
    ( on b67 b721 )
    ( on b11 b67 )
    ( on b950 b11 )
    ( on b767 b950 )
    ( on b741 b767 )
    ( on b660 b741 )
    ( on b350 b660 )
    ( on b951 b350 )
    ( on b677 b951 )
    ( on b549 b677 )
    ( on b12 b549 )
    ( on b451 b12 )
    ( on b154 b451 )
    ( on b958 b154 )
    ( on b904 b958 )
    ( on b954 b904 )
    ( on b156 b954 )
    ( on b927 b156 )
    ( on b466 b927 )
    ( on b113 b466 )
    ( on b473 b113 )
    ( on b527 b473 )
    ( on b260 b527 )
    ( on b385 b260 )
    ( on b20 b385 )
    ( on b786 b20 )
    ( on b854 b786 )
    ( on b69 b854 )
    ( on b995 b69 )
    ( on b172 b995 )
    ( on b948 b172 )
    ( on b289 b948 )
    ( on b971 b289 )
    ( on b179 b971 )
    ( on b270 b179 )
    ( on b623 b270 )
    ( on b586 b623 )
    ( on b221 b586 )
    ( on b372 b221 )
    ( on b742 b372 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b648 )
    )
  )
)
