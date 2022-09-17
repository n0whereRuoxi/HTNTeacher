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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24761 - SURFACE
      ?auto_24762 - SURFACE
    )
    :vars
    (
      ?auto_24763 - HOIST
      ?auto_24764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24763 ?auto_24764 ) ( SURFACE-AT ?auto_24762 ?auto_24764 ) ( CLEAR ?auto_24762 ) ( LIFTING ?auto_24763 ?auto_24761 ) ( IS-CRATE ?auto_24761 ) ( not ( = ?auto_24761 ?auto_24762 ) ) )
    :subtasks
    ( ( !DROP ?auto_24763 ?auto_24761 ?auto_24762 ?auto_24764 )
      ( MAKE-ON-VERIFY ?auto_24761 ?auto_24762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24765 - SURFACE
      ?auto_24766 - SURFACE
    )
    :vars
    (
      ?auto_24767 - HOIST
      ?auto_24768 - PLACE
      ?auto_24769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24767 ?auto_24768 ) ( SURFACE-AT ?auto_24766 ?auto_24768 ) ( CLEAR ?auto_24766 ) ( IS-CRATE ?auto_24765 ) ( not ( = ?auto_24765 ?auto_24766 ) ) ( TRUCK-AT ?auto_24769 ?auto_24768 ) ( AVAILABLE ?auto_24767 ) ( IN ?auto_24765 ?auto_24769 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24767 ?auto_24765 ?auto_24769 ?auto_24768 )
      ( MAKE-ON ?auto_24765 ?auto_24766 )
      ( MAKE-ON-VERIFY ?auto_24765 ?auto_24766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24770 - SURFACE
      ?auto_24771 - SURFACE
    )
    :vars
    (
      ?auto_24772 - HOIST
      ?auto_24773 - PLACE
      ?auto_24774 - TRUCK
      ?auto_24775 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24772 ?auto_24773 ) ( SURFACE-AT ?auto_24771 ?auto_24773 ) ( CLEAR ?auto_24771 ) ( IS-CRATE ?auto_24770 ) ( not ( = ?auto_24770 ?auto_24771 ) ) ( AVAILABLE ?auto_24772 ) ( IN ?auto_24770 ?auto_24774 ) ( TRUCK-AT ?auto_24774 ?auto_24775 ) ( not ( = ?auto_24775 ?auto_24773 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24774 ?auto_24775 ?auto_24773 )
      ( MAKE-ON ?auto_24770 ?auto_24771 )
      ( MAKE-ON-VERIFY ?auto_24770 ?auto_24771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24776 - SURFACE
      ?auto_24777 - SURFACE
    )
    :vars
    (
      ?auto_24780 - HOIST
      ?auto_24781 - PLACE
      ?auto_24778 - TRUCK
      ?auto_24779 - PLACE
      ?auto_24782 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24780 ?auto_24781 ) ( SURFACE-AT ?auto_24777 ?auto_24781 ) ( CLEAR ?auto_24777 ) ( IS-CRATE ?auto_24776 ) ( not ( = ?auto_24776 ?auto_24777 ) ) ( AVAILABLE ?auto_24780 ) ( TRUCK-AT ?auto_24778 ?auto_24779 ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( HOIST-AT ?auto_24782 ?auto_24779 ) ( LIFTING ?auto_24782 ?auto_24776 ) ( not ( = ?auto_24780 ?auto_24782 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24782 ?auto_24776 ?auto_24778 ?auto_24779 )
      ( MAKE-ON ?auto_24776 ?auto_24777 )
      ( MAKE-ON-VERIFY ?auto_24776 ?auto_24777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24783 - SURFACE
      ?auto_24784 - SURFACE
    )
    :vars
    (
      ?auto_24785 - HOIST
      ?auto_24789 - PLACE
      ?auto_24786 - TRUCK
      ?auto_24788 - PLACE
      ?auto_24787 - HOIST
      ?auto_24790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24785 ?auto_24789 ) ( SURFACE-AT ?auto_24784 ?auto_24789 ) ( CLEAR ?auto_24784 ) ( IS-CRATE ?auto_24783 ) ( not ( = ?auto_24783 ?auto_24784 ) ) ( AVAILABLE ?auto_24785 ) ( TRUCK-AT ?auto_24786 ?auto_24788 ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( HOIST-AT ?auto_24787 ?auto_24788 ) ( not ( = ?auto_24785 ?auto_24787 ) ) ( AVAILABLE ?auto_24787 ) ( SURFACE-AT ?auto_24783 ?auto_24788 ) ( ON ?auto_24783 ?auto_24790 ) ( CLEAR ?auto_24783 ) ( not ( = ?auto_24783 ?auto_24790 ) ) ( not ( = ?auto_24784 ?auto_24790 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24787 ?auto_24783 ?auto_24790 ?auto_24788 )
      ( MAKE-ON ?auto_24783 ?auto_24784 )
      ( MAKE-ON-VERIFY ?auto_24783 ?auto_24784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24791 - SURFACE
      ?auto_24792 - SURFACE
    )
    :vars
    (
      ?auto_24794 - HOIST
      ?auto_24798 - PLACE
      ?auto_24793 - PLACE
      ?auto_24796 - HOIST
      ?auto_24795 - SURFACE
      ?auto_24797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24794 ?auto_24798 ) ( SURFACE-AT ?auto_24792 ?auto_24798 ) ( CLEAR ?auto_24792 ) ( IS-CRATE ?auto_24791 ) ( not ( = ?auto_24791 ?auto_24792 ) ) ( AVAILABLE ?auto_24794 ) ( not ( = ?auto_24793 ?auto_24798 ) ) ( HOIST-AT ?auto_24796 ?auto_24793 ) ( not ( = ?auto_24794 ?auto_24796 ) ) ( AVAILABLE ?auto_24796 ) ( SURFACE-AT ?auto_24791 ?auto_24793 ) ( ON ?auto_24791 ?auto_24795 ) ( CLEAR ?auto_24791 ) ( not ( = ?auto_24791 ?auto_24795 ) ) ( not ( = ?auto_24792 ?auto_24795 ) ) ( TRUCK-AT ?auto_24797 ?auto_24798 ) )
    :subtasks
    ( ( !DRIVE ?auto_24797 ?auto_24798 ?auto_24793 )
      ( MAKE-ON ?auto_24791 ?auto_24792 )
      ( MAKE-ON-VERIFY ?auto_24791 ?auto_24792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24839 - SURFACE
      ?auto_24840 - SURFACE
    )
    :vars
    (
      ?auto_24845 - HOIST
      ?auto_24842 - PLACE
      ?auto_24846 - PLACE
      ?auto_24844 - HOIST
      ?auto_24843 - SURFACE
      ?auto_24841 - TRUCK
      ?auto_24847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24845 ?auto_24842 ) ( IS-CRATE ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24840 ) ) ( not ( = ?auto_24846 ?auto_24842 ) ) ( HOIST-AT ?auto_24844 ?auto_24846 ) ( not ( = ?auto_24845 ?auto_24844 ) ) ( AVAILABLE ?auto_24844 ) ( SURFACE-AT ?auto_24839 ?auto_24846 ) ( ON ?auto_24839 ?auto_24843 ) ( CLEAR ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24843 ) ) ( not ( = ?auto_24840 ?auto_24843 ) ) ( TRUCK-AT ?auto_24841 ?auto_24842 ) ( SURFACE-AT ?auto_24847 ?auto_24842 ) ( CLEAR ?auto_24847 ) ( LIFTING ?auto_24845 ?auto_24840 ) ( IS-CRATE ?auto_24840 ) ( not ( = ?auto_24839 ?auto_24847 ) ) ( not ( = ?auto_24840 ?auto_24847 ) ) ( not ( = ?auto_24843 ?auto_24847 ) ) )
    :subtasks
    ( ( !DROP ?auto_24845 ?auto_24840 ?auto_24847 ?auto_24842 )
      ( MAKE-ON ?auto_24839 ?auto_24840 )
      ( MAKE-ON-VERIFY ?auto_24839 ?auto_24840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24848 - SURFACE
      ?auto_24849 - SURFACE
    )
    :vars
    (
      ?auto_24854 - HOIST
      ?auto_24851 - PLACE
      ?auto_24852 - PLACE
      ?auto_24850 - HOIST
      ?auto_24856 - SURFACE
      ?auto_24853 - TRUCK
      ?auto_24855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24854 ?auto_24851 ) ( IS-CRATE ?auto_24848 ) ( not ( = ?auto_24848 ?auto_24849 ) ) ( not ( = ?auto_24852 ?auto_24851 ) ) ( HOIST-AT ?auto_24850 ?auto_24852 ) ( not ( = ?auto_24854 ?auto_24850 ) ) ( AVAILABLE ?auto_24850 ) ( SURFACE-AT ?auto_24848 ?auto_24852 ) ( ON ?auto_24848 ?auto_24856 ) ( CLEAR ?auto_24848 ) ( not ( = ?auto_24848 ?auto_24856 ) ) ( not ( = ?auto_24849 ?auto_24856 ) ) ( TRUCK-AT ?auto_24853 ?auto_24851 ) ( SURFACE-AT ?auto_24855 ?auto_24851 ) ( CLEAR ?auto_24855 ) ( IS-CRATE ?auto_24849 ) ( not ( = ?auto_24848 ?auto_24855 ) ) ( not ( = ?auto_24849 ?auto_24855 ) ) ( not ( = ?auto_24856 ?auto_24855 ) ) ( AVAILABLE ?auto_24854 ) ( IN ?auto_24849 ?auto_24853 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24854 ?auto_24849 ?auto_24853 ?auto_24851 )
      ( MAKE-ON ?auto_24848 ?auto_24849 )
      ( MAKE-ON-VERIFY ?auto_24848 ?auto_24849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24863 - SURFACE
      ?auto_24864 - SURFACE
    )
    :vars
    (
      ?auto_24865 - HOIST
      ?auto_24869 - PLACE
      ?auto_24866 - PLACE
      ?auto_24868 - HOIST
      ?auto_24867 - SURFACE
      ?auto_24870 - TRUCK
      ?auto_24871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24865 ?auto_24869 ) ( SURFACE-AT ?auto_24864 ?auto_24869 ) ( CLEAR ?auto_24864 ) ( IS-CRATE ?auto_24863 ) ( not ( = ?auto_24863 ?auto_24864 ) ) ( AVAILABLE ?auto_24865 ) ( not ( = ?auto_24866 ?auto_24869 ) ) ( HOIST-AT ?auto_24868 ?auto_24866 ) ( not ( = ?auto_24865 ?auto_24868 ) ) ( AVAILABLE ?auto_24868 ) ( SURFACE-AT ?auto_24863 ?auto_24866 ) ( ON ?auto_24863 ?auto_24867 ) ( CLEAR ?auto_24863 ) ( not ( = ?auto_24863 ?auto_24867 ) ) ( not ( = ?auto_24864 ?auto_24867 ) ) ( TRUCK-AT ?auto_24870 ?auto_24871 ) ( not ( = ?auto_24871 ?auto_24869 ) ) ( not ( = ?auto_24866 ?auto_24871 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24870 ?auto_24871 ?auto_24869 )
      ( MAKE-ON ?auto_24863 ?auto_24864 )
      ( MAKE-ON-VERIFY ?auto_24863 ?auto_24864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25036 - SURFACE
      ?auto_25037 - SURFACE
    )
    :vars
    (
      ?auto_25041 - HOIST
      ?auto_25043 - PLACE
      ?auto_25040 - TRUCK
      ?auto_25038 - PLACE
      ?auto_25039 - HOIST
      ?auto_25042 - SURFACE
      ?auto_25044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25041 ?auto_25043 ) ( SURFACE-AT ?auto_25037 ?auto_25043 ) ( CLEAR ?auto_25037 ) ( IS-CRATE ?auto_25036 ) ( not ( = ?auto_25036 ?auto_25037 ) ) ( AVAILABLE ?auto_25041 ) ( TRUCK-AT ?auto_25040 ?auto_25038 ) ( not ( = ?auto_25038 ?auto_25043 ) ) ( HOIST-AT ?auto_25039 ?auto_25038 ) ( not ( = ?auto_25041 ?auto_25039 ) ) ( SURFACE-AT ?auto_25036 ?auto_25038 ) ( ON ?auto_25036 ?auto_25042 ) ( CLEAR ?auto_25036 ) ( not ( = ?auto_25036 ?auto_25042 ) ) ( not ( = ?auto_25037 ?auto_25042 ) ) ( LIFTING ?auto_25039 ?auto_25044 ) ( IS-CRATE ?auto_25044 ) ( not ( = ?auto_25036 ?auto_25044 ) ) ( not ( = ?auto_25037 ?auto_25044 ) ) ( not ( = ?auto_25042 ?auto_25044 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25039 ?auto_25044 ?auto_25040 ?auto_25038 )
      ( MAKE-ON ?auto_25036 ?auto_25037 )
      ( MAKE-ON-VERIFY ?auto_25036 ?auto_25037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25152 - SURFACE
      ?auto_25153 - SURFACE
    )
    :vars
    (
      ?auto_25154 - HOIST
      ?auto_25157 - PLACE
      ?auto_25155 - PLACE
      ?auto_25156 - HOIST
      ?auto_25158 - SURFACE
      ?auto_25159 - TRUCK
      ?auto_25160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25154 ?auto_25157 ) ( SURFACE-AT ?auto_25153 ?auto_25157 ) ( CLEAR ?auto_25153 ) ( IS-CRATE ?auto_25152 ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( HOIST-AT ?auto_25156 ?auto_25155 ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( AVAILABLE ?auto_25156 ) ( SURFACE-AT ?auto_25152 ?auto_25155 ) ( ON ?auto_25152 ?auto_25158 ) ( CLEAR ?auto_25152 ) ( not ( = ?auto_25152 ?auto_25158 ) ) ( not ( = ?auto_25153 ?auto_25158 ) ) ( TRUCK-AT ?auto_25159 ?auto_25157 ) ( LIFTING ?auto_25154 ?auto_25160 ) ( IS-CRATE ?auto_25160 ) ( not ( = ?auto_25152 ?auto_25160 ) ) ( not ( = ?auto_25153 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25154 ?auto_25160 ?auto_25159 ?auto_25157 )
      ( MAKE-ON ?auto_25152 ?auto_25153 )
      ( MAKE-ON-VERIFY ?auto_25152 ?auto_25153 ) )
  )

)

