( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b538 - block
    b64 - block
    b636 - block
    b658 - block
    b25 - block
    b767 - block
    b928 - block
    b386 - block
    b785 - block
    b135 - block
    b568 - block
    b865 - block
    b152 - block
    b374 - block
    b88 - block
    b145 - block
    b584 - block
    b920 - block
    b174 - block
    b909 - block
    b168 - block
    b65 - block
    b327 - block
    b717 - block
    b780 - block
    b528 - block
    b615 - block
    b491 - block
    b516 - block
    b47 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b64 b538 )
    ( on b636 b64 )
    ( on b658 b636 )
    ( on b25 b658 )
    ( on b767 b25 )
    ( on b928 b767 )
    ( on b386 b928 )
    ( on b785 b386 )
    ( on b135 b785 )
    ( on b568 b135 )
    ( on b865 b568 )
    ( on b152 b865 )
    ( on b374 b152 )
    ( on b88 b374 )
    ( on b145 b88 )
    ( on b584 b145 )
    ( on b920 b584 )
    ( on b174 b920 )
    ( on b909 b174 )
    ( on b168 b909 )
    ( on b65 b168 )
    ( on b327 b65 )
    ( on b717 b327 )
    ( on b780 b717 )
    ( on b528 b780 )
    ( on b615 b528 )
    ( on b491 b615 )
    ( on b516 b491 )
    ( on b47 b516 )
    ( clear b47 )
  )
  ( :tasks
    ( Make-29Pile b64 b636 b658 b25 b767 b928 b386 b785 b135 b568 b865 b152 b374 b88 b145 b584 b920 b174 b909 b168 b65 b327 b717 b780 b528 b615 b491 b516 b47 )
  )
)
