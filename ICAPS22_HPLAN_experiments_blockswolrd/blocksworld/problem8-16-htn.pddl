( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b883 - block
    b944 - block
    b814 - block
    b264 - block
    b713 - block
    b964 - block
    b369 - block
    b679 - block
    b677 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b883 )
    ( on b944 b883 )
    ( on b814 b944 )
    ( on b264 b814 )
    ( on b713 b264 )
    ( on b964 b713 )
    ( on b369 b964 )
    ( on b679 b369 )
    ( on b677 b679 )
    ( clear b677 )
  )
  ( :tasks
    ( Make-8Pile b944 b814 b264 b713 b964 b369 b679 b677 )
  )
)
