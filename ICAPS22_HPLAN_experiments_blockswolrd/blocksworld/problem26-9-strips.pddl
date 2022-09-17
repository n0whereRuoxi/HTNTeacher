( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b620 - block
    b479 - block
    b998 - block
    b200 - block
    b848 - block
    b748 - block
    b241 - block
    b709 - block
    b741 - block
    b485 - block
    b776 - block
    b276 - block
    b49 - block
    b223 - block
    b764 - block
    b742 - block
    b692 - block
    b374 - block
    b951 - block
    b8 - block
    b69 - block
    b460 - block
    b21 - block
    b14 - block
    b122 - block
    b746 - block
    b947 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b620 )
    ( on b479 b620 )
    ( on b998 b479 )
    ( on b200 b998 )
    ( on b848 b200 )
    ( on b748 b848 )
    ( on b241 b748 )
    ( on b709 b241 )
    ( on b741 b709 )
    ( on b485 b741 )
    ( on b776 b485 )
    ( on b276 b776 )
    ( on b49 b276 )
    ( on b223 b49 )
    ( on b764 b223 )
    ( on b742 b764 )
    ( on b692 b742 )
    ( on b374 b692 )
    ( on b951 b374 )
    ( on b8 b951 )
    ( on b69 b8 )
    ( on b460 b69 )
    ( on b21 b460 )
    ( on b14 b21 )
    ( on b122 b14 )
    ( on b746 b122 )
    ( on b947 b746 )
    ( clear b947 )
  )
  ( :goal
    ( and
      ( clear b620 )
    )
  )
)
