( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b702 - block
    b283 - block
    b730 - block
    b543 - block
    b658 - block
    b829 - block
    b677 - block
    b432 - block
    b3 - block
    b483 - block
    b590 - block
    b647 - block
    b271 - block
    b925 - block
    b748 - block
    b442 - block
    b352 - block
    b41 - block
    b905 - block
    b83 - block
    b374 - block
    b921 - block
    b542 - block
    b635 - block
    b149 - block
    b107 - block
    b621 - block
    b309 - block
    b995 - block
    b322 - block
    b270 - block
    b676 - block
    b360 - block
    b566 - block
    b828 - block
    b902 - block
    b494 - block
    b58 - block
    b37 - block
    b396 - block
    b87 - block
    b869 - block
    b78 - block
    b516 - block
    b99 - block
    b928 - block
    b846 - block
    b558 - block
    b527 - block
    b128 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b702 )
    ( on b283 b702 )
    ( on b730 b283 )
    ( on b543 b730 )
    ( on b658 b543 )
    ( on b829 b658 )
    ( on b677 b829 )
    ( on b432 b677 )
    ( on b3 b432 )
    ( on b483 b3 )
    ( on b590 b483 )
    ( on b647 b590 )
    ( on b271 b647 )
    ( on b925 b271 )
    ( on b748 b925 )
    ( on b442 b748 )
    ( on b352 b442 )
    ( on b41 b352 )
    ( on b905 b41 )
    ( on b83 b905 )
    ( on b374 b83 )
    ( on b921 b374 )
    ( on b542 b921 )
    ( on b635 b542 )
    ( on b149 b635 )
    ( on b107 b149 )
    ( on b621 b107 )
    ( on b309 b621 )
    ( on b995 b309 )
    ( on b322 b995 )
    ( on b270 b322 )
    ( on b676 b270 )
    ( on b360 b676 )
    ( on b566 b360 )
    ( on b828 b566 )
    ( on b902 b828 )
    ( on b494 b902 )
    ( on b58 b494 )
    ( on b37 b58 )
    ( on b396 b37 )
    ( on b87 b396 )
    ( on b869 b87 )
    ( on b78 b869 )
    ( on b516 b78 )
    ( on b99 b516 )
    ( on b928 b99 )
    ( on b846 b928 )
    ( on b558 b846 )
    ( on b527 b558 )
    ( on b128 b527 )
    ( on b946 b128 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b702 )
    )
  )
)
