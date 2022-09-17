( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    aircraft000 - aircraft
    city405 - city
    city607 - city
    city868 - city
    city723 - city
    city424 - city
    city60 - city
    city284 - city
    city454 - city
    city650 - city
    city500 - city
    city968 - city
    city447 - city
    city684 - city
    city50 - city
    city49 - city
    city962 - city
    city966 - city
    city909 - city
    city248 - city
    city623 - city
    city32 - city
    city893 - city
    city514 - city
    person142 - person
    person332 - person
    person97 - person
    person425 - person
    person553 - person
    person26 - person
    person103 - person
    person74 - person
    person733 - person
    person554 - person
    person889 - person
    person298 - person
    person648 - person
  )
  ( :init
    ( next level000 level001 )
    ( airport l000-000 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person142 city405 )
    ( person-at person332 city447 )
    ( person-at person97 city684 )
    ( person-at person425 city424 )
    ( person-at person553 city962 )
    ( person-at person26 city909 )
    ( person-at person103 city447 )
    ( person-at person74 city60 )
    ( person-at person733 city49 )
    ( person-at person554 city248 )
    ( person-at person889 city723 )
    ( person-at person298 city50 )
    ( person-at person648 city405 )
  )
  ( :tasks
    ( Fly-13Ppl person142 person332 person97 person425 person553 person26 person103 person74 person733 person554 person889 person298 person648 city000 )
  )
)
