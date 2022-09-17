( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b617 - block
    b486 - block
    b707 - block
    b591 - block
    b235 - block
    b783 - block
    b415 - block
    b746 - block
    b765 - block
    b153 - block
    b565 - block
    b238 - block
    b193 - block
    b410 - block
    b610 - block
    b971 - block
    b540 - block
    b749 - block
    b352 - block
    b168 - block
    b166 - block
    b86 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b617 )
    ( on b486 b617 )
    ( on b707 b486 )
    ( on b591 b707 )
    ( on b235 b591 )
    ( on b783 b235 )
    ( on b415 b783 )
    ( on b746 b415 )
    ( on b765 b746 )
    ( on b153 b765 )
    ( on b565 b153 )
    ( on b238 b565 )
    ( on b193 b238 )
    ( on b410 b193 )
    ( on b610 b410 )
    ( on b971 b610 )
    ( on b540 b971 )
    ( on b749 b540 )
    ( on b352 b749 )
    ( on b168 b352 )
    ( on b166 b168 )
    ( on b86 b166 )
    ( clear b86 )
  )
  ( :tasks
    ( Make-21Pile b486 b707 b591 b235 b783 b415 b746 b765 b153 b565 b238 b193 b410 b610 b971 b540 b749 b352 b168 b166 b86 )
  )
)
