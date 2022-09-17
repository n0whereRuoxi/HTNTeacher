( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b820 - block
    b641 - block
    b340 - block
    b541 - block
    b880 - block
    b430 - block
    b429 - block
    b532 - block
    b331 - block
    b836 - block
    b387 - block
    b847 - block
    b214 - block
    b241 - block
    b913 - block
    b107 - block
    b407 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b641 b820 )
    ( on b340 b641 )
    ( on b541 b340 )
    ( on b880 b541 )
    ( on b430 b880 )
    ( on b429 b430 )
    ( on b532 b429 )
    ( on b331 b532 )
    ( on b836 b331 )
    ( on b387 b836 )
    ( on b847 b387 )
    ( on b214 b847 )
    ( on b241 b214 )
    ( on b913 b241 )
    ( on b107 b913 )
    ( on b407 b107 )
    ( clear b407 )
  )
  ( :tasks
    ( Make-16Pile b641 b340 b541 b880 b430 b429 b532 b331 b836 b387 b847 b214 b241 b913 b107 b407 )
  )
)
