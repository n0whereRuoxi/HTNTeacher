( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city347 - city
    city272 - city
    city889 - city
    city499 - city
    city132 - city
    city592 - city
    city952 - city
    person810 - person
    person857 - person
    person832 - person
    person432 - person
    person218 - person
    person278 - person
    person116 - person
    person142 - person
    person507 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person810 city272 )
    ( person-at person857 city132 )
    ( person-at person832 city889 )
    ( person-at person432 city889 )
    ( person-at person218 city592 )
    ( person-at person278 city592 )
    ( person-at person116 city272 )
    ( person-at person142 city347 )
    ( person-at person507 city132 )
  )
  ( :goal
    ( and
      ( person-at person810 city000 )
      ( person-at person857 city000 )
      ( person-at person832 city000 )
      ( person-at person432 city000 )
      ( person-at person218 city000 )
      ( person-at person278 city000 )
      ( person-at person116 city000 )
      ( person-at person142 city000 )
      ( person-at person507 city000 )
    )
  )
)
