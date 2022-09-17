( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b423 - block
    b249 - block
    b570 - block
    b17 - block
    b488 - block
    b725 - block
    b841 - block
    b602 - block
    b470 - block
    b718 - block
    b339 - block
    b639 - block
    b225 - block
    b648 - block
    b878 - block
    b216 - block
    b505 - block
    b507 - block
    b458 - block
    b388 - block
    b963 - block
    b836 - block
    b540 - block
    b264 - block
    b900 - block
    b904 - block
    b638 - block
    b828 - block
    b776 - block
    b418 - block
    b398 - block
    b1 - block
    b882 - block
    b277 - block
    b113 - block
    b884 - block
    b27 - block
    b544 - block
    b326 - block
    b90 - block
    b356 - block
    b568 - block
    b205 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b423 )
    ( on b249 b423 )
    ( on b570 b249 )
    ( on b17 b570 )
    ( on b488 b17 )
    ( on b725 b488 )
    ( on b841 b725 )
    ( on b602 b841 )
    ( on b470 b602 )
    ( on b718 b470 )
    ( on b339 b718 )
    ( on b639 b339 )
    ( on b225 b639 )
    ( on b648 b225 )
    ( on b878 b648 )
    ( on b216 b878 )
    ( on b505 b216 )
    ( on b507 b505 )
    ( on b458 b507 )
    ( on b388 b458 )
    ( on b963 b388 )
    ( on b836 b963 )
    ( on b540 b836 )
    ( on b264 b540 )
    ( on b900 b264 )
    ( on b904 b900 )
    ( on b638 b904 )
    ( on b828 b638 )
    ( on b776 b828 )
    ( on b418 b776 )
    ( on b398 b418 )
    ( on b1 b398 )
    ( on b882 b1 )
    ( on b277 b882 )
    ( on b113 b277 )
    ( on b884 b113 )
    ( on b27 b884 )
    ( on b544 b27 )
    ( on b326 b544 )
    ( on b90 b326 )
    ( on b356 b90 )
    ( on b568 b356 )
    ( on b205 b568 )
    ( on b537 b205 )
    ( clear b537 )
  )
  ( :tasks
    ( Make-43Pile b249 b570 b17 b488 b725 b841 b602 b470 b718 b339 b639 b225 b648 b878 b216 b505 b507 b458 b388 b963 b836 b540 b264 b900 b904 b638 b828 b776 b418 b398 b1 b882 b277 b113 b884 b27 b544 b326 b90 b356 b568 b205 b537 )
  )
)
