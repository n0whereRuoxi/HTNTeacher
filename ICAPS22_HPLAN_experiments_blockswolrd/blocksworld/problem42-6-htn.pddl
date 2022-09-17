( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b434 - block
    b411 - block
    b562 - block
    b748 - block
    b413 - block
    b163 - block
    b879 - block
    b119 - block
    b205 - block
    b324 - block
    b835 - block
    b865 - block
    b206 - block
    b55 - block
    b447 - block
    b519 - block
    b808 - block
    b404 - block
    b996 - block
    b757 - block
    b400 - block
    b896 - block
    b193 - block
    b151 - block
    b704 - block
    b291 - block
    b842 - block
    b800 - block
    b661 - block
    b399 - block
    b594 - block
    b198 - block
    b22 - block
    b553 - block
    b752 - block
    b111 - block
    b817 - block
    b230 - block
    b57 - block
    b708 - block
    b626 - block
    b911 - block
    b634 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b434 )
    ( on b411 b434 )
    ( on b562 b411 )
    ( on b748 b562 )
    ( on b413 b748 )
    ( on b163 b413 )
    ( on b879 b163 )
    ( on b119 b879 )
    ( on b205 b119 )
    ( on b324 b205 )
    ( on b835 b324 )
    ( on b865 b835 )
    ( on b206 b865 )
    ( on b55 b206 )
    ( on b447 b55 )
    ( on b519 b447 )
    ( on b808 b519 )
    ( on b404 b808 )
    ( on b996 b404 )
    ( on b757 b996 )
    ( on b400 b757 )
    ( on b896 b400 )
    ( on b193 b896 )
    ( on b151 b193 )
    ( on b704 b151 )
    ( on b291 b704 )
    ( on b842 b291 )
    ( on b800 b842 )
    ( on b661 b800 )
    ( on b399 b661 )
    ( on b594 b399 )
    ( on b198 b594 )
    ( on b22 b198 )
    ( on b553 b22 )
    ( on b752 b553 )
    ( on b111 b752 )
    ( on b817 b111 )
    ( on b230 b817 )
    ( on b57 b230 )
    ( on b708 b57 )
    ( on b626 b708 )
    ( on b911 b626 )
    ( on b634 b911 )
    ( clear b634 )
  )
  ( :tasks
    ( Make-42Pile b411 b562 b748 b413 b163 b879 b119 b205 b324 b835 b865 b206 b55 b447 b519 b808 b404 b996 b757 b400 b896 b193 b151 b704 b291 b842 b800 b661 b399 b594 b198 b22 b553 b752 b111 b817 b230 b57 b708 b626 b911 b634 )
  )
)
