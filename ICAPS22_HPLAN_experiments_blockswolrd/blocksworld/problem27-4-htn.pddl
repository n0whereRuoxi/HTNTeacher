( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b553 - block
    b750 - block
    b220 - block
    b770 - block
    b163 - block
    b143 - block
    b400 - block
    b91 - block
    b845 - block
    b633 - block
    b464 - block
    b140 - block
    b261 - block
    b981 - block
    b763 - block
    b846 - block
    b701 - block
    b906 - block
    b550 - block
    b810 - block
    b928 - block
    b604 - block
    b656 - block
    b522 - block
    b25 - block
    b277 - block
    b888 - block
    b669 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b553 )
    ( on b750 b553 )
    ( on b220 b750 )
    ( on b770 b220 )
    ( on b163 b770 )
    ( on b143 b163 )
    ( on b400 b143 )
    ( on b91 b400 )
    ( on b845 b91 )
    ( on b633 b845 )
    ( on b464 b633 )
    ( on b140 b464 )
    ( on b261 b140 )
    ( on b981 b261 )
    ( on b763 b981 )
    ( on b846 b763 )
    ( on b701 b846 )
    ( on b906 b701 )
    ( on b550 b906 )
    ( on b810 b550 )
    ( on b928 b810 )
    ( on b604 b928 )
    ( on b656 b604 )
    ( on b522 b656 )
    ( on b25 b522 )
    ( on b277 b25 )
    ( on b888 b277 )
    ( on b669 b888 )
    ( clear b669 )
  )
  ( :tasks
    ( Make-27Pile b750 b220 b770 b163 b143 b400 b91 b845 b633 b464 b140 b261 b981 b763 b846 b701 b906 b550 b810 b928 b604 b656 b522 b25 b277 b888 b669 )
  )
)
