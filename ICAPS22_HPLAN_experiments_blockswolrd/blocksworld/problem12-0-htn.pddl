( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b405 - block
    b331 - block
    b568 - block
    b653 - block
    b929 - block
    b663 - block
    b431 - block
    b794 - block
    b248 - block
    b266 - block
    b948 - block
    b103 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b405 )
    ( on b331 b405 )
    ( on b568 b331 )
    ( on b653 b568 )
    ( on b929 b653 )
    ( on b663 b929 )
    ( on b431 b663 )
    ( on b794 b431 )
    ( on b248 b794 )
    ( on b266 b248 )
    ( on b948 b266 )
    ( on b103 b948 )
    ( on b587 b103 )
    ( clear b587 )
  )
  ( :tasks
    ( Make-12Pile b331 b568 b653 b929 b663 b431 b794 b248 b266 b948 b103 b587 )
  )
)
