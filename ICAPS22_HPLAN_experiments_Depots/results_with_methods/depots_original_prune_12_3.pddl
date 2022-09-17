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
      ?auto_38781 - SURFACE
      ?auto_38782 - SURFACE
    )
    :vars
    (
      ?auto_38783 - HOIST
      ?auto_38784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38783 ?auto_38784 ) ( SURFACE-AT ?auto_38782 ?auto_38784 ) ( CLEAR ?auto_38782 ) ( LIFTING ?auto_38783 ?auto_38781 ) ( IS-CRATE ?auto_38781 ) ( not ( = ?auto_38781 ?auto_38782 ) ) )
    :subtasks
    ( ( !DROP ?auto_38783 ?auto_38781 ?auto_38782 ?auto_38784 )
      ( MAKE-ON-VERIFY ?auto_38781 ?auto_38782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38785 - SURFACE
      ?auto_38786 - SURFACE
    )
    :vars
    (
      ?auto_38787 - HOIST
      ?auto_38788 - PLACE
      ?auto_38789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38787 ?auto_38788 ) ( SURFACE-AT ?auto_38786 ?auto_38788 ) ( CLEAR ?auto_38786 ) ( IS-CRATE ?auto_38785 ) ( not ( = ?auto_38785 ?auto_38786 ) ) ( TRUCK-AT ?auto_38789 ?auto_38788 ) ( AVAILABLE ?auto_38787 ) ( IN ?auto_38785 ?auto_38789 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38787 ?auto_38785 ?auto_38789 ?auto_38788 )
      ( MAKE-ON ?auto_38785 ?auto_38786 )
      ( MAKE-ON-VERIFY ?auto_38785 ?auto_38786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38790 - SURFACE
      ?auto_38791 - SURFACE
    )
    :vars
    (
      ?auto_38792 - HOIST
      ?auto_38794 - PLACE
      ?auto_38793 - TRUCK
      ?auto_38795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38792 ?auto_38794 ) ( SURFACE-AT ?auto_38791 ?auto_38794 ) ( CLEAR ?auto_38791 ) ( IS-CRATE ?auto_38790 ) ( not ( = ?auto_38790 ?auto_38791 ) ) ( AVAILABLE ?auto_38792 ) ( IN ?auto_38790 ?auto_38793 ) ( TRUCK-AT ?auto_38793 ?auto_38795 ) ( not ( = ?auto_38795 ?auto_38794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38793 ?auto_38795 ?auto_38794 )
      ( MAKE-ON ?auto_38790 ?auto_38791 )
      ( MAKE-ON-VERIFY ?auto_38790 ?auto_38791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38796 - SURFACE
      ?auto_38797 - SURFACE
    )
    :vars
    (
      ?auto_38799 - HOIST
      ?auto_38801 - PLACE
      ?auto_38798 - TRUCK
      ?auto_38800 - PLACE
      ?auto_38802 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38799 ?auto_38801 ) ( SURFACE-AT ?auto_38797 ?auto_38801 ) ( CLEAR ?auto_38797 ) ( IS-CRATE ?auto_38796 ) ( not ( = ?auto_38796 ?auto_38797 ) ) ( AVAILABLE ?auto_38799 ) ( TRUCK-AT ?auto_38798 ?auto_38800 ) ( not ( = ?auto_38800 ?auto_38801 ) ) ( HOIST-AT ?auto_38802 ?auto_38800 ) ( LIFTING ?auto_38802 ?auto_38796 ) ( not ( = ?auto_38799 ?auto_38802 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38802 ?auto_38796 ?auto_38798 ?auto_38800 )
      ( MAKE-ON ?auto_38796 ?auto_38797 )
      ( MAKE-ON-VERIFY ?auto_38796 ?auto_38797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38803 - SURFACE
      ?auto_38804 - SURFACE
    )
    :vars
    (
      ?auto_38805 - HOIST
      ?auto_38809 - PLACE
      ?auto_38806 - TRUCK
      ?auto_38808 - PLACE
      ?auto_38807 - HOIST
      ?auto_38810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38805 ?auto_38809 ) ( SURFACE-AT ?auto_38804 ?auto_38809 ) ( CLEAR ?auto_38804 ) ( IS-CRATE ?auto_38803 ) ( not ( = ?auto_38803 ?auto_38804 ) ) ( AVAILABLE ?auto_38805 ) ( TRUCK-AT ?auto_38806 ?auto_38808 ) ( not ( = ?auto_38808 ?auto_38809 ) ) ( HOIST-AT ?auto_38807 ?auto_38808 ) ( not ( = ?auto_38805 ?auto_38807 ) ) ( AVAILABLE ?auto_38807 ) ( SURFACE-AT ?auto_38803 ?auto_38808 ) ( ON ?auto_38803 ?auto_38810 ) ( CLEAR ?auto_38803 ) ( not ( = ?auto_38803 ?auto_38810 ) ) ( not ( = ?auto_38804 ?auto_38810 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38807 ?auto_38803 ?auto_38810 ?auto_38808 )
      ( MAKE-ON ?auto_38803 ?auto_38804 )
      ( MAKE-ON-VERIFY ?auto_38803 ?auto_38804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38811 - SURFACE
      ?auto_38812 - SURFACE
    )
    :vars
    (
      ?auto_38814 - HOIST
      ?auto_38816 - PLACE
      ?auto_38813 - PLACE
      ?auto_38818 - HOIST
      ?auto_38817 - SURFACE
      ?auto_38815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38814 ?auto_38816 ) ( SURFACE-AT ?auto_38812 ?auto_38816 ) ( CLEAR ?auto_38812 ) ( IS-CRATE ?auto_38811 ) ( not ( = ?auto_38811 ?auto_38812 ) ) ( AVAILABLE ?auto_38814 ) ( not ( = ?auto_38813 ?auto_38816 ) ) ( HOIST-AT ?auto_38818 ?auto_38813 ) ( not ( = ?auto_38814 ?auto_38818 ) ) ( AVAILABLE ?auto_38818 ) ( SURFACE-AT ?auto_38811 ?auto_38813 ) ( ON ?auto_38811 ?auto_38817 ) ( CLEAR ?auto_38811 ) ( not ( = ?auto_38811 ?auto_38817 ) ) ( not ( = ?auto_38812 ?auto_38817 ) ) ( TRUCK-AT ?auto_38815 ?auto_38816 ) )
    :subtasks
    ( ( !DRIVE ?auto_38815 ?auto_38816 ?auto_38813 )
      ( MAKE-ON ?auto_38811 ?auto_38812 )
      ( MAKE-ON-VERIFY ?auto_38811 ?auto_38812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38859 - SURFACE
      ?auto_38860 - SURFACE
    )
    :vars
    (
      ?auto_38865 - HOIST
      ?auto_38861 - PLACE
      ?auto_38863 - PLACE
      ?auto_38862 - HOIST
      ?auto_38864 - SURFACE
      ?auto_38866 - TRUCK
      ?auto_38867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38865 ?auto_38861 ) ( IS-CRATE ?auto_38859 ) ( not ( = ?auto_38859 ?auto_38860 ) ) ( not ( = ?auto_38863 ?auto_38861 ) ) ( HOIST-AT ?auto_38862 ?auto_38863 ) ( not ( = ?auto_38865 ?auto_38862 ) ) ( AVAILABLE ?auto_38862 ) ( SURFACE-AT ?auto_38859 ?auto_38863 ) ( ON ?auto_38859 ?auto_38864 ) ( CLEAR ?auto_38859 ) ( not ( = ?auto_38859 ?auto_38864 ) ) ( not ( = ?auto_38860 ?auto_38864 ) ) ( TRUCK-AT ?auto_38866 ?auto_38861 ) ( SURFACE-AT ?auto_38867 ?auto_38861 ) ( CLEAR ?auto_38867 ) ( LIFTING ?auto_38865 ?auto_38860 ) ( IS-CRATE ?auto_38860 ) ( not ( = ?auto_38859 ?auto_38867 ) ) ( not ( = ?auto_38860 ?auto_38867 ) ) ( not ( = ?auto_38864 ?auto_38867 ) ) )
    :subtasks
    ( ( !DROP ?auto_38865 ?auto_38860 ?auto_38867 ?auto_38861 )
      ( MAKE-ON ?auto_38859 ?auto_38860 )
      ( MAKE-ON-VERIFY ?auto_38859 ?auto_38860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38868 - SURFACE
      ?auto_38869 - SURFACE
    )
    :vars
    (
      ?auto_38870 - HOIST
      ?auto_38872 - PLACE
      ?auto_38874 - PLACE
      ?auto_38871 - HOIST
      ?auto_38873 - SURFACE
      ?auto_38875 - TRUCK
      ?auto_38876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38870 ?auto_38872 ) ( IS-CRATE ?auto_38868 ) ( not ( = ?auto_38868 ?auto_38869 ) ) ( not ( = ?auto_38874 ?auto_38872 ) ) ( HOIST-AT ?auto_38871 ?auto_38874 ) ( not ( = ?auto_38870 ?auto_38871 ) ) ( AVAILABLE ?auto_38871 ) ( SURFACE-AT ?auto_38868 ?auto_38874 ) ( ON ?auto_38868 ?auto_38873 ) ( CLEAR ?auto_38868 ) ( not ( = ?auto_38868 ?auto_38873 ) ) ( not ( = ?auto_38869 ?auto_38873 ) ) ( TRUCK-AT ?auto_38875 ?auto_38872 ) ( SURFACE-AT ?auto_38876 ?auto_38872 ) ( CLEAR ?auto_38876 ) ( IS-CRATE ?auto_38869 ) ( not ( = ?auto_38868 ?auto_38876 ) ) ( not ( = ?auto_38869 ?auto_38876 ) ) ( not ( = ?auto_38873 ?auto_38876 ) ) ( AVAILABLE ?auto_38870 ) ( IN ?auto_38869 ?auto_38875 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38870 ?auto_38869 ?auto_38875 ?auto_38872 )
      ( MAKE-ON ?auto_38868 ?auto_38869 )
      ( MAKE-ON-VERIFY ?auto_38868 ?auto_38869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38883 - SURFACE
      ?auto_38884 - SURFACE
    )
    :vars
    (
      ?auto_38889 - HOIST
      ?auto_38890 - PLACE
      ?auto_38888 - PLACE
      ?auto_38886 - HOIST
      ?auto_38887 - SURFACE
      ?auto_38885 - TRUCK
      ?auto_38891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38889 ?auto_38890 ) ( SURFACE-AT ?auto_38884 ?auto_38890 ) ( CLEAR ?auto_38884 ) ( IS-CRATE ?auto_38883 ) ( not ( = ?auto_38883 ?auto_38884 ) ) ( AVAILABLE ?auto_38889 ) ( not ( = ?auto_38888 ?auto_38890 ) ) ( HOIST-AT ?auto_38886 ?auto_38888 ) ( not ( = ?auto_38889 ?auto_38886 ) ) ( AVAILABLE ?auto_38886 ) ( SURFACE-AT ?auto_38883 ?auto_38888 ) ( ON ?auto_38883 ?auto_38887 ) ( CLEAR ?auto_38883 ) ( not ( = ?auto_38883 ?auto_38887 ) ) ( not ( = ?auto_38884 ?auto_38887 ) ) ( TRUCK-AT ?auto_38885 ?auto_38891 ) ( not ( = ?auto_38891 ?auto_38890 ) ) ( not ( = ?auto_38888 ?auto_38891 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38885 ?auto_38891 ?auto_38890 )
      ( MAKE-ON ?auto_38883 ?auto_38884 )
      ( MAKE-ON-VERIFY ?auto_38883 ?auto_38884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39153 - SURFACE
      ?auto_39154 - SURFACE
    )
    :vars
    (
      ?auto_39155 - HOIST
      ?auto_39156 - PLACE
      ?auto_39160 - TRUCK
      ?auto_39158 - PLACE
      ?auto_39157 - HOIST
      ?auto_39159 - SURFACE
      ?auto_39161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39155 ?auto_39156 ) ( SURFACE-AT ?auto_39154 ?auto_39156 ) ( CLEAR ?auto_39154 ) ( IS-CRATE ?auto_39153 ) ( not ( = ?auto_39153 ?auto_39154 ) ) ( AVAILABLE ?auto_39155 ) ( TRUCK-AT ?auto_39160 ?auto_39158 ) ( not ( = ?auto_39158 ?auto_39156 ) ) ( HOIST-AT ?auto_39157 ?auto_39158 ) ( not ( = ?auto_39155 ?auto_39157 ) ) ( SURFACE-AT ?auto_39153 ?auto_39158 ) ( ON ?auto_39153 ?auto_39159 ) ( CLEAR ?auto_39153 ) ( not ( = ?auto_39153 ?auto_39159 ) ) ( not ( = ?auto_39154 ?auto_39159 ) ) ( LIFTING ?auto_39157 ?auto_39161 ) ( IS-CRATE ?auto_39161 ) ( not ( = ?auto_39153 ?auto_39161 ) ) ( not ( = ?auto_39154 ?auto_39161 ) ) ( not ( = ?auto_39159 ?auto_39161 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39157 ?auto_39161 ?auto_39160 ?auto_39158 )
      ( MAKE-ON ?auto_39153 ?auto_39154 )
      ( MAKE-ON-VERIFY ?auto_39153 ?auto_39154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39281 - SURFACE
      ?auto_39282 - SURFACE
    )
    :vars
    (
      ?auto_39286 - HOIST
      ?auto_39287 - PLACE
      ?auto_39284 - PLACE
      ?auto_39283 - HOIST
      ?auto_39288 - SURFACE
      ?auto_39285 - TRUCK
      ?auto_39289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39286 ?auto_39287 ) ( SURFACE-AT ?auto_39282 ?auto_39287 ) ( CLEAR ?auto_39282 ) ( IS-CRATE ?auto_39281 ) ( not ( = ?auto_39281 ?auto_39282 ) ) ( not ( = ?auto_39284 ?auto_39287 ) ) ( HOIST-AT ?auto_39283 ?auto_39284 ) ( not ( = ?auto_39286 ?auto_39283 ) ) ( AVAILABLE ?auto_39283 ) ( SURFACE-AT ?auto_39281 ?auto_39284 ) ( ON ?auto_39281 ?auto_39288 ) ( CLEAR ?auto_39281 ) ( not ( = ?auto_39281 ?auto_39288 ) ) ( not ( = ?auto_39282 ?auto_39288 ) ) ( TRUCK-AT ?auto_39285 ?auto_39287 ) ( LIFTING ?auto_39286 ?auto_39289 ) ( IS-CRATE ?auto_39289 ) ( not ( = ?auto_39281 ?auto_39289 ) ) ( not ( = ?auto_39282 ?auto_39289 ) ) ( not ( = ?auto_39288 ?auto_39289 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39286 ?auto_39289 ?auto_39285 ?auto_39287 )
      ( MAKE-ON ?auto_39281 ?auto_39282 )
      ( MAKE-ON-VERIFY ?auto_39281 ?auto_39282 ) )
  )

)

