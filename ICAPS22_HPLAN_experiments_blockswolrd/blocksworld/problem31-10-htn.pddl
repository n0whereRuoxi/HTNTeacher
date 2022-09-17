( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b928 - block
    b199 - block
    b252 - block
    b484 - block
    b753 - block
    b309 - block
    b600 - block
    b522 - block
    b206 - block
    b658 - block
    b290 - block
    b850 - block
    b195 - block
    b216 - block
    b567 - block
    b527 - block
    b366 - block
    b370 - block
    b59 - block
    b952 - block
    b881 - block
    b929 - block
    b477 - block
    b874 - block
    b191 - block
    b536 - block
    b585 - block
    b717 - block
    b972 - block
    b745 - block
    b910 - block
    b288 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b928 )
    ( on b199 b928 )
    ( on b252 b199 )
    ( on b484 b252 )
    ( on b753 b484 )
    ( on b309 b753 )
    ( on b600 b309 )
    ( on b522 b600 )
    ( on b206 b522 )
    ( on b658 b206 )
    ( on b290 b658 )
    ( on b850 b290 )
    ( on b195 b850 )
    ( on b216 b195 )
    ( on b567 b216 )
    ( on b527 b567 )
    ( on b366 b527 )
    ( on b370 b366 )
    ( on b59 b370 )
    ( on b952 b59 )
    ( on b881 b952 )
    ( on b929 b881 )
    ( on b477 b929 )
    ( on b874 b477 )
    ( on b191 b874 )
    ( on b536 b191 )
    ( on b585 b536 )
    ( on b717 b585 )
    ( on b972 b717 )
    ( on b745 b972 )
    ( on b910 b745 )
    ( on b288 b910 )
    ( clear b288 )
  )
  ( :tasks
    ( Make-31Pile b199 b252 b484 b753 b309 b600 b522 b206 b658 b290 b850 b195 b216 b567 b527 b366 b370 b59 b952 b881 b929 b477 b874 b191 b536 b585 b717 b972 b745 b910 b288 )
  )
)
