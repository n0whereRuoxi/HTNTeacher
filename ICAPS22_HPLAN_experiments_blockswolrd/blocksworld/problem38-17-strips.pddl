( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b501 - block
    b522 - block
    b747 - block
    b415 - block
    b253 - block
    b102 - block
    b767 - block
    b327 - block
    b381 - block
    b907 - block
    b935 - block
    b95 - block
    b289 - block
    b746 - block
    b777 - block
    b111 - block
    b681 - block
    b644 - block
    b962 - block
    b225 - block
    b691 - block
    b59 - block
    b33 - block
    b282 - block
    b799 - block
    b161 - block
    b508 - block
    b293 - block
    b586 - block
    b412 - block
    b402 - block
    b150 - block
    b373 - block
    b797 - block
    b124 - block
    b616 - block
    b474 - block
    b71 - block
    b266 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b501 )
    ( on b522 b501 )
    ( on b747 b522 )
    ( on b415 b747 )
    ( on b253 b415 )
    ( on b102 b253 )
    ( on b767 b102 )
    ( on b327 b767 )
    ( on b381 b327 )
    ( on b907 b381 )
    ( on b935 b907 )
    ( on b95 b935 )
    ( on b289 b95 )
    ( on b746 b289 )
    ( on b777 b746 )
    ( on b111 b777 )
    ( on b681 b111 )
    ( on b644 b681 )
    ( on b962 b644 )
    ( on b225 b962 )
    ( on b691 b225 )
    ( on b59 b691 )
    ( on b33 b59 )
    ( on b282 b33 )
    ( on b799 b282 )
    ( on b161 b799 )
    ( on b508 b161 )
    ( on b293 b508 )
    ( on b586 b293 )
    ( on b412 b586 )
    ( on b402 b412 )
    ( on b150 b402 )
    ( on b373 b150 )
    ( on b797 b373 )
    ( on b124 b797 )
    ( on b616 b124 )
    ( on b474 b616 )
    ( on b71 b474 )
    ( on b266 b71 )
    ( clear b266 )
  )
  ( :goal
    ( and
      ( clear b501 )
    )
  )
)
