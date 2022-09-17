( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b147 - block
    b869 - block
    b55 - block
    b132 - block
    b380 - block
    b263 - block
    b366 - block
    b465 - block
    b909 - block
    b690 - block
    b443 - block
    b820 - block
    b164 - block
    b976 - block
    b531 - block
    b212 - block
    b681 - block
    b482 - block
    b169 - block
    b290 - block
    b214 - block
    b439 - block
    b855 - block
    b845 - block
    b313 - block
    b111 - block
    b329 - block
    b841 - block
    b200 - block
    b526 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b147 )
    ( on b869 b147 )
    ( on b55 b869 )
    ( on b132 b55 )
    ( on b380 b132 )
    ( on b263 b380 )
    ( on b366 b263 )
    ( on b465 b366 )
    ( on b909 b465 )
    ( on b690 b909 )
    ( on b443 b690 )
    ( on b820 b443 )
    ( on b164 b820 )
    ( on b976 b164 )
    ( on b531 b976 )
    ( on b212 b531 )
    ( on b681 b212 )
    ( on b482 b681 )
    ( on b169 b482 )
    ( on b290 b169 )
    ( on b214 b290 )
    ( on b439 b214 )
    ( on b855 b439 )
    ( on b845 b855 )
    ( on b313 b845 )
    ( on b111 b313 )
    ( on b329 b111 )
    ( on b841 b329 )
    ( on b200 b841 )
    ( on b526 b200 )
    ( clear b526 )
  )
  ( :tasks
    ( Make-29Pile b869 b55 b132 b380 b263 b366 b465 b909 b690 b443 b820 b164 b976 b531 b212 b681 b482 b169 b290 b214 b439 b855 b845 b313 b111 b329 b841 b200 b526 )
  )
)
