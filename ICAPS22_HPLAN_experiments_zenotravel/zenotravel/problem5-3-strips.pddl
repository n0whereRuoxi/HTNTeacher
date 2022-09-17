( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city822 - city
    city353 - city
    city294 - city
    city498 - city
    city392 - city
    city453 - city
    person580 - person
    person692 - person
    person367 - person
    person390 - person
    person903 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person580 city353 )
    ( person-at person692 city453 )
    ( person-at person367 city498 )
    ( person-at person390 city822 )
    ( person-at person903 city822 )
  )
  ( :goal
    ( and
      ( person-at person580 city000 )
      ( person-at person692 city000 )
      ( person-at person367 city000 )
      ( person-at person390 city000 )
      ( person-at person903 city000 )
    )
  )
)
