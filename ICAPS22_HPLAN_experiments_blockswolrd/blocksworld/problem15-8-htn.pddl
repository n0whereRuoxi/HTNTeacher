( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b803 - block
    b383 - block
    b809 - block
    b467 - block
    b322 - block
    b139 - block
    b427 - block
    b646 - block
    b1 - block
    b850 - block
    b939 - block
    b351 - block
    b169 - block
    b417 - block
    b574 - block
    b539 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b803 )
    ( on b383 b803 )
    ( on b809 b383 )
    ( on b467 b809 )
    ( on b322 b467 )
    ( on b139 b322 )
    ( on b427 b139 )
    ( on b646 b427 )
    ( on b1 b646 )
    ( on b850 b1 )
    ( on b939 b850 )
    ( on b351 b939 )
    ( on b169 b351 )
    ( on b417 b169 )
    ( on b574 b417 )
    ( on b539 b574 )
    ( clear b539 )
  )
  ( :tasks
    ( Make-15Pile b383 b809 b467 b322 b139 b427 b646 b1 b850 b939 b351 b169 b417 b574 b539 )
  )
)
