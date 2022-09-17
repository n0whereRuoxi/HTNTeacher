( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b928 - block
    b265 - block
    b699 - block
    b227 - block
    b833 - block
    b818 - block
    b222 - block
    b296 - block
    b153 - block
    b474 - block
    b536 - block
    b353 - block
    b789 - block
    b339 - block
    b991 - block
    b447 - block
    b590 - block
    b19 - block
    b349 - block
    b546 - block
    b645 - block
    b759 - block
    b165 - block
    b109 - block
    b461 - block
    b978 - block
    b186 - block
    b916 - block
    b877 - block
    b976 - block
    b718 - block
    b161 - block
    b157 - block
    b314 - block
    b351 - block
    b932 - block
    b235 - block
    b676 - block
    b870 - block
    b943 - block
    b750 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b928 )
    ( on b265 b928 )
    ( on b699 b265 )
    ( on b227 b699 )
    ( on b833 b227 )
    ( on b818 b833 )
    ( on b222 b818 )
    ( on b296 b222 )
    ( on b153 b296 )
    ( on b474 b153 )
    ( on b536 b474 )
    ( on b353 b536 )
    ( on b789 b353 )
    ( on b339 b789 )
    ( on b991 b339 )
    ( on b447 b991 )
    ( on b590 b447 )
    ( on b19 b590 )
    ( on b349 b19 )
    ( on b546 b349 )
    ( on b645 b546 )
    ( on b759 b645 )
    ( on b165 b759 )
    ( on b109 b165 )
    ( on b461 b109 )
    ( on b978 b461 )
    ( on b186 b978 )
    ( on b916 b186 )
    ( on b877 b916 )
    ( on b976 b877 )
    ( on b718 b976 )
    ( on b161 b718 )
    ( on b157 b161 )
    ( on b314 b157 )
    ( on b351 b314 )
    ( on b932 b351 )
    ( on b235 b932 )
    ( on b676 b235 )
    ( on b870 b676 )
    ( on b943 b870 )
    ( on b750 b943 )
    ( clear b750 )
  )
  ( :goal
    ( and
      ( clear b928 )
    )
  )
)
