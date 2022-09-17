( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b220 - block
    b772 - block
    b661 - block
    b918 - block
    b523 - block
    b196 - block
    b432 - block
    b634 - block
    b639 - block
    b805 - block
    b917 - block
    b471 - block
    b646 - block
    b11 - block
    b175 - block
    b620 - block
    b204 - block
    b382 - block
    b670 - block
    b914 - block
    b605 - block
    b217 - block
    b454 - block
    b898 - block
    b520 - block
    b984 - block
    b533 - block
    b469 - block
    b512 - block
    b742 - block
    b559 - block
    b225 - block
    b759 - block
    b452 - block
    b298 - block
    b370 - block
    b526 - block
    b117 - block
    b878 - block
    b476 - block
    b614 - block
    b408 - block
    b193 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b220 )
    ( on b772 b220 )
    ( on b661 b772 )
    ( on b918 b661 )
    ( on b523 b918 )
    ( on b196 b523 )
    ( on b432 b196 )
    ( on b634 b432 )
    ( on b639 b634 )
    ( on b805 b639 )
    ( on b917 b805 )
    ( on b471 b917 )
    ( on b646 b471 )
    ( on b11 b646 )
    ( on b175 b11 )
    ( on b620 b175 )
    ( on b204 b620 )
    ( on b382 b204 )
    ( on b670 b382 )
    ( on b914 b670 )
    ( on b605 b914 )
    ( on b217 b605 )
    ( on b454 b217 )
    ( on b898 b454 )
    ( on b520 b898 )
    ( on b984 b520 )
    ( on b533 b984 )
    ( on b469 b533 )
    ( on b512 b469 )
    ( on b742 b512 )
    ( on b559 b742 )
    ( on b225 b559 )
    ( on b759 b225 )
    ( on b452 b759 )
    ( on b298 b452 )
    ( on b370 b298 )
    ( on b526 b370 )
    ( on b117 b526 )
    ( on b878 b117 )
    ( on b476 b878 )
    ( on b614 b476 )
    ( on b408 b614 )
    ( on b193 b408 )
    ( clear b193 )
  )
  ( :goal
    ( and
      ( clear b220 )
    )
  )
)
