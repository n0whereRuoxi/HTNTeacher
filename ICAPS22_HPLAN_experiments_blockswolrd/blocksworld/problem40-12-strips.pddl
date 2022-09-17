( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b758 - block
    b801 - block
    b584 - block
    b843 - block
    b241 - block
    b108 - block
    b499 - block
    b464 - block
    b338 - block
    b431 - block
    b269 - block
    b149 - block
    b240 - block
    b979 - block
    b386 - block
    b96 - block
    b735 - block
    b428 - block
    b154 - block
    b346 - block
    b70 - block
    b993 - block
    b717 - block
    b202 - block
    b686 - block
    b597 - block
    b164 - block
    b415 - block
    b216 - block
    b165 - block
    b620 - block
    b258 - block
    b9 - block
    b582 - block
    b588 - block
    b608 - block
    b211 - block
    b930 - block
    b873 - block
    b920 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b758 b981 )
    ( on b801 b758 )
    ( on b584 b801 )
    ( on b843 b584 )
    ( on b241 b843 )
    ( on b108 b241 )
    ( on b499 b108 )
    ( on b464 b499 )
    ( on b338 b464 )
    ( on b431 b338 )
    ( on b269 b431 )
    ( on b149 b269 )
    ( on b240 b149 )
    ( on b979 b240 )
    ( on b386 b979 )
    ( on b96 b386 )
    ( on b735 b96 )
    ( on b428 b735 )
    ( on b154 b428 )
    ( on b346 b154 )
    ( on b70 b346 )
    ( on b993 b70 )
    ( on b717 b993 )
    ( on b202 b717 )
    ( on b686 b202 )
    ( on b597 b686 )
    ( on b164 b597 )
    ( on b415 b164 )
    ( on b216 b415 )
    ( on b165 b216 )
    ( on b620 b165 )
    ( on b258 b620 )
    ( on b9 b258 )
    ( on b582 b9 )
    ( on b588 b582 )
    ( on b608 b588 )
    ( on b211 b608 )
    ( on b930 b211 )
    ( on b873 b930 )
    ( on b920 b873 )
    ( clear b920 )
  )
  ( :goal
    ( and
      ( clear b981 )
    )
  )
)
