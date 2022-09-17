( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city429 - city
    city41 - city
    city138 - city
    city855 - city
    city65 - city
    person810 - person
    person746 - person
    person430 - person
    person803 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person810 city429 )
    ( person-at person746 city429 )
    ( person-at person430 city855 )
    ( person-at person803 city429 )
  )
  ( :goal
    ( and
      ( person-at person810 city000 )
      ( person-at person746 city000 )
      ( person-at person430 city000 )
      ( person-at person803 city000 )
    )
  )
)
