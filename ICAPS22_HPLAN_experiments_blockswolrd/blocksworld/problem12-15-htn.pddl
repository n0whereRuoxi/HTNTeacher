( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b221 - block
    b399 - block
    b763 - block
    b733 - block
    b52 - block
    b916 - block
    b728 - block
    b171 - block
    b643 - block
    b775 - block
    b255 - block
    b230 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b399 b221 )
    ( on b763 b399 )
    ( on b733 b763 )
    ( on b52 b733 )
    ( on b916 b52 )
    ( on b728 b916 )
    ( on b171 b728 )
    ( on b643 b171 )
    ( on b775 b643 )
    ( on b255 b775 )
    ( on b230 b255 )
    ( on b444 b230 )
    ( clear b444 )
  )
  ( :tasks
    ( Make-12Pile b399 b763 b733 b52 b916 b728 b171 b643 b775 b255 b230 b444 )
  )
)
