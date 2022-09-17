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
      ?auto_866 - SURFACE
      ?auto_867 - SURFACE
    )
    :vars
    (
      ?auto_868 - HOIST
      ?auto_869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_868 ?auto_869 ) ( SURFACE-AT ?auto_867 ?auto_869 ) ( CLEAR ?auto_867 ) ( LIFTING ?auto_868 ?auto_866 ) ( IS-CRATE ?auto_866 ) ( not ( = ?auto_866 ?auto_867 ) ) )
    :subtasks
    ( ( !DROP ?auto_868 ?auto_866 ?auto_867 ?auto_869 )
      ( MAKE-ON-VERIFY ?auto_866 ?auto_867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :vars
    (
      ?auto_873 - HOIST
      ?auto_872 - PLACE
      ?auto_874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873 ?auto_872 ) ( SURFACE-AT ?auto_871 ?auto_872 ) ( CLEAR ?auto_871 ) ( IS-CRATE ?auto_870 ) ( not ( = ?auto_870 ?auto_871 ) ) ( TRUCK-AT ?auto_874 ?auto_872 ) ( AVAILABLE ?auto_873 ) ( IN ?auto_870 ?auto_874 ) )
    :subtasks
    ( ( !UNLOAD ?auto_873 ?auto_870 ?auto_874 ?auto_872 )
      ( MAKE-ON ?auto_870 ?auto_871 )
      ( MAKE-ON-VERIFY ?auto_870 ?auto_871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_875 - SURFACE
      ?auto_876 - SURFACE
    )
    :vars
    (
      ?auto_879 - HOIST
      ?auto_878 - PLACE
      ?auto_877 - TRUCK
      ?auto_880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_879 ?auto_878 ) ( SURFACE-AT ?auto_876 ?auto_878 ) ( CLEAR ?auto_876 ) ( IS-CRATE ?auto_875 ) ( not ( = ?auto_875 ?auto_876 ) ) ( AVAILABLE ?auto_879 ) ( IN ?auto_875 ?auto_877 ) ( TRUCK-AT ?auto_877 ?auto_880 ) ( not ( = ?auto_880 ?auto_878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_877 ?auto_880 ?auto_878 )
      ( MAKE-ON ?auto_875 ?auto_876 )
      ( MAKE-ON-VERIFY ?auto_875 ?auto_876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_881 - SURFACE
      ?auto_882 - SURFACE
    )
    :vars
    (
      ?auto_883 - HOIST
      ?auto_884 - PLACE
      ?auto_886 - TRUCK
      ?auto_885 - PLACE
      ?auto_887 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_883 ?auto_884 ) ( SURFACE-AT ?auto_882 ?auto_884 ) ( CLEAR ?auto_882 ) ( IS-CRATE ?auto_881 ) ( not ( = ?auto_881 ?auto_882 ) ) ( AVAILABLE ?auto_883 ) ( TRUCK-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_885 ?auto_884 ) ) ( HOIST-AT ?auto_887 ?auto_885 ) ( LIFTING ?auto_887 ?auto_881 ) ( not ( = ?auto_883 ?auto_887 ) ) )
    :subtasks
    ( ( !LOAD ?auto_887 ?auto_881 ?auto_886 ?auto_885 )
      ( MAKE-ON ?auto_881 ?auto_882 )
      ( MAKE-ON-VERIFY ?auto_881 ?auto_882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_888 - SURFACE
      ?auto_889 - SURFACE
    )
    :vars
    (
      ?auto_892 - HOIST
      ?auto_894 - PLACE
      ?auto_893 - TRUCK
      ?auto_891 - PLACE
      ?auto_890 - HOIST
      ?auto_895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_892 ?auto_894 ) ( SURFACE-AT ?auto_889 ?auto_894 ) ( CLEAR ?auto_889 ) ( IS-CRATE ?auto_888 ) ( not ( = ?auto_888 ?auto_889 ) ) ( AVAILABLE ?auto_892 ) ( TRUCK-AT ?auto_893 ?auto_891 ) ( not ( = ?auto_891 ?auto_894 ) ) ( HOIST-AT ?auto_890 ?auto_891 ) ( not ( = ?auto_892 ?auto_890 ) ) ( AVAILABLE ?auto_890 ) ( SURFACE-AT ?auto_888 ?auto_891 ) ( ON ?auto_888 ?auto_895 ) ( CLEAR ?auto_888 ) ( not ( = ?auto_888 ?auto_895 ) ) ( not ( = ?auto_889 ?auto_895 ) ) )
    :subtasks
    ( ( !LIFT ?auto_890 ?auto_888 ?auto_895 ?auto_891 )
      ( MAKE-ON ?auto_888 ?auto_889 )
      ( MAKE-ON-VERIFY ?auto_888 ?auto_889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_896 - SURFACE
      ?auto_897 - SURFACE
    )
    :vars
    (
      ?auto_898 - HOIST
      ?auto_900 - PLACE
      ?auto_899 - PLACE
      ?auto_901 - HOIST
      ?auto_902 - SURFACE
      ?auto_903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_898 ?auto_900 ) ( SURFACE-AT ?auto_897 ?auto_900 ) ( CLEAR ?auto_897 ) ( IS-CRATE ?auto_896 ) ( not ( = ?auto_896 ?auto_897 ) ) ( AVAILABLE ?auto_898 ) ( not ( = ?auto_899 ?auto_900 ) ) ( HOIST-AT ?auto_901 ?auto_899 ) ( not ( = ?auto_898 ?auto_901 ) ) ( AVAILABLE ?auto_901 ) ( SURFACE-AT ?auto_896 ?auto_899 ) ( ON ?auto_896 ?auto_902 ) ( CLEAR ?auto_896 ) ( not ( = ?auto_896 ?auto_902 ) ) ( not ( = ?auto_897 ?auto_902 ) ) ( TRUCK-AT ?auto_903 ?auto_900 ) )
    :subtasks
    ( ( !DRIVE ?auto_903 ?auto_900 ?auto_899 )
      ( MAKE-ON ?auto_896 ?auto_897 )
      ( MAKE-ON-VERIFY ?auto_896 ?auto_897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_944 - SURFACE
      ?auto_945 - SURFACE
    )
    :vars
    (
      ?auto_947 - HOIST
      ?auto_946 - PLACE
      ?auto_949 - PLACE
      ?auto_948 - HOIST
      ?auto_950 - SURFACE
      ?auto_951 - TRUCK
      ?auto_952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_947 ?auto_946 ) ( IS-CRATE ?auto_944 ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_949 ?auto_946 ) ) ( HOIST-AT ?auto_948 ?auto_949 ) ( not ( = ?auto_947 ?auto_948 ) ) ( AVAILABLE ?auto_948 ) ( SURFACE-AT ?auto_944 ?auto_949 ) ( ON ?auto_944 ?auto_950 ) ( CLEAR ?auto_944 ) ( not ( = ?auto_944 ?auto_950 ) ) ( not ( = ?auto_945 ?auto_950 ) ) ( TRUCK-AT ?auto_951 ?auto_946 ) ( SURFACE-AT ?auto_952 ?auto_946 ) ( CLEAR ?auto_952 ) ( LIFTING ?auto_947 ?auto_945 ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_944 ?auto_952 ) ) ( not ( = ?auto_945 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_952 ) ) )
    :subtasks
    ( ( !DROP ?auto_947 ?auto_945 ?auto_952 ?auto_946 )
      ( MAKE-ON ?auto_944 ?auto_945 )
      ( MAKE-ON-VERIFY ?auto_944 ?auto_945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_953 - SURFACE
      ?auto_954 - SURFACE
    )
    :vars
    (
      ?auto_959 - HOIST
      ?auto_958 - PLACE
      ?auto_961 - PLACE
      ?auto_955 - HOIST
      ?auto_956 - SURFACE
      ?auto_957 - TRUCK
      ?auto_960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_959 ?auto_958 ) ( IS-CRATE ?auto_953 ) ( not ( = ?auto_953 ?auto_954 ) ) ( not ( = ?auto_961 ?auto_958 ) ) ( HOIST-AT ?auto_955 ?auto_961 ) ( not ( = ?auto_959 ?auto_955 ) ) ( AVAILABLE ?auto_955 ) ( SURFACE-AT ?auto_953 ?auto_961 ) ( ON ?auto_953 ?auto_956 ) ( CLEAR ?auto_953 ) ( not ( = ?auto_953 ?auto_956 ) ) ( not ( = ?auto_954 ?auto_956 ) ) ( TRUCK-AT ?auto_957 ?auto_958 ) ( SURFACE-AT ?auto_960 ?auto_958 ) ( CLEAR ?auto_960 ) ( IS-CRATE ?auto_954 ) ( not ( = ?auto_953 ?auto_960 ) ) ( not ( = ?auto_954 ?auto_960 ) ) ( not ( = ?auto_956 ?auto_960 ) ) ( AVAILABLE ?auto_959 ) ( IN ?auto_954 ?auto_957 ) )
    :subtasks
    ( ( !UNLOAD ?auto_959 ?auto_954 ?auto_957 ?auto_958 )
      ( MAKE-ON ?auto_953 ?auto_954 )
      ( MAKE-ON-VERIFY ?auto_953 ?auto_954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_968 - SURFACE
      ?auto_969 - SURFACE
    )
    :vars
    (
      ?auto_972 - HOIST
      ?auto_974 - PLACE
      ?auto_971 - PLACE
      ?auto_973 - HOIST
      ?auto_975 - SURFACE
      ?auto_970 - TRUCK
      ?auto_976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_972 ?auto_974 ) ( SURFACE-AT ?auto_969 ?auto_974 ) ( CLEAR ?auto_969 ) ( IS-CRATE ?auto_968 ) ( not ( = ?auto_968 ?auto_969 ) ) ( AVAILABLE ?auto_972 ) ( not ( = ?auto_971 ?auto_974 ) ) ( HOIST-AT ?auto_973 ?auto_971 ) ( not ( = ?auto_972 ?auto_973 ) ) ( AVAILABLE ?auto_973 ) ( SURFACE-AT ?auto_968 ?auto_971 ) ( ON ?auto_968 ?auto_975 ) ( CLEAR ?auto_968 ) ( not ( = ?auto_968 ?auto_975 ) ) ( not ( = ?auto_969 ?auto_975 ) ) ( TRUCK-AT ?auto_970 ?auto_976 ) ( not ( = ?auto_976 ?auto_974 ) ) ( not ( = ?auto_971 ?auto_976 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_970 ?auto_976 ?auto_974 )
      ( MAKE-ON ?auto_968 ?auto_969 )
      ( MAKE-ON-VERIFY ?auto_968 ?auto_969 ) )
  )

)

