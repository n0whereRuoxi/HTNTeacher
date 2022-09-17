( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b896 - block
    b455 - block
    b539 - block
    b483 - block
    b315 - block
    b673 - block
    b37 - block
    b166 - block
    b644 - block
    b497 - block
    b583 - block
    b13 - block
    b96 - block
    b210 - block
    b191 - block
    b655 - block
    b924 - block
    b83 - block
    b116 - block
    b111 - block
    b533 - block
    b501 - block
    b505 - block
    b879 - block
    b192 - block
    b303 - block
    b165 - block
    b275 - block
    b330 - block
    b375 - block
    b350 - block
    b231 - block
    b660 - block
    b825 - block
    b475 - block
    b965 - block
    b621 - block
    b890 - block
    b97 - block
    b163 - block
    b449 - block
    b461 - block
    b281 - block
    b530 - block
    b196 - block
    b145 - block
    b273 - block
    b718 - block
    b986 - block
    b768 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b896 )
    ( on b455 b896 )
    ( on b539 b455 )
    ( on b483 b539 )
    ( on b315 b483 )
    ( on b673 b315 )
    ( on b37 b673 )
    ( on b166 b37 )
    ( on b644 b166 )
    ( on b497 b644 )
    ( on b583 b497 )
    ( on b13 b583 )
    ( on b96 b13 )
    ( on b210 b96 )
    ( on b191 b210 )
    ( on b655 b191 )
    ( on b924 b655 )
    ( on b83 b924 )
    ( on b116 b83 )
    ( on b111 b116 )
    ( on b533 b111 )
    ( on b501 b533 )
    ( on b505 b501 )
    ( on b879 b505 )
    ( on b192 b879 )
    ( on b303 b192 )
    ( on b165 b303 )
    ( on b275 b165 )
    ( on b330 b275 )
    ( on b375 b330 )
    ( on b350 b375 )
    ( on b231 b350 )
    ( on b660 b231 )
    ( on b825 b660 )
    ( on b475 b825 )
    ( on b965 b475 )
    ( on b621 b965 )
    ( on b890 b621 )
    ( on b97 b890 )
    ( on b163 b97 )
    ( on b449 b163 )
    ( on b461 b449 )
    ( on b281 b461 )
    ( on b530 b281 )
    ( on b196 b530 )
    ( on b145 b196 )
    ( on b273 b145 )
    ( on b718 b273 )
    ( on b986 b718 )
    ( on b768 b986 )
    ( clear b768 )
  )
  ( :goal
    ( and
      ( clear b896 )
    )
  )
)
