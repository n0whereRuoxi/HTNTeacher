( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b326 - block
    b665 - block
    b760 - block
    b104 - block
    b774 - block
    b497 - block
    b757 - block
    b479 - block
    b426 - block
    b527 - block
    b982 - block
    b480 - block
    b16 - block
    b430 - block
    b694 - block
    b346 - block
    b323 - block
    b950 - block
    b101 - block
    b407 - block
    b248 - block
    b507 - block
    b262 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b326 )
    ( on b665 b326 )
    ( on b760 b665 )
    ( on b104 b760 )
    ( on b774 b104 )
    ( on b497 b774 )
    ( on b757 b497 )
    ( on b479 b757 )
    ( on b426 b479 )
    ( on b527 b426 )
    ( on b982 b527 )
    ( on b480 b982 )
    ( on b16 b480 )
    ( on b430 b16 )
    ( on b694 b430 )
    ( on b346 b694 )
    ( on b323 b346 )
    ( on b950 b323 )
    ( on b101 b950 )
    ( on b407 b101 )
    ( on b248 b407 )
    ( on b507 b248 )
    ( on b262 b507 )
    ( clear b262 )
  )
  ( :goal
    ( and
      ( clear b326 )
    )
  )
)
