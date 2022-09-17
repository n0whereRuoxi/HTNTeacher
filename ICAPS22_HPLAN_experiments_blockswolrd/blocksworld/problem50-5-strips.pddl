( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b98 - block
    b426 - block
    b196 - block
    b103 - block
    b369 - block
    b46 - block
    b254 - block
    b184 - block
    b269 - block
    b338 - block
    b627 - block
    b459 - block
    b59 - block
    b696 - block
    b814 - block
    b667 - block
    b27 - block
    b112 - block
    b181 - block
    b376 - block
    b952 - block
    b890 - block
    b843 - block
    b895 - block
    b935 - block
    b664 - block
    b644 - block
    b339 - block
    b28 - block
    b389 - block
    b385 - block
    b442 - block
    b43 - block
    b721 - block
    b396 - block
    b659 - block
    b997 - block
    b42 - block
    b429 - block
    b701 - block
    b52 - block
    b319 - block
    b124 - block
    b134 - block
    b321 - block
    b422 - block
    b574 - block
    b68 - block
    b730 - block
    b796 - block
    b172 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b98 )
    ( on b426 b98 )
    ( on b196 b426 )
    ( on b103 b196 )
    ( on b369 b103 )
    ( on b46 b369 )
    ( on b254 b46 )
    ( on b184 b254 )
    ( on b269 b184 )
    ( on b338 b269 )
    ( on b627 b338 )
    ( on b459 b627 )
    ( on b59 b459 )
    ( on b696 b59 )
    ( on b814 b696 )
    ( on b667 b814 )
    ( on b27 b667 )
    ( on b112 b27 )
    ( on b181 b112 )
    ( on b376 b181 )
    ( on b952 b376 )
    ( on b890 b952 )
    ( on b843 b890 )
    ( on b895 b843 )
    ( on b935 b895 )
    ( on b664 b935 )
    ( on b644 b664 )
    ( on b339 b644 )
    ( on b28 b339 )
    ( on b389 b28 )
    ( on b385 b389 )
    ( on b442 b385 )
    ( on b43 b442 )
    ( on b721 b43 )
    ( on b396 b721 )
    ( on b659 b396 )
    ( on b997 b659 )
    ( on b42 b997 )
    ( on b429 b42 )
    ( on b701 b429 )
    ( on b52 b701 )
    ( on b319 b52 )
    ( on b124 b319 )
    ( on b134 b124 )
    ( on b321 b134 )
    ( on b422 b321 )
    ( on b574 b422 )
    ( on b68 b574 )
    ( on b730 b68 )
    ( on b796 b730 )
    ( on b172 b796 )
    ( clear b172 )
  )
  ( :goal
    ( and
      ( clear b98 )
    )
  )
)
