( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b702 - block
    b242 - block
    b454 - block
    b861 - block
    b923 - block
    b818 - block
    b874 - block
    b735 - block
    b19 - block
    b595 - block
    b726 - block
    b275 - block
    b758 - block
    b29 - block
    b631 - block
    b970 - block
    b542 - block
    b915 - block
    b148 - block
    b584 - block
    b244 - block
    b113 - block
    b703 - block
    b375 - block
    b807 - block
    b843 - block
    b668 - block
    b257 - block
    b844 - block
    b195 - block
    b731 - block
    b795 - block
    b640 - block
    b70 - block
    b194 - block
    b973 - block
    b249 - block
    b878 - block
    b128 - block
    b192 - block
    b928 - block
    b478 - block
    b760 - block
    b374 - block
    b914 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b702 )
    ( on b242 b702 )
    ( on b454 b242 )
    ( on b861 b454 )
    ( on b923 b861 )
    ( on b818 b923 )
    ( on b874 b818 )
    ( on b735 b874 )
    ( on b19 b735 )
    ( on b595 b19 )
    ( on b726 b595 )
    ( on b275 b726 )
    ( on b758 b275 )
    ( on b29 b758 )
    ( on b631 b29 )
    ( on b970 b631 )
    ( on b542 b970 )
    ( on b915 b542 )
    ( on b148 b915 )
    ( on b584 b148 )
    ( on b244 b584 )
    ( on b113 b244 )
    ( on b703 b113 )
    ( on b375 b703 )
    ( on b807 b375 )
    ( on b843 b807 )
    ( on b668 b843 )
    ( on b257 b668 )
    ( on b844 b257 )
    ( on b195 b844 )
    ( on b731 b195 )
    ( on b795 b731 )
    ( on b640 b795 )
    ( on b70 b640 )
    ( on b194 b70 )
    ( on b973 b194 )
    ( on b249 b973 )
    ( on b878 b249 )
    ( on b128 b878 )
    ( on b192 b128 )
    ( on b928 b192 )
    ( on b478 b928 )
    ( on b760 b478 )
    ( on b374 b760 )
    ( on b914 b374 )
    ( clear b914 )
  )
  ( :goal
    ( and
      ( clear b702 )
    )
  )
)
