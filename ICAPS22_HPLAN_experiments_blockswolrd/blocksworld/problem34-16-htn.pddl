( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b507 - block
    b968 - block
    b523 - block
    b516 - block
    b904 - block
    b719 - block
    b304 - block
    b394 - block
    b427 - block
    b651 - block
    b734 - block
    b208 - block
    b457 - block
    b701 - block
    b707 - block
    b668 - block
    b850 - block
    b694 - block
    b429 - block
    b559 - block
    b16 - block
    b766 - block
    b286 - block
    b852 - block
    b612 - block
    b940 - block
    b414 - block
    b73 - block
    b922 - block
    b60 - block
    b249 - block
    b405 - block
    b914 - block
    b372 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b507 )
    ( on b968 b507 )
    ( on b523 b968 )
    ( on b516 b523 )
    ( on b904 b516 )
    ( on b719 b904 )
    ( on b304 b719 )
    ( on b394 b304 )
    ( on b427 b394 )
    ( on b651 b427 )
    ( on b734 b651 )
    ( on b208 b734 )
    ( on b457 b208 )
    ( on b701 b457 )
    ( on b707 b701 )
    ( on b668 b707 )
    ( on b850 b668 )
    ( on b694 b850 )
    ( on b429 b694 )
    ( on b559 b429 )
    ( on b16 b559 )
    ( on b766 b16 )
    ( on b286 b766 )
    ( on b852 b286 )
    ( on b612 b852 )
    ( on b940 b612 )
    ( on b414 b940 )
    ( on b73 b414 )
    ( on b922 b73 )
    ( on b60 b922 )
    ( on b249 b60 )
    ( on b405 b249 )
    ( on b914 b405 )
    ( on b372 b914 )
    ( on b778 b372 )
    ( clear b778 )
  )
  ( :tasks
    ( Make-34Pile b968 b523 b516 b904 b719 b304 b394 b427 b651 b734 b208 b457 b701 b707 b668 b850 b694 b429 b559 b16 b766 b286 b852 b612 b940 b414 b73 b922 b60 b249 b405 b914 b372 b778 )
  )
)
