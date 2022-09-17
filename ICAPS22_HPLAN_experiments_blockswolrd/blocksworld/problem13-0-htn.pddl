( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b294 - block
    b96 - block
    b263 - block
    b37 - block
    b865 - block
    b706 - block
    b393 - block
    b830 - block
    b761 - block
    b249 - block
    b714 - block
    b70 - block
    b884 - block
    b627 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b294 )
    ( on b96 b294 )
    ( on b263 b96 )
    ( on b37 b263 )
    ( on b865 b37 )
    ( on b706 b865 )
    ( on b393 b706 )
    ( on b830 b393 )
    ( on b761 b830 )
    ( on b249 b761 )
    ( on b714 b249 )
    ( on b70 b714 )
    ( on b884 b70 )
    ( on b627 b884 )
    ( clear b627 )
  )
  ( :tasks
    ( Make-13Pile b96 b263 b37 b865 b706 b393 b830 b761 b249 b714 b70 b884 b627 )
  )
)
