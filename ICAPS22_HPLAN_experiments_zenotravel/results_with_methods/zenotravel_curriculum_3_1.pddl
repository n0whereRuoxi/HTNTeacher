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
      ?auto_585 - PERSON
      ?auto_584 - CITY
    )
    :vars
    (
      ?auto_588 - FLEVEL
      ?auto_587 - FLEVEL
      ?auto_589 - CITY
      ?auto_586 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_588 ?auto_587 ) ( PERSON-AT ?auto_585 ?auto_589 ) ( AIRCRAFT-AT ?auto_586 ?auto_584 ) ( FUEL-LEVEL ?auto_586 ?auto_588 ) ( not ( = ?auto_584 ?auto_589 ) ) ( not ( = ?auto_588 ?auto_587 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_586 ?auto_584 ?auto_588 ?auto_587 )
      ( !FLY ?auto_586 ?auto_584 ?auto_589 ?auto_587 ?auto_588 )
      ( !REFUEL ?auto_586 ?auto_589 ?auto_588 ?auto_587 )
      ( !BOARD ?auto_585 ?auto_586 ?auto_589 )
      ( !FLY ?auto_586 ?auto_589 ?auto_584 ?auto_587 ?auto_588 )
      ( !DEBARK ?auto_585 ?auto_586 ?auto_584 )
      ( FLY-1PPL-VERIFY ?auto_585 ?auto_584 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_593 - PERSON
      ?auto_592 - CITY
    )
    :vars
    (
      ?auto_596 - FLEVEL
      ?auto_595 - FLEVEL
      ?auto_597 - CITY
      ?auto_594 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_596 ?auto_595 ) ( PERSON-AT ?auto_593 ?auto_597 ) ( AIRCRAFT-AT ?auto_594 ?auto_592 ) ( FUEL-LEVEL ?auto_594 ?auto_596 ) ( not ( = ?auto_592 ?auto_597 ) ) ( not ( = ?auto_596 ?auto_595 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_594 ?auto_592 ?auto_596 ?auto_595 )
      ( !FLY ?auto_594 ?auto_592 ?auto_597 ?auto_595 ?auto_596 )
      ( !REFUEL ?auto_594 ?auto_597 ?auto_596 ?auto_595 )
      ( !BOARD ?auto_593 ?auto_594 ?auto_597 )
      ( !FLY ?auto_594 ?auto_597 ?auto_592 ?auto_595 ?auto_596 )
      ( !DEBARK ?auto_593 ?auto_594 ?auto_592 )
      ( FLY-1PPL-VERIFY ?auto_593 ?auto_592 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_608 - PERSON
      ?auto_609 - PERSON
      ?auto_607 - CITY
    )
    :vars
    (
      ?auto_612 - FLEVEL
      ?auto_613 - FLEVEL
      ?auto_610 - CITY
      ?auto_614 - CITY
      ?auto_611 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_612 ?auto_613 ) ( PERSON-AT ?auto_609 ?auto_610 ) ( not ( = ?auto_607 ?auto_610 ) ) ( not ( = ?auto_612 ?auto_613 ) ) ( PERSON-AT ?auto_608 ?auto_614 ) ( AIRCRAFT-AT ?auto_611 ?auto_607 ) ( FUEL-LEVEL ?auto_611 ?auto_612 ) ( not ( = ?auto_607 ?auto_614 ) ) ( not ( = ?auto_608 ?auto_609 ) ) ( not ( = ?auto_610 ?auto_614 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_608 ?auto_607 )
      ( FLY-1PPL ?auto_609 ?auto_607 )
      ( FLY-2PPL-VERIFY ?auto_608 ?auto_609 ?auto_607 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_616 - PERSON
      ?auto_617 - PERSON
      ?auto_615 - CITY
    )
    :vars
    (
      ?auto_618 - FLEVEL
      ?auto_619 - FLEVEL
      ?auto_621 - CITY
      ?auto_620 - CITY
      ?auto_622 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_618 ?auto_619 ) ( PERSON-AT ?auto_616 ?auto_621 ) ( not ( = ?auto_615 ?auto_621 ) ) ( not ( = ?auto_618 ?auto_619 ) ) ( PERSON-AT ?auto_617 ?auto_620 ) ( AIRCRAFT-AT ?auto_622 ?auto_615 ) ( FUEL-LEVEL ?auto_622 ?auto_618 ) ( not ( = ?auto_615 ?auto_620 ) ) ( not ( = ?auto_617 ?auto_616 ) ) ( not ( = ?auto_621 ?auto_620 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_617 ?auto_616 ?auto_615 )
      ( FLY-2PPL-VERIFY ?auto_616 ?auto_617 ?auto_615 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_635 - PERSON
      ?auto_634 - CITY
    )
    :vars
    (
      ?auto_638 - FLEVEL
      ?auto_637 - FLEVEL
      ?auto_639 - CITY
      ?auto_636 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_638 ?auto_637 ) ( PERSON-AT ?auto_635 ?auto_639 ) ( AIRCRAFT-AT ?auto_636 ?auto_634 ) ( FUEL-LEVEL ?auto_636 ?auto_638 ) ( not ( = ?auto_634 ?auto_639 ) ) ( not ( = ?auto_638 ?auto_637 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_636 ?auto_634 ?auto_638 ?auto_637 )
      ( !FLY ?auto_636 ?auto_634 ?auto_639 ?auto_637 ?auto_638 )
      ( !REFUEL ?auto_636 ?auto_639 ?auto_638 ?auto_637 )
      ( !BOARD ?auto_635 ?auto_636 ?auto_639 )
      ( !FLY ?auto_636 ?auto_639 ?auto_634 ?auto_637 ?auto_638 )
      ( !DEBARK ?auto_635 ?auto_636 ?auto_634 )
      ( FLY-1PPL-VERIFY ?auto_635 ?auto_634 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_727 - PERSON
      ?auto_728 - PERSON
      ?auto_729 - PERSON
      ?auto_726 - CITY
    )
    :vars
    (
      ?auto_732 - FLEVEL
      ?auto_733 - FLEVEL
      ?auto_731 - CITY
      ?auto_734 - CITY
      ?auto_730 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_732 ?auto_733 ) ( PERSON-AT ?auto_729 ?auto_731 ) ( not ( = ?auto_726 ?auto_731 ) ) ( not ( = ?auto_732 ?auto_733 ) ) ( PERSON-AT ?auto_728 ?auto_731 ) ( PERSON-AT ?auto_727 ?auto_734 ) ( AIRCRAFT-AT ?auto_730 ?auto_726 ) ( FUEL-LEVEL ?auto_730 ?auto_732 ) ( not ( = ?auto_726 ?auto_734 ) ) ( not ( = ?auto_727 ?auto_728 ) ) ( not ( = ?auto_731 ?auto_734 ) ) ( not ( = ?auto_727 ?auto_729 ) ) ( not ( = ?auto_728 ?auto_729 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_728 ?auto_727 ?auto_726 )
      ( FLY-1PPL ?auto_729 ?auto_726 )
      ( FLY-3PPL-VERIFY ?auto_727 ?auto_728 ?auto_729 ?auto_726 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_746 - PERSON
      ?auto_747 - PERSON
      ?auto_748 - PERSON
      ?auto_745 - CITY
    )
    :vars
    (
      ?auto_753 - FLEVEL
      ?auto_749 - FLEVEL
      ?auto_750 - CITY
      ?auto_751 - CITY
      ?auto_752 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_753 ?auto_749 ) ( PERSON-AT ?auto_747 ?auto_750 ) ( not ( = ?auto_745 ?auto_750 ) ) ( not ( = ?auto_753 ?auto_749 ) ) ( PERSON-AT ?auto_748 ?auto_750 ) ( PERSON-AT ?auto_746 ?auto_751 ) ( AIRCRAFT-AT ?auto_752 ?auto_745 ) ( FUEL-LEVEL ?auto_752 ?auto_753 ) ( not ( = ?auto_745 ?auto_751 ) ) ( not ( = ?auto_746 ?auto_748 ) ) ( not ( = ?auto_750 ?auto_751 ) ) ( not ( = ?auto_746 ?auto_747 ) ) ( not ( = ?auto_748 ?auto_747 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_746 ?auto_748 ?auto_747 ?auto_745 )
      ( FLY-3PPL-VERIFY ?auto_746 ?auto_747 ?auto_748 ?auto_745 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_765 - PERSON
      ?auto_766 - PERSON
      ?auto_767 - PERSON
      ?auto_764 - CITY
    )
    :vars
    (
      ?auto_769 - FLEVEL
      ?auto_772 - FLEVEL
      ?auto_768 - CITY
      ?auto_771 - CITY
      ?auto_770 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_769 ?auto_772 ) ( PERSON-AT ?auto_767 ?auto_768 ) ( not ( = ?auto_764 ?auto_768 ) ) ( not ( = ?auto_769 ?auto_772 ) ) ( PERSON-AT ?auto_765 ?auto_768 ) ( PERSON-AT ?auto_766 ?auto_771 ) ( AIRCRAFT-AT ?auto_770 ?auto_764 ) ( FUEL-LEVEL ?auto_770 ?auto_769 ) ( not ( = ?auto_764 ?auto_771 ) ) ( not ( = ?auto_766 ?auto_765 ) ) ( not ( = ?auto_768 ?auto_771 ) ) ( not ( = ?auto_766 ?auto_767 ) ) ( not ( = ?auto_765 ?auto_767 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_766 ?auto_767 ?auto_765 ?auto_764 )
      ( FLY-3PPL-VERIFY ?auto_765 ?auto_766 ?auto_767 ?auto_764 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_784 - PERSON
      ?auto_785 - PERSON
      ?auto_786 - PERSON
      ?auto_783 - CITY
    )
    :vars
    (
      ?auto_788 - FLEVEL
      ?auto_791 - FLEVEL
      ?auto_787 - CITY
      ?auto_790 - CITY
      ?auto_789 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_788 ?auto_791 ) ( PERSON-AT ?auto_785 ?auto_787 ) ( not ( = ?auto_783 ?auto_787 ) ) ( not ( = ?auto_788 ?auto_791 ) ) ( PERSON-AT ?auto_784 ?auto_787 ) ( PERSON-AT ?auto_786 ?auto_790 ) ( AIRCRAFT-AT ?auto_789 ?auto_783 ) ( FUEL-LEVEL ?auto_789 ?auto_788 ) ( not ( = ?auto_783 ?auto_790 ) ) ( not ( = ?auto_786 ?auto_784 ) ) ( not ( = ?auto_787 ?auto_790 ) ) ( not ( = ?auto_786 ?auto_785 ) ) ( not ( = ?auto_784 ?auto_785 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_786 ?auto_785 ?auto_784 ?auto_783 )
      ( FLY-3PPL-VERIFY ?auto_784 ?auto_785 ?auto_786 ?auto_783 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_823 - PERSON
      ?auto_824 - PERSON
      ?auto_825 - PERSON
      ?auto_822 - CITY
    )
    :vars
    (
      ?auto_827 - FLEVEL
      ?auto_830 - FLEVEL
      ?auto_826 - CITY
      ?auto_829 - CITY
      ?auto_828 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_827 ?auto_830 ) ( PERSON-AT ?auto_823 ?auto_826 ) ( not ( = ?auto_822 ?auto_826 ) ) ( not ( = ?auto_827 ?auto_830 ) ) ( PERSON-AT ?auto_825 ?auto_826 ) ( PERSON-AT ?auto_824 ?auto_829 ) ( AIRCRAFT-AT ?auto_828 ?auto_822 ) ( FUEL-LEVEL ?auto_828 ?auto_827 ) ( not ( = ?auto_822 ?auto_829 ) ) ( not ( = ?auto_824 ?auto_825 ) ) ( not ( = ?auto_826 ?auto_829 ) ) ( not ( = ?auto_824 ?auto_823 ) ) ( not ( = ?auto_825 ?auto_823 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_824 ?auto_823 ?auto_825 ?auto_822 )
      ( FLY-3PPL-VERIFY ?auto_823 ?auto_824 ?auto_825 ?auto_822 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_842 - PERSON
      ?auto_843 - PERSON
      ?auto_844 - PERSON
      ?auto_841 - CITY
    )
    :vars
    (
      ?auto_846 - FLEVEL
      ?auto_849 - FLEVEL
      ?auto_845 - CITY
      ?auto_848 - CITY
      ?auto_847 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_846 ?auto_849 ) ( PERSON-AT ?auto_842 ?auto_845 ) ( not ( = ?auto_841 ?auto_845 ) ) ( not ( = ?auto_846 ?auto_849 ) ) ( PERSON-AT ?auto_843 ?auto_845 ) ( PERSON-AT ?auto_844 ?auto_848 ) ( AIRCRAFT-AT ?auto_847 ?auto_841 ) ( FUEL-LEVEL ?auto_847 ?auto_846 ) ( not ( = ?auto_841 ?auto_848 ) ) ( not ( = ?auto_844 ?auto_843 ) ) ( not ( = ?auto_845 ?auto_848 ) ) ( not ( = ?auto_844 ?auto_842 ) ) ( not ( = ?auto_843 ?auto_842 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_844 ?auto_842 ?auto_843 ?auto_841 )
      ( FLY-3PPL-VERIFY ?auto_842 ?auto_843 ?auto_844 ?auto_841 ) )
  )

)

