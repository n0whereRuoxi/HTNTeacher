( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b869 - block
    b865 - block
    b10 - block
    b620 - block
    b766 - block
    b845 - block
    b177 - block
    b888 - block
    b477 - block
    b572 - block
    b452 - block
    b497 - block
    b279 - block
    b668 - block
    b525 - block
    b125 - block
    b758 - block
    b76 - block
    b743 - block
    b184 - block
    b493 - block
    b416 - block
    b47 - block
    b218 - block
    b148 - block
    b991 - block
    b241 - block
    b553 - block
    b361 - block
    b310 - block
    b796 - block
    b304 - block
    b472 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b869 )
    ( on b865 b869 )
    ( on b10 b865 )
    ( on b620 b10 )
    ( on b766 b620 )
    ( on b845 b766 )
    ( on b177 b845 )
    ( on b888 b177 )
    ( on b477 b888 )
    ( on b572 b477 )
    ( on b452 b572 )
    ( on b497 b452 )
    ( on b279 b497 )
    ( on b668 b279 )
    ( on b525 b668 )
    ( on b125 b525 )
    ( on b758 b125 )
    ( on b76 b758 )
    ( on b743 b76 )
    ( on b184 b743 )
    ( on b493 b184 )
    ( on b416 b493 )
    ( on b47 b416 )
    ( on b218 b47 )
    ( on b148 b218 )
    ( on b991 b148 )
    ( on b241 b991 )
    ( on b553 b241 )
    ( on b361 b553 )
    ( on b310 b361 )
    ( on b796 b310 )
    ( on b304 b796 )
    ( on b472 b304 )
    ( clear b472 )
  )
  ( :tasks
    ( Make-32Pile b865 b10 b620 b766 b845 b177 b888 b477 b572 b452 b497 b279 b668 b525 b125 b758 b76 b743 b184 b493 b416 b47 b218 b148 b991 b241 b553 b361 b310 b796 b304 b472 )
  )
)
