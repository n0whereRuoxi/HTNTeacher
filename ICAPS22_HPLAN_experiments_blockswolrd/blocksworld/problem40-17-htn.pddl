( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b23 - block
    b777 - block
    b700 - block
    b741 - block
    b418 - block
    b401 - block
    b215 - block
    b17 - block
    b588 - block
    b103 - block
    b906 - block
    b600 - block
    b301 - block
    b557 - block
    b915 - block
    b865 - block
    b984 - block
    b541 - block
    b342 - block
    b905 - block
    b80 - block
    b120 - block
    b533 - block
    b757 - block
    b820 - block
    b484 - block
    b426 - block
    b134 - block
    b628 - block
    b540 - block
    b803 - block
    b836 - block
    b621 - block
    b33 - block
    b833 - block
    b175 - block
    b581 - block
    b800 - block
    b725 - block
    b317 - block
    b690 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b23 )
    ( on b777 b23 )
    ( on b700 b777 )
    ( on b741 b700 )
    ( on b418 b741 )
    ( on b401 b418 )
    ( on b215 b401 )
    ( on b17 b215 )
    ( on b588 b17 )
    ( on b103 b588 )
    ( on b906 b103 )
    ( on b600 b906 )
    ( on b301 b600 )
    ( on b557 b301 )
    ( on b915 b557 )
    ( on b865 b915 )
    ( on b984 b865 )
    ( on b541 b984 )
    ( on b342 b541 )
    ( on b905 b342 )
    ( on b80 b905 )
    ( on b120 b80 )
    ( on b533 b120 )
    ( on b757 b533 )
    ( on b820 b757 )
    ( on b484 b820 )
    ( on b426 b484 )
    ( on b134 b426 )
    ( on b628 b134 )
    ( on b540 b628 )
    ( on b803 b540 )
    ( on b836 b803 )
    ( on b621 b836 )
    ( on b33 b621 )
    ( on b833 b33 )
    ( on b175 b833 )
    ( on b581 b175 )
    ( on b800 b581 )
    ( on b725 b800 )
    ( on b317 b725 )
    ( on b690 b317 )
    ( clear b690 )
  )
  ( :tasks
    ( Make-40Pile b777 b700 b741 b418 b401 b215 b17 b588 b103 b906 b600 b301 b557 b915 b865 b984 b541 b342 b905 b80 b120 b533 b757 b820 b484 b426 b134 b628 b540 b803 b836 b621 b33 b833 b175 b581 b800 b725 b317 b690 )
  )
)
