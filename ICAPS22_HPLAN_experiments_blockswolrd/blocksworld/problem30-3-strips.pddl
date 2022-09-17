( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b593 - block
    b702 - block
    b194 - block
    b456 - block
    b772 - block
    b186 - block
    b568 - block
    b868 - block
    b463 - block
    b104 - block
    b219 - block
    b417 - block
    b21 - block
    b7 - block
    b924 - block
    b598 - block
    b284 - block
    b451 - block
    b357 - block
    b361 - block
    b565 - block
    b108 - block
    b794 - block
    b952 - block
    b943 - block
    b839 - block
    b995 - block
    b321 - block
    b252 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b593 b64 )
    ( on b702 b593 )
    ( on b194 b702 )
    ( on b456 b194 )
    ( on b772 b456 )
    ( on b186 b772 )
    ( on b568 b186 )
    ( on b868 b568 )
    ( on b463 b868 )
    ( on b104 b463 )
    ( on b219 b104 )
    ( on b417 b219 )
    ( on b21 b417 )
    ( on b7 b21 )
    ( on b924 b7 )
    ( on b598 b924 )
    ( on b284 b598 )
    ( on b451 b284 )
    ( on b357 b451 )
    ( on b361 b357 )
    ( on b565 b361 )
    ( on b108 b565 )
    ( on b794 b108 )
    ( on b952 b794 )
    ( on b943 b952 )
    ( on b839 b943 )
    ( on b995 b839 )
    ( on b321 b995 )
    ( on b252 b321 )
    ( on b366 b252 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b64 )
    )
  )
)
