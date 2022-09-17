( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b538 - block
    b891 - block
    b568 - block
    b274 - block
    b279 - block
    b885 - block
    b740 - block
    b6 - block
    b772 - block
    b497 - block
    b627 - block
    b341 - block
    b703 - block
    b318 - block
    b963 - block
    b984 - block
    b405 - block
    b214 - block
    b970 - block
    b513 - block
    b632 - block
    b105 - block
    b237 - block
    b53 - block
    b962 - block
    b191 - block
    b391 - block
    b609 - block
    b508 - block
    b140 - block
    b215 - block
    b231 - block
    b635 - block
    b345 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b891 b538 )
    ( on b568 b891 )
    ( on b274 b568 )
    ( on b279 b274 )
    ( on b885 b279 )
    ( on b740 b885 )
    ( on b6 b740 )
    ( on b772 b6 )
    ( on b497 b772 )
    ( on b627 b497 )
    ( on b341 b627 )
    ( on b703 b341 )
    ( on b318 b703 )
    ( on b963 b318 )
    ( on b984 b963 )
    ( on b405 b984 )
    ( on b214 b405 )
    ( on b970 b214 )
    ( on b513 b970 )
    ( on b632 b513 )
    ( on b105 b632 )
    ( on b237 b105 )
    ( on b53 b237 )
    ( on b962 b53 )
    ( on b191 b962 )
    ( on b391 b191 )
    ( on b609 b391 )
    ( on b508 b609 )
    ( on b140 b508 )
    ( on b215 b140 )
    ( on b231 b215 )
    ( on b635 b231 )
    ( on b345 b635 )
    ( clear b345 )
  )
  ( :tasks
    ( Make-33Pile b891 b568 b274 b279 b885 b740 b6 b772 b497 b627 b341 b703 b318 b963 b984 b405 b214 b970 b513 b632 b105 b237 b53 b962 b191 b391 b609 b508 b140 b215 b231 b635 b345 )
  )
)
