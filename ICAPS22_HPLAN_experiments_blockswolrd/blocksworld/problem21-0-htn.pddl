( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b386 - block
    b351 - block
    b191 - block
    b617 - block
    b722 - block
    b336 - block
    b254 - block
    b904 - block
    b805 - block
    b652 - block
    b612 - block
    b282 - block
    b139 - block
    b618 - block
    b701 - block
    b349 - block
    b114 - block
    b350 - block
    b551 - block
    b761 - block
    b79 - block
    b384 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b386 )
    ( on b351 b386 )
    ( on b191 b351 )
    ( on b617 b191 )
    ( on b722 b617 )
    ( on b336 b722 )
    ( on b254 b336 )
    ( on b904 b254 )
    ( on b805 b904 )
    ( on b652 b805 )
    ( on b612 b652 )
    ( on b282 b612 )
    ( on b139 b282 )
    ( on b618 b139 )
    ( on b701 b618 )
    ( on b349 b701 )
    ( on b114 b349 )
    ( on b350 b114 )
    ( on b551 b350 )
    ( on b761 b551 )
    ( on b79 b761 )
    ( on b384 b79 )
    ( clear b384 )
  )
  ( :tasks
    ( Make-21Pile b351 b191 b617 b722 b336 b254 b904 b805 b652 b612 b282 b139 b618 b701 b349 b114 b350 b551 b761 b79 b384 )
  )
)
