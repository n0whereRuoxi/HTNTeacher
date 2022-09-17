( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b248 - block
    b310 - block
    b589 - block
    b549 - block
    b444 - block
    b334 - block
    b400 - block
    b814 - block
    b166 - block
    b970 - block
    b423 - block
    b440 - block
    b462 - block
    b765 - block
    b351 - block
    b925 - block
    b461 - block
    b919 - block
    b722 - block
    b198 - block
    b82 - block
    b183 - block
    b613 - block
    b592 - block
    b11 - block
    b391 - block
    b255 - block
    b73 - block
    b656 - block
    b395 - block
    b748 - block
    b531 - block
    b553 - block
    b701 - block
    b880 - block
    b37 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b248 )
    ( on b310 b248 )
    ( on b589 b310 )
    ( on b549 b589 )
    ( on b444 b549 )
    ( on b334 b444 )
    ( on b400 b334 )
    ( on b814 b400 )
    ( on b166 b814 )
    ( on b970 b166 )
    ( on b423 b970 )
    ( on b440 b423 )
    ( on b462 b440 )
    ( on b765 b462 )
    ( on b351 b765 )
    ( on b925 b351 )
    ( on b461 b925 )
    ( on b919 b461 )
    ( on b722 b919 )
    ( on b198 b722 )
    ( on b82 b198 )
    ( on b183 b82 )
    ( on b613 b183 )
    ( on b592 b613 )
    ( on b11 b592 )
    ( on b391 b11 )
    ( on b255 b391 )
    ( on b73 b255 )
    ( on b656 b73 )
    ( on b395 b656 )
    ( on b748 b395 )
    ( on b531 b748 )
    ( on b553 b531 )
    ( on b701 b553 )
    ( on b880 b701 )
    ( on b37 b880 )
    ( clear b37 )
  )
  ( :goal
    ( and
      ( clear b248 )
    )
  )
)
