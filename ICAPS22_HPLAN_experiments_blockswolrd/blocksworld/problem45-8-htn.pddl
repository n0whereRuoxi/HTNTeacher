( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b686 - block
    b366 - block
    b518 - block
    b974 - block
    b247 - block
    b860 - block
    b568 - block
    b231 - block
    b527 - block
    b82 - block
    b904 - block
    b534 - block
    b867 - block
    b956 - block
    b695 - block
    b177 - block
    b453 - block
    b609 - block
    b286 - block
    b430 - block
    b528 - block
    b121 - block
    b544 - block
    b396 - block
    b240 - block
    b717 - block
    b830 - block
    b992 - block
    b794 - block
    b983 - block
    b173 - block
    b840 - block
    b825 - block
    b556 - block
    b539 - block
    b107 - block
    b328 - block
    b525 - block
    b733 - block
    b626 - block
    b405 - block
    b304 - block
    b815 - block
    b2 - block
    b979 - block
    b145 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b686 )
    ( on b366 b686 )
    ( on b518 b366 )
    ( on b974 b518 )
    ( on b247 b974 )
    ( on b860 b247 )
    ( on b568 b860 )
    ( on b231 b568 )
    ( on b527 b231 )
    ( on b82 b527 )
    ( on b904 b82 )
    ( on b534 b904 )
    ( on b867 b534 )
    ( on b956 b867 )
    ( on b695 b956 )
    ( on b177 b695 )
    ( on b453 b177 )
    ( on b609 b453 )
    ( on b286 b609 )
    ( on b430 b286 )
    ( on b528 b430 )
    ( on b121 b528 )
    ( on b544 b121 )
    ( on b396 b544 )
    ( on b240 b396 )
    ( on b717 b240 )
    ( on b830 b717 )
    ( on b992 b830 )
    ( on b794 b992 )
    ( on b983 b794 )
    ( on b173 b983 )
    ( on b840 b173 )
    ( on b825 b840 )
    ( on b556 b825 )
    ( on b539 b556 )
    ( on b107 b539 )
    ( on b328 b107 )
    ( on b525 b328 )
    ( on b733 b525 )
    ( on b626 b733 )
    ( on b405 b626 )
    ( on b304 b405 )
    ( on b815 b304 )
    ( on b2 b815 )
    ( on b979 b2 )
    ( on b145 b979 )
    ( clear b145 )
  )
  ( :tasks
    ( Make-45Pile b366 b518 b974 b247 b860 b568 b231 b527 b82 b904 b534 b867 b956 b695 b177 b453 b609 b286 b430 b528 b121 b544 b396 b240 b717 b830 b992 b794 b983 b173 b840 b825 b556 b539 b107 b328 b525 b733 b626 b405 b304 b815 b2 b979 b145 )
  )
)
