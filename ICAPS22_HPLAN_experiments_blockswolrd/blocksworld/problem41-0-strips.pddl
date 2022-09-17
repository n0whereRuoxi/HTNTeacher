( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b937 - block
    b227 - block
    b135 - block
    b268 - block
    b107 - block
    b350 - block
    b584 - block
    b421 - block
    b264 - block
    b241 - block
    b554 - block
    b217 - block
    b206 - block
    b353 - block
    b478 - block
    b530 - block
    b175 - block
    b165 - block
    b269 - block
    b735 - block
    b485 - block
    b946 - block
    b813 - block
    b288 - block
    b760 - block
    b414 - block
    b552 - block
    b611 - block
    b367 - block
    b77 - block
    b797 - block
    b551 - block
    b366 - block
    b799 - block
    b640 - block
    b951 - block
    b191 - block
    b529 - block
    b262 - block
    b439 - block
    b717 - block
    b649 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b937 )
    ( on b227 b937 )
    ( on b135 b227 )
    ( on b268 b135 )
    ( on b107 b268 )
    ( on b350 b107 )
    ( on b584 b350 )
    ( on b421 b584 )
    ( on b264 b421 )
    ( on b241 b264 )
    ( on b554 b241 )
    ( on b217 b554 )
    ( on b206 b217 )
    ( on b353 b206 )
    ( on b478 b353 )
    ( on b530 b478 )
    ( on b175 b530 )
    ( on b165 b175 )
    ( on b269 b165 )
    ( on b735 b269 )
    ( on b485 b735 )
    ( on b946 b485 )
    ( on b813 b946 )
    ( on b288 b813 )
    ( on b760 b288 )
    ( on b414 b760 )
    ( on b552 b414 )
    ( on b611 b552 )
    ( on b367 b611 )
    ( on b77 b367 )
    ( on b797 b77 )
    ( on b551 b797 )
    ( on b366 b551 )
    ( on b799 b366 )
    ( on b640 b799 )
    ( on b951 b640 )
    ( on b191 b951 )
    ( on b529 b191 )
    ( on b262 b529 )
    ( on b439 b262 )
    ( on b717 b439 )
    ( on b649 b717 )
    ( clear b649 )
  )
  ( :goal
    ( and
      ( clear b937 )
    )
  )
)
