( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b205 - block
    b979 - block
    b203 - block
    b484 - block
    b16 - block
    b262 - block
    b673 - block
    b442 - block
    b446 - block
    b197 - block
    b425 - block
    b863 - block
    b836 - block
    b178 - block
    b127 - block
    b775 - block
    b723 - block
    b556 - block
    b38 - block
    b800 - block
    b581 - block
    b392 - block
    b382 - block
    b416 - block
    b293 - block
    b742 - block
    b894 - block
    b945 - block
    b859 - block
    b373 - block
    b341 - block
    b149 - block
    b906 - block
    b233 - block
    b934 - block
    b823 - block
    b506 - block
    b760 - block
    b895 - block
    b420 - block
    b505 - block
    b4 - block
    b747 - block
    b29 - block
    b163 - block
    b649 - block
    b387 - block
    b959 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b979 b205 )
    ( on b203 b979 )
    ( on b484 b203 )
    ( on b16 b484 )
    ( on b262 b16 )
    ( on b673 b262 )
    ( on b442 b673 )
    ( on b446 b442 )
    ( on b197 b446 )
    ( on b425 b197 )
    ( on b863 b425 )
    ( on b836 b863 )
    ( on b178 b836 )
    ( on b127 b178 )
    ( on b775 b127 )
    ( on b723 b775 )
    ( on b556 b723 )
    ( on b38 b556 )
    ( on b800 b38 )
    ( on b581 b800 )
    ( on b392 b581 )
    ( on b382 b392 )
    ( on b416 b382 )
    ( on b293 b416 )
    ( on b742 b293 )
    ( on b894 b742 )
    ( on b945 b894 )
    ( on b859 b945 )
    ( on b373 b859 )
    ( on b341 b373 )
    ( on b149 b341 )
    ( on b906 b149 )
    ( on b233 b906 )
    ( on b934 b233 )
    ( on b823 b934 )
    ( on b506 b823 )
    ( on b760 b506 )
    ( on b895 b760 )
    ( on b420 b895 )
    ( on b505 b420 )
    ( on b4 b505 )
    ( on b747 b4 )
    ( on b29 b747 )
    ( on b163 b29 )
    ( on b649 b163 )
    ( on b387 b649 )
    ( on b959 b387 )
    ( on b798 b959 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b205 )
    )
  )
)
