( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205701 - SURFACE
      ?auto_205702 - SURFACE
    )
    :vars
    (
      ?auto_205703 - HOIST
      ?auto_205704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205703 ?auto_205704 ) ( SURFACE-AT ?auto_205701 ?auto_205704 ) ( CLEAR ?auto_205701 ) ( LIFTING ?auto_205703 ?auto_205702 ) ( IS-CRATE ?auto_205702 ) ( not ( = ?auto_205701 ?auto_205702 ) ) )
    :subtasks
    ( ( !DROP ?auto_205703 ?auto_205702 ?auto_205701 ?auto_205704 )
      ( MAKE-1CRATE-VERIFY ?auto_205701 ?auto_205702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205705 - SURFACE
      ?auto_205706 - SURFACE
    )
    :vars
    (
      ?auto_205707 - HOIST
      ?auto_205708 - PLACE
      ?auto_205709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205707 ?auto_205708 ) ( SURFACE-AT ?auto_205705 ?auto_205708 ) ( CLEAR ?auto_205705 ) ( IS-CRATE ?auto_205706 ) ( not ( = ?auto_205705 ?auto_205706 ) ) ( TRUCK-AT ?auto_205709 ?auto_205708 ) ( AVAILABLE ?auto_205707 ) ( IN ?auto_205706 ?auto_205709 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205707 ?auto_205706 ?auto_205709 ?auto_205708 )
      ( MAKE-1CRATE ?auto_205705 ?auto_205706 )
      ( MAKE-1CRATE-VERIFY ?auto_205705 ?auto_205706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205710 - SURFACE
      ?auto_205711 - SURFACE
    )
    :vars
    (
      ?auto_205712 - HOIST
      ?auto_205714 - PLACE
      ?auto_205713 - TRUCK
      ?auto_205715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205712 ?auto_205714 ) ( SURFACE-AT ?auto_205710 ?auto_205714 ) ( CLEAR ?auto_205710 ) ( IS-CRATE ?auto_205711 ) ( not ( = ?auto_205710 ?auto_205711 ) ) ( AVAILABLE ?auto_205712 ) ( IN ?auto_205711 ?auto_205713 ) ( TRUCK-AT ?auto_205713 ?auto_205715 ) ( not ( = ?auto_205715 ?auto_205714 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205713 ?auto_205715 ?auto_205714 )
      ( MAKE-1CRATE ?auto_205710 ?auto_205711 )
      ( MAKE-1CRATE-VERIFY ?auto_205710 ?auto_205711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205716 - SURFACE
      ?auto_205717 - SURFACE
    )
    :vars
    (
      ?auto_205718 - HOIST
      ?auto_205721 - PLACE
      ?auto_205719 - TRUCK
      ?auto_205720 - PLACE
      ?auto_205722 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205718 ?auto_205721 ) ( SURFACE-AT ?auto_205716 ?auto_205721 ) ( CLEAR ?auto_205716 ) ( IS-CRATE ?auto_205717 ) ( not ( = ?auto_205716 ?auto_205717 ) ) ( AVAILABLE ?auto_205718 ) ( TRUCK-AT ?auto_205719 ?auto_205720 ) ( not ( = ?auto_205720 ?auto_205721 ) ) ( HOIST-AT ?auto_205722 ?auto_205720 ) ( LIFTING ?auto_205722 ?auto_205717 ) ( not ( = ?auto_205718 ?auto_205722 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205722 ?auto_205717 ?auto_205719 ?auto_205720 )
      ( MAKE-1CRATE ?auto_205716 ?auto_205717 )
      ( MAKE-1CRATE-VERIFY ?auto_205716 ?auto_205717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205723 - SURFACE
      ?auto_205724 - SURFACE
    )
    :vars
    (
      ?auto_205727 - HOIST
      ?auto_205726 - PLACE
      ?auto_205729 - TRUCK
      ?auto_205728 - PLACE
      ?auto_205725 - HOIST
      ?auto_205730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205727 ?auto_205726 ) ( SURFACE-AT ?auto_205723 ?auto_205726 ) ( CLEAR ?auto_205723 ) ( IS-CRATE ?auto_205724 ) ( not ( = ?auto_205723 ?auto_205724 ) ) ( AVAILABLE ?auto_205727 ) ( TRUCK-AT ?auto_205729 ?auto_205728 ) ( not ( = ?auto_205728 ?auto_205726 ) ) ( HOIST-AT ?auto_205725 ?auto_205728 ) ( not ( = ?auto_205727 ?auto_205725 ) ) ( AVAILABLE ?auto_205725 ) ( SURFACE-AT ?auto_205724 ?auto_205728 ) ( ON ?auto_205724 ?auto_205730 ) ( CLEAR ?auto_205724 ) ( not ( = ?auto_205723 ?auto_205730 ) ) ( not ( = ?auto_205724 ?auto_205730 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205725 ?auto_205724 ?auto_205730 ?auto_205728 )
      ( MAKE-1CRATE ?auto_205723 ?auto_205724 )
      ( MAKE-1CRATE-VERIFY ?auto_205723 ?auto_205724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205731 - SURFACE
      ?auto_205732 - SURFACE
    )
    :vars
    (
      ?auto_205734 - HOIST
      ?auto_205738 - PLACE
      ?auto_205735 - PLACE
      ?auto_205737 - HOIST
      ?auto_205736 - SURFACE
      ?auto_205733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205734 ?auto_205738 ) ( SURFACE-AT ?auto_205731 ?auto_205738 ) ( CLEAR ?auto_205731 ) ( IS-CRATE ?auto_205732 ) ( not ( = ?auto_205731 ?auto_205732 ) ) ( AVAILABLE ?auto_205734 ) ( not ( = ?auto_205735 ?auto_205738 ) ) ( HOIST-AT ?auto_205737 ?auto_205735 ) ( not ( = ?auto_205734 ?auto_205737 ) ) ( AVAILABLE ?auto_205737 ) ( SURFACE-AT ?auto_205732 ?auto_205735 ) ( ON ?auto_205732 ?auto_205736 ) ( CLEAR ?auto_205732 ) ( not ( = ?auto_205731 ?auto_205736 ) ) ( not ( = ?auto_205732 ?auto_205736 ) ) ( TRUCK-AT ?auto_205733 ?auto_205738 ) )
    :subtasks
    ( ( !DRIVE ?auto_205733 ?auto_205738 ?auto_205735 )
      ( MAKE-1CRATE ?auto_205731 ?auto_205732 )
      ( MAKE-1CRATE-VERIFY ?auto_205731 ?auto_205732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205748 - SURFACE
      ?auto_205749 - SURFACE
      ?auto_205750 - SURFACE
    )
    :vars
    (
      ?auto_205752 - HOIST
      ?auto_205751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205752 ?auto_205751 ) ( SURFACE-AT ?auto_205749 ?auto_205751 ) ( CLEAR ?auto_205749 ) ( LIFTING ?auto_205752 ?auto_205750 ) ( IS-CRATE ?auto_205750 ) ( not ( = ?auto_205749 ?auto_205750 ) ) ( ON ?auto_205749 ?auto_205748 ) ( not ( = ?auto_205748 ?auto_205749 ) ) ( not ( = ?auto_205748 ?auto_205750 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205749 ?auto_205750 )
      ( MAKE-2CRATE-VERIFY ?auto_205748 ?auto_205749 ?auto_205750 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205758 - SURFACE
      ?auto_205759 - SURFACE
      ?auto_205760 - SURFACE
    )
    :vars
    (
      ?auto_205761 - HOIST
      ?auto_205762 - PLACE
      ?auto_205763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205761 ?auto_205762 ) ( SURFACE-AT ?auto_205759 ?auto_205762 ) ( CLEAR ?auto_205759 ) ( IS-CRATE ?auto_205760 ) ( not ( = ?auto_205759 ?auto_205760 ) ) ( TRUCK-AT ?auto_205763 ?auto_205762 ) ( AVAILABLE ?auto_205761 ) ( IN ?auto_205760 ?auto_205763 ) ( ON ?auto_205759 ?auto_205758 ) ( not ( = ?auto_205758 ?auto_205759 ) ) ( not ( = ?auto_205758 ?auto_205760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205759 ?auto_205760 )
      ( MAKE-2CRATE-VERIFY ?auto_205758 ?auto_205759 ?auto_205760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205764 - SURFACE
      ?auto_205765 - SURFACE
    )
    :vars
    (
      ?auto_205766 - HOIST
      ?auto_205767 - PLACE
      ?auto_205769 - TRUCK
      ?auto_205768 - SURFACE
      ?auto_205770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205766 ?auto_205767 ) ( SURFACE-AT ?auto_205764 ?auto_205767 ) ( CLEAR ?auto_205764 ) ( IS-CRATE ?auto_205765 ) ( not ( = ?auto_205764 ?auto_205765 ) ) ( AVAILABLE ?auto_205766 ) ( IN ?auto_205765 ?auto_205769 ) ( ON ?auto_205764 ?auto_205768 ) ( not ( = ?auto_205768 ?auto_205764 ) ) ( not ( = ?auto_205768 ?auto_205765 ) ) ( TRUCK-AT ?auto_205769 ?auto_205770 ) ( not ( = ?auto_205770 ?auto_205767 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205769 ?auto_205770 ?auto_205767 )
      ( MAKE-2CRATE ?auto_205768 ?auto_205764 ?auto_205765 )
      ( MAKE-1CRATE-VERIFY ?auto_205764 ?auto_205765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205771 - SURFACE
      ?auto_205772 - SURFACE
      ?auto_205773 - SURFACE
    )
    :vars
    (
      ?auto_205777 - HOIST
      ?auto_205775 - PLACE
      ?auto_205776 - TRUCK
      ?auto_205774 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205777 ?auto_205775 ) ( SURFACE-AT ?auto_205772 ?auto_205775 ) ( CLEAR ?auto_205772 ) ( IS-CRATE ?auto_205773 ) ( not ( = ?auto_205772 ?auto_205773 ) ) ( AVAILABLE ?auto_205777 ) ( IN ?auto_205773 ?auto_205776 ) ( ON ?auto_205772 ?auto_205771 ) ( not ( = ?auto_205771 ?auto_205772 ) ) ( not ( = ?auto_205771 ?auto_205773 ) ) ( TRUCK-AT ?auto_205776 ?auto_205774 ) ( not ( = ?auto_205774 ?auto_205775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205772 ?auto_205773 )
      ( MAKE-2CRATE-VERIFY ?auto_205771 ?auto_205772 ?auto_205773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205778 - SURFACE
      ?auto_205779 - SURFACE
    )
    :vars
    (
      ?auto_205780 - HOIST
      ?auto_205782 - PLACE
      ?auto_205781 - SURFACE
      ?auto_205784 - TRUCK
      ?auto_205783 - PLACE
      ?auto_205785 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205780 ?auto_205782 ) ( SURFACE-AT ?auto_205778 ?auto_205782 ) ( CLEAR ?auto_205778 ) ( IS-CRATE ?auto_205779 ) ( not ( = ?auto_205778 ?auto_205779 ) ) ( AVAILABLE ?auto_205780 ) ( ON ?auto_205778 ?auto_205781 ) ( not ( = ?auto_205781 ?auto_205778 ) ) ( not ( = ?auto_205781 ?auto_205779 ) ) ( TRUCK-AT ?auto_205784 ?auto_205783 ) ( not ( = ?auto_205783 ?auto_205782 ) ) ( HOIST-AT ?auto_205785 ?auto_205783 ) ( LIFTING ?auto_205785 ?auto_205779 ) ( not ( = ?auto_205780 ?auto_205785 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205785 ?auto_205779 ?auto_205784 ?auto_205783 )
      ( MAKE-2CRATE ?auto_205781 ?auto_205778 ?auto_205779 )
      ( MAKE-1CRATE-VERIFY ?auto_205778 ?auto_205779 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205786 - SURFACE
      ?auto_205787 - SURFACE
      ?auto_205788 - SURFACE
    )
    :vars
    (
      ?auto_205792 - HOIST
      ?auto_205790 - PLACE
      ?auto_205791 - TRUCK
      ?auto_205789 - PLACE
      ?auto_205793 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205792 ?auto_205790 ) ( SURFACE-AT ?auto_205787 ?auto_205790 ) ( CLEAR ?auto_205787 ) ( IS-CRATE ?auto_205788 ) ( not ( = ?auto_205787 ?auto_205788 ) ) ( AVAILABLE ?auto_205792 ) ( ON ?auto_205787 ?auto_205786 ) ( not ( = ?auto_205786 ?auto_205787 ) ) ( not ( = ?auto_205786 ?auto_205788 ) ) ( TRUCK-AT ?auto_205791 ?auto_205789 ) ( not ( = ?auto_205789 ?auto_205790 ) ) ( HOIST-AT ?auto_205793 ?auto_205789 ) ( LIFTING ?auto_205793 ?auto_205788 ) ( not ( = ?auto_205792 ?auto_205793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205787 ?auto_205788 )
      ( MAKE-2CRATE-VERIFY ?auto_205786 ?auto_205787 ?auto_205788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205794 - SURFACE
      ?auto_205795 - SURFACE
    )
    :vars
    (
      ?auto_205798 - HOIST
      ?auto_205801 - PLACE
      ?auto_205797 - SURFACE
      ?auto_205800 - TRUCK
      ?auto_205796 - PLACE
      ?auto_205799 - HOIST
      ?auto_205802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205798 ?auto_205801 ) ( SURFACE-AT ?auto_205794 ?auto_205801 ) ( CLEAR ?auto_205794 ) ( IS-CRATE ?auto_205795 ) ( not ( = ?auto_205794 ?auto_205795 ) ) ( AVAILABLE ?auto_205798 ) ( ON ?auto_205794 ?auto_205797 ) ( not ( = ?auto_205797 ?auto_205794 ) ) ( not ( = ?auto_205797 ?auto_205795 ) ) ( TRUCK-AT ?auto_205800 ?auto_205796 ) ( not ( = ?auto_205796 ?auto_205801 ) ) ( HOIST-AT ?auto_205799 ?auto_205796 ) ( not ( = ?auto_205798 ?auto_205799 ) ) ( AVAILABLE ?auto_205799 ) ( SURFACE-AT ?auto_205795 ?auto_205796 ) ( ON ?auto_205795 ?auto_205802 ) ( CLEAR ?auto_205795 ) ( not ( = ?auto_205794 ?auto_205802 ) ) ( not ( = ?auto_205795 ?auto_205802 ) ) ( not ( = ?auto_205797 ?auto_205802 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205799 ?auto_205795 ?auto_205802 ?auto_205796 )
      ( MAKE-2CRATE ?auto_205797 ?auto_205794 ?auto_205795 )
      ( MAKE-1CRATE-VERIFY ?auto_205794 ?auto_205795 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205803 - SURFACE
      ?auto_205804 - SURFACE
      ?auto_205805 - SURFACE
    )
    :vars
    (
      ?auto_205806 - HOIST
      ?auto_205808 - PLACE
      ?auto_205809 - TRUCK
      ?auto_205807 - PLACE
      ?auto_205810 - HOIST
      ?auto_205811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205806 ?auto_205808 ) ( SURFACE-AT ?auto_205804 ?auto_205808 ) ( CLEAR ?auto_205804 ) ( IS-CRATE ?auto_205805 ) ( not ( = ?auto_205804 ?auto_205805 ) ) ( AVAILABLE ?auto_205806 ) ( ON ?auto_205804 ?auto_205803 ) ( not ( = ?auto_205803 ?auto_205804 ) ) ( not ( = ?auto_205803 ?auto_205805 ) ) ( TRUCK-AT ?auto_205809 ?auto_205807 ) ( not ( = ?auto_205807 ?auto_205808 ) ) ( HOIST-AT ?auto_205810 ?auto_205807 ) ( not ( = ?auto_205806 ?auto_205810 ) ) ( AVAILABLE ?auto_205810 ) ( SURFACE-AT ?auto_205805 ?auto_205807 ) ( ON ?auto_205805 ?auto_205811 ) ( CLEAR ?auto_205805 ) ( not ( = ?auto_205804 ?auto_205811 ) ) ( not ( = ?auto_205805 ?auto_205811 ) ) ( not ( = ?auto_205803 ?auto_205811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205804 ?auto_205805 )
      ( MAKE-2CRATE-VERIFY ?auto_205803 ?auto_205804 ?auto_205805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205812 - SURFACE
      ?auto_205813 - SURFACE
    )
    :vars
    (
      ?auto_205819 - HOIST
      ?auto_205816 - PLACE
      ?auto_205817 - SURFACE
      ?auto_205815 - PLACE
      ?auto_205818 - HOIST
      ?auto_205814 - SURFACE
      ?auto_205820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205819 ?auto_205816 ) ( SURFACE-AT ?auto_205812 ?auto_205816 ) ( CLEAR ?auto_205812 ) ( IS-CRATE ?auto_205813 ) ( not ( = ?auto_205812 ?auto_205813 ) ) ( AVAILABLE ?auto_205819 ) ( ON ?auto_205812 ?auto_205817 ) ( not ( = ?auto_205817 ?auto_205812 ) ) ( not ( = ?auto_205817 ?auto_205813 ) ) ( not ( = ?auto_205815 ?auto_205816 ) ) ( HOIST-AT ?auto_205818 ?auto_205815 ) ( not ( = ?auto_205819 ?auto_205818 ) ) ( AVAILABLE ?auto_205818 ) ( SURFACE-AT ?auto_205813 ?auto_205815 ) ( ON ?auto_205813 ?auto_205814 ) ( CLEAR ?auto_205813 ) ( not ( = ?auto_205812 ?auto_205814 ) ) ( not ( = ?auto_205813 ?auto_205814 ) ) ( not ( = ?auto_205817 ?auto_205814 ) ) ( TRUCK-AT ?auto_205820 ?auto_205816 ) )
    :subtasks
    ( ( !DRIVE ?auto_205820 ?auto_205816 ?auto_205815 )
      ( MAKE-2CRATE ?auto_205817 ?auto_205812 ?auto_205813 )
      ( MAKE-1CRATE-VERIFY ?auto_205812 ?auto_205813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205821 - SURFACE
      ?auto_205822 - SURFACE
      ?auto_205823 - SURFACE
    )
    :vars
    (
      ?auto_205825 - HOIST
      ?auto_205826 - PLACE
      ?auto_205829 - PLACE
      ?auto_205824 - HOIST
      ?auto_205828 - SURFACE
      ?auto_205827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205825 ?auto_205826 ) ( SURFACE-AT ?auto_205822 ?auto_205826 ) ( CLEAR ?auto_205822 ) ( IS-CRATE ?auto_205823 ) ( not ( = ?auto_205822 ?auto_205823 ) ) ( AVAILABLE ?auto_205825 ) ( ON ?auto_205822 ?auto_205821 ) ( not ( = ?auto_205821 ?auto_205822 ) ) ( not ( = ?auto_205821 ?auto_205823 ) ) ( not ( = ?auto_205829 ?auto_205826 ) ) ( HOIST-AT ?auto_205824 ?auto_205829 ) ( not ( = ?auto_205825 ?auto_205824 ) ) ( AVAILABLE ?auto_205824 ) ( SURFACE-AT ?auto_205823 ?auto_205829 ) ( ON ?auto_205823 ?auto_205828 ) ( CLEAR ?auto_205823 ) ( not ( = ?auto_205822 ?auto_205828 ) ) ( not ( = ?auto_205823 ?auto_205828 ) ) ( not ( = ?auto_205821 ?auto_205828 ) ) ( TRUCK-AT ?auto_205827 ?auto_205826 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205822 ?auto_205823 )
      ( MAKE-2CRATE-VERIFY ?auto_205821 ?auto_205822 ?auto_205823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205830 - SURFACE
      ?auto_205831 - SURFACE
    )
    :vars
    (
      ?auto_205835 - HOIST
      ?auto_205836 - PLACE
      ?auto_205834 - SURFACE
      ?auto_205838 - PLACE
      ?auto_205832 - HOIST
      ?auto_205833 - SURFACE
      ?auto_205837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205835 ?auto_205836 ) ( IS-CRATE ?auto_205831 ) ( not ( = ?auto_205830 ?auto_205831 ) ) ( not ( = ?auto_205834 ?auto_205830 ) ) ( not ( = ?auto_205834 ?auto_205831 ) ) ( not ( = ?auto_205838 ?auto_205836 ) ) ( HOIST-AT ?auto_205832 ?auto_205838 ) ( not ( = ?auto_205835 ?auto_205832 ) ) ( AVAILABLE ?auto_205832 ) ( SURFACE-AT ?auto_205831 ?auto_205838 ) ( ON ?auto_205831 ?auto_205833 ) ( CLEAR ?auto_205831 ) ( not ( = ?auto_205830 ?auto_205833 ) ) ( not ( = ?auto_205831 ?auto_205833 ) ) ( not ( = ?auto_205834 ?auto_205833 ) ) ( TRUCK-AT ?auto_205837 ?auto_205836 ) ( SURFACE-AT ?auto_205834 ?auto_205836 ) ( CLEAR ?auto_205834 ) ( LIFTING ?auto_205835 ?auto_205830 ) ( IS-CRATE ?auto_205830 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205834 ?auto_205830 )
      ( MAKE-2CRATE ?auto_205834 ?auto_205830 ?auto_205831 )
      ( MAKE-1CRATE-VERIFY ?auto_205830 ?auto_205831 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205839 - SURFACE
      ?auto_205840 - SURFACE
      ?auto_205841 - SURFACE
    )
    :vars
    (
      ?auto_205846 - HOIST
      ?auto_205844 - PLACE
      ?auto_205842 - PLACE
      ?auto_205843 - HOIST
      ?auto_205845 - SURFACE
      ?auto_205847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205846 ?auto_205844 ) ( IS-CRATE ?auto_205841 ) ( not ( = ?auto_205840 ?auto_205841 ) ) ( not ( = ?auto_205839 ?auto_205840 ) ) ( not ( = ?auto_205839 ?auto_205841 ) ) ( not ( = ?auto_205842 ?auto_205844 ) ) ( HOIST-AT ?auto_205843 ?auto_205842 ) ( not ( = ?auto_205846 ?auto_205843 ) ) ( AVAILABLE ?auto_205843 ) ( SURFACE-AT ?auto_205841 ?auto_205842 ) ( ON ?auto_205841 ?auto_205845 ) ( CLEAR ?auto_205841 ) ( not ( = ?auto_205840 ?auto_205845 ) ) ( not ( = ?auto_205841 ?auto_205845 ) ) ( not ( = ?auto_205839 ?auto_205845 ) ) ( TRUCK-AT ?auto_205847 ?auto_205844 ) ( SURFACE-AT ?auto_205839 ?auto_205844 ) ( CLEAR ?auto_205839 ) ( LIFTING ?auto_205846 ?auto_205840 ) ( IS-CRATE ?auto_205840 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205840 ?auto_205841 )
      ( MAKE-2CRATE-VERIFY ?auto_205839 ?auto_205840 ?auto_205841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205848 - SURFACE
      ?auto_205849 - SURFACE
    )
    :vars
    (
      ?auto_205853 - HOIST
      ?auto_205854 - PLACE
      ?auto_205852 - SURFACE
      ?auto_205851 - PLACE
      ?auto_205855 - HOIST
      ?auto_205856 - SURFACE
      ?auto_205850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205853 ?auto_205854 ) ( IS-CRATE ?auto_205849 ) ( not ( = ?auto_205848 ?auto_205849 ) ) ( not ( = ?auto_205852 ?auto_205848 ) ) ( not ( = ?auto_205852 ?auto_205849 ) ) ( not ( = ?auto_205851 ?auto_205854 ) ) ( HOIST-AT ?auto_205855 ?auto_205851 ) ( not ( = ?auto_205853 ?auto_205855 ) ) ( AVAILABLE ?auto_205855 ) ( SURFACE-AT ?auto_205849 ?auto_205851 ) ( ON ?auto_205849 ?auto_205856 ) ( CLEAR ?auto_205849 ) ( not ( = ?auto_205848 ?auto_205856 ) ) ( not ( = ?auto_205849 ?auto_205856 ) ) ( not ( = ?auto_205852 ?auto_205856 ) ) ( TRUCK-AT ?auto_205850 ?auto_205854 ) ( SURFACE-AT ?auto_205852 ?auto_205854 ) ( CLEAR ?auto_205852 ) ( IS-CRATE ?auto_205848 ) ( AVAILABLE ?auto_205853 ) ( IN ?auto_205848 ?auto_205850 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205853 ?auto_205848 ?auto_205850 ?auto_205854 )
      ( MAKE-2CRATE ?auto_205852 ?auto_205848 ?auto_205849 )
      ( MAKE-1CRATE-VERIFY ?auto_205848 ?auto_205849 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205857 - SURFACE
      ?auto_205858 - SURFACE
      ?auto_205859 - SURFACE
    )
    :vars
    (
      ?auto_205861 - HOIST
      ?auto_205860 - PLACE
      ?auto_205863 - PLACE
      ?auto_205862 - HOIST
      ?auto_205864 - SURFACE
      ?auto_205865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205861 ?auto_205860 ) ( IS-CRATE ?auto_205859 ) ( not ( = ?auto_205858 ?auto_205859 ) ) ( not ( = ?auto_205857 ?auto_205858 ) ) ( not ( = ?auto_205857 ?auto_205859 ) ) ( not ( = ?auto_205863 ?auto_205860 ) ) ( HOIST-AT ?auto_205862 ?auto_205863 ) ( not ( = ?auto_205861 ?auto_205862 ) ) ( AVAILABLE ?auto_205862 ) ( SURFACE-AT ?auto_205859 ?auto_205863 ) ( ON ?auto_205859 ?auto_205864 ) ( CLEAR ?auto_205859 ) ( not ( = ?auto_205858 ?auto_205864 ) ) ( not ( = ?auto_205859 ?auto_205864 ) ) ( not ( = ?auto_205857 ?auto_205864 ) ) ( TRUCK-AT ?auto_205865 ?auto_205860 ) ( SURFACE-AT ?auto_205857 ?auto_205860 ) ( CLEAR ?auto_205857 ) ( IS-CRATE ?auto_205858 ) ( AVAILABLE ?auto_205861 ) ( IN ?auto_205858 ?auto_205865 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205858 ?auto_205859 )
      ( MAKE-2CRATE-VERIFY ?auto_205857 ?auto_205858 ?auto_205859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205902 - SURFACE
      ?auto_205903 - SURFACE
    )
    :vars
    (
      ?auto_205910 - HOIST
      ?auto_205909 - PLACE
      ?auto_205908 - SURFACE
      ?auto_205904 - PLACE
      ?auto_205905 - HOIST
      ?auto_205906 - SURFACE
      ?auto_205907 - TRUCK
      ?auto_205911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205910 ?auto_205909 ) ( SURFACE-AT ?auto_205902 ?auto_205909 ) ( CLEAR ?auto_205902 ) ( IS-CRATE ?auto_205903 ) ( not ( = ?auto_205902 ?auto_205903 ) ) ( AVAILABLE ?auto_205910 ) ( ON ?auto_205902 ?auto_205908 ) ( not ( = ?auto_205908 ?auto_205902 ) ) ( not ( = ?auto_205908 ?auto_205903 ) ) ( not ( = ?auto_205904 ?auto_205909 ) ) ( HOIST-AT ?auto_205905 ?auto_205904 ) ( not ( = ?auto_205910 ?auto_205905 ) ) ( AVAILABLE ?auto_205905 ) ( SURFACE-AT ?auto_205903 ?auto_205904 ) ( ON ?auto_205903 ?auto_205906 ) ( CLEAR ?auto_205903 ) ( not ( = ?auto_205902 ?auto_205906 ) ) ( not ( = ?auto_205903 ?auto_205906 ) ) ( not ( = ?auto_205908 ?auto_205906 ) ) ( TRUCK-AT ?auto_205907 ?auto_205911 ) ( not ( = ?auto_205911 ?auto_205909 ) ) ( not ( = ?auto_205904 ?auto_205911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205907 ?auto_205911 ?auto_205909 )
      ( MAKE-1CRATE ?auto_205902 ?auto_205903 )
      ( MAKE-1CRATE-VERIFY ?auto_205902 ?auto_205903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205942 - SURFACE
      ?auto_205943 - SURFACE
      ?auto_205944 - SURFACE
      ?auto_205941 - SURFACE
    )
    :vars
    (
      ?auto_205945 - HOIST
      ?auto_205946 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205945 ?auto_205946 ) ( SURFACE-AT ?auto_205944 ?auto_205946 ) ( CLEAR ?auto_205944 ) ( LIFTING ?auto_205945 ?auto_205941 ) ( IS-CRATE ?auto_205941 ) ( not ( = ?auto_205944 ?auto_205941 ) ) ( ON ?auto_205943 ?auto_205942 ) ( ON ?auto_205944 ?auto_205943 ) ( not ( = ?auto_205942 ?auto_205943 ) ) ( not ( = ?auto_205942 ?auto_205944 ) ) ( not ( = ?auto_205942 ?auto_205941 ) ) ( not ( = ?auto_205943 ?auto_205944 ) ) ( not ( = ?auto_205943 ?auto_205941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205944 ?auto_205941 )
      ( MAKE-3CRATE-VERIFY ?auto_205942 ?auto_205943 ?auto_205944 ?auto_205941 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205959 - SURFACE
      ?auto_205960 - SURFACE
      ?auto_205961 - SURFACE
      ?auto_205958 - SURFACE
    )
    :vars
    (
      ?auto_205963 - HOIST
      ?auto_205962 - PLACE
      ?auto_205964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205963 ?auto_205962 ) ( SURFACE-AT ?auto_205961 ?auto_205962 ) ( CLEAR ?auto_205961 ) ( IS-CRATE ?auto_205958 ) ( not ( = ?auto_205961 ?auto_205958 ) ) ( TRUCK-AT ?auto_205964 ?auto_205962 ) ( AVAILABLE ?auto_205963 ) ( IN ?auto_205958 ?auto_205964 ) ( ON ?auto_205961 ?auto_205960 ) ( not ( = ?auto_205960 ?auto_205961 ) ) ( not ( = ?auto_205960 ?auto_205958 ) ) ( ON ?auto_205960 ?auto_205959 ) ( not ( = ?auto_205959 ?auto_205960 ) ) ( not ( = ?auto_205959 ?auto_205961 ) ) ( not ( = ?auto_205959 ?auto_205958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205960 ?auto_205961 ?auto_205958 )
      ( MAKE-3CRATE-VERIFY ?auto_205959 ?auto_205960 ?auto_205961 ?auto_205958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205980 - SURFACE
      ?auto_205981 - SURFACE
      ?auto_205982 - SURFACE
      ?auto_205979 - SURFACE
    )
    :vars
    (
      ?auto_205984 - HOIST
      ?auto_205986 - PLACE
      ?auto_205985 - TRUCK
      ?auto_205983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205984 ?auto_205986 ) ( SURFACE-AT ?auto_205982 ?auto_205986 ) ( CLEAR ?auto_205982 ) ( IS-CRATE ?auto_205979 ) ( not ( = ?auto_205982 ?auto_205979 ) ) ( AVAILABLE ?auto_205984 ) ( IN ?auto_205979 ?auto_205985 ) ( ON ?auto_205982 ?auto_205981 ) ( not ( = ?auto_205981 ?auto_205982 ) ) ( not ( = ?auto_205981 ?auto_205979 ) ) ( TRUCK-AT ?auto_205985 ?auto_205983 ) ( not ( = ?auto_205983 ?auto_205986 ) ) ( ON ?auto_205981 ?auto_205980 ) ( not ( = ?auto_205980 ?auto_205981 ) ) ( not ( = ?auto_205980 ?auto_205982 ) ) ( not ( = ?auto_205980 ?auto_205979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205981 ?auto_205982 ?auto_205979 )
      ( MAKE-3CRATE-VERIFY ?auto_205980 ?auto_205981 ?auto_205982 ?auto_205979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206004 - SURFACE
      ?auto_206005 - SURFACE
      ?auto_206006 - SURFACE
      ?auto_206003 - SURFACE
    )
    :vars
    (
      ?auto_206007 - HOIST
      ?auto_206008 - PLACE
      ?auto_206011 - TRUCK
      ?auto_206009 - PLACE
      ?auto_206010 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_206007 ?auto_206008 ) ( SURFACE-AT ?auto_206006 ?auto_206008 ) ( CLEAR ?auto_206006 ) ( IS-CRATE ?auto_206003 ) ( not ( = ?auto_206006 ?auto_206003 ) ) ( AVAILABLE ?auto_206007 ) ( ON ?auto_206006 ?auto_206005 ) ( not ( = ?auto_206005 ?auto_206006 ) ) ( not ( = ?auto_206005 ?auto_206003 ) ) ( TRUCK-AT ?auto_206011 ?auto_206009 ) ( not ( = ?auto_206009 ?auto_206008 ) ) ( HOIST-AT ?auto_206010 ?auto_206009 ) ( LIFTING ?auto_206010 ?auto_206003 ) ( not ( = ?auto_206007 ?auto_206010 ) ) ( ON ?auto_206005 ?auto_206004 ) ( not ( = ?auto_206004 ?auto_206005 ) ) ( not ( = ?auto_206004 ?auto_206006 ) ) ( not ( = ?auto_206004 ?auto_206003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206005 ?auto_206006 ?auto_206003 )
      ( MAKE-3CRATE-VERIFY ?auto_206004 ?auto_206005 ?auto_206006 ?auto_206003 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206031 - SURFACE
      ?auto_206032 - SURFACE
      ?auto_206033 - SURFACE
      ?auto_206030 - SURFACE
    )
    :vars
    (
      ?auto_206039 - HOIST
      ?auto_206035 - PLACE
      ?auto_206034 - TRUCK
      ?auto_206038 - PLACE
      ?auto_206036 - HOIST
      ?auto_206037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206039 ?auto_206035 ) ( SURFACE-AT ?auto_206033 ?auto_206035 ) ( CLEAR ?auto_206033 ) ( IS-CRATE ?auto_206030 ) ( not ( = ?auto_206033 ?auto_206030 ) ) ( AVAILABLE ?auto_206039 ) ( ON ?auto_206033 ?auto_206032 ) ( not ( = ?auto_206032 ?auto_206033 ) ) ( not ( = ?auto_206032 ?auto_206030 ) ) ( TRUCK-AT ?auto_206034 ?auto_206038 ) ( not ( = ?auto_206038 ?auto_206035 ) ) ( HOIST-AT ?auto_206036 ?auto_206038 ) ( not ( = ?auto_206039 ?auto_206036 ) ) ( AVAILABLE ?auto_206036 ) ( SURFACE-AT ?auto_206030 ?auto_206038 ) ( ON ?auto_206030 ?auto_206037 ) ( CLEAR ?auto_206030 ) ( not ( = ?auto_206033 ?auto_206037 ) ) ( not ( = ?auto_206030 ?auto_206037 ) ) ( not ( = ?auto_206032 ?auto_206037 ) ) ( ON ?auto_206032 ?auto_206031 ) ( not ( = ?auto_206031 ?auto_206032 ) ) ( not ( = ?auto_206031 ?auto_206033 ) ) ( not ( = ?auto_206031 ?auto_206030 ) ) ( not ( = ?auto_206031 ?auto_206037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206032 ?auto_206033 ?auto_206030 )
      ( MAKE-3CRATE-VERIFY ?auto_206031 ?auto_206032 ?auto_206033 ?auto_206030 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206059 - SURFACE
      ?auto_206060 - SURFACE
      ?auto_206061 - SURFACE
      ?auto_206058 - SURFACE
    )
    :vars
    (
      ?auto_206062 - HOIST
      ?auto_206063 - PLACE
      ?auto_206065 - PLACE
      ?auto_206067 - HOIST
      ?auto_206066 - SURFACE
      ?auto_206064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206062 ?auto_206063 ) ( SURFACE-AT ?auto_206061 ?auto_206063 ) ( CLEAR ?auto_206061 ) ( IS-CRATE ?auto_206058 ) ( not ( = ?auto_206061 ?auto_206058 ) ) ( AVAILABLE ?auto_206062 ) ( ON ?auto_206061 ?auto_206060 ) ( not ( = ?auto_206060 ?auto_206061 ) ) ( not ( = ?auto_206060 ?auto_206058 ) ) ( not ( = ?auto_206065 ?auto_206063 ) ) ( HOIST-AT ?auto_206067 ?auto_206065 ) ( not ( = ?auto_206062 ?auto_206067 ) ) ( AVAILABLE ?auto_206067 ) ( SURFACE-AT ?auto_206058 ?auto_206065 ) ( ON ?auto_206058 ?auto_206066 ) ( CLEAR ?auto_206058 ) ( not ( = ?auto_206061 ?auto_206066 ) ) ( not ( = ?auto_206058 ?auto_206066 ) ) ( not ( = ?auto_206060 ?auto_206066 ) ) ( TRUCK-AT ?auto_206064 ?auto_206063 ) ( ON ?auto_206060 ?auto_206059 ) ( not ( = ?auto_206059 ?auto_206060 ) ) ( not ( = ?auto_206059 ?auto_206061 ) ) ( not ( = ?auto_206059 ?auto_206058 ) ) ( not ( = ?auto_206059 ?auto_206066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206060 ?auto_206061 ?auto_206058 )
      ( MAKE-3CRATE-VERIFY ?auto_206059 ?auto_206060 ?auto_206061 ?auto_206058 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206087 - SURFACE
      ?auto_206088 - SURFACE
      ?auto_206089 - SURFACE
      ?auto_206086 - SURFACE
    )
    :vars
    (
      ?auto_206093 - HOIST
      ?auto_206095 - PLACE
      ?auto_206090 - PLACE
      ?auto_206091 - HOIST
      ?auto_206092 - SURFACE
      ?auto_206094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206093 ?auto_206095 ) ( IS-CRATE ?auto_206086 ) ( not ( = ?auto_206089 ?auto_206086 ) ) ( not ( = ?auto_206088 ?auto_206089 ) ) ( not ( = ?auto_206088 ?auto_206086 ) ) ( not ( = ?auto_206090 ?auto_206095 ) ) ( HOIST-AT ?auto_206091 ?auto_206090 ) ( not ( = ?auto_206093 ?auto_206091 ) ) ( AVAILABLE ?auto_206091 ) ( SURFACE-AT ?auto_206086 ?auto_206090 ) ( ON ?auto_206086 ?auto_206092 ) ( CLEAR ?auto_206086 ) ( not ( = ?auto_206089 ?auto_206092 ) ) ( not ( = ?auto_206086 ?auto_206092 ) ) ( not ( = ?auto_206088 ?auto_206092 ) ) ( TRUCK-AT ?auto_206094 ?auto_206095 ) ( SURFACE-AT ?auto_206088 ?auto_206095 ) ( CLEAR ?auto_206088 ) ( LIFTING ?auto_206093 ?auto_206089 ) ( IS-CRATE ?auto_206089 ) ( ON ?auto_206088 ?auto_206087 ) ( not ( = ?auto_206087 ?auto_206088 ) ) ( not ( = ?auto_206087 ?auto_206089 ) ) ( not ( = ?auto_206087 ?auto_206086 ) ) ( not ( = ?auto_206087 ?auto_206092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206088 ?auto_206089 ?auto_206086 )
      ( MAKE-3CRATE-VERIFY ?auto_206087 ?auto_206088 ?auto_206089 ?auto_206086 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206115 - SURFACE
      ?auto_206116 - SURFACE
      ?auto_206117 - SURFACE
      ?auto_206114 - SURFACE
    )
    :vars
    (
      ?auto_206118 - HOIST
      ?auto_206119 - PLACE
      ?auto_206122 - PLACE
      ?auto_206121 - HOIST
      ?auto_206120 - SURFACE
      ?auto_206123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206118 ?auto_206119 ) ( IS-CRATE ?auto_206114 ) ( not ( = ?auto_206117 ?auto_206114 ) ) ( not ( = ?auto_206116 ?auto_206117 ) ) ( not ( = ?auto_206116 ?auto_206114 ) ) ( not ( = ?auto_206122 ?auto_206119 ) ) ( HOIST-AT ?auto_206121 ?auto_206122 ) ( not ( = ?auto_206118 ?auto_206121 ) ) ( AVAILABLE ?auto_206121 ) ( SURFACE-AT ?auto_206114 ?auto_206122 ) ( ON ?auto_206114 ?auto_206120 ) ( CLEAR ?auto_206114 ) ( not ( = ?auto_206117 ?auto_206120 ) ) ( not ( = ?auto_206114 ?auto_206120 ) ) ( not ( = ?auto_206116 ?auto_206120 ) ) ( TRUCK-AT ?auto_206123 ?auto_206119 ) ( SURFACE-AT ?auto_206116 ?auto_206119 ) ( CLEAR ?auto_206116 ) ( IS-CRATE ?auto_206117 ) ( AVAILABLE ?auto_206118 ) ( IN ?auto_206117 ?auto_206123 ) ( ON ?auto_206116 ?auto_206115 ) ( not ( = ?auto_206115 ?auto_206116 ) ) ( not ( = ?auto_206115 ?auto_206117 ) ) ( not ( = ?auto_206115 ?auto_206114 ) ) ( not ( = ?auto_206115 ?auto_206120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206116 ?auto_206117 ?auto_206114 )
      ( MAKE-3CRATE-VERIFY ?auto_206115 ?auto_206116 ?auto_206117 ?auto_206114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206406 - SURFACE
      ?auto_206407 - SURFACE
      ?auto_206408 - SURFACE
      ?auto_206405 - SURFACE
      ?auto_206409 - SURFACE
    )
    :vars
    (
      ?auto_206410 - HOIST
      ?auto_206411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206410 ?auto_206411 ) ( SURFACE-AT ?auto_206405 ?auto_206411 ) ( CLEAR ?auto_206405 ) ( LIFTING ?auto_206410 ?auto_206409 ) ( IS-CRATE ?auto_206409 ) ( not ( = ?auto_206405 ?auto_206409 ) ) ( ON ?auto_206407 ?auto_206406 ) ( ON ?auto_206408 ?auto_206407 ) ( ON ?auto_206405 ?auto_206408 ) ( not ( = ?auto_206406 ?auto_206407 ) ) ( not ( = ?auto_206406 ?auto_206408 ) ) ( not ( = ?auto_206406 ?auto_206405 ) ) ( not ( = ?auto_206406 ?auto_206409 ) ) ( not ( = ?auto_206407 ?auto_206408 ) ) ( not ( = ?auto_206407 ?auto_206405 ) ) ( not ( = ?auto_206407 ?auto_206409 ) ) ( not ( = ?auto_206408 ?auto_206405 ) ) ( not ( = ?auto_206408 ?auto_206409 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_206405 ?auto_206409 )
      ( MAKE-4CRATE-VERIFY ?auto_206406 ?auto_206407 ?auto_206408 ?auto_206405 ?auto_206409 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206431 - SURFACE
      ?auto_206432 - SURFACE
      ?auto_206433 - SURFACE
      ?auto_206430 - SURFACE
      ?auto_206434 - SURFACE
    )
    :vars
    (
      ?auto_206436 - HOIST
      ?auto_206435 - PLACE
      ?auto_206437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206436 ?auto_206435 ) ( SURFACE-AT ?auto_206430 ?auto_206435 ) ( CLEAR ?auto_206430 ) ( IS-CRATE ?auto_206434 ) ( not ( = ?auto_206430 ?auto_206434 ) ) ( TRUCK-AT ?auto_206437 ?auto_206435 ) ( AVAILABLE ?auto_206436 ) ( IN ?auto_206434 ?auto_206437 ) ( ON ?auto_206430 ?auto_206433 ) ( not ( = ?auto_206433 ?auto_206430 ) ) ( not ( = ?auto_206433 ?auto_206434 ) ) ( ON ?auto_206432 ?auto_206431 ) ( ON ?auto_206433 ?auto_206432 ) ( not ( = ?auto_206431 ?auto_206432 ) ) ( not ( = ?auto_206431 ?auto_206433 ) ) ( not ( = ?auto_206431 ?auto_206430 ) ) ( not ( = ?auto_206431 ?auto_206434 ) ) ( not ( = ?auto_206432 ?auto_206433 ) ) ( not ( = ?auto_206432 ?auto_206430 ) ) ( not ( = ?auto_206432 ?auto_206434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206433 ?auto_206430 ?auto_206434 )
      ( MAKE-4CRATE-VERIFY ?auto_206431 ?auto_206432 ?auto_206433 ?auto_206430 ?auto_206434 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206461 - SURFACE
      ?auto_206462 - SURFACE
      ?auto_206463 - SURFACE
      ?auto_206460 - SURFACE
      ?auto_206464 - SURFACE
    )
    :vars
    (
      ?auto_206465 - HOIST
      ?auto_206466 - PLACE
      ?auto_206467 - TRUCK
      ?auto_206468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206465 ?auto_206466 ) ( SURFACE-AT ?auto_206460 ?auto_206466 ) ( CLEAR ?auto_206460 ) ( IS-CRATE ?auto_206464 ) ( not ( = ?auto_206460 ?auto_206464 ) ) ( AVAILABLE ?auto_206465 ) ( IN ?auto_206464 ?auto_206467 ) ( ON ?auto_206460 ?auto_206463 ) ( not ( = ?auto_206463 ?auto_206460 ) ) ( not ( = ?auto_206463 ?auto_206464 ) ) ( TRUCK-AT ?auto_206467 ?auto_206468 ) ( not ( = ?auto_206468 ?auto_206466 ) ) ( ON ?auto_206462 ?auto_206461 ) ( ON ?auto_206463 ?auto_206462 ) ( not ( = ?auto_206461 ?auto_206462 ) ) ( not ( = ?auto_206461 ?auto_206463 ) ) ( not ( = ?auto_206461 ?auto_206460 ) ) ( not ( = ?auto_206461 ?auto_206464 ) ) ( not ( = ?auto_206462 ?auto_206463 ) ) ( not ( = ?auto_206462 ?auto_206460 ) ) ( not ( = ?auto_206462 ?auto_206464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206463 ?auto_206460 ?auto_206464 )
      ( MAKE-4CRATE-VERIFY ?auto_206461 ?auto_206462 ?auto_206463 ?auto_206460 ?auto_206464 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206495 - SURFACE
      ?auto_206496 - SURFACE
      ?auto_206497 - SURFACE
      ?auto_206494 - SURFACE
      ?auto_206498 - SURFACE
    )
    :vars
    (
      ?auto_206503 - HOIST
      ?auto_206501 - PLACE
      ?auto_206500 - TRUCK
      ?auto_206502 - PLACE
      ?auto_206499 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_206503 ?auto_206501 ) ( SURFACE-AT ?auto_206494 ?auto_206501 ) ( CLEAR ?auto_206494 ) ( IS-CRATE ?auto_206498 ) ( not ( = ?auto_206494 ?auto_206498 ) ) ( AVAILABLE ?auto_206503 ) ( ON ?auto_206494 ?auto_206497 ) ( not ( = ?auto_206497 ?auto_206494 ) ) ( not ( = ?auto_206497 ?auto_206498 ) ) ( TRUCK-AT ?auto_206500 ?auto_206502 ) ( not ( = ?auto_206502 ?auto_206501 ) ) ( HOIST-AT ?auto_206499 ?auto_206502 ) ( LIFTING ?auto_206499 ?auto_206498 ) ( not ( = ?auto_206503 ?auto_206499 ) ) ( ON ?auto_206496 ?auto_206495 ) ( ON ?auto_206497 ?auto_206496 ) ( not ( = ?auto_206495 ?auto_206496 ) ) ( not ( = ?auto_206495 ?auto_206497 ) ) ( not ( = ?auto_206495 ?auto_206494 ) ) ( not ( = ?auto_206495 ?auto_206498 ) ) ( not ( = ?auto_206496 ?auto_206497 ) ) ( not ( = ?auto_206496 ?auto_206494 ) ) ( not ( = ?auto_206496 ?auto_206498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206497 ?auto_206494 ?auto_206498 )
      ( MAKE-4CRATE-VERIFY ?auto_206495 ?auto_206496 ?auto_206497 ?auto_206494 ?auto_206498 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206533 - SURFACE
      ?auto_206534 - SURFACE
      ?auto_206535 - SURFACE
      ?auto_206532 - SURFACE
      ?auto_206536 - SURFACE
    )
    :vars
    (
      ?auto_206538 - HOIST
      ?auto_206541 - PLACE
      ?auto_206540 - TRUCK
      ?auto_206539 - PLACE
      ?auto_206537 - HOIST
      ?auto_206542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206538 ?auto_206541 ) ( SURFACE-AT ?auto_206532 ?auto_206541 ) ( CLEAR ?auto_206532 ) ( IS-CRATE ?auto_206536 ) ( not ( = ?auto_206532 ?auto_206536 ) ) ( AVAILABLE ?auto_206538 ) ( ON ?auto_206532 ?auto_206535 ) ( not ( = ?auto_206535 ?auto_206532 ) ) ( not ( = ?auto_206535 ?auto_206536 ) ) ( TRUCK-AT ?auto_206540 ?auto_206539 ) ( not ( = ?auto_206539 ?auto_206541 ) ) ( HOIST-AT ?auto_206537 ?auto_206539 ) ( not ( = ?auto_206538 ?auto_206537 ) ) ( AVAILABLE ?auto_206537 ) ( SURFACE-AT ?auto_206536 ?auto_206539 ) ( ON ?auto_206536 ?auto_206542 ) ( CLEAR ?auto_206536 ) ( not ( = ?auto_206532 ?auto_206542 ) ) ( not ( = ?auto_206536 ?auto_206542 ) ) ( not ( = ?auto_206535 ?auto_206542 ) ) ( ON ?auto_206534 ?auto_206533 ) ( ON ?auto_206535 ?auto_206534 ) ( not ( = ?auto_206533 ?auto_206534 ) ) ( not ( = ?auto_206533 ?auto_206535 ) ) ( not ( = ?auto_206533 ?auto_206532 ) ) ( not ( = ?auto_206533 ?auto_206536 ) ) ( not ( = ?auto_206533 ?auto_206542 ) ) ( not ( = ?auto_206534 ?auto_206535 ) ) ( not ( = ?auto_206534 ?auto_206532 ) ) ( not ( = ?auto_206534 ?auto_206536 ) ) ( not ( = ?auto_206534 ?auto_206542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206535 ?auto_206532 ?auto_206536 )
      ( MAKE-4CRATE-VERIFY ?auto_206533 ?auto_206534 ?auto_206535 ?auto_206532 ?auto_206536 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206572 - SURFACE
      ?auto_206573 - SURFACE
      ?auto_206574 - SURFACE
      ?auto_206571 - SURFACE
      ?auto_206575 - SURFACE
    )
    :vars
    (
      ?auto_206579 - HOIST
      ?auto_206581 - PLACE
      ?auto_206580 - PLACE
      ?auto_206576 - HOIST
      ?auto_206578 - SURFACE
      ?auto_206577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206579 ?auto_206581 ) ( SURFACE-AT ?auto_206571 ?auto_206581 ) ( CLEAR ?auto_206571 ) ( IS-CRATE ?auto_206575 ) ( not ( = ?auto_206571 ?auto_206575 ) ) ( AVAILABLE ?auto_206579 ) ( ON ?auto_206571 ?auto_206574 ) ( not ( = ?auto_206574 ?auto_206571 ) ) ( not ( = ?auto_206574 ?auto_206575 ) ) ( not ( = ?auto_206580 ?auto_206581 ) ) ( HOIST-AT ?auto_206576 ?auto_206580 ) ( not ( = ?auto_206579 ?auto_206576 ) ) ( AVAILABLE ?auto_206576 ) ( SURFACE-AT ?auto_206575 ?auto_206580 ) ( ON ?auto_206575 ?auto_206578 ) ( CLEAR ?auto_206575 ) ( not ( = ?auto_206571 ?auto_206578 ) ) ( not ( = ?auto_206575 ?auto_206578 ) ) ( not ( = ?auto_206574 ?auto_206578 ) ) ( TRUCK-AT ?auto_206577 ?auto_206581 ) ( ON ?auto_206573 ?auto_206572 ) ( ON ?auto_206574 ?auto_206573 ) ( not ( = ?auto_206572 ?auto_206573 ) ) ( not ( = ?auto_206572 ?auto_206574 ) ) ( not ( = ?auto_206572 ?auto_206571 ) ) ( not ( = ?auto_206572 ?auto_206575 ) ) ( not ( = ?auto_206572 ?auto_206578 ) ) ( not ( = ?auto_206573 ?auto_206574 ) ) ( not ( = ?auto_206573 ?auto_206571 ) ) ( not ( = ?auto_206573 ?auto_206575 ) ) ( not ( = ?auto_206573 ?auto_206578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206574 ?auto_206571 ?auto_206575 )
      ( MAKE-4CRATE-VERIFY ?auto_206572 ?auto_206573 ?auto_206574 ?auto_206571 ?auto_206575 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206611 - SURFACE
      ?auto_206612 - SURFACE
      ?auto_206613 - SURFACE
      ?auto_206610 - SURFACE
      ?auto_206614 - SURFACE
    )
    :vars
    (
      ?auto_206615 - HOIST
      ?auto_206616 - PLACE
      ?auto_206620 - PLACE
      ?auto_206618 - HOIST
      ?auto_206619 - SURFACE
      ?auto_206617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206615 ?auto_206616 ) ( IS-CRATE ?auto_206614 ) ( not ( = ?auto_206610 ?auto_206614 ) ) ( not ( = ?auto_206613 ?auto_206610 ) ) ( not ( = ?auto_206613 ?auto_206614 ) ) ( not ( = ?auto_206620 ?auto_206616 ) ) ( HOIST-AT ?auto_206618 ?auto_206620 ) ( not ( = ?auto_206615 ?auto_206618 ) ) ( AVAILABLE ?auto_206618 ) ( SURFACE-AT ?auto_206614 ?auto_206620 ) ( ON ?auto_206614 ?auto_206619 ) ( CLEAR ?auto_206614 ) ( not ( = ?auto_206610 ?auto_206619 ) ) ( not ( = ?auto_206614 ?auto_206619 ) ) ( not ( = ?auto_206613 ?auto_206619 ) ) ( TRUCK-AT ?auto_206617 ?auto_206616 ) ( SURFACE-AT ?auto_206613 ?auto_206616 ) ( CLEAR ?auto_206613 ) ( LIFTING ?auto_206615 ?auto_206610 ) ( IS-CRATE ?auto_206610 ) ( ON ?auto_206612 ?auto_206611 ) ( ON ?auto_206613 ?auto_206612 ) ( not ( = ?auto_206611 ?auto_206612 ) ) ( not ( = ?auto_206611 ?auto_206613 ) ) ( not ( = ?auto_206611 ?auto_206610 ) ) ( not ( = ?auto_206611 ?auto_206614 ) ) ( not ( = ?auto_206611 ?auto_206619 ) ) ( not ( = ?auto_206612 ?auto_206613 ) ) ( not ( = ?auto_206612 ?auto_206610 ) ) ( not ( = ?auto_206612 ?auto_206614 ) ) ( not ( = ?auto_206612 ?auto_206619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206613 ?auto_206610 ?auto_206614 )
      ( MAKE-4CRATE-VERIFY ?auto_206611 ?auto_206612 ?auto_206613 ?auto_206610 ?auto_206614 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206650 - SURFACE
      ?auto_206651 - SURFACE
      ?auto_206652 - SURFACE
      ?auto_206649 - SURFACE
      ?auto_206653 - SURFACE
    )
    :vars
    (
      ?auto_206659 - HOIST
      ?auto_206655 - PLACE
      ?auto_206654 - PLACE
      ?auto_206656 - HOIST
      ?auto_206658 - SURFACE
      ?auto_206657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206659 ?auto_206655 ) ( IS-CRATE ?auto_206653 ) ( not ( = ?auto_206649 ?auto_206653 ) ) ( not ( = ?auto_206652 ?auto_206649 ) ) ( not ( = ?auto_206652 ?auto_206653 ) ) ( not ( = ?auto_206654 ?auto_206655 ) ) ( HOIST-AT ?auto_206656 ?auto_206654 ) ( not ( = ?auto_206659 ?auto_206656 ) ) ( AVAILABLE ?auto_206656 ) ( SURFACE-AT ?auto_206653 ?auto_206654 ) ( ON ?auto_206653 ?auto_206658 ) ( CLEAR ?auto_206653 ) ( not ( = ?auto_206649 ?auto_206658 ) ) ( not ( = ?auto_206653 ?auto_206658 ) ) ( not ( = ?auto_206652 ?auto_206658 ) ) ( TRUCK-AT ?auto_206657 ?auto_206655 ) ( SURFACE-AT ?auto_206652 ?auto_206655 ) ( CLEAR ?auto_206652 ) ( IS-CRATE ?auto_206649 ) ( AVAILABLE ?auto_206659 ) ( IN ?auto_206649 ?auto_206657 ) ( ON ?auto_206651 ?auto_206650 ) ( ON ?auto_206652 ?auto_206651 ) ( not ( = ?auto_206650 ?auto_206651 ) ) ( not ( = ?auto_206650 ?auto_206652 ) ) ( not ( = ?auto_206650 ?auto_206649 ) ) ( not ( = ?auto_206650 ?auto_206653 ) ) ( not ( = ?auto_206650 ?auto_206658 ) ) ( not ( = ?auto_206651 ?auto_206652 ) ) ( not ( = ?auto_206651 ?auto_206649 ) ) ( not ( = ?auto_206651 ?auto_206653 ) ) ( not ( = ?auto_206651 ?auto_206658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206652 ?auto_206649 ?auto_206653 )
      ( MAKE-4CRATE-VERIFY ?auto_206650 ?auto_206651 ?auto_206652 ?auto_206649 ?auto_206653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207150 - SURFACE
      ?auto_207151 - SURFACE
    )
    :vars
    (
      ?auto_207153 - HOIST
      ?auto_207158 - PLACE
      ?auto_207152 - SURFACE
      ?auto_207155 - TRUCK
      ?auto_207157 - PLACE
      ?auto_207156 - HOIST
      ?auto_207154 - SURFACE
      ?auto_207159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207153 ?auto_207158 ) ( SURFACE-AT ?auto_207150 ?auto_207158 ) ( CLEAR ?auto_207150 ) ( IS-CRATE ?auto_207151 ) ( not ( = ?auto_207150 ?auto_207151 ) ) ( AVAILABLE ?auto_207153 ) ( ON ?auto_207150 ?auto_207152 ) ( not ( = ?auto_207152 ?auto_207150 ) ) ( not ( = ?auto_207152 ?auto_207151 ) ) ( TRUCK-AT ?auto_207155 ?auto_207157 ) ( not ( = ?auto_207157 ?auto_207158 ) ) ( HOIST-AT ?auto_207156 ?auto_207157 ) ( not ( = ?auto_207153 ?auto_207156 ) ) ( SURFACE-AT ?auto_207151 ?auto_207157 ) ( ON ?auto_207151 ?auto_207154 ) ( CLEAR ?auto_207151 ) ( not ( = ?auto_207150 ?auto_207154 ) ) ( not ( = ?auto_207151 ?auto_207154 ) ) ( not ( = ?auto_207152 ?auto_207154 ) ) ( LIFTING ?auto_207156 ?auto_207159 ) ( IS-CRATE ?auto_207159 ) ( not ( = ?auto_207150 ?auto_207159 ) ) ( not ( = ?auto_207151 ?auto_207159 ) ) ( not ( = ?auto_207152 ?auto_207159 ) ) ( not ( = ?auto_207154 ?auto_207159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_207156 ?auto_207159 ?auto_207155 ?auto_207157 )
      ( MAKE-1CRATE ?auto_207150 ?auto_207151 )
      ( MAKE-1CRATE-VERIFY ?auto_207150 ?auto_207151 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207310 - SURFACE
      ?auto_207311 - SURFACE
      ?auto_207312 - SURFACE
      ?auto_207309 - SURFACE
      ?auto_207313 - SURFACE
      ?auto_207314 - SURFACE
    )
    :vars
    (
      ?auto_207316 - HOIST
      ?auto_207315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207316 ?auto_207315 ) ( SURFACE-AT ?auto_207313 ?auto_207315 ) ( CLEAR ?auto_207313 ) ( LIFTING ?auto_207316 ?auto_207314 ) ( IS-CRATE ?auto_207314 ) ( not ( = ?auto_207313 ?auto_207314 ) ) ( ON ?auto_207311 ?auto_207310 ) ( ON ?auto_207312 ?auto_207311 ) ( ON ?auto_207309 ?auto_207312 ) ( ON ?auto_207313 ?auto_207309 ) ( not ( = ?auto_207310 ?auto_207311 ) ) ( not ( = ?auto_207310 ?auto_207312 ) ) ( not ( = ?auto_207310 ?auto_207309 ) ) ( not ( = ?auto_207310 ?auto_207313 ) ) ( not ( = ?auto_207310 ?auto_207314 ) ) ( not ( = ?auto_207311 ?auto_207312 ) ) ( not ( = ?auto_207311 ?auto_207309 ) ) ( not ( = ?auto_207311 ?auto_207313 ) ) ( not ( = ?auto_207311 ?auto_207314 ) ) ( not ( = ?auto_207312 ?auto_207309 ) ) ( not ( = ?auto_207312 ?auto_207313 ) ) ( not ( = ?auto_207312 ?auto_207314 ) ) ( not ( = ?auto_207309 ?auto_207313 ) ) ( not ( = ?auto_207309 ?auto_207314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207313 ?auto_207314 )
      ( MAKE-5CRATE-VERIFY ?auto_207310 ?auto_207311 ?auto_207312 ?auto_207309 ?auto_207313 ?auto_207314 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207344 - SURFACE
      ?auto_207345 - SURFACE
      ?auto_207346 - SURFACE
      ?auto_207343 - SURFACE
      ?auto_207347 - SURFACE
      ?auto_207348 - SURFACE
    )
    :vars
    (
      ?auto_207351 - HOIST
      ?auto_207349 - PLACE
      ?auto_207350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207351 ?auto_207349 ) ( SURFACE-AT ?auto_207347 ?auto_207349 ) ( CLEAR ?auto_207347 ) ( IS-CRATE ?auto_207348 ) ( not ( = ?auto_207347 ?auto_207348 ) ) ( TRUCK-AT ?auto_207350 ?auto_207349 ) ( AVAILABLE ?auto_207351 ) ( IN ?auto_207348 ?auto_207350 ) ( ON ?auto_207347 ?auto_207343 ) ( not ( = ?auto_207343 ?auto_207347 ) ) ( not ( = ?auto_207343 ?auto_207348 ) ) ( ON ?auto_207345 ?auto_207344 ) ( ON ?auto_207346 ?auto_207345 ) ( ON ?auto_207343 ?auto_207346 ) ( not ( = ?auto_207344 ?auto_207345 ) ) ( not ( = ?auto_207344 ?auto_207346 ) ) ( not ( = ?auto_207344 ?auto_207343 ) ) ( not ( = ?auto_207344 ?auto_207347 ) ) ( not ( = ?auto_207344 ?auto_207348 ) ) ( not ( = ?auto_207345 ?auto_207346 ) ) ( not ( = ?auto_207345 ?auto_207343 ) ) ( not ( = ?auto_207345 ?auto_207347 ) ) ( not ( = ?auto_207345 ?auto_207348 ) ) ( not ( = ?auto_207346 ?auto_207343 ) ) ( not ( = ?auto_207346 ?auto_207347 ) ) ( not ( = ?auto_207346 ?auto_207348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207343 ?auto_207347 ?auto_207348 )
      ( MAKE-5CRATE-VERIFY ?auto_207344 ?auto_207345 ?auto_207346 ?auto_207343 ?auto_207347 ?auto_207348 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207384 - SURFACE
      ?auto_207385 - SURFACE
      ?auto_207386 - SURFACE
      ?auto_207383 - SURFACE
      ?auto_207387 - SURFACE
      ?auto_207388 - SURFACE
    )
    :vars
    (
      ?auto_207392 - HOIST
      ?auto_207391 - PLACE
      ?auto_207389 - TRUCK
      ?auto_207390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207392 ?auto_207391 ) ( SURFACE-AT ?auto_207387 ?auto_207391 ) ( CLEAR ?auto_207387 ) ( IS-CRATE ?auto_207388 ) ( not ( = ?auto_207387 ?auto_207388 ) ) ( AVAILABLE ?auto_207392 ) ( IN ?auto_207388 ?auto_207389 ) ( ON ?auto_207387 ?auto_207383 ) ( not ( = ?auto_207383 ?auto_207387 ) ) ( not ( = ?auto_207383 ?auto_207388 ) ) ( TRUCK-AT ?auto_207389 ?auto_207390 ) ( not ( = ?auto_207390 ?auto_207391 ) ) ( ON ?auto_207385 ?auto_207384 ) ( ON ?auto_207386 ?auto_207385 ) ( ON ?auto_207383 ?auto_207386 ) ( not ( = ?auto_207384 ?auto_207385 ) ) ( not ( = ?auto_207384 ?auto_207386 ) ) ( not ( = ?auto_207384 ?auto_207383 ) ) ( not ( = ?auto_207384 ?auto_207387 ) ) ( not ( = ?auto_207384 ?auto_207388 ) ) ( not ( = ?auto_207385 ?auto_207386 ) ) ( not ( = ?auto_207385 ?auto_207383 ) ) ( not ( = ?auto_207385 ?auto_207387 ) ) ( not ( = ?auto_207385 ?auto_207388 ) ) ( not ( = ?auto_207386 ?auto_207383 ) ) ( not ( = ?auto_207386 ?auto_207387 ) ) ( not ( = ?auto_207386 ?auto_207388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207383 ?auto_207387 ?auto_207388 )
      ( MAKE-5CRATE-VERIFY ?auto_207384 ?auto_207385 ?auto_207386 ?auto_207383 ?auto_207387 ?auto_207388 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207429 - SURFACE
      ?auto_207430 - SURFACE
      ?auto_207431 - SURFACE
      ?auto_207428 - SURFACE
      ?auto_207432 - SURFACE
      ?auto_207433 - SURFACE
    )
    :vars
    (
      ?auto_207437 - HOIST
      ?auto_207438 - PLACE
      ?auto_207435 - TRUCK
      ?auto_207436 - PLACE
      ?auto_207434 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_207437 ?auto_207438 ) ( SURFACE-AT ?auto_207432 ?auto_207438 ) ( CLEAR ?auto_207432 ) ( IS-CRATE ?auto_207433 ) ( not ( = ?auto_207432 ?auto_207433 ) ) ( AVAILABLE ?auto_207437 ) ( ON ?auto_207432 ?auto_207428 ) ( not ( = ?auto_207428 ?auto_207432 ) ) ( not ( = ?auto_207428 ?auto_207433 ) ) ( TRUCK-AT ?auto_207435 ?auto_207436 ) ( not ( = ?auto_207436 ?auto_207438 ) ) ( HOIST-AT ?auto_207434 ?auto_207436 ) ( LIFTING ?auto_207434 ?auto_207433 ) ( not ( = ?auto_207437 ?auto_207434 ) ) ( ON ?auto_207430 ?auto_207429 ) ( ON ?auto_207431 ?auto_207430 ) ( ON ?auto_207428 ?auto_207431 ) ( not ( = ?auto_207429 ?auto_207430 ) ) ( not ( = ?auto_207429 ?auto_207431 ) ) ( not ( = ?auto_207429 ?auto_207428 ) ) ( not ( = ?auto_207429 ?auto_207432 ) ) ( not ( = ?auto_207429 ?auto_207433 ) ) ( not ( = ?auto_207430 ?auto_207431 ) ) ( not ( = ?auto_207430 ?auto_207428 ) ) ( not ( = ?auto_207430 ?auto_207432 ) ) ( not ( = ?auto_207430 ?auto_207433 ) ) ( not ( = ?auto_207431 ?auto_207428 ) ) ( not ( = ?auto_207431 ?auto_207432 ) ) ( not ( = ?auto_207431 ?auto_207433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207428 ?auto_207432 ?auto_207433 )
      ( MAKE-5CRATE-VERIFY ?auto_207429 ?auto_207430 ?auto_207431 ?auto_207428 ?auto_207432 ?auto_207433 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207479 - SURFACE
      ?auto_207480 - SURFACE
      ?auto_207481 - SURFACE
      ?auto_207478 - SURFACE
      ?auto_207482 - SURFACE
      ?auto_207483 - SURFACE
    )
    :vars
    (
      ?auto_207485 - HOIST
      ?auto_207489 - PLACE
      ?auto_207486 - TRUCK
      ?auto_207488 - PLACE
      ?auto_207487 - HOIST
      ?auto_207484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207485 ?auto_207489 ) ( SURFACE-AT ?auto_207482 ?auto_207489 ) ( CLEAR ?auto_207482 ) ( IS-CRATE ?auto_207483 ) ( not ( = ?auto_207482 ?auto_207483 ) ) ( AVAILABLE ?auto_207485 ) ( ON ?auto_207482 ?auto_207478 ) ( not ( = ?auto_207478 ?auto_207482 ) ) ( not ( = ?auto_207478 ?auto_207483 ) ) ( TRUCK-AT ?auto_207486 ?auto_207488 ) ( not ( = ?auto_207488 ?auto_207489 ) ) ( HOIST-AT ?auto_207487 ?auto_207488 ) ( not ( = ?auto_207485 ?auto_207487 ) ) ( AVAILABLE ?auto_207487 ) ( SURFACE-AT ?auto_207483 ?auto_207488 ) ( ON ?auto_207483 ?auto_207484 ) ( CLEAR ?auto_207483 ) ( not ( = ?auto_207482 ?auto_207484 ) ) ( not ( = ?auto_207483 ?auto_207484 ) ) ( not ( = ?auto_207478 ?auto_207484 ) ) ( ON ?auto_207480 ?auto_207479 ) ( ON ?auto_207481 ?auto_207480 ) ( ON ?auto_207478 ?auto_207481 ) ( not ( = ?auto_207479 ?auto_207480 ) ) ( not ( = ?auto_207479 ?auto_207481 ) ) ( not ( = ?auto_207479 ?auto_207478 ) ) ( not ( = ?auto_207479 ?auto_207482 ) ) ( not ( = ?auto_207479 ?auto_207483 ) ) ( not ( = ?auto_207479 ?auto_207484 ) ) ( not ( = ?auto_207480 ?auto_207481 ) ) ( not ( = ?auto_207480 ?auto_207478 ) ) ( not ( = ?auto_207480 ?auto_207482 ) ) ( not ( = ?auto_207480 ?auto_207483 ) ) ( not ( = ?auto_207480 ?auto_207484 ) ) ( not ( = ?auto_207481 ?auto_207478 ) ) ( not ( = ?auto_207481 ?auto_207482 ) ) ( not ( = ?auto_207481 ?auto_207483 ) ) ( not ( = ?auto_207481 ?auto_207484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207478 ?auto_207482 ?auto_207483 )
      ( MAKE-5CRATE-VERIFY ?auto_207479 ?auto_207480 ?auto_207481 ?auto_207478 ?auto_207482 ?auto_207483 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207530 - SURFACE
      ?auto_207531 - SURFACE
      ?auto_207532 - SURFACE
      ?auto_207529 - SURFACE
      ?auto_207533 - SURFACE
      ?auto_207534 - SURFACE
    )
    :vars
    (
      ?auto_207540 - HOIST
      ?auto_207536 - PLACE
      ?auto_207537 - PLACE
      ?auto_207539 - HOIST
      ?auto_207538 - SURFACE
      ?auto_207535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207540 ?auto_207536 ) ( SURFACE-AT ?auto_207533 ?auto_207536 ) ( CLEAR ?auto_207533 ) ( IS-CRATE ?auto_207534 ) ( not ( = ?auto_207533 ?auto_207534 ) ) ( AVAILABLE ?auto_207540 ) ( ON ?auto_207533 ?auto_207529 ) ( not ( = ?auto_207529 ?auto_207533 ) ) ( not ( = ?auto_207529 ?auto_207534 ) ) ( not ( = ?auto_207537 ?auto_207536 ) ) ( HOIST-AT ?auto_207539 ?auto_207537 ) ( not ( = ?auto_207540 ?auto_207539 ) ) ( AVAILABLE ?auto_207539 ) ( SURFACE-AT ?auto_207534 ?auto_207537 ) ( ON ?auto_207534 ?auto_207538 ) ( CLEAR ?auto_207534 ) ( not ( = ?auto_207533 ?auto_207538 ) ) ( not ( = ?auto_207534 ?auto_207538 ) ) ( not ( = ?auto_207529 ?auto_207538 ) ) ( TRUCK-AT ?auto_207535 ?auto_207536 ) ( ON ?auto_207531 ?auto_207530 ) ( ON ?auto_207532 ?auto_207531 ) ( ON ?auto_207529 ?auto_207532 ) ( not ( = ?auto_207530 ?auto_207531 ) ) ( not ( = ?auto_207530 ?auto_207532 ) ) ( not ( = ?auto_207530 ?auto_207529 ) ) ( not ( = ?auto_207530 ?auto_207533 ) ) ( not ( = ?auto_207530 ?auto_207534 ) ) ( not ( = ?auto_207530 ?auto_207538 ) ) ( not ( = ?auto_207531 ?auto_207532 ) ) ( not ( = ?auto_207531 ?auto_207529 ) ) ( not ( = ?auto_207531 ?auto_207533 ) ) ( not ( = ?auto_207531 ?auto_207534 ) ) ( not ( = ?auto_207531 ?auto_207538 ) ) ( not ( = ?auto_207532 ?auto_207529 ) ) ( not ( = ?auto_207532 ?auto_207533 ) ) ( not ( = ?auto_207532 ?auto_207534 ) ) ( not ( = ?auto_207532 ?auto_207538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207529 ?auto_207533 ?auto_207534 )
      ( MAKE-5CRATE-VERIFY ?auto_207530 ?auto_207531 ?auto_207532 ?auto_207529 ?auto_207533 ?auto_207534 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207581 - SURFACE
      ?auto_207582 - SURFACE
      ?auto_207583 - SURFACE
      ?auto_207580 - SURFACE
      ?auto_207584 - SURFACE
      ?auto_207585 - SURFACE
    )
    :vars
    (
      ?auto_207588 - HOIST
      ?auto_207590 - PLACE
      ?auto_207589 - PLACE
      ?auto_207586 - HOIST
      ?auto_207587 - SURFACE
      ?auto_207591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207588 ?auto_207590 ) ( IS-CRATE ?auto_207585 ) ( not ( = ?auto_207584 ?auto_207585 ) ) ( not ( = ?auto_207580 ?auto_207584 ) ) ( not ( = ?auto_207580 ?auto_207585 ) ) ( not ( = ?auto_207589 ?auto_207590 ) ) ( HOIST-AT ?auto_207586 ?auto_207589 ) ( not ( = ?auto_207588 ?auto_207586 ) ) ( AVAILABLE ?auto_207586 ) ( SURFACE-AT ?auto_207585 ?auto_207589 ) ( ON ?auto_207585 ?auto_207587 ) ( CLEAR ?auto_207585 ) ( not ( = ?auto_207584 ?auto_207587 ) ) ( not ( = ?auto_207585 ?auto_207587 ) ) ( not ( = ?auto_207580 ?auto_207587 ) ) ( TRUCK-AT ?auto_207591 ?auto_207590 ) ( SURFACE-AT ?auto_207580 ?auto_207590 ) ( CLEAR ?auto_207580 ) ( LIFTING ?auto_207588 ?auto_207584 ) ( IS-CRATE ?auto_207584 ) ( ON ?auto_207582 ?auto_207581 ) ( ON ?auto_207583 ?auto_207582 ) ( ON ?auto_207580 ?auto_207583 ) ( not ( = ?auto_207581 ?auto_207582 ) ) ( not ( = ?auto_207581 ?auto_207583 ) ) ( not ( = ?auto_207581 ?auto_207580 ) ) ( not ( = ?auto_207581 ?auto_207584 ) ) ( not ( = ?auto_207581 ?auto_207585 ) ) ( not ( = ?auto_207581 ?auto_207587 ) ) ( not ( = ?auto_207582 ?auto_207583 ) ) ( not ( = ?auto_207582 ?auto_207580 ) ) ( not ( = ?auto_207582 ?auto_207584 ) ) ( not ( = ?auto_207582 ?auto_207585 ) ) ( not ( = ?auto_207582 ?auto_207587 ) ) ( not ( = ?auto_207583 ?auto_207580 ) ) ( not ( = ?auto_207583 ?auto_207584 ) ) ( not ( = ?auto_207583 ?auto_207585 ) ) ( not ( = ?auto_207583 ?auto_207587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207580 ?auto_207584 ?auto_207585 )
      ( MAKE-5CRATE-VERIFY ?auto_207581 ?auto_207582 ?auto_207583 ?auto_207580 ?auto_207584 ?auto_207585 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207632 - SURFACE
      ?auto_207633 - SURFACE
      ?auto_207634 - SURFACE
      ?auto_207631 - SURFACE
      ?auto_207635 - SURFACE
      ?auto_207636 - SURFACE
    )
    :vars
    (
      ?auto_207639 - HOIST
      ?auto_207642 - PLACE
      ?auto_207638 - PLACE
      ?auto_207637 - HOIST
      ?auto_207641 - SURFACE
      ?auto_207640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207639 ?auto_207642 ) ( IS-CRATE ?auto_207636 ) ( not ( = ?auto_207635 ?auto_207636 ) ) ( not ( = ?auto_207631 ?auto_207635 ) ) ( not ( = ?auto_207631 ?auto_207636 ) ) ( not ( = ?auto_207638 ?auto_207642 ) ) ( HOIST-AT ?auto_207637 ?auto_207638 ) ( not ( = ?auto_207639 ?auto_207637 ) ) ( AVAILABLE ?auto_207637 ) ( SURFACE-AT ?auto_207636 ?auto_207638 ) ( ON ?auto_207636 ?auto_207641 ) ( CLEAR ?auto_207636 ) ( not ( = ?auto_207635 ?auto_207641 ) ) ( not ( = ?auto_207636 ?auto_207641 ) ) ( not ( = ?auto_207631 ?auto_207641 ) ) ( TRUCK-AT ?auto_207640 ?auto_207642 ) ( SURFACE-AT ?auto_207631 ?auto_207642 ) ( CLEAR ?auto_207631 ) ( IS-CRATE ?auto_207635 ) ( AVAILABLE ?auto_207639 ) ( IN ?auto_207635 ?auto_207640 ) ( ON ?auto_207633 ?auto_207632 ) ( ON ?auto_207634 ?auto_207633 ) ( ON ?auto_207631 ?auto_207634 ) ( not ( = ?auto_207632 ?auto_207633 ) ) ( not ( = ?auto_207632 ?auto_207634 ) ) ( not ( = ?auto_207632 ?auto_207631 ) ) ( not ( = ?auto_207632 ?auto_207635 ) ) ( not ( = ?auto_207632 ?auto_207636 ) ) ( not ( = ?auto_207632 ?auto_207641 ) ) ( not ( = ?auto_207633 ?auto_207634 ) ) ( not ( = ?auto_207633 ?auto_207631 ) ) ( not ( = ?auto_207633 ?auto_207635 ) ) ( not ( = ?auto_207633 ?auto_207636 ) ) ( not ( = ?auto_207633 ?auto_207641 ) ) ( not ( = ?auto_207634 ?auto_207631 ) ) ( not ( = ?auto_207634 ?auto_207635 ) ) ( not ( = ?auto_207634 ?auto_207636 ) ) ( not ( = ?auto_207634 ?auto_207641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207631 ?auto_207635 ?auto_207636 )
      ( MAKE-5CRATE-VERIFY ?auto_207632 ?auto_207633 ?auto_207634 ?auto_207631 ?auto_207635 ?auto_207636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_208623 - SURFACE
      ?auto_208624 - SURFACE
    )
    :vars
    (
      ?auto_208626 - HOIST
      ?auto_208630 - PLACE
      ?auto_208627 - SURFACE
      ?auto_208625 - PLACE
      ?auto_208628 - HOIST
      ?auto_208631 - SURFACE
      ?auto_208629 - TRUCK
      ?auto_208632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208626 ?auto_208630 ) ( SURFACE-AT ?auto_208623 ?auto_208630 ) ( CLEAR ?auto_208623 ) ( IS-CRATE ?auto_208624 ) ( not ( = ?auto_208623 ?auto_208624 ) ) ( ON ?auto_208623 ?auto_208627 ) ( not ( = ?auto_208627 ?auto_208623 ) ) ( not ( = ?auto_208627 ?auto_208624 ) ) ( not ( = ?auto_208625 ?auto_208630 ) ) ( HOIST-AT ?auto_208628 ?auto_208625 ) ( not ( = ?auto_208626 ?auto_208628 ) ) ( AVAILABLE ?auto_208628 ) ( SURFACE-AT ?auto_208624 ?auto_208625 ) ( ON ?auto_208624 ?auto_208631 ) ( CLEAR ?auto_208624 ) ( not ( = ?auto_208623 ?auto_208631 ) ) ( not ( = ?auto_208624 ?auto_208631 ) ) ( not ( = ?auto_208627 ?auto_208631 ) ) ( TRUCK-AT ?auto_208629 ?auto_208630 ) ( LIFTING ?auto_208626 ?auto_208632 ) ( IS-CRATE ?auto_208632 ) ( not ( = ?auto_208623 ?auto_208632 ) ) ( not ( = ?auto_208624 ?auto_208632 ) ) ( not ( = ?auto_208627 ?auto_208632 ) ) ( not ( = ?auto_208631 ?auto_208632 ) ) )
    :subtasks
    ( ( !LOAD ?auto_208626 ?auto_208632 ?auto_208629 ?auto_208630 )
      ( MAKE-1CRATE ?auto_208623 ?auto_208624 )
      ( MAKE-1CRATE-VERIFY ?auto_208623 ?auto_208624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208839 - SURFACE
      ?auto_208840 - SURFACE
      ?auto_208841 - SURFACE
      ?auto_208838 - SURFACE
      ?auto_208842 - SURFACE
      ?auto_208844 - SURFACE
      ?auto_208843 - SURFACE
    )
    :vars
    (
      ?auto_208846 - HOIST
      ?auto_208845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208846 ?auto_208845 ) ( SURFACE-AT ?auto_208844 ?auto_208845 ) ( CLEAR ?auto_208844 ) ( LIFTING ?auto_208846 ?auto_208843 ) ( IS-CRATE ?auto_208843 ) ( not ( = ?auto_208844 ?auto_208843 ) ) ( ON ?auto_208840 ?auto_208839 ) ( ON ?auto_208841 ?auto_208840 ) ( ON ?auto_208838 ?auto_208841 ) ( ON ?auto_208842 ?auto_208838 ) ( ON ?auto_208844 ?auto_208842 ) ( not ( = ?auto_208839 ?auto_208840 ) ) ( not ( = ?auto_208839 ?auto_208841 ) ) ( not ( = ?auto_208839 ?auto_208838 ) ) ( not ( = ?auto_208839 ?auto_208842 ) ) ( not ( = ?auto_208839 ?auto_208844 ) ) ( not ( = ?auto_208839 ?auto_208843 ) ) ( not ( = ?auto_208840 ?auto_208841 ) ) ( not ( = ?auto_208840 ?auto_208838 ) ) ( not ( = ?auto_208840 ?auto_208842 ) ) ( not ( = ?auto_208840 ?auto_208844 ) ) ( not ( = ?auto_208840 ?auto_208843 ) ) ( not ( = ?auto_208841 ?auto_208838 ) ) ( not ( = ?auto_208841 ?auto_208842 ) ) ( not ( = ?auto_208841 ?auto_208844 ) ) ( not ( = ?auto_208841 ?auto_208843 ) ) ( not ( = ?auto_208838 ?auto_208842 ) ) ( not ( = ?auto_208838 ?auto_208844 ) ) ( not ( = ?auto_208838 ?auto_208843 ) ) ( not ( = ?auto_208842 ?auto_208844 ) ) ( not ( = ?auto_208842 ?auto_208843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_208844 ?auto_208843 )
      ( MAKE-6CRATE-VERIFY ?auto_208839 ?auto_208840 ?auto_208841 ?auto_208838 ?auto_208842 ?auto_208844 ?auto_208843 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208883 - SURFACE
      ?auto_208884 - SURFACE
      ?auto_208885 - SURFACE
      ?auto_208882 - SURFACE
      ?auto_208886 - SURFACE
      ?auto_208888 - SURFACE
      ?auto_208887 - SURFACE
    )
    :vars
    (
      ?auto_208891 - HOIST
      ?auto_208889 - PLACE
      ?auto_208890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208891 ?auto_208889 ) ( SURFACE-AT ?auto_208888 ?auto_208889 ) ( CLEAR ?auto_208888 ) ( IS-CRATE ?auto_208887 ) ( not ( = ?auto_208888 ?auto_208887 ) ) ( TRUCK-AT ?auto_208890 ?auto_208889 ) ( AVAILABLE ?auto_208891 ) ( IN ?auto_208887 ?auto_208890 ) ( ON ?auto_208888 ?auto_208886 ) ( not ( = ?auto_208886 ?auto_208888 ) ) ( not ( = ?auto_208886 ?auto_208887 ) ) ( ON ?auto_208884 ?auto_208883 ) ( ON ?auto_208885 ?auto_208884 ) ( ON ?auto_208882 ?auto_208885 ) ( ON ?auto_208886 ?auto_208882 ) ( not ( = ?auto_208883 ?auto_208884 ) ) ( not ( = ?auto_208883 ?auto_208885 ) ) ( not ( = ?auto_208883 ?auto_208882 ) ) ( not ( = ?auto_208883 ?auto_208886 ) ) ( not ( = ?auto_208883 ?auto_208888 ) ) ( not ( = ?auto_208883 ?auto_208887 ) ) ( not ( = ?auto_208884 ?auto_208885 ) ) ( not ( = ?auto_208884 ?auto_208882 ) ) ( not ( = ?auto_208884 ?auto_208886 ) ) ( not ( = ?auto_208884 ?auto_208888 ) ) ( not ( = ?auto_208884 ?auto_208887 ) ) ( not ( = ?auto_208885 ?auto_208882 ) ) ( not ( = ?auto_208885 ?auto_208886 ) ) ( not ( = ?auto_208885 ?auto_208888 ) ) ( not ( = ?auto_208885 ?auto_208887 ) ) ( not ( = ?auto_208882 ?auto_208886 ) ) ( not ( = ?auto_208882 ?auto_208888 ) ) ( not ( = ?auto_208882 ?auto_208887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208886 ?auto_208888 ?auto_208887 )
      ( MAKE-6CRATE-VERIFY ?auto_208883 ?auto_208884 ?auto_208885 ?auto_208882 ?auto_208886 ?auto_208888 ?auto_208887 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208934 - SURFACE
      ?auto_208935 - SURFACE
      ?auto_208936 - SURFACE
      ?auto_208933 - SURFACE
      ?auto_208937 - SURFACE
      ?auto_208939 - SURFACE
      ?auto_208938 - SURFACE
    )
    :vars
    (
      ?auto_208943 - HOIST
      ?auto_208940 - PLACE
      ?auto_208941 - TRUCK
      ?auto_208942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208943 ?auto_208940 ) ( SURFACE-AT ?auto_208939 ?auto_208940 ) ( CLEAR ?auto_208939 ) ( IS-CRATE ?auto_208938 ) ( not ( = ?auto_208939 ?auto_208938 ) ) ( AVAILABLE ?auto_208943 ) ( IN ?auto_208938 ?auto_208941 ) ( ON ?auto_208939 ?auto_208937 ) ( not ( = ?auto_208937 ?auto_208939 ) ) ( not ( = ?auto_208937 ?auto_208938 ) ) ( TRUCK-AT ?auto_208941 ?auto_208942 ) ( not ( = ?auto_208942 ?auto_208940 ) ) ( ON ?auto_208935 ?auto_208934 ) ( ON ?auto_208936 ?auto_208935 ) ( ON ?auto_208933 ?auto_208936 ) ( ON ?auto_208937 ?auto_208933 ) ( not ( = ?auto_208934 ?auto_208935 ) ) ( not ( = ?auto_208934 ?auto_208936 ) ) ( not ( = ?auto_208934 ?auto_208933 ) ) ( not ( = ?auto_208934 ?auto_208937 ) ) ( not ( = ?auto_208934 ?auto_208939 ) ) ( not ( = ?auto_208934 ?auto_208938 ) ) ( not ( = ?auto_208935 ?auto_208936 ) ) ( not ( = ?auto_208935 ?auto_208933 ) ) ( not ( = ?auto_208935 ?auto_208937 ) ) ( not ( = ?auto_208935 ?auto_208939 ) ) ( not ( = ?auto_208935 ?auto_208938 ) ) ( not ( = ?auto_208936 ?auto_208933 ) ) ( not ( = ?auto_208936 ?auto_208937 ) ) ( not ( = ?auto_208936 ?auto_208939 ) ) ( not ( = ?auto_208936 ?auto_208938 ) ) ( not ( = ?auto_208933 ?auto_208937 ) ) ( not ( = ?auto_208933 ?auto_208939 ) ) ( not ( = ?auto_208933 ?auto_208938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208937 ?auto_208939 ?auto_208938 )
      ( MAKE-6CRATE-VERIFY ?auto_208934 ?auto_208935 ?auto_208936 ?auto_208933 ?auto_208937 ?auto_208939 ?auto_208938 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208991 - SURFACE
      ?auto_208992 - SURFACE
      ?auto_208993 - SURFACE
      ?auto_208990 - SURFACE
      ?auto_208994 - SURFACE
      ?auto_208996 - SURFACE
      ?auto_208995 - SURFACE
    )
    :vars
    (
      ?auto_208997 - HOIST
      ?auto_208999 - PLACE
      ?auto_209000 - TRUCK
      ?auto_209001 - PLACE
      ?auto_208998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_208997 ?auto_208999 ) ( SURFACE-AT ?auto_208996 ?auto_208999 ) ( CLEAR ?auto_208996 ) ( IS-CRATE ?auto_208995 ) ( not ( = ?auto_208996 ?auto_208995 ) ) ( AVAILABLE ?auto_208997 ) ( ON ?auto_208996 ?auto_208994 ) ( not ( = ?auto_208994 ?auto_208996 ) ) ( not ( = ?auto_208994 ?auto_208995 ) ) ( TRUCK-AT ?auto_209000 ?auto_209001 ) ( not ( = ?auto_209001 ?auto_208999 ) ) ( HOIST-AT ?auto_208998 ?auto_209001 ) ( LIFTING ?auto_208998 ?auto_208995 ) ( not ( = ?auto_208997 ?auto_208998 ) ) ( ON ?auto_208992 ?auto_208991 ) ( ON ?auto_208993 ?auto_208992 ) ( ON ?auto_208990 ?auto_208993 ) ( ON ?auto_208994 ?auto_208990 ) ( not ( = ?auto_208991 ?auto_208992 ) ) ( not ( = ?auto_208991 ?auto_208993 ) ) ( not ( = ?auto_208991 ?auto_208990 ) ) ( not ( = ?auto_208991 ?auto_208994 ) ) ( not ( = ?auto_208991 ?auto_208996 ) ) ( not ( = ?auto_208991 ?auto_208995 ) ) ( not ( = ?auto_208992 ?auto_208993 ) ) ( not ( = ?auto_208992 ?auto_208990 ) ) ( not ( = ?auto_208992 ?auto_208994 ) ) ( not ( = ?auto_208992 ?auto_208996 ) ) ( not ( = ?auto_208992 ?auto_208995 ) ) ( not ( = ?auto_208993 ?auto_208990 ) ) ( not ( = ?auto_208993 ?auto_208994 ) ) ( not ( = ?auto_208993 ?auto_208996 ) ) ( not ( = ?auto_208993 ?auto_208995 ) ) ( not ( = ?auto_208990 ?auto_208994 ) ) ( not ( = ?auto_208990 ?auto_208996 ) ) ( not ( = ?auto_208990 ?auto_208995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208994 ?auto_208996 ?auto_208995 )
      ( MAKE-6CRATE-VERIFY ?auto_208991 ?auto_208992 ?auto_208993 ?auto_208990 ?auto_208994 ?auto_208996 ?auto_208995 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209054 - SURFACE
      ?auto_209055 - SURFACE
      ?auto_209056 - SURFACE
      ?auto_209053 - SURFACE
      ?auto_209057 - SURFACE
      ?auto_209059 - SURFACE
      ?auto_209058 - SURFACE
    )
    :vars
    (
      ?auto_209060 - HOIST
      ?auto_209065 - PLACE
      ?auto_209061 - TRUCK
      ?auto_209064 - PLACE
      ?auto_209062 - HOIST
      ?auto_209063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209060 ?auto_209065 ) ( SURFACE-AT ?auto_209059 ?auto_209065 ) ( CLEAR ?auto_209059 ) ( IS-CRATE ?auto_209058 ) ( not ( = ?auto_209059 ?auto_209058 ) ) ( AVAILABLE ?auto_209060 ) ( ON ?auto_209059 ?auto_209057 ) ( not ( = ?auto_209057 ?auto_209059 ) ) ( not ( = ?auto_209057 ?auto_209058 ) ) ( TRUCK-AT ?auto_209061 ?auto_209064 ) ( not ( = ?auto_209064 ?auto_209065 ) ) ( HOIST-AT ?auto_209062 ?auto_209064 ) ( not ( = ?auto_209060 ?auto_209062 ) ) ( AVAILABLE ?auto_209062 ) ( SURFACE-AT ?auto_209058 ?auto_209064 ) ( ON ?auto_209058 ?auto_209063 ) ( CLEAR ?auto_209058 ) ( not ( = ?auto_209059 ?auto_209063 ) ) ( not ( = ?auto_209058 ?auto_209063 ) ) ( not ( = ?auto_209057 ?auto_209063 ) ) ( ON ?auto_209055 ?auto_209054 ) ( ON ?auto_209056 ?auto_209055 ) ( ON ?auto_209053 ?auto_209056 ) ( ON ?auto_209057 ?auto_209053 ) ( not ( = ?auto_209054 ?auto_209055 ) ) ( not ( = ?auto_209054 ?auto_209056 ) ) ( not ( = ?auto_209054 ?auto_209053 ) ) ( not ( = ?auto_209054 ?auto_209057 ) ) ( not ( = ?auto_209054 ?auto_209059 ) ) ( not ( = ?auto_209054 ?auto_209058 ) ) ( not ( = ?auto_209054 ?auto_209063 ) ) ( not ( = ?auto_209055 ?auto_209056 ) ) ( not ( = ?auto_209055 ?auto_209053 ) ) ( not ( = ?auto_209055 ?auto_209057 ) ) ( not ( = ?auto_209055 ?auto_209059 ) ) ( not ( = ?auto_209055 ?auto_209058 ) ) ( not ( = ?auto_209055 ?auto_209063 ) ) ( not ( = ?auto_209056 ?auto_209053 ) ) ( not ( = ?auto_209056 ?auto_209057 ) ) ( not ( = ?auto_209056 ?auto_209059 ) ) ( not ( = ?auto_209056 ?auto_209058 ) ) ( not ( = ?auto_209056 ?auto_209063 ) ) ( not ( = ?auto_209053 ?auto_209057 ) ) ( not ( = ?auto_209053 ?auto_209059 ) ) ( not ( = ?auto_209053 ?auto_209058 ) ) ( not ( = ?auto_209053 ?auto_209063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209057 ?auto_209059 ?auto_209058 )
      ( MAKE-6CRATE-VERIFY ?auto_209054 ?auto_209055 ?auto_209056 ?auto_209053 ?auto_209057 ?auto_209059 ?auto_209058 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209118 - SURFACE
      ?auto_209119 - SURFACE
      ?auto_209120 - SURFACE
      ?auto_209117 - SURFACE
      ?auto_209121 - SURFACE
      ?auto_209123 - SURFACE
      ?auto_209122 - SURFACE
    )
    :vars
    (
      ?auto_209127 - HOIST
      ?auto_209125 - PLACE
      ?auto_209126 - PLACE
      ?auto_209128 - HOIST
      ?auto_209129 - SURFACE
      ?auto_209124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209127 ?auto_209125 ) ( SURFACE-AT ?auto_209123 ?auto_209125 ) ( CLEAR ?auto_209123 ) ( IS-CRATE ?auto_209122 ) ( not ( = ?auto_209123 ?auto_209122 ) ) ( AVAILABLE ?auto_209127 ) ( ON ?auto_209123 ?auto_209121 ) ( not ( = ?auto_209121 ?auto_209123 ) ) ( not ( = ?auto_209121 ?auto_209122 ) ) ( not ( = ?auto_209126 ?auto_209125 ) ) ( HOIST-AT ?auto_209128 ?auto_209126 ) ( not ( = ?auto_209127 ?auto_209128 ) ) ( AVAILABLE ?auto_209128 ) ( SURFACE-AT ?auto_209122 ?auto_209126 ) ( ON ?auto_209122 ?auto_209129 ) ( CLEAR ?auto_209122 ) ( not ( = ?auto_209123 ?auto_209129 ) ) ( not ( = ?auto_209122 ?auto_209129 ) ) ( not ( = ?auto_209121 ?auto_209129 ) ) ( TRUCK-AT ?auto_209124 ?auto_209125 ) ( ON ?auto_209119 ?auto_209118 ) ( ON ?auto_209120 ?auto_209119 ) ( ON ?auto_209117 ?auto_209120 ) ( ON ?auto_209121 ?auto_209117 ) ( not ( = ?auto_209118 ?auto_209119 ) ) ( not ( = ?auto_209118 ?auto_209120 ) ) ( not ( = ?auto_209118 ?auto_209117 ) ) ( not ( = ?auto_209118 ?auto_209121 ) ) ( not ( = ?auto_209118 ?auto_209123 ) ) ( not ( = ?auto_209118 ?auto_209122 ) ) ( not ( = ?auto_209118 ?auto_209129 ) ) ( not ( = ?auto_209119 ?auto_209120 ) ) ( not ( = ?auto_209119 ?auto_209117 ) ) ( not ( = ?auto_209119 ?auto_209121 ) ) ( not ( = ?auto_209119 ?auto_209123 ) ) ( not ( = ?auto_209119 ?auto_209122 ) ) ( not ( = ?auto_209119 ?auto_209129 ) ) ( not ( = ?auto_209120 ?auto_209117 ) ) ( not ( = ?auto_209120 ?auto_209121 ) ) ( not ( = ?auto_209120 ?auto_209123 ) ) ( not ( = ?auto_209120 ?auto_209122 ) ) ( not ( = ?auto_209120 ?auto_209129 ) ) ( not ( = ?auto_209117 ?auto_209121 ) ) ( not ( = ?auto_209117 ?auto_209123 ) ) ( not ( = ?auto_209117 ?auto_209122 ) ) ( not ( = ?auto_209117 ?auto_209129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209121 ?auto_209123 ?auto_209122 )
      ( MAKE-6CRATE-VERIFY ?auto_209118 ?auto_209119 ?auto_209120 ?auto_209117 ?auto_209121 ?auto_209123 ?auto_209122 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209182 - SURFACE
      ?auto_209183 - SURFACE
      ?auto_209184 - SURFACE
      ?auto_209181 - SURFACE
      ?auto_209185 - SURFACE
      ?auto_209187 - SURFACE
      ?auto_209186 - SURFACE
    )
    :vars
    (
      ?auto_209188 - HOIST
      ?auto_209189 - PLACE
      ?auto_209190 - PLACE
      ?auto_209193 - HOIST
      ?auto_209192 - SURFACE
      ?auto_209191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209188 ?auto_209189 ) ( IS-CRATE ?auto_209186 ) ( not ( = ?auto_209187 ?auto_209186 ) ) ( not ( = ?auto_209185 ?auto_209187 ) ) ( not ( = ?auto_209185 ?auto_209186 ) ) ( not ( = ?auto_209190 ?auto_209189 ) ) ( HOIST-AT ?auto_209193 ?auto_209190 ) ( not ( = ?auto_209188 ?auto_209193 ) ) ( AVAILABLE ?auto_209193 ) ( SURFACE-AT ?auto_209186 ?auto_209190 ) ( ON ?auto_209186 ?auto_209192 ) ( CLEAR ?auto_209186 ) ( not ( = ?auto_209187 ?auto_209192 ) ) ( not ( = ?auto_209186 ?auto_209192 ) ) ( not ( = ?auto_209185 ?auto_209192 ) ) ( TRUCK-AT ?auto_209191 ?auto_209189 ) ( SURFACE-AT ?auto_209185 ?auto_209189 ) ( CLEAR ?auto_209185 ) ( LIFTING ?auto_209188 ?auto_209187 ) ( IS-CRATE ?auto_209187 ) ( ON ?auto_209183 ?auto_209182 ) ( ON ?auto_209184 ?auto_209183 ) ( ON ?auto_209181 ?auto_209184 ) ( ON ?auto_209185 ?auto_209181 ) ( not ( = ?auto_209182 ?auto_209183 ) ) ( not ( = ?auto_209182 ?auto_209184 ) ) ( not ( = ?auto_209182 ?auto_209181 ) ) ( not ( = ?auto_209182 ?auto_209185 ) ) ( not ( = ?auto_209182 ?auto_209187 ) ) ( not ( = ?auto_209182 ?auto_209186 ) ) ( not ( = ?auto_209182 ?auto_209192 ) ) ( not ( = ?auto_209183 ?auto_209184 ) ) ( not ( = ?auto_209183 ?auto_209181 ) ) ( not ( = ?auto_209183 ?auto_209185 ) ) ( not ( = ?auto_209183 ?auto_209187 ) ) ( not ( = ?auto_209183 ?auto_209186 ) ) ( not ( = ?auto_209183 ?auto_209192 ) ) ( not ( = ?auto_209184 ?auto_209181 ) ) ( not ( = ?auto_209184 ?auto_209185 ) ) ( not ( = ?auto_209184 ?auto_209187 ) ) ( not ( = ?auto_209184 ?auto_209186 ) ) ( not ( = ?auto_209184 ?auto_209192 ) ) ( not ( = ?auto_209181 ?auto_209185 ) ) ( not ( = ?auto_209181 ?auto_209187 ) ) ( not ( = ?auto_209181 ?auto_209186 ) ) ( not ( = ?auto_209181 ?auto_209192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209185 ?auto_209187 ?auto_209186 )
      ( MAKE-6CRATE-VERIFY ?auto_209182 ?auto_209183 ?auto_209184 ?auto_209181 ?auto_209185 ?auto_209187 ?auto_209186 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209246 - SURFACE
      ?auto_209247 - SURFACE
      ?auto_209248 - SURFACE
      ?auto_209245 - SURFACE
      ?auto_209249 - SURFACE
      ?auto_209251 - SURFACE
      ?auto_209250 - SURFACE
    )
    :vars
    (
      ?auto_209256 - HOIST
      ?auto_209253 - PLACE
      ?auto_209255 - PLACE
      ?auto_209257 - HOIST
      ?auto_209252 - SURFACE
      ?auto_209254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209256 ?auto_209253 ) ( IS-CRATE ?auto_209250 ) ( not ( = ?auto_209251 ?auto_209250 ) ) ( not ( = ?auto_209249 ?auto_209251 ) ) ( not ( = ?auto_209249 ?auto_209250 ) ) ( not ( = ?auto_209255 ?auto_209253 ) ) ( HOIST-AT ?auto_209257 ?auto_209255 ) ( not ( = ?auto_209256 ?auto_209257 ) ) ( AVAILABLE ?auto_209257 ) ( SURFACE-AT ?auto_209250 ?auto_209255 ) ( ON ?auto_209250 ?auto_209252 ) ( CLEAR ?auto_209250 ) ( not ( = ?auto_209251 ?auto_209252 ) ) ( not ( = ?auto_209250 ?auto_209252 ) ) ( not ( = ?auto_209249 ?auto_209252 ) ) ( TRUCK-AT ?auto_209254 ?auto_209253 ) ( SURFACE-AT ?auto_209249 ?auto_209253 ) ( CLEAR ?auto_209249 ) ( IS-CRATE ?auto_209251 ) ( AVAILABLE ?auto_209256 ) ( IN ?auto_209251 ?auto_209254 ) ( ON ?auto_209247 ?auto_209246 ) ( ON ?auto_209248 ?auto_209247 ) ( ON ?auto_209245 ?auto_209248 ) ( ON ?auto_209249 ?auto_209245 ) ( not ( = ?auto_209246 ?auto_209247 ) ) ( not ( = ?auto_209246 ?auto_209248 ) ) ( not ( = ?auto_209246 ?auto_209245 ) ) ( not ( = ?auto_209246 ?auto_209249 ) ) ( not ( = ?auto_209246 ?auto_209251 ) ) ( not ( = ?auto_209246 ?auto_209250 ) ) ( not ( = ?auto_209246 ?auto_209252 ) ) ( not ( = ?auto_209247 ?auto_209248 ) ) ( not ( = ?auto_209247 ?auto_209245 ) ) ( not ( = ?auto_209247 ?auto_209249 ) ) ( not ( = ?auto_209247 ?auto_209251 ) ) ( not ( = ?auto_209247 ?auto_209250 ) ) ( not ( = ?auto_209247 ?auto_209252 ) ) ( not ( = ?auto_209248 ?auto_209245 ) ) ( not ( = ?auto_209248 ?auto_209249 ) ) ( not ( = ?auto_209248 ?auto_209251 ) ) ( not ( = ?auto_209248 ?auto_209250 ) ) ( not ( = ?auto_209248 ?auto_209252 ) ) ( not ( = ?auto_209245 ?auto_209249 ) ) ( not ( = ?auto_209245 ?auto_209251 ) ) ( not ( = ?auto_209245 ?auto_209250 ) ) ( not ( = ?auto_209245 ?auto_209252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209249 ?auto_209251 ?auto_209250 )
      ( MAKE-6CRATE-VERIFY ?auto_209246 ?auto_209247 ?auto_209248 ?auto_209245 ?auto_209249 ?auto_209251 ?auto_209250 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211183 - SURFACE
      ?auto_211184 - SURFACE
      ?auto_211185 - SURFACE
      ?auto_211182 - SURFACE
      ?auto_211186 - SURFACE
      ?auto_211188 - SURFACE
      ?auto_211187 - SURFACE
      ?auto_211189 - SURFACE
    )
    :vars
    (
      ?auto_211191 - HOIST
      ?auto_211190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211191 ?auto_211190 ) ( SURFACE-AT ?auto_211187 ?auto_211190 ) ( CLEAR ?auto_211187 ) ( LIFTING ?auto_211191 ?auto_211189 ) ( IS-CRATE ?auto_211189 ) ( not ( = ?auto_211187 ?auto_211189 ) ) ( ON ?auto_211184 ?auto_211183 ) ( ON ?auto_211185 ?auto_211184 ) ( ON ?auto_211182 ?auto_211185 ) ( ON ?auto_211186 ?auto_211182 ) ( ON ?auto_211188 ?auto_211186 ) ( ON ?auto_211187 ?auto_211188 ) ( not ( = ?auto_211183 ?auto_211184 ) ) ( not ( = ?auto_211183 ?auto_211185 ) ) ( not ( = ?auto_211183 ?auto_211182 ) ) ( not ( = ?auto_211183 ?auto_211186 ) ) ( not ( = ?auto_211183 ?auto_211188 ) ) ( not ( = ?auto_211183 ?auto_211187 ) ) ( not ( = ?auto_211183 ?auto_211189 ) ) ( not ( = ?auto_211184 ?auto_211185 ) ) ( not ( = ?auto_211184 ?auto_211182 ) ) ( not ( = ?auto_211184 ?auto_211186 ) ) ( not ( = ?auto_211184 ?auto_211188 ) ) ( not ( = ?auto_211184 ?auto_211187 ) ) ( not ( = ?auto_211184 ?auto_211189 ) ) ( not ( = ?auto_211185 ?auto_211182 ) ) ( not ( = ?auto_211185 ?auto_211186 ) ) ( not ( = ?auto_211185 ?auto_211188 ) ) ( not ( = ?auto_211185 ?auto_211187 ) ) ( not ( = ?auto_211185 ?auto_211189 ) ) ( not ( = ?auto_211182 ?auto_211186 ) ) ( not ( = ?auto_211182 ?auto_211188 ) ) ( not ( = ?auto_211182 ?auto_211187 ) ) ( not ( = ?auto_211182 ?auto_211189 ) ) ( not ( = ?auto_211186 ?auto_211188 ) ) ( not ( = ?auto_211186 ?auto_211187 ) ) ( not ( = ?auto_211186 ?auto_211189 ) ) ( not ( = ?auto_211188 ?auto_211187 ) ) ( not ( = ?auto_211188 ?auto_211189 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_211187 ?auto_211189 )
      ( MAKE-7CRATE-VERIFY ?auto_211183 ?auto_211184 ?auto_211185 ?auto_211182 ?auto_211186 ?auto_211188 ?auto_211187 ?auto_211189 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211238 - SURFACE
      ?auto_211239 - SURFACE
      ?auto_211240 - SURFACE
      ?auto_211237 - SURFACE
      ?auto_211241 - SURFACE
      ?auto_211243 - SURFACE
      ?auto_211242 - SURFACE
      ?auto_211244 - SURFACE
    )
    :vars
    (
      ?auto_211247 - HOIST
      ?auto_211245 - PLACE
      ?auto_211246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211247 ?auto_211245 ) ( SURFACE-AT ?auto_211242 ?auto_211245 ) ( CLEAR ?auto_211242 ) ( IS-CRATE ?auto_211244 ) ( not ( = ?auto_211242 ?auto_211244 ) ) ( TRUCK-AT ?auto_211246 ?auto_211245 ) ( AVAILABLE ?auto_211247 ) ( IN ?auto_211244 ?auto_211246 ) ( ON ?auto_211242 ?auto_211243 ) ( not ( = ?auto_211243 ?auto_211242 ) ) ( not ( = ?auto_211243 ?auto_211244 ) ) ( ON ?auto_211239 ?auto_211238 ) ( ON ?auto_211240 ?auto_211239 ) ( ON ?auto_211237 ?auto_211240 ) ( ON ?auto_211241 ?auto_211237 ) ( ON ?auto_211243 ?auto_211241 ) ( not ( = ?auto_211238 ?auto_211239 ) ) ( not ( = ?auto_211238 ?auto_211240 ) ) ( not ( = ?auto_211238 ?auto_211237 ) ) ( not ( = ?auto_211238 ?auto_211241 ) ) ( not ( = ?auto_211238 ?auto_211243 ) ) ( not ( = ?auto_211238 ?auto_211242 ) ) ( not ( = ?auto_211238 ?auto_211244 ) ) ( not ( = ?auto_211239 ?auto_211240 ) ) ( not ( = ?auto_211239 ?auto_211237 ) ) ( not ( = ?auto_211239 ?auto_211241 ) ) ( not ( = ?auto_211239 ?auto_211243 ) ) ( not ( = ?auto_211239 ?auto_211242 ) ) ( not ( = ?auto_211239 ?auto_211244 ) ) ( not ( = ?auto_211240 ?auto_211237 ) ) ( not ( = ?auto_211240 ?auto_211241 ) ) ( not ( = ?auto_211240 ?auto_211243 ) ) ( not ( = ?auto_211240 ?auto_211242 ) ) ( not ( = ?auto_211240 ?auto_211244 ) ) ( not ( = ?auto_211237 ?auto_211241 ) ) ( not ( = ?auto_211237 ?auto_211243 ) ) ( not ( = ?auto_211237 ?auto_211242 ) ) ( not ( = ?auto_211237 ?auto_211244 ) ) ( not ( = ?auto_211241 ?auto_211243 ) ) ( not ( = ?auto_211241 ?auto_211242 ) ) ( not ( = ?auto_211241 ?auto_211244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211243 ?auto_211242 ?auto_211244 )
      ( MAKE-7CRATE-VERIFY ?auto_211238 ?auto_211239 ?auto_211240 ?auto_211237 ?auto_211241 ?auto_211243 ?auto_211242 ?auto_211244 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211301 - SURFACE
      ?auto_211302 - SURFACE
      ?auto_211303 - SURFACE
      ?auto_211300 - SURFACE
      ?auto_211304 - SURFACE
      ?auto_211306 - SURFACE
      ?auto_211305 - SURFACE
      ?auto_211307 - SURFACE
    )
    :vars
    (
      ?auto_211309 - HOIST
      ?auto_211310 - PLACE
      ?auto_211308 - TRUCK
      ?auto_211311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211309 ?auto_211310 ) ( SURFACE-AT ?auto_211305 ?auto_211310 ) ( CLEAR ?auto_211305 ) ( IS-CRATE ?auto_211307 ) ( not ( = ?auto_211305 ?auto_211307 ) ) ( AVAILABLE ?auto_211309 ) ( IN ?auto_211307 ?auto_211308 ) ( ON ?auto_211305 ?auto_211306 ) ( not ( = ?auto_211306 ?auto_211305 ) ) ( not ( = ?auto_211306 ?auto_211307 ) ) ( TRUCK-AT ?auto_211308 ?auto_211311 ) ( not ( = ?auto_211311 ?auto_211310 ) ) ( ON ?auto_211302 ?auto_211301 ) ( ON ?auto_211303 ?auto_211302 ) ( ON ?auto_211300 ?auto_211303 ) ( ON ?auto_211304 ?auto_211300 ) ( ON ?auto_211306 ?auto_211304 ) ( not ( = ?auto_211301 ?auto_211302 ) ) ( not ( = ?auto_211301 ?auto_211303 ) ) ( not ( = ?auto_211301 ?auto_211300 ) ) ( not ( = ?auto_211301 ?auto_211304 ) ) ( not ( = ?auto_211301 ?auto_211306 ) ) ( not ( = ?auto_211301 ?auto_211305 ) ) ( not ( = ?auto_211301 ?auto_211307 ) ) ( not ( = ?auto_211302 ?auto_211303 ) ) ( not ( = ?auto_211302 ?auto_211300 ) ) ( not ( = ?auto_211302 ?auto_211304 ) ) ( not ( = ?auto_211302 ?auto_211306 ) ) ( not ( = ?auto_211302 ?auto_211305 ) ) ( not ( = ?auto_211302 ?auto_211307 ) ) ( not ( = ?auto_211303 ?auto_211300 ) ) ( not ( = ?auto_211303 ?auto_211304 ) ) ( not ( = ?auto_211303 ?auto_211306 ) ) ( not ( = ?auto_211303 ?auto_211305 ) ) ( not ( = ?auto_211303 ?auto_211307 ) ) ( not ( = ?auto_211300 ?auto_211304 ) ) ( not ( = ?auto_211300 ?auto_211306 ) ) ( not ( = ?auto_211300 ?auto_211305 ) ) ( not ( = ?auto_211300 ?auto_211307 ) ) ( not ( = ?auto_211304 ?auto_211306 ) ) ( not ( = ?auto_211304 ?auto_211305 ) ) ( not ( = ?auto_211304 ?auto_211307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211306 ?auto_211305 ?auto_211307 )
      ( MAKE-7CRATE-VERIFY ?auto_211301 ?auto_211302 ?auto_211303 ?auto_211300 ?auto_211304 ?auto_211306 ?auto_211305 ?auto_211307 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211371 - SURFACE
      ?auto_211372 - SURFACE
      ?auto_211373 - SURFACE
      ?auto_211370 - SURFACE
      ?auto_211374 - SURFACE
      ?auto_211376 - SURFACE
      ?auto_211375 - SURFACE
      ?auto_211377 - SURFACE
    )
    :vars
    (
      ?auto_211379 - HOIST
      ?auto_211382 - PLACE
      ?auto_211378 - TRUCK
      ?auto_211381 - PLACE
      ?auto_211380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_211379 ?auto_211382 ) ( SURFACE-AT ?auto_211375 ?auto_211382 ) ( CLEAR ?auto_211375 ) ( IS-CRATE ?auto_211377 ) ( not ( = ?auto_211375 ?auto_211377 ) ) ( AVAILABLE ?auto_211379 ) ( ON ?auto_211375 ?auto_211376 ) ( not ( = ?auto_211376 ?auto_211375 ) ) ( not ( = ?auto_211376 ?auto_211377 ) ) ( TRUCK-AT ?auto_211378 ?auto_211381 ) ( not ( = ?auto_211381 ?auto_211382 ) ) ( HOIST-AT ?auto_211380 ?auto_211381 ) ( LIFTING ?auto_211380 ?auto_211377 ) ( not ( = ?auto_211379 ?auto_211380 ) ) ( ON ?auto_211372 ?auto_211371 ) ( ON ?auto_211373 ?auto_211372 ) ( ON ?auto_211370 ?auto_211373 ) ( ON ?auto_211374 ?auto_211370 ) ( ON ?auto_211376 ?auto_211374 ) ( not ( = ?auto_211371 ?auto_211372 ) ) ( not ( = ?auto_211371 ?auto_211373 ) ) ( not ( = ?auto_211371 ?auto_211370 ) ) ( not ( = ?auto_211371 ?auto_211374 ) ) ( not ( = ?auto_211371 ?auto_211376 ) ) ( not ( = ?auto_211371 ?auto_211375 ) ) ( not ( = ?auto_211371 ?auto_211377 ) ) ( not ( = ?auto_211372 ?auto_211373 ) ) ( not ( = ?auto_211372 ?auto_211370 ) ) ( not ( = ?auto_211372 ?auto_211374 ) ) ( not ( = ?auto_211372 ?auto_211376 ) ) ( not ( = ?auto_211372 ?auto_211375 ) ) ( not ( = ?auto_211372 ?auto_211377 ) ) ( not ( = ?auto_211373 ?auto_211370 ) ) ( not ( = ?auto_211373 ?auto_211374 ) ) ( not ( = ?auto_211373 ?auto_211376 ) ) ( not ( = ?auto_211373 ?auto_211375 ) ) ( not ( = ?auto_211373 ?auto_211377 ) ) ( not ( = ?auto_211370 ?auto_211374 ) ) ( not ( = ?auto_211370 ?auto_211376 ) ) ( not ( = ?auto_211370 ?auto_211375 ) ) ( not ( = ?auto_211370 ?auto_211377 ) ) ( not ( = ?auto_211374 ?auto_211376 ) ) ( not ( = ?auto_211374 ?auto_211375 ) ) ( not ( = ?auto_211374 ?auto_211377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211376 ?auto_211375 ?auto_211377 )
      ( MAKE-7CRATE-VERIFY ?auto_211371 ?auto_211372 ?auto_211373 ?auto_211370 ?auto_211374 ?auto_211376 ?auto_211375 ?auto_211377 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211448 - SURFACE
      ?auto_211449 - SURFACE
      ?auto_211450 - SURFACE
      ?auto_211447 - SURFACE
      ?auto_211451 - SURFACE
      ?auto_211453 - SURFACE
      ?auto_211452 - SURFACE
      ?auto_211454 - SURFACE
    )
    :vars
    (
      ?auto_211460 - HOIST
      ?auto_211459 - PLACE
      ?auto_211457 - TRUCK
      ?auto_211456 - PLACE
      ?auto_211455 - HOIST
      ?auto_211458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211460 ?auto_211459 ) ( SURFACE-AT ?auto_211452 ?auto_211459 ) ( CLEAR ?auto_211452 ) ( IS-CRATE ?auto_211454 ) ( not ( = ?auto_211452 ?auto_211454 ) ) ( AVAILABLE ?auto_211460 ) ( ON ?auto_211452 ?auto_211453 ) ( not ( = ?auto_211453 ?auto_211452 ) ) ( not ( = ?auto_211453 ?auto_211454 ) ) ( TRUCK-AT ?auto_211457 ?auto_211456 ) ( not ( = ?auto_211456 ?auto_211459 ) ) ( HOIST-AT ?auto_211455 ?auto_211456 ) ( not ( = ?auto_211460 ?auto_211455 ) ) ( AVAILABLE ?auto_211455 ) ( SURFACE-AT ?auto_211454 ?auto_211456 ) ( ON ?auto_211454 ?auto_211458 ) ( CLEAR ?auto_211454 ) ( not ( = ?auto_211452 ?auto_211458 ) ) ( not ( = ?auto_211454 ?auto_211458 ) ) ( not ( = ?auto_211453 ?auto_211458 ) ) ( ON ?auto_211449 ?auto_211448 ) ( ON ?auto_211450 ?auto_211449 ) ( ON ?auto_211447 ?auto_211450 ) ( ON ?auto_211451 ?auto_211447 ) ( ON ?auto_211453 ?auto_211451 ) ( not ( = ?auto_211448 ?auto_211449 ) ) ( not ( = ?auto_211448 ?auto_211450 ) ) ( not ( = ?auto_211448 ?auto_211447 ) ) ( not ( = ?auto_211448 ?auto_211451 ) ) ( not ( = ?auto_211448 ?auto_211453 ) ) ( not ( = ?auto_211448 ?auto_211452 ) ) ( not ( = ?auto_211448 ?auto_211454 ) ) ( not ( = ?auto_211448 ?auto_211458 ) ) ( not ( = ?auto_211449 ?auto_211450 ) ) ( not ( = ?auto_211449 ?auto_211447 ) ) ( not ( = ?auto_211449 ?auto_211451 ) ) ( not ( = ?auto_211449 ?auto_211453 ) ) ( not ( = ?auto_211449 ?auto_211452 ) ) ( not ( = ?auto_211449 ?auto_211454 ) ) ( not ( = ?auto_211449 ?auto_211458 ) ) ( not ( = ?auto_211450 ?auto_211447 ) ) ( not ( = ?auto_211450 ?auto_211451 ) ) ( not ( = ?auto_211450 ?auto_211453 ) ) ( not ( = ?auto_211450 ?auto_211452 ) ) ( not ( = ?auto_211450 ?auto_211454 ) ) ( not ( = ?auto_211450 ?auto_211458 ) ) ( not ( = ?auto_211447 ?auto_211451 ) ) ( not ( = ?auto_211447 ?auto_211453 ) ) ( not ( = ?auto_211447 ?auto_211452 ) ) ( not ( = ?auto_211447 ?auto_211454 ) ) ( not ( = ?auto_211447 ?auto_211458 ) ) ( not ( = ?auto_211451 ?auto_211453 ) ) ( not ( = ?auto_211451 ?auto_211452 ) ) ( not ( = ?auto_211451 ?auto_211454 ) ) ( not ( = ?auto_211451 ?auto_211458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211453 ?auto_211452 ?auto_211454 )
      ( MAKE-7CRATE-VERIFY ?auto_211448 ?auto_211449 ?auto_211450 ?auto_211447 ?auto_211451 ?auto_211453 ?auto_211452 ?auto_211454 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211526 - SURFACE
      ?auto_211527 - SURFACE
      ?auto_211528 - SURFACE
      ?auto_211525 - SURFACE
      ?auto_211529 - SURFACE
      ?auto_211531 - SURFACE
      ?auto_211530 - SURFACE
      ?auto_211532 - SURFACE
    )
    :vars
    (
      ?auto_211533 - HOIST
      ?auto_211534 - PLACE
      ?auto_211537 - PLACE
      ?auto_211535 - HOIST
      ?auto_211538 - SURFACE
      ?auto_211536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211533 ?auto_211534 ) ( SURFACE-AT ?auto_211530 ?auto_211534 ) ( CLEAR ?auto_211530 ) ( IS-CRATE ?auto_211532 ) ( not ( = ?auto_211530 ?auto_211532 ) ) ( AVAILABLE ?auto_211533 ) ( ON ?auto_211530 ?auto_211531 ) ( not ( = ?auto_211531 ?auto_211530 ) ) ( not ( = ?auto_211531 ?auto_211532 ) ) ( not ( = ?auto_211537 ?auto_211534 ) ) ( HOIST-AT ?auto_211535 ?auto_211537 ) ( not ( = ?auto_211533 ?auto_211535 ) ) ( AVAILABLE ?auto_211535 ) ( SURFACE-AT ?auto_211532 ?auto_211537 ) ( ON ?auto_211532 ?auto_211538 ) ( CLEAR ?auto_211532 ) ( not ( = ?auto_211530 ?auto_211538 ) ) ( not ( = ?auto_211532 ?auto_211538 ) ) ( not ( = ?auto_211531 ?auto_211538 ) ) ( TRUCK-AT ?auto_211536 ?auto_211534 ) ( ON ?auto_211527 ?auto_211526 ) ( ON ?auto_211528 ?auto_211527 ) ( ON ?auto_211525 ?auto_211528 ) ( ON ?auto_211529 ?auto_211525 ) ( ON ?auto_211531 ?auto_211529 ) ( not ( = ?auto_211526 ?auto_211527 ) ) ( not ( = ?auto_211526 ?auto_211528 ) ) ( not ( = ?auto_211526 ?auto_211525 ) ) ( not ( = ?auto_211526 ?auto_211529 ) ) ( not ( = ?auto_211526 ?auto_211531 ) ) ( not ( = ?auto_211526 ?auto_211530 ) ) ( not ( = ?auto_211526 ?auto_211532 ) ) ( not ( = ?auto_211526 ?auto_211538 ) ) ( not ( = ?auto_211527 ?auto_211528 ) ) ( not ( = ?auto_211527 ?auto_211525 ) ) ( not ( = ?auto_211527 ?auto_211529 ) ) ( not ( = ?auto_211527 ?auto_211531 ) ) ( not ( = ?auto_211527 ?auto_211530 ) ) ( not ( = ?auto_211527 ?auto_211532 ) ) ( not ( = ?auto_211527 ?auto_211538 ) ) ( not ( = ?auto_211528 ?auto_211525 ) ) ( not ( = ?auto_211528 ?auto_211529 ) ) ( not ( = ?auto_211528 ?auto_211531 ) ) ( not ( = ?auto_211528 ?auto_211530 ) ) ( not ( = ?auto_211528 ?auto_211532 ) ) ( not ( = ?auto_211528 ?auto_211538 ) ) ( not ( = ?auto_211525 ?auto_211529 ) ) ( not ( = ?auto_211525 ?auto_211531 ) ) ( not ( = ?auto_211525 ?auto_211530 ) ) ( not ( = ?auto_211525 ?auto_211532 ) ) ( not ( = ?auto_211525 ?auto_211538 ) ) ( not ( = ?auto_211529 ?auto_211531 ) ) ( not ( = ?auto_211529 ?auto_211530 ) ) ( not ( = ?auto_211529 ?auto_211532 ) ) ( not ( = ?auto_211529 ?auto_211538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211531 ?auto_211530 ?auto_211532 )
      ( MAKE-7CRATE-VERIFY ?auto_211526 ?auto_211527 ?auto_211528 ?auto_211525 ?auto_211529 ?auto_211531 ?auto_211530 ?auto_211532 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211604 - SURFACE
      ?auto_211605 - SURFACE
      ?auto_211606 - SURFACE
      ?auto_211603 - SURFACE
      ?auto_211607 - SURFACE
      ?auto_211609 - SURFACE
      ?auto_211608 - SURFACE
      ?auto_211610 - SURFACE
    )
    :vars
    (
      ?auto_211611 - HOIST
      ?auto_211612 - PLACE
      ?auto_211615 - PLACE
      ?auto_211614 - HOIST
      ?auto_211616 - SURFACE
      ?auto_211613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211611 ?auto_211612 ) ( IS-CRATE ?auto_211610 ) ( not ( = ?auto_211608 ?auto_211610 ) ) ( not ( = ?auto_211609 ?auto_211608 ) ) ( not ( = ?auto_211609 ?auto_211610 ) ) ( not ( = ?auto_211615 ?auto_211612 ) ) ( HOIST-AT ?auto_211614 ?auto_211615 ) ( not ( = ?auto_211611 ?auto_211614 ) ) ( AVAILABLE ?auto_211614 ) ( SURFACE-AT ?auto_211610 ?auto_211615 ) ( ON ?auto_211610 ?auto_211616 ) ( CLEAR ?auto_211610 ) ( not ( = ?auto_211608 ?auto_211616 ) ) ( not ( = ?auto_211610 ?auto_211616 ) ) ( not ( = ?auto_211609 ?auto_211616 ) ) ( TRUCK-AT ?auto_211613 ?auto_211612 ) ( SURFACE-AT ?auto_211609 ?auto_211612 ) ( CLEAR ?auto_211609 ) ( LIFTING ?auto_211611 ?auto_211608 ) ( IS-CRATE ?auto_211608 ) ( ON ?auto_211605 ?auto_211604 ) ( ON ?auto_211606 ?auto_211605 ) ( ON ?auto_211603 ?auto_211606 ) ( ON ?auto_211607 ?auto_211603 ) ( ON ?auto_211609 ?auto_211607 ) ( not ( = ?auto_211604 ?auto_211605 ) ) ( not ( = ?auto_211604 ?auto_211606 ) ) ( not ( = ?auto_211604 ?auto_211603 ) ) ( not ( = ?auto_211604 ?auto_211607 ) ) ( not ( = ?auto_211604 ?auto_211609 ) ) ( not ( = ?auto_211604 ?auto_211608 ) ) ( not ( = ?auto_211604 ?auto_211610 ) ) ( not ( = ?auto_211604 ?auto_211616 ) ) ( not ( = ?auto_211605 ?auto_211606 ) ) ( not ( = ?auto_211605 ?auto_211603 ) ) ( not ( = ?auto_211605 ?auto_211607 ) ) ( not ( = ?auto_211605 ?auto_211609 ) ) ( not ( = ?auto_211605 ?auto_211608 ) ) ( not ( = ?auto_211605 ?auto_211610 ) ) ( not ( = ?auto_211605 ?auto_211616 ) ) ( not ( = ?auto_211606 ?auto_211603 ) ) ( not ( = ?auto_211606 ?auto_211607 ) ) ( not ( = ?auto_211606 ?auto_211609 ) ) ( not ( = ?auto_211606 ?auto_211608 ) ) ( not ( = ?auto_211606 ?auto_211610 ) ) ( not ( = ?auto_211606 ?auto_211616 ) ) ( not ( = ?auto_211603 ?auto_211607 ) ) ( not ( = ?auto_211603 ?auto_211609 ) ) ( not ( = ?auto_211603 ?auto_211608 ) ) ( not ( = ?auto_211603 ?auto_211610 ) ) ( not ( = ?auto_211603 ?auto_211616 ) ) ( not ( = ?auto_211607 ?auto_211609 ) ) ( not ( = ?auto_211607 ?auto_211608 ) ) ( not ( = ?auto_211607 ?auto_211610 ) ) ( not ( = ?auto_211607 ?auto_211616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211609 ?auto_211608 ?auto_211610 )
      ( MAKE-7CRATE-VERIFY ?auto_211604 ?auto_211605 ?auto_211606 ?auto_211603 ?auto_211607 ?auto_211609 ?auto_211608 ?auto_211610 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211682 - SURFACE
      ?auto_211683 - SURFACE
      ?auto_211684 - SURFACE
      ?auto_211681 - SURFACE
      ?auto_211685 - SURFACE
      ?auto_211687 - SURFACE
      ?auto_211686 - SURFACE
      ?auto_211688 - SURFACE
    )
    :vars
    (
      ?auto_211692 - HOIST
      ?auto_211690 - PLACE
      ?auto_211691 - PLACE
      ?auto_211694 - HOIST
      ?auto_211693 - SURFACE
      ?auto_211689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211692 ?auto_211690 ) ( IS-CRATE ?auto_211688 ) ( not ( = ?auto_211686 ?auto_211688 ) ) ( not ( = ?auto_211687 ?auto_211686 ) ) ( not ( = ?auto_211687 ?auto_211688 ) ) ( not ( = ?auto_211691 ?auto_211690 ) ) ( HOIST-AT ?auto_211694 ?auto_211691 ) ( not ( = ?auto_211692 ?auto_211694 ) ) ( AVAILABLE ?auto_211694 ) ( SURFACE-AT ?auto_211688 ?auto_211691 ) ( ON ?auto_211688 ?auto_211693 ) ( CLEAR ?auto_211688 ) ( not ( = ?auto_211686 ?auto_211693 ) ) ( not ( = ?auto_211688 ?auto_211693 ) ) ( not ( = ?auto_211687 ?auto_211693 ) ) ( TRUCK-AT ?auto_211689 ?auto_211690 ) ( SURFACE-AT ?auto_211687 ?auto_211690 ) ( CLEAR ?auto_211687 ) ( IS-CRATE ?auto_211686 ) ( AVAILABLE ?auto_211692 ) ( IN ?auto_211686 ?auto_211689 ) ( ON ?auto_211683 ?auto_211682 ) ( ON ?auto_211684 ?auto_211683 ) ( ON ?auto_211681 ?auto_211684 ) ( ON ?auto_211685 ?auto_211681 ) ( ON ?auto_211687 ?auto_211685 ) ( not ( = ?auto_211682 ?auto_211683 ) ) ( not ( = ?auto_211682 ?auto_211684 ) ) ( not ( = ?auto_211682 ?auto_211681 ) ) ( not ( = ?auto_211682 ?auto_211685 ) ) ( not ( = ?auto_211682 ?auto_211687 ) ) ( not ( = ?auto_211682 ?auto_211686 ) ) ( not ( = ?auto_211682 ?auto_211688 ) ) ( not ( = ?auto_211682 ?auto_211693 ) ) ( not ( = ?auto_211683 ?auto_211684 ) ) ( not ( = ?auto_211683 ?auto_211681 ) ) ( not ( = ?auto_211683 ?auto_211685 ) ) ( not ( = ?auto_211683 ?auto_211687 ) ) ( not ( = ?auto_211683 ?auto_211686 ) ) ( not ( = ?auto_211683 ?auto_211688 ) ) ( not ( = ?auto_211683 ?auto_211693 ) ) ( not ( = ?auto_211684 ?auto_211681 ) ) ( not ( = ?auto_211684 ?auto_211685 ) ) ( not ( = ?auto_211684 ?auto_211687 ) ) ( not ( = ?auto_211684 ?auto_211686 ) ) ( not ( = ?auto_211684 ?auto_211688 ) ) ( not ( = ?auto_211684 ?auto_211693 ) ) ( not ( = ?auto_211681 ?auto_211685 ) ) ( not ( = ?auto_211681 ?auto_211687 ) ) ( not ( = ?auto_211681 ?auto_211686 ) ) ( not ( = ?auto_211681 ?auto_211688 ) ) ( not ( = ?auto_211681 ?auto_211693 ) ) ( not ( = ?auto_211685 ?auto_211687 ) ) ( not ( = ?auto_211685 ?auto_211686 ) ) ( not ( = ?auto_211685 ?auto_211688 ) ) ( not ( = ?auto_211685 ?auto_211693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211687 ?auto_211686 ?auto_211688 )
      ( MAKE-7CRATE-VERIFY ?auto_211682 ?auto_211683 ?auto_211684 ?auto_211681 ?auto_211685 ?auto_211687 ?auto_211686 ?auto_211688 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214563 - SURFACE
      ?auto_214564 - SURFACE
      ?auto_214565 - SURFACE
      ?auto_214562 - SURFACE
      ?auto_214566 - SURFACE
      ?auto_214568 - SURFACE
      ?auto_214567 - SURFACE
      ?auto_214569 - SURFACE
      ?auto_214570 - SURFACE
    )
    :vars
    (
      ?auto_214572 - HOIST
      ?auto_214571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214572 ?auto_214571 ) ( SURFACE-AT ?auto_214569 ?auto_214571 ) ( CLEAR ?auto_214569 ) ( LIFTING ?auto_214572 ?auto_214570 ) ( IS-CRATE ?auto_214570 ) ( not ( = ?auto_214569 ?auto_214570 ) ) ( ON ?auto_214564 ?auto_214563 ) ( ON ?auto_214565 ?auto_214564 ) ( ON ?auto_214562 ?auto_214565 ) ( ON ?auto_214566 ?auto_214562 ) ( ON ?auto_214568 ?auto_214566 ) ( ON ?auto_214567 ?auto_214568 ) ( ON ?auto_214569 ?auto_214567 ) ( not ( = ?auto_214563 ?auto_214564 ) ) ( not ( = ?auto_214563 ?auto_214565 ) ) ( not ( = ?auto_214563 ?auto_214562 ) ) ( not ( = ?auto_214563 ?auto_214566 ) ) ( not ( = ?auto_214563 ?auto_214568 ) ) ( not ( = ?auto_214563 ?auto_214567 ) ) ( not ( = ?auto_214563 ?auto_214569 ) ) ( not ( = ?auto_214563 ?auto_214570 ) ) ( not ( = ?auto_214564 ?auto_214565 ) ) ( not ( = ?auto_214564 ?auto_214562 ) ) ( not ( = ?auto_214564 ?auto_214566 ) ) ( not ( = ?auto_214564 ?auto_214568 ) ) ( not ( = ?auto_214564 ?auto_214567 ) ) ( not ( = ?auto_214564 ?auto_214569 ) ) ( not ( = ?auto_214564 ?auto_214570 ) ) ( not ( = ?auto_214565 ?auto_214562 ) ) ( not ( = ?auto_214565 ?auto_214566 ) ) ( not ( = ?auto_214565 ?auto_214568 ) ) ( not ( = ?auto_214565 ?auto_214567 ) ) ( not ( = ?auto_214565 ?auto_214569 ) ) ( not ( = ?auto_214565 ?auto_214570 ) ) ( not ( = ?auto_214562 ?auto_214566 ) ) ( not ( = ?auto_214562 ?auto_214568 ) ) ( not ( = ?auto_214562 ?auto_214567 ) ) ( not ( = ?auto_214562 ?auto_214569 ) ) ( not ( = ?auto_214562 ?auto_214570 ) ) ( not ( = ?auto_214566 ?auto_214568 ) ) ( not ( = ?auto_214566 ?auto_214567 ) ) ( not ( = ?auto_214566 ?auto_214569 ) ) ( not ( = ?auto_214566 ?auto_214570 ) ) ( not ( = ?auto_214568 ?auto_214567 ) ) ( not ( = ?auto_214568 ?auto_214569 ) ) ( not ( = ?auto_214568 ?auto_214570 ) ) ( not ( = ?auto_214567 ?auto_214569 ) ) ( not ( = ?auto_214567 ?auto_214570 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_214569 ?auto_214570 )
      ( MAKE-8CRATE-VERIFY ?auto_214563 ?auto_214564 ?auto_214565 ?auto_214562 ?auto_214566 ?auto_214568 ?auto_214567 ?auto_214569 ?auto_214570 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214630 - SURFACE
      ?auto_214631 - SURFACE
      ?auto_214632 - SURFACE
      ?auto_214629 - SURFACE
      ?auto_214633 - SURFACE
      ?auto_214635 - SURFACE
      ?auto_214634 - SURFACE
      ?auto_214636 - SURFACE
      ?auto_214637 - SURFACE
    )
    :vars
    (
      ?auto_214639 - HOIST
      ?auto_214638 - PLACE
      ?auto_214640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214639 ?auto_214638 ) ( SURFACE-AT ?auto_214636 ?auto_214638 ) ( CLEAR ?auto_214636 ) ( IS-CRATE ?auto_214637 ) ( not ( = ?auto_214636 ?auto_214637 ) ) ( TRUCK-AT ?auto_214640 ?auto_214638 ) ( AVAILABLE ?auto_214639 ) ( IN ?auto_214637 ?auto_214640 ) ( ON ?auto_214636 ?auto_214634 ) ( not ( = ?auto_214634 ?auto_214636 ) ) ( not ( = ?auto_214634 ?auto_214637 ) ) ( ON ?auto_214631 ?auto_214630 ) ( ON ?auto_214632 ?auto_214631 ) ( ON ?auto_214629 ?auto_214632 ) ( ON ?auto_214633 ?auto_214629 ) ( ON ?auto_214635 ?auto_214633 ) ( ON ?auto_214634 ?auto_214635 ) ( not ( = ?auto_214630 ?auto_214631 ) ) ( not ( = ?auto_214630 ?auto_214632 ) ) ( not ( = ?auto_214630 ?auto_214629 ) ) ( not ( = ?auto_214630 ?auto_214633 ) ) ( not ( = ?auto_214630 ?auto_214635 ) ) ( not ( = ?auto_214630 ?auto_214634 ) ) ( not ( = ?auto_214630 ?auto_214636 ) ) ( not ( = ?auto_214630 ?auto_214637 ) ) ( not ( = ?auto_214631 ?auto_214632 ) ) ( not ( = ?auto_214631 ?auto_214629 ) ) ( not ( = ?auto_214631 ?auto_214633 ) ) ( not ( = ?auto_214631 ?auto_214635 ) ) ( not ( = ?auto_214631 ?auto_214634 ) ) ( not ( = ?auto_214631 ?auto_214636 ) ) ( not ( = ?auto_214631 ?auto_214637 ) ) ( not ( = ?auto_214632 ?auto_214629 ) ) ( not ( = ?auto_214632 ?auto_214633 ) ) ( not ( = ?auto_214632 ?auto_214635 ) ) ( not ( = ?auto_214632 ?auto_214634 ) ) ( not ( = ?auto_214632 ?auto_214636 ) ) ( not ( = ?auto_214632 ?auto_214637 ) ) ( not ( = ?auto_214629 ?auto_214633 ) ) ( not ( = ?auto_214629 ?auto_214635 ) ) ( not ( = ?auto_214629 ?auto_214634 ) ) ( not ( = ?auto_214629 ?auto_214636 ) ) ( not ( = ?auto_214629 ?auto_214637 ) ) ( not ( = ?auto_214633 ?auto_214635 ) ) ( not ( = ?auto_214633 ?auto_214634 ) ) ( not ( = ?auto_214633 ?auto_214636 ) ) ( not ( = ?auto_214633 ?auto_214637 ) ) ( not ( = ?auto_214635 ?auto_214634 ) ) ( not ( = ?auto_214635 ?auto_214636 ) ) ( not ( = ?auto_214635 ?auto_214637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214634 ?auto_214636 ?auto_214637 )
      ( MAKE-8CRATE-VERIFY ?auto_214630 ?auto_214631 ?auto_214632 ?auto_214629 ?auto_214633 ?auto_214635 ?auto_214634 ?auto_214636 ?auto_214637 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214706 - SURFACE
      ?auto_214707 - SURFACE
      ?auto_214708 - SURFACE
      ?auto_214705 - SURFACE
      ?auto_214709 - SURFACE
      ?auto_214711 - SURFACE
      ?auto_214710 - SURFACE
      ?auto_214712 - SURFACE
      ?auto_214713 - SURFACE
    )
    :vars
    (
      ?auto_214714 - HOIST
      ?auto_214716 - PLACE
      ?auto_214717 - TRUCK
      ?auto_214715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214714 ?auto_214716 ) ( SURFACE-AT ?auto_214712 ?auto_214716 ) ( CLEAR ?auto_214712 ) ( IS-CRATE ?auto_214713 ) ( not ( = ?auto_214712 ?auto_214713 ) ) ( AVAILABLE ?auto_214714 ) ( IN ?auto_214713 ?auto_214717 ) ( ON ?auto_214712 ?auto_214710 ) ( not ( = ?auto_214710 ?auto_214712 ) ) ( not ( = ?auto_214710 ?auto_214713 ) ) ( TRUCK-AT ?auto_214717 ?auto_214715 ) ( not ( = ?auto_214715 ?auto_214716 ) ) ( ON ?auto_214707 ?auto_214706 ) ( ON ?auto_214708 ?auto_214707 ) ( ON ?auto_214705 ?auto_214708 ) ( ON ?auto_214709 ?auto_214705 ) ( ON ?auto_214711 ?auto_214709 ) ( ON ?auto_214710 ?auto_214711 ) ( not ( = ?auto_214706 ?auto_214707 ) ) ( not ( = ?auto_214706 ?auto_214708 ) ) ( not ( = ?auto_214706 ?auto_214705 ) ) ( not ( = ?auto_214706 ?auto_214709 ) ) ( not ( = ?auto_214706 ?auto_214711 ) ) ( not ( = ?auto_214706 ?auto_214710 ) ) ( not ( = ?auto_214706 ?auto_214712 ) ) ( not ( = ?auto_214706 ?auto_214713 ) ) ( not ( = ?auto_214707 ?auto_214708 ) ) ( not ( = ?auto_214707 ?auto_214705 ) ) ( not ( = ?auto_214707 ?auto_214709 ) ) ( not ( = ?auto_214707 ?auto_214711 ) ) ( not ( = ?auto_214707 ?auto_214710 ) ) ( not ( = ?auto_214707 ?auto_214712 ) ) ( not ( = ?auto_214707 ?auto_214713 ) ) ( not ( = ?auto_214708 ?auto_214705 ) ) ( not ( = ?auto_214708 ?auto_214709 ) ) ( not ( = ?auto_214708 ?auto_214711 ) ) ( not ( = ?auto_214708 ?auto_214710 ) ) ( not ( = ?auto_214708 ?auto_214712 ) ) ( not ( = ?auto_214708 ?auto_214713 ) ) ( not ( = ?auto_214705 ?auto_214709 ) ) ( not ( = ?auto_214705 ?auto_214711 ) ) ( not ( = ?auto_214705 ?auto_214710 ) ) ( not ( = ?auto_214705 ?auto_214712 ) ) ( not ( = ?auto_214705 ?auto_214713 ) ) ( not ( = ?auto_214709 ?auto_214711 ) ) ( not ( = ?auto_214709 ?auto_214710 ) ) ( not ( = ?auto_214709 ?auto_214712 ) ) ( not ( = ?auto_214709 ?auto_214713 ) ) ( not ( = ?auto_214711 ?auto_214710 ) ) ( not ( = ?auto_214711 ?auto_214712 ) ) ( not ( = ?auto_214711 ?auto_214713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214710 ?auto_214712 ?auto_214713 )
      ( MAKE-8CRATE-VERIFY ?auto_214706 ?auto_214707 ?auto_214708 ?auto_214705 ?auto_214709 ?auto_214711 ?auto_214710 ?auto_214712 ?auto_214713 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214790 - SURFACE
      ?auto_214791 - SURFACE
      ?auto_214792 - SURFACE
      ?auto_214789 - SURFACE
      ?auto_214793 - SURFACE
      ?auto_214795 - SURFACE
      ?auto_214794 - SURFACE
      ?auto_214796 - SURFACE
      ?auto_214797 - SURFACE
    )
    :vars
    (
      ?auto_214801 - HOIST
      ?auto_214802 - PLACE
      ?auto_214798 - TRUCK
      ?auto_214800 - PLACE
      ?auto_214799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_214801 ?auto_214802 ) ( SURFACE-AT ?auto_214796 ?auto_214802 ) ( CLEAR ?auto_214796 ) ( IS-CRATE ?auto_214797 ) ( not ( = ?auto_214796 ?auto_214797 ) ) ( AVAILABLE ?auto_214801 ) ( ON ?auto_214796 ?auto_214794 ) ( not ( = ?auto_214794 ?auto_214796 ) ) ( not ( = ?auto_214794 ?auto_214797 ) ) ( TRUCK-AT ?auto_214798 ?auto_214800 ) ( not ( = ?auto_214800 ?auto_214802 ) ) ( HOIST-AT ?auto_214799 ?auto_214800 ) ( LIFTING ?auto_214799 ?auto_214797 ) ( not ( = ?auto_214801 ?auto_214799 ) ) ( ON ?auto_214791 ?auto_214790 ) ( ON ?auto_214792 ?auto_214791 ) ( ON ?auto_214789 ?auto_214792 ) ( ON ?auto_214793 ?auto_214789 ) ( ON ?auto_214795 ?auto_214793 ) ( ON ?auto_214794 ?auto_214795 ) ( not ( = ?auto_214790 ?auto_214791 ) ) ( not ( = ?auto_214790 ?auto_214792 ) ) ( not ( = ?auto_214790 ?auto_214789 ) ) ( not ( = ?auto_214790 ?auto_214793 ) ) ( not ( = ?auto_214790 ?auto_214795 ) ) ( not ( = ?auto_214790 ?auto_214794 ) ) ( not ( = ?auto_214790 ?auto_214796 ) ) ( not ( = ?auto_214790 ?auto_214797 ) ) ( not ( = ?auto_214791 ?auto_214792 ) ) ( not ( = ?auto_214791 ?auto_214789 ) ) ( not ( = ?auto_214791 ?auto_214793 ) ) ( not ( = ?auto_214791 ?auto_214795 ) ) ( not ( = ?auto_214791 ?auto_214794 ) ) ( not ( = ?auto_214791 ?auto_214796 ) ) ( not ( = ?auto_214791 ?auto_214797 ) ) ( not ( = ?auto_214792 ?auto_214789 ) ) ( not ( = ?auto_214792 ?auto_214793 ) ) ( not ( = ?auto_214792 ?auto_214795 ) ) ( not ( = ?auto_214792 ?auto_214794 ) ) ( not ( = ?auto_214792 ?auto_214796 ) ) ( not ( = ?auto_214792 ?auto_214797 ) ) ( not ( = ?auto_214789 ?auto_214793 ) ) ( not ( = ?auto_214789 ?auto_214795 ) ) ( not ( = ?auto_214789 ?auto_214794 ) ) ( not ( = ?auto_214789 ?auto_214796 ) ) ( not ( = ?auto_214789 ?auto_214797 ) ) ( not ( = ?auto_214793 ?auto_214795 ) ) ( not ( = ?auto_214793 ?auto_214794 ) ) ( not ( = ?auto_214793 ?auto_214796 ) ) ( not ( = ?auto_214793 ?auto_214797 ) ) ( not ( = ?auto_214795 ?auto_214794 ) ) ( not ( = ?auto_214795 ?auto_214796 ) ) ( not ( = ?auto_214795 ?auto_214797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214794 ?auto_214796 ?auto_214797 )
      ( MAKE-8CRATE-VERIFY ?auto_214790 ?auto_214791 ?auto_214792 ?auto_214789 ?auto_214793 ?auto_214795 ?auto_214794 ?auto_214796 ?auto_214797 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214882 - SURFACE
      ?auto_214883 - SURFACE
      ?auto_214884 - SURFACE
      ?auto_214881 - SURFACE
      ?auto_214885 - SURFACE
      ?auto_214887 - SURFACE
      ?auto_214886 - SURFACE
      ?auto_214888 - SURFACE
      ?auto_214889 - SURFACE
    )
    :vars
    (
      ?auto_214894 - HOIST
      ?auto_214891 - PLACE
      ?auto_214895 - TRUCK
      ?auto_214892 - PLACE
      ?auto_214890 - HOIST
      ?auto_214893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214894 ?auto_214891 ) ( SURFACE-AT ?auto_214888 ?auto_214891 ) ( CLEAR ?auto_214888 ) ( IS-CRATE ?auto_214889 ) ( not ( = ?auto_214888 ?auto_214889 ) ) ( AVAILABLE ?auto_214894 ) ( ON ?auto_214888 ?auto_214886 ) ( not ( = ?auto_214886 ?auto_214888 ) ) ( not ( = ?auto_214886 ?auto_214889 ) ) ( TRUCK-AT ?auto_214895 ?auto_214892 ) ( not ( = ?auto_214892 ?auto_214891 ) ) ( HOIST-AT ?auto_214890 ?auto_214892 ) ( not ( = ?auto_214894 ?auto_214890 ) ) ( AVAILABLE ?auto_214890 ) ( SURFACE-AT ?auto_214889 ?auto_214892 ) ( ON ?auto_214889 ?auto_214893 ) ( CLEAR ?auto_214889 ) ( not ( = ?auto_214888 ?auto_214893 ) ) ( not ( = ?auto_214889 ?auto_214893 ) ) ( not ( = ?auto_214886 ?auto_214893 ) ) ( ON ?auto_214883 ?auto_214882 ) ( ON ?auto_214884 ?auto_214883 ) ( ON ?auto_214881 ?auto_214884 ) ( ON ?auto_214885 ?auto_214881 ) ( ON ?auto_214887 ?auto_214885 ) ( ON ?auto_214886 ?auto_214887 ) ( not ( = ?auto_214882 ?auto_214883 ) ) ( not ( = ?auto_214882 ?auto_214884 ) ) ( not ( = ?auto_214882 ?auto_214881 ) ) ( not ( = ?auto_214882 ?auto_214885 ) ) ( not ( = ?auto_214882 ?auto_214887 ) ) ( not ( = ?auto_214882 ?auto_214886 ) ) ( not ( = ?auto_214882 ?auto_214888 ) ) ( not ( = ?auto_214882 ?auto_214889 ) ) ( not ( = ?auto_214882 ?auto_214893 ) ) ( not ( = ?auto_214883 ?auto_214884 ) ) ( not ( = ?auto_214883 ?auto_214881 ) ) ( not ( = ?auto_214883 ?auto_214885 ) ) ( not ( = ?auto_214883 ?auto_214887 ) ) ( not ( = ?auto_214883 ?auto_214886 ) ) ( not ( = ?auto_214883 ?auto_214888 ) ) ( not ( = ?auto_214883 ?auto_214889 ) ) ( not ( = ?auto_214883 ?auto_214893 ) ) ( not ( = ?auto_214884 ?auto_214881 ) ) ( not ( = ?auto_214884 ?auto_214885 ) ) ( not ( = ?auto_214884 ?auto_214887 ) ) ( not ( = ?auto_214884 ?auto_214886 ) ) ( not ( = ?auto_214884 ?auto_214888 ) ) ( not ( = ?auto_214884 ?auto_214889 ) ) ( not ( = ?auto_214884 ?auto_214893 ) ) ( not ( = ?auto_214881 ?auto_214885 ) ) ( not ( = ?auto_214881 ?auto_214887 ) ) ( not ( = ?auto_214881 ?auto_214886 ) ) ( not ( = ?auto_214881 ?auto_214888 ) ) ( not ( = ?auto_214881 ?auto_214889 ) ) ( not ( = ?auto_214881 ?auto_214893 ) ) ( not ( = ?auto_214885 ?auto_214887 ) ) ( not ( = ?auto_214885 ?auto_214886 ) ) ( not ( = ?auto_214885 ?auto_214888 ) ) ( not ( = ?auto_214885 ?auto_214889 ) ) ( not ( = ?auto_214885 ?auto_214893 ) ) ( not ( = ?auto_214887 ?auto_214886 ) ) ( not ( = ?auto_214887 ?auto_214888 ) ) ( not ( = ?auto_214887 ?auto_214889 ) ) ( not ( = ?auto_214887 ?auto_214893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214886 ?auto_214888 ?auto_214889 )
      ( MAKE-8CRATE-VERIFY ?auto_214882 ?auto_214883 ?auto_214884 ?auto_214881 ?auto_214885 ?auto_214887 ?auto_214886 ?auto_214888 ?auto_214889 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214975 - SURFACE
      ?auto_214976 - SURFACE
      ?auto_214977 - SURFACE
      ?auto_214974 - SURFACE
      ?auto_214978 - SURFACE
      ?auto_214980 - SURFACE
      ?auto_214979 - SURFACE
      ?auto_214981 - SURFACE
      ?auto_214982 - SURFACE
    )
    :vars
    (
      ?auto_214984 - HOIST
      ?auto_214983 - PLACE
      ?auto_214987 - PLACE
      ?auto_214988 - HOIST
      ?auto_214985 - SURFACE
      ?auto_214986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214984 ?auto_214983 ) ( SURFACE-AT ?auto_214981 ?auto_214983 ) ( CLEAR ?auto_214981 ) ( IS-CRATE ?auto_214982 ) ( not ( = ?auto_214981 ?auto_214982 ) ) ( AVAILABLE ?auto_214984 ) ( ON ?auto_214981 ?auto_214979 ) ( not ( = ?auto_214979 ?auto_214981 ) ) ( not ( = ?auto_214979 ?auto_214982 ) ) ( not ( = ?auto_214987 ?auto_214983 ) ) ( HOIST-AT ?auto_214988 ?auto_214987 ) ( not ( = ?auto_214984 ?auto_214988 ) ) ( AVAILABLE ?auto_214988 ) ( SURFACE-AT ?auto_214982 ?auto_214987 ) ( ON ?auto_214982 ?auto_214985 ) ( CLEAR ?auto_214982 ) ( not ( = ?auto_214981 ?auto_214985 ) ) ( not ( = ?auto_214982 ?auto_214985 ) ) ( not ( = ?auto_214979 ?auto_214985 ) ) ( TRUCK-AT ?auto_214986 ?auto_214983 ) ( ON ?auto_214976 ?auto_214975 ) ( ON ?auto_214977 ?auto_214976 ) ( ON ?auto_214974 ?auto_214977 ) ( ON ?auto_214978 ?auto_214974 ) ( ON ?auto_214980 ?auto_214978 ) ( ON ?auto_214979 ?auto_214980 ) ( not ( = ?auto_214975 ?auto_214976 ) ) ( not ( = ?auto_214975 ?auto_214977 ) ) ( not ( = ?auto_214975 ?auto_214974 ) ) ( not ( = ?auto_214975 ?auto_214978 ) ) ( not ( = ?auto_214975 ?auto_214980 ) ) ( not ( = ?auto_214975 ?auto_214979 ) ) ( not ( = ?auto_214975 ?auto_214981 ) ) ( not ( = ?auto_214975 ?auto_214982 ) ) ( not ( = ?auto_214975 ?auto_214985 ) ) ( not ( = ?auto_214976 ?auto_214977 ) ) ( not ( = ?auto_214976 ?auto_214974 ) ) ( not ( = ?auto_214976 ?auto_214978 ) ) ( not ( = ?auto_214976 ?auto_214980 ) ) ( not ( = ?auto_214976 ?auto_214979 ) ) ( not ( = ?auto_214976 ?auto_214981 ) ) ( not ( = ?auto_214976 ?auto_214982 ) ) ( not ( = ?auto_214976 ?auto_214985 ) ) ( not ( = ?auto_214977 ?auto_214974 ) ) ( not ( = ?auto_214977 ?auto_214978 ) ) ( not ( = ?auto_214977 ?auto_214980 ) ) ( not ( = ?auto_214977 ?auto_214979 ) ) ( not ( = ?auto_214977 ?auto_214981 ) ) ( not ( = ?auto_214977 ?auto_214982 ) ) ( not ( = ?auto_214977 ?auto_214985 ) ) ( not ( = ?auto_214974 ?auto_214978 ) ) ( not ( = ?auto_214974 ?auto_214980 ) ) ( not ( = ?auto_214974 ?auto_214979 ) ) ( not ( = ?auto_214974 ?auto_214981 ) ) ( not ( = ?auto_214974 ?auto_214982 ) ) ( not ( = ?auto_214974 ?auto_214985 ) ) ( not ( = ?auto_214978 ?auto_214980 ) ) ( not ( = ?auto_214978 ?auto_214979 ) ) ( not ( = ?auto_214978 ?auto_214981 ) ) ( not ( = ?auto_214978 ?auto_214982 ) ) ( not ( = ?auto_214978 ?auto_214985 ) ) ( not ( = ?auto_214980 ?auto_214979 ) ) ( not ( = ?auto_214980 ?auto_214981 ) ) ( not ( = ?auto_214980 ?auto_214982 ) ) ( not ( = ?auto_214980 ?auto_214985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214979 ?auto_214981 ?auto_214982 )
      ( MAKE-8CRATE-VERIFY ?auto_214975 ?auto_214976 ?auto_214977 ?auto_214974 ?auto_214978 ?auto_214980 ?auto_214979 ?auto_214981 ?auto_214982 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_215068 - SURFACE
      ?auto_215069 - SURFACE
      ?auto_215070 - SURFACE
      ?auto_215067 - SURFACE
      ?auto_215071 - SURFACE
      ?auto_215073 - SURFACE
      ?auto_215072 - SURFACE
      ?auto_215074 - SURFACE
      ?auto_215075 - SURFACE
    )
    :vars
    (
      ?auto_215081 - HOIST
      ?auto_215079 - PLACE
      ?auto_215077 - PLACE
      ?auto_215080 - HOIST
      ?auto_215078 - SURFACE
      ?auto_215076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_215081 ?auto_215079 ) ( IS-CRATE ?auto_215075 ) ( not ( = ?auto_215074 ?auto_215075 ) ) ( not ( = ?auto_215072 ?auto_215074 ) ) ( not ( = ?auto_215072 ?auto_215075 ) ) ( not ( = ?auto_215077 ?auto_215079 ) ) ( HOIST-AT ?auto_215080 ?auto_215077 ) ( not ( = ?auto_215081 ?auto_215080 ) ) ( AVAILABLE ?auto_215080 ) ( SURFACE-AT ?auto_215075 ?auto_215077 ) ( ON ?auto_215075 ?auto_215078 ) ( CLEAR ?auto_215075 ) ( not ( = ?auto_215074 ?auto_215078 ) ) ( not ( = ?auto_215075 ?auto_215078 ) ) ( not ( = ?auto_215072 ?auto_215078 ) ) ( TRUCK-AT ?auto_215076 ?auto_215079 ) ( SURFACE-AT ?auto_215072 ?auto_215079 ) ( CLEAR ?auto_215072 ) ( LIFTING ?auto_215081 ?auto_215074 ) ( IS-CRATE ?auto_215074 ) ( ON ?auto_215069 ?auto_215068 ) ( ON ?auto_215070 ?auto_215069 ) ( ON ?auto_215067 ?auto_215070 ) ( ON ?auto_215071 ?auto_215067 ) ( ON ?auto_215073 ?auto_215071 ) ( ON ?auto_215072 ?auto_215073 ) ( not ( = ?auto_215068 ?auto_215069 ) ) ( not ( = ?auto_215068 ?auto_215070 ) ) ( not ( = ?auto_215068 ?auto_215067 ) ) ( not ( = ?auto_215068 ?auto_215071 ) ) ( not ( = ?auto_215068 ?auto_215073 ) ) ( not ( = ?auto_215068 ?auto_215072 ) ) ( not ( = ?auto_215068 ?auto_215074 ) ) ( not ( = ?auto_215068 ?auto_215075 ) ) ( not ( = ?auto_215068 ?auto_215078 ) ) ( not ( = ?auto_215069 ?auto_215070 ) ) ( not ( = ?auto_215069 ?auto_215067 ) ) ( not ( = ?auto_215069 ?auto_215071 ) ) ( not ( = ?auto_215069 ?auto_215073 ) ) ( not ( = ?auto_215069 ?auto_215072 ) ) ( not ( = ?auto_215069 ?auto_215074 ) ) ( not ( = ?auto_215069 ?auto_215075 ) ) ( not ( = ?auto_215069 ?auto_215078 ) ) ( not ( = ?auto_215070 ?auto_215067 ) ) ( not ( = ?auto_215070 ?auto_215071 ) ) ( not ( = ?auto_215070 ?auto_215073 ) ) ( not ( = ?auto_215070 ?auto_215072 ) ) ( not ( = ?auto_215070 ?auto_215074 ) ) ( not ( = ?auto_215070 ?auto_215075 ) ) ( not ( = ?auto_215070 ?auto_215078 ) ) ( not ( = ?auto_215067 ?auto_215071 ) ) ( not ( = ?auto_215067 ?auto_215073 ) ) ( not ( = ?auto_215067 ?auto_215072 ) ) ( not ( = ?auto_215067 ?auto_215074 ) ) ( not ( = ?auto_215067 ?auto_215075 ) ) ( not ( = ?auto_215067 ?auto_215078 ) ) ( not ( = ?auto_215071 ?auto_215073 ) ) ( not ( = ?auto_215071 ?auto_215072 ) ) ( not ( = ?auto_215071 ?auto_215074 ) ) ( not ( = ?auto_215071 ?auto_215075 ) ) ( not ( = ?auto_215071 ?auto_215078 ) ) ( not ( = ?auto_215073 ?auto_215072 ) ) ( not ( = ?auto_215073 ?auto_215074 ) ) ( not ( = ?auto_215073 ?auto_215075 ) ) ( not ( = ?auto_215073 ?auto_215078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_215072 ?auto_215074 ?auto_215075 )
      ( MAKE-8CRATE-VERIFY ?auto_215068 ?auto_215069 ?auto_215070 ?auto_215067 ?auto_215071 ?auto_215073 ?auto_215072 ?auto_215074 ?auto_215075 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_215161 - SURFACE
      ?auto_215162 - SURFACE
      ?auto_215163 - SURFACE
      ?auto_215160 - SURFACE
      ?auto_215164 - SURFACE
      ?auto_215166 - SURFACE
      ?auto_215165 - SURFACE
      ?auto_215167 - SURFACE
      ?auto_215168 - SURFACE
    )
    :vars
    (
      ?auto_215170 - HOIST
      ?auto_215174 - PLACE
      ?auto_215171 - PLACE
      ?auto_215173 - HOIST
      ?auto_215172 - SURFACE
      ?auto_215169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_215170 ?auto_215174 ) ( IS-CRATE ?auto_215168 ) ( not ( = ?auto_215167 ?auto_215168 ) ) ( not ( = ?auto_215165 ?auto_215167 ) ) ( not ( = ?auto_215165 ?auto_215168 ) ) ( not ( = ?auto_215171 ?auto_215174 ) ) ( HOIST-AT ?auto_215173 ?auto_215171 ) ( not ( = ?auto_215170 ?auto_215173 ) ) ( AVAILABLE ?auto_215173 ) ( SURFACE-AT ?auto_215168 ?auto_215171 ) ( ON ?auto_215168 ?auto_215172 ) ( CLEAR ?auto_215168 ) ( not ( = ?auto_215167 ?auto_215172 ) ) ( not ( = ?auto_215168 ?auto_215172 ) ) ( not ( = ?auto_215165 ?auto_215172 ) ) ( TRUCK-AT ?auto_215169 ?auto_215174 ) ( SURFACE-AT ?auto_215165 ?auto_215174 ) ( CLEAR ?auto_215165 ) ( IS-CRATE ?auto_215167 ) ( AVAILABLE ?auto_215170 ) ( IN ?auto_215167 ?auto_215169 ) ( ON ?auto_215162 ?auto_215161 ) ( ON ?auto_215163 ?auto_215162 ) ( ON ?auto_215160 ?auto_215163 ) ( ON ?auto_215164 ?auto_215160 ) ( ON ?auto_215166 ?auto_215164 ) ( ON ?auto_215165 ?auto_215166 ) ( not ( = ?auto_215161 ?auto_215162 ) ) ( not ( = ?auto_215161 ?auto_215163 ) ) ( not ( = ?auto_215161 ?auto_215160 ) ) ( not ( = ?auto_215161 ?auto_215164 ) ) ( not ( = ?auto_215161 ?auto_215166 ) ) ( not ( = ?auto_215161 ?auto_215165 ) ) ( not ( = ?auto_215161 ?auto_215167 ) ) ( not ( = ?auto_215161 ?auto_215168 ) ) ( not ( = ?auto_215161 ?auto_215172 ) ) ( not ( = ?auto_215162 ?auto_215163 ) ) ( not ( = ?auto_215162 ?auto_215160 ) ) ( not ( = ?auto_215162 ?auto_215164 ) ) ( not ( = ?auto_215162 ?auto_215166 ) ) ( not ( = ?auto_215162 ?auto_215165 ) ) ( not ( = ?auto_215162 ?auto_215167 ) ) ( not ( = ?auto_215162 ?auto_215168 ) ) ( not ( = ?auto_215162 ?auto_215172 ) ) ( not ( = ?auto_215163 ?auto_215160 ) ) ( not ( = ?auto_215163 ?auto_215164 ) ) ( not ( = ?auto_215163 ?auto_215166 ) ) ( not ( = ?auto_215163 ?auto_215165 ) ) ( not ( = ?auto_215163 ?auto_215167 ) ) ( not ( = ?auto_215163 ?auto_215168 ) ) ( not ( = ?auto_215163 ?auto_215172 ) ) ( not ( = ?auto_215160 ?auto_215164 ) ) ( not ( = ?auto_215160 ?auto_215166 ) ) ( not ( = ?auto_215160 ?auto_215165 ) ) ( not ( = ?auto_215160 ?auto_215167 ) ) ( not ( = ?auto_215160 ?auto_215168 ) ) ( not ( = ?auto_215160 ?auto_215172 ) ) ( not ( = ?auto_215164 ?auto_215166 ) ) ( not ( = ?auto_215164 ?auto_215165 ) ) ( not ( = ?auto_215164 ?auto_215167 ) ) ( not ( = ?auto_215164 ?auto_215168 ) ) ( not ( = ?auto_215164 ?auto_215172 ) ) ( not ( = ?auto_215166 ?auto_215165 ) ) ( not ( = ?auto_215166 ?auto_215167 ) ) ( not ( = ?auto_215166 ?auto_215168 ) ) ( not ( = ?auto_215166 ?auto_215172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_215165 ?auto_215167 ?auto_215168 )
      ( MAKE-8CRATE-VERIFY ?auto_215161 ?auto_215162 ?auto_215163 ?auto_215160 ?auto_215164 ?auto_215166 ?auto_215165 ?auto_215167 ?auto_215168 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219260 - SURFACE
      ?auto_219261 - SURFACE
      ?auto_219262 - SURFACE
      ?auto_219259 - SURFACE
      ?auto_219263 - SURFACE
      ?auto_219265 - SURFACE
      ?auto_219264 - SURFACE
      ?auto_219266 - SURFACE
      ?auto_219267 - SURFACE
      ?auto_219268 - SURFACE
    )
    :vars
    (
      ?auto_219269 - HOIST
      ?auto_219270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219269 ?auto_219270 ) ( SURFACE-AT ?auto_219267 ?auto_219270 ) ( CLEAR ?auto_219267 ) ( LIFTING ?auto_219269 ?auto_219268 ) ( IS-CRATE ?auto_219268 ) ( not ( = ?auto_219267 ?auto_219268 ) ) ( ON ?auto_219261 ?auto_219260 ) ( ON ?auto_219262 ?auto_219261 ) ( ON ?auto_219259 ?auto_219262 ) ( ON ?auto_219263 ?auto_219259 ) ( ON ?auto_219265 ?auto_219263 ) ( ON ?auto_219264 ?auto_219265 ) ( ON ?auto_219266 ?auto_219264 ) ( ON ?auto_219267 ?auto_219266 ) ( not ( = ?auto_219260 ?auto_219261 ) ) ( not ( = ?auto_219260 ?auto_219262 ) ) ( not ( = ?auto_219260 ?auto_219259 ) ) ( not ( = ?auto_219260 ?auto_219263 ) ) ( not ( = ?auto_219260 ?auto_219265 ) ) ( not ( = ?auto_219260 ?auto_219264 ) ) ( not ( = ?auto_219260 ?auto_219266 ) ) ( not ( = ?auto_219260 ?auto_219267 ) ) ( not ( = ?auto_219260 ?auto_219268 ) ) ( not ( = ?auto_219261 ?auto_219262 ) ) ( not ( = ?auto_219261 ?auto_219259 ) ) ( not ( = ?auto_219261 ?auto_219263 ) ) ( not ( = ?auto_219261 ?auto_219265 ) ) ( not ( = ?auto_219261 ?auto_219264 ) ) ( not ( = ?auto_219261 ?auto_219266 ) ) ( not ( = ?auto_219261 ?auto_219267 ) ) ( not ( = ?auto_219261 ?auto_219268 ) ) ( not ( = ?auto_219262 ?auto_219259 ) ) ( not ( = ?auto_219262 ?auto_219263 ) ) ( not ( = ?auto_219262 ?auto_219265 ) ) ( not ( = ?auto_219262 ?auto_219264 ) ) ( not ( = ?auto_219262 ?auto_219266 ) ) ( not ( = ?auto_219262 ?auto_219267 ) ) ( not ( = ?auto_219262 ?auto_219268 ) ) ( not ( = ?auto_219259 ?auto_219263 ) ) ( not ( = ?auto_219259 ?auto_219265 ) ) ( not ( = ?auto_219259 ?auto_219264 ) ) ( not ( = ?auto_219259 ?auto_219266 ) ) ( not ( = ?auto_219259 ?auto_219267 ) ) ( not ( = ?auto_219259 ?auto_219268 ) ) ( not ( = ?auto_219263 ?auto_219265 ) ) ( not ( = ?auto_219263 ?auto_219264 ) ) ( not ( = ?auto_219263 ?auto_219266 ) ) ( not ( = ?auto_219263 ?auto_219267 ) ) ( not ( = ?auto_219263 ?auto_219268 ) ) ( not ( = ?auto_219265 ?auto_219264 ) ) ( not ( = ?auto_219265 ?auto_219266 ) ) ( not ( = ?auto_219265 ?auto_219267 ) ) ( not ( = ?auto_219265 ?auto_219268 ) ) ( not ( = ?auto_219264 ?auto_219266 ) ) ( not ( = ?auto_219264 ?auto_219267 ) ) ( not ( = ?auto_219264 ?auto_219268 ) ) ( not ( = ?auto_219266 ?auto_219267 ) ) ( not ( = ?auto_219266 ?auto_219268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_219267 ?auto_219268 )
      ( MAKE-9CRATE-VERIFY ?auto_219260 ?auto_219261 ?auto_219262 ?auto_219259 ?auto_219263 ?auto_219265 ?auto_219264 ?auto_219266 ?auto_219267 ?auto_219268 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219340 - SURFACE
      ?auto_219341 - SURFACE
      ?auto_219342 - SURFACE
      ?auto_219339 - SURFACE
      ?auto_219343 - SURFACE
      ?auto_219345 - SURFACE
      ?auto_219344 - SURFACE
      ?auto_219346 - SURFACE
      ?auto_219347 - SURFACE
      ?auto_219348 - SURFACE
    )
    :vars
    (
      ?auto_219350 - HOIST
      ?auto_219349 - PLACE
      ?auto_219351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219350 ?auto_219349 ) ( SURFACE-AT ?auto_219347 ?auto_219349 ) ( CLEAR ?auto_219347 ) ( IS-CRATE ?auto_219348 ) ( not ( = ?auto_219347 ?auto_219348 ) ) ( TRUCK-AT ?auto_219351 ?auto_219349 ) ( AVAILABLE ?auto_219350 ) ( IN ?auto_219348 ?auto_219351 ) ( ON ?auto_219347 ?auto_219346 ) ( not ( = ?auto_219346 ?auto_219347 ) ) ( not ( = ?auto_219346 ?auto_219348 ) ) ( ON ?auto_219341 ?auto_219340 ) ( ON ?auto_219342 ?auto_219341 ) ( ON ?auto_219339 ?auto_219342 ) ( ON ?auto_219343 ?auto_219339 ) ( ON ?auto_219345 ?auto_219343 ) ( ON ?auto_219344 ?auto_219345 ) ( ON ?auto_219346 ?auto_219344 ) ( not ( = ?auto_219340 ?auto_219341 ) ) ( not ( = ?auto_219340 ?auto_219342 ) ) ( not ( = ?auto_219340 ?auto_219339 ) ) ( not ( = ?auto_219340 ?auto_219343 ) ) ( not ( = ?auto_219340 ?auto_219345 ) ) ( not ( = ?auto_219340 ?auto_219344 ) ) ( not ( = ?auto_219340 ?auto_219346 ) ) ( not ( = ?auto_219340 ?auto_219347 ) ) ( not ( = ?auto_219340 ?auto_219348 ) ) ( not ( = ?auto_219341 ?auto_219342 ) ) ( not ( = ?auto_219341 ?auto_219339 ) ) ( not ( = ?auto_219341 ?auto_219343 ) ) ( not ( = ?auto_219341 ?auto_219345 ) ) ( not ( = ?auto_219341 ?auto_219344 ) ) ( not ( = ?auto_219341 ?auto_219346 ) ) ( not ( = ?auto_219341 ?auto_219347 ) ) ( not ( = ?auto_219341 ?auto_219348 ) ) ( not ( = ?auto_219342 ?auto_219339 ) ) ( not ( = ?auto_219342 ?auto_219343 ) ) ( not ( = ?auto_219342 ?auto_219345 ) ) ( not ( = ?auto_219342 ?auto_219344 ) ) ( not ( = ?auto_219342 ?auto_219346 ) ) ( not ( = ?auto_219342 ?auto_219347 ) ) ( not ( = ?auto_219342 ?auto_219348 ) ) ( not ( = ?auto_219339 ?auto_219343 ) ) ( not ( = ?auto_219339 ?auto_219345 ) ) ( not ( = ?auto_219339 ?auto_219344 ) ) ( not ( = ?auto_219339 ?auto_219346 ) ) ( not ( = ?auto_219339 ?auto_219347 ) ) ( not ( = ?auto_219339 ?auto_219348 ) ) ( not ( = ?auto_219343 ?auto_219345 ) ) ( not ( = ?auto_219343 ?auto_219344 ) ) ( not ( = ?auto_219343 ?auto_219346 ) ) ( not ( = ?auto_219343 ?auto_219347 ) ) ( not ( = ?auto_219343 ?auto_219348 ) ) ( not ( = ?auto_219345 ?auto_219344 ) ) ( not ( = ?auto_219345 ?auto_219346 ) ) ( not ( = ?auto_219345 ?auto_219347 ) ) ( not ( = ?auto_219345 ?auto_219348 ) ) ( not ( = ?auto_219344 ?auto_219346 ) ) ( not ( = ?auto_219344 ?auto_219347 ) ) ( not ( = ?auto_219344 ?auto_219348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219346 ?auto_219347 ?auto_219348 )
      ( MAKE-9CRATE-VERIFY ?auto_219340 ?auto_219341 ?auto_219342 ?auto_219339 ?auto_219343 ?auto_219345 ?auto_219344 ?auto_219346 ?auto_219347 ?auto_219348 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219430 - SURFACE
      ?auto_219431 - SURFACE
      ?auto_219432 - SURFACE
      ?auto_219429 - SURFACE
      ?auto_219433 - SURFACE
      ?auto_219435 - SURFACE
      ?auto_219434 - SURFACE
      ?auto_219436 - SURFACE
      ?auto_219437 - SURFACE
      ?auto_219438 - SURFACE
    )
    :vars
    (
      ?auto_219442 - HOIST
      ?auto_219441 - PLACE
      ?auto_219439 - TRUCK
      ?auto_219440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219442 ?auto_219441 ) ( SURFACE-AT ?auto_219437 ?auto_219441 ) ( CLEAR ?auto_219437 ) ( IS-CRATE ?auto_219438 ) ( not ( = ?auto_219437 ?auto_219438 ) ) ( AVAILABLE ?auto_219442 ) ( IN ?auto_219438 ?auto_219439 ) ( ON ?auto_219437 ?auto_219436 ) ( not ( = ?auto_219436 ?auto_219437 ) ) ( not ( = ?auto_219436 ?auto_219438 ) ) ( TRUCK-AT ?auto_219439 ?auto_219440 ) ( not ( = ?auto_219440 ?auto_219441 ) ) ( ON ?auto_219431 ?auto_219430 ) ( ON ?auto_219432 ?auto_219431 ) ( ON ?auto_219429 ?auto_219432 ) ( ON ?auto_219433 ?auto_219429 ) ( ON ?auto_219435 ?auto_219433 ) ( ON ?auto_219434 ?auto_219435 ) ( ON ?auto_219436 ?auto_219434 ) ( not ( = ?auto_219430 ?auto_219431 ) ) ( not ( = ?auto_219430 ?auto_219432 ) ) ( not ( = ?auto_219430 ?auto_219429 ) ) ( not ( = ?auto_219430 ?auto_219433 ) ) ( not ( = ?auto_219430 ?auto_219435 ) ) ( not ( = ?auto_219430 ?auto_219434 ) ) ( not ( = ?auto_219430 ?auto_219436 ) ) ( not ( = ?auto_219430 ?auto_219437 ) ) ( not ( = ?auto_219430 ?auto_219438 ) ) ( not ( = ?auto_219431 ?auto_219432 ) ) ( not ( = ?auto_219431 ?auto_219429 ) ) ( not ( = ?auto_219431 ?auto_219433 ) ) ( not ( = ?auto_219431 ?auto_219435 ) ) ( not ( = ?auto_219431 ?auto_219434 ) ) ( not ( = ?auto_219431 ?auto_219436 ) ) ( not ( = ?auto_219431 ?auto_219437 ) ) ( not ( = ?auto_219431 ?auto_219438 ) ) ( not ( = ?auto_219432 ?auto_219429 ) ) ( not ( = ?auto_219432 ?auto_219433 ) ) ( not ( = ?auto_219432 ?auto_219435 ) ) ( not ( = ?auto_219432 ?auto_219434 ) ) ( not ( = ?auto_219432 ?auto_219436 ) ) ( not ( = ?auto_219432 ?auto_219437 ) ) ( not ( = ?auto_219432 ?auto_219438 ) ) ( not ( = ?auto_219429 ?auto_219433 ) ) ( not ( = ?auto_219429 ?auto_219435 ) ) ( not ( = ?auto_219429 ?auto_219434 ) ) ( not ( = ?auto_219429 ?auto_219436 ) ) ( not ( = ?auto_219429 ?auto_219437 ) ) ( not ( = ?auto_219429 ?auto_219438 ) ) ( not ( = ?auto_219433 ?auto_219435 ) ) ( not ( = ?auto_219433 ?auto_219434 ) ) ( not ( = ?auto_219433 ?auto_219436 ) ) ( not ( = ?auto_219433 ?auto_219437 ) ) ( not ( = ?auto_219433 ?auto_219438 ) ) ( not ( = ?auto_219435 ?auto_219434 ) ) ( not ( = ?auto_219435 ?auto_219436 ) ) ( not ( = ?auto_219435 ?auto_219437 ) ) ( not ( = ?auto_219435 ?auto_219438 ) ) ( not ( = ?auto_219434 ?auto_219436 ) ) ( not ( = ?auto_219434 ?auto_219437 ) ) ( not ( = ?auto_219434 ?auto_219438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219436 ?auto_219437 ?auto_219438 )
      ( MAKE-9CRATE-VERIFY ?auto_219430 ?auto_219431 ?auto_219432 ?auto_219429 ?auto_219433 ?auto_219435 ?auto_219434 ?auto_219436 ?auto_219437 ?auto_219438 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219529 - SURFACE
      ?auto_219530 - SURFACE
      ?auto_219531 - SURFACE
      ?auto_219528 - SURFACE
      ?auto_219532 - SURFACE
      ?auto_219534 - SURFACE
      ?auto_219533 - SURFACE
      ?auto_219535 - SURFACE
      ?auto_219536 - SURFACE
      ?auto_219537 - SURFACE
    )
    :vars
    (
      ?auto_219540 - HOIST
      ?auto_219542 - PLACE
      ?auto_219538 - TRUCK
      ?auto_219539 - PLACE
      ?auto_219541 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_219540 ?auto_219542 ) ( SURFACE-AT ?auto_219536 ?auto_219542 ) ( CLEAR ?auto_219536 ) ( IS-CRATE ?auto_219537 ) ( not ( = ?auto_219536 ?auto_219537 ) ) ( AVAILABLE ?auto_219540 ) ( ON ?auto_219536 ?auto_219535 ) ( not ( = ?auto_219535 ?auto_219536 ) ) ( not ( = ?auto_219535 ?auto_219537 ) ) ( TRUCK-AT ?auto_219538 ?auto_219539 ) ( not ( = ?auto_219539 ?auto_219542 ) ) ( HOIST-AT ?auto_219541 ?auto_219539 ) ( LIFTING ?auto_219541 ?auto_219537 ) ( not ( = ?auto_219540 ?auto_219541 ) ) ( ON ?auto_219530 ?auto_219529 ) ( ON ?auto_219531 ?auto_219530 ) ( ON ?auto_219528 ?auto_219531 ) ( ON ?auto_219532 ?auto_219528 ) ( ON ?auto_219534 ?auto_219532 ) ( ON ?auto_219533 ?auto_219534 ) ( ON ?auto_219535 ?auto_219533 ) ( not ( = ?auto_219529 ?auto_219530 ) ) ( not ( = ?auto_219529 ?auto_219531 ) ) ( not ( = ?auto_219529 ?auto_219528 ) ) ( not ( = ?auto_219529 ?auto_219532 ) ) ( not ( = ?auto_219529 ?auto_219534 ) ) ( not ( = ?auto_219529 ?auto_219533 ) ) ( not ( = ?auto_219529 ?auto_219535 ) ) ( not ( = ?auto_219529 ?auto_219536 ) ) ( not ( = ?auto_219529 ?auto_219537 ) ) ( not ( = ?auto_219530 ?auto_219531 ) ) ( not ( = ?auto_219530 ?auto_219528 ) ) ( not ( = ?auto_219530 ?auto_219532 ) ) ( not ( = ?auto_219530 ?auto_219534 ) ) ( not ( = ?auto_219530 ?auto_219533 ) ) ( not ( = ?auto_219530 ?auto_219535 ) ) ( not ( = ?auto_219530 ?auto_219536 ) ) ( not ( = ?auto_219530 ?auto_219537 ) ) ( not ( = ?auto_219531 ?auto_219528 ) ) ( not ( = ?auto_219531 ?auto_219532 ) ) ( not ( = ?auto_219531 ?auto_219534 ) ) ( not ( = ?auto_219531 ?auto_219533 ) ) ( not ( = ?auto_219531 ?auto_219535 ) ) ( not ( = ?auto_219531 ?auto_219536 ) ) ( not ( = ?auto_219531 ?auto_219537 ) ) ( not ( = ?auto_219528 ?auto_219532 ) ) ( not ( = ?auto_219528 ?auto_219534 ) ) ( not ( = ?auto_219528 ?auto_219533 ) ) ( not ( = ?auto_219528 ?auto_219535 ) ) ( not ( = ?auto_219528 ?auto_219536 ) ) ( not ( = ?auto_219528 ?auto_219537 ) ) ( not ( = ?auto_219532 ?auto_219534 ) ) ( not ( = ?auto_219532 ?auto_219533 ) ) ( not ( = ?auto_219532 ?auto_219535 ) ) ( not ( = ?auto_219532 ?auto_219536 ) ) ( not ( = ?auto_219532 ?auto_219537 ) ) ( not ( = ?auto_219534 ?auto_219533 ) ) ( not ( = ?auto_219534 ?auto_219535 ) ) ( not ( = ?auto_219534 ?auto_219536 ) ) ( not ( = ?auto_219534 ?auto_219537 ) ) ( not ( = ?auto_219533 ?auto_219535 ) ) ( not ( = ?auto_219533 ?auto_219536 ) ) ( not ( = ?auto_219533 ?auto_219537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219535 ?auto_219536 ?auto_219537 )
      ( MAKE-9CRATE-VERIFY ?auto_219529 ?auto_219530 ?auto_219531 ?auto_219528 ?auto_219532 ?auto_219534 ?auto_219533 ?auto_219535 ?auto_219536 ?auto_219537 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219637 - SURFACE
      ?auto_219638 - SURFACE
      ?auto_219639 - SURFACE
      ?auto_219636 - SURFACE
      ?auto_219640 - SURFACE
      ?auto_219642 - SURFACE
      ?auto_219641 - SURFACE
      ?auto_219643 - SURFACE
      ?auto_219644 - SURFACE
      ?auto_219645 - SURFACE
    )
    :vars
    (
      ?auto_219650 - HOIST
      ?auto_219648 - PLACE
      ?auto_219649 - TRUCK
      ?auto_219647 - PLACE
      ?auto_219651 - HOIST
      ?auto_219646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219650 ?auto_219648 ) ( SURFACE-AT ?auto_219644 ?auto_219648 ) ( CLEAR ?auto_219644 ) ( IS-CRATE ?auto_219645 ) ( not ( = ?auto_219644 ?auto_219645 ) ) ( AVAILABLE ?auto_219650 ) ( ON ?auto_219644 ?auto_219643 ) ( not ( = ?auto_219643 ?auto_219644 ) ) ( not ( = ?auto_219643 ?auto_219645 ) ) ( TRUCK-AT ?auto_219649 ?auto_219647 ) ( not ( = ?auto_219647 ?auto_219648 ) ) ( HOIST-AT ?auto_219651 ?auto_219647 ) ( not ( = ?auto_219650 ?auto_219651 ) ) ( AVAILABLE ?auto_219651 ) ( SURFACE-AT ?auto_219645 ?auto_219647 ) ( ON ?auto_219645 ?auto_219646 ) ( CLEAR ?auto_219645 ) ( not ( = ?auto_219644 ?auto_219646 ) ) ( not ( = ?auto_219645 ?auto_219646 ) ) ( not ( = ?auto_219643 ?auto_219646 ) ) ( ON ?auto_219638 ?auto_219637 ) ( ON ?auto_219639 ?auto_219638 ) ( ON ?auto_219636 ?auto_219639 ) ( ON ?auto_219640 ?auto_219636 ) ( ON ?auto_219642 ?auto_219640 ) ( ON ?auto_219641 ?auto_219642 ) ( ON ?auto_219643 ?auto_219641 ) ( not ( = ?auto_219637 ?auto_219638 ) ) ( not ( = ?auto_219637 ?auto_219639 ) ) ( not ( = ?auto_219637 ?auto_219636 ) ) ( not ( = ?auto_219637 ?auto_219640 ) ) ( not ( = ?auto_219637 ?auto_219642 ) ) ( not ( = ?auto_219637 ?auto_219641 ) ) ( not ( = ?auto_219637 ?auto_219643 ) ) ( not ( = ?auto_219637 ?auto_219644 ) ) ( not ( = ?auto_219637 ?auto_219645 ) ) ( not ( = ?auto_219637 ?auto_219646 ) ) ( not ( = ?auto_219638 ?auto_219639 ) ) ( not ( = ?auto_219638 ?auto_219636 ) ) ( not ( = ?auto_219638 ?auto_219640 ) ) ( not ( = ?auto_219638 ?auto_219642 ) ) ( not ( = ?auto_219638 ?auto_219641 ) ) ( not ( = ?auto_219638 ?auto_219643 ) ) ( not ( = ?auto_219638 ?auto_219644 ) ) ( not ( = ?auto_219638 ?auto_219645 ) ) ( not ( = ?auto_219638 ?auto_219646 ) ) ( not ( = ?auto_219639 ?auto_219636 ) ) ( not ( = ?auto_219639 ?auto_219640 ) ) ( not ( = ?auto_219639 ?auto_219642 ) ) ( not ( = ?auto_219639 ?auto_219641 ) ) ( not ( = ?auto_219639 ?auto_219643 ) ) ( not ( = ?auto_219639 ?auto_219644 ) ) ( not ( = ?auto_219639 ?auto_219645 ) ) ( not ( = ?auto_219639 ?auto_219646 ) ) ( not ( = ?auto_219636 ?auto_219640 ) ) ( not ( = ?auto_219636 ?auto_219642 ) ) ( not ( = ?auto_219636 ?auto_219641 ) ) ( not ( = ?auto_219636 ?auto_219643 ) ) ( not ( = ?auto_219636 ?auto_219644 ) ) ( not ( = ?auto_219636 ?auto_219645 ) ) ( not ( = ?auto_219636 ?auto_219646 ) ) ( not ( = ?auto_219640 ?auto_219642 ) ) ( not ( = ?auto_219640 ?auto_219641 ) ) ( not ( = ?auto_219640 ?auto_219643 ) ) ( not ( = ?auto_219640 ?auto_219644 ) ) ( not ( = ?auto_219640 ?auto_219645 ) ) ( not ( = ?auto_219640 ?auto_219646 ) ) ( not ( = ?auto_219642 ?auto_219641 ) ) ( not ( = ?auto_219642 ?auto_219643 ) ) ( not ( = ?auto_219642 ?auto_219644 ) ) ( not ( = ?auto_219642 ?auto_219645 ) ) ( not ( = ?auto_219642 ?auto_219646 ) ) ( not ( = ?auto_219641 ?auto_219643 ) ) ( not ( = ?auto_219641 ?auto_219644 ) ) ( not ( = ?auto_219641 ?auto_219645 ) ) ( not ( = ?auto_219641 ?auto_219646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219643 ?auto_219644 ?auto_219645 )
      ( MAKE-9CRATE-VERIFY ?auto_219637 ?auto_219638 ?auto_219639 ?auto_219636 ?auto_219640 ?auto_219642 ?auto_219641 ?auto_219643 ?auto_219644 ?auto_219645 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219746 - SURFACE
      ?auto_219747 - SURFACE
      ?auto_219748 - SURFACE
      ?auto_219745 - SURFACE
      ?auto_219749 - SURFACE
      ?auto_219751 - SURFACE
      ?auto_219750 - SURFACE
      ?auto_219752 - SURFACE
      ?auto_219753 - SURFACE
      ?auto_219754 - SURFACE
    )
    :vars
    (
      ?auto_219758 - HOIST
      ?auto_219756 - PLACE
      ?auto_219759 - PLACE
      ?auto_219760 - HOIST
      ?auto_219757 - SURFACE
      ?auto_219755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219758 ?auto_219756 ) ( SURFACE-AT ?auto_219753 ?auto_219756 ) ( CLEAR ?auto_219753 ) ( IS-CRATE ?auto_219754 ) ( not ( = ?auto_219753 ?auto_219754 ) ) ( AVAILABLE ?auto_219758 ) ( ON ?auto_219753 ?auto_219752 ) ( not ( = ?auto_219752 ?auto_219753 ) ) ( not ( = ?auto_219752 ?auto_219754 ) ) ( not ( = ?auto_219759 ?auto_219756 ) ) ( HOIST-AT ?auto_219760 ?auto_219759 ) ( not ( = ?auto_219758 ?auto_219760 ) ) ( AVAILABLE ?auto_219760 ) ( SURFACE-AT ?auto_219754 ?auto_219759 ) ( ON ?auto_219754 ?auto_219757 ) ( CLEAR ?auto_219754 ) ( not ( = ?auto_219753 ?auto_219757 ) ) ( not ( = ?auto_219754 ?auto_219757 ) ) ( not ( = ?auto_219752 ?auto_219757 ) ) ( TRUCK-AT ?auto_219755 ?auto_219756 ) ( ON ?auto_219747 ?auto_219746 ) ( ON ?auto_219748 ?auto_219747 ) ( ON ?auto_219745 ?auto_219748 ) ( ON ?auto_219749 ?auto_219745 ) ( ON ?auto_219751 ?auto_219749 ) ( ON ?auto_219750 ?auto_219751 ) ( ON ?auto_219752 ?auto_219750 ) ( not ( = ?auto_219746 ?auto_219747 ) ) ( not ( = ?auto_219746 ?auto_219748 ) ) ( not ( = ?auto_219746 ?auto_219745 ) ) ( not ( = ?auto_219746 ?auto_219749 ) ) ( not ( = ?auto_219746 ?auto_219751 ) ) ( not ( = ?auto_219746 ?auto_219750 ) ) ( not ( = ?auto_219746 ?auto_219752 ) ) ( not ( = ?auto_219746 ?auto_219753 ) ) ( not ( = ?auto_219746 ?auto_219754 ) ) ( not ( = ?auto_219746 ?auto_219757 ) ) ( not ( = ?auto_219747 ?auto_219748 ) ) ( not ( = ?auto_219747 ?auto_219745 ) ) ( not ( = ?auto_219747 ?auto_219749 ) ) ( not ( = ?auto_219747 ?auto_219751 ) ) ( not ( = ?auto_219747 ?auto_219750 ) ) ( not ( = ?auto_219747 ?auto_219752 ) ) ( not ( = ?auto_219747 ?auto_219753 ) ) ( not ( = ?auto_219747 ?auto_219754 ) ) ( not ( = ?auto_219747 ?auto_219757 ) ) ( not ( = ?auto_219748 ?auto_219745 ) ) ( not ( = ?auto_219748 ?auto_219749 ) ) ( not ( = ?auto_219748 ?auto_219751 ) ) ( not ( = ?auto_219748 ?auto_219750 ) ) ( not ( = ?auto_219748 ?auto_219752 ) ) ( not ( = ?auto_219748 ?auto_219753 ) ) ( not ( = ?auto_219748 ?auto_219754 ) ) ( not ( = ?auto_219748 ?auto_219757 ) ) ( not ( = ?auto_219745 ?auto_219749 ) ) ( not ( = ?auto_219745 ?auto_219751 ) ) ( not ( = ?auto_219745 ?auto_219750 ) ) ( not ( = ?auto_219745 ?auto_219752 ) ) ( not ( = ?auto_219745 ?auto_219753 ) ) ( not ( = ?auto_219745 ?auto_219754 ) ) ( not ( = ?auto_219745 ?auto_219757 ) ) ( not ( = ?auto_219749 ?auto_219751 ) ) ( not ( = ?auto_219749 ?auto_219750 ) ) ( not ( = ?auto_219749 ?auto_219752 ) ) ( not ( = ?auto_219749 ?auto_219753 ) ) ( not ( = ?auto_219749 ?auto_219754 ) ) ( not ( = ?auto_219749 ?auto_219757 ) ) ( not ( = ?auto_219751 ?auto_219750 ) ) ( not ( = ?auto_219751 ?auto_219752 ) ) ( not ( = ?auto_219751 ?auto_219753 ) ) ( not ( = ?auto_219751 ?auto_219754 ) ) ( not ( = ?auto_219751 ?auto_219757 ) ) ( not ( = ?auto_219750 ?auto_219752 ) ) ( not ( = ?auto_219750 ?auto_219753 ) ) ( not ( = ?auto_219750 ?auto_219754 ) ) ( not ( = ?auto_219750 ?auto_219757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219752 ?auto_219753 ?auto_219754 )
      ( MAKE-9CRATE-VERIFY ?auto_219746 ?auto_219747 ?auto_219748 ?auto_219745 ?auto_219749 ?auto_219751 ?auto_219750 ?auto_219752 ?auto_219753 ?auto_219754 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219855 - SURFACE
      ?auto_219856 - SURFACE
      ?auto_219857 - SURFACE
      ?auto_219854 - SURFACE
      ?auto_219858 - SURFACE
      ?auto_219860 - SURFACE
      ?auto_219859 - SURFACE
      ?auto_219861 - SURFACE
      ?auto_219862 - SURFACE
      ?auto_219863 - SURFACE
    )
    :vars
    (
      ?auto_219869 - HOIST
      ?auto_219868 - PLACE
      ?auto_219867 - PLACE
      ?auto_219865 - HOIST
      ?auto_219864 - SURFACE
      ?auto_219866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219869 ?auto_219868 ) ( IS-CRATE ?auto_219863 ) ( not ( = ?auto_219862 ?auto_219863 ) ) ( not ( = ?auto_219861 ?auto_219862 ) ) ( not ( = ?auto_219861 ?auto_219863 ) ) ( not ( = ?auto_219867 ?auto_219868 ) ) ( HOIST-AT ?auto_219865 ?auto_219867 ) ( not ( = ?auto_219869 ?auto_219865 ) ) ( AVAILABLE ?auto_219865 ) ( SURFACE-AT ?auto_219863 ?auto_219867 ) ( ON ?auto_219863 ?auto_219864 ) ( CLEAR ?auto_219863 ) ( not ( = ?auto_219862 ?auto_219864 ) ) ( not ( = ?auto_219863 ?auto_219864 ) ) ( not ( = ?auto_219861 ?auto_219864 ) ) ( TRUCK-AT ?auto_219866 ?auto_219868 ) ( SURFACE-AT ?auto_219861 ?auto_219868 ) ( CLEAR ?auto_219861 ) ( LIFTING ?auto_219869 ?auto_219862 ) ( IS-CRATE ?auto_219862 ) ( ON ?auto_219856 ?auto_219855 ) ( ON ?auto_219857 ?auto_219856 ) ( ON ?auto_219854 ?auto_219857 ) ( ON ?auto_219858 ?auto_219854 ) ( ON ?auto_219860 ?auto_219858 ) ( ON ?auto_219859 ?auto_219860 ) ( ON ?auto_219861 ?auto_219859 ) ( not ( = ?auto_219855 ?auto_219856 ) ) ( not ( = ?auto_219855 ?auto_219857 ) ) ( not ( = ?auto_219855 ?auto_219854 ) ) ( not ( = ?auto_219855 ?auto_219858 ) ) ( not ( = ?auto_219855 ?auto_219860 ) ) ( not ( = ?auto_219855 ?auto_219859 ) ) ( not ( = ?auto_219855 ?auto_219861 ) ) ( not ( = ?auto_219855 ?auto_219862 ) ) ( not ( = ?auto_219855 ?auto_219863 ) ) ( not ( = ?auto_219855 ?auto_219864 ) ) ( not ( = ?auto_219856 ?auto_219857 ) ) ( not ( = ?auto_219856 ?auto_219854 ) ) ( not ( = ?auto_219856 ?auto_219858 ) ) ( not ( = ?auto_219856 ?auto_219860 ) ) ( not ( = ?auto_219856 ?auto_219859 ) ) ( not ( = ?auto_219856 ?auto_219861 ) ) ( not ( = ?auto_219856 ?auto_219862 ) ) ( not ( = ?auto_219856 ?auto_219863 ) ) ( not ( = ?auto_219856 ?auto_219864 ) ) ( not ( = ?auto_219857 ?auto_219854 ) ) ( not ( = ?auto_219857 ?auto_219858 ) ) ( not ( = ?auto_219857 ?auto_219860 ) ) ( not ( = ?auto_219857 ?auto_219859 ) ) ( not ( = ?auto_219857 ?auto_219861 ) ) ( not ( = ?auto_219857 ?auto_219862 ) ) ( not ( = ?auto_219857 ?auto_219863 ) ) ( not ( = ?auto_219857 ?auto_219864 ) ) ( not ( = ?auto_219854 ?auto_219858 ) ) ( not ( = ?auto_219854 ?auto_219860 ) ) ( not ( = ?auto_219854 ?auto_219859 ) ) ( not ( = ?auto_219854 ?auto_219861 ) ) ( not ( = ?auto_219854 ?auto_219862 ) ) ( not ( = ?auto_219854 ?auto_219863 ) ) ( not ( = ?auto_219854 ?auto_219864 ) ) ( not ( = ?auto_219858 ?auto_219860 ) ) ( not ( = ?auto_219858 ?auto_219859 ) ) ( not ( = ?auto_219858 ?auto_219861 ) ) ( not ( = ?auto_219858 ?auto_219862 ) ) ( not ( = ?auto_219858 ?auto_219863 ) ) ( not ( = ?auto_219858 ?auto_219864 ) ) ( not ( = ?auto_219860 ?auto_219859 ) ) ( not ( = ?auto_219860 ?auto_219861 ) ) ( not ( = ?auto_219860 ?auto_219862 ) ) ( not ( = ?auto_219860 ?auto_219863 ) ) ( not ( = ?auto_219860 ?auto_219864 ) ) ( not ( = ?auto_219859 ?auto_219861 ) ) ( not ( = ?auto_219859 ?auto_219862 ) ) ( not ( = ?auto_219859 ?auto_219863 ) ) ( not ( = ?auto_219859 ?auto_219864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219861 ?auto_219862 ?auto_219863 )
      ( MAKE-9CRATE-VERIFY ?auto_219855 ?auto_219856 ?auto_219857 ?auto_219854 ?auto_219858 ?auto_219860 ?auto_219859 ?auto_219861 ?auto_219862 ?auto_219863 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219964 - SURFACE
      ?auto_219965 - SURFACE
      ?auto_219966 - SURFACE
      ?auto_219963 - SURFACE
      ?auto_219967 - SURFACE
      ?auto_219969 - SURFACE
      ?auto_219968 - SURFACE
      ?auto_219970 - SURFACE
      ?auto_219971 - SURFACE
      ?auto_219972 - SURFACE
    )
    :vars
    (
      ?auto_219976 - HOIST
      ?auto_219978 - PLACE
      ?auto_219974 - PLACE
      ?auto_219977 - HOIST
      ?auto_219973 - SURFACE
      ?auto_219975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219976 ?auto_219978 ) ( IS-CRATE ?auto_219972 ) ( not ( = ?auto_219971 ?auto_219972 ) ) ( not ( = ?auto_219970 ?auto_219971 ) ) ( not ( = ?auto_219970 ?auto_219972 ) ) ( not ( = ?auto_219974 ?auto_219978 ) ) ( HOIST-AT ?auto_219977 ?auto_219974 ) ( not ( = ?auto_219976 ?auto_219977 ) ) ( AVAILABLE ?auto_219977 ) ( SURFACE-AT ?auto_219972 ?auto_219974 ) ( ON ?auto_219972 ?auto_219973 ) ( CLEAR ?auto_219972 ) ( not ( = ?auto_219971 ?auto_219973 ) ) ( not ( = ?auto_219972 ?auto_219973 ) ) ( not ( = ?auto_219970 ?auto_219973 ) ) ( TRUCK-AT ?auto_219975 ?auto_219978 ) ( SURFACE-AT ?auto_219970 ?auto_219978 ) ( CLEAR ?auto_219970 ) ( IS-CRATE ?auto_219971 ) ( AVAILABLE ?auto_219976 ) ( IN ?auto_219971 ?auto_219975 ) ( ON ?auto_219965 ?auto_219964 ) ( ON ?auto_219966 ?auto_219965 ) ( ON ?auto_219963 ?auto_219966 ) ( ON ?auto_219967 ?auto_219963 ) ( ON ?auto_219969 ?auto_219967 ) ( ON ?auto_219968 ?auto_219969 ) ( ON ?auto_219970 ?auto_219968 ) ( not ( = ?auto_219964 ?auto_219965 ) ) ( not ( = ?auto_219964 ?auto_219966 ) ) ( not ( = ?auto_219964 ?auto_219963 ) ) ( not ( = ?auto_219964 ?auto_219967 ) ) ( not ( = ?auto_219964 ?auto_219969 ) ) ( not ( = ?auto_219964 ?auto_219968 ) ) ( not ( = ?auto_219964 ?auto_219970 ) ) ( not ( = ?auto_219964 ?auto_219971 ) ) ( not ( = ?auto_219964 ?auto_219972 ) ) ( not ( = ?auto_219964 ?auto_219973 ) ) ( not ( = ?auto_219965 ?auto_219966 ) ) ( not ( = ?auto_219965 ?auto_219963 ) ) ( not ( = ?auto_219965 ?auto_219967 ) ) ( not ( = ?auto_219965 ?auto_219969 ) ) ( not ( = ?auto_219965 ?auto_219968 ) ) ( not ( = ?auto_219965 ?auto_219970 ) ) ( not ( = ?auto_219965 ?auto_219971 ) ) ( not ( = ?auto_219965 ?auto_219972 ) ) ( not ( = ?auto_219965 ?auto_219973 ) ) ( not ( = ?auto_219966 ?auto_219963 ) ) ( not ( = ?auto_219966 ?auto_219967 ) ) ( not ( = ?auto_219966 ?auto_219969 ) ) ( not ( = ?auto_219966 ?auto_219968 ) ) ( not ( = ?auto_219966 ?auto_219970 ) ) ( not ( = ?auto_219966 ?auto_219971 ) ) ( not ( = ?auto_219966 ?auto_219972 ) ) ( not ( = ?auto_219966 ?auto_219973 ) ) ( not ( = ?auto_219963 ?auto_219967 ) ) ( not ( = ?auto_219963 ?auto_219969 ) ) ( not ( = ?auto_219963 ?auto_219968 ) ) ( not ( = ?auto_219963 ?auto_219970 ) ) ( not ( = ?auto_219963 ?auto_219971 ) ) ( not ( = ?auto_219963 ?auto_219972 ) ) ( not ( = ?auto_219963 ?auto_219973 ) ) ( not ( = ?auto_219967 ?auto_219969 ) ) ( not ( = ?auto_219967 ?auto_219968 ) ) ( not ( = ?auto_219967 ?auto_219970 ) ) ( not ( = ?auto_219967 ?auto_219971 ) ) ( not ( = ?auto_219967 ?auto_219972 ) ) ( not ( = ?auto_219967 ?auto_219973 ) ) ( not ( = ?auto_219969 ?auto_219968 ) ) ( not ( = ?auto_219969 ?auto_219970 ) ) ( not ( = ?auto_219969 ?auto_219971 ) ) ( not ( = ?auto_219969 ?auto_219972 ) ) ( not ( = ?auto_219969 ?auto_219973 ) ) ( not ( = ?auto_219968 ?auto_219970 ) ) ( not ( = ?auto_219968 ?auto_219971 ) ) ( not ( = ?auto_219968 ?auto_219972 ) ) ( not ( = ?auto_219968 ?auto_219973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219970 ?auto_219971 ?auto_219972 )
      ( MAKE-9CRATE-VERIFY ?auto_219964 ?auto_219965 ?auto_219966 ?auto_219963 ?auto_219967 ?auto_219969 ?auto_219968 ?auto_219970 ?auto_219971 ?auto_219972 ) )
  )

)

