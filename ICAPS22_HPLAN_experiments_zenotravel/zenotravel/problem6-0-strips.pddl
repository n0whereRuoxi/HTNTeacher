( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city441 - city
    city350 - city
    city882 - city
    city956 - city
    city897 - city
    city737 - city
    city394 - city
    city716 - city
    city366 - city
    city766 - city
    city749 - city
    person904 - person
    person616 - person
    person544 - person
    person400 - person
    person634 - person
    person786 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person904 city394 )
    ( person-at person616 city366 )
    ( person-at person544 city366 )
    ( person-at person400 city716 )
    ( person-at person634 city366 )
    ( person-at person786 city716 )
  )
  ( :goal
    ( and
      ( person-at person904 city000 )
      ( person-at person616 city000 )
      ( person-at person544 city000 )
      ( person-at person400 city000 )
      ( person-at person634 city000 )
      ( person-at person786 city000 )
    )
  )
)
