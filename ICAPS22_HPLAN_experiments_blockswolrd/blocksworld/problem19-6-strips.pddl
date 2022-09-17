( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b185 - block
    b319 - block
    b726 - block
    b686 - block
    b758 - block
    b410 - block
    b336 - block
    b461 - block
    b530 - block
    b795 - block
    b688 - block
    b234 - block
    b829 - block
    b468 - block
    b771 - block
    b588 - block
    b164 - block
    b791 - block
    b259 - block
    b999 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b185 )
    ( on b319 b185 )
    ( on b726 b319 )
    ( on b686 b726 )
    ( on b758 b686 )
    ( on b410 b758 )
    ( on b336 b410 )
    ( on b461 b336 )
    ( on b530 b461 )
    ( on b795 b530 )
    ( on b688 b795 )
    ( on b234 b688 )
    ( on b829 b234 )
    ( on b468 b829 )
    ( on b771 b468 )
    ( on b588 b771 )
    ( on b164 b588 )
    ( on b791 b164 )
    ( on b259 b791 )
    ( on b999 b259 )
    ( clear b999 )
  )
  ( :goal
    ( and
      ( clear b185 )
    )
  )
)
