( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b846 - block
    b732 - block
    b724 - block
    b687 - block
    b719 - block
    b997 - block
    b989 - block
    b753 - block
    b424 - block
    b406 - block
    b654 - block
    b739 - block
    b431 - block
    b787 - block
    b82 - block
    b54 - block
    b30 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b846 )
    ( on b732 b846 )
    ( on b724 b732 )
    ( on b687 b724 )
    ( on b719 b687 )
    ( on b997 b719 )
    ( on b989 b997 )
    ( on b753 b989 )
    ( on b424 b753 )
    ( on b406 b424 )
    ( on b654 b406 )
    ( on b739 b654 )
    ( on b431 b739 )
    ( on b787 b431 )
    ( on b82 b787 )
    ( on b54 b82 )
    ( on b30 b54 )
    ( on b80 b30 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b846 )
    )
  )
)
