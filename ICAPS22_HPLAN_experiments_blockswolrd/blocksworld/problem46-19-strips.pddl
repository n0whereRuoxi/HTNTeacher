( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b82 - block
    b273 - block
    b270 - block
    b635 - block
    b540 - block
    b190 - block
    b840 - block
    b821 - block
    b739 - block
    b290 - block
    b415 - block
    b164 - block
    b267 - block
    b59 - block
    b646 - block
    b657 - block
    b893 - block
    b723 - block
    b115 - block
    b342 - block
    b980 - block
    b828 - block
    b719 - block
    b857 - block
    b12 - block
    b957 - block
    b504 - block
    b377 - block
    b246 - block
    b964 - block
    b119 - block
    b218 - block
    b846 - block
    b878 - block
    b188 - block
    b492 - block
    b848 - block
    b111 - block
    b86 - block
    b578 - block
    b662 - block
    b594 - block
    b730 - block
    b321 - block
    b955 - block
    b683 - block
    b139 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b82 )
    ( on b273 b82 )
    ( on b270 b273 )
    ( on b635 b270 )
    ( on b540 b635 )
    ( on b190 b540 )
    ( on b840 b190 )
    ( on b821 b840 )
    ( on b739 b821 )
    ( on b290 b739 )
    ( on b415 b290 )
    ( on b164 b415 )
    ( on b267 b164 )
    ( on b59 b267 )
    ( on b646 b59 )
    ( on b657 b646 )
    ( on b893 b657 )
    ( on b723 b893 )
    ( on b115 b723 )
    ( on b342 b115 )
    ( on b980 b342 )
    ( on b828 b980 )
    ( on b719 b828 )
    ( on b857 b719 )
    ( on b12 b857 )
    ( on b957 b12 )
    ( on b504 b957 )
    ( on b377 b504 )
    ( on b246 b377 )
    ( on b964 b246 )
    ( on b119 b964 )
    ( on b218 b119 )
    ( on b846 b218 )
    ( on b878 b846 )
    ( on b188 b878 )
    ( on b492 b188 )
    ( on b848 b492 )
    ( on b111 b848 )
    ( on b86 b111 )
    ( on b578 b86 )
    ( on b662 b578 )
    ( on b594 b662 )
    ( on b730 b594 )
    ( on b321 b730 )
    ( on b955 b321 )
    ( on b683 b955 )
    ( on b139 b683 )
    ( clear b139 )
  )
  ( :goal
    ( and
      ( clear b82 )
    )
  )
)
