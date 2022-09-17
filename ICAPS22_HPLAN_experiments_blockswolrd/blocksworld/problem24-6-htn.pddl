( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b901 - block
    b571 - block
    b211 - block
    b844 - block
    b189 - block
    b650 - block
    b322 - block
    b999 - block
    b310 - block
    b461 - block
    b587 - block
    b365 - block
    b268 - block
    b339 - block
    b391 - block
    b214 - block
    b476 - block
    b481 - block
    b107 - block
    b156 - block
    b454 - block
    b213 - block
    b815 - block
    b614 - block
    b216 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b571 b901 )
    ( on b211 b571 )
    ( on b844 b211 )
    ( on b189 b844 )
    ( on b650 b189 )
    ( on b322 b650 )
    ( on b999 b322 )
    ( on b310 b999 )
    ( on b461 b310 )
    ( on b587 b461 )
    ( on b365 b587 )
    ( on b268 b365 )
    ( on b339 b268 )
    ( on b391 b339 )
    ( on b214 b391 )
    ( on b476 b214 )
    ( on b481 b476 )
    ( on b107 b481 )
    ( on b156 b107 )
    ( on b454 b156 )
    ( on b213 b454 )
    ( on b815 b213 )
    ( on b614 b815 )
    ( on b216 b614 )
    ( clear b216 )
  )
  ( :tasks
    ( Make-24Pile b571 b211 b844 b189 b650 b322 b999 b310 b461 b587 b365 b268 b339 b391 b214 b476 b481 b107 b156 b454 b213 b815 b614 b216 )
  )
)
