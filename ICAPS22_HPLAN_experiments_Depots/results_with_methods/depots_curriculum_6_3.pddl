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
      ?auto_882 - SURFACE
      ?auto_883 - SURFACE
    )
    :vars
    (
      ?auto_884 - HOIST
      ?auto_885 - PLACE
      ?auto_887 - PLACE
      ?auto_888 - HOIST
      ?auto_889 - SURFACE
      ?auto_886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884 ?auto_885 ) ( SURFACE-AT ?auto_883 ?auto_885 ) ( CLEAR ?auto_883 ) ( IS-CRATE ?auto_882 ) ( AVAILABLE ?auto_884 ) ( not ( = ?auto_887 ?auto_885 ) ) ( HOIST-AT ?auto_888 ?auto_887 ) ( AVAILABLE ?auto_888 ) ( SURFACE-AT ?auto_882 ?auto_887 ) ( ON ?auto_882 ?auto_889 ) ( CLEAR ?auto_882 ) ( TRUCK-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_882 ?auto_883 ) ) ( not ( = ?auto_882 ?auto_889 ) ) ( not ( = ?auto_883 ?auto_889 ) ) ( not ( = ?auto_884 ?auto_888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_886 ?auto_885 ?auto_887 )
      ( !LIFT ?auto_888 ?auto_882 ?auto_889 ?auto_887 )
      ( !LOAD ?auto_888 ?auto_882 ?auto_886 ?auto_887 )
      ( !DRIVE ?auto_886 ?auto_887 ?auto_885 )
      ( !UNLOAD ?auto_884 ?auto_882 ?auto_886 ?auto_885 )
      ( !DROP ?auto_884 ?auto_882 ?auto_883 ?auto_885 )
      ( MAKE-ON-VERIFY ?auto_882 ?auto_883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_892 - SURFACE
      ?auto_893 - SURFACE
    )
    :vars
    (
      ?auto_894 - HOIST
      ?auto_895 - PLACE
      ?auto_897 - PLACE
      ?auto_898 - HOIST
      ?auto_899 - SURFACE
      ?auto_896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_894 ?auto_895 ) ( SURFACE-AT ?auto_893 ?auto_895 ) ( CLEAR ?auto_893 ) ( IS-CRATE ?auto_892 ) ( AVAILABLE ?auto_894 ) ( not ( = ?auto_897 ?auto_895 ) ) ( HOIST-AT ?auto_898 ?auto_897 ) ( AVAILABLE ?auto_898 ) ( SURFACE-AT ?auto_892 ?auto_897 ) ( ON ?auto_892 ?auto_899 ) ( CLEAR ?auto_892 ) ( TRUCK-AT ?auto_896 ?auto_895 ) ( not ( = ?auto_892 ?auto_893 ) ) ( not ( = ?auto_892 ?auto_899 ) ) ( not ( = ?auto_893 ?auto_899 ) ) ( not ( = ?auto_894 ?auto_898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_896 ?auto_895 ?auto_897 )
      ( !LIFT ?auto_898 ?auto_892 ?auto_899 ?auto_897 )
      ( !LOAD ?auto_898 ?auto_892 ?auto_896 ?auto_897 )
      ( !DRIVE ?auto_896 ?auto_897 ?auto_895 )
      ( !UNLOAD ?auto_894 ?auto_892 ?auto_896 ?auto_895 )
      ( !DROP ?auto_894 ?auto_892 ?auto_893 ?auto_895 )
      ( MAKE-ON-VERIFY ?auto_892 ?auto_893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_902 - SURFACE
      ?auto_903 - SURFACE
    )
    :vars
    (
      ?auto_904 - HOIST
      ?auto_905 - PLACE
      ?auto_907 - PLACE
      ?auto_908 - HOIST
      ?auto_909 - SURFACE
      ?auto_906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_904 ?auto_905 ) ( SURFACE-AT ?auto_903 ?auto_905 ) ( CLEAR ?auto_903 ) ( IS-CRATE ?auto_902 ) ( AVAILABLE ?auto_904 ) ( not ( = ?auto_907 ?auto_905 ) ) ( HOIST-AT ?auto_908 ?auto_907 ) ( AVAILABLE ?auto_908 ) ( SURFACE-AT ?auto_902 ?auto_907 ) ( ON ?auto_902 ?auto_909 ) ( CLEAR ?auto_902 ) ( TRUCK-AT ?auto_906 ?auto_905 ) ( not ( = ?auto_902 ?auto_903 ) ) ( not ( = ?auto_902 ?auto_909 ) ) ( not ( = ?auto_903 ?auto_909 ) ) ( not ( = ?auto_904 ?auto_908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_906 ?auto_905 ?auto_907 )
      ( !LIFT ?auto_908 ?auto_902 ?auto_909 ?auto_907 )
      ( !LOAD ?auto_908 ?auto_902 ?auto_906 ?auto_907 )
      ( !DRIVE ?auto_906 ?auto_907 ?auto_905 )
      ( !UNLOAD ?auto_904 ?auto_902 ?auto_906 ?auto_905 )
      ( !DROP ?auto_904 ?auto_902 ?auto_903 ?auto_905 )
      ( MAKE-ON-VERIFY ?auto_902 ?auto_903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_912 - SURFACE
      ?auto_913 - SURFACE
    )
    :vars
    (
      ?auto_914 - HOIST
      ?auto_915 - PLACE
      ?auto_917 - PLACE
      ?auto_918 - HOIST
      ?auto_919 - SURFACE
      ?auto_916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914 ?auto_915 ) ( SURFACE-AT ?auto_913 ?auto_915 ) ( CLEAR ?auto_913 ) ( IS-CRATE ?auto_912 ) ( AVAILABLE ?auto_914 ) ( not ( = ?auto_917 ?auto_915 ) ) ( HOIST-AT ?auto_918 ?auto_917 ) ( AVAILABLE ?auto_918 ) ( SURFACE-AT ?auto_912 ?auto_917 ) ( ON ?auto_912 ?auto_919 ) ( CLEAR ?auto_912 ) ( TRUCK-AT ?auto_916 ?auto_915 ) ( not ( = ?auto_912 ?auto_913 ) ) ( not ( = ?auto_912 ?auto_919 ) ) ( not ( = ?auto_913 ?auto_919 ) ) ( not ( = ?auto_914 ?auto_918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_916 ?auto_915 ?auto_917 )
      ( !LIFT ?auto_918 ?auto_912 ?auto_919 ?auto_917 )
      ( !LOAD ?auto_918 ?auto_912 ?auto_916 ?auto_917 )
      ( !DRIVE ?auto_916 ?auto_917 ?auto_915 )
      ( !UNLOAD ?auto_914 ?auto_912 ?auto_916 ?auto_915 )
      ( !DROP ?auto_914 ?auto_912 ?auto_913 ?auto_915 )
      ( MAKE-ON-VERIFY ?auto_912 ?auto_913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_922 - SURFACE
      ?auto_923 - SURFACE
    )
    :vars
    (
      ?auto_924 - HOIST
      ?auto_925 - PLACE
      ?auto_927 - PLACE
      ?auto_928 - HOIST
      ?auto_929 - SURFACE
      ?auto_926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924 ?auto_925 ) ( SURFACE-AT ?auto_923 ?auto_925 ) ( CLEAR ?auto_923 ) ( IS-CRATE ?auto_922 ) ( AVAILABLE ?auto_924 ) ( not ( = ?auto_927 ?auto_925 ) ) ( HOIST-AT ?auto_928 ?auto_927 ) ( AVAILABLE ?auto_928 ) ( SURFACE-AT ?auto_922 ?auto_927 ) ( ON ?auto_922 ?auto_929 ) ( CLEAR ?auto_922 ) ( TRUCK-AT ?auto_926 ?auto_925 ) ( not ( = ?auto_922 ?auto_923 ) ) ( not ( = ?auto_922 ?auto_929 ) ) ( not ( = ?auto_923 ?auto_929 ) ) ( not ( = ?auto_924 ?auto_928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_926 ?auto_925 ?auto_927 )
      ( !LIFT ?auto_928 ?auto_922 ?auto_929 ?auto_927 )
      ( !LOAD ?auto_928 ?auto_922 ?auto_926 ?auto_927 )
      ( !DRIVE ?auto_926 ?auto_927 ?auto_925 )
      ( !UNLOAD ?auto_924 ?auto_922 ?auto_926 ?auto_925 )
      ( !DROP ?auto_924 ?auto_922 ?auto_923 ?auto_925 )
      ( MAKE-ON-VERIFY ?auto_922 ?auto_923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_932 - SURFACE
      ?auto_933 - SURFACE
    )
    :vars
    (
      ?auto_934 - HOIST
      ?auto_935 - PLACE
      ?auto_937 - PLACE
      ?auto_938 - HOIST
      ?auto_939 - SURFACE
      ?auto_936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_934 ?auto_935 ) ( SURFACE-AT ?auto_933 ?auto_935 ) ( CLEAR ?auto_933 ) ( IS-CRATE ?auto_932 ) ( AVAILABLE ?auto_934 ) ( not ( = ?auto_937 ?auto_935 ) ) ( HOIST-AT ?auto_938 ?auto_937 ) ( AVAILABLE ?auto_938 ) ( SURFACE-AT ?auto_932 ?auto_937 ) ( ON ?auto_932 ?auto_939 ) ( CLEAR ?auto_932 ) ( TRUCK-AT ?auto_936 ?auto_935 ) ( not ( = ?auto_932 ?auto_933 ) ) ( not ( = ?auto_932 ?auto_939 ) ) ( not ( = ?auto_933 ?auto_939 ) ) ( not ( = ?auto_934 ?auto_938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_936 ?auto_935 ?auto_937 )
      ( !LIFT ?auto_938 ?auto_932 ?auto_939 ?auto_937 )
      ( !LOAD ?auto_938 ?auto_932 ?auto_936 ?auto_937 )
      ( !DRIVE ?auto_936 ?auto_937 ?auto_935 )
      ( !UNLOAD ?auto_934 ?auto_932 ?auto_936 ?auto_935 )
      ( !DROP ?auto_934 ?auto_932 ?auto_933 ?auto_935 )
      ( MAKE-ON-VERIFY ?auto_932 ?auto_933 ) )
  )

)

