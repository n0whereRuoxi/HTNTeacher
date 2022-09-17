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
      ?auto_21046 - SURFACE
      ?auto_21047 - SURFACE
    )
    :vars
    (
      ?auto_21048 - HOIST
      ?auto_21049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21048 ?auto_21049 ) ( SURFACE-AT ?auto_21047 ?auto_21049 ) ( CLEAR ?auto_21047 ) ( LIFTING ?auto_21048 ?auto_21046 ) ( IS-CRATE ?auto_21046 ) ( not ( = ?auto_21046 ?auto_21047 ) ) )
    :subtasks
    ( ( !DROP ?auto_21048 ?auto_21046 ?auto_21047 ?auto_21049 )
      ( MAKE-ON-VERIFY ?auto_21046 ?auto_21047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21050 - SURFACE
      ?auto_21051 - SURFACE
    )
    :vars
    (
      ?auto_21053 - HOIST
      ?auto_21052 - PLACE
      ?auto_21054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21053 ?auto_21052 ) ( SURFACE-AT ?auto_21051 ?auto_21052 ) ( CLEAR ?auto_21051 ) ( IS-CRATE ?auto_21050 ) ( not ( = ?auto_21050 ?auto_21051 ) ) ( TRUCK-AT ?auto_21054 ?auto_21052 ) ( AVAILABLE ?auto_21053 ) ( IN ?auto_21050 ?auto_21054 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21053 ?auto_21050 ?auto_21054 ?auto_21052 )
      ( MAKE-ON ?auto_21050 ?auto_21051 )
      ( MAKE-ON-VERIFY ?auto_21050 ?auto_21051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21055 - SURFACE
      ?auto_21056 - SURFACE
    )
    :vars
    (
      ?auto_21059 - HOIST
      ?auto_21057 - PLACE
      ?auto_21058 - TRUCK
      ?auto_21060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21059 ?auto_21057 ) ( SURFACE-AT ?auto_21056 ?auto_21057 ) ( CLEAR ?auto_21056 ) ( IS-CRATE ?auto_21055 ) ( not ( = ?auto_21055 ?auto_21056 ) ) ( AVAILABLE ?auto_21059 ) ( IN ?auto_21055 ?auto_21058 ) ( TRUCK-AT ?auto_21058 ?auto_21060 ) ( not ( = ?auto_21060 ?auto_21057 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21058 ?auto_21060 ?auto_21057 )
      ( MAKE-ON ?auto_21055 ?auto_21056 )
      ( MAKE-ON-VERIFY ?auto_21055 ?auto_21056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21061 - SURFACE
      ?auto_21062 - SURFACE
    )
    :vars
    (
      ?auto_21063 - HOIST
      ?auto_21066 - PLACE
      ?auto_21065 - TRUCK
      ?auto_21064 - PLACE
      ?auto_21067 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21063 ?auto_21066 ) ( SURFACE-AT ?auto_21062 ?auto_21066 ) ( CLEAR ?auto_21062 ) ( IS-CRATE ?auto_21061 ) ( not ( = ?auto_21061 ?auto_21062 ) ) ( AVAILABLE ?auto_21063 ) ( TRUCK-AT ?auto_21065 ?auto_21064 ) ( not ( = ?auto_21064 ?auto_21066 ) ) ( HOIST-AT ?auto_21067 ?auto_21064 ) ( LIFTING ?auto_21067 ?auto_21061 ) ( not ( = ?auto_21063 ?auto_21067 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21067 ?auto_21061 ?auto_21065 ?auto_21064 )
      ( MAKE-ON ?auto_21061 ?auto_21062 )
      ( MAKE-ON-VERIFY ?auto_21061 ?auto_21062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21068 - SURFACE
      ?auto_21069 - SURFACE
    )
    :vars
    (
      ?auto_21074 - HOIST
      ?auto_21071 - PLACE
      ?auto_21073 - TRUCK
      ?auto_21070 - PLACE
      ?auto_21072 - HOIST
      ?auto_21075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21074 ?auto_21071 ) ( SURFACE-AT ?auto_21069 ?auto_21071 ) ( CLEAR ?auto_21069 ) ( IS-CRATE ?auto_21068 ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( AVAILABLE ?auto_21074 ) ( TRUCK-AT ?auto_21073 ?auto_21070 ) ( not ( = ?auto_21070 ?auto_21071 ) ) ( HOIST-AT ?auto_21072 ?auto_21070 ) ( not ( = ?auto_21074 ?auto_21072 ) ) ( AVAILABLE ?auto_21072 ) ( SURFACE-AT ?auto_21068 ?auto_21070 ) ( ON ?auto_21068 ?auto_21075 ) ( CLEAR ?auto_21068 ) ( not ( = ?auto_21068 ?auto_21075 ) ) ( not ( = ?auto_21069 ?auto_21075 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21072 ?auto_21068 ?auto_21075 ?auto_21070 )
      ( MAKE-ON ?auto_21068 ?auto_21069 )
      ( MAKE-ON-VERIFY ?auto_21068 ?auto_21069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21076 - SURFACE
      ?auto_21077 - SURFACE
    )
    :vars
    (
      ?auto_21083 - HOIST
      ?auto_21079 - PLACE
      ?auto_21081 - PLACE
      ?auto_21078 - HOIST
      ?auto_21080 - SURFACE
      ?auto_21082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21083 ?auto_21079 ) ( SURFACE-AT ?auto_21077 ?auto_21079 ) ( CLEAR ?auto_21077 ) ( IS-CRATE ?auto_21076 ) ( not ( = ?auto_21076 ?auto_21077 ) ) ( AVAILABLE ?auto_21083 ) ( not ( = ?auto_21081 ?auto_21079 ) ) ( HOIST-AT ?auto_21078 ?auto_21081 ) ( not ( = ?auto_21083 ?auto_21078 ) ) ( AVAILABLE ?auto_21078 ) ( SURFACE-AT ?auto_21076 ?auto_21081 ) ( ON ?auto_21076 ?auto_21080 ) ( CLEAR ?auto_21076 ) ( not ( = ?auto_21076 ?auto_21080 ) ) ( not ( = ?auto_21077 ?auto_21080 ) ) ( TRUCK-AT ?auto_21082 ?auto_21079 ) )
    :subtasks
    ( ( !DRIVE ?auto_21082 ?auto_21079 ?auto_21081 )
      ( MAKE-ON ?auto_21076 ?auto_21077 )
      ( MAKE-ON-VERIFY ?auto_21076 ?auto_21077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21124 - SURFACE
      ?auto_21125 - SURFACE
    )
    :vars
    (
      ?auto_21126 - HOIST
      ?auto_21131 - PLACE
      ?auto_21127 - PLACE
      ?auto_21129 - HOIST
      ?auto_21130 - SURFACE
      ?auto_21128 - TRUCK
      ?auto_21132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21126 ?auto_21131 ) ( IS-CRATE ?auto_21124 ) ( not ( = ?auto_21124 ?auto_21125 ) ) ( not ( = ?auto_21127 ?auto_21131 ) ) ( HOIST-AT ?auto_21129 ?auto_21127 ) ( not ( = ?auto_21126 ?auto_21129 ) ) ( AVAILABLE ?auto_21129 ) ( SURFACE-AT ?auto_21124 ?auto_21127 ) ( ON ?auto_21124 ?auto_21130 ) ( CLEAR ?auto_21124 ) ( not ( = ?auto_21124 ?auto_21130 ) ) ( not ( = ?auto_21125 ?auto_21130 ) ) ( TRUCK-AT ?auto_21128 ?auto_21131 ) ( SURFACE-AT ?auto_21132 ?auto_21131 ) ( CLEAR ?auto_21132 ) ( LIFTING ?auto_21126 ?auto_21125 ) ( IS-CRATE ?auto_21125 ) ( not ( = ?auto_21124 ?auto_21132 ) ) ( not ( = ?auto_21125 ?auto_21132 ) ) ( not ( = ?auto_21130 ?auto_21132 ) ) )
    :subtasks
    ( ( !DROP ?auto_21126 ?auto_21125 ?auto_21132 ?auto_21131 )
      ( MAKE-ON ?auto_21124 ?auto_21125 )
      ( MAKE-ON-VERIFY ?auto_21124 ?auto_21125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21133 - SURFACE
      ?auto_21134 - SURFACE
    )
    :vars
    (
      ?auto_21137 - HOIST
      ?auto_21135 - PLACE
      ?auto_21138 - PLACE
      ?auto_21136 - HOIST
      ?auto_21140 - SURFACE
      ?auto_21141 - TRUCK
      ?auto_21139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21137 ?auto_21135 ) ( IS-CRATE ?auto_21133 ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( not ( = ?auto_21138 ?auto_21135 ) ) ( HOIST-AT ?auto_21136 ?auto_21138 ) ( not ( = ?auto_21137 ?auto_21136 ) ) ( AVAILABLE ?auto_21136 ) ( SURFACE-AT ?auto_21133 ?auto_21138 ) ( ON ?auto_21133 ?auto_21140 ) ( CLEAR ?auto_21133 ) ( not ( = ?auto_21133 ?auto_21140 ) ) ( not ( = ?auto_21134 ?auto_21140 ) ) ( TRUCK-AT ?auto_21141 ?auto_21135 ) ( SURFACE-AT ?auto_21139 ?auto_21135 ) ( CLEAR ?auto_21139 ) ( IS-CRATE ?auto_21134 ) ( not ( = ?auto_21133 ?auto_21139 ) ) ( not ( = ?auto_21134 ?auto_21139 ) ) ( not ( = ?auto_21140 ?auto_21139 ) ) ( AVAILABLE ?auto_21137 ) ( IN ?auto_21134 ?auto_21141 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21137 ?auto_21134 ?auto_21141 ?auto_21135 )
      ( MAKE-ON ?auto_21133 ?auto_21134 )
      ( MAKE-ON-VERIFY ?auto_21133 ?auto_21134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21148 - SURFACE
      ?auto_21149 - SURFACE
    )
    :vars
    (
      ?auto_21151 - HOIST
      ?auto_21150 - PLACE
      ?auto_21152 - PLACE
      ?auto_21155 - HOIST
      ?auto_21153 - SURFACE
      ?auto_21154 - TRUCK
      ?auto_21156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21151 ?auto_21150 ) ( SURFACE-AT ?auto_21149 ?auto_21150 ) ( CLEAR ?auto_21149 ) ( IS-CRATE ?auto_21148 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( AVAILABLE ?auto_21151 ) ( not ( = ?auto_21152 ?auto_21150 ) ) ( HOIST-AT ?auto_21155 ?auto_21152 ) ( not ( = ?auto_21151 ?auto_21155 ) ) ( AVAILABLE ?auto_21155 ) ( SURFACE-AT ?auto_21148 ?auto_21152 ) ( ON ?auto_21148 ?auto_21153 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21148 ?auto_21153 ) ) ( not ( = ?auto_21149 ?auto_21153 ) ) ( TRUCK-AT ?auto_21154 ?auto_21156 ) ( not ( = ?auto_21156 ?auto_21150 ) ) ( not ( = ?auto_21152 ?auto_21156 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21154 ?auto_21156 ?auto_21150 )
      ( MAKE-ON ?auto_21148 ?auto_21149 )
      ( MAKE-ON-VERIFY ?auto_21148 ?auto_21149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21672 - SURFACE
      ?auto_21673 - SURFACE
    )
    :vars
    (
      ?auto_21679 - HOIST
      ?auto_21676 - PLACE
      ?auto_21674 - TRUCK
      ?auto_21677 - PLACE
      ?auto_21678 - HOIST
      ?auto_21675 - SURFACE
      ?auto_21680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21679 ?auto_21676 ) ( SURFACE-AT ?auto_21673 ?auto_21676 ) ( CLEAR ?auto_21673 ) ( IS-CRATE ?auto_21672 ) ( not ( = ?auto_21672 ?auto_21673 ) ) ( AVAILABLE ?auto_21679 ) ( TRUCK-AT ?auto_21674 ?auto_21677 ) ( not ( = ?auto_21677 ?auto_21676 ) ) ( HOIST-AT ?auto_21678 ?auto_21677 ) ( not ( = ?auto_21679 ?auto_21678 ) ) ( SURFACE-AT ?auto_21672 ?auto_21677 ) ( ON ?auto_21672 ?auto_21675 ) ( CLEAR ?auto_21672 ) ( not ( = ?auto_21672 ?auto_21675 ) ) ( not ( = ?auto_21673 ?auto_21675 ) ) ( LIFTING ?auto_21678 ?auto_21680 ) ( IS-CRATE ?auto_21680 ) ( not ( = ?auto_21672 ?auto_21680 ) ) ( not ( = ?auto_21673 ?auto_21680 ) ) ( not ( = ?auto_21675 ?auto_21680 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21678 ?auto_21680 ?auto_21674 ?auto_21677 )
      ( MAKE-ON ?auto_21672 ?auto_21673 )
      ( MAKE-ON-VERIFY ?auto_21672 ?auto_21673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21767 - SURFACE
      ?auto_21768 - SURFACE
    )
    :vars
    (
      ?auto_21775 - HOIST
      ?auto_21774 - PLACE
      ?auto_21769 - PLACE
      ?auto_21772 - HOIST
      ?auto_21773 - SURFACE
      ?auto_21771 - SURFACE
      ?auto_21770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21775 ?auto_21774 ) ( IS-CRATE ?auto_21767 ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21769 ?auto_21774 ) ) ( HOIST-AT ?auto_21772 ?auto_21769 ) ( not ( = ?auto_21775 ?auto_21772 ) ) ( AVAILABLE ?auto_21772 ) ( SURFACE-AT ?auto_21767 ?auto_21769 ) ( ON ?auto_21767 ?auto_21773 ) ( CLEAR ?auto_21767 ) ( not ( = ?auto_21767 ?auto_21773 ) ) ( not ( = ?auto_21768 ?auto_21773 ) ) ( SURFACE-AT ?auto_21771 ?auto_21774 ) ( CLEAR ?auto_21771 ) ( IS-CRATE ?auto_21768 ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21773 ?auto_21771 ) ) ( AVAILABLE ?auto_21775 ) ( IN ?auto_21768 ?auto_21770 ) ( TRUCK-AT ?auto_21770 ?auto_21769 ) )
    :subtasks
    ( ( !DRIVE ?auto_21770 ?auto_21769 ?auto_21774 )
      ( MAKE-ON ?auto_21767 ?auto_21768 )
      ( MAKE-ON-VERIFY ?auto_21767 ?auto_21768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21776 - SURFACE
      ?auto_21777 - SURFACE
    )
    :vars
    (
      ?auto_21781 - HOIST
      ?auto_21783 - PLACE
      ?auto_21784 - PLACE
      ?auto_21780 - HOIST
      ?auto_21779 - SURFACE
      ?auto_21782 - SURFACE
      ?auto_21778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21781 ?auto_21783 ) ( IS-CRATE ?auto_21776 ) ( not ( = ?auto_21776 ?auto_21777 ) ) ( not ( = ?auto_21784 ?auto_21783 ) ) ( HOIST-AT ?auto_21780 ?auto_21784 ) ( not ( = ?auto_21781 ?auto_21780 ) ) ( SURFACE-AT ?auto_21776 ?auto_21784 ) ( ON ?auto_21776 ?auto_21779 ) ( CLEAR ?auto_21776 ) ( not ( = ?auto_21776 ?auto_21779 ) ) ( not ( = ?auto_21777 ?auto_21779 ) ) ( SURFACE-AT ?auto_21782 ?auto_21783 ) ( CLEAR ?auto_21782 ) ( IS-CRATE ?auto_21777 ) ( not ( = ?auto_21776 ?auto_21782 ) ) ( not ( = ?auto_21777 ?auto_21782 ) ) ( not ( = ?auto_21779 ?auto_21782 ) ) ( AVAILABLE ?auto_21781 ) ( TRUCK-AT ?auto_21778 ?auto_21784 ) ( LIFTING ?auto_21780 ?auto_21777 ) )
    :subtasks
    ( ( !LOAD ?auto_21780 ?auto_21777 ?auto_21778 ?auto_21784 )
      ( MAKE-ON ?auto_21776 ?auto_21777 )
      ( MAKE-ON-VERIFY ?auto_21776 ?auto_21777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21785 - SURFACE
      ?auto_21786 - SURFACE
    )
    :vars
    (
      ?auto_21789 - HOIST
      ?auto_21791 - PLACE
      ?auto_21790 - PLACE
      ?auto_21788 - HOIST
      ?auto_21787 - SURFACE
      ?auto_21793 - SURFACE
      ?auto_21792 - TRUCK
      ?auto_21794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21789 ?auto_21791 ) ( IS-CRATE ?auto_21785 ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( HOIST-AT ?auto_21788 ?auto_21790 ) ( not ( = ?auto_21789 ?auto_21788 ) ) ( SURFACE-AT ?auto_21785 ?auto_21790 ) ( ON ?auto_21785 ?auto_21787 ) ( CLEAR ?auto_21785 ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( SURFACE-AT ?auto_21793 ?auto_21791 ) ( CLEAR ?auto_21793 ) ( IS-CRATE ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21793 ) ) ( not ( = ?auto_21786 ?auto_21793 ) ) ( not ( = ?auto_21787 ?auto_21793 ) ) ( AVAILABLE ?auto_21789 ) ( TRUCK-AT ?auto_21792 ?auto_21790 ) ( AVAILABLE ?auto_21788 ) ( SURFACE-AT ?auto_21786 ?auto_21790 ) ( ON ?auto_21786 ?auto_21794 ) ( CLEAR ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21794 ) ) ( not ( = ?auto_21786 ?auto_21794 ) ) ( not ( = ?auto_21787 ?auto_21794 ) ) ( not ( = ?auto_21793 ?auto_21794 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21788 ?auto_21786 ?auto_21794 ?auto_21790 )
      ( MAKE-ON ?auto_21785 ?auto_21786 )
      ( MAKE-ON-VERIFY ?auto_21785 ?auto_21786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21795 - SURFACE
      ?auto_21796 - SURFACE
    )
    :vars
    (
      ?auto_21803 - HOIST
      ?auto_21800 - PLACE
      ?auto_21797 - PLACE
      ?auto_21801 - HOIST
      ?auto_21798 - SURFACE
      ?auto_21799 - SURFACE
      ?auto_21802 - SURFACE
      ?auto_21804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21803 ?auto_21800 ) ( IS-CRATE ?auto_21795 ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21797 ?auto_21800 ) ) ( HOIST-AT ?auto_21801 ?auto_21797 ) ( not ( = ?auto_21803 ?auto_21801 ) ) ( SURFACE-AT ?auto_21795 ?auto_21797 ) ( ON ?auto_21795 ?auto_21798 ) ( CLEAR ?auto_21795 ) ( not ( = ?auto_21795 ?auto_21798 ) ) ( not ( = ?auto_21796 ?auto_21798 ) ) ( SURFACE-AT ?auto_21799 ?auto_21800 ) ( CLEAR ?auto_21799 ) ( IS-CRATE ?auto_21796 ) ( not ( = ?auto_21795 ?auto_21799 ) ) ( not ( = ?auto_21796 ?auto_21799 ) ) ( not ( = ?auto_21798 ?auto_21799 ) ) ( AVAILABLE ?auto_21803 ) ( AVAILABLE ?auto_21801 ) ( SURFACE-AT ?auto_21796 ?auto_21797 ) ( ON ?auto_21796 ?auto_21802 ) ( CLEAR ?auto_21796 ) ( not ( = ?auto_21795 ?auto_21802 ) ) ( not ( = ?auto_21796 ?auto_21802 ) ) ( not ( = ?auto_21798 ?auto_21802 ) ) ( not ( = ?auto_21799 ?auto_21802 ) ) ( TRUCK-AT ?auto_21804 ?auto_21800 ) )
    :subtasks
    ( ( !DRIVE ?auto_21804 ?auto_21800 ?auto_21797 )
      ( MAKE-ON ?auto_21795 ?auto_21796 )
      ( MAKE-ON-VERIFY ?auto_21795 ?auto_21796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21805 - SURFACE
      ?auto_21806 - SURFACE
    )
    :vars
    (
      ?auto_21809 - HOIST
      ?auto_21811 - PLACE
      ?auto_21807 - PLACE
      ?auto_21810 - HOIST
      ?auto_21808 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21812 - SURFACE
      ?auto_21813 - TRUCK
      ?auto_21815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21809 ?auto_21811 ) ( IS-CRATE ?auto_21805 ) ( not ( = ?auto_21805 ?auto_21806 ) ) ( not ( = ?auto_21807 ?auto_21811 ) ) ( HOIST-AT ?auto_21810 ?auto_21807 ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( SURFACE-AT ?auto_21805 ?auto_21807 ) ( ON ?auto_21805 ?auto_21808 ) ( CLEAR ?auto_21805 ) ( not ( = ?auto_21805 ?auto_21808 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( IS-CRATE ?auto_21806 ) ( not ( = ?auto_21805 ?auto_21814 ) ) ( not ( = ?auto_21806 ?auto_21814 ) ) ( not ( = ?auto_21808 ?auto_21814 ) ) ( AVAILABLE ?auto_21810 ) ( SURFACE-AT ?auto_21806 ?auto_21807 ) ( ON ?auto_21806 ?auto_21812 ) ( CLEAR ?auto_21806 ) ( not ( = ?auto_21805 ?auto_21812 ) ) ( not ( = ?auto_21806 ?auto_21812 ) ) ( not ( = ?auto_21808 ?auto_21812 ) ) ( not ( = ?auto_21814 ?auto_21812 ) ) ( TRUCK-AT ?auto_21813 ?auto_21811 ) ( SURFACE-AT ?auto_21815 ?auto_21811 ) ( CLEAR ?auto_21815 ) ( LIFTING ?auto_21809 ?auto_21814 ) ( IS-CRATE ?auto_21814 ) ( not ( = ?auto_21805 ?auto_21815 ) ) ( not ( = ?auto_21806 ?auto_21815 ) ) ( not ( = ?auto_21808 ?auto_21815 ) ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) )
    :subtasks
    ( ( !DROP ?auto_21809 ?auto_21814 ?auto_21815 ?auto_21811 )
      ( MAKE-ON ?auto_21805 ?auto_21806 )
      ( MAKE-ON-VERIFY ?auto_21805 ?auto_21806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21856 - SURFACE
      ?auto_21857 - SURFACE
    )
    :vars
    (
      ?auto_21859 - HOIST
      ?auto_21862 - PLACE
      ?auto_21860 - PLACE
      ?auto_21864 - HOIST
      ?auto_21863 - SURFACE
      ?auto_21861 - SURFACE
      ?auto_21858 - TRUCK
      ?auto_21865 - SURFACE
      ?auto_21866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21859 ?auto_21862 ) ( IS-CRATE ?auto_21856 ) ( not ( = ?auto_21856 ?auto_21857 ) ) ( not ( = ?auto_21860 ?auto_21862 ) ) ( HOIST-AT ?auto_21864 ?auto_21860 ) ( not ( = ?auto_21859 ?auto_21864 ) ) ( SURFACE-AT ?auto_21856 ?auto_21860 ) ( ON ?auto_21856 ?auto_21863 ) ( CLEAR ?auto_21856 ) ( not ( = ?auto_21856 ?auto_21863 ) ) ( not ( = ?auto_21857 ?auto_21863 ) ) ( SURFACE-AT ?auto_21861 ?auto_21862 ) ( CLEAR ?auto_21861 ) ( IS-CRATE ?auto_21857 ) ( not ( = ?auto_21856 ?auto_21861 ) ) ( not ( = ?auto_21857 ?auto_21861 ) ) ( not ( = ?auto_21863 ?auto_21861 ) ) ( AVAILABLE ?auto_21859 ) ( TRUCK-AT ?auto_21858 ?auto_21860 ) ( SURFACE-AT ?auto_21857 ?auto_21860 ) ( ON ?auto_21857 ?auto_21865 ) ( CLEAR ?auto_21857 ) ( not ( = ?auto_21856 ?auto_21865 ) ) ( not ( = ?auto_21857 ?auto_21865 ) ) ( not ( = ?auto_21863 ?auto_21865 ) ) ( not ( = ?auto_21861 ?auto_21865 ) ) ( LIFTING ?auto_21864 ?auto_21866 ) ( IS-CRATE ?auto_21866 ) ( not ( = ?auto_21856 ?auto_21866 ) ) ( not ( = ?auto_21857 ?auto_21866 ) ) ( not ( = ?auto_21863 ?auto_21866 ) ) ( not ( = ?auto_21861 ?auto_21866 ) ) ( not ( = ?auto_21865 ?auto_21866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21864 ?auto_21866 ?auto_21858 ?auto_21860 )
      ( MAKE-ON ?auto_21856 ?auto_21857 )
      ( MAKE-ON-VERIFY ?auto_21856 ?auto_21857 ) )
  )

)

