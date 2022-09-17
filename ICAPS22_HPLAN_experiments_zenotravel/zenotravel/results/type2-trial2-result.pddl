( define ( domain zeno-travel )
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

  ( :method TRAVEL-VERIFY
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

  ( :method TRAVEL
    :parameters
    (
      ?auto_3 - PERSON
      ?auto_2 - CITY
    )
    :vars
    (
      ?auto_4 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3 ?auto_4 ) ( AIRCRAFT-AT ?auto_4 ?auto_2 ) )
    :subtasks
    ( ( !DEBARK ?auto_3 ?auto_4 ?auto_2 )
      ( TRAVEL-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_8 - PERSON
      ?auto_7 - CITY
    )
    :vars
    (
      ?auto_9 - AIRCRAFT
      ?auto_12 - CITY
      ?auto_10 - FLEVEL
      ?auto_11 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_8 ?auto_9 ) ( AIRCRAFT-AT ?auto_9 ?auto_12 ) ( FUEL-LEVEL ?auto_9 ?auto_10 ) ( NEXT ?auto_11 ?auto_10 ) ( not ( = ?auto_7 ?auto_12 ) ) ( not ( = ?auto_10 ?auto_11 ) ) )
    :subtasks
    ( ( !FLY ?auto_9 ?auto_12 ?auto_7 ?auto_10 ?auto_11 )
      ( TRAVEL ?auto_8 ?auto_7 )
      ( TRAVEL-VERIFY ?auto_8 ?auto_7 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_18 - PERSON
      ?auto_17 - CITY
    )
    :vars
    (
      ?auto_21 - AIRCRAFT
      ?auto_19 - CITY
      ?auto_20 - FLEVEL
      ?auto_22 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_21 ?auto_19 ) ( FUEL-LEVEL ?auto_21 ?auto_20 ) ( NEXT ?auto_22 ?auto_20 ) ( not ( = ?auto_17 ?auto_19 ) ) ( not ( = ?auto_20 ?auto_22 ) ) ( PERSON-AT ?auto_18 ?auto_19 ) )
    :subtasks
    ( ( !BOARD ?auto_18 ?auto_21 ?auto_19 )
      ( TRAVEL ?auto_18 ?auto_17 )
      ( TRAVEL-VERIFY ?auto_18 ?auto_17 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_24 - PERSON
      ?auto_23 - CITY
    )
    :vars
    (
      ?auto_28 - AIRCRAFT
      ?auto_25 - CITY
      ?auto_27 - FLEVEL
      ?auto_26 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_28 ?auto_25 ) ( NEXT ?auto_27 ?auto_26 ) ( not ( = ?auto_23 ?auto_25 ) ) ( not ( = ?auto_26 ?auto_27 ) ) ( PERSON-AT ?auto_24 ?auto_25 ) ( FUEL-LEVEL ?auto_28 ?auto_27 ) )
    :subtasks
    ( ( !REFUEL ?auto_28 ?auto_25 ?auto_27 ?auto_26 )
      ( TRAVEL ?auto_24 ?auto_23 )
      ( TRAVEL-VERIFY ?auto_24 ?auto_23 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_30 - PERSON
      ?auto_29 - CITY
    )
    :vars
    (
      ?auto_32 - FLEVEL
      ?auto_33 - FLEVEL
      ?auto_34 - CITY
      ?auto_31 - AIRCRAFT
      ?auto_35 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_32 ?auto_33 ) ( not ( = ?auto_29 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_32 ) ) ( PERSON-AT ?auto_30 ?auto_34 ) ( AIRCRAFT-AT ?auto_31 ?auto_35 ) ( FUEL-LEVEL ?auto_31 ?auto_33 ) ( not ( = ?auto_29 ?auto_35 ) ) ( not ( = ?auto_34 ?auto_35 ) ) )
    :subtasks
    ( ( !FLY ?auto_31 ?auto_35 ?auto_34 ?auto_33 ?auto_32 )
      ( TRAVEL ?auto_30 ?auto_29 )
      ( TRAVEL-VERIFY ?auto_30 ?auto_29 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_77 - PERSON
      ?auto_76 - CITY
    )
    :vars
    (
      ?auto_79 - AIRCRAFT
      ?auto_78 - CITY
      ?auto_80 - FLEVEL
      ?auto_81 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_77 ?auto_79 ) ( AIRCRAFT-AT ?auto_79 ?auto_78 ) ( NEXT ?auto_80 ?auto_81 ) ( not ( = ?auto_76 ?auto_78 ) ) ( not ( = ?auto_81 ?auto_80 ) ) ( FUEL-LEVEL ?auto_79 ?auto_80 ) )
    :subtasks
    ( ( !REFUEL ?auto_79 ?auto_78 ?auto_80 ?auto_81 )
      ( TRAVEL ?auto_77 ?auto_76 )
      ( TRAVEL-VERIFY ?auto_77 ?auto_76 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_85 - PERSON
      ?auto_84 - CITY
    )
    :vars
    (
      ?auto_89 - AIRCRAFT
      ?auto_86 - CITY
      ?auto_87 - FLEVEL
      ?auto_88 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_89 ?auto_86 ) ( NEXT ?auto_87 ?auto_88 ) ( not ( = ?auto_84 ?auto_86 ) ) ( not ( = ?auto_88 ?auto_87 ) ) ( FUEL-LEVEL ?auto_89 ?auto_87 ) ( PERSON-AT ?auto_85 ?auto_86 ) )
    :subtasks
    ( ( !BOARD ?auto_85 ?auto_89 ?auto_86 )
      ( TRAVEL ?auto_85 ?auto_84 )
      ( TRAVEL-VERIFY ?auto_85 ?auto_84 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_97 - PERSON
      ?auto_96 - CITY
    )
    :vars
    (
      ?auto_98 - FLEVEL
      ?auto_99 - FLEVEL
      ?auto_101 - CITY
      ?auto_100 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_98 ?auto_99 ) ( not ( = ?auto_96 ?auto_101 ) ) ( not ( = ?auto_99 ?auto_98 ) ) ( PERSON-AT ?auto_97 ?auto_101 ) ( AIRCRAFT-AT ?auto_100 ?auto_96 ) ( FUEL-LEVEL ?auto_100 ?auto_99 ) )
    :subtasks
    ( ( !FLY ?auto_100 ?auto_96 ?auto_101 ?auto_99 ?auto_98 )
      ( TRAVEL ?auto_97 ?auto_96 )
      ( TRAVEL-VERIFY ?auto_97 ?auto_96 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_175 - PERSON
      ?auto_174 - CITY
    )
    :vars
    (
      ?auto_178 - FLEVEL
      ?auto_180 - FLEVEL
      ?auto_179 - CITY
      ?auto_177 - AIRCRAFT
      ?auto_176 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_178 ?auto_180 ) ( not ( = ?auto_174 ?auto_179 ) ) ( not ( = ?auto_180 ?auto_178 ) ) ( PERSON-AT ?auto_175 ?auto_179 ) ( AIRCRAFT-AT ?auto_177 ?auto_176 ) ( not ( = ?auto_174 ?auto_176 ) ) ( not ( = ?auto_179 ?auto_176 ) ) ( FUEL-LEVEL ?auto_177 ?auto_178 ) )
    :subtasks
    ( ( !REFUEL ?auto_177 ?auto_176 ?auto_178 ?auto_180 )
      ( TRAVEL ?auto_175 ?auto_174 )
      ( TRAVEL-VERIFY ?auto_175 ?auto_174 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_451 - PERSON
      ?auto_450 - CITY
    )
    :vars
    (
      ?auto_456 - FLEVEL
      ?auto_452 - FLEVEL
      ?auto_453 - CITY
      ?auto_454 - CITY
      ?auto_455 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_456 ?auto_452 ) ( not ( = ?auto_450 ?auto_453 ) ) ( not ( = ?auto_452 ?auto_456 ) ) ( PERSON-AT ?auto_451 ?auto_453 ) ( not ( = ?auto_450 ?auto_454 ) ) ( not ( = ?auto_453 ?auto_454 ) ) ( AIRCRAFT-AT ?auto_455 ?auto_450 ) ( FUEL-LEVEL ?auto_455 ?auto_452 ) )
    :subtasks
    ( ( !FLY ?auto_455 ?auto_450 ?auto_454 ?auto_452 ?auto_456 )
      ( TRAVEL ?auto_451 ?auto_450 )
      ( TRAVEL-VERIFY ?auto_451 ?auto_450 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_601 - PERSON
      ?auto_600 - CITY
    )
    :vars
    (
      ?auto_605 - FLEVEL
      ?auto_603 - FLEVEL
      ?auto_602 - CITY
      ?auto_604 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_605 ?auto_603 ) ( not ( = ?auto_600 ?auto_602 ) ) ( not ( = ?auto_603 ?auto_605 ) ) ( PERSON-AT ?auto_601 ?auto_602 ) ( AIRCRAFT-AT ?auto_604 ?auto_600 ) ( FUEL-LEVEL ?auto_604 ?auto_605 ) )
    :subtasks
    ( ( !REFUEL ?auto_604 ?auto_600 ?auto_605 ?auto_603 )
      ( TRAVEL ?auto_601 ?auto_600 )
      ( TRAVEL-VERIFY ?auto_601 ?auto_600 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_712 - PERSON
      ?auto_711 - CITY
    )
    :vars
    (
      ?auto_714 - FLEVEL
      ?auto_716 - FLEVEL
      ?auto_713 - CITY
      ?auto_715 - AIRCRAFT
      ?auto_718 - CITY
      ?auto_717 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_714 ?auto_716 ) ( not ( = ?auto_711 ?auto_713 ) ) ( not ( = ?auto_716 ?auto_714 ) ) ( PERSON-AT ?auto_712 ?auto_713 ) ( AIRCRAFT-AT ?auto_715 ?auto_718 ) ( FUEL-LEVEL ?auto_715 ?auto_717 ) ( NEXT ?auto_716 ?auto_717 ) ( not ( = ?auto_711 ?auto_718 ) ) ( not ( = ?auto_714 ?auto_717 ) ) ( not ( = ?auto_716 ?auto_717 ) ) ( not ( = ?auto_713 ?auto_718 ) ) )
    :subtasks
    ( ( !FLY ?auto_715 ?auto_718 ?auto_711 ?auto_717 ?auto_716 )
      ( TRAVEL ?auto_712 ?auto_711 )
      ( TRAVEL-VERIFY ?auto_712 ?auto_711 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_725 - PERSON
      ?auto_724 - CITY
    )
    :vars
    (
      ?auto_726 - AIRCRAFT
      ?auto_730 - CITY
      ?auto_727 - FLEVEL
      ?auto_728 - FLEVEL
      ?auto_729 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_725 ?auto_726 ) ( AIRCRAFT-AT ?auto_726 ?auto_730 ) ( FUEL-LEVEL ?auto_726 ?auto_727 ) ( NEXT ?auto_728 ?auto_727 ) ( NEXT ?auto_729 ?auto_728 ) ( not ( = ?auto_724 ?auto_730 ) ) ( not ( = ?auto_727 ?auto_728 ) ) ( not ( = ?auto_727 ?auto_729 ) ) ( not ( = ?auto_728 ?auto_729 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_726 ?auto_730 ?auto_724 ?auto_727 ?auto_728 ?auto_729 )
      ( TRAVEL ?auto_725 ?auto_724 )
      ( TRAVEL-VERIFY ?auto_725 ?auto_724 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_770 - PERSON
      ?auto_769 - CITY
    )
    :vars
    (
      ?auto_773 - FLEVEL
      ?auto_774 - FLEVEL
      ?auto_772 - CITY
      ?auto_771 - AIRCRAFT
      ?auto_776 - CITY
      ?auto_775 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_773 ?auto_774 ) ( not ( = ?auto_769 ?auto_772 ) ) ( not ( = ?auto_774 ?auto_773 ) ) ( PERSON-AT ?auto_770 ?auto_772 ) ( AIRCRAFT-AT ?auto_771 ?auto_776 ) ( FUEL-LEVEL ?auto_771 ?auto_775 ) ( NEXT ?auto_774 ?auto_775 ) ( not ( = ?auto_769 ?auto_776 ) ) ( not ( = ?auto_773 ?auto_775 ) ) ( not ( = ?auto_774 ?auto_775 ) ) ( not ( = ?auto_772 ?auto_776 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_771 ?auto_776 ?auto_772 ?auto_775 ?auto_774 ?auto_773 )
      ( TRAVEL ?auto_770 ?auto_769 )
      ( TRAVEL-VERIFY ?auto_770 ?auto_769 ) )
  )

)

