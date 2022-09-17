( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b826 - block
    b884 - block
    b987 - block
    b231 - block
    b264 - block
    b118 - block
    b589 - block
    b801 - block
    b825 - block
    b754 - block
    b731 - block
    b796 - block
    b75 - block
    b705 - block
    b798 - block
    b394 - block
    b961 - block
    b679 - block
    b690 - block
    b949 - block
    b63 - block
    b354 - block
    b783 - block
    b423 - block
    b860 - block
    b286 - block
    b291 - block
    b463 - block
    b767 - block
    b653 - block
    b469 - block
    b862 - block
    b64 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b826 )
    ( on b884 b826 )
    ( on b987 b884 )
    ( on b231 b987 )
    ( on b264 b231 )
    ( on b118 b264 )
    ( on b589 b118 )
    ( on b801 b589 )
    ( on b825 b801 )
    ( on b754 b825 )
    ( on b731 b754 )
    ( on b796 b731 )
    ( on b75 b796 )
    ( on b705 b75 )
    ( on b798 b705 )
    ( on b394 b798 )
    ( on b961 b394 )
    ( on b679 b961 )
    ( on b690 b679 )
    ( on b949 b690 )
    ( on b63 b949 )
    ( on b354 b63 )
    ( on b783 b354 )
    ( on b423 b783 )
    ( on b860 b423 )
    ( on b286 b860 )
    ( on b291 b286 )
    ( on b463 b291 )
    ( on b767 b463 )
    ( on b653 b767 )
    ( on b469 b653 )
    ( on b862 b469 )
    ( on b64 b862 )
    ( clear b64 )
  )
  ( :tasks
    ( Make-32Pile b884 b987 b231 b264 b118 b589 b801 b825 b754 b731 b796 b75 b705 b798 b394 b961 b679 b690 b949 b63 b354 b783 b423 b860 b286 b291 b463 b767 b653 b469 b862 b64 )
  )
)
