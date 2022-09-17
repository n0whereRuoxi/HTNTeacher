( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b718 - block
    b532 - block
    b413 - block
    b538 - block
    b878 - block
    b262 - block
    b595 - block
    b740 - block
    b3 - block
    b299 - block
    b724 - block
    b528 - block
    b629 - block
    b708 - block
    b906 - block
    b203 - block
    b354 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b718 )
    ( on b532 b718 )
    ( on b413 b532 )
    ( on b538 b413 )
    ( on b878 b538 )
    ( on b262 b878 )
    ( on b595 b262 )
    ( on b740 b595 )
    ( on b3 b740 )
    ( on b299 b3 )
    ( on b724 b299 )
    ( on b528 b724 )
    ( on b629 b528 )
    ( on b708 b629 )
    ( on b906 b708 )
    ( on b203 b906 )
    ( on b354 b203 )
    ( on b698 b354 )
    ( clear b698 )
  )
  ( :tasks
    ( Make-17Pile b532 b413 b538 b878 b262 b595 b740 b3 b299 b724 b528 b629 b708 b906 b203 b354 b698 )
  )
)
