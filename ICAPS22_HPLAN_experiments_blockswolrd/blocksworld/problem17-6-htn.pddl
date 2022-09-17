( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b986 - block
    b752 - block
    b470 - block
    b443 - block
    b730 - block
    b807 - block
    b666 - block
    b928 - block
    b113 - block
    b643 - block
    b842 - block
    b576 - block
    b953 - block
    b495 - block
    b188 - block
    b466 - block
    b103 - block
    b216 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b986 )
    ( on b752 b986 )
    ( on b470 b752 )
    ( on b443 b470 )
    ( on b730 b443 )
    ( on b807 b730 )
    ( on b666 b807 )
    ( on b928 b666 )
    ( on b113 b928 )
    ( on b643 b113 )
    ( on b842 b643 )
    ( on b576 b842 )
    ( on b953 b576 )
    ( on b495 b953 )
    ( on b188 b495 )
    ( on b466 b188 )
    ( on b103 b466 )
    ( on b216 b103 )
    ( clear b216 )
  )
  ( :tasks
    ( Make-17Pile b752 b470 b443 b730 b807 b666 b928 b113 b643 b842 b576 b953 b495 b188 b466 b103 b216 )
  )
)
