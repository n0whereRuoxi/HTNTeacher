( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b103 - block
    b221 - block
    b512 - block
    b802 - block
    b575 - block
    b955 - block
    b666 - block
    b692 - block
    b681 - block
    b14 - block
    b190 - block
    b724 - block
    b50 - block
    b698 - block
    b459 - block
    b87 - block
    b968 - block
    b831 - block
    b456 - block
    b688 - block
    b451 - block
    b281 - block
    b664 - block
    b503 - block
    b317 - block
    b257 - block
    b558 - block
    b376 - block
    b462 - block
    b72 - block
    b501 - block
    b39 - block
    b399 - block
    b264 - block
    b678 - block
    b428 - block
    b569 - block
    b438 - block
    b560 - block
    b957 - block
    b444 - block
    b879 - block
    b902 - block
    b485 - block
    b324 - block
    b426 - block
    b981 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b103 )
    ( on b221 b103 )
    ( on b512 b221 )
    ( on b802 b512 )
    ( on b575 b802 )
    ( on b955 b575 )
    ( on b666 b955 )
    ( on b692 b666 )
    ( on b681 b692 )
    ( on b14 b681 )
    ( on b190 b14 )
    ( on b724 b190 )
    ( on b50 b724 )
    ( on b698 b50 )
    ( on b459 b698 )
    ( on b87 b459 )
    ( on b968 b87 )
    ( on b831 b968 )
    ( on b456 b831 )
    ( on b688 b456 )
    ( on b451 b688 )
    ( on b281 b451 )
    ( on b664 b281 )
    ( on b503 b664 )
    ( on b317 b503 )
    ( on b257 b317 )
    ( on b558 b257 )
    ( on b376 b558 )
    ( on b462 b376 )
    ( on b72 b462 )
    ( on b501 b72 )
    ( on b39 b501 )
    ( on b399 b39 )
    ( on b264 b399 )
    ( on b678 b264 )
    ( on b428 b678 )
    ( on b569 b428 )
    ( on b438 b569 )
    ( on b560 b438 )
    ( on b957 b560 )
    ( on b444 b957 )
    ( on b879 b444 )
    ( on b902 b879 )
    ( on b485 b902 )
    ( on b324 b485 )
    ( on b426 b324 )
    ( on b981 b426 )
    ( clear b981 )
  )
  ( :goal
    ( and
      ( clear b103 )
    )
  )
)
