( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b77 - block
    b316 - block
    b121 - block
    b445 - block
    b421 - block
    b376 - block
    b112 - block
    b326 - block
    b520 - block
    b627 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b77 )
    ( on b316 b77 )
    ( on b121 b316 )
    ( on b445 b121 )
    ( on b421 b445 )
    ( on b376 b421 )
    ( on b112 b376 )
    ( on b326 b112 )
    ( on b520 b326 )
    ( on b627 b520 )
    ( clear b627 )
  )
  ( :tasks
    ( Make-9Pile b316 b121 b445 b421 b376 b112 b326 b520 b627 )
  )
)
