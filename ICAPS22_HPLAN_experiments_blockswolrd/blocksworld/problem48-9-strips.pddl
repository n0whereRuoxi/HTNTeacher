( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b349 - block
    b324 - block
    b724 - block
    b62 - block
    b475 - block
    b793 - block
    b40 - block
    b538 - block
    b291 - block
    b637 - block
    b428 - block
    b235 - block
    b383 - block
    b173 - block
    b459 - block
    b44 - block
    b661 - block
    b533 - block
    b921 - block
    b160 - block
    b702 - block
    b699 - block
    b829 - block
    b487 - block
    b773 - block
    b796 - block
    b253 - block
    b907 - block
    b455 - block
    b579 - block
    b310 - block
    b23 - block
    b627 - block
    b451 - block
    b454 - block
    b245 - block
    b76 - block
    b580 - block
    b269 - block
    b926 - block
    b711 - block
    b11 - block
    b443 - block
    b7 - block
    b216 - block
    b199 - block
    b807 - block
    b782 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b349 b210 )
    ( on b324 b349 )
    ( on b724 b324 )
    ( on b62 b724 )
    ( on b475 b62 )
    ( on b793 b475 )
    ( on b40 b793 )
    ( on b538 b40 )
    ( on b291 b538 )
    ( on b637 b291 )
    ( on b428 b637 )
    ( on b235 b428 )
    ( on b383 b235 )
    ( on b173 b383 )
    ( on b459 b173 )
    ( on b44 b459 )
    ( on b661 b44 )
    ( on b533 b661 )
    ( on b921 b533 )
    ( on b160 b921 )
    ( on b702 b160 )
    ( on b699 b702 )
    ( on b829 b699 )
    ( on b487 b829 )
    ( on b773 b487 )
    ( on b796 b773 )
    ( on b253 b796 )
    ( on b907 b253 )
    ( on b455 b907 )
    ( on b579 b455 )
    ( on b310 b579 )
    ( on b23 b310 )
    ( on b627 b23 )
    ( on b451 b627 )
    ( on b454 b451 )
    ( on b245 b454 )
    ( on b76 b245 )
    ( on b580 b76 )
    ( on b269 b580 )
    ( on b926 b269 )
    ( on b711 b926 )
    ( on b11 b711 )
    ( on b443 b11 )
    ( on b7 b443 )
    ( on b216 b7 )
    ( on b199 b216 )
    ( on b807 b199 )
    ( on b782 b807 )
    ( clear b782 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)
