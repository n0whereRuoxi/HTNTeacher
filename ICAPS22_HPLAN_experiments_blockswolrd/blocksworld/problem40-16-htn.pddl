( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b404 - block
    b630 - block
    b204 - block
    b174 - block
    b550 - block
    b239 - block
    b129 - block
    b617 - block
    b401 - block
    b80 - block
    b409 - block
    b390 - block
    b508 - block
    b529 - block
    b447 - block
    b463 - block
    b126 - block
    b687 - block
    b437 - block
    b440 - block
    b901 - block
    b212 - block
    b567 - block
    b929 - block
    b698 - block
    b859 - block
    b818 - block
    b928 - block
    b34 - block
    b841 - block
    b755 - block
    b844 - block
    b270 - block
    b527 - block
    b797 - block
    b92 - block
    b443 - block
    b674 - block
    b189 - block
    b359 - block
    b371 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b630 b404 )
    ( on b204 b630 )
    ( on b174 b204 )
    ( on b550 b174 )
    ( on b239 b550 )
    ( on b129 b239 )
    ( on b617 b129 )
    ( on b401 b617 )
    ( on b80 b401 )
    ( on b409 b80 )
    ( on b390 b409 )
    ( on b508 b390 )
    ( on b529 b508 )
    ( on b447 b529 )
    ( on b463 b447 )
    ( on b126 b463 )
    ( on b687 b126 )
    ( on b437 b687 )
    ( on b440 b437 )
    ( on b901 b440 )
    ( on b212 b901 )
    ( on b567 b212 )
    ( on b929 b567 )
    ( on b698 b929 )
    ( on b859 b698 )
    ( on b818 b859 )
    ( on b928 b818 )
    ( on b34 b928 )
    ( on b841 b34 )
    ( on b755 b841 )
    ( on b844 b755 )
    ( on b270 b844 )
    ( on b527 b270 )
    ( on b797 b527 )
    ( on b92 b797 )
    ( on b443 b92 )
    ( on b674 b443 )
    ( on b189 b674 )
    ( on b359 b189 )
    ( on b371 b359 )
    ( clear b371 )
  )
  ( :tasks
    ( Make-40Pile b630 b204 b174 b550 b239 b129 b617 b401 b80 b409 b390 b508 b529 b447 b463 b126 b687 b437 b440 b901 b212 b567 b929 b698 b859 b818 b928 b34 b841 b755 b844 b270 b527 b797 b92 b443 b674 b189 b359 b371 )
  )
)
