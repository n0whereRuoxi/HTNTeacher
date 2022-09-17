( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b114 - block
    b541 - block
    b100 - block
    b26 - block
    b755 - block
    b992 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b114 )
    ( on b541 b114 )
    ( on b100 b541 )
    ( on b26 b100 )
    ( on b755 b26 )
    ( on b992 b755 )
    ( clear b992 )
  )
  ( :tasks
    ( Make-5Pile b541 b100 b26 b755 b992 )
  )
)
