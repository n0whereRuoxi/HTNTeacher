( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b617 - block
    b945 - block
    b875 - block
    b926 - block
    b949 - block
    b729 - block
    b892 - block
    b296 - block
    b439 - block
    b784 - block
    b500 - block
    b593 - block
    b573 - block
    b948 - block
    b835 - block
    b878 - block
    b651 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b617 )
    ( on b945 b617 )
    ( on b875 b945 )
    ( on b926 b875 )
    ( on b949 b926 )
    ( on b729 b949 )
    ( on b892 b729 )
    ( on b296 b892 )
    ( on b439 b296 )
    ( on b784 b439 )
    ( on b500 b784 )
    ( on b593 b500 )
    ( on b573 b593 )
    ( on b948 b573 )
    ( on b835 b948 )
    ( on b878 b835 )
    ( on b651 b878 )
    ( on b170 b651 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b617 )
    )
  )
)
