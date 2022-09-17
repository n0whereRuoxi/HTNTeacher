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

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-5PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_106475 - PERSON
      ?auto_106474 - CITY
    )
    :vars
    (
      ?auto_106478 - FLEVEL
      ?auto_106477 - FLEVEL
      ?auto_106479 - CITY
      ?auto_106476 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_106478 ?auto_106477 ) ( PERSON-AT ?auto_106475 ?auto_106479 ) ( AIRCRAFT-AT ?auto_106476 ?auto_106474 ) ( FUEL-LEVEL ?auto_106476 ?auto_106478 ) ( not ( = ?auto_106474 ?auto_106479 ) ) ( not ( = ?auto_106478 ?auto_106477 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_106476 ?auto_106474 ?auto_106478 ?auto_106477 )
      ( !FLY ?auto_106476 ?auto_106474 ?auto_106479 ?auto_106477 ?auto_106478 )
      ( !REFUEL ?auto_106476 ?auto_106479 ?auto_106478 ?auto_106477 )
      ( !BOARD ?auto_106475 ?auto_106476 ?auto_106479 )
      ( !FLY ?auto_106476 ?auto_106479 ?auto_106474 ?auto_106477 ?auto_106478 )
      ( !DEBARK ?auto_106475 ?auto_106476 ?auto_106474 )
      ( FLY-1PPL-VERIFY ?auto_106475 ?auto_106474 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_106498 - PERSON
      ?auto_106499 - PERSON
      ?auto_106497 - CITY
    )
    :vars
    (
      ?auto_106502 - FLEVEL
      ?auto_106500 - FLEVEL
      ?auto_106501 - CITY
      ?auto_106504 - CITY
      ?auto_106503 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_106502 ?auto_106500 ) ( PERSON-AT ?auto_106499 ?auto_106501 ) ( not ( = ?auto_106497 ?auto_106501 ) ) ( not ( = ?auto_106502 ?auto_106500 ) ) ( PERSON-AT ?auto_106498 ?auto_106504 ) ( AIRCRAFT-AT ?auto_106503 ?auto_106497 ) ( FUEL-LEVEL ?auto_106503 ?auto_106502 ) ( not ( = ?auto_106497 ?auto_106504 ) ) ( not ( = ?auto_106498 ?auto_106499 ) ) ( not ( = ?auto_106501 ?auto_106504 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_106498 ?auto_106497 )
      ( FLY-1PPL ?auto_106499 ?auto_106497 )
      ( FLY-2PPL-VERIFY ?auto_106498 ?auto_106499 ?auto_106497 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_106612 - PERSON
      ?auto_106613 - PERSON
      ?auto_106614 - PERSON
      ?auto_106611 - CITY
    )
    :vars
    (
      ?auto_106615 - FLEVEL
      ?auto_106617 - FLEVEL
      ?auto_106616 - CITY
      ?auto_106619 - CITY
      ?auto_106618 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_106615 ?auto_106617 ) ( PERSON-AT ?auto_106614 ?auto_106616 ) ( not ( = ?auto_106611 ?auto_106616 ) ) ( not ( = ?auto_106615 ?auto_106617 ) ) ( PERSON-AT ?auto_106613 ?auto_106619 ) ( not ( = ?auto_106611 ?auto_106619 ) ) ( PERSON-AT ?auto_106612 ?auto_106616 ) ( AIRCRAFT-AT ?auto_106618 ?auto_106611 ) ( FUEL-LEVEL ?auto_106618 ?auto_106615 ) ( not ( = ?auto_106612 ?auto_106613 ) ) ( not ( = ?auto_106619 ?auto_106616 ) ) ( not ( = ?auto_106612 ?auto_106614 ) ) ( not ( = ?auto_106613 ?auto_106614 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_106612 ?auto_106613 ?auto_106611 )
      ( FLY-1PPL ?auto_106614 ?auto_106611 )
      ( FLY-3PPL-VERIFY ?auto_106612 ?auto_106613 ?auto_106614 ?auto_106611 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_106631 - PERSON
      ?auto_106632 - PERSON
      ?auto_106633 - PERSON
      ?auto_106630 - CITY
    )
    :vars
    (
      ?auto_106634 - FLEVEL
      ?auto_106635 - FLEVEL
      ?auto_106637 - CITY
      ?auto_106636 - CITY
      ?auto_106638 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_106634 ?auto_106635 ) ( PERSON-AT ?auto_106632 ?auto_106637 ) ( not ( = ?auto_106630 ?auto_106637 ) ) ( not ( = ?auto_106634 ?auto_106635 ) ) ( PERSON-AT ?auto_106633 ?auto_106636 ) ( not ( = ?auto_106630 ?auto_106636 ) ) ( PERSON-AT ?auto_106631 ?auto_106637 ) ( AIRCRAFT-AT ?auto_106638 ?auto_106630 ) ( FUEL-LEVEL ?auto_106638 ?auto_106634 ) ( not ( = ?auto_106631 ?auto_106633 ) ) ( not ( = ?auto_106636 ?auto_106637 ) ) ( not ( = ?auto_106631 ?auto_106632 ) ) ( not ( = ?auto_106633 ?auto_106632 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_106631 ?auto_106633 ?auto_106632 ?auto_106630 )
      ( FLY-3PPL-VERIFY ?auto_106631 ?auto_106632 ?auto_106633 ?auto_106630 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_106650 - PERSON
      ?auto_106651 - PERSON
      ?auto_106652 - PERSON
      ?auto_106649 - CITY
    )
    :vars
    (
      ?auto_106655 - FLEVEL
      ?auto_106653 - FLEVEL
      ?auto_106657 - CITY
      ?auto_106654 - CITY
      ?auto_106656 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_106655 ?auto_106653 ) ( PERSON-AT ?auto_106652 ?auto_106657 ) ( not ( = ?auto_106649 ?auto_106657 ) ) ( not ( = ?auto_106655 ?auto_106653 ) ) ( PERSON-AT ?auto_106650 ?auto_106654 ) ( not ( = ?auto_106649 ?auto_106654 ) ) ( PERSON-AT ?auto_106651 ?auto_106657 ) ( AIRCRAFT-AT ?auto_106656 ?auto_106649 ) ( FUEL-LEVEL ?auto_106656 ?auto_106655 ) ( not ( = ?auto_106651 ?auto_106650 ) ) ( not ( = ?auto_106654 ?auto_106657 ) ) ( not ( = ?auto_106651 ?auto_106652 ) ) ( not ( = ?auto_106650 ?auto_106652 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_106651 ?auto_106652 ?auto_106650 ?auto_106649 )
      ( FLY-3PPL-VERIFY ?auto_106650 ?auto_106651 ?auto_106652 ?auto_106649 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_107757 - PERSON
      ?auto_107758 - PERSON
      ?auto_107759 - PERSON
      ?auto_107760 - PERSON
      ?auto_107756 - CITY
    )
    :vars
    (
      ?auto_107764 - FLEVEL
      ?auto_107761 - FLEVEL
      ?auto_107762 - CITY
      ?auto_107765 - CITY
      ?auto_107763 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_107764 ?auto_107761 ) ( PERSON-AT ?auto_107760 ?auto_107762 ) ( not ( = ?auto_107756 ?auto_107762 ) ) ( not ( = ?auto_107764 ?auto_107761 ) ) ( PERSON-AT ?auto_107759 ?auto_107762 ) ( PERSON-AT ?auto_107758 ?auto_107765 ) ( not ( = ?auto_107756 ?auto_107765 ) ) ( PERSON-AT ?auto_107757 ?auto_107762 ) ( AIRCRAFT-AT ?auto_107763 ?auto_107756 ) ( FUEL-LEVEL ?auto_107763 ?auto_107764 ) ( not ( = ?auto_107757 ?auto_107758 ) ) ( not ( = ?auto_107765 ?auto_107762 ) ) ( not ( = ?auto_107757 ?auto_107759 ) ) ( not ( = ?auto_107758 ?auto_107759 ) ) ( not ( = ?auto_107757 ?auto_107760 ) ) ( not ( = ?auto_107758 ?auto_107760 ) ) ( not ( = ?auto_107759 ?auto_107760 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_107757 ?auto_107759 ?auto_107758 ?auto_107756 )
      ( FLY-1PPL ?auto_107760 ?auto_107756 )
      ( FLY-4PPL-VERIFY ?auto_107757 ?auto_107758 ?auto_107759 ?auto_107760 ?auto_107756 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_107816 - PERSON
      ?auto_107817 - PERSON
      ?auto_107818 - PERSON
      ?auto_107819 - PERSON
      ?auto_107815 - CITY
    )
    :vars
    (
      ?auto_107824 - FLEVEL
      ?auto_107823 - FLEVEL
      ?auto_107822 - CITY
      ?auto_107820 - CITY
      ?auto_107821 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_107824 ?auto_107823 ) ( PERSON-AT ?auto_107819 ?auto_107822 ) ( not ( = ?auto_107815 ?auto_107822 ) ) ( not ( = ?auto_107824 ?auto_107823 ) ) ( PERSON-AT ?auto_107817 ?auto_107822 ) ( PERSON-AT ?auto_107818 ?auto_107820 ) ( not ( = ?auto_107815 ?auto_107820 ) ) ( PERSON-AT ?auto_107816 ?auto_107822 ) ( AIRCRAFT-AT ?auto_107821 ?auto_107815 ) ( FUEL-LEVEL ?auto_107821 ?auto_107824 ) ( not ( = ?auto_107816 ?auto_107818 ) ) ( not ( = ?auto_107820 ?auto_107822 ) ) ( not ( = ?auto_107816 ?auto_107817 ) ) ( not ( = ?auto_107818 ?auto_107817 ) ) ( not ( = ?auto_107816 ?auto_107819 ) ) ( not ( = ?auto_107818 ?auto_107819 ) ) ( not ( = ?auto_107817 ?auto_107819 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_107816 ?auto_107818 ?auto_107817 ?auto_107819 ?auto_107815 )
      ( FLY-4PPL-VERIFY ?auto_107816 ?auto_107817 ?auto_107818 ?auto_107819 ?auto_107815 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_107848 - PERSON
      ?auto_107849 - PERSON
      ?auto_107850 - PERSON
      ?auto_107851 - PERSON
      ?auto_107847 - CITY
    )
    :vars
    (
      ?auto_107856 - FLEVEL
      ?auto_107852 - FLEVEL
      ?auto_107853 - CITY
      ?auto_107854 - CITY
      ?auto_107855 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_107856 ?auto_107852 ) ( PERSON-AT ?auto_107850 ?auto_107853 ) ( not ( = ?auto_107847 ?auto_107853 ) ) ( not ( = ?auto_107856 ?auto_107852 ) ) ( PERSON-AT ?auto_107849 ?auto_107853 ) ( PERSON-AT ?auto_107851 ?auto_107854 ) ( not ( = ?auto_107847 ?auto_107854 ) ) ( PERSON-AT ?auto_107848 ?auto_107853 ) ( AIRCRAFT-AT ?auto_107855 ?auto_107847 ) ( FUEL-LEVEL ?auto_107855 ?auto_107856 ) ( not ( = ?auto_107848 ?auto_107851 ) ) ( not ( = ?auto_107854 ?auto_107853 ) ) ( not ( = ?auto_107848 ?auto_107849 ) ) ( not ( = ?auto_107851 ?auto_107849 ) ) ( not ( = ?auto_107848 ?auto_107850 ) ) ( not ( = ?auto_107851 ?auto_107850 ) ) ( not ( = ?auto_107849 ?auto_107850 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_107848 ?auto_107849 ?auto_107851 ?auto_107850 ?auto_107847 )
      ( FLY-4PPL-VERIFY ?auto_107848 ?auto_107849 ?auto_107850 ?auto_107851 ?auto_107847 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_108070 - PERSON
      ?auto_108071 - PERSON
      ?auto_108072 - PERSON
      ?auto_108073 - PERSON
      ?auto_108069 - CITY
    )
    :vars
    (
      ?auto_108078 - FLEVEL
      ?auto_108074 - FLEVEL
      ?auto_108075 - CITY
      ?auto_108076 - CITY
      ?auto_108077 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_108078 ?auto_108074 ) ( PERSON-AT ?auto_108073 ?auto_108075 ) ( not ( = ?auto_108069 ?auto_108075 ) ) ( not ( = ?auto_108078 ?auto_108074 ) ) ( PERSON-AT ?auto_108072 ?auto_108075 ) ( PERSON-AT ?auto_108070 ?auto_108076 ) ( not ( = ?auto_108069 ?auto_108076 ) ) ( PERSON-AT ?auto_108071 ?auto_108075 ) ( AIRCRAFT-AT ?auto_108077 ?auto_108069 ) ( FUEL-LEVEL ?auto_108077 ?auto_108078 ) ( not ( = ?auto_108071 ?auto_108070 ) ) ( not ( = ?auto_108076 ?auto_108075 ) ) ( not ( = ?auto_108071 ?auto_108072 ) ) ( not ( = ?auto_108070 ?auto_108072 ) ) ( not ( = ?auto_108071 ?auto_108073 ) ) ( not ( = ?auto_108070 ?auto_108073 ) ) ( not ( = ?auto_108072 ?auto_108073 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_108071 ?auto_108072 ?auto_108070 ?auto_108073 ?auto_108069 )
      ( FLY-4PPL-VERIFY ?auto_108070 ?auto_108071 ?auto_108072 ?auto_108073 ?auto_108069 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_123240 - PERSON
      ?auto_123241 - PERSON
      ?auto_123242 - PERSON
      ?auto_123243 - PERSON
      ?auto_123244 - PERSON
      ?auto_123239 - CITY
    )
    :vars
    (
      ?auto_123246 - FLEVEL
      ?auto_123248 - FLEVEL
      ?auto_123247 - CITY
      ?auto_123249 - CITY
      ?auto_123250 - CITY
      ?auto_123245 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_123246 ?auto_123248 ) ( PERSON-AT ?auto_123244 ?auto_123247 ) ( not ( = ?auto_123239 ?auto_123247 ) ) ( not ( = ?auto_123246 ?auto_123248 ) ) ( PERSON-AT ?auto_123243 ?auto_123249 ) ( not ( = ?auto_123239 ?auto_123249 ) ) ( PERSON-AT ?auto_123242 ?auto_123249 ) ( PERSON-AT ?auto_123241 ?auto_123250 ) ( not ( = ?auto_123239 ?auto_123250 ) ) ( PERSON-AT ?auto_123240 ?auto_123249 ) ( AIRCRAFT-AT ?auto_123245 ?auto_123239 ) ( FUEL-LEVEL ?auto_123245 ?auto_123246 ) ( not ( = ?auto_123240 ?auto_123241 ) ) ( not ( = ?auto_123250 ?auto_123249 ) ) ( not ( = ?auto_123240 ?auto_123242 ) ) ( not ( = ?auto_123241 ?auto_123242 ) ) ( not ( = ?auto_123240 ?auto_123243 ) ) ( not ( = ?auto_123241 ?auto_123243 ) ) ( not ( = ?auto_123242 ?auto_123243 ) ) ( not ( = ?auto_123240 ?auto_123244 ) ) ( not ( = ?auto_123241 ?auto_123244 ) ) ( not ( = ?auto_123242 ?auto_123244 ) ) ( not ( = ?auto_123243 ?auto_123244 ) ) ( not ( = ?auto_123247 ?auto_123249 ) ) ( not ( = ?auto_123247 ?auto_123250 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_123240 ?auto_123242 ?auto_123241 ?auto_123243 ?auto_123239 )
      ( FLY-1PPL ?auto_123244 ?auto_123239 )
      ( FLY-5PPL-VERIFY ?auto_123240 ?auto_123241 ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123239 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_123291 - PERSON
      ?auto_123292 - PERSON
      ?auto_123293 - PERSON
      ?auto_123294 - PERSON
      ?auto_123295 - PERSON
      ?auto_123290 - CITY
    )
    :vars
    (
      ?auto_123300 - FLEVEL
      ?auto_123297 - FLEVEL
      ?auto_123298 - CITY
      ?auto_123299 - CITY
      ?auto_123301 - CITY
      ?auto_123296 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_123300 ?auto_123297 ) ( PERSON-AT ?auto_123294 ?auto_123298 ) ( not ( = ?auto_123290 ?auto_123298 ) ) ( not ( = ?auto_123300 ?auto_123297 ) ) ( PERSON-AT ?auto_123295 ?auto_123299 ) ( not ( = ?auto_123290 ?auto_123299 ) ) ( PERSON-AT ?auto_123293 ?auto_123299 ) ( PERSON-AT ?auto_123292 ?auto_123301 ) ( not ( = ?auto_123290 ?auto_123301 ) ) ( PERSON-AT ?auto_123291 ?auto_123299 ) ( AIRCRAFT-AT ?auto_123296 ?auto_123290 ) ( FUEL-LEVEL ?auto_123296 ?auto_123300 ) ( not ( = ?auto_123291 ?auto_123292 ) ) ( not ( = ?auto_123301 ?auto_123299 ) ) ( not ( = ?auto_123291 ?auto_123293 ) ) ( not ( = ?auto_123292 ?auto_123293 ) ) ( not ( = ?auto_123291 ?auto_123295 ) ) ( not ( = ?auto_123292 ?auto_123295 ) ) ( not ( = ?auto_123293 ?auto_123295 ) ) ( not ( = ?auto_123291 ?auto_123294 ) ) ( not ( = ?auto_123292 ?auto_123294 ) ) ( not ( = ?auto_123293 ?auto_123294 ) ) ( not ( = ?auto_123295 ?auto_123294 ) ) ( not ( = ?auto_123298 ?auto_123299 ) ) ( not ( = ?auto_123298 ?auto_123301 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_123291 ?auto_123292 ?auto_123293 ?auto_123295 ?auto_123294 ?auto_123290 )
      ( FLY-5PPL-VERIFY ?auto_123291 ?auto_123292 ?auto_123293 ?auto_123294 ?auto_123295 ?auto_123290 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_123594 - PERSON
      ?auto_123595 - PERSON
      ?auto_123596 - PERSON
      ?auto_123597 - PERSON
      ?auto_123598 - PERSON
      ?auto_123593 - CITY
    )
    :vars
    (
      ?auto_123603 - FLEVEL
      ?auto_123601 - FLEVEL
      ?auto_123602 - CITY
      ?auto_123600 - CITY
      ?auto_123599 - CITY
      ?auto_123604 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_123603 ?auto_123601 ) ( PERSON-AT ?auto_123596 ?auto_123602 ) ( not ( = ?auto_123593 ?auto_123602 ) ) ( not ( = ?auto_123603 ?auto_123601 ) ) ( PERSON-AT ?auto_123598 ?auto_123600 ) ( not ( = ?auto_123593 ?auto_123600 ) ) ( PERSON-AT ?auto_123597 ?auto_123600 ) ( PERSON-AT ?auto_123595 ?auto_123599 ) ( not ( = ?auto_123593 ?auto_123599 ) ) ( PERSON-AT ?auto_123594 ?auto_123600 ) ( AIRCRAFT-AT ?auto_123604 ?auto_123593 ) ( FUEL-LEVEL ?auto_123604 ?auto_123603 ) ( not ( = ?auto_123594 ?auto_123595 ) ) ( not ( = ?auto_123599 ?auto_123600 ) ) ( not ( = ?auto_123594 ?auto_123597 ) ) ( not ( = ?auto_123595 ?auto_123597 ) ) ( not ( = ?auto_123594 ?auto_123598 ) ) ( not ( = ?auto_123595 ?auto_123598 ) ) ( not ( = ?auto_123597 ?auto_123598 ) ) ( not ( = ?auto_123594 ?auto_123596 ) ) ( not ( = ?auto_123595 ?auto_123596 ) ) ( not ( = ?auto_123597 ?auto_123596 ) ) ( not ( = ?auto_123598 ?auto_123596 ) ) ( not ( = ?auto_123602 ?auto_123600 ) ) ( not ( = ?auto_123602 ?auto_123599 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_123594 ?auto_123595 ?auto_123597 ?auto_123596 ?auto_123598 ?auto_123593 )
      ( FLY-5PPL-VERIFY ?auto_123594 ?auto_123595 ?auto_123596 ?auto_123597 ?auto_123598 ?auto_123593 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_123906 - PERSON
      ?auto_123907 - PERSON
      ?auto_123908 - PERSON
      ?auto_123909 - PERSON
      ?auto_123910 - PERSON
      ?auto_123905 - CITY
    )
    :vars
    (
      ?auto_123915 - FLEVEL
      ?auto_123913 - FLEVEL
      ?auto_123914 - CITY
      ?auto_123912 - CITY
      ?auto_123911 - CITY
      ?auto_123916 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_123915 ?auto_123913 ) ( PERSON-AT ?auto_123910 ?auto_123914 ) ( not ( = ?auto_123905 ?auto_123914 ) ) ( not ( = ?auto_123915 ?auto_123913 ) ) ( PERSON-AT ?auto_123909 ?auto_123912 ) ( not ( = ?auto_123905 ?auto_123912 ) ) ( PERSON-AT ?auto_123907 ?auto_123912 ) ( PERSON-AT ?auto_123908 ?auto_123911 ) ( not ( = ?auto_123905 ?auto_123911 ) ) ( PERSON-AT ?auto_123906 ?auto_123912 ) ( AIRCRAFT-AT ?auto_123916 ?auto_123905 ) ( FUEL-LEVEL ?auto_123916 ?auto_123915 ) ( not ( = ?auto_123906 ?auto_123908 ) ) ( not ( = ?auto_123911 ?auto_123912 ) ) ( not ( = ?auto_123906 ?auto_123907 ) ) ( not ( = ?auto_123908 ?auto_123907 ) ) ( not ( = ?auto_123906 ?auto_123909 ) ) ( not ( = ?auto_123908 ?auto_123909 ) ) ( not ( = ?auto_123907 ?auto_123909 ) ) ( not ( = ?auto_123906 ?auto_123910 ) ) ( not ( = ?auto_123908 ?auto_123910 ) ) ( not ( = ?auto_123907 ?auto_123910 ) ) ( not ( = ?auto_123909 ?auto_123910 ) ) ( not ( = ?auto_123914 ?auto_123912 ) ) ( not ( = ?auto_123914 ?auto_123911 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_123906 ?auto_123908 ?auto_123907 ?auto_123910 ?auto_123909 ?auto_123905 )
      ( FLY-5PPL-VERIFY ?auto_123906 ?auto_123907 ?auto_123908 ?auto_123909 ?auto_123910 ?auto_123905 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_123957 - PERSON
      ?auto_123958 - PERSON
      ?auto_123959 - PERSON
      ?auto_123960 - PERSON
      ?auto_123961 - PERSON
      ?auto_123956 - CITY
    )
    :vars
    (
      ?auto_123966 - FLEVEL
      ?auto_123964 - FLEVEL
      ?auto_123965 - CITY
      ?auto_123963 - CITY
      ?auto_123962 - CITY
      ?auto_123967 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_123966 ?auto_123964 ) ( PERSON-AT ?auto_123960 ?auto_123965 ) ( not ( = ?auto_123956 ?auto_123965 ) ) ( not ( = ?auto_123966 ?auto_123964 ) ) ( PERSON-AT ?auto_123961 ?auto_123963 ) ( not ( = ?auto_123956 ?auto_123963 ) ) ( PERSON-AT ?auto_123958 ?auto_123963 ) ( PERSON-AT ?auto_123959 ?auto_123962 ) ( not ( = ?auto_123956 ?auto_123962 ) ) ( PERSON-AT ?auto_123957 ?auto_123963 ) ( AIRCRAFT-AT ?auto_123967 ?auto_123956 ) ( FUEL-LEVEL ?auto_123967 ?auto_123966 ) ( not ( = ?auto_123957 ?auto_123959 ) ) ( not ( = ?auto_123962 ?auto_123963 ) ) ( not ( = ?auto_123957 ?auto_123958 ) ) ( not ( = ?auto_123959 ?auto_123958 ) ) ( not ( = ?auto_123957 ?auto_123961 ) ) ( not ( = ?auto_123959 ?auto_123961 ) ) ( not ( = ?auto_123958 ?auto_123961 ) ) ( not ( = ?auto_123957 ?auto_123960 ) ) ( not ( = ?auto_123959 ?auto_123960 ) ) ( not ( = ?auto_123958 ?auto_123960 ) ) ( not ( = ?auto_123961 ?auto_123960 ) ) ( not ( = ?auto_123965 ?auto_123963 ) ) ( not ( = ?auto_123965 ?auto_123962 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_123957 ?auto_123959 ?auto_123958 ?auto_123960 ?auto_123961 ?auto_123956 )
      ( FLY-5PPL-VERIFY ?auto_123957 ?auto_123958 ?auto_123959 ?auto_123960 ?auto_123961 ?auto_123956 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_124117 - PERSON
      ?auto_124118 - PERSON
      ?auto_124119 - PERSON
      ?auto_124120 - PERSON
      ?auto_124121 - PERSON
      ?auto_124116 - CITY
    )
    :vars
    (
      ?auto_124126 - FLEVEL
      ?auto_124124 - FLEVEL
      ?auto_124125 - CITY
      ?auto_124123 - CITY
      ?auto_124122 - CITY
      ?auto_124127 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_124126 ?auto_124124 ) ( PERSON-AT ?auto_124121 ?auto_124125 ) ( not ( = ?auto_124116 ?auto_124125 ) ) ( not ( = ?auto_124126 ?auto_124124 ) ) ( PERSON-AT ?auto_124119 ?auto_124123 ) ( not ( = ?auto_124116 ?auto_124123 ) ) ( PERSON-AT ?auto_124118 ?auto_124123 ) ( PERSON-AT ?auto_124120 ?auto_124122 ) ( not ( = ?auto_124116 ?auto_124122 ) ) ( PERSON-AT ?auto_124117 ?auto_124123 ) ( AIRCRAFT-AT ?auto_124127 ?auto_124116 ) ( FUEL-LEVEL ?auto_124127 ?auto_124126 ) ( not ( = ?auto_124117 ?auto_124120 ) ) ( not ( = ?auto_124122 ?auto_124123 ) ) ( not ( = ?auto_124117 ?auto_124118 ) ) ( not ( = ?auto_124120 ?auto_124118 ) ) ( not ( = ?auto_124117 ?auto_124119 ) ) ( not ( = ?auto_124120 ?auto_124119 ) ) ( not ( = ?auto_124118 ?auto_124119 ) ) ( not ( = ?auto_124117 ?auto_124121 ) ) ( not ( = ?auto_124120 ?auto_124121 ) ) ( not ( = ?auto_124118 ?auto_124121 ) ) ( not ( = ?auto_124119 ?auto_124121 ) ) ( not ( = ?auto_124125 ?auto_124123 ) ) ( not ( = ?auto_124125 ?auto_124122 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_124117 ?auto_124120 ?auto_124118 ?auto_124121 ?auto_124119 ?auto_124116 )
      ( FLY-5PPL-VERIFY ?auto_124117 ?auto_124118 ?auto_124119 ?auto_124120 ?auto_124121 ?auto_124116 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_127242 - PERSON
      ?auto_127243 - PERSON
      ?auto_127244 - PERSON
      ?auto_127245 - PERSON
      ?auto_127246 - PERSON
      ?auto_127241 - CITY
    )
    :vars
    (
      ?auto_127251 - FLEVEL
      ?auto_127249 - FLEVEL
      ?auto_127250 - CITY
      ?auto_127248 - CITY
      ?auto_127247 - CITY
      ?auto_127252 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_127251 ?auto_127249 ) ( PERSON-AT ?auto_127246 ?auto_127250 ) ( not ( = ?auto_127241 ?auto_127250 ) ) ( not ( = ?auto_127251 ?auto_127249 ) ) ( PERSON-AT ?auto_127245 ?auto_127248 ) ( not ( = ?auto_127241 ?auto_127248 ) ) ( PERSON-AT ?auto_127244 ?auto_127248 ) ( PERSON-AT ?auto_127242 ?auto_127247 ) ( not ( = ?auto_127241 ?auto_127247 ) ) ( PERSON-AT ?auto_127243 ?auto_127248 ) ( AIRCRAFT-AT ?auto_127252 ?auto_127241 ) ( FUEL-LEVEL ?auto_127252 ?auto_127251 ) ( not ( = ?auto_127243 ?auto_127242 ) ) ( not ( = ?auto_127247 ?auto_127248 ) ) ( not ( = ?auto_127243 ?auto_127244 ) ) ( not ( = ?auto_127242 ?auto_127244 ) ) ( not ( = ?auto_127243 ?auto_127245 ) ) ( not ( = ?auto_127242 ?auto_127245 ) ) ( not ( = ?auto_127244 ?auto_127245 ) ) ( not ( = ?auto_127243 ?auto_127246 ) ) ( not ( = ?auto_127242 ?auto_127246 ) ) ( not ( = ?auto_127244 ?auto_127246 ) ) ( not ( = ?auto_127245 ?auto_127246 ) ) ( not ( = ?auto_127250 ?auto_127248 ) ) ( not ( = ?auto_127250 ?auto_127247 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_127243 ?auto_127242 ?auto_127244 ?auto_127246 ?auto_127245 ?auto_127241 )
      ( FLY-5PPL-VERIFY ?auto_127242 ?auto_127243 ?auto_127244 ?auto_127245 ?auto_127246 ?auto_127241 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_127293 - PERSON
      ?auto_127294 - PERSON
      ?auto_127295 - PERSON
      ?auto_127296 - PERSON
      ?auto_127297 - PERSON
      ?auto_127292 - CITY
    )
    :vars
    (
      ?auto_127302 - FLEVEL
      ?auto_127300 - FLEVEL
      ?auto_127301 - CITY
      ?auto_127299 - CITY
      ?auto_127298 - CITY
      ?auto_127303 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_127302 ?auto_127300 ) ( PERSON-AT ?auto_127296 ?auto_127301 ) ( not ( = ?auto_127292 ?auto_127301 ) ) ( not ( = ?auto_127302 ?auto_127300 ) ) ( PERSON-AT ?auto_127297 ?auto_127299 ) ( not ( = ?auto_127292 ?auto_127299 ) ) ( PERSON-AT ?auto_127295 ?auto_127299 ) ( PERSON-AT ?auto_127293 ?auto_127298 ) ( not ( = ?auto_127292 ?auto_127298 ) ) ( PERSON-AT ?auto_127294 ?auto_127299 ) ( AIRCRAFT-AT ?auto_127303 ?auto_127292 ) ( FUEL-LEVEL ?auto_127303 ?auto_127302 ) ( not ( = ?auto_127294 ?auto_127293 ) ) ( not ( = ?auto_127298 ?auto_127299 ) ) ( not ( = ?auto_127294 ?auto_127295 ) ) ( not ( = ?auto_127293 ?auto_127295 ) ) ( not ( = ?auto_127294 ?auto_127297 ) ) ( not ( = ?auto_127293 ?auto_127297 ) ) ( not ( = ?auto_127295 ?auto_127297 ) ) ( not ( = ?auto_127294 ?auto_127296 ) ) ( not ( = ?auto_127293 ?auto_127296 ) ) ( not ( = ?auto_127295 ?auto_127296 ) ) ( not ( = ?auto_127297 ?auto_127296 ) ) ( not ( = ?auto_127301 ?auto_127299 ) ) ( not ( = ?auto_127301 ?auto_127298 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_127294 ?auto_127293 ?auto_127295 ?auto_127296 ?auto_127297 ?auto_127292 )
      ( FLY-5PPL-VERIFY ?auto_127293 ?auto_127294 ?auto_127295 ?auto_127296 ?auto_127297 ?auto_127292 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_127596 - PERSON
      ?auto_127597 - PERSON
      ?auto_127598 - PERSON
      ?auto_127599 - PERSON
      ?auto_127600 - PERSON
      ?auto_127595 - CITY
    )
    :vars
    (
      ?auto_127605 - FLEVEL
      ?auto_127603 - FLEVEL
      ?auto_127604 - CITY
      ?auto_127602 - CITY
      ?auto_127601 - CITY
      ?auto_127606 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_127605 ?auto_127603 ) ( PERSON-AT ?auto_127598 ?auto_127604 ) ( not ( = ?auto_127595 ?auto_127604 ) ) ( not ( = ?auto_127605 ?auto_127603 ) ) ( PERSON-AT ?auto_127600 ?auto_127602 ) ( not ( = ?auto_127595 ?auto_127602 ) ) ( PERSON-AT ?auto_127599 ?auto_127602 ) ( PERSON-AT ?auto_127596 ?auto_127601 ) ( not ( = ?auto_127595 ?auto_127601 ) ) ( PERSON-AT ?auto_127597 ?auto_127602 ) ( AIRCRAFT-AT ?auto_127606 ?auto_127595 ) ( FUEL-LEVEL ?auto_127606 ?auto_127605 ) ( not ( = ?auto_127597 ?auto_127596 ) ) ( not ( = ?auto_127601 ?auto_127602 ) ) ( not ( = ?auto_127597 ?auto_127599 ) ) ( not ( = ?auto_127596 ?auto_127599 ) ) ( not ( = ?auto_127597 ?auto_127600 ) ) ( not ( = ?auto_127596 ?auto_127600 ) ) ( not ( = ?auto_127599 ?auto_127600 ) ) ( not ( = ?auto_127597 ?auto_127598 ) ) ( not ( = ?auto_127596 ?auto_127598 ) ) ( not ( = ?auto_127599 ?auto_127598 ) ) ( not ( = ?auto_127600 ?auto_127598 ) ) ( not ( = ?auto_127604 ?auto_127602 ) ) ( not ( = ?auto_127604 ?auto_127601 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_127597 ?auto_127596 ?auto_127599 ?auto_127598 ?auto_127600 ?auto_127595 )
      ( FLY-5PPL-VERIFY ?auto_127596 ?auto_127597 ?auto_127598 ?auto_127599 ?auto_127600 ?auto_127595 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_130305 - PERSON
      ?auto_130306 - PERSON
      ?auto_130307 - PERSON
      ?auto_130308 - PERSON
      ?auto_130309 - PERSON
      ?auto_130304 - CITY
    )
    :vars
    (
      ?auto_130314 - FLEVEL
      ?auto_130312 - FLEVEL
      ?auto_130313 - CITY
      ?auto_130311 - CITY
      ?auto_130310 - CITY
      ?auto_130315 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_130314 ?auto_130312 ) ( PERSON-AT ?auto_130306 ?auto_130313 ) ( not ( = ?auto_130304 ?auto_130313 ) ) ( not ( = ?auto_130314 ?auto_130312 ) ) ( PERSON-AT ?auto_130309 ?auto_130311 ) ( not ( = ?auto_130304 ?auto_130311 ) ) ( PERSON-AT ?auto_130308 ?auto_130311 ) ( PERSON-AT ?auto_130305 ?auto_130310 ) ( not ( = ?auto_130304 ?auto_130310 ) ) ( PERSON-AT ?auto_130307 ?auto_130311 ) ( AIRCRAFT-AT ?auto_130315 ?auto_130304 ) ( FUEL-LEVEL ?auto_130315 ?auto_130314 ) ( not ( = ?auto_130307 ?auto_130305 ) ) ( not ( = ?auto_130310 ?auto_130311 ) ) ( not ( = ?auto_130307 ?auto_130308 ) ) ( not ( = ?auto_130305 ?auto_130308 ) ) ( not ( = ?auto_130307 ?auto_130309 ) ) ( not ( = ?auto_130305 ?auto_130309 ) ) ( not ( = ?auto_130308 ?auto_130309 ) ) ( not ( = ?auto_130307 ?auto_130306 ) ) ( not ( = ?auto_130305 ?auto_130306 ) ) ( not ( = ?auto_130308 ?auto_130306 ) ) ( not ( = ?auto_130309 ?auto_130306 ) ) ( not ( = ?auto_130313 ?auto_130311 ) ) ( not ( = ?auto_130313 ?auto_130310 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_130307 ?auto_130305 ?auto_130308 ?auto_130306 ?auto_130309 ?auto_130304 )
      ( FLY-5PPL-VERIFY ?auto_130305 ?auto_130306 ?auto_130307 ?auto_130308 ?auto_130309 ?auto_130304 ) )
  )

)

