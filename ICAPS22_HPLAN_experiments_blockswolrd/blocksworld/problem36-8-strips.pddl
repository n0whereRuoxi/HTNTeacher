( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b716 - block
    b359 - block
    b198 - block
    b24 - block
    b762 - block
    b219 - block
    b852 - block
    b537 - block
    b545 - block
    b129 - block
    b630 - block
    b276 - block
    b49 - block
    b470 - block
    b918 - block
    b120 - block
    b888 - block
    b754 - block
    b885 - block
    b872 - block
    b55 - block
    b861 - block
    b567 - block
    b388 - block
    b141 - block
    b412 - block
    b699 - block
    b900 - block
    b249 - block
    b57 - block
    b327 - block
    b429 - block
    b37 - block
    b763 - block
    b573 - block
    b102 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b716 b91 )
    ( on b359 b716 )
    ( on b198 b359 )
    ( on b24 b198 )
    ( on b762 b24 )
    ( on b219 b762 )
    ( on b852 b219 )
    ( on b537 b852 )
    ( on b545 b537 )
    ( on b129 b545 )
    ( on b630 b129 )
    ( on b276 b630 )
    ( on b49 b276 )
    ( on b470 b49 )
    ( on b918 b470 )
    ( on b120 b918 )
    ( on b888 b120 )
    ( on b754 b888 )
    ( on b885 b754 )
    ( on b872 b885 )
    ( on b55 b872 )
    ( on b861 b55 )
    ( on b567 b861 )
    ( on b388 b567 )
    ( on b141 b388 )
    ( on b412 b141 )
    ( on b699 b412 )
    ( on b900 b699 )
    ( on b249 b900 )
    ( on b57 b249 )
    ( on b327 b57 )
    ( on b429 b327 )
    ( on b37 b429 )
    ( on b763 b37 )
    ( on b573 b763 )
    ( on b102 b573 )
    ( clear b102 )
  )
  ( :goal
    ( and
      ( clear b91 )
    )
  )
)
