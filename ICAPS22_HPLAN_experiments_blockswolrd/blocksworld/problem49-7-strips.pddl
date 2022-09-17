( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b458 - block
    b973 - block
    b65 - block
    b223 - block
    b845 - block
    b643 - block
    b539 - block
    b962 - block
    b792 - block
    b451 - block
    b651 - block
    b996 - block
    b257 - block
    b399 - block
    b462 - block
    b184 - block
    b339 - block
    b265 - block
    b681 - block
    b187 - block
    b308 - block
    b843 - block
    b859 - block
    b269 - block
    b828 - block
    b545 - block
    b603 - block
    b35 - block
    b882 - block
    b476 - block
    b441 - block
    b935 - block
    b705 - block
    b649 - block
    b535 - block
    b589 - block
    b36 - block
    b858 - block
    b638 - block
    b683 - block
    b888 - block
    b239 - block
    b183 - block
    b332 - block
    b435 - block
    b235 - block
    b185 - block
    b60 - block
    b423 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b458 )
    ( on b973 b458 )
    ( on b65 b973 )
    ( on b223 b65 )
    ( on b845 b223 )
    ( on b643 b845 )
    ( on b539 b643 )
    ( on b962 b539 )
    ( on b792 b962 )
    ( on b451 b792 )
    ( on b651 b451 )
    ( on b996 b651 )
    ( on b257 b996 )
    ( on b399 b257 )
    ( on b462 b399 )
    ( on b184 b462 )
    ( on b339 b184 )
    ( on b265 b339 )
    ( on b681 b265 )
    ( on b187 b681 )
    ( on b308 b187 )
    ( on b843 b308 )
    ( on b859 b843 )
    ( on b269 b859 )
    ( on b828 b269 )
    ( on b545 b828 )
    ( on b603 b545 )
    ( on b35 b603 )
    ( on b882 b35 )
    ( on b476 b882 )
    ( on b441 b476 )
    ( on b935 b441 )
    ( on b705 b935 )
    ( on b649 b705 )
    ( on b535 b649 )
    ( on b589 b535 )
    ( on b36 b589 )
    ( on b858 b36 )
    ( on b638 b858 )
    ( on b683 b638 )
    ( on b888 b683 )
    ( on b239 b888 )
    ( on b183 b239 )
    ( on b332 b183 )
    ( on b435 b332 )
    ( on b235 b435 )
    ( on b185 b235 )
    ( on b60 b185 )
    ( on b423 b60 )
    ( on b414 b423 )
    ( clear b414 )
  )
  ( :goal
    ( and
      ( clear b458 )
    )
  )
)
