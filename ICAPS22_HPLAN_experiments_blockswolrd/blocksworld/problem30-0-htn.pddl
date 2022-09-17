( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b725 - block
    b397 - block
    b632 - block
    b913 - block
    b365 - block
    b20 - block
    b504 - block
    b951 - block
    b866 - block
    b921 - block
    b961 - block
    b895 - block
    b583 - block
    b178 - block
    b56 - block
    b331 - block
    b375 - block
    b412 - block
    b986 - block
    b295 - block
    b691 - block
    b835 - block
    b203 - block
    b123 - block
    b170 - block
    b502 - block
    b525 - block
    b447 - block
    b508 - block
    b805 - block
    b514 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b397 b725 )
    ( on b632 b397 )
    ( on b913 b632 )
    ( on b365 b913 )
    ( on b20 b365 )
    ( on b504 b20 )
    ( on b951 b504 )
    ( on b866 b951 )
    ( on b921 b866 )
    ( on b961 b921 )
    ( on b895 b961 )
    ( on b583 b895 )
    ( on b178 b583 )
    ( on b56 b178 )
    ( on b331 b56 )
    ( on b375 b331 )
    ( on b412 b375 )
    ( on b986 b412 )
    ( on b295 b986 )
    ( on b691 b295 )
    ( on b835 b691 )
    ( on b203 b835 )
    ( on b123 b203 )
    ( on b170 b123 )
    ( on b502 b170 )
    ( on b525 b502 )
    ( on b447 b525 )
    ( on b508 b447 )
    ( on b805 b508 )
    ( on b514 b805 )
    ( clear b514 )
  )
  ( :tasks
    ( Make-30Pile b397 b632 b913 b365 b20 b504 b951 b866 b921 b961 b895 b583 b178 b56 b331 b375 b412 b986 b295 b691 b835 b203 b123 b170 b502 b525 b447 b508 b805 b514 )
  )
)
