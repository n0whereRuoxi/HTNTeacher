( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b745 - block
    b467 - block
    b106 - block
    b501 - block
    b992 - block
    b517 - block
    b182 - block
    b111 - block
    b244 - block
    b459 - block
    b316 - block
    b672 - block
    b381 - block
    b402 - block
    b942 - block
    b518 - block
    b282 - block
    b281 - block
    b23 - block
    b550 - block
    b20 - block
    b906 - block
    b753 - block
    b498 - block
    b46 - block
    b864 - block
    b645 - block
    b129 - block
    b769 - block
    b836 - block
    b148 - block
    b324 - block
    b398 - block
    b905 - block
    b328 - block
    b604 - block
    b570 - block
    b711 - block
    b622 - block
    b647 - block
    b588 - block
    b870 - block
    b415 - block
    b608 - block
    b988 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b745 )
    ( on b467 b745 )
    ( on b106 b467 )
    ( on b501 b106 )
    ( on b992 b501 )
    ( on b517 b992 )
    ( on b182 b517 )
    ( on b111 b182 )
    ( on b244 b111 )
    ( on b459 b244 )
    ( on b316 b459 )
    ( on b672 b316 )
    ( on b381 b672 )
    ( on b402 b381 )
    ( on b942 b402 )
    ( on b518 b942 )
    ( on b282 b518 )
    ( on b281 b282 )
    ( on b23 b281 )
    ( on b550 b23 )
    ( on b20 b550 )
    ( on b906 b20 )
    ( on b753 b906 )
    ( on b498 b753 )
    ( on b46 b498 )
    ( on b864 b46 )
    ( on b645 b864 )
    ( on b129 b645 )
    ( on b769 b129 )
    ( on b836 b769 )
    ( on b148 b836 )
    ( on b324 b148 )
    ( on b398 b324 )
    ( on b905 b398 )
    ( on b328 b905 )
    ( on b604 b328 )
    ( on b570 b604 )
    ( on b711 b570 )
    ( on b622 b711 )
    ( on b647 b622 )
    ( on b588 b647 )
    ( on b870 b588 )
    ( on b415 b870 )
    ( on b608 b415 )
    ( on b988 b608 )
    ( clear b988 )
  )
  ( :goal
    ( and
      ( clear b745 )
    )
  )
)
