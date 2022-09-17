( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b201 - block
    b446 - block
    b662 - block
    b774 - block
    b241 - block
    b102 - block
    b410 - block
    b912 - block
    b51 - block
    b524 - block
    b523 - block
    b299 - block
    b459 - block
    b263 - block
    b117 - block
    b186 - block
    b541 - block
    b677 - block
    b205 - block
    b802 - block
    b777 - block
    b106 - block
    b787 - block
    b752 - block
    b231 - block
    b76 - block
    b776 - block
    b890 - block
    b433 - block
    b916 - block
    b733 - block
    b500 - block
    b581 - block
    b838 - block
    b595 - block
    b717 - block
    b492 - block
    b144 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b201 )
    ( on b446 b201 )
    ( on b662 b446 )
    ( on b774 b662 )
    ( on b241 b774 )
    ( on b102 b241 )
    ( on b410 b102 )
    ( on b912 b410 )
    ( on b51 b912 )
    ( on b524 b51 )
    ( on b523 b524 )
    ( on b299 b523 )
    ( on b459 b299 )
    ( on b263 b459 )
    ( on b117 b263 )
    ( on b186 b117 )
    ( on b541 b186 )
    ( on b677 b541 )
    ( on b205 b677 )
    ( on b802 b205 )
    ( on b777 b802 )
    ( on b106 b777 )
    ( on b787 b106 )
    ( on b752 b787 )
    ( on b231 b752 )
    ( on b76 b231 )
    ( on b776 b76 )
    ( on b890 b776 )
    ( on b433 b890 )
    ( on b916 b433 )
    ( on b733 b916 )
    ( on b500 b733 )
    ( on b581 b500 )
    ( on b838 b581 )
    ( on b595 b838 )
    ( on b717 b595 )
    ( on b492 b717 )
    ( on b144 b492 )
    ( clear b144 )
  )
  ( :goal
    ( and
      ( clear b201 )
    )
  )
)
