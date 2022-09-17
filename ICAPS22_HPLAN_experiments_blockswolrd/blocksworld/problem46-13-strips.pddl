( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b148 - block
    b11 - block
    b791 - block
    b484 - block
    b179 - block
    b571 - block
    b928 - block
    b517 - block
    b166 - block
    b665 - block
    b274 - block
    b173 - block
    b488 - block
    b875 - block
    b854 - block
    b120 - block
    b939 - block
    b149 - block
    b935 - block
    b544 - block
    b630 - block
    b452 - block
    b654 - block
    b511 - block
    b543 - block
    b332 - block
    b237 - block
    b662 - block
    b485 - block
    b539 - block
    b721 - block
    b505 - block
    b716 - block
    b321 - block
    b32 - block
    b455 - block
    b5 - block
    b240 - block
    b1 - block
    b843 - block
    b124 - block
    b508 - block
    b570 - block
    b748 - block
    b300 - block
    b686 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b148 )
    ( on b11 b148 )
    ( on b791 b11 )
    ( on b484 b791 )
    ( on b179 b484 )
    ( on b571 b179 )
    ( on b928 b571 )
    ( on b517 b928 )
    ( on b166 b517 )
    ( on b665 b166 )
    ( on b274 b665 )
    ( on b173 b274 )
    ( on b488 b173 )
    ( on b875 b488 )
    ( on b854 b875 )
    ( on b120 b854 )
    ( on b939 b120 )
    ( on b149 b939 )
    ( on b935 b149 )
    ( on b544 b935 )
    ( on b630 b544 )
    ( on b452 b630 )
    ( on b654 b452 )
    ( on b511 b654 )
    ( on b543 b511 )
    ( on b332 b543 )
    ( on b237 b332 )
    ( on b662 b237 )
    ( on b485 b662 )
    ( on b539 b485 )
    ( on b721 b539 )
    ( on b505 b721 )
    ( on b716 b505 )
    ( on b321 b716 )
    ( on b32 b321 )
    ( on b455 b32 )
    ( on b5 b455 )
    ( on b240 b5 )
    ( on b1 b240 )
    ( on b843 b1 )
    ( on b124 b843 )
    ( on b508 b124 )
    ( on b570 b508 )
    ( on b748 b570 )
    ( on b300 b748 )
    ( on b686 b300 )
    ( on b800 b686 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b148 )
    )
  )
)
