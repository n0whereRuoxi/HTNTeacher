( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b832 - block
    b614 - block
    b890 - block
    b230 - block
    b345 - block
    b234 - block
    b452 - block
    b868 - block
    b724 - block
    b550 - block
    b908 - block
    b201 - block
    b145 - block
    b266 - block
    b638 - block
    b910 - block
    b1 - block
    b821 - block
    b786 - block
    b269 - block
    b845 - block
    b135 - block
    b954 - block
    b349 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b832 )
    ( on b614 b832 )
    ( on b890 b614 )
    ( on b230 b890 )
    ( on b345 b230 )
    ( on b234 b345 )
    ( on b452 b234 )
    ( on b868 b452 )
    ( on b724 b868 )
    ( on b550 b724 )
    ( on b908 b550 )
    ( on b201 b908 )
    ( on b145 b201 )
    ( on b266 b145 )
    ( on b638 b266 )
    ( on b910 b638 )
    ( on b1 b910 )
    ( on b821 b1 )
    ( on b786 b821 )
    ( on b269 b786 )
    ( on b845 b269 )
    ( on b135 b845 )
    ( on b954 b135 )
    ( on b349 b954 )
    ( clear b349 )
  )
  ( :goal
    ( and
      ( clear b832 )
    )
  )
)
