( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b95 - block
    b780 - block
    b569 - block
    b832 - block
    b951 - block
    b402 - block
    b177 - block
    b45 - block
    b113 - block
    b86 - block
    b37 - block
    b792 - block
    b421 - block
    b319 - block
    b270 - block
    b639 - block
    b204 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b95 )
    ( on b780 b95 )
    ( on b569 b780 )
    ( on b832 b569 )
    ( on b951 b832 )
    ( on b402 b951 )
    ( on b177 b402 )
    ( on b45 b177 )
    ( on b113 b45 )
    ( on b86 b113 )
    ( on b37 b86 )
    ( on b792 b37 )
    ( on b421 b792 )
    ( on b319 b421 )
    ( on b270 b319 )
    ( on b639 b270 )
    ( on b204 b639 )
    ( clear b204 )
  )
  ( :tasks
    ( Make-16Pile b780 b569 b832 b951 b402 b177 b45 b113 b86 b37 b792 b421 b319 b270 b639 b204 )
  )
)
