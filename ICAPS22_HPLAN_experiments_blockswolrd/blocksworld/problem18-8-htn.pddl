( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b224 - block
    b172 - block
    b91 - block
    b945 - block
    b93 - block
    b451 - block
    b304 - block
    b474 - block
    b761 - block
    b36 - block
    b308 - block
    b124 - block
    b979 - block
    b584 - block
    b491 - block
    b300 - block
    b403 - block
    b831 - block
    b741 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b224 )
    ( on b172 b224 )
    ( on b91 b172 )
    ( on b945 b91 )
    ( on b93 b945 )
    ( on b451 b93 )
    ( on b304 b451 )
    ( on b474 b304 )
    ( on b761 b474 )
    ( on b36 b761 )
    ( on b308 b36 )
    ( on b124 b308 )
    ( on b979 b124 )
    ( on b584 b979 )
    ( on b491 b584 )
    ( on b300 b491 )
    ( on b403 b300 )
    ( on b831 b403 )
    ( on b741 b831 )
    ( clear b741 )
  )
  ( :tasks
    ( Make-18Pile b172 b91 b945 b93 b451 b304 b474 b761 b36 b308 b124 b979 b584 b491 b300 b403 b831 b741 )
  )
)
