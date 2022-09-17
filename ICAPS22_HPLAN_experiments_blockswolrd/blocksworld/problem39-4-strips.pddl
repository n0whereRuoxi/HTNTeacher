( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b176 - block
    b328 - block
    b733 - block
    b699 - block
    b141 - block
    b570 - block
    b372 - block
    b61 - block
    b115 - block
    b847 - block
    b891 - block
    b662 - block
    b341 - block
    b821 - block
    b717 - block
    b951 - block
    b663 - block
    b435 - block
    b752 - block
    b581 - block
    b906 - block
    b110 - block
    b876 - block
    b228 - block
    b820 - block
    b347 - block
    b321 - block
    b996 - block
    b148 - block
    b585 - block
    b282 - block
    b388 - block
    b67 - block
    b193 - block
    b442 - block
    b77 - block
    b326 - block
    b287 - block
    b949 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b176 )
    ( on b328 b176 )
    ( on b733 b328 )
    ( on b699 b733 )
    ( on b141 b699 )
    ( on b570 b141 )
    ( on b372 b570 )
    ( on b61 b372 )
    ( on b115 b61 )
    ( on b847 b115 )
    ( on b891 b847 )
    ( on b662 b891 )
    ( on b341 b662 )
    ( on b821 b341 )
    ( on b717 b821 )
    ( on b951 b717 )
    ( on b663 b951 )
    ( on b435 b663 )
    ( on b752 b435 )
    ( on b581 b752 )
    ( on b906 b581 )
    ( on b110 b906 )
    ( on b876 b110 )
    ( on b228 b876 )
    ( on b820 b228 )
    ( on b347 b820 )
    ( on b321 b347 )
    ( on b996 b321 )
    ( on b148 b996 )
    ( on b585 b148 )
    ( on b282 b585 )
    ( on b388 b282 )
    ( on b67 b388 )
    ( on b193 b67 )
    ( on b442 b193 )
    ( on b77 b442 )
    ( on b326 b77 )
    ( on b287 b326 )
    ( on b949 b287 )
    ( on b164 b949 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b176 )
    )
  )
)
