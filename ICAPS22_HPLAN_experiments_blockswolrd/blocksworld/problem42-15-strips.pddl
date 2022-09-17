( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b606 - block
    b361 - block
    b506 - block
    b280 - block
    b855 - block
    b562 - block
    b827 - block
    b664 - block
    b211 - block
    b88 - block
    b549 - block
    b475 - block
    b529 - block
    b292 - block
    b924 - block
    b262 - block
    b988 - block
    b880 - block
    b170 - block
    b261 - block
    b61 - block
    b430 - block
    b690 - block
    b657 - block
    b867 - block
    b739 - block
    b923 - block
    b914 - block
    b572 - block
    b938 - block
    b329 - block
    b687 - block
    b305 - block
    b892 - block
    b580 - block
    b349 - block
    b662 - block
    b493 - block
    b422 - block
    b730 - block
    b744 - block
    b141 - block
    b717 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b606 )
    ( on b361 b606 )
    ( on b506 b361 )
    ( on b280 b506 )
    ( on b855 b280 )
    ( on b562 b855 )
    ( on b827 b562 )
    ( on b664 b827 )
    ( on b211 b664 )
    ( on b88 b211 )
    ( on b549 b88 )
    ( on b475 b549 )
    ( on b529 b475 )
    ( on b292 b529 )
    ( on b924 b292 )
    ( on b262 b924 )
    ( on b988 b262 )
    ( on b880 b988 )
    ( on b170 b880 )
    ( on b261 b170 )
    ( on b61 b261 )
    ( on b430 b61 )
    ( on b690 b430 )
    ( on b657 b690 )
    ( on b867 b657 )
    ( on b739 b867 )
    ( on b923 b739 )
    ( on b914 b923 )
    ( on b572 b914 )
    ( on b938 b572 )
    ( on b329 b938 )
    ( on b687 b329 )
    ( on b305 b687 )
    ( on b892 b305 )
    ( on b580 b892 )
    ( on b349 b580 )
    ( on b662 b349 )
    ( on b493 b662 )
    ( on b422 b493 )
    ( on b730 b422 )
    ( on b744 b730 )
    ( on b141 b744 )
    ( on b717 b141 )
    ( clear b717 )
  )
  ( :goal
    ( and
      ( clear b606 )
    )
  )
)
