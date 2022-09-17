( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b787 - block
    b862 - block
    b305 - block
    b414 - block
    b612 - block
    b981 - block
    b454 - block
    b200 - block
    b351 - block
    b973 - block
    b317 - block
    b29 - block
    b860 - block
    b463 - block
    b258 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b862 b787 )
    ( on b305 b862 )
    ( on b414 b305 )
    ( on b612 b414 )
    ( on b981 b612 )
    ( on b454 b981 )
    ( on b200 b454 )
    ( on b351 b200 )
    ( on b973 b351 )
    ( on b317 b973 )
    ( on b29 b317 )
    ( on b860 b29 )
    ( on b463 b860 )
    ( on b258 b463 )
    ( clear b258 )
  )
  ( :tasks
    ( Make-14Pile b862 b305 b414 b612 b981 b454 b200 b351 b973 b317 b29 b860 b463 b258 )
  )
)
