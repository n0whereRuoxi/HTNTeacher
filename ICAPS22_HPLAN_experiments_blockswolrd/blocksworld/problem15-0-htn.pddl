( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b342 - block
    b719 - block
    b674 - block
    b139 - block
    b18 - block
    b725 - block
    b419 - block
    b228 - block
    b514 - block
    b862 - block
    b744 - block
    b473 - block
    b644 - block
    b928 - block
    b467 - block
    b343 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b719 b342 )
    ( on b674 b719 )
    ( on b139 b674 )
    ( on b18 b139 )
    ( on b725 b18 )
    ( on b419 b725 )
    ( on b228 b419 )
    ( on b514 b228 )
    ( on b862 b514 )
    ( on b744 b862 )
    ( on b473 b744 )
    ( on b644 b473 )
    ( on b928 b644 )
    ( on b467 b928 )
    ( on b343 b467 )
    ( clear b343 )
  )
  ( :tasks
    ( Make-15Pile b719 b674 b139 b18 b725 b419 b228 b514 b862 b744 b473 b644 b928 b467 b343 )
  )
)
