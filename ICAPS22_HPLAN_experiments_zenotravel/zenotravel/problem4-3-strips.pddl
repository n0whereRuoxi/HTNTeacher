( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city499 - city
    city817 - city
    city731 - city
    city259 - city
    city787 - city
    person447 - person
    person601 - person
    person990 - person
    person384 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person447 city259 )
    ( person-at person601 city787 )
    ( person-at person990 city731 )
    ( person-at person384 city817 )
  )
  ( :goal
    ( and
      ( person-at person447 city000 )
      ( person-at person601 city000 )
      ( person-at person990 city000 )
      ( person-at person384 city000 )
    )
  )
)
