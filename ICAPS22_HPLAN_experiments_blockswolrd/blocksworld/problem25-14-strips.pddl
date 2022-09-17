( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b45 - block
    b768 - block
    b228 - block
    b557 - block
    b194 - block
    b876 - block
    b258 - block
    b196 - block
    b659 - block
    b246 - block
    b967 - block
    b616 - block
    b598 - block
    b37 - block
    b966 - block
    b240 - block
    b605 - block
    b683 - block
    b211 - block
    b425 - block
    b234 - block
    b403 - block
    b233 - block
    b80 - block
    b728 - block
    b640 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b45 )
    ( on b768 b45 )
    ( on b228 b768 )
    ( on b557 b228 )
    ( on b194 b557 )
    ( on b876 b194 )
    ( on b258 b876 )
    ( on b196 b258 )
    ( on b659 b196 )
    ( on b246 b659 )
    ( on b967 b246 )
    ( on b616 b967 )
    ( on b598 b616 )
    ( on b37 b598 )
    ( on b966 b37 )
    ( on b240 b966 )
    ( on b605 b240 )
    ( on b683 b605 )
    ( on b211 b683 )
    ( on b425 b211 )
    ( on b234 b425 )
    ( on b403 b234 )
    ( on b233 b403 )
    ( on b80 b233 )
    ( on b728 b80 )
    ( on b640 b728 )
    ( clear b640 )
  )
  ( :goal
    ( and
      ( clear b45 )
    )
  )
)
