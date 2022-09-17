( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_826 - PERSON
      ?auto_825 - CITY
    )
    :vars
    (
      ?auto_829 - FLEVEL
      ?auto_828 - FLEVEL
      ?auto_830 - CITY
      ?auto_827 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_829 ?auto_828 ) ( PERSON-AT ?auto_826 ?auto_830 ) ( AIRCRAFT-AT ?auto_827 ?auto_825 ) ( FUEL-LEVEL ?auto_827 ?auto_829 ) ( not ( = ?auto_825 ?auto_830 ) ) ( not ( = ?auto_829 ?auto_828 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_827 ?auto_825 ?auto_829 ?auto_828 )
      ( !FLY ?auto_827 ?auto_825 ?auto_830 ?auto_828 ?auto_829 )
      ( !REFUEL ?auto_827 ?auto_830 ?auto_829 ?auto_828 )
      ( !BOARD ?auto_826 ?auto_827 ?auto_830 )
      ( !FLY ?auto_827 ?auto_830 ?auto_825 ?auto_828 ?auto_829 )
      ( !DEBARK ?auto_826 ?auto_827 ?auto_825 )
      ( FLY-1PPL-VERIFY ?auto_826 ?auto_825 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_849 - PERSON
      ?auto_850 - PERSON
      ?auto_848 - CITY
    )
    :vars
    (
      ?auto_851 - FLEVEL
      ?auto_853 - FLEVEL
      ?auto_852 - CITY
      ?auto_855 - CITY
      ?auto_854 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_851 ?auto_853 ) ( PERSON-AT ?auto_850 ?auto_852 ) ( not ( = ?auto_848 ?auto_852 ) ) ( not ( = ?auto_851 ?auto_853 ) ) ( PERSON-AT ?auto_849 ?auto_855 ) ( AIRCRAFT-AT ?auto_854 ?auto_848 ) ( FUEL-LEVEL ?auto_854 ?auto_851 ) ( not ( = ?auto_848 ?auto_855 ) ) ( not ( = ?auto_849 ?auto_850 ) ) ( not ( = ?auto_852 ?auto_855 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_849 ?auto_848 )
      ( FLY-1PPL ?auto_850 ?auto_848 )
      ( FLY-2PPL-VERIFY ?auto_849 ?auto_850 ?auto_848 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_963 - PERSON
      ?auto_964 - PERSON
      ?auto_965 - PERSON
      ?auto_962 - CITY
    )
    :vars
    (
      ?auto_969 - FLEVEL
      ?auto_967 - FLEVEL
      ?auto_968 - CITY
      ?auto_970 - CITY
      ?auto_966 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_969 ?auto_967 ) ( PERSON-AT ?auto_965 ?auto_968 ) ( not ( = ?auto_962 ?auto_968 ) ) ( not ( = ?auto_969 ?auto_967 ) ) ( PERSON-AT ?auto_964 ?auto_968 ) ( PERSON-AT ?auto_963 ?auto_970 ) ( AIRCRAFT-AT ?auto_966 ?auto_962 ) ( FUEL-LEVEL ?auto_966 ?auto_969 ) ( not ( = ?auto_962 ?auto_970 ) ) ( not ( = ?auto_963 ?auto_964 ) ) ( not ( = ?auto_968 ?auto_970 ) ) ( not ( = ?auto_963 ?auto_965 ) ) ( not ( = ?auto_964 ?auto_965 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_963 ?auto_964 ?auto_962 )
      ( FLY-1PPL ?auto_965 ?auto_962 )
      ( FLY-3PPL-VERIFY ?auto_963 ?auto_964 ?auto_965 ?auto_962 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_996 - PERSON
      ?auto_997 - PERSON
      ?auto_998 - PERSON
      ?auto_995 - CITY
    )
    :vars
    (
      ?auto_1001 - FLEVEL
      ?auto_999 - FLEVEL
      ?auto_1002 - CITY
      ?auto_1003 - CITY
      ?auto_1000 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1001 ?auto_999 ) ( PERSON-AT ?auto_998 ?auto_1002 ) ( not ( = ?auto_995 ?auto_1002 ) ) ( not ( = ?auto_1001 ?auto_999 ) ) ( PERSON-AT ?auto_996 ?auto_1002 ) ( PERSON-AT ?auto_997 ?auto_1003 ) ( AIRCRAFT-AT ?auto_1000 ?auto_995 ) ( FUEL-LEVEL ?auto_1000 ?auto_1001 ) ( not ( = ?auto_995 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_996 ) ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_998 ) ) ( not ( = ?auto_996 ?auto_998 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_997 ?auto_996 ?auto_998 ?auto_995 )
      ( FLY-3PPL-VERIFY ?auto_996 ?auto_997 ?auto_998 ?auto_995 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1015 - PERSON
      ?auto_1016 - PERSON
      ?auto_1017 - PERSON
      ?auto_1014 - CITY
    )
    :vars
    (
      ?auto_1019 - FLEVEL
      ?auto_1018 - FLEVEL
      ?auto_1020 - CITY
      ?auto_1021 - CITY
      ?auto_1022 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1019 ?auto_1018 ) ( PERSON-AT ?auto_1016 ?auto_1020 ) ( not ( = ?auto_1014 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1018 ) ) ( PERSON-AT ?auto_1015 ?auto_1020 ) ( PERSON-AT ?auto_1017 ?auto_1021 ) ( AIRCRAFT-AT ?auto_1022 ?auto_1014 ) ( FUEL-LEVEL ?auto_1022 ?auto_1019 ) ( not ( = ?auto_1014 ?auto_1021 ) ) ( not ( = ?auto_1017 ?auto_1015 ) ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1017 ?auto_1016 ) ) ( not ( = ?auto_1015 ?auto_1016 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1015 ?auto_1017 ?auto_1016 ?auto_1014 )
      ( FLY-3PPL-VERIFY ?auto_1015 ?auto_1016 ?auto_1017 ?auto_1014 ) )
  )

)

