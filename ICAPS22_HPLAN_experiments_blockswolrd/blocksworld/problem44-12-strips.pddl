( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b548 - block
    b313 - block
    b688 - block
    b50 - block
    b464 - block
    b182 - block
    b180 - block
    b981 - block
    b25 - block
    b581 - block
    b711 - block
    b321 - block
    b765 - block
    b390 - block
    b573 - block
    b954 - block
    b968 - block
    b511 - block
    b12 - block
    b386 - block
    b141 - block
    b529 - block
    b825 - block
    b238 - block
    b663 - block
    b728 - block
    b917 - block
    b586 - block
    b920 - block
    b365 - block
    b282 - block
    b253 - block
    b855 - block
    b822 - block
    b638 - block
    b426 - block
    b956 - block
    b992 - block
    b524 - block
    b987 - block
    b505 - block
    b947 - block
    b18 - block
    b999 - block
    b777 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b548 )
    ( on b313 b548 )
    ( on b688 b313 )
    ( on b50 b688 )
    ( on b464 b50 )
    ( on b182 b464 )
    ( on b180 b182 )
    ( on b981 b180 )
    ( on b25 b981 )
    ( on b581 b25 )
    ( on b711 b581 )
    ( on b321 b711 )
    ( on b765 b321 )
    ( on b390 b765 )
    ( on b573 b390 )
    ( on b954 b573 )
    ( on b968 b954 )
    ( on b511 b968 )
    ( on b12 b511 )
    ( on b386 b12 )
    ( on b141 b386 )
    ( on b529 b141 )
    ( on b825 b529 )
    ( on b238 b825 )
    ( on b663 b238 )
    ( on b728 b663 )
    ( on b917 b728 )
    ( on b586 b917 )
    ( on b920 b586 )
    ( on b365 b920 )
    ( on b282 b365 )
    ( on b253 b282 )
    ( on b855 b253 )
    ( on b822 b855 )
    ( on b638 b822 )
    ( on b426 b638 )
    ( on b956 b426 )
    ( on b992 b956 )
    ( on b524 b992 )
    ( on b987 b524 )
    ( on b505 b987 )
    ( on b947 b505 )
    ( on b18 b947 )
    ( on b999 b18 )
    ( on b777 b999 )
    ( clear b777 )
  )
  ( :goal
    ( and
      ( clear b548 )
    )
  )
)
