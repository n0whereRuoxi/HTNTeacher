( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b949 - block
    b963 - block
    b842 - block
    b882 - block
    b269 - block
    b780 - block
    b373 - block
    b48 - block
    b173 - block
    b138 - block
    b618 - block
    b218 - block
    b237 - block
    b943 - block
    b390 - block
    b25 - block
    b753 - block
    b443 - block
    b870 - block
    b368 - block
    b560 - block
    b681 - block
    b159 - block
    b503 - block
    b244 - block
    b744 - block
    b995 - block
    b696 - block
    b774 - block
    b212 - block
    b431 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b949 )
    ( on b963 b949 )
    ( on b842 b963 )
    ( on b882 b842 )
    ( on b269 b882 )
    ( on b780 b269 )
    ( on b373 b780 )
    ( on b48 b373 )
    ( on b173 b48 )
    ( on b138 b173 )
    ( on b618 b138 )
    ( on b218 b618 )
    ( on b237 b218 )
    ( on b943 b237 )
    ( on b390 b943 )
    ( on b25 b390 )
    ( on b753 b25 )
    ( on b443 b753 )
    ( on b870 b443 )
    ( on b368 b870 )
    ( on b560 b368 )
    ( on b681 b560 )
    ( on b159 b681 )
    ( on b503 b159 )
    ( on b244 b503 )
    ( on b744 b244 )
    ( on b995 b744 )
    ( on b696 b995 )
    ( on b774 b696 )
    ( on b212 b774 )
    ( on b431 b212 )
    ( clear b431 )
  )
  ( :tasks
    ( Make-30Pile b963 b842 b882 b269 b780 b373 b48 b173 b138 b618 b218 b237 b943 b390 b25 b753 b443 b870 b368 b560 b681 b159 b503 b244 b744 b995 b696 b774 b212 b431 )
  )
)
