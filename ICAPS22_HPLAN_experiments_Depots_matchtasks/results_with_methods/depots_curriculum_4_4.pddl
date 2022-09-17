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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :vars
    (
      ?auto_872 - HOIST
      ?auto_873 - PLACE
      ?auto_875 - PLACE
      ?auto_876 - HOIST
      ?auto_877 - SURFACE
      ?auto_874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_872 ?auto_873 ) ( SURFACE-AT ?auto_870 ?auto_873 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_871 ) ( AVAILABLE ?auto_872 ) ( not ( = ?auto_875 ?auto_873 ) ) ( HOIST-AT ?auto_876 ?auto_875 ) ( AVAILABLE ?auto_876 ) ( SURFACE-AT ?auto_871 ?auto_875 ) ( ON ?auto_871 ?auto_877 ) ( CLEAR ?auto_871 ) ( TRUCK-AT ?auto_874 ?auto_873 ) ( not ( = ?auto_870 ?auto_871 ) ) ( not ( = ?auto_870 ?auto_877 ) ) ( not ( = ?auto_871 ?auto_877 ) ) ( not ( = ?auto_872 ?auto_876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_874 ?auto_873 ?auto_875 )
      ( !LIFT ?auto_876 ?auto_871 ?auto_877 ?auto_875 )
      ( !LOAD ?auto_876 ?auto_871 ?auto_874 ?auto_875 )
      ( !DRIVE ?auto_874 ?auto_875 ?auto_873 )
      ( !UNLOAD ?auto_872 ?auto_871 ?auto_874 ?auto_873 )
      ( !DROP ?auto_872 ?auto_871 ?auto_870 ?auto_873 )
      ( MAKE-1CRATE-VERIFY ?auto_870 ?auto_871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_880 - SURFACE
      ?auto_881 - SURFACE
    )
    :vars
    (
      ?auto_882 - HOIST
      ?auto_883 - PLACE
      ?auto_885 - PLACE
      ?auto_886 - HOIST
      ?auto_887 - SURFACE
      ?auto_884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_882 ?auto_883 ) ( SURFACE-AT ?auto_880 ?auto_883 ) ( CLEAR ?auto_880 ) ( IS-CRATE ?auto_881 ) ( AVAILABLE ?auto_882 ) ( not ( = ?auto_885 ?auto_883 ) ) ( HOIST-AT ?auto_886 ?auto_885 ) ( AVAILABLE ?auto_886 ) ( SURFACE-AT ?auto_881 ?auto_885 ) ( ON ?auto_881 ?auto_887 ) ( CLEAR ?auto_881 ) ( TRUCK-AT ?auto_884 ?auto_883 ) ( not ( = ?auto_880 ?auto_881 ) ) ( not ( = ?auto_880 ?auto_887 ) ) ( not ( = ?auto_881 ?auto_887 ) ) ( not ( = ?auto_882 ?auto_886 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_884 ?auto_883 ?auto_885 )
      ( !LIFT ?auto_886 ?auto_881 ?auto_887 ?auto_885 )
      ( !LOAD ?auto_886 ?auto_881 ?auto_884 ?auto_885 )
      ( !DRIVE ?auto_884 ?auto_885 ?auto_883 )
      ( !UNLOAD ?auto_882 ?auto_881 ?auto_884 ?auto_883 )
      ( !DROP ?auto_882 ?auto_881 ?auto_880 ?auto_883 )
      ( MAKE-1CRATE-VERIFY ?auto_880 ?auto_881 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_891 - SURFACE
      ?auto_892 - SURFACE
      ?auto_893 - SURFACE
    )
    :vars
    (
      ?auto_897 - HOIST
      ?auto_896 - PLACE
      ?auto_898 - PLACE
      ?auto_899 - HOIST
      ?auto_895 - SURFACE
      ?auto_900 - PLACE
      ?auto_901 - HOIST
      ?auto_902 - SURFACE
      ?auto_894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897 ?auto_896 ) ( IS-CRATE ?auto_893 ) ( not ( = ?auto_898 ?auto_896 ) ) ( HOIST-AT ?auto_899 ?auto_898 ) ( AVAILABLE ?auto_899 ) ( SURFACE-AT ?auto_893 ?auto_898 ) ( ON ?auto_893 ?auto_895 ) ( CLEAR ?auto_893 ) ( not ( = ?auto_892 ?auto_893 ) ) ( not ( = ?auto_892 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_897 ?auto_899 ) ) ( SURFACE-AT ?auto_891 ?auto_896 ) ( CLEAR ?auto_891 ) ( IS-CRATE ?auto_892 ) ( AVAILABLE ?auto_897 ) ( not ( = ?auto_900 ?auto_896 ) ) ( HOIST-AT ?auto_901 ?auto_900 ) ( AVAILABLE ?auto_901 ) ( SURFACE-AT ?auto_892 ?auto_900 ) ( ON ?auto_892 ?auto_902 ) ( CLEAR ?auto_892 ) ( TRUCK-AT ?auto_894 ?auto_896 ) ( not ( = ?auto_891 ?auto_892 ) ) ( not ( = ?auto_891 ?auto_902 ) ) ( not ( = ?auto_892 ?auto_902 ) ) ( not ( = ?auto_897 ?auto_901 ) ) ( not ( = ?auto_891 ?auto_893 ) ) ( not ( = ?auto_891 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_902 ) ) ( not ( = ?auto_898 ?auto_900 ) ) ( not ( = ?auto_899 ?auto_901 ) ) ( not ( = ?auto_895 ?auto_902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_891 ?auto_892 )
      ( MAKE-1CRATE ?auto_892 ?auto_893 )
      ( MAKE-2CRATE-VERIFY ?auto_891 ?auto_892 ?auto_893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_905 - SURFACE
      ?auto_906 - SURFACE
    )
    :vars
    (
      ?auto_907 - HOIST
      ?auto_908 - PLACE
      ?auto_910 - PLACE
      ?auto_911 - HOIST
      ?auto_912 - SURFACE
      ?auto_909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_907 ?auto_908 ) ( SURFACE-AT ?auto_905 ?auto_908 ) ( CLEAR ?auto_905 ) ( IS-CRATE ?auto_906 ) ( AVAILABLE ?auto_907 ) ( not ( = ?auto_910 ?auto_908 ) ) ( HOIST-AT ?auto_911 ?auto_910 ) ( AVAILABLE ?auto_911 ) ( SURFACE-AT ?auto_906 ?auto_910 ) ( ON ?auto_906 ?auto_912 ) ( CLEAR ?auto_906 ) ( TRUCK-AT ?auto_909 ?auto_908 ) ( not ( = ?auto_905 ?auto_906 ) ) ( not ( = ?auto_905 ?auto_912 ) ) ( not ( = ?auto_906 ?auto_912 ) ) ( not ( = ?auto_907 ?auto_911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_909 ?auto_908 ?auto_910 )
      ( !LIFT ?auto_911 ?auto_906 ?auto_912 ?auto_910 )
      ( !LOAD ?auto_911 ?auto_906 ?auto_909 ?auto_910 )
      ( !DRIVE ?auto_909 ?auto_910 ?auto_908 )
      ( !UNLOAD ?auto_907 ?auto_906 ?auto_909 ?auto_908 )
      ( !DROP ?auto_907 ?auto_906 ?auto_905 ?auto_908 )
      ( MAKE-1CRATE-VERIFY ?auto_905 ?auto_906 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_917 - SURFACE
      ?auto_918 - SURFACE
      ?auto_919 - SURFACE
      ?auto_920 - SURFACE
    )
    :vars
    (
      ?auto_922 - HOIST
      ?auto_926 - PLACE
      ?auto_925 - PLACE
      ?auto_923 - HOIST
      ?auto_921 - SURFACE
      ?auto_931 - PLACE
      ?auto_932 - HOIST
      ?auto_929 - SURFACE
      ?auto_928 - PLACE
      ?auto_930 - HOIST
      ?auto_927 - SURFACE
      ?auto_924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_922 ?auto_926 ) ( IS-CRATE ?auto_920 ) ( not ( = ?auto_925 ?auto_926 ) ) ( HOIST-AT ?auto_923 ?auto_925 ) ( AVAILABLE ?auto_923 ) ( SURFACE-AT ?auto_920 ?auto_925 ) ( ON ?auto_920 ?auto_921 ) ( CLEAR ?auto_920 ) ( not ( = ?auto_919 ?auto_920 ) ) ( not ( = ?auto_919 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_921 ) ) ( not ( = ?auto_922 ?auto_923 ) ) ( IS-CRATE ?auto_919 ) ( not ( = ?auto_931 ?auto_926 ) ) ( HOIST-AT ?auto_932 ?auto_931 ) ( AVAILABLE ?auto_932 ) ( SURFACE-AT ?auto_919 ?auto_931 ) ( ON ?auto_919 ?auto_929 ) ( CLEAR ?auto_919 ) ( not ( = ?auto_918 ?auto_919 ) ) ( not ( = ?auto_918 ?auto_929 ) ) ( not ( = ?auto_919 ?auto_929 ) ) ( not ( = ?auto_922 ?auto_932 ) ) ( SURFACE-AT ?auto_917 ?auto_926 ) ( CLEAR ?auto_917 ) ( IS-CRATE ?auto_918 ) ( AVAILABLE ?auto_922 ) ( not ( = ?auto_928 ?auto_926 ) ) ( HOIST-AT ?auto_930 ?auto_928 ) ( AVAILABLE ?auto_930 ) ( SURFACE-AT ?auto_918 ?auto_928 ) ( ON ?auto_918 ?auto_927 ) ( CLEAR ?auto_918 ) ( TRUCK-AT ?auto_924 ?auto_926 ) ( not ( = ?auto_917 ?auto_918 ) ) ( not ( = ?auto_917 ?auto_927 ) ) ( not ( = ?auto_918 ?auto_927 ) ) ( not ( = ?auto_922 ?auto_930 ) ) ( not ( = ?auto_917 ?auto_919 ) ) ( not ( = ?auto_917 ?auto_929 ) ) ( not ( = ?auto_919 ?auto_927 ) ) ( not ( = ?auto_931 ?auto_928 ) ) ( not ( = ?auto_932 ?auto_930 ) ) ( not ( = ?auto_929 ?auto_927 ) ) ( not ( = ?auto_917 ?auto_920 ) ) ( not ( = ?auto_917 ?auto_921 ) ) ( not ( = ?auto_918 ?auto_920 ) ) ( not ( = ?auto_918 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_929 ) ) ( not ( = ?auto_920 ?auto_927 ) ) ( not ( = ?auto_925 ?auto_931 ) ) ( not ( = ?auto_925 ?auto_928 ) ) ( not ( = ?auto_923 ?auto_932 ) ) ( not ( = ?auto_923 ?auto_930 ) ) ( not ( = ?auto_921 ?auto_929 ) ) ( not ( = ?auto_921 ?auto_927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917 ?auto_918 ?auto_919 )
      ( MAKE-1CRATE ?auto_919 ?auto_920 )
      ( MAKE-3CRATE-VERIFY ?auto_917 ?auto_918 ?auto_919 ?auto_920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_935 - SURFACE
      ?auto_936 - SURFACE
    )
    :vars
    (
      ?auto_937 - HOIST
      ?auto_938 - PLACE
      ?auto_940 - PLACE
      ?auto_941 - HOIST
      ?auto_942 - SURFACE
      ?auto_939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_937 ?auto_938 ) ( SURFACE-AT ?auto_935 ?auto_938 ) ( CLEAR ?auto_935 ) ( IS-CRATE ?auto_936 ) ( AVAILABLE ?auto_937 ) ( not ( = ?auto_940 ?auto_938 ) ) ( HOIST-AT ?auto_941 ?auto_940 ) ( AVAILABLE ?auto_941 ) ( SURFACE-AT ?auto_936 ?auto_940 ) ( ON ?auto_936 ?auto_942 ) ( CLEAR ?auto_936 ) ( TRUCK-AT ?auto_939 ?auto_938 ) ( not ( = ?auto_935 ?auto_936 ) ) ( not ( = ?auto_935 ?auto_942 ) ) ( not ( = ?auto_936 ?auto_942 ) ) ( not ( = ?auto_937 ?auto_941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_939 ?auto_938 ?auto_940 )
      ( !LIFT ?auto_941 ?auto_936 ?auto_942 ?auto_940 )
      ( !LOAD ?auto_941 ?auto_936 ?auto_939 ?auto_940 )
      ( !DRIVE ?auto_939 ?auto_940 ?auto_938 )
      ( !UNLOAD ?auto_937 ?auto_936 ?auto_939 ?auto_938 )
      ( !DROP ?auto_937 ?auto_936 ?auto_935 ?auto_938 )
      ( MAKE-1CRATE-VERIFY ?auto_935 ?auto_936 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_948 - SURFACE
      ?auto_949 - SURFACE
      ?auto_950 - SURFACE
      ?auto_951 - SURFACE
      ?auto_952 - SURFACE
    )
    :vars
    (
      ?auto_957 - HOIST
      ?auto_958 - PLACE
      ?auto_956 - PLACE
      ?auto_955 - HOIST
      ?auto_953 - SURFACE
      ?auto_962 - PLACE
      ?auto_964 - HOIST
      ?auto_965 - SURFACE
      ?auto_961 - PLACE
      ?auto_959 - HOIST
      ?auto_960 - SURFACE
      ?auto_963 - SURFACE
      ?auto_954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_957 ?auto_958 ) ( IS-CRATE ?auto_952 ) ( not ( = ?auto_956 ?auto_958 ) ) ( HOIST-AT ?auto_955 ?auto_956 ) ( SURFACE-AT ?auto_952 ?auto_956 ) ( ON ?auto_952 ?auto_953 ) ( CLEAR ?auto_952 ) ( not ( = ?auto_951 ?auto_952 ) ) ( not ( = ?auto_951 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_957 ?auto_955 ) ) ( IS-CRATE ?auto_951 ) ( not ( = ?auto_962 ?auto_958 ) ) ( HOIST-AT ?auto_964 ?auto_962 ) ( AVAILABLE ?auto_964 ) ( SURFACE-AT ?auto_951 ?auto_962 ) ( ON ?auto_951 ?auto_965 ) ( CLEAR ?auto_951 ) ( not ( = ?auto_950 ?auto_951 ) ) ( not ( = ?auto_950 ?auto_965 ) ) ( not ( = ?auto_951 ?auto_965 ) ) ( not ( = ?auto_957 ?auto_964 ) ) ( IS-CRATE ?auto_950 ) ( not ( = ?auto_961 ?auto_958 ) ) ( HOIST-AT ?auto_959 ?auto_961 ) ( AVAILABLE ?auto_959 ) ( SURFACE-AT ?auto_950 ?auto_961 ) ( ON ?auto_950 ?auto_960 ) ( CLEAR ?auto_950 ) ( not ( = ?auto_949 ?auto_950 ) ) ( not ( = ?auto_949 ?auto_960 ) ) ( not ( = ?auto_950 ?auto_960 ) ) ( not ( = ?auto_957 ?auto_959 ) ) ( SURFACE-AT ?auto_948 ?auto_958 ) ( CLEAR ?auto_948 ) ( IS-CRATE ?auto_949 ) ( AVAILABLE ?auto_957 ) ( AVAILABLE ?auto_955 ) ( SURFACE-AT ?auto_949 ?auto_956 ) ( ON ?auto_949 ?auto_963 ) ( CLEAR ?auto_949 ) ( TRUCK-AT ?auto_954 ?auto_958 ) ( not ( = ?auto_948 ?auto_949 ) ) ( not ( = ?auto_948 ?auto_963 ) ) ( not ( = ?auto_949 ?auto_963 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_948 ?auto_960 ) ) ( not ( = ?auto_950 ?auto_963 ) ) ( not ( = ?auto_961 ?auto_956 ) ) ( not ( = ?auto_959 ?auto_955 ) ) ( not ( = ?auto_960 ?auto_963 ) ) ( not ( = ?auto_948 ?auto_951 ) ) ( not ( = ?auto_948 ?auto_965 ) ) ( not ( = ?auto_949 ?auto_951 ) ) ( not ( = ?auto_949 ?auto_965 ) ) ( not ( = ?auto_951 ?auto_960 ) ) ( not ( = ?auto_951 ?auto_963 ) ) ( not ( = ?auto_962 ?auto_961 ) ) ( not ( = ?auto_962 ?auto_956 ) ) ( not ( = ?auto_964 ?auto_959 ) ) ( not ( = ?auto_964 ?auto_955 ) ) ( not ( = ?auto_965 ?auto_960 ) ) ( not ( = ?auto_965 ?auto_963 ) ) ( not ( = ?auto_948 ?auto_952 ) ) ( not ( = ?auto_948 ?auto_953 ) ) ( not ( = ?auto_949 ?auto_952 ) ) ( not ( = ?auto_949 ?auto_953 ) ) ( not ( = ?auto_950 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_965 ) ) ( not ( = ?auto_952 ?auto_960 ) ) ( not ( = ?auto_952 ?auto_963 ) ) ( not ( = ?auto_953 ?auto_965 ) ) ( not ( = ?auto_953 ?auto_960 ) ) ( not ( = ?auto_953 ?auto_963 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_948 ?auto_949 ?auto_950 ?auto_951 )
      ( MAKE-1CRATE ?auto_951 ?auto_952 )
      ( MAKE-4CRATE-VERIFY ?auto_948 ?auto_949 ?auto_950 ?auto_951 ?auto_952 ) )
  )

)

