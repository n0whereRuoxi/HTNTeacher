( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b122 - block
    b107 - block
    b489 - block
    b543 - block
    b205 - block
    b377 - block
    b801 - block
    b371 - block
    b166 - block
    b589 - block
    b916 - block
    b781 - block
    b858 - block
    b416 - block
    b903 - block
    b48 - block
    b422 - block
    b321 - block
    b553 - block
    b788 - block
    b427 - block
    b305 - block
    b151 - block
    b650 - block
    b729 - block
    b160 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b122 )
    ( on b107 b122 )
    ( on b489 b107 )
    ( on b543 b489 )
    ( on b205 b543 )
    ( on b377 b205 )
    ( on b801 b377 )
    ( on b371 b801 )
    ( on b166 b371 )
    ( on b589 b166 )
    ( on b916 b589 )
    ( on b781 b916 )
    ( on b858 b781 )
    ( on b416 b858 )
    ( on b903 b416 )
    ( on b48 b903 )
    ( on b422 b48 )
    ( on b321 b422 )
    ( on b553 b321 )
    ( on b788 b553 )
    ( on b427 b788 )
    ( on b305 b427 )
    ( on b151 b305 )
    ( on b650 b151 )
    ( on b729 b650 )
    ( on b160 b729 )
    ( clear b160 )
  )
  ( :tasks
    ( Make-25Pile b107 b489 b543 b205 b377 b801 b371 b166 b589 b916 b781 b858 b416 b903 b48 b422 b321 b553 b788 b427 b305 b151 b650 b729 b160 )
  )
)
