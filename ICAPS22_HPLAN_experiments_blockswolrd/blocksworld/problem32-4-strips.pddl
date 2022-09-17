( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b631 - block
    b774 - block
    b262 - block
    b338 - block
    b26 - block
    b409 - block
    b518 - block
    b54 - block
    b857 - block
    b444 - block
    b733 - block
    b687 - block
    b584 - block
    b457 - block
    b183 - block
    b712 - block
    b987 - block
    b341 - block
    b904 - block
    b111 - block
    b690 - block
    b923 - block
    b594 - block
    b985 - block
    b752 - block
    b19 - block
    b295 - block
    b852 - block
    b955 - block
    b704 - block
    b418 - block
    b683 - block
    b359 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b631 )
    ( on b774 b631 )
    ( on b262 b774 )
    ( on b338 b262 )
    ( on b26 b338 )
    ( on b409 b26 )
    ( on b518 b409 )
    ( on b54 b518 )
    ( on b857 b54 )
    ( on b444 b857 )
    ( on b733 b444 )
    ( on b687 b733 )
    ( on b584 b687 )
    ( on b457 b584 )
    ( on b183 b457 )
    ( on b712 b183 )
    ( on b987 b712 )
    ( on b341 b987 )
    ( on b904 b341 )
    ( on b111 b904 )
    ( on b690 b111 )
    ( on b923 b690 )
    ( on b594 b923 )
    ( on b985 b594 )
    ( on b752 b985 )
    ( on b19 b752 )
    ( on b295 b19 )
    ( on b852 b295 )
    ( on b955 b852 )
    ( on b704 b955 )
    ( on b418 b704 )
    ( on b683 b418 )
    ( on b359 b683 )
    ( clear b359 )
  )
  ( :goal
    ( and
      ( clear b631 )
    )
  )
)
