( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b820 - block
    b850 - block
    b486 - block
    b461 - block
    b298 - block
    b847 - block
    b25 - block
    b975 - block
    b135 - block
    b711 - block
    b431 - block
    b596 - block
    b148 - block
    b973 - block
    b355 - block
    b831 - block
    b939 - block
    b421 - block
    b738 - block
    b863 - block
    b350 - block
    b727 - block
    b250 - block
    b757 - block
    b190 - block
    b856 - block
    b846 - block
    b439 - block
    b333 - block
    b156 - block
    b798 - block
    b371 - block
    b649 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b850 b820 )
    ( on b486 b850 )
    ( on b461 b486 )
    ( on b298 b461 )
    ( on b847 b298 )
    ( on b25 b847 )
    ( on b975 b25 )
    ( on b135 b975 )
    ( on b711 b135 )
    ( on b431 b711 )
    ( on b596 b431 )
    ( on b148 b596 )
    ( on b973 b148 )
    ( on b355 b973 )
    ( on b831 b355 )
    ( on b939 b831 )
    ( on b421 b939 )
    ( on b738 b421 )
    ( on b863 b738 )
    ( on b350 b863 )
    ( on b727 b350 )
    ( on b250 b727 )
    ( on b757 b250 )
    ( on b190 b757 )
    ( on b856 b190 )
    ( on b846 b856 )
    ( on b439 b846 )
    ( on b333 b439 )
    ( on b156 b333 )
    ( on b798 b156 )
    ( on b371 b798 )
    ( on b649 b371 )
    ( clear b649 )
  )
  ( :goal
    ( and
      ( clear b820 )
    )
  )
)
