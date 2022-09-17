( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city705 - city
    city968 - city
    city934 - city
    city877 - city
    person631 - person
    person615 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person631 city934 )
    ( person-at person615 city934 )
  )
  ( :goal
    ( and
      ( person-at person631 city000 )
      ( person-at person615 city000 )
    )
  )
)
