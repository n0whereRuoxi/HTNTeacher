( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b821 - block
    b91 - block
    b894 - block
    b455 - block
    b358 - block
    b942 - block
    b121 - block
    b83 - block
    b495 - block
    b649 - block
    b314 - block
    b205 - block
    b761 - block
    b218 - block
    b951 - block
    b700 - block
    b254 - block
    b546 - block
    b250 - block
    b963 - block
    b124 - block
    b556 - block
    b405 - block
    b959 - block
    b623 - block
    b100 - block
    b30 - block
    b377 - block
    b522 - block
    b660 - block
    b747 - block
    b317 - block
    b690 - block
    b787 - block
    b910 - block
    b652 - block
    b801 - block
    b304 - block
    b684 - block
    b969 - block
    b439 - block
    b499 - block
    b363 - block
    b239 - block
    b824 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b821 b981 )
    ( on b91 b821 )
    ( on b894 b91 )
    ( on b455 b894 )
    ( on b358 b455 )
    ( on b942 b358 )
    ( on b121 b942 )
    ( on b83 b121 )
    ( on b495 b83 )
    ( on b649 b495 )
    ( on b314 b649 )
    ( on b205 b314 )
    ( on b761 b205 )
    ( on b218 b761 )
    ( on b951 b218 )
    ( on b700 b951 )
    ( on b254 b700 )
    ( on b546 b254 )
    ( on b250 b546 )
    ( on b963 b250 )
    ( on b124 b963 )
    ( on b556 b124 )
    ( on b405 b556 )
    ( on b959 b405 )
    ( on b623 b959 )
    ( on b100 b623 )
    ( on b30 b100 )
    ( on b377 b30 )
    ( on b522 b377 )
    ( on b660 b522 )
    ( on b747 b660 )
    ( on b317 b747 )
    ( on b690 b317 )
    ( on b787 b690 )
    ( on b910 b787 )
    ( on b652 b910 )
    ( on b801 b652 )
    ( on b304 b801 )
    ( on b684 b304 )
    ( on b969 b684 )
    ( on b439 b969 )
    ( on b499 b439 )
    ( on b363 b499 )
    ( on b239 b363 )
    ( on b824 b239 )
    ( clear b824 )
  )
  ( :goal
    ( and
      ( clear b981 )
    )
  )
)
