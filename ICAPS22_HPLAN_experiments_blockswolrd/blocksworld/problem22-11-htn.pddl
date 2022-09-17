( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b899 - block
    b309 - block
    b29 - block
    b553 - block
    b929 - block
    b781 - block
    b198 - block
    b844 - block
    b282 - block
    b882 - block
    b49 - block
    b938 - block
    b179 - block
    b211 - block
    b799 - block
    b344 - block
    b617 - block
    b374 - block
    b281 - block
    b242 - block
    b326 - block
    b328 - block
    b266 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b899 )
    ( on b309 b899 )
    ( on b29 b309 )
    ( on b553 b29 )
    ( on b929 b553 )
    ( on b781 b929 )
    ( on b198 b781 )
    ( on b844 b198 )
    ( on b282 b844 )
    ( on b882 b282 )
    ( on b49 b882 )
    ( on b938 b49 )
    ( on b179 b938 )
    ( on b211 b179 )
    ( on b799 b211 )
    ( on b344 b799 )
    ( on b617 b344 )
    ( on b374 b617 )
    ( on b281 b374 )
    ( on b242 b281 )
    ( on b326 b242 )
    ( on b328 b326 )
    ( on b266 b328 )
    ( clear b266 )
  )
  ( :tasks
    ( Make-22Pile b309 b29 b553 b929 b781 b198 b844 b282 b882 b49 b938 b179 b211 b799 b344 b617 b374 b281 b242 b326 b328 b266 )
  )
)
