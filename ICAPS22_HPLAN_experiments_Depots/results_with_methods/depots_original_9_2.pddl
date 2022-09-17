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
      ?auto_54934 - SURFACE
      ?auto_54935 - SURFACE
    )
    :vars
    (
      ?auto_54936 - HOIST
      ?auto_54937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54936 ?auto_54937 ) ( SURFACE-AT ?auto_54935 ?auto_54937 ) ( CLEAR ?auto_54935 ) ( LIFTING ?auto_54936 ?auto_54934 ) ( IS-CRATE ?auto_54934 ) ( not ( = ?auto_54934 ?auto_54935 ) ) )
    :subtasks
    ( ( !DROP ?auto_54936 ?auto_54934 ?auto_54935 ?auto_54937 )
      ( MAKE-ON-VERIFY ?auto_54934 ?auto_54935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54938 - SURFACE
      ?auto_54939 - SURFACE
    )
    :vars
    (
      ?auto_54940 - HOIST
      ?auto_54941 - PLACE
      ?auto_54942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54940 ?auto_54941 ) ( SURFACE-AT ?auto_54939 ?auto_54941 ) ( CLEAR ?auto_54939 ) ( IS-CRATE ?auto_54938 ) ( not ( = ?auto_54938 ?auto_54939 ) ) ( TRUCK-AT ?auto_54942 ?auto_54941 ) ( AVAILABLE ?auto_54940 ) ( IN ?auto_54938 ?auto_54942 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54940 ?auto_54938 ?auto_54942 ?auto_54941 )
      ( MAKE-ON ?auto_54938 ?auto_54939 )
      ( MAKE-ON-VERIFY ?auto_54938 ?auto_54939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54943 - SURFACE
      ?auto_54944 - SURFACE
    )
    :vars
    (
      ?auto_54947 - HOIST
      ?auto_54945 - PLACE
      ?auto_54946 - TRUCK
      ?auto_54948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54947 ?auto_54945 ) ( SURFACE-AT ?auto_54944 ?auto_54945 ) ( CLEAR ?auto_54944 ) ( IS-CRATE ?auto_54943 ) ( not ( = ?auto_54943 ?auto_54944 ) ) ( AVAILABLE ?auto_54947 ) ( IN ?auto_54943 ?auto_54946 ) ( TRUCK-AT ?auto_54946 ?auto_54948 ) ( not ( = ?auto_54948 ?auto_54945 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54946 ?auto_54948 ?auto_54945 )
      ( MAKE-ON ?auto_54943 ?auto_54944 )
      ( MAKE-ON-VERIFY ?auto_54943 ?auto_54944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54949 - SURFACE
      ?auto_54950 - SURFACE
    )
    :vars
    (
      ?auto_54951 - HOIST
      ?auto_54954 - PLACE
      ?auto_54953 - TRUCK
      ?auto_54952 - PLACE
      ?auto_54955 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54951 ?auto_54954 ) ( SURFACE-AT ?auto_54950 ?auto_54954 ) ( CLEAR ?auto_54950 ) ( IS-CRATE ?auto_54949 ) ( not ( = ?auto_54949 ?auto_54950 ) ) ( AVAILABLE ?auto_54951 ) ( TRUCK-AT ?auto_54953 ?auto_54952 ) ( not ( = ?auto_54952 ?auto_54954 ) ) ( HOIST-AT ?auto_54955 ?auto_54952 ) ( LIFTING ?auto_54955 ?auto_54949 ) ( not ( = ?auto_54951 ?auto_54955 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54955 ?auto_54949 ?auto_54953 ?auto_54952 )
      ( MAKE-ON ?auto_54949 ?auto_54950 )
      ( MAKE-ON-VERIFY ?auto_54949 ?auto_54950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54956 - SURFACE
      ?auto_54957 - SURFACE
    )
    :vars
    (
      ?auto_54960 - HOIST
      ?auto_54959 - PLACE
      ?auto_54962 - TRUCK
      ?auto_54958 - PLACE
      ?auto_54961 - HOIST
      ?auto_54963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54960 ?auto_54959 ) ( SURFACE-AT ?auto_54957 ?auto_54959 ) ( CLEAR ?auto_54957 ) ( IS-CRATE ?auto_54956 ) ( not ( = ?auto_54956 ?auto_54957 ) ) ( AVAILABLE ?auto_54960 ) ( TRUCK-AT ?auto_54962 ?auto_54958 ) ( not ( = ?auto_54958 ?auto_54959 ) ) ( HOIST-AT ?auto_54961 ?auto_54958 ) ( not ( = ?auto_54960 ?auto_54961 ) ) ( AVAILABLE ?auto_54961 ) ( SURFACE-AT ?auto_54956 ?auto_54958 ) ( ON ?auto_54956 ?auto_54963 ) ( CLEAR ?auto_54956 ) ( not ( = ?auto_54956 ?auto_54963 ) ) ( not ( = ?auto_54957 ?auto_54963 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54961 ?auto_54956 ?auto_54963 ?auto_54958 )
      ( MAKE-ON ?auto_54956 ?auto_54957 )
      ( MAKE-ON-VERIFY ?auto_54956 ?auto_54957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54964 - SURFACE
      ?auto_54965 - SURFACE
    )
    :vars
    (
      ?auto_54969 - HOIST
      ?auto_54966 - PLACE
      ?auto_54968 - PLACE
      ?auto_54970 - HOIST
      ?auto_54967 - SURFACE
      ?auto_54971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54969 ?auto_54966 ) ( SURFACE-AT ?auto_54965 ?auto_54966 ) ( CLEAR ?auto_54965 ) ( IS-CRATE ?auto_54964 ) ( not ( = ?auto_54964 ?auto_54965 ) ) ( AVAILABLE ?auto_54969 ) ( not ( = ?auto_54968 ?auto_54966 ) ) ( HOIST-AT ?auto_54970 ?auto_54968 ) ( not ( = ?auto_54969 ?auto_54970 ) ) ( AVAILABLE ?auto_54970 ) ( SURFACE-AT ?auto_54964 ?auto_54968 ) ( ON ?auto_54964 ?auto_54967 ) ( CLEAR ?auto_54964 ) ( not ( = ?auto_54964 ?auto_54967 ) ) ( not ( = ?auto_54965 ?auto_54967 ) ) ( TRUCK-AT ?auto_54971 ?auto_54966 ) )
    :subtasks
    ( ( !DRIVE ?auto_54971 ?auto_54966 ?auto_54968 )
      ( MAKE-ON ?auto_54964 ?auto_54965 )
      ( MAKE-ON-VERIFY ?auto_54964 ?auto_54965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54974 - SURFACE
      ?auto_54975 - SURFACE
    )
    :vars
    (
      ?auto_54976 - HOIST
      ?auto_54977 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54976 ?auto_54977 ) ( SURFACE-AT ?auto_54975 ?auto_54977 ) ( CLEAR ?auto_54975 ) ( LIFTING ?auto_54976 ?auto_54974 ) ( IS-CRATE ?auto_54974 ) ( not ( = ?auto_54974 ?auto_54975 ) ) )
    :subtasks
    ( ( !DROP ?auto_54976 ?auto_54974 ?auto_54975 ?auto_54977 )
      ( MAKE-ON-VERIFY ?auto_54974 ?auto_54975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54978 - SURFACE
      ?auto_54979 - SURFACE
    )
    :vars
    (
      ?auto_54980 - HOIST
      ?auto_54981 - PLACE
      ?auto_54982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54980 ?auto_54981 ) ( SURFACE-AT ?auto_54979 ?auto_54981 ) ( CLEAR ?auto_54979 ) ( IS-CRATE ?auto_54978 ) ( not ( = ?auto_54978 ?auto_54979 ) ) ( TRUCK-AT ?auto_54982 ?auto_54981 ) ( AVAILABLE ?auto_54980 ) ( IN ?auto_54978 ?auto_54982 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54980 ?auto_54978 ?auto_54982 ?auto_54981 )
      ( MAKE-ON ?auto_54978 ?auto_54979 )
      ( MAKE-ON-VERIFY ?auto_54978 ?auto_54979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54983 - SURFACE
      ?auto_54984 - SURFACE
    )
    :vars
    (
      ?auto_54987 - HOIST
      ?auto_54986 - PLACE
      ?auto_54985 - TRUCK
      ?auto_54988 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54987 ?auto_54986 ) ( SURFACE-AT ?auto_54984 ?auto_54986 ) ( CLEAR ?auto_54984 ) ( IS-CRATE ?auto_54983 ) ( not ( = ?auto_54983 ?auto_54984 ) ) ( AVAILABLE ?auto_54987 ) ( IN ?auto_54983 ?auto_54985 ) ( TRUCK-AT ?auto_54985 ?auto_54988 ) ( not ( = ?auto_54988 ?auto_54986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54985 ?auto_54988 ?auto_54986 )
      ( MAKE-ON ?auto_54983 ?auto_54984 )
      ( MAKE-ON-VERIFY ?auto_54983 ?auto_54984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54989 - SURFACE
      ?auto_54990 - SURFACE
    )
    :vars
    (
      ?auto_54994 - HOIST
      ?auto_54991 - PLACE
      ?auto_54993 - TRUCK
      ?auto_54992 - PLACE
      ?auto_54995 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54994 ?auto_54991 ) ( SURFACE-AT ?auto_54990 ?auto_54991 ) ( CLEAR ?auto_54990 ) ( IS-CRATE ?auto_54989 ) ( not ( = ?auto_54989 ?auto_54990 ) ) ( AVAILABLE ?auto_54994 ) ( TRUCK-AT ?auto_54993 ?auto_54992 ) ( not ( = ?auto_54992 ?auto_54991 ) ) ( HOIST-AT ?auto_54995 ?auto_54992 ) ( LIFTING ?auto_54995 ?auto_54989 ) ( not ( = ?auto_54994 ?auto_54995 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54995 ?auto_54989 ?auto_54993 ?auto_54992 )
      ( MAKE-ON ?auto_54989 ?auto_54990 )
      ( MAKE-ON-VERIFY ?auto_54989 ?auto_54990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54996 - SURFACE
      ?auto_54997 - SURFACE
    )
    :vars
    (
      ?auto_55002 - HOIST
      ?auto_55001 - PLACE
      ?auto_54999 - TRUCK
      ?auto_55000 - PLACE
      ?auto_54998 - HOIST
      ?auto_55003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55002 ?auto_55001 ) ( SURFACE-AT ?auto_54997 ?auto_55001 ) ( CLEAR ?auto_54997 ) ( IS-CRATE ?auto_54996 ) ( not ( = ?auto_54996 ?auto_54997 ) ) ( AVAILABLE ?auto_55002 ) ( TRUCK-AT ?auto_54999 ?auto_55000 ) ( not ( = ?auto_55000 ?auto_55001 ) ) ( HOIST-AT ?auto_54998 ?auto_55000 ) ( not ( = ?auto_55002 ?auto_54998 ) ) ( AVAILABLE ?auto_54998 ) ( SURFACE-AT ?auto_54996 ?auto_55000 ) ( ON ?auto_54996 ?auto_55003 ) ( CLEAR ?auto_54996 ) ( not ( = ?auto_54996 ?auto_55003 ) ) ( not ( = ?auto_54997 ?auto_55003 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54998 ?auto_54996 ?auto_55003 ?auto_55000 )
      ( MAKE-ON ?auto_54996 ?auto_54997 )
      ( MAKE-ON-VERIFY ?auto_54996 ?auto_54997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55004 - SURFACE
      ?auto_55005 - SURFACE
    )
    :vars
    (
      ?auto_55011 - HOIST
      ?auto_55009 - PLACE
      ?auto_55008 - PLACE
      ?auto_55006 - HOIST
      ?auto_55007 - SURFACE
      ?auto_55010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55011 ?auto_55009 ) ( SURFACE-AT ?auto_55005 ?auto_55009 ) ( CLEAR ?auto_55005 ) ( IS-CRATE ?auto_55004 ) ( not ( = ?auto_55004 ?auto_55005 ) ) ( AVAILABLE ?auto_55011 ) ( not ( = ?auto_55008 ?auto_55009 ) ) ( HOIST-AT ?auto_55006 ?auto_55008 ) ( not ( = ?auto_55011 ?auto_55006 ) ) ( AVAILABLE ?auto_55006 ) ( SURFACE-AT ?auto_55004 ?auto_55008 ) ( ON ?auto_55004 ?auto_55007 ) ( CLEAR ?auto_55004 ) ( not ( = ?auto_55004 ?auto_55007 ) ) ( not ( = ?auto_55005 ?auto_55007 ) ) ( TRUCK-AT ?auto_55010 ?auto_55009 ) )
    :subtasks
    ( ( !DRIVE ?auto_55010 ?auto_55009 ?auto_55008 )
      ( MAKE-ON ?auto_55004 ?auto_55005 )
      ( MAKE-ON-VERIFY ?auto_55004 ?auto_55005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55012 - SURFACE
      ?auto_55013 - SURFACE
    )
    :vars
    (
      ?auto_55019 - HOIST
      ?auto_55014 - PLACE
      ?auto_55015 - PLACE
      ?auto_55017 - HOIST
      ?auto_55018 - SURFACE
      ?auto_55016 - TRUCK
      ?auto_55020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55019 ?auto_55014 ) ( IS-CRATE ?auto_55012 ) ( not ( = ?auto_55012 ?auto_55013 ) ) ( not ( = ?auto_55015 ?auto_55014 ) ) ( HOIST-AT ?auto_55017 ?auto_55015 ) ( not ( = ?auto_55019 ?auto_55017 ) ) ( AVAILABLE ?auto_55017 ) ( SURFACE-AT ?auto_55012 ?auto_55015 ) ( ON ?auto_55012 ?auto_55018 ) ( CLEAR ?auto_55012 ) ( not ( = ?auto_55012 ?auto_55018 ) ) ( not ( = ?auto_55013 ?auto_55018 ) ) ( TRUCK-AT ?auto_55016 ?auto_55014 ) ( SURFACE-AT ?auto_55020 ?auto_55014 ) ( CLEAR ?auto_55020 ) ( LIFTING ?auto_55019 ?auto_55013 ) ( IS-CRATE ?auto_55013 ) ( not ( = ?auto_55012 ?auto_55020 ) ) ( not ( = ?auto_55013 ?auto_55020 ) ) ( not ( = ?auto_55018 ?auto_55020 ) ) )
    :subtasks
    ( ( !DROP ?auto_55019 ?auto_55013 ?auto_55020 ?auto_55014 )
      ( MAKE-ON ?auto_55012 ?auto_55013 )
      ( MAKE-ON-VERIFY ?auto_55012 ?auto_55013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55021 - SURFACE
      ?auto_55022 - SURFACE
    )
    :vars
    (
      ?auto_55026 - HOIST
      ?auto_55029 - PLACE
      ?auto_55024 - PLACE
      ?auto_55027 - HOIST
      ?auto_55028 - SURFACE
      ?auto_55025 - TRUCK
      ?auto_55023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55026 ?auto_55029 ) ( IS-CRATE ?auto_55021 ) ( not ( = ?auto_55021 ?auto_55022 ) ) ( not ( = ?auto_55024 ?auto_55029 ) ) ( HOIST-AT ?auto_55027 ?auto_55024 ) ( not ( = ?auto_55026 ?auto_55027 ) ) ( AVAILABLE ?auto_55027 ) ( SURFACE-AT ?auto_55021 ?auto_55024 ) ( ON ?auto_55021 ?auto_55028 ) ( CLEAR ?auto_55021 ) ( not ( = ?auto_55021 ?auto_55028 ) ) ( not ( = ?auto_55022 ?auto_55028 ) ) ( TRUCK-AT ?auto_55025 ?auto_55029 ) ( SURFACE-AT ?auto_55023 ?auto_55029 ) ( CLEAR ?auto_55023 ) ( IS-CRATE ?auto_55022 ) ( not ( = ?auto_55021 ?auto_55023 ) ) ( not ( = ?auto_55022 ?auto_55023 ) ) ( not ( = ?auto_55028 ?auto_55023 ) ) ( AVAILABLE ?auto_55026 ) ( IN ?auto_55022 ?auto_55025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55026 ?auto_55022 ?auto_55025 ?auto_55029 )
      ( MAKE-ON ?auto_55021 ?auto_55022 )
      ( MAKE-ON-VERIFY ?auto_55021 ?auto_55022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55030 - SURFACE
      ?auto_55031 - SURFACE
    )
    :vars
    (
      ?auto_55032 - HOIST
      ?auto_55033 - PLACE
      ?auto_55035 - PLACE
      ?auto_55034 - HOIST
      ?auto_55036 - SURFACE
      ?auto_55038 - SURFACE
      ?auto_55037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55032 ?auto_55033 ) ( IS-CRATE ?auto_55030 ) ( not ( = ?auto_55030 ?auto_55031 ) ) ( not ( = ?auto_55035 ?auto_55033 ) ) ( HOIST-AT ?auto_55034 ?auto_55035 ) ( not ( = ?auto_55032 ?auto_55034 ) ) ( AVAILABLE ?auto_55034 ) ( SURFACE-AT ?auto_55030 ?auto_55035 ) ( ON ?auto_55030 ?auto_55036 ) ( CLEAR ?auto_55030 ) ( not ( = ?auto_55030 ?auto_55036 ) ) ( not ( = ?auto_55031 ?auto_55036 ) ) ( SURFACE-AT ?auto_55038 ?auto_55033 ) ( CLEAR ?auto_55038 ) ( IS-CRATE ?auto_55031 ) ( not ( = ?auto_55030 ?auto_55038 ) ) ( not ( = ?auto_55031 ?auto_55038 ) ) ( not ( = ?auto_55036 ?auto_55038 ) ) ( AVAILABLE ?auto_55032 ) ( IN ?auto_55031 ?auto_55037 ) ( TRUCK-AT ?auto_55037 ?auto_55035 ) )
    :subtasks
    ( ( !DRIVE ?auto_55037 ?auto_55035 ?auto_55033 )
      ( MAKE-ON ?auto_55030 ?auto_55031 )
      ( MAKE-ON-VERIFY ?auto_55030 ?auto_55031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55039 - SURFACE
      ?auto_55040 - SURFACE
    )
    :vars
    (
      ?auto_55046 - HOIST
      ?auto_55047 - PLACE
      ?auto_55041 - PLACE
      ?auto_55045 - HOIST
      ?auto_55042 - SURFACE
      ?auto_55043 - SURFACE
      ?auto_55044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55046 ?auto_55047 ) ( IS-CRATE ?auto_55039 ) ( not ( = ?auto_55039 ?auto_55040 ) ) ( not ( = ?auto_55041 ?auto_55047 ) ) ( HOIST-AT ?auto_55045 ?auto_55041 ) ( not ( = ?auto_55046 ?auto_55045 ) ) ( SURFACE-AT ?auto_55039 ?auto_55041 ) ( ON ?auto_55039 ?auto_55042 ) ( CLEAR ?auto_55039 ) ( not ( = ?auto_55039 ?auto_55042 ) ) ( not ( = ?auto_55040 ?auto_55042 ) ) ( SURFACE-AT ?auto_55043 ?auto_55047 ) ( CLEAR ?auto_55043 ) ( IS-CRATE ?auto_55040 ) ( not ( = ?auto_55039 ?auto_55043 ) ) ( not ( = ?auto_55040 ?auto_55043 ) ) ( not ( = ?auto_55042 ?auto_55043 ) ) ( AVAILABLE ?auto_55046 ) ( TRUCK-AT ?auto_55044 ?auto_55041 ) ( LIFTING ?auto_55045 ?auto_55040 ) )
    :subtasks
    ( ( !LOAD ?auto_55045 ?auto_55040 ?auto_55044 ?auto_55041 )
      ( MAKE-ON ?auto_55039 ?auto_55040 )
      ( MAKE-ON-VERIFY ?auto_55039 ?auto_55040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55048 - SURFACE
      ?auto_55049 - SURFACE
    )
    :vars
    (
      ?auto_55055 - HOIST
      ?auto_55056 - PLACE
      ?auto_55052 - PLACE
      ?auto_55053 - HOIST
      ?auto_55054 - SURFACE
      ?auto_55050 - SURFACE
      ?auto_55051 - TRUCK
      ?auto_55057 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55055 ?auto_55056 ) ( IS-CRATE ?auto_55048 ) ( not ( = ?auto_55048 ?auto_55049 ) ) ( not ( = ?auto_55052 ?auto_55056 ) ) ( HOIST-AT ?auto_55053 ?auto_55052 ) ( not ( = ?auto_55055 ?auto_55053 ) ) ( SURFACE-AT ?auto_55048 ?auto_55052 ) ( ON ?auto_55048 ?auto_55054 ) ( CLEAR ?auto_55048 ) ( not ( = ?auto_55048 ?auto_55054 ) ) ( not ( = ?auto_55049 ?auto_55054 ) ) ( SURFACE-AT ?auto_55050 ?auto_55056 ) ( CLEAR ?auto_55050 ) ( IS-CRATE ?auto_55049 ) ( not ( = ?auto_55048 ?auto_55050 ) ) ( not ( = ?auto_55049 ?auto_55050 ) ) ( not ( = ?auto_55054 ?auto_55050 ) ) ( AVAILABLE ?auto_55055 ) ( TRUCK-AT ?auto_55051 ?auto_55052 ) ( AVAILABLE ?auto_55053 ) ( SURFACE-AT ?auto_55049 ?auto_55052 ) ( ON ?auto_55049 ?auto_55057 ) ( CLEAR ?auto_55049 ) ( not ( = ?auto_55048 ?auto_55057 ) ) ( not ( = ?auto_55049 ?auto_55057 ) ) ( not ( = ?auto_55054 ?auto_55057 ) ) ( not ( = ?auto_55050 ?auto_55057 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55053 ?auto_55049 ?auto_55057 ?auto_55052 )
      ( MAKE-ON ?auto_55048 ?auto_55049 )
      ( MAKE-ON-VERIFY ?auto_55048 ?auto_55049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55058 - SURFACE
      ?auto_55059 - SURFACE
    )
    :vars
    (
      ?auto_55066 - HOIST
      ?auto_55061 - PLACE
      ?auto_55063 - PLACE
      ?auto_55062 - HOIST
      ?auto_55064 - SURFACE
      ?auto_55067 - SURFACE
      ?auto_55060 - SURFACE
      ?auto_55065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55066 ?auto_55061 ) ( IS-CRATE ?auto_55058 ) ( not ( = ?auto_55058 ?auto_55059 ) ) ( not ( = ?auto_55063 ?auto_55061 ) ) ( HOIST-AT ?auto_55062 ?auto_55063 ) ( not ( = ?auto_55066 ?auto_55062 ) ) ( SURFACE-AT ?auto_55058 ?auto_55063 ) ( ON ?auto_55058 ?auto_55064 ) ( CLEAR ?auto_55058 ) ( not ( = ?auto_55058 ?auto_55064 ) ) ( not ( = ?auto_55059 ?auto_55064 ) ) ( SURFACE-AT ?auto_55067 ?auto_55061 ) ( CLEAR ?auto_55067 ) ( IS-CRATE ?auto_55059 ) ( not ( = ?auto_55058 ?auto_55067 ) ) ( not ( = ?auto_55059 ?auto_55067 ) ) ( not ( = ?auto_55064 ?auto_55067 ) ) ( AVAILABLE ?auto_55066 ) ( AVAILABLE ?auto_55062 ) ( SURFACE-AT ?auto_55059 ?auto_55063 ) ( ON ?auto_55059 ?auto_55060 ) ( CLEAR ?auto_55059 ) ( not ( = ?auto_55058 ?auto_55060 ) ) ( not ( = ?auto_55059 ?auto_55060 ) ) ( not ( = ?auto_55064 ?auto_55060 ) ) ( not ( = ?auto_55067 ?auto_55060 ) ) ( TRUCK-AT ?auto_55065 ?auto_55061 ) )
    :subtasks
    ( ( !DRIVE ?auto_55065 ?auto_55061 ?auto_55063 )
      ( MAKE-ON ?auto_55058 ?auto_55059 )
      ( MAKE-ON-VERIFY ?auto_55058 ?auto_55059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55070 - SURFACE
      ?auto_55071 - SURFACE
    )
    :vars
    (
      ?auto_55072 - HOIST
      ?auto_55073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55072 ?auto_55073 ) ( SURFACE-AT ?auto_55071 ?auto_55073 ) ( CLEAR ?auto_55071 ) ( LIFTING ?auto_55072 ?auto_55070 ) ( IS-CRATE ?auto_55070 ) ( not ( = ?auto_55070 ?auto_55071 ) ) )
    :subtasks
    ( ( !DROP ?auto_55072 ?auto_55070 ?auto_55071 ?auto_55073 )
      ( MAKE-ON-VERIFY ?auto_55070 ?auto_55071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55074 - SURFACE
      ?auto_55075 - SURFACE
    )
    :vars
    (
      ?auto_55076 - HOIST
      ?auto_55077 - PLACE
      ?auto_55078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55076 ?auto_55077 ) ( SURFACE-AT ?auto_55075 ?auto_55077 ) ( CLEAR ?auto_55075 ) ( IS-CRATE ?auto_55074 ) ( not ( = ?auto_55074 ?auto_55075 ) ) ( TRUCK-AT ?auto_55078 ?auto_55077 ) ( AVAILABLE ?auto_55076 ) ( IN ?auto_55074 ?auto_55078 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55076 ?auto_55074 ?auto_55078 ?auto_55077 )
      ( MAKE-ON ?auto_55074 ?auto_55075 )
      ( MAKE-ON-VERIFY ?auto_55074 ?auto_55075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55079 - SURFACE
      ?auto_55080 - SURFACE
    )
    :vars
    (
      ?auto_55083 - HOIST
      ?auto_55082 - PLACE
      ?auto_55081 - TRUCK
      ?auto_55084 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55083 ?auto_55082 ) ( SURFACE-AT ?auto_55080 ?auto_55082 ) ( CLEAR ?auto_55080 ) ( IS-CRATE ?auto_55079 ) ( not ( = ?auto_55079 ?auto_55080 ) ) ( AVAILABLE ?auto_55083 ) ( IN ?auto_55079 ?auto_55081 ) ( TRUCK-AT ?auto_55081 ?auto_55084 ) ( not ( = ?auto_55084 ?auto_55082 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55081 ?auto_55084 ?auto_55082 )
      ( MAKE-ON ?auto_55079 ?auto_55080 )
      ( MAKE-ON-VERIFY ?auto_55079 ?auto_55080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55085 - SURFACE
      ?auto_55086 - SURFACE
    )
    :vars
    (
      ?auto_55088 - HOIST
      ?auto_55089 - PLACE
      ?auto_55087 - TRUCK
      ?auto_55090 - PLACE
      ?auto_55091 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55088 ?auto_55089 ) ( SURFACE-AT ?auto_55086 ?auto_55089 ) ( CLEAR ?auto_55086 ) ( IS-CRATE ?auto_55085 ) ( not ( = ?auto_55085 ?auto_55086 ) ) ( AVAILABLE ?auto_55088 ) ( TRUCK-AT ?auto_55087 ?auto_55090 ) ( not ( = ?auto_55090 ?auto_55089 ) ) ( HOIST-AT ?auto_55091 ?auto_55090 ) ( LIFTING ?auto_55091 ?auto_55085 ) ( not ( = ?auto_55088 ?auto_55091 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55091 ?auto_55085 ?auto_55087 ?auto_55090 )
      ( MAKE-ON ?auto_55085 ?auto_55086 )
      ( MAKE-ON-VERIFY ?auto_55085 ?auto_55086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55092 - SURFACE
      ?auto_55093 - SURFACE
    )
    :vars
    (
      ?auto_55094 - HOIST
      ?auto_55096 - PLACE
      ?auto_55097 - TRUCK
      ?auto_55095 - PLACE
      ?auto_55098 - HOIST
      ?auto_55099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55094 ?auto_55096 ) ( SURFACE-AT ?auto_55093 ?auto_55096 ) ( CLEAR ?auto_55093 ) ( IS-CRATE ?auto_55092 ) ( not ( = ?auto_55092 ?auto_55093 ) ) ( AVAILABLE ?auto_55094 ) ( TRUCK-AT ?auto_55097 ?auto_55095 ) ( not ( = ?auto_55095 ?auto_55096 ) ) ( HOIST-AT ?auto_55098 ?auto_55095 ) ( not ( = ?auto_55094 ?auto_55098 ) ) ( AVAILABLE ?auto_55098 ) ( SURFACE-AT ?auto_55092 ?auto_55095 ) ( ON ?auto_55092 ?auto_55099 ) ( CLEAR ?auto_55092 ) ( not ( = ?auto_55092 ?auto_55099 ) ) ( not ( = ?auto_55093 ?auto_55099 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55098 ?auto_55092 ?auto_55099 ?auto_55095 )
      ( MAKE-ON ?auto_55092 ?auto_55093 )
      ( MAKE-ON-VERIFY ?auto_55092 ?auto_55093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55100 - SURFACE
      ?auto_55101 - SURFACE
    )
    :vars
    (
      ?auto_55103 - HOIST
      ?auto_55104 - PLACE
      ?auto_55107 - PLACE
      ?auto_55102 - HOIST
      ?auto_55106 - SURFACE
      ?auto_55105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55103 ?auto_55104 ) ( SURFACE-AT ?auto_55101 ?auto_55104 ) ( CLEAR ?auto_55101 ) ( IS-CRATE ?auto_55100 ) ( not ( = ?auto_55100 ?auto_55101 ) ) ( AVAILABLE ?auto_55103 ) ( not ( = ?auto_55107 ?auto_55104 ) ) ( HOIST-AT ?auto_55102 ?auto_55107 ) ( not ( = ?auto_55103 ?auto_55102 ) ) ( AVAILABLE ?auto_55102 ) ( SURFACE-AT ?auto_55100 ?auto_55107 ) ( ON ?auto_55100 ?auto_55106 ) ( CLEAR ?auto_55100 ) ( not ( = ?auto_55100 ?auto_55106 ) ) ( not ( = ?auto_55101 ?auto_55106 ) ) ( TRUCK-AT ?auto_55105 ?auto_55104 ) )
    :subtasks
    ( ( !DRIVE ?auto_55105 ?auto_55104 ?auto_55107 )
      ( MAKE-ON ?auto_55100 ?auto_55101 )
      ( MAKE-ON-VERIFY ?auto_55100 ?auto_55101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55108 - SURFACE
      ?auto_55109 - SURFACE
    )
    :vars
    (
      ?auto_55112 - HOIST
      ?auto_55114 - PLACE
      ?auto_55115 - PLACE
      ?auto_55111 - HOIST
      ?auto_55110 - SURFACE
      ?auto_55113 - TRUCK
      ?auto_55116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55112 ?auto_55114 ) ( IS-CRATE ?auto_55108 ) ( not ( = ?auto_55108 ?auto_55109 ) ) ( not ( = ?auto_55115 ?auto_55114 ) ) ( HOIST-AT ?auto_55111 ?auto_55115 ) ( not ( = ?auto_55112 ?auto_55111 ) ) ( AVAILABLE ?auto_55111 ) ( SURFACE-AT ?auto_55108 ?auto_55115 ) ( ON ?auto_55108 ?auto_55110 ) ( CLEAR ?auto_55108 ) ( not ( = ?auto_55108 ?auto_55110 ) ) ( not ( = ?auto_55109 ?auto_55110 ) ) ( TRUCK-AT ?auto_55113 ?auto_55114 ) ( SURFACE-AT ?auto_55116 ?auto_55114 ) ( CLEAR ?auto_55116 ) ( LIFTING ?auto_55112 ?auto_55109 ) ( IS-CRATE ?auto_55109 ) ( not ( = ?auto_55108 ?auto_55116 ) ) ( not ( = ?auto_55109 ?auto_55116 ) ) ( not ( = ?auto_55110 ?auto_55116 ) ) )
    :subtasks
    ( ( !DROP ?auto_55112 ?auto_55109 ?auto_55116 ?auto_55114 )
      ( MAKE-ON ?auto_55108 ?auto_55109 )
      ( MAKE-ON-VERIFY ?auto_55108 ?auto_55109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55117 - SURFACE
      ?auto_55118 - SURFACE
    )
    :vars
    (
      ?auto_55122 - HOIST
      ?auto_55124 - PLACE
      ?auto_55119 - PLACE
      ?auto_55123 - HOIST
      ?auto_55125 - SURFACE
      ?auto_55120 - TRUCK
      ?auto_55121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55122 ?auto_55124 ) ( IS-CRATE ?auto_55117 ) ( not ( = ?auto_55117 ?auto_55118 ) ) ( not ( = ?auto_55119 ?auto_55124 ) ) ( HOIST-AT ?auto_55123 ?auto_55119 ) ( not ( = ?auto_55122 ?auto_55123 ) ) ( AVAILABLE ?auto_55123 ) ( SURFACE-AT ?auto_55117 ?auto_55119 ) ( ON ?auto_55117 ?auto_55125 ) ( CLEAR ?auto_55117 ) ( not ( = ?auto_55117 ?auto_55125 ) ) ( not ( = ?auto_55118 ?auto_55125 ) ) ( TRUCK-AT ?auto_55120 ?auto_55124 ) ( SURFACE-AT ?auto_55121 ?auto_55124 ) ( CLEAR ?auto_55121 ) ( IS-CRATE ?auto_55118 ) ( not ( = ?auto_55117 ?auto_55121 ) ) ( not ( = ?auto_55118 ?auto_55121 ) ) ( not ( = ?auto_55125 ?auto_55121 ) ) ( AVAILABLE ?auto_55122 ) ( IN ?auto_55118 ?auto_55120 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55122 ?auto_55118 ?auto_55120 ?auto_55124 )
      ( MAKE-ON ?auto_55117 ?auto_55118 )
      ( MAKE-ON-VERIFY ?auto_55117 ?auto_55118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55126 - SURFACE
      ?auto_55127 - SURFACE
    )
    :vars
    (
      ?auto_55131 - HOIST
      ?auto_55133 - PLACE
      ?auto_55132 - PLACE
      ?auto_55134 - HOIST
      ?auto_55129 - SURFACE
      ?auto_55128 - SURFACE
      ?auto_55130 - TRUCK
      ?auto_55135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55131 ?auto_55133 ) ( IS-CRATE ?auto_55126 ) ( not ( = ?auto_55126 ?auto_55127 ) ) ( not ( = ?auto_55132 ?auto_55133 ) ) ( HOIST-AT ?auto_55134 ?auto_55132 ) ( not ( = ?auto_55131 ?auto_55134 ) ) ( AVAILABLE ?auto_55134 ) ( SURFACE-AT ?auto_55126 ?auto_55132 ) ( ON ?auto_55126 ?auto_55129 ) ( CLEAR ?auto_55126 ) ( not ( = ?auto_55126 ?auto_55129 ) ) ( not ( = ?auto_55127 ?auto_55129 ) ) ( SURFACE-AT ?auto_55128 ?auto_55133 ) ( CLEAR ?auto_55128 ) ( IS-CRATE ?auto_55127 ) ( not ( = ?auto_55126 ?auto_55128 ) ) ( not ( = ?auto_55127 ?auto_55128 ) ) ( not ( = ?auto_55129 ?auto_55128 ) ) ( AVAILABLE ?auto_55131 ) ( IN ?auto_55127 ?auto_55130 ) ( TRUCK-AT ?auto_55130 ?auto_55135 ) ( not ( = ?auto_55135 ?auto_55133 ) ) ( not ( = ?auto_55132 ?auto_55135 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55130 ?auto_55135 ?auto_55133 )
      ( MAKE-ON ?auto_55126 ?auto_55127 )
      ( MAKE-ON-VERIFY ?auto_55126 ?auto_55127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55136 - SURFACE
      ?auto_55137 - SURFACE
    )
    :vars
    (
      ?auto_55141 - HOIST
      ?auto_55145 - PLACE
      ?auto_55139 - PLACE
      ?auto_55140 - HOIST
      ?auto_55142 - SURFACE
      ?auto_55144 - SURFACE
      ?auto_55143 - TRUCK
      ?auto_55138 - PLACE
      ?auto_55146 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55141 ?auto_55145 ) ( IS-CRATE ?auto_55136 ) ( not ( = ?auto_55136 ?auto_55137 ) ) ( not ( = ?auto_55139 ?auto_55145 ) ) ( HOIST-AT ?auto_55140 ?auto_55139 ) ( not ( = ?auto_55141 ?auto_55140 ) ) ( AVAILABLE ?auto_55140 ) ( SURFACE-AT ?auto_55136 ?auto_55139 ) ( ON ?auto_55136 ?auto_55142 ) ( CLEAR ?auto_55136 ) ( not ( = ?auto_55136 ?auto_55142 ) ) ( not ( = ?auto_55137 ?auto_55142 ) ) ( SURFACE-AT ?auto_55144 ?auto_55145 ) ( CLEAR ?auto_55144 ) ( IS-CRATE ?auto_55137 ) ( not ( = ?auto_55136 ?auto_55144 ) ) ( not ( = ?auto_55137 ?auto_55144 ) ) ( not ( = ?auto_55142 ?auto_55144 ) ) ( AVAILABLE ?auto_55141 ) ( TRUCK-AT ?auto_55143 ?auto_55138 ) ( not ( = ?auto_55138 ?auto_55145 ) ) ( not ( = ?auto_55139 ?auto_55138 ) ) ( HOIST-AT ?auto_55146 ?auto_55138 ) ( LIFTING ?auto_55146 ?auto_55137 ) ( not ( = ?auto_55141 ?auto_55146 ) ) ( not ( = ?auto_55140 ?auto_55146 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55146 ?auto_55137 ?auto_55143 ?auto_55138 )
      ( MAKE-ON ?auto_55136 ?auto_55137 )
      ( MAKE-ON-VERIFY ?auto_55136 ?auto_55137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55147 - SURFACE
      ?auto_55148 - SURFACE
    )
    :vars
    (
      ?auto_55151 - HOIST
      ?auto_55155 - PLACE
      ?auto_55152 - PLACE
      ?auto_55154 - HOIST
      ?auto_55156 - SURFACE
      ?auto_55150 - SURFACE
      ?auto_55153 - TRUCK
      ?auto_55149 - PLACE
      ?auto_55157 - HOIST
      ?auto_55158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55151 ?auto_55155 ) ( IS-CRATE ?auto_55147 ) ( not ( = ?auto_55147 ?auto_55148 ) ) ( not ( = ?auto_55152 ?auto_55155 ) ) ( HOIST-AT ?auto_55154 ?auto_55152 ) ( not ( = ?auto_55151 ?auto_55154 ) ) ( AVAILABLE ?auto_55154 ) ( SURFACE-AT ?auto_55147 ?auto_55152 ) ( ON ?auto_55147 ?auto_55156 ) ( CLEAR ?auto_55147 ) ( not ( = ?auto_55147 ?auto_55156 ) ) ( not ( = ?auto_55148 ?auto_55156 ) ) ( SURFACE-AT ?auto_55150 ?auto_55155 ) ( CLEAR ?auto_55150 ) ( IS-CRATE ?auto_55148 ) ( not ( = ?auto_55147 ?auto_55150 ) ) ( not ( = ?auto_55148 ?auto_55150 ) ) ( not ( = ?auto_55156 ?auto_55150 ) ) ( AVAILABLE ?auto_55151 ) ( TRUCK-AT ?auto_55153 ?auto_55149 ) ( not ( = ?auto_55149 ?auto_55155 ) ) ( not ( = ?auto_55152 ?auto_55149 ) ) ( HOIST-AT ?auto_55157 ?auto_55149 ) ( not ( = ?auto_55151 ?auto_55157 ) ) ( not ( = ?auto_55154 ?auto_55157 ) ) ( AVAILABLE ?auto_55157 ) ( SURFACE-AT ?auto_55148 ?auto_55149 ) ( ON ?auto_55148 ?auto_55158 ) ( CLEAR ?auto_55148 ) ( not ( = ?auto_55147 ?auto_55158 ) ) ( not ( = ?auto_55148 ?auto_55158 ) ) ( not ( = ?auto_55156 ?auto_55158 ) ) ( not ( = ?auto_55150 ?auto_55158 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55157 ?auto_55148 ?auto_55158 ?auto_55149 )
      ( MAKE-ON ?auto_55147 ?auto_55148 )
      ( MAKE-ON-VERIFY ?auto_55147 ?auto_55148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55159 - SURFACE
      ?auto_55160 - SURFACE
    )
    :vars
    (
      ?auto_55162 - HOIST
      ?auto_55170 - PLACE
      ?auto_55168 - PLACE
      ?auto_55163 - HOIST
      ?auto_55164 - SURFACE
      ?auto_55161 - SURFACE
      ?auto_55165 - PLACE
      ?auto_55167 - HOIST
      ?auto_55169 - SURFACE
      ?auto_55166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55162 ?auto_55170 ) ( IS-CRATE ?auto_55159 ) ( not ( = ?auto_55159 ?auto_55160 ) ) ( not ( = ?auto_55168 ?auto_55170 ) ) ( HOIST-AT ?auto_55163 ?auto_55168 ) ( not ( = ?auto_55162 ?auto_55163 ) ) ( AVAILABLE ?auto_55163 ) ( SURFACE-AT ?auto_55159 ?auto_55168 ) ( ON ?auto_55159 ?auto_55164 ) ( CLEAR ?auto_55159 ) ( not ( = ?auto_55159 ?auto_55164 ) ) ( not ( = ?auto_55160 ?auto_55164 ) ) ( SURFACE-AT ?auto_55161 ?auto_55170 ) ( CLEAR ?auto_55161 ) ( IS-CRATE ?auto_55160 ) ( not ( = ?auto_55159 ?auto_55161 ) ) ( not ( = ?auto_55160 ?auto_55161 ) ) ( not ( = ?auto_55164 ?auto_55161 ) ) ( AVAILABLE ?auto_55162 ) ( not ( = ?auto_55165 ?auto_55170 ) ) ( not ( = ?auto_55168 ?auto_55165 ) ) ( HOIST-AT ?auto_55167 ?auto_55165 ) ( not ( = ?auto_55162 ?auto_55167 ) ) ( not ( = ?auto_55163 ?auto_55167 ) ) ( AVAILABLE ?auto_55167 ) ( SURFACE-AT ?auto_55160 ?auto_55165 ) ( ON ?auto_55160 ?auto_55169 ) ( CLEAR ?auto_55160 ) ( not ( = ?auto_55159 ?auto_55169 ) ) ( not ( = ?auto_55160 ?auto_55169 ) ) ( not ( = ?auto_55164 ?auto_55169 ) ) ( not ( = ?auto_55161 ?auto_55169 ) ) ( TRUCK-AT ?auto_55166 ?auto_55170 ) )
    :subtasks
    ( ( !DRIVE ?auto_55166 ?auto_55170 ?auto_55165 )
      ( MAKE-ON ?auto_55159 ?auto_55160 )
      ( MAKE-ON-VERIFY ?auto_55159 ?auto_55160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55171 - SURFACE
      ?auto_55172 - SURFACE
    )
    :vars
    (
      ?auto_55178 - HOIST
      ?auto_55180 - PLACE
      ?auto_55175 - PLACE
      ?auto_55176 - HOIST
      ?auto_55182 - SURFACE
      ?auto_55177 - SURFACE
      ?auto_55181 - PLACE
      ?auto_55179 - HOIST
      ?auto_55173 - SURFACE
      ?auto_55174 - TRUCK
      ?auto_55183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55178 ?auto_55180 ) ( IS-CRATE ?auto_55171 ) ( not ( = ?auto_55171 ?auto_55172 ) ) ( not ( = ?auto_55175 ?auto_55180 ) ) ( HOIST-AT ?auto_55176 ?auto_55175 ) ( not ( = ?auto_55178 ?auto_55176 ) ) ( AVAILABLE ?auto_55176 ) ( SURFACE-AT ?auto_55171 ?auto_55175 ) ( ON ?auto_55171 ?auto_55182 ) ( CLEAR ?auto_55171 ) ( not ( = ?auto_55171 ?auto_55182 ) ) ( not ( = ?auto_55172 ?auto_55182 ) ) ( IS-CRATE ?auto_55172 ) ( not ( = ?auto_55171 ?auto_55177 ) ) ( not ( = ?auto_55172 ?auto_55177 ) ) ( not ( = ?auto_55182 ?auto_55177 ) ) ( not ( = ?auto_55181 ?auto_55180 ) ) ( not ( = ?auto_55175 ?auto_55181 ) ) ( HOIST-AT ?auto_55179 ?auto_55181 ) ( not ( = ?auto_55178 ?auto_55179 ) ) ( not ( = ?auto_55176 ?auto_55179 ) ) ( AVAILABLE ?auto_55179 ) ( SURFACE-AT ?auto_55172 ?auto_55181 ) ( ON ?auto_55172 ?auto_55173 ) ( CLEAR ?auto_55172 ) ( not ( = ?auto_55171 ?auto_55173 ) ) ( not ( = ?auto_55172 ?auto_55173 ) ) ( not ( = ?auto_55182 ?auto_55173 ) ) ( not ( = ?auto_55177 ?auto_55173 ) ) ( TRUCK-AT ?auto_55174 ?auto_55180 ) ( SURFACE-AT ?auto_55183 ?auto_55180 ) ( CLEAR ?auto_55183 ) ( LIFTING ?auto_55178 ?auto_55177 ) ( IS-CRATE ?auto_55177 ) ( not ( = ?auto_55171 ?auto_55183 ) ) ( not ( = ?auto_55172 ?auto_55183 ) ) ( not ( = ?auto_55182 ?auto_55183 ) ) ( not ( = ?auto_55177 ?auto_55183 ) ) ( not ( = ?auto_55173 ?auto_55183 ) ) )
    :subtasks
    ( ( !DROP ?auto_55178 ?auto_55177 ?auto_55183 ?auto_55180 )
      ( MAKE-ON ?auto_55171 ?auto_55172 )
      ( MAKE-ON-VERIFY ?auto_55171 ?auto_55172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55184 - SURFACE
      ?auto_55185 - SURFACE
    )
    :vars
    (
      ?auto_55194 - HOIST
      ?auto_55192 - PLACE
      ?auto_55191 - PLACE
      ?auto_55196 - HOIST
      ?auto_55186 - SURFACE
      ?auto_55188 - SURFACE
      ?auto_55190 - PLACE
      ?auto_55189 - HOIST
      ?auto_55187 - SURFACE
      ?auto_55193 - TRUCK
      ?auto_55195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55194 ?auto_55192 ) ( IS-CRATE ?auto_55184 ) ( not ( = ?auto_55184 ?auto_55185 ) ) ( not ( = ?auto_55191 ?auto_55192 ) ) ( HOIST-AT ?auto_55196 ?auto_55191 ) ( not ( = ?auto_55194 ?auto_55196 ) ) ( AVAILABLE ?auto_55196 ) ( SURFACE-AT ?auto_55184 ?auto_55191 ) ( ON ?auto_55184 ?auto_55186 ) ( CLEAR ?auto_55184 ) ( not ( = ?auto_55184 ?auto_55186 ) ) ( not ( = ?auto_55185 ?auto_55186 ) ) ( IS-CRATE ?auto_55185 ) ( not ( = ?auto_55184 ?auto_55188 ) ) ( not ( = ?auto_55185 ?auto_55188 ) ) ( not ( = ?auto_55186 ?auto_55188 ) ) ( not ( = ?auto_55190 ?auto_55192 ) ) ( not ( = ?auto_55191 ?auto_55190 ) ) ( HOIST-AT ?auto_55189 ?auto_55190 ) ( not ( = ?auto_55194 ?auto_55189 ) ) ( not ( = ?auto_55196 ?auto_55189 ) ) ( AVAILABLE ?auto_55189 ) ( SURFACE-AT ?auto_55185 ?auto_55190 ) ( ON ?auto_55185 ?auto_55187 ) ( CLEAR ?auto_55185 ) ( not ( = ?auto_55184 ?auto_55187 ) ) ( not ( = ?auto_55185 ?auto_55187 ) ) ( not ( = ?auto_55186 ?auto_55187 ) ) ( not ( = ?auto_55188 ?auto_55187 ) ) ( TRUCK-AT ?auto_55193 ?auto_55192 ) ( SURFACE-AT ?auto_55195 ?auto_55192 ) ( CLEAR ?auto_55195 ) ( IS-CRATE ?auto_55188 ) ( not ( = ?auto_55184 ?auto_55195 ) ) ( not ( = ?auto_55185 ?auto_55195 ) ) ( not ( = ?auto_55186 ?auto_55195 ) ) ( not ( = ?auto_55188 ?auto_55195 ) ) ( not ( = ?auto_55187 ?auto_55195 ) ) ( AVAILABLE ?auto_55194 ) ( IN ?auto_55188 ?auto_55193 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55194 ?auto_55188 ?auto_55193 ?auto_55192 )
      ( MAKE-ON ?auto_55184 ?auto_55185 )
      ( MAKE-ON-VERIFY ?auto_55184 ?auto_55185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55197 - SURFACE
      ?auto_55198 - SURFACE
    )
    :vars
    (
      ?auto_55203 - HOIST
      ?auto_55209 - PLACE
      ?auto_55199 - PLACE
      ?auto_55204 - HOIST
      ?auto_55200 - SURFACE
      ?auto_55205 - SURFACE
      ?auto_55208 - PLACE
      ?auto_55206 - HOIST
      ?auto_55207 - SURFACE
      ?auto_55202 - SURFACE
      ?auto_55201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55203 ?auto_55209 ) ( IS-CRATE ?auto_55197 ) ( not ( = ?auto_55197 ?auto_55198 ) ) ( not ( = ?auto_55199 ?auto_55209 ) ) ( HOIST-AT ?auto_55204 ?auto_55199 ) ( not ( = ?auto_55203 ?auto_55204 ) ) ( AVAILABLE ?auto_55204 ) ( SURFACE-AT ?auto_55197 ?auto_55199 ) ( ON ?auto_55197 ?auto_55200 ) ( CLEAR ?auto_55197 ) ( not ( = ?auto_55197 ?auto_55200 ) ) ( not ( = ?auto_55198 ?auto_55200 ) ) ( IS-CRATE ?auto_55198 ) ( not ( = ?auto_55197 ?auto_55205 ) ) ( not ( = ?auto_55198 ?auto_55205 ) ) ( not ( = ?auto_55200 ?auto_55205 ) ) ( not ( = ?auto_55208 ?auto_55209 ) ) ( not ( = ?auto_55199 ?auto_55208 ) ) ( HOIST-AT ?auto_55206 ?auto_55208 ) ( not ( = ?auto_55203 ?auto_55206 ) ) ( not ( = ?auto_55204 ?auto_55206 ) ) ( AVAILABLE ?auto_55206 ) ( SURFACE-AT ?auto_55198 ?auto_55208 ) ( ON ?auto_55198 ?auto_55207 ) ( CLEAR ?auto_55198 ) ( not ( = ?auto_55197 ?auto_55207 ) ) ( not ( = ?auto_55198 ?auto_55207 ) ) ( not ( = ?auto_55200 ?auto_55207 ) ) ( not ( = ?auto_55205 ?auto_55207 ) ) ( SURFACE-AT ?auto_55202 ?auto_55209 ) ( CLEAR ?auto_55202 ) ( IS-CRATE ?auto_55205 ) ( not ( = ?auto_55197 ?auto_55202 ) ) ( not ( = ?auto_55198 ?auto_55202 ) ) ( not ( = ?auto_55200 ?auto_55202 ) ) ( not ( = ?auto_55205 ?auto_55202 ) ) ( not ( = ?auto_55207 ?auto_55202 ) ) ( AVAILABLE ?auto_55203 ) ( IN ?auto_55205 ?auto_55201 ) ( TRUCK-AT ?auto_55201 ?auto_55208 ) )
    :subtasks
    ( ( !DRIVE ?auto_55201 ?auto_55208 ?auto_55209 )
      ( MAKE-ON ?auto_55197 ?auto_55198 )
      ( MAKE-ON-VERIFY ?auto_55197 ?auto_55198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55210 - SURFACE
      ?auto_55211 - SURFACE
    )
    :vars
    (
      ?auto_55216 - HOIST
      ?auto_55222 - PLACE
      ?auto_55219 - PLACE
      ?auto_55212 - HOIST
      ?auto_55214 - SURFACE
      ?auto_55213 - SURFACE
      ?auto_55217 - PLACE
      ?auto_55220 - HOIST
      ?auto_55218 - SURFACE
      ?auto_55215 - SURFACE
      ?auto_55221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55216 ?auto_55222 ) ( IS-CRATE ?auto_55210 ) ( not ( = ?auto_55210 ?auto_55211 ) ) ( not ( = ?auto_55219 ?auto_55222 ) ) ( HOIST-AT ?auto_55212 ?auto_55219 ) ( not ( = ?auto_55216 ?auto_55212 ) ) ( AVAILABLE ?auto_55212 ) ( SURFACE-AT ?auto_55210 ?auto_55219 ) ( ON ?auto_55210 ?auto_55214 ) ( CLEAR ?auto_55210 ) ( not ( = ?auto_55210 ?auto_55214 ) ) ( not ( = ?auto_55211 ?auto_55214 ) ) ( IS-CRATE ?auto_55211 ) ( not ( = ?auto_55210 ?auto_55213 ) ) ( not ( = ?auto_55211 ?auto_55213 ) ) ( not ( = ?auto_55214 ?auto_55213 ) ) ( not ( = ?auto_55217 ?auto_55222 ) ) ( not ( = ?auto_55219 ?auto_55217 ) ) ( HOIST-AT ?auto_55220 ?auto_55217 ) ( not ( = ?auto_55216 ?auto_55220 ) ) ( not ( = ?auto_55212 ?auto_55220 ) ) ( SURFACE-AT ?auto_55211 ?auto_55217 ) ( ON ?auto_55211 ?auto_55218 ) ( CLEAR ?auto_55211 ) ( not ( = ?auto_55210 ?auto_55218 ) ) ( not ( = ?auto_55211 ?auto_55218 ) ) ( not ( = ?auto_55214 ?auto_55218 ) ) ( not ( = ?auto_55213 ?auto_55218 ) ) ( SURFACE-AT ?auto_55215 ?auto_55222 ) ( CLEAR ?auto_55215 ) ( IS-CRATE ?auto_55213 ) ( not ( = ?auto_55210 ?auto_55215 ) ) ( not ( = ?auto_55211 ?auto_55215 ) ) ( not ( = ?auto_55214 ?auto_55215 ) ) ( not ( = ?auto_55213 ?auto_55215 ) ) ( not ( = ?auto_55218 ?auto_55215 ) ) ( AVAILABLE ?auto_55216 ) ( TRUCK-AT ?auto_55221 ?auto_55217 ) ( LIFTING ?auto_55220 ?auto_55213 ) )
    :subtasks
    ( ( !LOAD ?auto_55220 ?auto_55213 ?auto_55221 ?auto_55217 )
      ( MAKE-ON ?auto_55210 ?auto_55211 )
      ( MAKE-ON-VERIFY ?auto_55210 ?auto_55211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55223 - SURFACE
      ?auto_55224 - SURFACE
    )
    :vars
    (
      ?auto_55235 - HOIST
      ?auto_55231 - PLACE
      ?auto_55225 - PLACE
      ?auto_55234 - HOIST
      ?auto_55228 - SURFACE
      ?auto_55230 - SURFACE
      ?auto_55229 - PLACE
      ?auto_55233 - HOIST
      ?auto_55226 - SURFACE
      ?auto_55227 - SURFACE
      ?auto_55232 - TRUCK
      ?auto_55236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55235 ?auto_55231 ) ( IS-CRATE ?auto_55223 ) ( not ( = ?auto_55223 ?auto_55224 ) ) ( not ( = ?auto_55225 ?auto_55231 ) ) ( HOIST-AT ?auto_55234 ?auto_55225 ) ( not ( = ?auto_55235 ?auto_55234 ) ) ( AVAILABLE ?auto_55234 ) ( SURFACE-AT ?auto_55223 ?auto_55225 ) ( ON ?auto_55223 ?auto_55228 ) ( CLEAR ?auto_55223 ) ( not ( = ?auto_55223 ?auto_55228 ) ) ( not ( = ?auto_55224 ?auto_55228 ) ) ( IS-CRATE ?auto_55224 ) ( not ( = ?auto_55223 ?auto_55230 ) ) ( not ( = ?auto_55224 ?auto_55230 ) ) ( not ( = ?auto_55228 ?auto_55230 ) ) ( not ( = ?auto_55229 ?auto_55231 ) ) ( not ( = ?auto_55225 ?auto_55229 ) ) ( HOIST-AT ?auto_55233 ?auto_55229 ) ( not ( = ?auto_55235 ?auto_55233 ) ) ( not ( = ?auto_55234 ?auto_55233 ) ) ( SURFACE-AT ?auto_55224 ?auto_55229 ) ( ON ?auto_55224 ?auto_55226 ) ( CLEAR ?auto_55224 ) ( not ( = ?auto_55223 ?auto_55226 ) ) ( not ( = ?auto_55224 ?auto_55226 ) ) ( not ( = ?auto_55228 ?auto_55226 ) ) ( not ( = ?auto_55230 ?auto_55226 ) ) ( SURFACE-AT ?auto_55227 ?auto_55231 ) ( CLEAR ?auto_55227 ) ( IS-CRATE ?auto_55230 ) ( not ( = ?auto_55223 ?auto_55227 ) ) ( not ( = ?auto_55224 ?auto_55227 ) ) ( not ( = ?auto_55228 ?auto_55227 ) ) ( not ( = ?auto_55230 ?auto_55227 ) ) ( not ( = ?auto_55226 ?auto_55227 ) ) ( AVAILABLE ?auto_55235 ) ( TRUCK-AT ?auto_55232 ?auto_55229 ) ( AVAILABLE ?auto_55233 ) ( SURFACE-AT ?auto_55230 ?auto_55229 ) ( ON ?auto_55230 ?auto_55236 ) ( CLEAR ?auto_55230 ) ( not ( = ?auto_55223 ?auto_55236 ) ) ( not ( = ?auto_55224 ?auto_55236 ) ) ( not ( = ?auto_55228 ?auto_55236 ) ) ( not ( = ?auto_55230 ?auto_55236 ) ) ( not ( = ?auto_55226 ?auto_55236 ) ) ( not ( = ?auto_55227 ?auto_55236 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55233 ?auto_55230 ?auto_55236 ?auto_55229 )
      ( MAKE-ON ?auto_55223 ?auto_55224 )
      ( MAKE-ON-VERIFY ?auto_55223 ?auto_55224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55237 - SURFACE
      ?auto_55238 - SURFACE
    )
    :vars
    (
      ?auto_55246 - HOIST
      ?auto_55250 - PLACE
      ?auto_55242 - PLACE
      ?auto_55244 - HOIST
      ?auto_55247 - SURFACE
      ?auto_55240 - SURFACE
      ?auto_55243 - PLACE
      ?auto_55245 - HOIST
      ?auto_55249 - SURFACE
      ?auto_55241 - SURFACE
      ?auto_55239 - SURFACE
      ?auto_55248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55246 ?auto_55250 ) ( IS-CRATE ?auto_55237 ) ( not ( = ?auto_55237 ?auto_55238 ) ) ( not ( = ?auto_55242 ?auto_55250 ) ) ( HOIST-AT ?auto_55244 ?auto_55242 ) ( not ( = ?auto_55246 ?auto_55244 ) ) ( AVAILABLE ?auto_55244 ) ( SURFACE-AT ?auto_55237 ?auto_55242 ) ( ON ?auto_55237 ?auto_55247 ) ( CLEAR ?auto_55237 ) ( not ( = ?auto_55237 ?auto_55247 ) ) ( not ( = ?auto_55238 ?auto_55247 ) ) ( IS-CRATE ?auto_55238 ) ( not ( = ?auto_55237 ?auto_55240 ) ) ( not ( = ?auto_55238 ?auto_55240 ) ) ( not ( = ?auto_55247 ?auto_55240 ) ) ( not ( = ?auto_55243 ?auto_55250 ) ) ( not ( = ?auto_55242 ?auto_55243 ) ) ( HOIST-AT ?auto_55245 ?auto_55243 ) ( not ( = ?auto_55246 ?auto_55245 ) ) ( not ( = ?auto_55244 ?auto_55245 ) ) ( SURFACE-AT ?auto_55238 ?auto_55243 ) ( ON ?auto_55238 ?auto_55249 ) ( CLEAR ?auto_55238 ) ( not ( = ?auto_55237 ?auto_55249 ) ) ( not ( = ?auto_55238 ?auto_55249 ) ) ( not ( = ?auto_55247 ?auto_55249 ) ) ( not ( = ?auto_55240 ?auto_55249 ) ) ( SURFACE-AT ?auto_55241 ?auto_55250 ) ( CLEAR ?auto_55241 ) ( IS-CRATE ?auto_55240 ) ( not ( = ?auto_55237 ?auto_55241 ) ) ( not ( = ?auto_55238 ?auto_55241 ) ) ( not ( = ?auto_55247 ?auto_55241 ) ) ( not ( = ?auto_55240 ?auto_55241 ) ) ( not ( = ?auto_55249 ?auto_55241 ) ) ( AVAILABLE ?auto_55246 ) ( AVAILABLE ?auto_55245 ) ( SURFACE-AT ?auto_55240 ?auto_55243 ) ( ON ?auto_55240 ?auto_55239 ) ( CLEAR ?auto_55240 ) ( not ( = ?auto_55237 ?auto_55239 ) ) ( not ( = ?auto_55238 ?auto_55239 ) ) ( not ( = ?auto_55247 ?auto_55239 ) ) ( not ( = ?auto_55240 ?auto_55239 ) ) ( not ( = ?auto_55249 ?auto_55239 ) ) ( not ( = ?auto_55241 ?auto_55239 ) ) ( TRUCK-AT ?auto_55248 ?auto_55250 ) )
    :subtasks
    ( ( !DRIVE ?auto_55248 ?auto_55250 ?auto_55243 )
      ( MAKE-ON ?auto_55237 ?auto_55238 )
      ( MAKE-ON-VERIFY ?auto_55237 ?auto_55238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55253 - SURFACE
      ?auto_55254 - SURFACE
    )
    :vars
    (
      ?auto_55255 - HOIST
      ?auto_55256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55255 ?auto_55256 ) ( SURFACE-AT ?auto_55254 ?auto_55256 ) ( CLEAR ?auto_55254 ) ( LIFTING ?auto_55255 ?auto_55253 ) ( IS-CRATE ?auto_55253 ) ( not ( = ?auto_55253 ?auto_55254 ) ) )
    :subtasks
    ( ( !DROP ?auto_55255 ?auto_55253 ?auto_55254 ?auto_55256 )
      ( MAKE-ON-VERIFY ?auto_55253 ?auto_55254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55257 - SURFACE
      ?auto_55258 - SURFACE
    )
    :vars
    (
      ?auto_55260 - HOIST
      ?auto_55259 - PLACE
      ?auto_55261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55260 ?auto_55259 ) ( SURFACE-AT ?auto_55258 ?auto_55259 ) ( CLEAR ?auto_55258 ) ( IS-CRATE ?auto_55257 ) ( not ( = ?auto_55257 ?auto_55258 ) ) ( TRUCK-AT ?auto_55261 ?auto_55259 ) ( AVAILABLE ?auto_55260 ) ( IN ?auto_55257 ?auto_55261 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55260 ?auto_55257 ?auto_55261 ?auto_55259 )
      ( MAKE-ON ?auto_55257 ?auto_55258 )
      ( MAKE-ON-VERIFY ?auto_55257 ?auto_55258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55262 - SURFACE
      ?auto_55263 - SURFACE
    )
    :vars
    (
      ?auto_55264 - HOIST
      ?auto_55265 - PLACE
      ?auto_55266 - TRUCK
      ?auto_55267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55264 ?auto_55265 ) ( SURFACE-AT ?auto_55263 ?auto_55265 ) ( CLEAR ?auto_55263 ) ( IS-CRATE ?auto_55262 ) ( not ( = ?auto_55262 ?auto_55263 ) ) ( AVAILABLE ?auto_55264 ) ( IN ?auto_55262 ?auto_55266 ) ( TRUCK-AT ?auto_55266 ?auto_55267 ) ( not ( = ?auto_55267 ?auto_55265 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55266 ?auto_55267 ?auto_55265 )
      ( MAKE-ON ?auto_55262 ?auto_55263 )
      ( MAKE-ON-VERIFY ?auto_55262 ?auto_55263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55268 - SURFACE
      ?auto_55269 - SURFACE
    )
    :vars
    (
      ?auto_55272 - HOIST
      ?auto_55271 - PLACE
      ?auto_55273 - TRUCK
      ?auto_55270 - PLACE
      ?auto_55274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55272 ?auto_55271 ) ( SURFACE-AT ?auto_55269 ?auto_55271 ) ( CLEAR ?auto_55269 ) ( IS-CRATE ?auto_55268 ) ( not ( = ?auto_55268 ?auto_55269 ) ) ( AVAILABLE ?auto_55272 ) ( TRUCK-AT ?auto_55273 ?auto_55270 ) ( not ( = ?auto_55270 ?auto_55271 ) ) ( HOIST-AT ?auto_55274 ?auto_55270 ) ( LIFTING ?auto_55274 ?auto_55268 ) ( not ( = ?auto_55272 ?auto_55274 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55274 ?auto_55268 ?auto_55273 ?auto_55270 )
      ( MAKE-ON ?auto_55268 ?auto_55269 )
      ( MAKE-ON-VERIFY ?auto_55268 ?auto_55269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55275 - SURFACE
      ?auto_55276 - SURFACE
    )
    :vars
    (
      ?auto_55277 - HOIST
      ?auto_55278 - PLACE
      ?auto_55280 - TRUCK
      ?auto_55281 - PLACE
      ?auto_55279 - HOIST
      ?auto_55282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55277 ?auto_55278 ) ( SURFACE-AT ?auto_55276 ?auto_55278 ) ( CLEAR ?auto_55276 ) ( IS-CRATE ?auto_55275 ) ( not ( = ?auto_55275 ?auto_55276 ) ) ( AVAILABLE ?auto_55277 ) ( TRUCK-AT ?auto_55280 ?auto_55281 ) ( not ( = ?auto_55281 ?auto_55278 ) ) ( HOIST-AT ?auto_55279 ?auto_55281 ) ( not ( = ?auto_55277 ?auto_55279 ) ) ( AVAILABLE ?auto_55279 ) ( SURFACE-AT ?auto_55275 ?auto_55281 ) ( ON ?auto_55275 ?auto_55282 ) ( CLEAR ?auto_55275 ) ( not ( = ?auto_55275 ?auto_55282 ) ) ( not ( = ?auto_55276 ?auto_55282 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55279 ?auto_55275 ?auto_55282 ?auto_55281 )
      ( MAKE-ON ?auto_55275 ?auto_55276 )
      ( MAKE-ON-VERIFY ?auto_55275 ?auto_55276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55283 - SURFACE
      ?auto_55284 - SURFACE
    )
    :vars
    (
      ?auto_55285 - HOIST
      ?auto_55290 - PLACE
      ?auto_55289 - PLACE
      ?auto_55287 - HOIST
      ?auto_55288 - SURFACE
      ?auto_55286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55285 ?auto_55290 ) ( SURFACE-AT ?auto_55284 ?auto_55290 ) ( CLEAR ?auto_55284 ) ( IS-CRATE ?auto_55283 ) ( not ( = ?auto_55283 ?auto_55284 ) ) ( AVAILABLE ?auto_55285 ) ( not ( = ?auto_55289 ?auto_55290 ) ) ( HOIST-AT ?auto_55287 ?auto_55289 ) ( not ( = ?auto_55285 ?auto_55287 ) ) ( AVAILABLE ?auto_55287 ) ( SURFACE-AT ?auto_55283 ?auto_55289 ) ( ON ?auto_55283 ?auto_55288 ) ( CLEAR ?auto_55283 ) ( not ( = ?auto_55283 ?auto_55288 ) ) ( not ( = ?auto_55284 ?auto_55288 ) ) ( TRUCK-AT ?auto_55286 ?auto_55290 ) )
    :subtasks
    ( ( !DRIVE ?auto_55286 ?auto_55290 ?auto_55289 )
      ( MAKE-ON ?auto_55283 ?auto_55284 )
      ( MAKE-ON-VERIFY ?auto_55283 ?auto_55284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55291 - SURFACE
      ?auto_55292 - SURFACE
    )
    :vars
    (
      ?auto_55297 - HOIST
      ?auto_55294 - PLACE
      ?auto_55296 - PLACE
      ?auto_55295 - HOIST
      ?auto_55298 - SURFACE
      ?auto_55293 - TRUCK
      ?auto_55299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55297 ?auto_55294 ) ( IS-CRATE ?auto_55291 ) ( not ( = ?auto_55291 ?auto_55292 ) ) ( not ( = ?auto_55296 ?auto_55294 ) ) ( HOIST-AT ?auto_55295 ?auto_55296 ) ( not ( = ?auto_55297 ?auto_55295 ) ) ( AVAILABLE ?auto_55295 ) ( SURFACE-AT ?auto_55291 ?auto_55296 ) ( ON ?auto_55291 ?auto_55298 ) ( CLEAR ?auto_55291 ) ( not ( = ?auto_55291 ?auto_55298 ) ) ( not ( = ?auto_55292 ?auto_55298 ) ) ( TRUCK-AT ?auto_55293 ?auto_55294 ) ( SURFACE-AT ?auto_55299 ?auto_55294 ) ( CLEAR ?auto_55299 ) ( LIFTING ?auto_55297 ?auto_55292 ) ( IS-CRATE ?auto_55292 ) ( not ( = ?auto_55291 ?auto_55299 ) ) ( not ( = ?auto_55292 ?auto_55299 ) ) ( not ( = ?auto_55298 ?auto_55299 ) ) )
    :subtasks
    ( ( !DROP ?auto_55297 ?auto_55292 ?auto_55299 ?auto_55294 )
      ( MAKE-ON ?auto_55291 ?auto_55292 )
      ( MAKE-ON-VERIFY ?auto_55291 ?auto_55292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55300 - SURFACE
      ?auto_55301 - SURFACE
    )
    :vars
    (
      ?auto_55304 - HOIST
      ?auto_55303 - PLACE
      ?auto_55305 - PLACE
      ?auto_55302 - HOIST
      ?auto_55307 - SURFACE
      ?auto_55306 - TRUCK
      ?auto_55308 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55304 ?auto_55303 ) ( IS-CRATE ?auto_55300 ) ( not ( = ?auto_55300 ?auto_55301 ) ) ( not ( = ?auto_55305 ?auto_55303 ) ) ( HOIST-AT ?auto_55302 ?auto_55305 ) ( not ( = ?auto_55304 ?auto_55302 ) ) ( AVAILABLE ?auto_55302 ) ( SURFACE-AT ?auto_55300 ?auto_55305 ) ( ON ?auto_55300 ?auto_55307 ) ( CLEAR ?auto_55300 ) ( not ( = ?auto_55300 ?auto_55307 ) ) ( not ( = ?auto_55301 ?auto_55307 ) ) ( TRUCK-AT ?auto_55306 ?auto_55303 ) ( SURFACE-AT ?auto_55308 ?auto_55303 ) ( CLEAR ?auto_55308 ) ( IS-CRATE ?auto_55301 ) ( not ( = ?auto_55300 ?auto_55308 ) ) ( not ( = ?auto_55301 ?auto_55308 ) ) ( not ( = ?auto_55307 ?auto_55308 ) ) ( AVAILABLE ?auto_55304 ) ( IN ?auto_55301 ?auto_55306 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55304 ?auto_55301 ?auto_55306 ?auto_55303 )
      ( MAKE-ON ?auto_55300 ?auto_55301 )
      ( MAKE-ON-VERIFY ?auto_55300 ?auto_55301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55309 - SURFACE
      ?auto_55310 - SURFACE
    )
    :vars
    (
      ?auto_55317 - HOIST
      ?auto_55314 - PLACE
      ?auto_55311 - PLACE
      ?auto_55312 - HOIST
      ?auto_55313 - SURFACE
      ?auto_55315 - SURFACE
      ?auto_55316 - TRUCK
      ?auto_55318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55317 ?auto_55314 ) ( IS-CRATE ?auto_55309 ) ( not ( = ?auto_55309 ?auto_55310 ) ) ( not ( = ?auto_55311 ?auto_55314 ) ) ( HOIST-AT ?auto_55312 ?auto_55311 ) ( not ( = ?auto_55317 ?auto_55312 ) ) ( AVAILABLE ?auto_55312 ) ( SURFACE-AT ?auto_55309 ?auto_55311 ) ( ON ?auto_55309 ?auto_55313 ) ( CLEAR ?auto_55309 ) ( not ( = ?auto_55309 ?auto_55313 ) ) ( not ( = ?auto_55310 ?auto_55313 ) ) ( SURFACE-AT ?auto_55315 ?auto_55314 ) ( CLEAR ?auto_55315 ) ( IS-CRATE ?auto_55310 ) ( not ( = ?auto_55309 ?auto_55315 ) ) ( not ( = ?auto_55310 ?auto_55315 ) ) ( not ( = ?auto_55313 ?auto_55315 ) ) ( AVAILABLE ?auto_55317 ) ( IN ?auto_55310 ?auto_55316 ) ( TRUCK-AT ?auto_55316 ?auto_55318 ) ( not ( = ?auto_55318 ?auto_55314 ) ) ( not ( = ?auto_55311 ?auto_55318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55316 ?auto_55318 ?auto_55314 )
      ( MAKE-ON ?auto_55309 ?auto_55310 )
      ( MAKE-ON-VERIFY ?auto_55309 ?auto_55310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55319 - SURFACE
      ?auto_55320 - SURFACE
    )
    :vars
    (
      ?auto_55321 - HOIST
      ?auto_55324 - PLACE
      ?auto_55328 - PLACE
      ?auto_55322 - HOIST
      ?auto_55325 - SURFACE
      ?auto_55327 - SURFACE
      ?auto_55323 - TRUCK
      ?auto_55326 - PLACE
      ?auto_55329 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55321 ?auto_55324 ) ( IS-CRATE ?auto_55319 ) ( not ( = ?auto_55319 ?auto_55320 ) ) ( not ( = ?auto_55328 ?auto_55324 ) ) ( HOIST-AT ?auto_55322 ?auto_55328 ) ( not ( = ?auto_55321 ?auto_55322 ) ) ( AVAILABLE ?auto_55322 ) ( SURFACE-AT ?auto_55319 ?auto_55328 ) ( ON ?auto_55319 ?auto_55325 ) ( CLEAR ?auto_55319 ) ( not ( = ?auto_55319 ?auto_55325 ) ) ( not ( = ?auto_55320 ?auto_55325 ) ) ( SURFACE-AT ?auto_55327 ?auto_55324 ) ( CLEAR ?auto_55327 ) ( IS-CRATE ?auto_55320 ) ( not ( = ?auto_55319 ?auto_55327 ) ) ( not ( = ?auto_55320 ?auto_55327 ) ) ( not ( = ?auto_55325 ?auto_55327 ) ) ( AVAILABLE ?auto_55321 ) ( TRUCK-AT ?auto_55323 ?auto_55326 ) ( not ( = ?auto_55326 ?auto_55324 ) ) ( not ( = ?auto_55328 ?auto_55326 ) ) ( HOIST-AT ?auto_55329 ?auto_55326 ) ( LIFTING ?auto_55329 ?auto_55320 ) ( not ( = ?auto_55321 ?auto_55329 ) ) ( not ( = ?auto_55322 ?auto_55329 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55329 ?auto_55320 ?auto_55323 ?auto_55326 )
      ( MAKE-ON ?auto_55319 ?auto_55320 )
      ( MAKE-ON-VERIFY ?auto_55319 ?auto_55320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55330 - SURFACE
      ?auto_55331 - SURFACE
    )
    :vars
    (
      ?auto_55335 - HOIST
      ?auto_55333 - PLACE
      ?auto_55340 - PLACE
      ?auto_55332 - HOIST
      ?auto_55338 - SURFACE
      ?auto_55339 - SURFACE
      ?auto_55336 - TRUCK
      ?auto_55334 - PLACE
      ?auto_55337 - HOIST
      ?auto_55341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55335 ?auto_55333 ) ( IS-CRATE ?auto_55330 ) ( not ( = ?auto_55330 ?auto_55331 ) ) ( not ( = ?auto_55340 ?auto_55333 ) ) ( HOIST-AT ?auto_55332 ?auto_55340 ) ( not ( = ?auto_55335 ?auto_55332 ) ) ( AVAILABLE ?auto_55332 ) ( SURFACE-AT ?auto_55330 ?auto_55340 ) ( ON ?auto_55330 ?auto_55338 ) ( CLEAR ?auto_55330 ) ( not ( = ?auto_55330 ?auto_55338 ) ) ( not ( = ?auto_55331 ?auto_55338 ) ) ( SURFACE-AT ?auto_55339 ?auto_55333 ) ( CLEAR ?auto_55339 ) ( IS-CRATE ?auto_55331 ) ( not ( = ?auto_55330 ?auto_55339 ) ) ( not ( = ?auto_55331 ?auto_55339 ) ) ( not ( = ?auto_55338 ?auto_55339 ) ) ( AVAILABLE ?auto_55335 ) ( TRUCK-AT ?auto_55336 ?auto_55334 ) ( not ( = ?auto_55334 ?auto_55333 ) ) ( not ( = ?auto_55340 ?auto_55334 ) ) ( HOIST-AT ?auto_55337 ?auto_55334 ) ( not ( = ?auto_55335 ?auto_55337 ) ) ( not ( = ?auto_55332 ?auto_55337 ) ) ( AVAILABLE ?auto_55337 ) ( SURFACE-AT ?auto_55331 ?auto_55334 ) ( ON ?auto_55331 ?auto_55341 ) ( CLEAR ?auto_55331 ) ( not ( = ?auto_55330 ?auto_55341 ) ) ( not ( = ?auto_55331 ?auto_55341 ) ) ( not ( = ?auto_55338 ?auto_55341 ) ) ( not ( = ?auto_55339 ?auto_55341 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55337 ?auto_55331 ?auto_55341 ?auto_55334 )
      ( MAKE-ON ?auto_55330 ?auto_55331 )
      ( MAKE-ON-VERIFY ?auto_55330 ?auto_55331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55342 - SURFACE
      ?auto_55343 - SURFACE
    )
    :vars
    (
      ?auto_55344 - HOIST
      ?auto_55345 - PLACE
      ?auto_55353 - PLACE
      ?auto_55350 - HOIST
      ?auto_55349 - SURFACE
      ?auto_55346 - SURFACE
      ?auto_55347 - PLACE
      ?auto_55352 - HOIST
      ?auto_55348 - SURFACE
      ?auto_55351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55344 ?auto_55345 ) ( IS-CRATE ?auto_55342 ) ( not ( = ?auto_55342 ?auto_55343 ) ) ( not ( = ?auto_55353 ?auto_55345 ) ) ( HOIST-AT ?auto_55350 ?auto_55353 ) ( not ( = ?auto_55344 ?auto_55350 ) ) ( AVAILABLE ?auto_55350 ) ( SURFACE-AT ?auto_55342 ?auto_55353 ) ( ON ?auto_55342 ?auto_55349 ) ( CLEAR ?auto_55342 ) ( not ( = ?auto_55342 ?auto_55349 ) ) ( not ( = ?auto_55343 ?auto_55349 ) ) ( SURFACE-AT ?auto_55346 ?auto_55345 ) ( CLEAR ?auto_55346 ) ( IS-CRATE ?auto_55343 ) ( not ( = ?auto_55342 ?auto_55346 ) ) ( not ( = ?auto_55343 ?auto_55346 ) ) ( not ( = ?auto_55349 ?auto_55346 ) ) ( AVAILABLE ?auto_55344 ) ( not ( = ?auto_55347 ?auto_55345 ) ) ( not ( = ?auto_55353 ?auto_55347 ) ) ( HOIST-AT ?auto_55352 ?auto_55347 ) ( not ( = ?auto_55344 ?auto_55352 ) ) ( not ( = ?auto_55350 ?auto_55352 ) ) ( AVAILABLE ?auto_55352 ) ( SURFACE-AT ?auto_55343 ?auto_55347 ) ( ON ?auto_55343 ?auto_55348 ) ( CLEAR ?auto_55343 ) ( not ( = ?auto_55342 ?auto_55348 ) ) ( not ( = ?auto_55343 ?auto_55348 ) ) ( not ( = ?auto_55349 ?auto_55348 ) ) ( not ( = ?auto_55346 ?auto_55348 ) ) ( TRUCK-AT ?auto_55351 ?auto_55345 ) )
    :subtasks
    ( ( !DRIVE ?auto_55351 ?auto_55345 ?auto_55347 )
      ( MAKE-ON ?auto_55342 ?auto_55343 )
      ( MAKE-ON-VERIFY ?auto_55342 ?auto_55343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55354 - SURFACE
      ?auto_55355 - SURFACE
    )
    :vars
    (
      ?auto_55360 - HOIST
      ?auto_55361 - PLACE
      ?auto_55358 - PLACE
      ?auto_55365 - HOIST
      ?auto_55359 - SURFACE
      ?auto_55363 - SURFACE
      ?auto_55364 - PLACE
      ?auto_55357 - HOIST
      ?auto_55362 - SURFACE
      ?auto_55356 - TRUCK
      ?auto_55366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55360 ?auto_55361 ) ( IS-CRATE ?auto_55354 ) ( not ( = ?auto_55354 ?auto_55355 ) ) ( not ( = ?auto_55358 ?auto_55361 ) ) ( HOIST-AT ?auto_55365 ?auto_55358 ) ( not ( = ?auto_55360 ?auto_55365 ) ) ( AVAILABLE ?auto_55365 ) ( SURFACE-AT ?auto_55354 ?auto_55358 ) ( ON ?auto_55354 ?auto_55359 ) ( CLEAR ?auto_55354 ) ( not ( = ?auto_55354 ?auto_55359 ) ) ( not ( = ?auto_55355 ?auto_55359 ) ) ( IS-CRATE ?auto_55355 ) ( not ( = ?auto_55354 ?auto_55363 ) ) ( not ( = ?auto_55355 ?auto_55363 ) ) ( not ( = ?auto_55359 ?auto_55363 ) ) ( not ( = ?auto_55364 ?auto_55361 ) ) ( not ( = ?auto_55358 ?auto_55364 ) ) ( HOIST-AT ?auto_55357 ?auto_55364 ) ( not ( = ?auto_55360 ?auto_55357 ) ) ( not ( = ?auto_55365 ?auto_55357 ) ) ( AVAILABLE ?auto_55357 ) ( SURFACE-AT ?auto_55355 ?auto_55364 ) ( ON ?auto_55355 ?auto_55362 ) ( CLEAR ?auto_55355 ) ( not ( = ?auto_55354 ?auto_55362 ) ) ( not ( = ?auto_55355 ?auto_55362 ) ) ( not ( = ?auto_55359 ?auto_55362 ) ) ( not ( = ?auto_55363 ?auto_55362 ) ) ( TRUCK-AT ?auto_55356 ?auto_55361 ) ( SURFACE-AT ?auto_55366 ?auto_55361 ) ( CLEAR ?auto_55366 ) ( LIFTING ?auto_55360 ?auto_55363 ) ( IS-CRATE ?auto_55363 ) ( not ( = ?auto_55354 ?auto_55366 ) ) ( not ( = ?auto_55355 ?auto_55366 ) ) ( not ( = ?auto_55359 ?auto_55366 ) ) ( not ( = ?auto_55363 ?auto_55366 ) ) ( not ( = ?auto_55362 ?auto_55366 ) ) )
    :subtasks
    ( ( !DROP ?auto_55360 ?auto_55363 ?auto_55366 ?auto_55361 )
      ( MAKE-ON ?auto_55354 ?auto_55355 )
      ( MAKE-ON-VERIFY ?auto_55354 ?auto_55355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55367 - SURFACE
      ?auto_55368 - SURFACE
    )
    :vars
    (
      ?auto_55377 - HOIST
      ?auto_55371 - PLACE
      ?auto_55374 - PLACE
      ?auto_55372 - HOIST
      ?auto_55378 - SURFACE
      ?auto_55375 - SURFACE
      ?auto_55373 - PLACE
      ?auto_55370 - HOIST
      ?auto_55369 - SURFACE
      ?auto_55376 - TRUCK
      ?auto_55379 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55377 ?auto_55371 ) ( IS-CRATE ?auto_55367 ) ( not ( = ?auto_55367 ?auto_55368 ) ) ( not ( = ?auto_55374 ?auto_55371 ) ) ( HOIST-AT ?auto_55372 ?auto_55374 ) ( not ( = ?auto_55377 ?auto_55372 ) ) ( AVAILABLE ?auto_55372 ) ( SURFACE-AT ?auto_55367 ?auto_55374 ) ( ON ?auto_55367 ?auto_55378 ) ( CLEAR ?auto_55367 ) ( not ( = ?auto_55367 ?auto_55378 ) ) ( not ( = ?auto_55368 ?auto_55378 ) ) ( IS-CRATE ?auto_55368 ) ( not ( = ?auto_55367 ?auto_55375 ) ) ( not ( = ?auto_55368 ?auto_55375 ) ) ( not ( = ?auto_55378 ?auto_55375 ) ) ( not ( = ?auto_55373 ?auto_55371 ) ) ( not ( = ?auto_55374 ?auto_55373 ) ) ( HOIST-AT ?auto_55370 ?auto_55373 ) ( not ( = ?auto_55377 ?auto_55370 ) ) ( not ( = ?auto_55372 ?auto_55370 ) ) ( AVAILABLE ?auto_55370 ) ( SURFACE-AT ?auto_55368 ?auto_55373 ) ( ON ?auto_55368 ?auto_55369 ) ( CLEAR ?auto_55368 ) ( not ( = ?auto_55367 ?auto_55369 ) ) ( not ( = ?auto_55368 ?auto_55369 ) ) ( not ( = ?auto_55378 ?auto_55369 ) ) ( not ( = ?auto_55375 ?auto_55369 ) ) ( TRUCK-AT ?auto_55376 ?auto_55371 ) ( SURFACE-AT ?auto_55379 ?auto_55371 ) ( CLEAR ?auto_55379 ) ( IS-CRATE ?auto_55375 ) ( not ( = ?auto_55367 ?auto_55379 ) ) ( not ( = ?auto_55368 ?auto_55379 ) ) ( not ( = ?auto_55378 ?auto_55379 ) ) ( not ( = ?auto_55375 ?auto_55379 ) ) ( not ( = ?auto_55369 ?auto_55379 ) ) ( AVAILABLE ?auto_55377 ) ( IN ?auto_55375 ?auto_55376 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55377 ?auto_55375 ?auto_55376 ?auto_55371 )
      ( MAKE-ON ?auto_55367 ?auto_55368 )
      ( MAKE-ON-VERIFY ?auto_55367 ?auto_55368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55380 - SURFACE
      ?auto_55381 - SURFACE
    )
    :vars
    (
      ?auto_55385 - HOIST
      ?auto_55383 - PLACE
      ?auto_55384 - PLACE
      ?auto_55390 - HOIST
      ?auto_55382 - SURFACE
      ?auto_55386 - SURFACE
      ?auto_55388 - PLACE
      ?auto_55392 - HOIST
      ?auto_55387 - SURFACE
      ?auto_55389 - SURFACE
      ?auto_55391 - TRUCK
      ?auto_55393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55385 ?auto_55383 ) ( IS-CRATE ?auto_55380 ) ( not ( = ?auto_55380 ?auto_55381 ) ) ( not ( = ?auto_55384 ?auto_55383 ) ) ( HOIST-AT ?auto_55390 ?auto_55384 ) ( not ( = ?auto_55385 ?auto_55390 ) ) ( AVAILABLE ?auto_55390 ) ( SURFACE-AT ?auto_55380 ?auto_55384 ) ( ON ?auto_55380 ?auto_55382 ) ( CLEAR ?auto_55380 ) ( not ( = ?auto_55380 ?auto_55382 ) ) ( not ( = ?auto_55381 ?auto_55382 ) ) ( IS-CRATE ?auto_55381 ) ( not ( = ?auto_55380 ?auto_55386 ) ) ( not ( = ?auto_55381 ?auto_55386 ) ) ( not ( = ?auto_55382 ?auto_55386 ) ) ( not ( = ?auto_55388 ?auto_55383 ) ) ( not ( = ?auto_55384 ?auto_55388 ) ) ( HOIST-AT ?auto_55392 ?auto_55388 ) ( not ( = ?auto_55385 ?auto_55392 ) ) ( not ( = ?auto_55390 ?auto_55392 ) ) ( AVAILABLE ?auto_55392 ) ( SURFACE-AT ?auto_55381 ?auto_55388 ) ( ON ?auto_55381 ?auto_55387 ) ( CLEAR ?auto_55381 ) ( not ( = ?auto_55380 ?auto_55387 ) ) ( not ( = ?auto_55381 ?auto_55387 ) ) ( not ( = ?auto_55382 ?auto_55387 ) ) ( not ( = ?auto_55386 ?auto_55387 ) ) ( SURFACE-AT ?auto_55389 ?auto_55383 ) ( CLEAR ?auto_55389 ) ( IS-CRATE ?auto_55386 ) ( not ( = ?auto_55380 ?auto_55389 ) ) ( not ( = ?auto_55381 ?auto_55389 ) ) ( not ( = ?auto_55382 ?auto_55389 ) ) ( not ( = ?auto_55386 ?auto_55389 ) ) ( not ( = ?auto_55387 ?auto_55389 ) ) ( AVAILABLE ?auto_55385 ) ( IN ?auto_55386 ?auto_55391 ) ( TRUCK-AT ?auto_55391 ?auto_55393 ) ( not ( = ?auto_55393 ?auto_55383 ) ) ( not ( = ?auto_55384 ?auto_55393 ) ) ( not ( = ?auto_55388 ?auto_55393 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55391 ?auto_55393 ?auto_55383 )
      ( MAKE-ON ?auto_55380 ?auto_55381 )
      ( MAKE-ON-VERIFY ?auto_55380 ?auto_55381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55394 - SURFACE
      ?auto_55395 - SURFACE
    )
    :vars
    (
      ?auto_55397 - HOIST
      ?auto_55404 - PLACE
      ?auto_55398 - PLACE
      ?auto_55403 - HOIST
      ?auto_55396 - SURFACE
      ?auto_55402 - SURFACE
      ?auto_55406 - PLACE
      ?auto_55400 - HOIST
      ?auto_55405 - SURFACE
      ?auto_55407 - SURFACE
      ?auto_55401 - TRUCK
      ?auto_55399 - PLACE
      ?auto_55408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55397 ?auto_55404 ) ( IS-CRATE ?auto_55394 ) ( not ( = ?auto_55394 ?auto_55395 ) ) ( not ( = ?auto_55398 ?auto_55404 ) ) ( HOIST-AT ?auto_55403 ?auto_55398 ) ( not ( = ?auto_55397 ?auto_55403 ) ) ( AVAILABLE ?auto_55403 ) ( SURFACE-AT ?auto_55394 ?auto_55398 ) ( ON ?auto_55394 ?auto_55396 ) ( CLEAR ?auto_55394 ) ( not ( = ?auto_55394 ?auto_55396 ) ) ( not ( = ?auto_55395 ?auto_55396 ) ) ( IS-CRATE ?auto_55395 ) ( not ( = ?auto_55394 ?auto_55402 ) ) ( not ( = ?auto_55395 ?auto_55402 ) ) ( not ( = ?auto_55396 ?auto_55402 ) ) ( not ( = ?auto_55406 ?auto_55404 ) ) ( not ( = ?auto_55398 ?auto_55406 ) ) ( HOIST-AT ?auto_55400 ?auto_55406 ) ( not ( = ?auto_55397 ?auto_55400 ) ) ( not ( = ?auto_55403 ?auto_55400 ) ) ( AVAILABLE ?auto_55400 ) ( SURFACE-AT ?auto_55395 ?auto_55406 ) ( ON ?auto_55395 ?auto_55405 ) ( CLEAR ?auto_55395 ) ( not ( = ?auto_55394 ?auto_55405 ) ) ( not ( = ?auto_55395 ?auto_55405 ) ) ( not ( = ?auto_55396 ?auto_55405 ) ) ( not ( = ?auto_55402 ?auto_55405 ) ) ( SURFACE-AT ?auto_55407 ?auto_55404 ) ( CLEAR ?auto_55407 ) ( IS-CRATE ?auto_55402 ) ( not ( = ?auto_55394 ?auto_55407 ) ) ( not ( = ?auto_55395 ?auto_55407 ) ) ( not ( = ?auto_55396 ?auto_55407 ) ) ( not ( = ?auto_55402 ?auto_55407 ) ) ( not ( = ?auto_55405 ?auto_55407 ) ) ( AVAILABLE ?auto_55397 ) ( TRUCK-AT ?auto_55401 ?auto_55399 ) ( not ( = ?auto_55399 ?auto_55404 ) ) ( not ( = ?auto_55398 ?auto_55399 ) ) ( not ( = ?auto_55406 ?auto_55399 ) ) ( HOIST-AT ?auto_55408 ?auto_55399 ) ( LIFTING ?auto_55408 ?auto_55402 ) ( not ( = ?auto_55397 ?auto_55408 ) ) ( not ( = ?auto_55403 ?auto_55408 ) ) ( not ( = ?auto_55400 ?auto_55408 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55408 ?auto_55402 ?auto_55401 ?auto_55399 )
      ( MAKE-ON ?auto_55394 ?auto_55395 )
      ( MAKE-ON-VERIFY ?auto_55394 ?auto_55395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55409 - SURFACE
      ?auto_55410 - SURFACE
    )
    :vars
    (
      ?auto_55421 - HOIST
      ?auto_55415 - PLACE
      ?auto_55420 - PLACE
      ?auto_55422 - HOIST
      ?auto_55411 - SURFACE
      ?auto_55413 - SURFACE
      ?auto_55412 - PLACE
      ?auto_55414 - HOIST
      ?auto_55417 - SURFACE
      ?auto_55416 - SURFACE
      ?auto_55418 - TRUCK
      ?auto_55423 - PLACE
      ?auto_55419 - HOIST
      ?auto_55424 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55421 ?auto_55415 ) ( IS-CRATE ?auto_55409 ) ( not ( = ?auto_55409 ?auto_55410 ) ) ( not ( = ?auto_55420 ?auto_55415 ) ) ( HOIST-AT ?auto_55422 ?auto_55420 ) ( not ( = ?auto_55421 ?auto_55422 ) ) ( AVAILABLE ?auto_55422 ) ( SURFACE-AT ?auto_55409 ?auto_55420 ) ( ON ?auto_55409 ?auto_55411 ) ( CLEAR ?auto_55409 ) ( not ( = ?auto_55409 ?auto_55411 ) ) ( not ( = ?auto_55410 ?auto_55411 ) ) ( IS-CRATE ?auto_55410 ) ( not ( = ?auto_55409 ?auto_55413 ) ) ( not ( = ?auto_55410 ?auto_55413 ) ) ( not ( = ?auto_55411 ?auto_55413 ) ) ( not ( = ?auto_55412 ?auto_55415 ) ) ( not ( = ?auto_55420 ?auto_55412 ) ) ( HOIST-AT ?auto_55414 ?auto_55412 ) ( not ( = ?auto_55421 ?auto_55414 ) ) ( not ( = ?auto_55422 ?auto_55414 ) ) ( AVAILABLE ?auto_55414 ) ( SURFACE-AT ?auto_55410 ?auto_55412 ) ( ON ?auto_55410 ?auto_55417 ) ( CLEAR ?auto_55410 ) ( not ( = ?auto_55409 ?auto_55417 ) ) ( not ( = ?auto_55410 ?auto_55417 ) ) ( not ( = ?auto_55411 ?auto_55417 ) ) ( not ( = ?auto_55413 ?auto_55417 ) ) ( SURFACE-AT ?auto_55416 ?auto_55415 ) ( CLEAR ?auto_55416 ) ( IS-CRATE ?auto_55413 ) ( not ( = ?auto_55409 ?auto_55416 ) ) ( not ( = ?auto_55410 ?auto_55416 ) ) ( not ( = ?auto_55411 ?auto_55416 ) ) ( not ( = ?auto_55413 ?auto_55416 ) ) ( not ( = ?auto_55417 ?auto_55416 ) ) ( AVAILABLE ?auto_55421 ) ( TRUCK-AT ?auto_55418 ?auto_55423 ) ( not ( = ?auto_55423 ?auto_55415 ) ) ( not ( = ?auto_55420 ?auto_55423 ) ) ( not ( = ?auto_55412 ?auto_55423 ) ) ( HOIST-AT ?auto_55419 ?auto_55423 ) ( not ( = ?auto_55421 ?auto_55419 ) ) ( not ( = ?auto_55422 ?auto_55419 ) ) ( not ( = ?auto_55414 ?auto_55419 ) ) ( AVAILABLE ?auto_55419 ) ( SURFACE-AT ?auto_55413 ?auto_55423 ) ( ON ?auto_55413 ?auto_55424 ) ( CLEAR ?auto_55413 ) ( not ( = ?auto_55409 ?auto_55424 ) ) ( not ( = ?auto_55410 ?auto_55424 ) ) ( not ( = ?auto_55411 ?auto_55424 ) ) ( not ( = ?auto_55413 ?auto_55424 ) ) ( not ( = ?auto_55417 ?auto_55424 ) ) ( not ( = ?auto_55416 ?auto_55424 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55419 ?auto_55413 ?auto_55424 ?auto_55423 )
      ( MAKE-ON ?auto_55409 ?auto_55410 )
      ( MAKE-ON-VERIFY ?auto_55409 ?auto_55410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55425 - SURFACE
      ?auto_55426 - SURFACE
    )
    :vars
    (
      ?auto_55437 - HOIST
      ?auto_55438 - PLACE
      ?auto_55427 - PLACE
      ?auto_55431 - HOIST
      ?auto_55433 - SURFACE
      ?auto_55428 - SURFACE
      ?auto_55429 - PLACE
      ?auto_55440 - HOIST
      ?auto_55436 - SURFACE
      ?auto_55432 - SURFACE
      ?auto_55439 - PLACE
      ?auto_55435 - HOIST
      ?auto_55434 - SURFACE
      ?auto_55430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55437 ?auto_55438 ) ( IS-CRATE ?auto_55425 ) ( not ( = ?auto_55425 ?auto_55426 ) ) ( not ( = ?auto_55427 ?auto_55438 ) ) ( HOIST-AT ?auto_55431 ?auto_55427 ) ( not ( = ?auto_55437 ?auto_55431 ) ) ( AVAILABLE ?auto_55431 ) ( SURFACE-AT ?auto_55425 ?auto_55427 ) ( ON ?auto_55425 ?auto_55433 ) ( CLEAR ?auto_55425 ) ( not ( = ?auto_55425 ?auto_55433 ) ) ( not ( = ?auto_55426 ?auto_55433 ) ) ( IS-CRATE ?auto_55426 ) ( not ( = ?auto_55425 ?auto_55428 ) ) ( not ( = ?auto_55426 ?auto_55428 ) ) ( not ( = ?auto_55433 ?auto_55428 ) ) ( not ( = ?auto_55429 ?auto_55438 ) ) ( not ( = ?auto_55427 ?auto_55429 ) ) ( HOIST-AT ?auto_55440 ?auto_55429 ) ( not ( = ?auto_55437 ?auto_55440 ) ) ( not ( = ?auto_55431 ?auto_55440 ) ) ( AVAILABLE ?auto_55440 ) ( SURFACE-AT ?auto_55426 ?auto_55429 ) ( ON ?auto_55426 ?auto_55436 ) ( CLEAR ?auto_55426 ) ( not ( = ?auto_55425 ?auto_55436 ) ) ( not ( = ?auto_55426 ?auto_55436 ) ) ( not ( = ?auto_55433 ?auto_55436 ) ) ( not ( = ?auto_55428 ?auto_55436 ) ) ( SURFACE-AT ?auto_55432 ?auto_55438 ) ( CLEAR ?auto_55432 ) ( IS-CRATE ?auto_55428 ) ( not ( = ?auto_55425 ?auto_55432 ) ) ( not ( = ?auto_55426 ?auto_55432 ) ) ( not ( = ?auto_55433 ?auto_55432 ) ) ( not ( = ?auto_55428 ?auto_55432 ) ) ( not ( = ?auto_55436 ?auto_55432 ) ) ( AVAILABLE ?auto_55437 ) ( not ( = ?auto_55439 ?auto_55438 ) ) ( not ( = ?auto_55427 ?auto_55439 ) ) ( not ( = ?auto_55429 ?auto_55439 ) ) ( HOIST-AT ?auto_55435 ?auto_55439 ) ( not ( = ?auto_55437 ?auto_55435 ) ) ( not ( = ?auto_55431 ?auto_55435 ) ) ( not ( = ?auto_55440 ?auto_55435 ) ) ( AVAILABLE ?auto_55435 ) ( SURFACE-AT ?auto_55428 ?auto_55439 ) ( ON ?auto_55428 ?auto_55434 ) ( CLEAR ?auto_55428 ) ( not ( = ?auto_55425 ?auto_55434 ) ) ( not ( = ?auto_55426 ?auto_55434 ) ) ( not ( = ?auto_55433 ?auto_55434 ) ) ( not ( = ?auto_55428 ?auto_55434 ) ) ( not ( = ?auto_55436 ?auto_55434 ) ) ( not ( = ?auto_55432 ?auto_55434 ) ) ( TRUCK-AT ?auto_55430 ?auto_55438 ) )
    :subtasks
    ( ( !DRIVE ?auto_55430 ?auto_55438 ?auto_55439 )
      ( MAKE-ON ?auto_55425 ?auto_55426 )
      ( MAKE-ON-VERIFY ?auto_55425 ?auto_55426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55441 - SURFACE
      ?auto_55442 - SURFACE
    )
    :vars
    (
      ?auto_55445 - HOIST
      ?auto_55443 - PLACE
      ?auto_55456 - PLACE
      ?auto_55450 - HOIST
      ?auto_55446 - SURFACE
      ?auto_55454 - SURFACE
      ?auto_55447 - PLACE
      ?auto_55444 - HOIST
      ?auto_55449 - SURFACE
      ?auto_55448 - SURFACE
      ?auto_55452 - PLACE
      ?auto_55451 - HOIST
      ?auto_55455 - SURFACE
      ?auto_55453 - TRUCK
      ?auto_55457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55445 ?auto_55443 ) ( IS-CRATE ?auto_55441 ) ( not ( = ?auto_55441 ?auto_55442 ) ) ( not ( = ?auto_55456 ?auto_55443 ) ) ( HOIST-AT ?auto_55450 ?auto_55456 ) ( not ( = ?auto_55445 ?auto_55450 ) ) ( AVAILABLE ?auto_55450 ) ( SURFACE-AT ?auto_55441 ?auto_55456 ) ( ON ?auto_55441 ?auto_55446 ) ( CLEAR ?auto_55441 ) ( not ( = ?auto_55441 ?auto_55446 ) ) ( not ( = ?auto_55442 ?auto_55446 ) ) ( IS-CRATE ?auto_55442 ) ( not ( = ?auto_55441 ?auto_55454 ) ) ( not ( = ?auto_55442 ?auto_55454 ) ) ( not ( = ?auto_55446 ?auto_55454 ) ) ( not ( = ?auto_55447 ?auto_55443 ) ) ( not ( = ?auto_55456 ?auto_55447 ) ) ( HOIST-AT ?auto_55444 ?auto_55447 ) ( not ( = ?auto_55445 ?auto_55444 ) ) ( not ( = ?auto_55450 ?auto_55444 ) ) ( AVAILABLE ?auto_55444 ) ( SURFACE-AT ?auto_55442 ?auto_55447 ) ( ON ?auto_55442 ?auto_55449 ) ( CLEAR ?auto_55442 ) ( not ( = ?auto_55441 ?auto_55449 ) ) ( not ( = ?auto_55442 ?auto_55449 ) ) ( not ( = ?auto_55446 ?auto_55449 ) ) ( not ( = ?auto_55454 ?auto_55449 ) ) ( IS-CRATE ?auto_55454 ) ( not ( = ?auto_55441 ?auto_55448 ) ) ( not ( = ?auto_55442 ?auto_55448 ) ) ( not ( = ?auto_55446 ?auto_55448 ) ) ( not ( = ?auto_55454 ?auto_55448 ) ) ( not ( = ?auto_55449 ?auto_55448 ) ) ( not ( = ?auto_55452 ?auto_55443 ) ) ( not ( = ?auto_55456 ?auto_55452 ) ) ( not ( = ?auto_55447 ?auto_55452 ) ) ( HOIST-AT ?auto_55451 ?auto_55452 ) ( not ( = ?auto_55445 ?auto_55451 ) ) ( not ( = ?auto_55450 ?auto_55451 ) ) ( not ( = ?auto_55444 ?auto_55451 ) ) ( AVAILABLE ?auto_55451 ) ( SURFACE-AT ?auto_55454 ?auto_55452 ) ( ON ?auto_55454 ?auto_55455 ) ( CLEAR ?auto_55454 ) ( not ( = ?auto_55441 ?auto_55455 ) ) ( not ( = ?auto_55442 ?auto_55455 ) ) ( not ( = ?auto_55446 ?auto_55455 ) ) ( not ( = ?auto_55454 ?auto_55455 ) ) ( not ( = ?auto_55449 ?auto_55455 ) ) ( not ( = ?auto_55448 ?auto_55455 ) ) ( TRUCK-AT ?auto_55453 ?auto_55443 ) ( SURFACE-AT ?auto_55457 ?auto_55443 ) ( CLEAR ?auto_55457 ) ( LIFTING ?auto_55445 ?auto_55448 ) ( IS-CRATE ?auto_55448 ) ( not ( = ?auto_55441 ?auto_55457 ) ) ( not ( = ?auto_55442 ?auto_55457 ) ) ( not ( = ?auto_55446 ?auto_55457 ) ) ( not ( = ?auto_55454 ?auto_55457 ) ) ( not ( = ?auto_55449 ?auto_55457 ) ) ( not ( = ?auto_55448 ?auto_55457 ) ) ( not ( = ?auto_55455 ?auto_55457 ) ) )
    :subtasks
    ( ( !DROP ?auto_55445 ?auto_55448 ?auto_55457 ?auto_55443 )
      ( MAKE-ON ?auto_55441 ?auto_55442 )
      ( MAKE-ON-VERIFY ?auto_55441 ?auto_55442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55458 - SURFACE
      ?auto_55459 - SURFACE
    )
    :vars
    (
      ?auto_55473 - HOIST
      ?auto_55471 - PLACE
      ?auto_55467 - PLACE
      ?auto_55462 - HOIST
      ?auto_55469 - SURFACE
      ?auto_55470 - SURFACE
      ?auto_55461 - PLACE
      ?auto_55460 - HOIST
      ?auto_55464 - SURFACE
      ?auto_55463 - SURFACE
      ?auto_55472 - PLACE
      ?auto_55474 - HOIST
      ?auto_55468 - SURFACE
      ?auto_55465 - TRUCK
      ?auto_55466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55473 ?auto_55471 ) ( IS-CRATE ?auto_55458 ) ( not ( = ?auto_55458 ?auto_55459 ) ) ( not ( = ?auto_55467 ?auto_55471 ) ) ( HOIST-AT ?auto_55462 ?auto_55467 ) ( not ( = ?auto_55473 ?auto_55462 ) ) ( AVAILABLE ?auto_55462 ) ( SURFACE-AT ?auto_55458 ?auto_55467 ) ( ON ?auto_55458 ?auto_55469 ) ( CLEAR ?auto_55458 ) ( not ( = ?auto_55458 ?auto_55469 ) ) ( not ( = ?auto_55459 ?auto_55469 ) ) ( IS-CRATE ?auto_55459 ) ( not ( = ?auto_55458 ?auto_55470 ) ) ( not ( = ?auto_55459 ?auto_55470 ) ) ( not ( = ?auto_55469 ?auto_55470 ) ) ( not ( = ?auto_55461 ?auto_55471 ) ) ( not ( = ?auto_55467 ?auto_55461 ) ) ( HOIST-AT ?auto_55460 ?auto_55461 ) ( not ( = ?auto_55473 ?auto_55460 ) ) ( not ( = ?auto_55462 ?auto_55460 ) ) ( AVAILABLE ?auto_55460 ) ( SURFACE-AT ?auto_55459 ?auto_55461 ) ( ON ?auto_55459 ?auto_55464 ) ( CLEAR ?auto_55459 ) ( not ( = ?auto_55458 ?auto_55464 ) ) ( not ( = ?auto_55459 ?auto_55464 ) ) ( not ( = ?auto_55469 ?auto_55464 ) ) ( not ( = ?auto_55470 ?auto_55464 ) ) ( IS-CRATE ?auto_55470 ) ( not ( = ?auto_55458 ?auto_55463 ) ) ( not ( = ?auto_55459 ?auto_55463 ) ) ( not ( = ?auto_55469 ?auto_55463 ) ) ( not ( = ?auto_55470 ?auto_55463 ) ) ( not ( = ?auto_55464 ?auto_55463 ) ) ( not ( = ?auto_55472 ?auto_55471 ) ) ( not ( = ?auto_55467 ?auto_55472 ) ) ( not ( = ?auto_55461 ?auto_55472 ) ) ( HOIST-AT ?auto_55474 ?auto_55472 ) ( not ( = ?auto_55473 ?auto_55474 ) ) ( not ( = ?auto_55462 ?auto_55474 ) ) ( not ( = ?auto_55460 ?auto_55474 ) ) ( AVAILABLE ?auto_55474 ) ( SURFACE-AT ?auto_55470 ?auto_55472 ) ( ON ?auto_55470 ?auto_55468 ) ( CLEAR ?auto_55470 ) ( not ( = ?auto_55458 ?auto_55468 ) ) ( not ( = ?auto_55459 ?auto_55468 ) ) ( not ( = ?auto_55469 ?auto_55468 ) ) ( not ( = ?auto_55470 ?auto_55468 ) ) ( not ( = ?auto_55464 ?auto_55468 ) ) ( not ( = ?auto_55463 ?auto_55468 ) ) ( TRUCK-AT ?auto_55465 ?auto_55471 ) ( SURFACE-AT ?auto_55466 ?auto_55471 ) ( CLEAR ?auto_55466 ) ( IS-CRATE ?auto_55463 ) ( not ( = ?auto_55458 ?auto_55466 ) ) ( not ( = ?auto_55459 ?auto_55466 ) ) ( not ( = ?auto_55469 ?auto_55466 ) ) ( not ( = ?auto_55470 ?auto_55466 ) ) ( not ( = ?auto_55464 ?auto_55466 ) ) ( not ( = ?auto_55463 ?auto_55466 ) ) ( not ( = ?auto_55468 ?auto_55466 ) ) ( AVAILABLE ?auto_55473 ) ( IN ?auto_55463 ?auto_55465 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55473 ?auto_55463 ?auto_55465 ?auto_55471 )
      ( MAKE-ON ?auto_55458 ?auto_55459 )
      ( MAKE-ON-VERIFY ?auto_55458 ?auto_55459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55475 - SURFACE
      ?auto_55476 - SURFACE
    )
    :vars
    (
      ?auto_55486 - HOIST
      ?auto_55481 - PLACE
      ?auto_55477 - PLACE
      ?auto_55483 - HOIST
      ?auto_55482 - SURFACE
      ?auto_55485 - SURFACE
      ?auto_55487 - PLACE
      ?auto_55479 - HOIST
      ?auto_55488 - SURFACE
      ?auto_55478 - SURFACE
      ?auto_55480 - PLACE
      ?auto_55484 - HOIST
      ?auto_55490 - SURFACE
      ?auto_55489 - SURFACE
      ?auto_55491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55486 ?auto_55481 ) ( IS-CRATE ?auto_55475 ) ( not ( = ?auto_55475 ?auto_55476 ) ) ( not ( = ?auto_55477 ?auto_55481 ) ) ( HOIST-AT ?auto_55483 ?auto_55477 ) ( not ( = ?auto_55486 ?auto_55483 ) ) ( AVAILABLE ?auto_55483 ) ( SURFACE-AT ?auto_55475 ?auto_55477 ) ( ON ?auto_55475 ?auto_55482 ) ( CLEAR ?auto_55475 ) ( not ( = ?auto_55475 ?auto_55482 ) ) ( not ( = ?auto_55476 ?auto_55482 ) ) ( IS-CRATE ?auto_55476 ) ( not ( = ?auto_55475 ?auto_55485 ) ) ( not ( = ?auto_55476 ?auto_55485 ) ) ( not ( = ?auto_55482 ?auto_55485 ) ) ( not ( = ?auto_55487 ?auto_55481 ) ) ( not ( = ?auto_55477 ?auto_55487 ) ) ( HOIST-AT ?auto_55479 ?auto_55487 ) ( not ( = ?auto_55486 ?auto_55479 ) ) ( not ( = ?auto_55483 ?auto_55479 ) ) ( AVAILABLE ?auto_55479 ) ( SURFACE-AT ?auto_55476 ?auto_55487 ) ( ON ?auto_55476 ?auto_55488 ) ( CLEAR ?auto_55476 ) ( not ( = ?auto_55475 ?auto_55488 ) ) ( not ( = ?auto_55476 ?auto_55488 ) ) ( not ( = ?auto_55482 ?auto_55488 ) ) ( not ( = ?auto_55485 ?auto_55488 ) ) ( IS-CRATE ?auto_55485 ) ( not ( = ?auto_55475 ?auto_55478 ) ) ( not ( = ?auto_55476 ?auto_55478 ) ) ( not ( = ?auto_55482 ?auto_55478 ) ) ( not ( = ?auto_55485 ?auto_55478 ) ) ( not ( = ?auto_55488 ?auto_55478 ) ) ( not ( = ?auto_55480 ?auto_55481 ) ) ( not ( = ?auto_55477 ?auto_55480 ) ) ( not ( = ?auto_55487 ?auto_55480 ) ) ( HOIST-AT ?auto_55484 ?auto_55480 ) ( not ( = ?auto_55486 ?auto_55484 ) ) ( not ( = ?auto_55483 ?auto_55484 ) ) ( not ( = ?auto_55479 ?auto_55484 ) ) ( AVAILABLE ?auto_55484 ) ( SURFACE-AT ?auto_55485 ?auto_55480 ) ( ON ?auto_55485 ?auto_55490 ) ( CLEAR ?auto_55485 ) ( not ( = ?auto_55475 ?auto_55490 ) ) ( not ( = ?auto_55476 ?auto_55490 ) ) ( not ( = ?auto_55482 ?auto_55490 ) ) ( not ( = ?auto_55485 ?auto_55490 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( not ( = ?auto_55478 ?auto_55490 ) ) ( SURFACE-AT ?auto_55489 ?auto_55481 ) ( CLEAR ?auto_55489 ) ( IS-CRATE ?auto_55478 ) ( not ( = ?auto_55475 ?auto_55489 ) ) ( not ( = ?auto_55476 ?auto_55489 ) ) ( not ( = ?auto_55482 ?auto_55489 ) ) ( not ( = ?auto_55485 ?auto_55489 ) ) ( not ( = ?auto_55488 ?auto_55489 ) ) ( not ( = ?auto_55478 ?auto_55489 ) ) ( not ( = ?auto_55490 ?auto_55489 ) ) ( AVAILABLE ?auto_55486 ) ( IN ?auto_55478 ?auto_55491 ) ( TRUCK-AT ?auto_55491 ?auto_55480 ) )
    :subtasks
    ( ( !DRIVE ?auto_55491 ?auto_55480 ?auto_55481 )
      ( MAKE-ON ?auto_55475 ?auto_55476 )
      ( MAKE-ON-VERIFY ?auto_55475 ?auto_55476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55492 - SURFACE
      ?auto_55493 - SURFACE
    )
    :vars
    (
      ?auto_55499 - HOIST
      ?auto_55508 - PLACE
      ?auto_55504 - PLACE
      ?auto_55503 - HOIST
      ?auto_55501 - SURFACE
      ?auto_55494 - SURFACE
      ?auto_55495 - PLACE
      ?auto_55506 - HOIST
      ?auto_55507 - SURFACE
      ?auto_55498 - SURFACE
      ?auto_55502 - PLACE
      ?auto_55496 - HOIST
      ?auto_55500 - SURFACE
      ?auto_55505 - SURFACE
      ?auto_55497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55499 ?auto_55508 ) ( IS-CRATE ?auto_55492 ) ( not ( = ?auto_55492 ?auto_55493 ) ) ( not ( = ?auto_55504 ?auto_55508 ) ) ( HOIST-AT ?auto_55503 ?auto_55504 ) ( not ( = ?auto_55499 ?auto_55503 ) ) ( AVAILABLE ?auto_55503 ) ( SURFACE-AT ?auto_55492 ?auto_55504 ) ( ON ?auto_55492 ?auto_55501 ) ( CLEAR ?auto_55492 ) ( not ( = ?auto_55492 ?auto_55501 ) ) ( not ( = ?auto_55493 ?auto_55501 ) ) ( IS-CRATE ?auto_55493 ) ( not ( = ?auto_55492 ?auto_55494 ) ) ( not ( = ?auto_55493 ?auto_55494 ) ) ( not ( = ?auto_55501 ?auto_55494 ) ) ( not ( = ?auto_55495 ?auto_55508 ) ) ( not ( = ?auto_55504 ?auto_55495 ) ) ( HOIST-AT ?auto_55506 ?auto_55495 ) ( not ( = ?auto_55499 ?auto_55506 ) ) ( not ( = ?auto_55503 ?auto_55506 ) ) ( AVAILABLE ?auto_55506 ) ( SURFACE-AT ?auto_55493 ?auto_55495 ) ( ON ?auto_55493 ?auto_55507 ) ( CLEAR ?auto_55493 ) ( not ( = ?auto_55492 ?auto_55507 ) ) ( not ( = ?auto_55493 ?auto_55507 ) ) ( not ( = ?auto_55501 ?auto_55507 ) ) ( not ( = ?auto_55494 ?auto_55507 ) ) ( IS-CRATE ?auto_55494 ) ( not ( = ?auto_55492 ?auto_55498 ) ) ( not ( = ?auto_55493 ?auto_55498 ) ) ( not ( = ?auto_55501 ?auto_55498 ) ) ( not ( = ?auto_55494 ?auto_55498 ) ) ( not ( = ?auto_55507 ?auto_55498 ) ) ( not ( = ?auto_55502 ?auto_55508 ) ) ( not ( = ?auto_55504 ?auto_55502 ) ) ( not ( = ?auto_55495 ?auto_55502 ) ) ( HOIST-AT ?auto_55496 ?auto_55502 ) ( not ( = ?auto_55499 ?auto_55496 ) ) ( not ( = ?auto_55503 ?auto_55496 ) ) ( not ( = ?auto_55506 ?auto_55496 ) ) ( SURFACE-AT ?auto_55494 ?auto_55502 ) ( ON ?auto_55494 ?auto_55500 ) ( CLEAR ?auto_55494 ) ( not ( = ?auto_55492 ?auto_55500 ) ) ( not ( = ?auto_55493 ?auto_55500 ) ) ( not ( = ?auto_55501 ?auto_55500 ) ) ( not ( = ?auto_55494 ?auto_55500 ) ) ( not ( = ?auto_55507 ?auto_55500 ) ) ( not ( = ?auto_55498 ?auto_55500 ) ) ( SURFACE-AT ?auto_55505 ?auto_55508 ) ( CLEAR ?auto_55505 ) ( IS-CRATE ?auto_55498 ) ( not ( = ?auto_55492 ?auto_55505 ) ) ( not ( = ?auto_55493 ?auto_55505 ) ) ( not ( = ?auto_55501 ?auto_55505 ) ) ( not ( = ?auto_55494 ?auto_55505 ) ) ( not ( = ?auto_55507 ?auto_55505 ) ) ( not ( = ?auto_55498 ?auto_55505 ) ) ( not ( = ?auto_55500 ?auto_55505 ) ) ( AVAILABLE ?auto_55499 ) ( TRUCK-AT ?auto_55497 ?auto_55502 ) ( LIFTING ?auto_55496 ?auto_55498 ) )
    :subtasks
    ( ( !LOAD ?auto_55496 ?auto_55498 ?auto_55497 ?auto_55502 )
      ( MAKE-ON ?auto_55492 ?auto_55493 )
      ( MAKE-ON-VERIFY ?auto_55492 ?auto_55493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55509 - SURFACE
      ?auto_55510 - SURFACE
    )
    :vars
    (
      ?auto_55516 - HOIST
      ?auto_55518 - PLACE
      ?auto_55525 - PLACE
      ?auto_55512 - HOIST
      ?auto_55522 - SURFACE
      ?auto_55521 - SURFACE
      ?auto_55523 - PLACE
      ?auto_55513 - HOIST
      ?auto_55520 - SURFACE
      ?auto_55524 - SURFACE
      ?auto_55517 - PLACE
      ?auto_55515 - HOIST
      ?auto_55519 - SURFACE
      ?auto_55514 - SURFACE
      ?auto_55511 - TRUCK
      ?auto_55526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55516 ?auto_55518 ) ( IS-CRATE ?auto_55509 ) ( not ( = ?auto_55509 ?auto_55510 ) ) ( not ( = ?auto_55525 ?auto_55518 ) ) ( HOIST-AT ?auto_55512 ?auto_55525 ) ( not ( = ?auto_55516 ?auto_55512 ) ) ( AVAILABLE ?auto_55512 ) ( SURFACE-AT ?auto_55509 ?auto_55525 ) ( ON ?auto_55509 ?auto_55522 ) ( CLEAR ?auto_55509 ) ( not ( = ?auto_55509 ?auto_55522 ) ) ( not ( = ?auto_55510 ?auto_55522 ) ) ( IS-CRATE ?auto_55510 ) ( not ( = ?auto_55509 ?auto_55521 ) ) ( not ( = ?auto_55510 ?auto_55521 ) ) ( not ( = ?auto_55522 ?auto_55521 ) ) ( not ( = ?auto_55523 ?auto_55518 ) ) ( not ( = ?auto_55525 ?auto_55523 ) ) ( HOIST-AT ?auto_55513 ?auto_55523 ) ( not ( = ?auto_55516 ?auto_55513 ) ) ( not ( = ?auto_55512 ?auto_55513 ) ) ( AVAILABLE ?auto_55513 ) ( SURFACE-AT ?auto_55510 ?auto_55523 ) ( ON ?auto_55510 ?auto_55520 ) ( CLEAR ?auto_55510 ) ( not ( = ?auto_55509 ?auto_55520 ) ) ( not ( = ?auto_55510 ?auto_55520 ) ) ( not ( = ?auto_55522 ?auto_55520 ) ) ( not ( = ?auto_55521 ?auto_55520 ) ) ( IS-CRATE ?auto_55521 ) ( not ( = ?auto_55509 ?auto_55524 ) ) ( not ( = ?auto_55510 ?auto_55524 ) ) ( not ( = ?auto_55522 ?auto_55524 ) ) ( not ( = ?auto_55521 ?auto_55524 ) ) ( not ( = ?auto_55520 ?auto_55524 ) ) ( not ( = ?auto_55517 ?auto_55518 ) ) ( not ( = ?auto_55525 ?auto_55517 ) ) ( not ( = ?auto_55523 ?auto_55517 ) ) ( HOIST-AT ?auto_55515 ?auto_55517 ) ( not ( = ?auto_55516 ?auto_55515 ) ) ( not ( = ?auto_55512 ?auto_55515 ) ) ( not ( = ?auto_55513 ?auto_55515 ) ) ( SURFACE-AT ?auto_55521 ?auto_55517 ) ( ON ?auto_55521 ?auto_55519 ) ( CLEAR ?auto_55521 ) ( not ( = ?auto_55509 ?auto_55519 ) ) ( not ( = ?auto_55510 ?auto_55519 ) ) ( not ( = ?auto_55522 ?auto_55519 ) ) ( not ( = ?auto_55521 ?auto_55519 ) ) ( not ( = ?auto_55520 ?auto_55519 ) ) ( not ( = ?auto_55524 ?auto_55519 ) ) ( SURFACE-AT ?auto_55514 ?auto_55518 ) ( CLEAR ?auto_55514 ) ( IS-CRATE ?auto_55524 ) ( not ( = ?auto_55509 ?auto_55514 ) ) ( not ( = ?auto_55510 ?auto_55514 ) ) ( not ( = ?auto_55522 ?auto_55514 ) ) ( not ( = ?auto_55521 ?auto_55514 ) ) ( not ( = ?auto_55520 ?auto_55514 ) ) ( not ( = ?auto_55524 ?auto_55514 ) ) ( not ( = ?auto_55519 ?auto_55514 ) ) ( AVAILABLE ?auto_55516 ) ( TRUCK-AT ?auto_55511 ?auto_55517 ) ( AVAILABLE ?auto_55515 ) ( SURFACE-AT ?auto_55524 ?auto_55517 ) ( ON ?auto_55524 ?auto_55526 ) ( CLEAR ?auto_55524 ) ( not ( = ?auto_55509 ?auto_55526 ) ) ( not ( = ?auto_55510 ?auto_55526 ) ) ( not ( = ?auto_55522 ?auto_55526 ) ) ( not ( = ?auto_55521 ?auto_55526 ) ) ( not ( = ?auto_55520 ?auto_55526 ) ) ( not ( = ?auto_55524 ?auto_55526 ) ) ( not ( = ?auto_55519 ?auto_55526 ) ) ( not ( = ?auto_55514 ?auto_55526 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55515 ?auto_55524 ?auto_55526 ?auto_55517 )
      ( MAKE-ON ?auto_55509 ?auto_55510 )
      ( MAKE-ON-VERIFY ?auto_55509 ?auto_55510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55527 - SURFACE
      ?auto_55528 - SURFACE
    )
    :vars
    (
      ?auto_55541 - HOIST
      ?auto_55529 - PLACE
      ?auto_55542 - PLACE
      ?auto_55530 - HOIST
      ?auto_55532 - SURFACE
      ?auto_55531 - SURFACE
      ?auto_55538 - PLACE
      ?auto_55540 - HOIST
      ?auto_55535 - SURFACE
      ?auto_55543 - SURFACE
      ?auto_55536 - PLACE
      ?auto_55544 - HOIST
      ?auto_55534 - SURFACE
      ?auto_55537 - SURFACE
      ?auto_55539 - SURFACE
      ?auto_55533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55541 ?auto_55529 ) ( IS-CRATE ?auto_55527 ) ( not ( = ?auto_55527 ?auto_55528 ) ) ( not ( = ?auto_55542 ?auto_55529 ) ) ( HOIST-AT ?auto_55530 ?auto_55542 ) ( not ( = ?auto_55541 ?auto_55530 ) ) ( AVAILABLE ?auto_55530 ) ( SURFACE-AT ?auto_55527 ?auto_55542 ) ( ON ?auto_55527 ?auto_55532 ) ( CLEAR ?auto_55527 ) ( not ( = ?auto_55527 ?auto_55532 ) ) ( not ( = ?auto_55528 ?auto_55532 ) ) ( IS-CRATE ?auto_55528 ) ( not ( = ?auto_55527 ?auto_55531 ) ) ( not ( = ?auto_55528 ?auto_55531 ) ) ( not ( = ?auto_55532 ?auto_55531 ) ) ( not ( = ?auto_55538 ?auto_55529 ) ) ( not ( = ?auto_55542 ?auto_55538 ) ) ( HOIST-AT ?auto_55540 ?auto_55538 ) ( not ( = ?auto_55541 ?auto_55540 ) ) ( not ( = ?auto_55530 ?auto_55540 ) ) ( AVAILABLE ?auto_55540 ) ( SURFACE-AT ?auto_55528 ?auto_55538 ) ( ON ?auto_55528 ?auto_55535 ) ( CLEAR ?auto_55528 ) ( not ( = ?auto_55527 ?auto_55535 ) ) ( not ( = ?auto_55528 ?auto_55535 ) ) ( not ( = ?auto_55532 ?auto_55535 ) ) ( not ( = ?auto_55531 ?auto_55535 ) ) ( IS-CRATE ?auto_55531 ) ( not ( = ?auto_55527 ?auto_55543 ) ) ( not ( = ?auto_55528 ?auto_55543 ) ) ( not ( = ?auto_55532 ?auto_55543 ) ) ( not ( = ?auto_55531 ?auto_55543 ) ) ( not ( = ?auto_55535 ?auto_55543 ) ) ( not ( = ?auto_55536 ?auto_55529 ) ) ( not ( = ?auto_55542 ?auto_55536 ) ) ( not ( = ?auto_55538 ?auto_55536 ) ) ( HOIST-AT ?auto_55544 ?auto_55536 ) ( not ( = ?auto_55541 ?auto_55544 ) ) ( not ( = ?auto_55530 ?auto_55544 ) ) ( not ( = ?auto_55540 ?auto_55544 ) ) ( SURFACE-AT ?auto_55531 ?auto_55536 ) ( ON ?auto_55531 ?auto_55534 ) ( CLEAR ?auto_55531 ) ( not ( = ?auto_55527 ?auto_55534 ) ) ( not ( = ?auto_55528 ?auto_55534 ) ) ( not ( = ?auto_55532 ?auto_55534 ) ) ( not ( = ?auto_55531 ?auto_55534 ) ) ( not ( = ?auto_55535 ?auto_55534 ) ) ( not ( = ?auto_55543 ?auto_55534 ) ) ( SURFACE-AT ?auto_55537 ?auto_55529 ) ( CLEAR ?auto_55537 ) ( IS-CRATE ?auto_55543 ) ( not ( = ?auto_55527 ?auto_55537 ) ) ( not ( = ?auto_55528 ?auto_55537 ) ) ( not ( = ?auto_55532 ?auto_55537 ) ) ( not ( = ?auto_55531 ?auto_55537 ) ) ( not ( = ?auto_55535 ?auto_55537 ) ) ( not ( = ?auto_55543 ?auto_55537 ) ) ( not ( = ?auto_55534 ?auto_55537 ) ) ( AVAILABLE ?auto_55541 ) ( AVAILABLE ?auto_55544 ) ( SURFACE-AT ?auto_55543 ?auto_55536 ) ( ON ?auto_55543 ?auto_55539 ) ( CLEAR ?auto_55543 ) ( not ( = ?auto_55527 ?auto_55539 ) ) ( not ( = ?auto_55528 ?auto_55539 ) ) ( not ( = ?auto_55532 ?auto_55539 ) ) ( not ( = ?auto_55531 ?auto_55539 ) ) ( not ( = ?auto_55535 ?auto_55539 ) ) ( not ( = ?auto_55543 ?auto_55539 ) ) ( not ( = ?auto_55534 ?auto_55539 ) ) ( not ( = ?auto_55537 ?auto_55539 ) ) ( TRUCK-AT ?auto_55533 ?auto_55529 ) )
    :subtasks
    ( ( !DRIVE ?auto_55533 ?auto_55529 ?auto_55536 )
      ( MAKE-ON ?auto_55527 ?auto_55528 )
      ( MAKE-ON-VERIFY ?auto_55527 ?auto_55528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55547 - SURFACE
      ?auto_55548 - SURFACE
    )
    :vars
    (
      ?auto_55549 - HOIST
      ?auto_55550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55549 ?auto_55550 ) ( SURFACE-AT ?auto_55548 ?auto_55550 ) ( CLEAR ?auto_55548 ) ( LIFTING ?auto_55549 ?auto_55547 ) ( IS-CRATE ?auto_55547 ) ( not ( = ?auto_55547 ?auto_55548 ) ) )
    :subtasks
    ( ( !DROP ?auto_55549 ?auto_55547 ?auto_55548 ?auto_55550 )
      ( MAKE-ON-VERIFY ?auto_55547 ?auto_55548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55551 - SURFACE
      ?auto_55552 - SURFACE
    )
    :vars
    (
      ?auto_55554 - HOIST
      ?auto_55553 - PLACE
      ?auto_55555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55554 ?auto_55553 ) ( SURFACE-AT ?auto_55552 ?auto_55553 ) ( CLEAR ?auto_55552 ) ( IS-CRATE ?auto_55551 ) ( not ( = ?auto_55551 ?auto_55552 ) ) ( TRUCK-AT ?auto_55555 ?auto_55553 ) ( AVAILABLE ?auto_55554 ) ( IN ?auto_55551 ?auto_55555 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55554 ?auto_55551 ?auto_55555 ?auto_55553 )
      ( MAKE-ON ?auto_55551 ?auto_55552 )
      ( MAKE-ON-VERIFY ?auto_55551 ?auto_55552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55556 - SURFACE
      ?auto_55557 - SURFACE
    )
    :vars
    (
      ?auto_55559 - HOIST
      ?auto_55558 - PLACE
      ?auto_55560 - TRUCK
      ?auto_55561 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55559 ?auto_55558 ) ( SURFACE-AT ?auto_55557 ?auto_55558 ) ( CLEAR ?auto_55557 ) ( IS-CRATE ?auto_55556 ) ( not ( = ?auto_55556 ?auto_55557 ) ) ( AVAILABLE ?auto_55559 ) ( IN ?auto_55556 ?auto_55560 ) ( TRUCK-AT ?auto_55560 ?auto_55561 ) ( not ( = ?auto_55561 ?auto_55558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55560 ?auto_55561 ?auto_55558 )
      ( MAKE-ON ?auto_55556 ?auto_55557 )
      ( MAKE-ON-VERIFY ?auto_55556 ?auto_55557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55562 - SURFACE
      ?auto_55563 - SURFACE
    )
    :vars
    (
      ?auto_55565 - HOIST
      ?auto_55566 - PLACE
      ?auto_55567 - TRUCK
      ?auto_55564 - PLACE
      ?auto_55568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55565 ?auto_55566 ) ( SURFACE-AT ?auto_55563 ?auto_55566 ) ( CLEAR ?auto_55563 ) ( IS-CRATE ?auto_55562 ) ( not ( = ?auto_55562 ?auto_55563 ) ) ( AVAILABLE ?auto_55565 ) ( TRUCK-AT ?auto_55567 ?auto_55564 ) ( not ( = ?auto_55564 ?auto_55566 ) ) ( HOIST-AT ?auto_55568 ?auto_55564 ) ( LIFTING ?auto_55568 ?auto_55562 ) ( not ( = ?auto_55565 ?auto_55568 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55568 ?auto_55562 ?auto_55567 ?auto_55564 )
      ( MAKE-ON ?auto_55562 ?auto_55563 )
      ( MAKE-ON-VERIFY ?auto_55562 ?auto_55563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55569 - SURFACE
      ?auto_55570 - SURFACE
    )
    :vars
    (
      ?auto_55574 - HOIST
      ?auto_55575 - PLACE
      ?auto_55573 - TRUCK
      ?auto_55571 - PLACE
      ?auto_55572 - HOIST
      ?auto_55576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55574 ?auto_55575 ) ( SURFACE-AT ?auto_55570 ?auto_55575 ) ( CLEAR ?auto_55570 ) ( IS-CRATE ?auto_55569 ) ( not ( = ?auto_55569 ?auto_55570 ) ) ( AVAILABLE ?auto_55574 ) ( TRUCK-AT ?auto_55573 ?auto_55571 ) ( not ( = ?auto_55571 ?auto_55575 ) ) ( HOIST-AT ?auto_55572 ?auto_55571 ) ( not ( = ?auto_55574 ?auto_55572 ) ) ( AVAILABLE ?auto_55572 ) ( SURFACE-AT ?auto_55569 ?auto_55571 ) ( ON ?auto_55569 ?auto_55576 ) ( CLEAR ?auto_55569 ) ( not ( = ?auto_55569 ?auto_55576 ) ) ( not ( = ?auto_55570 ?auto_55576 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55572 ?auto_55569 ?auto_55576 ?auto_55571 )
      ( MAKE-ON ?auto_55569 ?auto_55570 )
      ( MAKE-ON-VERIFY ?auto_55569 ?auto_55570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55577 - SURFACE
      ?auto_55578 - SURFACE
    )
    :vars
    (
      ?auto_55580 - HOIST
      ?auto_55582 - PLACE
      ?auto_55583 - PLACE
      ?auto_55581 - HOIST
      ?auto_55579 - SURFACE
      ?auto_55584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55580 ?auto_55582 ) ( SURFACE-AT ?auto_55578 ?auto_55582 ) ( CLEAR ?auto_55578 ) ( IS-CRATE ?auto_55577 ) ( not ( = ?auto_55577 ?auto_55578 ) ) ( AVAILABLE ?auto_55580 ) ( not ( = ?auto_55583 ?auto_55582 ) ) ( HOIST-AT ?auto_55581 ?auto_55583 ) ( not ( = ?auto_55580 ?auto_55581 ) ) ( AVAILABLE ?auto_55581 ) ( SURFACE-AT ?auto_55577 ?auto_55583 ) ( ON ?auto_55577 ?auto_55579 ) ( CLEAR ?auto_55577 ) ( not ( = ?auto_55577 ?auto_55579 ) ) ( not ( = ?auto_55578 ?auto_55579 ) ) ( TRUCK-AT ?auto_55584 ?auto_55582 ) )
    :subtasks
    ( ( !DRIVE ?auto_55584 ?auto_55582 ?auto_55583 )
      ( MAKE-ON ?auto_55577 ?auto_55578 )
      ( MAKE-ON-VERIFY ?auto_55577 ?auto_55578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55585 - SURFACE
      ?auto_55586 - SURFACE
    )
    :vars
    (
      ?auto_55591 - HOIST
      ?auto_55587 - PLACE
      ?auto_55590 - PLACE
      ?auto_55592 - HOIST
      ?auto_55589 - SURFACE
      ?auto_55588 - TRUCK
      ?auto_55593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55591 ?auto_55587 ) ( IS-CRATE ?auto_55585 ) ( not ( = ?auto_55585 ?auto_55586 ) ) ( not ( = ?auto_55590 ?auto_55587 ) ) ( HOIST-AT ?auto_55592 ?auto_55590 ) ( not ( = ?auto_55591 ?auto_55592 ) ) ( AVAILABLE ?auto_55592 ) ( SURFACE-AT ?auto_55585 ?auto_55590 ) ( ON ?auto_55585 ?auto_55589 ) ( CLEAR ?auto_55585 ) ( not ( = ?auto_55585 ?auto_55589 ) ) ( not ( = ?auto_55586 ?auto_55589 ) ) ( TRUCK-AT ?auto_55588 ?auto_55587 ) ( SURFACE-AT ?auto_55593 ?auto_55587 ) ( CLEAR ?auto_55593 ) ( LIFTING ?auto_55591 ?auto_55586 ) ( IS-CRATE ?auto_55586 ) ( not ( = ?auto_55585 ?auto_55593 ) ) ( not ( = ?auto_55586 ?auto_55593 ) ) ( not ( = ?auto_55589 ?auto_55593 ) ) )
    :subtasks
    ( ( !DROP ?auto_55591 ?auto_55586 ?auto_55593 ?auto_55587 )
      ( MAKE-ON ?auto_55585 ?auto_55586 )
      ( MAKE-ON-VERIFY ?auto_55585 ?auto_55586 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55594 - SURFACE
      ?auto_55595 - SURFACE
    )
    :vars
    (
      ?auto_55598 - HOIST
      ?auto_55599 - PLACE
      ?auto_55596 - PLACE
      ?auto_55597 - HOIST
      ?auto_55602 - SURFACE
      ?auto_55601 - TRUCK
      ?auto_55600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55598 ?auto_55599 ) ( IS-CRATE ?auto_55594 ) ( not ( = ?auto_55594 ?auto_55595 ) ) ( not ( = ?auto_55596 ?auto_55599 ) ) ( HOIST-AT ?auto_55597 ?auto_55596 ) ( not ( = ?auto_55598 ?auto_55597 ) ) ( AVAILABLE ?auto_55597 ) ( SURFACE-AT ?auto_55594 ?auto_55596 ) ( ON ?auto_55594 ?auto_55602 ) ( CLEAR ?auto_55594 ) ( not ( = ?auto_55594 ?auto_55602 ) ) ( not ( = ?auto_55595 ?auto_55602 ) ) ( TRUCK-AT ?auto_55601 ?auto_55599 ) ( SURFACE-AT ?auto_55600 ?auto_55599 ) ( CLEAR ?auto_55600 ) ( IS-CRATE ?auto_55595 ) ( not ( = ?auto_55594 ?auto_55600 ) ) ( not ( = ?auto_55595 ?auto_55600 ) ) ( not ( = ?auto_55602 ?auto_55600 ) ) ( AVAILABLE ?auto_55598 ) ( IN ?auto_55595 ?auto_55601 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55598 ?auto_55595 ?auto_55601 ?auto_55599 )
      ( MAKE-ON ?auto_55594 ?auto_55595 )
      ( MAKE-ON-VERIFY ?auto_55594 ?auto_55595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55603 - SURFACE
      ?auto_55604 - SURFACE
    )
    :vars
    (
      ?auto_55609 - HOIST
      ?auto_55607 - PLACE
      ?auto_55610 - PLACE
      ?auto_55608 - HOIST
      ?auto_55605 - SURFACE
      ?auto_55606 - SURFACE
      ?auto_55611 - TRUCK
      ?auto_55612 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55609 ?auto_55607 ) ( IS-CRATE ?auto_55603 ) ( not ( = ?auto_55603 ?auto_55604 ) ) ( not ( = ?auto_55610 ?auto_55607 ) ) ( HOIST-AT ?auto_55608 ?auto_55610 ) ( not ( = ?auto_55609 ?auto_55608 ) ) ( AVAILABLE ?auto_55608 ) ( SURFACE-AT ?auto_55603 ?auto_55610 ) ( ON ?auto_55603 ?auto_55605 ) ( CLEAR ?auto_55603 ) ( not ( = ?auto_55603 ?auto_55605 ) ) ( not ( = ?auto_55604 ?auto_55605 ) ) ( SURFACE-AT ?auto_55606 ?auto_55607 ) ( CLEAR ?auto_55606 ) ( IS-CRATE ?auto_55604 ) ( not ( = ?auto_55603 ?auto_55606 ) ) ( not ( = ?auto_55604 ?auto_55606 ) ) ( not ( = ?auto_55605 ?auto_55606 ) ) ( AVAILABLE ?auto_55609 ) ( IN ?auto_55604 ?auto_55611 ) ( TRUCK-AT ?auto_55611 ?auto_55612 ) ( not ( = ?auto_55612 ?auto_55607 ) ) ( not ( = ?auto_55610 ?auto_55612 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55611 ?auto_55612 ?auto_55607 )
      ( MAKE-ON ?auto_55603 ?auto_55604 )
      ( MAKE-ON-VERIFY ?auto_55603 ?auto_55604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55613 - SURFACE
      ?auto_55614 - SURFACE
    )
    :vars
    (
      ?auto_55619 - HOIST
      ?auto_55618 - PLACE
      ?auto_55615 - PLACE
      ?auto_55616 - HOIST
      ?auto_55620 - SURFACE
      ?auto_55617 - SURFACE
      ?auto_55621 - TRUCK
      ?auto_55622 - PLACE
      ?auto_55623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55619 ?auto_55618 ) ( IS-CRATE ?auto_55613 ) ( not ( = ?auto_55613 ?auto_55614 ) ) ( not ( = ?auto_55615 ?auto_55618 ) ) ( HOIST-AT ?auto_55616 ?auto_55615 ) ( not ( = ?auto_55619 ?auto_55616 ) ) ( AVAILABLE ?auto_55616 ) ( SURFACE-AT ?auto_55613 ?auto_55615 ) ( ON ?auto_55613 ?auto_55620 ) ( CLEAR ?auto_55613 ) ( not ( = ?auto_55613 ?auto_55620 ) ) ( not ( = ?auto_55614 ?auto_55620 ) ) ( SURFACE-AT ?auto_55617 ?auto_55618 ) ( CLEAR ?auto_55617 ) ( IS-CRATE ?auto_55614 ) ( not ( = ?auto_55613 ?auto_55617 ) ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( not ( = ?auto_55620 ?auto_55617 ) ) ( AVAILABLE ?auto_55619 ) ( TRUCK-AT ?auto_55621 ?auto_55622 ) ( not ( = ?auto_55622 ?auto_55618 ) ) ( not ( = ?auto_55615 ?auto_55622 ) ) ( HOIST-AT ?auto_55623 ?auto_55622 ) ( LIFTING ?auto_55623 ?auto_55614 ) ( not ( = ?auto_55619 ?auto_55623 ) ) ( not ( = ?auto_55616 ?auto_55623 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55623 ?auto_55614 ?auto_55621 ?auto_55622 )
      ( MAKE-ON ?auto_55613 ?auto_55614 )
      ( MAKE-ON-VERIFY ?auto_55613 ?auto_55614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55624 - SURFACE
      ?auto_55625 - SURFACE
    )
    :vars
    (
      ?auto_55628 - HOIST
      ?auto_55627 - PLACE
      ?auto_55632 - PLACE
      ?auto_55634 - HOIST
      ?auto_55626 - SURFACE
      ?auto_55631 - SURFACE
      ?auto_55629 - TRUCK
      ?auto_55630 - PLACE
      ?auto_55633 - HOIST
      ?auto_55635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55628 ?auto_55627 ) ( IS-CRATE ?auto_55624 ) ( not ( = ?auto_55624 ?auto_55625 ) ) ( not ( = ?auto_55632 ?auto_55627 ) ) ( HOIST-AT ?auto_55634 ?auto_55632 ) ( not ( = ?auto_55628 ?auto_55634 ) ) ( AVAILABLE ?auto_55634 ) ( SURFACE-AT ?auto_55624 ?auto_55632 ) ( ON ?auto_55624 ?auto_55626 ) ( CLEAR ?auto_55624 ) ( not ( = ?auto_55624 ?auto_55626 ) ) ( not ( = ?auto_55625 ?auto_55626 ) ) ( SURFACE-AT ?auto_55631 ?auto_55627 ) ( CLEAR ?auto_55631 ) ( IS-CRATE ?auto_55625 ) ( not ( = ?auto_55624 ?auto_55631 ) ) ( not ( = ?auto_55625 ?auto_55631 ) ) ( not ( = ?auto_55626 ?auto_55631 ) ) ( AVAILABLE ?auto_55628 ) ( TRUCK-AT ?auto_55629 ?auto_55630 ) ( not ( = ?auto_55630 ?auto_55627 ) ) ( not ( = ?auto_55632 ?auto_55630 ) ) ( HOIST-AT ?auto_55633 ?auto_55630 ) ( not ( = ?auto_55628 ?auto_55633 ) ) ( not ( = ?auto_55634 ?auto_55633 ) ) ( AVAILABLE ?auto_55633 ) ( SURFACE-AT ?auto_55625 ?auto_55630 ) ( ON ?auto_55625 ?auto_55635 ) ( CLEAR ?auto_55625 ) ( not ( = ?auto_55624 ?auto_55635 ) ) ( not ( = ?auto_55625 ?auto_55635 ) ) ( not ( = ?auto_55626 ?auto_55635 ) ) ( not ( = ?auto_55631 ?auto_55635 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55633 ?auto_55625 ?auto_55635 ?auto_55630 )
      ( MAKE-ON ?auto_55624 ?auto_55625 )
      ( MAKE-ON-VERIFY ?auto_55624 ?auto_55625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55636 - SURFACE
      ?auto_55637 - SURFACE
    )
    :vars
    (
      ?auto_55642 - HOIST
      ?auto_55644 - PLACE
      ?auto_55647 - PLACE
      ?auto_55640 - HOIST
      ?auto_55639 - SURFACE
      ?auto_55645 - SURFACE
      ?auto_55643 - PLACE
      ?auto_55641 - HOIST
      ?auto_55646 - SURFACE
      ?auto_55638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55642 ?auto_55644 ) ( IS-CRATE ?auto_55636 ) ( not ( = ?auto_55636 ?auto_55637 ) ) ( not ( = ?auto_55647 ?auto_55644 ) ) ( HOIST-AT ?auto_55640 ?auto_55647 ) ( not ( = ?auto_55642 ?auto_55640 ) ) ( AVAILABLE ?auto_55640 ) ( SURFACE-AT ?auto_55636 ?auto_55647 ) ( ON ?auto_55636 ?auto_55639 ) ( CLEAR ?auto_55636 ) ( not ( = ?auto_55636 ?auto_55639 ) ) ( not ( = ?auto_55637 ?auto_55639 ) ) ( SURFACE-AT ?auto_55645 ?auto_55644 ) ( CLEAR ?auto_55645 ) ( IS-CRATE ?auto_55637 ) ( not ( = ?auto_55636 ?auto_55645 ) ) ( not ( = ?auto_55637 ?auto_55645 ) ) ( not ( = ?auto_55639 ?auto_55645 ) ) ( AVAILABLE ?auto_55642 ) ( not ( = ?auto_55643 ?auto_55644 ) ) ( not ( = ?auto_55647 ?auto_55643 ) ) ( HOIST-AT ?auto_55641 ?auto_55643 ) ( not ( = ?auto_55642 ?auto_55641 ) ) ( not ( = ?auto_55640 ?auto_55641 ) ) ( AVAILABLE ?auto_55641 ) ( SURFACE-AT ?auto_55637 ?auto_55643 ) ( ON ?auto_55637 ?auto_55646 ) ( CLEAR ?auto_55637 ) ( not ( = ?auto_55636 ?auto_55646 ) ) ( not ( = ?auto_55637 ?auto_55646 ) ) ( not ( = ?auto_55639 ?auto_55646 ) ) ( not ( = ?auto_55645 ?auto_55646 ) ) ( TRUCK-AT ?auto_55638 ?auto_55644 ) )
    :subtasks
    ( ( !DRIVE ?auto_55638 ?auto_55644 ?auto_55643 )
      ( MAKE-ON ?auto_55636 ?auto_55637 )
      ( MAKE-ON-VERIFY ?auto_55636 ?auto_55637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55648 - SURFACE
      ?auto_55649 - SURFACE
    )
    :vars
    (
      ?auto_55653 - HOIST
      ?auto_55652 - PLACE
      ?auto_55658 - PLACE
      ?auto_55650 - HOIST
      ?auto_55659 - SURFACE
      ?auto_55657 - SURFACE
      ?auto_55655 - PLACE
      ?auto_55656 - HOIST
      ?auto_55651 - SURFACE
      ?auto_55654 - TRUCK
      ?auto_55660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55653 ?auto_55652 ) ( IS-CRATE ?auto_55648 ) ( not ( = ?auto_55648 ?auto_55649 ) ) ( not ( = ?auto_55658 ?auto_55652 ) ) ( HOIST-AT ?auto_55650 ?auto_55658 ) ( not ( = ?auto_55653 ?auto_55650 ) ) ( AVAILABLE ?auto_55650 ) ( SURFACE-AT ?auto_55648 ?auto_55658 ) ( ON ?auto_55648 ?auto_55659 ) ( CLEAR ?auto_55648 ) ( not ( = ?auto_55648 ?auto_55659 ) ) ( not ( = ?auto_55649 ?auto_55659 ) ) ( IS-CRATE ?auto_55649 ) ( not ( = ?auto_55648 ?auto_55657 ) ) ( not ( = ?auto_55649 ?auto_55657 ) ) ( not ( = ?auto_55659 ?auto_55657 ) ) ( not ( = ?auto_55655 ?auto_55652 ) ) ( not ( = ?auto_55658 ?auto_55655 ) ) ( HOIST-AT ?auto_55656 ?auto_55655 ) ( not ( = ?auto_55653 ?auto_55656 ) ) ( not ( = ?auto_55650 ?auto_55656 ) ) ( AVAILABLE ?auto_55656 ) ( SURFACE-AT ?auto_55649 ?auto_55655 ) ( ON ?auto_55649 ?auto_55651 ) ( CLEAR ?auto_55649 ) ( not ( = ?auto_55648 ?auto_55651 ) ) ( not ( = ?auto_55649 ?auto_55651 ) ) ( not ( = ?auto_55659 ?auto_55651 ) ) ( not ( = ?auto_55657 ?auto_55651 ) ) ( TRUCK-AT ?auto_55654 ?auto_55652 ) ( SURFACE-AT ?auto_55660 ?auto_55652 ) ( CLEAR ?auto_55660 ) ( LIFTING ?auto_55653 ?auto_55657 ) ( IS-CRATE ?auto_55657 ) ( not ( = ?auto_55648 ?auto_55660 ) ) ( not ( = ?auto_55649 ?auto_55660 ) ) ( not ( = ?auto_55659 ?auto_55660 ) ) ( not ( = ?auto_55657 ?auto_55660 ) ) ( not ( = ?auto_55651 ?auto_55660 ) ) )
    :subtasks
    ( ( !DROP ?auto_55653 ?auto_55657 ?auto_55660 ?auto_55652 )
      ( MAKE-ON ?auto_55648 ?auto_55649 )
      ( MAKE-ON-VERIFY ?auto_55648 ?auto_55649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55661 - SURFACE
      ?auto_55662 - SURFACE
    )
    :vars
    (
      ?auto_55672 - HOIST
      ?auto_55673 - PLACE
      ?auto_55668 - PLACE
      ?auto_55664 - HOIST
      ?auto_55666 - SURFACE
      ?auto_55663 - SURFACE
      ?auto_55669 - PLACE
      ?auto_55667 - HOIST
      ?auto_55670 - SURFACE
      ?auto_55671 - TRUCK
      ?auto_55665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55672 ?auto_55673 ) ( IS-CRATE ?auto_55661 ) ( not ( = ?auto_55661 ?auto_55662 ) ) ( not ( = ?auto_55668 ?auto_55673 ) ) ( HOIST-AT ?auto_55664 ?auto_55668 ) ( not ( = ?auto_55672 ?auto_55664 ) ) ( AVAILABLE ?auto_55664 ) ( SURFACE-AT ?auto_55661 ?auto_55668 ) ( ON ?auto_55661 ?auto_55666 ) ( CLEAR ?auto_55661 ) ( not ( = ?auto_55661 ?auto_55666 ) ) ( not ( = ?auto_55662 ?auto_55666 ) ) ( IS-CRATE ?auto_55662 ) ( not ( = ?auto_55661 ?auto_55663 ) ) ( not ( = ?auto_55662 ?auto_55663 ) ) ( not ( = ?auto_55666 ?auto_55663 ) ) ( not ( = ?auto_55669 ?auto_55673 ) ) ( not ( = ?auto_55668 ?auto_55669 ) ) ( HOIST-AT ?auto_55667 ?auto_55669 ) ( not ( = ?auto_55672 ?auto_55667 ) ) ( not ( = ?auto_55664 ?auto_55667 ) ) ( AVAILABLE ?auto_55667 ) ( SURFACE-AT ?auto_55662 ?auto_55669 ) ( ON ?auto_55662 ?auto_55670 ) ( CLEAR ?auto_55662 ) ( not ( = ?auto_55661 ?auto_55670 ) ) ( not ( = ?auto_55662 ?auto_55670 ) ) ( not ( = ?auto_55666 ?auto_55670 ) ) ( not ( = ?auto_55663 ?auto_55670 ) ) ( TRUCK-AT ?auto_55671 ?auto_55673 ) ( SURFACE-AT ?auto_55665 ?auto_55673 ) ( CLEAR ?auto_55665 ) ( IS-CRATE ?auto_55663 ) ( not ( = ?auto_55661 ?auto_55665 ) ) ( not ( = ?auto_55662 ?auto_55665 ) ) ( not ( = ?auto_55666 ?auto_55665 ) ) ( not ( = ?auto_55663 ?auto_55665 ) ) ( not ( = ?auto_55670 ?auto_55665 ) ) ( AVAILABLE ?auto_55672 ) ( IN ?auto_55663 ?auto_55671 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55672 ?auto_55663 ?auto_55671 ?auto_55673 )
      ( MAKE-ON ?auto_55661 ?auto_55662 )
      ( MAKE-ON-VERIFY ?auto_55661 ?auto_55662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55674 - SURFACE
      ?auto_55675 - SURFACE
    )
    :vars
    (
      ?auto_55685 - HOIST
      ?auto_55682 - PLACE
      ?auto_55680 - PLACE
      ?auto_55677 - HOIST
      ?auto_55681 - SURFACE
      ?auto_55684 - SURFACE
      ?auto_55676 - PLACE
      ?auto_55678 - HOIST
      ?auto_55686 - SURFACE
      ?auto_55679 - SURFACE
      ?auto_55683 - TRUCK
      ?auto_55687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55685 ?auto_55682 ) ( IS-CRATE ?auto_55674 ) ( not ( = ?auto_55674 ?auto_55675 ) ) ( not ( = ?auto_55680 ?auto_55682 ) ) ( HOIST-AT ?auto_55677 ?auto_55680 ) ( not ( = ?auto_55685 ?auto_55677 ) ) ( AVAILABLE ?auto_55677 ) ( SURFACE-AT ?auto_55674 ?auto_55680 ) ( ON ?auto_55674 ?auto_55681 ) ( CLEAR ?auto_55674 ) ( not ( = ?auto_55674 ?auto_55681 ) ) ( not ( = ?auto_55675 ?auto_55681 ) ) ( IS-CRATE ?auto_55675 ) ( not ( = ?auto_55674 ?auto_55684 ) ) ( not ( = ?auto_55675 ?auto_55684 ) ) ( not ( = ?auto_55681 ?auto_55684 ) ) ( not ( = ?auto_55676 ?auto_55682 ) ) ( not ( = ?auto_55680 ?auto_55676 ) ) ( HOIST-AT ?auto_55678 ?auto_55676 ) ( not ( = ?auto_55685 ?auto_55678 ) ) ( not ( = ?auto_55677 ?auto_55678 ) ) ( AVAILABLE ?auto_55678 ) ( SURFACE-AT ?auto_55675 ?auto_55676 ) ( ON ?auto_55675 ?auto_55686 ) ( CLEAR ?auto_55675 ) ( not ( = ?auto_55674 ?auto_55686 ) ) ( not ( = ?auto_55675 ?auto_55686 ) ) ( not ( = ?auto_55681 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( SURFACE-AT ?auto_55679 ?auto_55682 ) ( CLEAR ?auto_55679 ) ( IS-CRATE ?auto_55684 ) ( not ( = ?auto_55674 ?auto_55679 ) ) ( not ( = ?auto_55675 ?auto_55679 ) ) ( not ( = ?auto_55681 ?auto_55679 ) ) ( not ( = ?auto_55684 ?auto_55679 ) ) ( not ( = ?auto_55686 ?auto_55679 ) ) ( AVAILABLE ?auto_55685 ) ( IN ?auto_55684 ?auto_55683 ) ( TRUCK-AT ?auto_55683 ?auto_55687 ) ( not ( = ?auto_55687 ?auto_55682 ) ) ( not ( = ?auto_55680 ?auto_55687 ) ) ( not ( = ?auto_55676 ?auto_55687 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55683 ?auto_55687 ?auto_55682 )
      ( MAKE-ON ?auto_55674 ?auto_55675 )
      ( MAKE-ON-VERIFY ?auto_55674 ?auto_55675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55688 - SURFACE
      ?auto_55689 - SURFACE
    )
    :vars
    (
      ?auto_55700 - HOIST
      ?auto_55696 - PLACE
      ?auto_55699 - PLACE
      ?auto_55697 - HOIST
      ?auto_55693 - SURFACE
      ?auto_55701 - SURFACE
      ?auto_55694 - PLACE
      ?auto_55692 - HOIST
      ?auto_55691 - SURFACE
      ?auto_55695 - SURFACE
      ?auto_55698 - TRUCK
      ?auto_55690 - PLACE
      ?auto_55702 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55700 ?auto_55696 ) ( IS-CRATE ?auto_55688 ) ( not ( = ?auto_55688 ?auto_55689 ) ) ( not ( = ?auto_55699 ?auto_55696 ) ) ( HOIST-AT ?auto_55697 ?auto_55699 ) ( not ( = ?auto_55700 ?auto_55697 ) ) ( AVAILABLE ?auto_55697 ) ( SURFACE-AT ?auto_55688 ?auto_55699 ) ( ON ?auto_55688 ?auto_55693 ) ( CLEAR ?auto_55688 ) ( not ( = ?auto_55688 ?auto_55693 ) ) ( not ( = ?auto_55689 ?auto_55693 ) ) ( IS-CRATE ?auto_55689 ) ( not ( = ?auto_55688 ?auto_55701 ) ) ( not ( = ?auto_55689 ?auto_55701 ) ) ( not ( = ?auto_55693 ?auto_55701 ) ) ( not ( = ?auto_55694 ?auto_55696 ) ) ( not ( = ?auto_55699 ?auto_55694 ) ) ( HOIST-AT ?auto_55692 ?auto_55694 ) ( not ( = ?auto_55700 ?auto_55692 ) ) ( not ( = ?auto_55697 ?auto_55692 ) ) ( AVAILABLE ?auto_55692 ) ( SURFACE-AT ?auto_55689 ?auto_55694 ) ( ON ?auto_55689 ?auto_55691 ) ( CLEAR ?auto_55689 ) ( not ( = ?auto_55688 ?auto_55691 ) ) ( not ( = ?auto_55689 ?auto_55691 ) ) ( not ( = ?auto_55693 ?auto_55691 ) ) ( not ( = ?auto_55701 ?auto_55691 ) ) ( SURFACE-AT ?auto_55695 ?auto_55696 ) ( CLEAR ?auto_55695 ) ( IS-CRATE ?auto_55701 ) ( not ( = ?auto_55688 ?auto_55695 ) ) ( not ( = ?auto_55689 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55701 ?auto_55695 ) ) ( not ( = ?auto_55691 ?auto_55695 ) ) ( AVAILABLE ?auto_55700 ) ( TRUCK-AT ?auto_55698 ?auto_55690 ) ( not ( = ?auto_55690 ?auto_55696 ) ) ( not ( = ?auto_55699 ?auto_55690 ) ) ( not ( = ?auto_55694 ?auto_55690 ) ) ( HOIST-AT ?auto_55702 ?auto_55690 ) ( LIFTING ?auto_55702 ?auto_55701 ) ( not ( = ?auto_55700 ?auto_55702 ) ) ( not ( = ?auto_55697 ?auto_55702 ) ) ( not ( = ?auto_55692 ?auto_55702 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55702 ?auto_55701 ?auto_55698 ?auto_55690 )
      ( MAKE-ON ?auto_55688 ?auto_55689 )
      ( MAKE-ON-VERIFY ?auto_55688 ?auto_55689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55703 - SURFACE
      ?auto_55704 - SURFACE
    )
    :vars
    (
      ?auto_55712 - HOIST
      ?auto_55709 - PLACE
      ?auto_55710 - PLACE
      ?auto_55713 - HOIST
      ?auto_55711 - SURFACE
      ?auto_55717 - SURFACE
      ?auto_55714 - PLACE
      ?auto_55706 - HOIST
      ?auto_55705 - SURFACE
      ?auto_55707 - SURFACE
      ?auto_55715 - TRUCK
      ?auto_55716 - PLACE
      ?auto_55708 - HOIST
      ?auto_55718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55712 ?auto_55709 ) ( IS-CRATE ?auto_55703 ) ( not ( = ?auto_55703 ?auto_55704 ) ) ( not ( = ?auto_55710 ?auto_55709 ) ) ( HOIST-AT ?auto_55713 ?auto_55710 ) ( not ( = ?auto_55712 ?auto_55713 ) ) ( AVAILABLE ?auto_55713 ) ( SURFACE-AT ?auto_55703 ?auto_55710 ) ( ON ?auto_55703 ?auto_55711 ) ( CLEAR ?auto_55703 ) ( not ( = ?auto_55703 ?auto_55711 ) ) ( not ( = ?auto_55704 ?auto_55711 ) ) ( IS-CRATE ?auto_55704 ) ( not ( = ?auto_55703 ?auto_55717 ) ) ( not ( = ?auto_55704 ?auto_55717 ) ) ( not ( = ?auto_55711 ?auto_55717 ) ) ( not ( = ?auto_55714 ?auto_55709 ) ) ( not ( = ?auto_55710 ?auto_55714 ) ) ( HOIST-AT ?auto_55706 ?auto_55714 ) ( not ( = ?auto_55712 ?auto_55706 ) ) ( not ( = ?auto_55713 ?auto_55706 ) ) ( AVAILABLE ?auto_55706 ) ( SURFACE-AT ?auto_55704 ?auto_55714 ) ( ON ?auto_55704 ?auto_55705 ) ( CLEAR ?auto_55704 ) ( not ( = ?auto_55703 ?auto_55705 ) ) ( not ( = ?auto_55704 ?auto_55705 ) ) ( not ( = ?auto_55711 ?auto_55705 ) ) ( not ( = ?auto_55717 ?auto_55705 ) ) ( SURFACE-AT ?auto_55707 ?auto_55709 ) ( CLEAR ?auto_55707 ) ( IS-CRATE ?auto_55717 ) ( not ( = ?auto_55703 ?auto_55707 ) ) ( not ( = ?auto_55704 ?auto_55707 ) ) ( not ( = ?auto_55711 ?auto_55707 ) ) ( not ( = ?auto_55717 ?auto_55707 ) ) ( not ( = ?auto_55705 ?auto_55707 ) ) ( AVAILABLE ?auto_55712 ) ( TRUCK-AT ?auto_55715 ?auto_55716 ) ( not ( = ?auto_55716 ?auto_55709 ) ) ( not ( = ?auto_55710 ?auto_55716 ) ) ( not ( = ?auto_55714 ?auto_55716 ) ) ( HOIST-AT ?auto_55708 ?auto_55716 ) ( not ( = ?auto_55712 ?auto_55708 ) ) ( not ( = ?auto_55713 ?auto_55708 ) ) ( not ( = ?auto_55706 ?auto_55708 ) ) ( AVAILABLE ?auto_55708 ) ( SURFACE-AT ?auto_55717 ?auto_55716 ) ( ON ?auto_55717 ?auto_55718 ) ( CLEAR ?auto_55717 ) ( not ( = ?auto_55703 ?auto_55718 ) ) ( not ( = ?auto_55704 ?auto_55718 ) ) ( not ( = ?auto_55711 ?auto_55718 ) ) ( not ( = ?auto_55717 ?auto_55718 ) ) ( not ( = ?auto_55705 ?auto_55718 ) ) ( not ( = ?auto_55707 ?auto_55718 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55708 ?auto_55717 ?auto_55718 ?auto_55716 )
      ( MAKE-ON ?auto_55703 ?auto_55704 )
      ( MAKE-ON-VERIFY ?auto_55703 ?auto_55704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55719 - SURFACE
      ?auto_55720 - SURFACE
    )
    :vars
    (
      ?auto_55722 - HOIST
      ?auto_55727 - PLACE
      ?auto_55732 - PLACE
      ?auto_55730 - HOIST
      ?auto_55723 - SURFACE
      ?auto_55728 - SURFACE
      ?auto_55725 - PLACE
      ?auto_55731 - HOIST
      ?auto_55721 - SURFACE
      ?auto_55733 - SURFACE
      ?auto_55729 - PLACE
      ?auto_55726 - HOIST
      ?auto_55734 - SURFACE
      ?auto_55724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55722 ?auto_55727 ) ( IS-CRATE ?auto_55719 ) ( not ( = ?auto_55719 ?auto_55720 ) ) ( not ( = ?auto_55732 ?auto_55727 ) ) ( HOIST-AT ?auto_55730 ?auto_55732 ) ( not ( = ?auto_55722 ?auto_55730 ) ) ( AVAILABLE ?auto_55730 ) ( SURFACE-AT ?auto_55719 ?auto_55732 ) ( ON ?auto_55719 ?auto_55723 ) ( CLEAR ?auto_55719 ) ( not ( = ?auto_55719 ?auto_55723 ) ) ( not ( = ?auto_55720 ?auto_55723 ) ) ( IS-CRATE ?auto_55720 ) ( not ( = ?auto_55719 ?auto_55728 ) ) ( not ( = ?auto_55720 ?auto_55728 ) ) ( not ( = ?auto_55723 ?auto_55728 ) ) ( not ( = ?auto_55725 ?auto_55727 ) ) ( not ( = ?auto_55732 ?auto_55725 ) ) ( HOIST-AT ?auto_55731 ?auto_55725 ) ( not ( = ?auto_55722 ?auto_55731 ) ) ( not ( = ?auto_55730 ?auto_55731 ) ) ( AVAILABLE ?auto_55731 ) ( SURFACE-AT ?auto_55720 ?auto_55725 ) ( ON ?auto_55720 ?auto_55721 ) ( CLEAR ?auto_55720 ) ( not ( = ?auto_55719 ?auto_55721 ) ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( not ( = ?auto_55723 ?auto_55721 ) ) ( not ( = ?auto_55728 ?auto_55721 ) ) ( SURFACE-AT ?auto_55733 ?auto_55727 ) ( CLEAR ?auto_55733 ) ( IS-CRATE ?auto_55728 ) ( not ( = ?auto_55719 ?auto_55733 ) ) ( not ( = ?auto_55720 ?auto_55733 ) ) ( not ( = ?auto_55723 ?auto_55733 ) ) ( not ( = ?auto_55728 ?auto_55733 ) ) ( not ( = ?auto_55721 ?auto_55733 ) ) ( AVAILABLE ?auto_55722 ) ( not ( = ?auto_55729 ?auto_55727 ) ) ( not ( = ?auto_55732 ?auto_55729 ) ) ( not ( = ?auto_55725 ?auto_55729 ) ) ( HOIST-AT ?auto_55726 ?auto_55729 ) ( not ( = ?auto_55722 ?auto_55726 ) ) ( not ( = ?auto_55730 ?auto_55726 ) ) ( not ( = ?auto_55731 ?auto_55726 ) ) ( AVAILABLE ?auto_55726 ) ( SURFACE-AT ?auto_55728 ?auto_55729 ) ( ON ?auto_55728 ?auto_55734 ) ( CLEAR ?auto_55728 ) ( not ( = ?auto_55719 ?auto_55734 ) ) ( not ( = ?auto_55720 ?auto_55734 ) ) ( not ( = ?auto_55723 ?auto_55734 ) ) ( not ( = ?auto_55728 ?auto_55734 ) ) ( not ( = ?auto_55721 ?auto_55734 ) ) ( not ( = ?auto_55733 ?auto_55734 ) ) ( TRUCK-AT ?auto_55724 ?auto_55727 ) )
    :subtasks
    ( ( !DRIVE ?auto_55724 ?auto_55727 ?auto_55729 )
      ( MAKE-ON ?auto_55719 ?auto_55720 )
      ( MAKE-ON-VERIFY ?auto_55719 ?auto_55720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55735 - SURFACE
      ?auto_55736 - SURFACE
    )
    :vars
    (
      ?auto_55740 - HOIST
      ?auto_55748 - PLACE
      ?auto_55737 - PLACE
      ?auto_55743 - HOIST
      ?auto_55739 - SURFACE
      ?auto_55745 - SURFACE
      ?auto_55744 - PLACE
      ?auto_55749 - HOIST
      ?auto_55742 - SURFACE
      ?auto_55741 - SURFACE
      ?auto_55747 - PLACE
      ?auto_55750 - HOIST
      ?auto_55746 - SURFACE
      ?auto_55738 - TRUCK
      ?auto_55751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55740 ?auto_55748 ) ( IS-CRATE ?auto_55735 ) ( not ( = ?auto_55735 ?auto_55736 ) ) ( not ( = ?auto_55737 ?auto_55748 ) ) ( HOIST-AT ?auto_55743 ?auto_55737 ) ( not ( = ?auto_55740 ?auto_55743 ) ) ( AVAILABLE ?auto_55743 ) ( SURFACE-AT ?auto_55735 ?auto_55737 ) ( ON ?auto_55735 ?auto_55739 ) ( CLEAR ?auto_55735 ) ( not ( = ?auto_55735 ?auto_55739 ) ) ( not ( = ?auto_55736 ?auto_55739 ) ) ( IS-CRATE ?auto_55736 ) ( not ( = ?auto_55735 ?auto_55745 ) ) ( not ( = ?auto_55736 ?auto_55745 ) ) ( not ( = ?auto_55739 ?auto_55745 ) ) ( not ( = ?auto_55744 ?auto_55748 ) ) ( not ( = ?auto_55737 ?auto_55744 ) ) ( HOIST-AT ?auto_55749 ?auto_55744 ) ( not ( = ?auto_55740 ?auto_55749 ) ) ( not ( = ?auto_55743 ?auto_55749 ) ) ( AVAILABLE ?auto_55749 ) ( SURFACE-AT ?auto_55736 ?auto_55744 ) ( ON ?auto_55736 ?auto_55742 ) ( CLEAR ?auto_55736 ) ( not ( = ?auto_55735 ?auto_55742 ) ) ( not ( = ?auto_55736 ?auto_55742 ) ) ( not ( = ?auto_55739 ?auto_55742 ) ) ( not ( = ?auto_55745 ?auto_55742 ) ) ( IS-CRATE ?auto_55745 ) ( not ( = ?auto_55735 ?auto_55741 ) ) ( not ( = ?auto_55736 ?auto_55741 ) ) ( not ( = ?auto_55739 ?auto_55741 ) ) ( not ( = ?auto_55745 ?auto_55741 ) ) ( not ( = ?auto_55742 ?auto_55741 ) ) ( not ( = ?auto_55747 ?auto_55748 ) ) ( not ( = ?auto_55737 ?auto_55747 ) ) ( not ( = ?auto_55744 ?auto_55747 ) ) ( HOIST-AT ?auto_55750 ?auto_55747 ) ( not ( = ?auto_55740 ?auto_55750 ) ) ( not ( = ?auto_55743 ?auto_55750 ) ) ( not ( = ?auto_55749 ?auto_55750 ) ) ( AVAILABLE ?auto_55750 ) ( SURFACE-AT ?auto_55745 ?auto_55747 ) ( ON ?auto_55745 ?auto_55746 ) ( CLEAR ?auto_55745 ) ( not ( = ?auto_55735 ?auto_55746 ) ) ( not ( = ?auto_55736 ?auto_55746 ) ) ( not ( = ?auto_55739 ?auto_55746 ) ) ( not ( = ?auto_55745 ?auto_55746 ) ) ( not ( = ?auto_55742 ?auto_55746 ) ) ( not ( = ?auto_55741 ?auto_55746 ) ) ( TRUCK-AT ?auto_55738 ?auto_55748 ) ( SURFACE-AT ?auto_55751 ?auto_55748 ) ( CLEAR ?auto_55751 ) ( LIFTING ?auto_55740 ?auto_55741 ) ( IS-CRATE ?auto_55741 ) ( not ( = ?auto_55735 ?auto_55751 ) ) ( not ( = ?auto_55736 ?auto_55751 ) ) ( not ( = ?auto_55739 ?auto_55751 ) ) ( not ( = ?auto_55745 ?auto_55751 ) ) ( not ( = ?auto_55742 ?auto_55751 ) ) ( not ( = ?auto_55741 ?auto_55751 ) ) ( not ( = ?auto_55746 ?auto_55751 ) ) )
    :subtasks
    ( ( !DROP ?auto_55740 ?auto_55741 ?auto_55751 ?auto_55748 )
      ( MAKE-ON ?auto_55735 ?auto_55736 )
      ( MAKE-ON-VERIFY ?auto_55735 ?auto_55736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55752 - SURFACE
      ?auto_55753 - SURFACE
    )
    :vars
    (
      ?auto_55755 - HOIST
      ?auto_55766 - PLACE
      ?auto_55765 - PLACE
      ?auto_55758 - HOIST
      ?auto_55754 - SURFACE
      ?auto_55768 - SURFACE
      ?auto_55757 - PLACE
      ?auto_55767 - HOIST
      ?auto_55760 - SURFACE
      ?auto_55762 - SURFACE
      ?auto_55763 - PLACE
      ?auto_55759 - HOIST
      ?auto_55764 - SURFACE
      ?auto_55761 - TRUCK
      ?auto_55756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55755 ?auto_55766 ) ( IS-CRATE ?auto_55752 ) ( not ( = ?auto_55752 ?auto_55753 ) ) ( not ( = ?auto_55765 ?auto_55766 ) ) ( HOIST-AT ?auto_55758 ?auto_55765 ) ( not ( = ?auto_55755 ?auto_55758 ) ) ( AVAILABLE ?auto_55758 ) ( SURFACE-AT ?auto_55752 ?auto_55765 ) ( ON ?auto_55752 ?auto_55754 ) ( CLEAR ?auto_55752 ) ( not ( = ?auto_55752 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( IS-CRATE ?auto_55753 ) ( not ( = ?auto_55752 ?auto_55768 ) ) ( not ( = ?auto_55753 ?auto_55768 ) ) ( not ( = ?auto_55754 ?auto_55768 ) ) ( not ( = ?auto_55757 ?auto_55766 ) ) ( not ( = ?auto_55765 ?auto_55757 ) ) ( HOIST-AT ?auto_55767 ?auto_55757 ) ( not ( = ?auto_55755 ?auto_55767 ) ) ( not ( = ?auto_55758 ?auto_55767 ) ) ( AVAILABLE ?auto_55767 ) ( SURFACE-AT ?auto_55753 ?auto_55757 ) ( ON ?auto_55753 ?auto_55760 ) ( CLEAR ?auto_55753 ) ( not ( = ?auto_55752 ?auto_55760 ) ) ( not ( = ?auto_55753 ?auto_55760 ) ) ( not ( = ?auto_55754 ?auto_55760 ) ) ( not ( = ?auto_55768 ?auto_55760 ) ) ( IS-CRATE ?auto_55768 ) ( not ( = ?auto_55752 ?auto_55762 ) ) ( not ( = ?auto_55753 ?auto_55762 ) ) ( not ( = ?auto_55754 ?auto_55762 ) ) ( not ( = ?auto_55768 ?auto_55762 ) ) ( not ( = ?auto_55760 ?auto_55762 ) ) ( not ( = ?auto_55763 ?auto_55766 ) ) ( not ( = ?auto_55765 ?auto_55763 ) ) ( not ( = ?auto_55757 ?auto_55763 ) ) ( HOIST-AT ?auto_55759 ?auto_55763 ) ( not ( = ?auto_55755 ?auto_55759 ) ) ( not ( = ?auto_55758 ?auto_55759 ) ) ( not ( = ?auto_55767 ?auto_55759 ) ) ( AVAILABLE ?auto_55759 ) ( SURFACE-AT ?auto_55768 ?auto_55763 ) ( ON ?auto_55768 ?auto_55764 ) ( CLEAR ?auto_55768 ) ( not ( = ?auto_55752 ?auto_55764 ) ) ( not ( = ?auto_55753 ?auto_55764 ) ) ( not ( = ?auto_55754 ?auto_55764 ) ) ( not ( = ?auto_55768 ?auto_55764 ) ) ( not ( = ?auto_55760 ?auto_55764 ) ) ( not ( = ?auto_55762 ?auto_55764 ) ) ( TRUCK-AT ?auto_55761 ?auto_55766 ) ( SURFACE-AT ?auto_55756 ?auto_55766 ) ( CLEAR ?auto_55756 ) ( IS-CRATE ?auto_55762 ) ( not ( = ?auto_55752 ?auto_55756 ) ) ( not ( = ?auto_55753 ?auto_55756 ) ) ( not ( = ?auto_55754 ?auto_55756 ) ) ( not ( = ?auto_55768 ?auto_55756 ) ) ( not ( = ?auto_55760 ?auto_55756 ) ) ( not ( = ?auto_55762 ?auto_55756 ) ) ( not ( = ?auto_55764 ?auto_55756 ) ) ( AVAILABLE ?auto_55755 ) ( IN ?auto_55762 ?auto_55761 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55755 ?auto_55762 ?auto_55761 ?auto_55766 )
      ( MAKE-ON ?auto_55752 ?auto_55753 )
      ( MAKE-ON-VERIFY ?auto_55752 ?auto_55753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55769 - SURFACE
      ?auto_55770 - SURFACE
    )
    :vars
    (
      ?auto_55782 - HOIST
      ?auto_55785 - PLACE
      ?auto_55781 - PLACE
      ?auto_55776 - HOIST
      ?auto_55777 - SURFACE
      ?auto_55783 - SURFACE
      ?auto_55771 - PLACE
      ?auto_55779 - HOIST
      ?auto_55778 - SURFACE
      ?auto_55775 - SURFACE
      ?auto_55784 - PLACE
      ?auto_55773 - HOIST
      ?auto_55780 - SURFACE
      ?auto_55772 - SURFACE
      ?auto_55774 - TRUCK
      ?auto_55786 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55782 ?auto_55785 ) ( IS-CRATE ?auto_55769 ) ( not ( = ?auto_55769 ?auto_55770 ) ) ( not ( = ?auto_55781 ?auto_55785 ) ) ( HOIST-AT ?auto_55776 ?auto_55781 ) ( not ( = ?auto_55782 ?auto_55776 ) ) ( AVAILABLE ?auto_55776 ) ( SURFACE-AT ?auto_55769 ?auto_55781 ) ( ON ?auto_55769 ?auto_55777 ) ( CLEAR ?auto_55769 ) ( not ( = ?auto_55769 ?auto_55777 ) ) ( not ( = ?auto_55770 ?auto_55777 ) ) ( IS-CRATE ?auto_55770 ) ( not ( = ?auto_55769 ?auto_55783 ) ) ( not ( = ?auto_55770 ?auto_55783 ) ) ( not ( = ?auto_55777 ?auto_55783 ) ) ( not ( = ?auto_55771 ?auto_55785 ) ) ( not ( = ?auto_55781 ?auto_55771 ) ) ( HOIST-AT ?auto_55779 ?auto_55771 ) ( not ( = ?auto_55782 ?auto_55779 ) ) ( not ( = ?auto_55776 ?auto_55779 ) ) ( AVAILABLE ?auto_55779 ) ( SURFACE-AT ?auto_55770 ?auto_55771 ) ( ON ?auto_55770 ?auto_55778 ) ( CLEAR ?auto_55770 ) ( not ( = ?auto_55769 ?auto_55778 ) ) ( not ( = ?auto_55770 ?auto_55778 ) ) ( not ( = ?auto_55777 ?auto_55778 ) ) ( not ( = ?auto_55783 ?auto_55778 ) ) ( IS-CRATE ?auto_55783 ) ( not ( = ?auto_55769 ?auto_55775 ) ) ( not ( = ?auto_55770 ?auto_55775 ) ) ( not ( = ?auto_55777 ?auto_55775 ) ) ( not ( = ?auto_55783 ?auto_55775 ) ) ( not ( = ?auto_55778 ?auto_55775 ) ) ( not ( = ?auto_55784 ?auto_55785 ) ) ( not ( = ?auto_55781 ?auto_55784 ) ) ( not ( = ?auto_55771 ?auto_55784 ) ) ( HOIST-AT ?auto_55773 ?auto_55784 ) ( not ( = ?auto_55782 ?auto_55773 ) ) ( not ( = ?auto_55776 ?auto_55773 ) ) ( not ( = ?auto_55779 ?auto_55773 ) ) ( AVAILABLE ?auto_55773 ) ( SURFACE-AT ?auto_55783 ?auto_55784 ) ( ON ?auto_55783 ?auto_55780 ) ( CLEAR ?auto_55783 ) ( not ( = ?auto_55769 ?auto_55780 ) ) ( not ( = ?auto_55770 ?auto_55780 ) ) ( not ( = ?auto_55777 ?auto_55780 ) ) ( not ( = ?auto_55783 ?auto_55780 ) ) ( not ( = ?auto_55778 ?auto_55780 ) ) ( not ( = ?auto_55775 ?auto_55780 ) ) ( SURFACE-AT ?auto_55772 ?auto_55785 ) ( CLEAR ?auto_55772 ) ( IS-CRATE ?auto_55775 ) ( not ( = ?auto_55769 ?auto_55772 ) ) ( not ( = ?auto_55770 ?auto_55772 ) ) ( not ( = ?auto_55777 ?auto_55772 ) ) ( not ( = ?auto_55783 ?auto_55772 ) ) ( not ( = ?auto_55778 ?auto_55772 ) ) ( not ( = ?auto_55775 ?auto_55772 ) ) ( not ( = ?auto_55780 ?auto_55772 ) ) ( AVAILABLE ?auto_55782 ) ( IN ?auto_55775 ?auto_55774 ) ( TRUCK-AT ?auto_55774 ?auto_55786 ) ( not ( = ?auto_55786 ?auto_55785 ) ) ( not ( = ?auto_55781 ?auto_55786 ) ) ( not ( = ?auto_55771 ?auto_55786 ) ) ( not ( = ?auto_55784 ?auto_55786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55774 ?auto_55786 ?auto_55785 )
      ( MAKE-ON ?auto_55769 ?auto_55770 )
      ( MAKE-ON-VERIFY ?auto_55769 ?auto_55770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55787 - SURFACE
      ?auto_55788 - SURFACE
    )
    :vars
    (
      ?auto_55792 - HOIST
      ?auto_55803 - PLACE
      ?auto_55802 - PLACE
      ?auto_55804 - HOIST
      ?auto_55797 - SURFACE
      ?auto_55801 - SURFACE
      ?auto_55789 - PLACE
      ?auto_55799 - HOIST
      ?auto_55791 - SURFACE
      ?auto_55793 - SURFACE
      ?auto_55790 - PLACE
      ?auto_55794 - HOIST
      ?auto_55795 - SURFACE
      ?auto_55800 - SURFACE
      ?auto_55796 - TRUCK
      ?auto_55798 - PLACE
      ?auto_55805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55792 ?auto_55803 ) ( IS-CRATE ?auto_55787 ) ( not ( = ?auto_55787 ?auto_55788 ) ) ( not ( = ?auto_55802 ?auto_55803 ) ) ( HOIST-AT ?auto_55804 ?auto_55802 ) ( not ( = ?auto_55792 ?auto_55804 ) ) ( AVAILABLE ?auto_55804 ) ( SURFACE-AT ?auto_55787 ?auto_55802 ) ( ON ?auto_55787 ?auto_55797 ) ( CLEAR ?auto_55787 ) ( not ( = ?auto_55787 ?auto_55797 ) ) ( not ( = ?auto_55788 ?auto_55797 ) ) ( IS-CRATE ?auto_55788 ) ( not ( = ?auto_55787 ?auto_55801 ) ) ( not ( = ?auto_55788 ?auto_55801 ) ) ( not ( = ?auto_55797 ?auto_55801 ) ) ( not ( = ?auto_55789 ?auto_55803 ) ) ( not ( = ?auto_55802 ?auto_55789 ) ) ( HOIST-AT ?auto_55799 ?auto_55789 ) ( not ( = ?auto_55792 ?auto_55799 ) ) ( not ( = ?auto_55804 ?auto_55799 ) ) ( AVAILABLE ?auto_55799 ) ( SURFACE-AT ?auto_55788 ?auto_55789 ) ( ON ?auto_55788 ?auto_55791 ) ( CLEAR ?auto_55788 ) ( not ( = ?auto_55787 ?auto_55791 ) ) ( not ( = ?auto_55788 ?auto_55791 ) ) ( not ( = ?auto_55797 ?auto_55791 ) ) ( not ( = ?auto_55801 ?auto_55791 ) ) ( IS-CRATE ?auto_55801 ) ( not ( = ?auto_55787 ?auto_55793 ) ) ( not ( = ?auto_55788 ?auto_55793 ) ) ( not ( = ?auto_55797 ?auto_55793 ) ) ( not ( = ?auto_55801 ?auto_55793 ) ) ( not ( = ?auto_55791 ?auto_55793 ) ) ( not ( = ?auto_55790 ?auto_55803 ) ) ( not ( = ?auto_55802 ?auto_55790 ) ) ( not ( = ?auto_55789 ?auto_55790 ) ) ( HOIST-AT ?auto_55794 ?auto_55790 ) ( not ( = ?auto_55792 ?auto_55794 ) ) ( not ( = ?auto_55804 ?auto_55794 ) ) ( not ( = ?auto_55799 ?auto_55794 ) ) ( AVAILABLE ?auto_55794 ) ( SURFACE-AT ?auto_55801 ?auto_55790 ) ( ON ?auto_55801 ?auto_55795 ) ( CLEAR ?auto_55801 ) ( not ( = ?auto_55787 ?auto_55795 ) ) ( not ( = ?auto_55788 ?auto_55795 ) ) ( not ( = ?auto_55797 ?auto_55795 ) ) ( not ( = ?auto_55801 ?auto_55795 ) ) ( not ( = ?auto_55791 ?auto_55795 ) ) ( not ( = ?auto_55793 ?auto_55795 ) ) ( SURFACE-AT ?auto_55800 ?auto_55803 ) ( CLEAR ?auto_55800 ) ( IS-CRATE ?auto_55793 ) ( not ( = ?auto_55787 ?auto_55800 ) ) ( not ( = ?auto_55788 ?auto_55800 ) ) ( not ( = ?auto_55797 ?auto_55800 ) ) ( not ( = ?auto_55801 ?auto_55800 ) ) ( not ( = ?auto_55791 ?auto_55800 ) ) ( not ( = ?auto_55793 ?auto_55800 ) ) ( not ( = ?auto_55795 ?auto_55800 ) ) ( AVAILABLE ?auto_55792 ) ( TRUCK-AT ?auto_55796 ?auto_55798 ) ( not ( = ?auto_55798 ?auto_55803 ) ) ( not ( = ?auto_55802 ?auto_55798 ) ) ( not ( = ?auto_55789 ?auto_55798 ) ) ( not ( = ?auto_55790 ?auto_55798 ) ) ( HOIST-AT ?auto_55805 ?auto_55798 ) ( LIFTING ?auto_55805 ?auto_55793 ) ( not ( = ?auto_55792 ?auto_55805 ) ) ( not ( = ?auto_55804 ?auto_55805 ) ) ( not ( = ?auto_55799 ?auto_55805 ) ) ( not ( = ?auto_55794 ?auto_55805 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55805 ?auto_55793 ?auto_55796 ?auto_55798 )
      ( MAKE-ON ?auto_55787 ?auto_55788 )
      ( MAKE-ON-VERIFY ?auto_55787 ?auto_55788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55806 - SURFACE
      ?auto_55807 - SURFACE
    )
    :vars
    (
      ?auto_55808 - HOIST
      ?auto_55822 - PLACE
      ?auto_55817 - PLACE
      ?auto_55812 - HOIST
      ?auto_55814 - SURFACE
      ?auto_55810 - SURFACE
      ?auto_55815 - PLACE
      ?auto_55819 - HOIST
      ?auto_55816 - SURFACE
      ?auto_55821 - SURFACE
      ?auto_55811 - PLACE
      ?auto_55820 - HOIST
      ?auto_55824 - SURFACE
      ?auto_55818 - SURFACE
      ?auto_55813 - TRUCK
      ?auto_55823 - PLACE
      ?auto_55809 - HOIST
      ?auto_55825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55808 ?auto_55822 ) ( IS-CRATE ?auto_55806 ) ( not ( = ?auto_55806 ?auto_55807 ) ) ( not ( = ?auto_55817 ?auto_55822 ) ) ( HOIST-AT ?auto_55812 ?auto_55817 ) ( not ( = ?auto_55808 ?auto_55812 ) ) ( AVAILABLE ?auto_55812 ) ( SURFACE-AT ?auto_55806 ?auto_55817 ) ( ON ?auto_55806 ?auto_55814 ) ( CLEAR ?auto_55806 ) ( not ( = ?auto_55806 ?auto_55814 ) ) ( not ( = ?auto_55807 ?auto_55814 ) ) ( IS-CRATE ?auto_55807 ) ( not ( = ?auto_55806 ?auto_55810 ) ) ( not ( = ?auto_55807 ?auto_55810 ) ) ( not ( = ?auto_55814 ?auto_55810 ) ) ( not ( = ?auto_55815 ?auto_55822 ) ) ( not ( = ?auto_55817 ?auto_55815 ) ) ( HOIST-AT ?auto_55819 ?auto_55815 ) ( not ( = ?auto_55808 ?auto_55819 ) ) ( not ( = ?auto_55812 ?auto_55819 ) ) ( AVAILABLE ?auto_55819 ) ( SURFACE-AT ?auto_55807 ?auto_55815 ) ( ON ?auto_55807 ?auto_55816 ) ( CLEAR ?auto_55807 ) ( not ( = ?auto_55806 ?auto_55816 ) ) ( not ( = ?auto_55807 ?auto_55816 ) ) ( not ( = ?auto_55814 ?auto_55816 ) ) ( not ( = ?auto_55810 ?auto_55816 ) ) ( IS-CRATE ?auto_55810 ) ( not ( = ?auto_55806 ?auto_55821 ) ) ( not ( = ?auto_55807 ?auto_55821 ) ) ( not ( = ?auto_55814 ?auto_55821 ) ) ( not ( = ?auto_55810 ?auto_55821 ) ) ( not ( = ?auto_55816 ?auto_55821 ) ) ( not ( = ?auto_55811 ?auto_55822 ) ) ( not ( = ?auto_55817 ?auto_55811 ) ) ( not ( = ?auto_55815 ?auto_55811 ) ) ( HOIST-AT ?auto_55820 ?auto_55811 ) ( not ( = ?auto_55808 ?auto_55820 ) ) ( not ( = ?auto_55812 ?auto_55820 ) ) ( not ( = ?auto_55819 ?auto_55820 ) ) ( AVAILABLE ?auto_55820 ) ( SURFACE-AT ?auto_55810 ?auto_55811 ) ( ON ?auto_55810 ?auto_55824 ) ( CLEAR ?auto_55810 ) ( not ( = ?auto_55806 ?auto_55824 ) ) ( not ( = ?auto_55807 ?auto_55824 ) ) ( not ( = ?auto_55814 ?auto_55824 ) ) ( not ( = ?auto_55810 ?auto_55824 ) ) ( not ( = ?auto_55816 ?auto_55824 ) ) ( not ( = ?auto_55821 ?auto_55824 ) ) ( SURFACE-AT ?auto_55818 ?auto_55822 ) ( CLEAR ?auto_55818 ) ( IS-CRATE ?auto_55821 ) ( not ( = ?auto_55806 ?auto_55818 ) ) ( not ( = ?auto_55807 ?auto_55818 ) ) ( not ( = ?auto_55814 ?auto_55818 ) ) ( not ( = ?auto_55810 ?auto_55818 ) ) ( not ( = ?auto_55816 ?auto_55818 ) ) ( not ( = ?auto_55821 ?auto_55818 ) ) ( not ( = ?auto_55824 ?auto_55818 ) ) ( AVAILABLE ?auto_55808 ) ( TRUCK-AT ?auto_55813 ?auto_55823 ) ( not ( = ?auto_55823 ?auto_55822 ) ) ( not ( = ?auto_55817 ?auto_55823 ) ) ( not ( = ?auto_55815 ?auto_55823 ) ) ( not ( = ?auto_55811 ?auto_55823 ) ) ( HOIST-AT ?auto_55809 ?auto_55823 ) ( not ( = ?auto_55808 ?auto_55809 ) ) ( not ( = ?auto_55812 ?auto_55809 ) ) ( not ( = ?auto_55819 ?auto_55809 ) ) ( not ( = ?auto_55820 ?auto_55809 ) ) ( AVAILABLE ?auto_55809 ) ( SURFACE-AT ?auto_55821 ?auto_55823 ) ( ON ?auto_55821 ?auto_55825 ) ( CLEAR ?auto_55821 ) ( not ( = ?auto_55806 ?auto_55825 ) ) ( not ( = ?auto_55807 ?auto_55825 ) ) ( not ( = ?auto_55814 ?auto_55825 ) ) ( not ( = ?auto_55810 ?auto_55825 ) ) ( not ( = ?auto_55816 ?auto_55825 ) ) ( not ( = ?auto_55821 ?auto_55825 ) ) ( not ( = ?auto_55824 ?auto_55825 ) ) ( not ( = ?auto_55818 ?auto_55825 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55809 ?auto_55821 ?auto_55825 ?auto_55823 )
      ( MAKE-ON ?auto_55806 ?auto_55807 )
      ( MAKE-ON-VERIFY ?auto_55806 ?auto_55807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55826 - SURFACE
      ?auto_55827 - SURFACE
    )
    :vars
    (
      ?auto_55829 - HOIST
      ?auto_55842 - PLACE
      ?auto_55839 - PLACE
      ?auto_55835 - HOIST
      ?auto_55833 - SURFACE
      ?auto_55828 - SURFACE
      ?auto_55831 - PLACE
      ?auto_55841 - HOIST
      ?auto_55838 - SURFACE
      ?auto_55845 - SURFACE
      ?auto_55837 - PLACE
      ?auto_55843 - HOIST
      ?auto_55836 - SURFACE
      ?auto_55844 - SURFACE
      ?auto_55840 - PLACE
      ?auto_55834 - HOIST
      ?auto_55832 - SURFACE
      ?auto_55830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55829 ?auto_55842 ) ( IS-CRATE ?auto_55826 ) ( not ( = ?auto_55826 ?auto_55827 ) ) ( not ( = ?auto_55839 ?auto_55842 ) ) ( HOIST-AT ?auto_55835 ?auto_55839 ) ( not ( = ?auto_55829 ?auto_55835 ) ) ( AVAILABLE ?auto_55835 ) ( SURFACE-AT ?auto_55826 ?auto_55839 ) ( ON ?auto_55826 ?auto_55833 ) ( CLEAR ?auto_55826 ) ( not ( = ?auto_55826 ?auto_55833 ) ) ( not ( = ?auto_55827 ?auto_55833 ) ) ( IS-CRATE ?auto_55827 ) ( not ( = ?auto_55826 ?auto_55828 ) ) ( not ( = ?auto_55827 ?auto_55828 ) ) ( not ( = ?auto_55833 ?auto_55828 ) ) ( not ( = ?auto_55831 ?auto_55842 ) ) ( not ( = ?auto_55839 ?auto_55831 ) ) ( HOIST-AT ?auto_55841 ?auto_55831 ) ( not ( = ?auto_55829 ?auto_55841 ) ) ( not ( = ?auto_55835 ?auto_55841 ) ) ( AVAILABLE ?auto_55841 ) ( SURFACE-AT ?auto_55827 ?auto_55831 ) ( ON ?auto_55827 ?auto_55838 ) ( CLEAR ?auto_55827 ) ( not ( = ?auto_55826 ?auto_55838 ) ) ( not ( = ?auto_55827 ?auto_55838 ) ) ( not ( = ?auto_55833 ?auto_55838 ) ) ( not ( = ?auto_55828 ?auto_55838 ) ) ( IS-CRATE ?auto_55828 ) ( not ( = ?auto_55826 ?auto_55845 ) ) ( not ( = ?auto_55827 ?auto_55845 ) ) ( not ( = ?auto_55833 ?auto_55845 ) ) ( not ( = ?auto_55828 ?auto_55845 ) ) ( not ( = ?auto_55838 ?auto_55845 ) ) ( not ( = ?auto_55837 ?auto_55842 ) ) ( not ( = ?auto_55839 ?auto_55837 ) ) ( not ( = ?auto_55831 ?auto_55837 ) ) ( HOIST-AT ?auto_55843 ?auto_55837 ) ( not ( = ?auto_55829 ?auto_55843 ) ) ( not ( = ?auto_55835 ?auto_55843 ) ) ( not ( = ?auto_55841 ?auto_55843 ) ) ( AVAILABLE ?auto_55843 ) ( SURFACE-AT ?auto_55828 ?auto_55837 ) ( ON ?auto_55828 ?auto_55836 ) ( CLEAR ?auto_55828 ) ( not ( = ?auto_55826 ?auto_55836 ) ) ( not ( = ?auto_55827 ?auto_55836 ) ) ( not ( = ?auto_55833 ?auto_55836 ) ) ( not ( = ?auto_55828 ?auto_55836 ) ) ( not ( = ?auto_55838 ?auto_55836 ) ) ( not ( = ?auto_55845 ?auto_55836 ) ) ( SURFACE-AT ?auto_55844 ?auto_55842 ) ( CLEAR ?auto_55844 ) ( IS-CRATE ?auto_55845 ) ( not ( = ?auto_55826 ?auto_55844 ) ) ( not ( = ?auto_55827 ?auto_55844 ) ) ( not ( = ?auto_55833 ?auto_55844 ) ) ( not ( = ?auto_55828 ?auto_55844 ) ) ( not ( = ?auto_55838 ?auto_55844 ) ) ( not ( = ?auto_55845 ?auto_55844 ) ) ( not ( = ?auto_55836 ?auto_55844 ) ) ( AVAILABLE ?auto_55829 ) ( not ( = ?auto_55840 ?auto_55842 ) ) ( not ( = ?auto_55839 ?auto_55840 ) ) ( not ( = ?auto_55831 ?auto_55840 ) ) ( not ( = ?auto_55837 ?auto_55840 ) ) ( HOIST-AT ?auto_55834 ?auto_55840 ) ( not ( = ?auto_55829 ?auto_55834 ) ) ( not ( = ?auto_55835 ?auto_55834 ) ) ( not ( = ?auto_55841 ?auto_55834 ) ) ( not ( = ?auto_55843 ?auto_55834 ) ) ( AVAILABLE ?auto_55834 ) ( SURFACE-AT ?auto_55845 ?auto_55840 ) ( ON ?auto_55845 ?auto_55832 ) ( CLEAR ?auto_55845 ) ( not ( = ?auto_55826 ?auto_55832 ) ) ( not ( = ?auto_55827 ?auto_55832 ) ) ( not ( = ?auto_55833 ?auto_55832 ) ) ( not ( = ?auto_55828 ?auto_55832 ) ) ( not ( = ?auto_55838 ?auto_55832 ) ) ( not ( = ?auto_55845 ?auto_55832 ) ) ( not ( = ?auto_55836 ?auto_55832 ) ) ( not ( = ?auto_55844 ?auto_55832 ) ) ( TRUCK-AT ?auto_55830 ?auto_55842 ) )
    :subtasks
    ( ( !DRIVE ?auto_55830 ?auto_55842 ?auto_55840 )
      ( MAKE-ON ?auto_55826 ?auto_55827 )
      ( MAKE-ON-VERIFY ?auto_55826 ?auto_55827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55846 - SURFACE
      ?auto_55847 - SURFACE
    )
    :vars
    (
      ?auto_55860 - HOIST
      ?auto_55859 - PLACE
      ?auto_55855 - PLACE
      ?auto_55857 - HOIST
      ?auto_55850 - SURFACE
      ?auto_55861 - SURFACE
      ?auto_55848 - PLACE
      ?auto_55858 - HOIST
      ?auto_55851 - SURFACE
      ?auto_55849 - SURFACE
      ?auto_55852 - PLACE
      ?auto_55862 - HOIST
      ?auto_55863 - SURFACE
      ?auto_55854 - SURFACE
      ?auto_55853 - PLACE
      ?auto_55856 - HOIST
      ?auto_55864 - SURFACE
      ?auto_55865 - TRUCK
      ?auto_55866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55860 ?auto_55859 ) ( IS-CRATE ?auto_55846 ) ( not ( = ?auto_55846 ?auto_55847 ) ) ( not ( = ?auto_55855 ?auto_55859 ) ) ( HOIST-AT ?auto_55857 ?auto_55855 ) ( not ( = ?auto_55860 ?auto_55857 ) ) ( AVAILABLE ?auto_55857 ) ( SURFACE-AT ?auto_55846 ?auto_55855 ) ( ON ?auto_55846 ?auto_55850 ) ( CLEAR ?auto_55846 ) ( not ( = ?auto_55846 ?auto_55850 ) ) ( not ( = ?auto_55847 ?auto_55850 ) ) ( IS-CRATE ?auto_55847 ) ( not ( = ?auto_55846 ?auto_55861 ) ) ( not ( = ?auto_55847 ?auto_55861 ) ) ( not ( = ?auto_55850 ?auto_55861 ) ) ( not ( = ?auto_55848 ?auto_55859 ) ) ( not ( = ?auto_55855 ?auto_55848 ) ) ( HOIST-AT ?auto_55858 ?auto_55848 ) ( not ( = ?auto_55860 ?auto_55858 ) ) ( not ( = ?auto_55857 ?auto_55858 ) ) ( AVAILABLE ?auto_55858 ) ( SURFACE-AT ?auto_55847 ?auto_55848 ) ( ON ?auto_55847 ?auto_55851 ) ( CLEAR ?auto_55847 ) ( not ( = ?auto_55846 ?auto_55851 ) ) ( not ( = ?auto_55847 ?auto_55851 ) ) ( not ( = ?auto_55850 ?auto_55851 ) ) ( not ( = ?auto_55861 ?auto_55851 ) ) ( IS-CRATE ?auto_55861 ) ( not ( = ?auto_55846 ?auto_55849 ) ) ( not ( = ?auto_55847 ?auto_55849 ) ) ( not ( = ?auto_55850 ?auto_55849 ) ) ( not ( = ?auto_55861 ?auto_55849 ) ) ( not ( = ?auto_55851 ?auto_55849 ) ) ( not ( = ?auto_55852 ?auto_55859 ) ) ( not ( = ?auto_55855 ?auto_55852 ) ) ( not ( = ?auto_55848 ?auto_55852 ) ) ( HOIST-AT ?auto_55862 ?auto_55852 ) ( not ( = ?auto_55860 ?auto_55862 ) ) ( not ( = ?auto_55857 ?auto_55862 ) ) ( not ( = ?auto_55858 ?auto_55862 ) ) ( AVAILABLE ?auto_55862 ) ( SURFACE-AT ?auto_55861 ?auto_55852 ) ( ON ?auto_55861 ?auto_55863 ) ( CLEAR ?auto_55861 ) ( not ( = ?auto_55846 ?auto_55863 ) ) ( not ( = ?auto_55847 ?auto_55863 ) ) ( not ( = ?auto_55850 ?auto_55863 ) ) ( not ( = ?auto_55861 ?auto_55863 ) ) ( not ( = ?auto_55851 ?auto_55863 ) ) ( not ( = ?auto_55849 ?auto_55863 ) ) ( IS-CRATE ?auto_55849 ) ( not ( = ?auto_55846 ?auto_55854 ) ) ( not ( = ?auto_55847 ?auto_55854 ) ) ( not ( = ?auto_55850 ?auto_55854 ) ) ( not ( = ?auto_55861 ?auto_55854 ) ) ( not ( = ?auto_55851 ?auto_55854 ) ) ( not ( = ?auto_55849 ?auto_55854 ) ) ( not ( = ?auto_55863 ?auto_55854 ) ) ( not ( = ?auto_55853 ?auto_55859 ) ) ( not ( = ?auto_55855 ?auto_55853 ) ) ( not ( = ?auto_55848 ?auto_55853 ) ) ( not ( = ?auto_55852 ?auto_55853 ) ) ( HOIST-AT ?auto_55856 ?auto_55853 ) ( not ( = ?auto_55860 ?auto_55856 ) ) ( not ( = ?auto_55857 ?auto_55856 ) ) ( not ( = ?auto_55858 ?auto_55856 ) ) ( not ( = ?auto_55862 ?auto_55856 ) ) ( AVAILABLE ?auto_55856 ) ( SURFACE-AT ?auto_55849 ?auto_55853 ) ( ON ?auto_55849 ?auto_55864 ) ( CLEAR ?auto_55849 ) ( not ( = ?auto_55846 ?auto_55864 ) ) ( not ( = ?auto_55847 ?auto_55864 ) ) ( not ( = ?auto_55850 ?auto_55864 ) ) ( not ( = ?auto_55861 ?auto_55864 ) ) ( not ( = ?auto_55851 ?auto_55864 ) ) ( not ( = ?auto_55849 ?auto_55864 ) ) ( not ( = ?auto_55863 ?auto_55864 ) ) ( not ( = ?auto_55854 ?auto_55864 ) ) ( TRUCK-AT ?auto_55865 ?auto_55859 ) ( SURFACE-AT ?auto_55866 ?auto_55859 ) ( CLEAR ?auto_55866 ) ( LIFTING ?auto_55860 ?auto_55854 ) ( IS-CRATE ?auto_55854 ) ( not ( = ?auto_55846 ?auto_55866 ) ) ( not ( = ?auto_55847 ?auto_55866 ) ) ( not ( = ?auto_55850 ?auto_55866 ) ) ( not ( = ?auto_55861 ?auto_55866 ) ) ( not ( = ?auto_55851 ?auto_55866 ) ) ( not ( = ?auto_55849 ?auto_55866 ) ) ( not ( = ?auto_55863 ?auto_55866 ) ) ( not ( = ?auto_55854 ?auto_55866 ) ) ( not ( = ?auto_55864 ?auto_55866 ) ) )
    :subtasks
    ( ( !DROP ?auto_55860 ?auto_55854 ?auto_55866 ?auto_55859 )
      ( MAKE-ON ?auto_55846 ?auto_55847 )
      ( MAKE-ON-VERIFY ?auto_55846 ?auto_55847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55867 - SURFACE
      ?auto_55868 - SURFACE
    )
    :vars
    (
      ?auto_55876 - HOIST
      ?auto_55878 - PLACE
      ?auto_55884 - PLACE
      ?auto_55880 - HOIST
      ?auto_55886 - SURFACE
      ?auto_55869 - SURFACE
      ?auto_55883 - PLACE
      ?auto_55874 - HOIST
      ?auto_55873 - SURFACE
      ?auto_55877 - SURFACE
      ?auto_55882 - PLACE
      ?auto_55870 - HOIST
      ?auto_55871 - SURFACE
      ?auto_55875 - SURFACE
      ?auto_55872 - PLACE
      ?auto_55885 - HOIST
      ?auto_55881 - SURFACE
      ?auto_55879 - TRUCK
      ?auto_55887 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55876 ?auto_55878 ) ( IS-CRATE ?auto_55867 ) ( not ( = ?auto_55867 ?auto_55868 ) ) ( not ( = ?auto_55884 ?auto_55878 ) ) ( HOIST-AT ?auto_55880 ?auto_55884 ) ( not ( = ?auto_55876 ?auto_55880 ) ) ( AVAILABLE ?auto_55880 ) ( SURFACE-AT ?auto_55867 ?auto_55884 ) ( ON ?auto_55867 ?auto_55886 ) ( CLEAR ?auto_55867 ) ( not ( = ?auto_55867 ?auto_55886 ) ) ( not ( = ?auto_55868 ?auto_55886 ) ) ( IS-CRATE ?auto_55868 ) ( not ( = ?auto_55867 ?auto_55869 ) ) ( not ( = ?auto_55868 ?auto_55869 ) ) ( not ( = ?auto_55886 ?auto_55869 ) ) ( not ( = ?auto_55883 ?auto_55878 ) ) ( not ( = ?auto_55884 ?auto_55883 ) ) ( HOIST-AT ?auto_55874 ?auto_55883 ) ( not ( = ?auto_55876 ?auto_55874 ) ) ( not ( = ?auto_55880 ?auto_55874 ) ) ( AVAILABLE ?auto_55874 ) ( SURFACE-AT ?auto_55868 ?auto_55883 ) ( ON ?auto_55868 ?auto_55873 ) ( CLEAR ?auto_55868 ) ( not ( = ?auto_55867 ?auto_55873 ) ) ( not ( = ?auto_55868 ?auto_55873 ) ) ( not ( = ?auto_55886 ?auto_55873 ) ) ( not ( = ?auto_55869 ?auto_55873 ) ) ( IS-CRATE ?auto_55869 ) ( not ( = ?auto_55867 ?auto_55877 ) ) ( not ( = ?auto_55868 ?auto_55877 ) ) ( not ( = ?auto_55886 ?auto_55877 ) ) ( not ( = ?auto_55869 ?auto_55877 ) ) ( not ( = ?auto_55873 ?auto_55877 ) ) ( not ( = ?auto_55882 ?auto_55878 ) ) ( not ( = ?auto_55884 ?auto_55882 ) ) ( not ( = ?auto_55883 ?auto_55882 ) ) ( HOIST-AT ?auto_55870 ?auto_55882 ) ( not ( = ?auto_55876 ?auto_55870 ) ) ( not ( = ?auto_55880 ?auto_55870 ) ) ( not ( = ?auto_55874 ?auto_55870 ) ) ( AVAILABLE ?auto_55870 ) ( SURFACE-AT ?auto_55869 ?auto_55882 ) ( ON ?auto_55869 ?auto_55871 ) ( CLEAR ?auto_55869 ) ( not ( = ?auto_55867 ?auto_55871 ) ) ( not ( = ?auto_55868 ?auto_55871 ) ) ( not ( = ?auto_55886 ?auto_55871 ) ) ( not ( = ?auto_55869 ?auto_55871 ) ) ( not ( = ?auto_55873 ?auto_55871 ) ) ( not ( = ?auto_55877 ?auto_55871 ) ) ( IS-CRATE ?auto_55877 ) ( not ( = ?auto_55867 ?auto_55875 ) ) ( not ( = ?auto_55868 ?auto_55875 ) ) ( not ( = ?auto_55886 ?auto_55875 ) ) ( not ( = ?auto_55869 ?auto_55875 ) ) ( not ( = ?auto_55873 ?auto_55875 ) ) ( not ( = ?auto_55877 ?auto_55875 ) ) ( not ( = ?auto_55871 ?auto_55875 ) ) ( not ( = ?auto_55872 ?auto_55878 ) ) ( not ( = ?auto_55884 ?auto_55872 ) ) ( not ( = ?auto_55883 ?auto_55872 ) ) ( not ( = ?auto_55882 ?auto_55872 ) ) ( HOIST-AT ?auto_55885 ?auto_55872 ) ( not ( = ?auto_55876 ?auto_55885 ) ) ( not ( = ?auto_55880 ?auto_55885 ) ) ( not ( = ?auto_55874 ?auto_55885 ) ) ( not ( = ?auto_55870 ?auto_55885 ) ) ( AVAILABLE ?auto_55885 ) ( SURFACE-AT ?auto_55877 ?auto_55872 ) ( ON ?auto_55877 ?auto_55881 ) ( CLEAR ?auto_55877 ) ( not ( = ?auto_55867 ?auto_55881 ) ) ( not ( = ?auto_55868 ?auto_55881 ) ) ( not ( = ?auto_55886 ?auto_55881 ) ) ( not ( = ?auto_55869 ?auto_55881 ) ) ( not ( = ?auto_55873 ?auto_55881 ) ) ( not ( = ?auto_55877 ?auto_55881 ) ) ( not ( = ?auto_55871 ?auto_55881 ) ) ( not ( = ?auto_55875 ?auto_55881 ) ) ( TRUCK-AT ?auto_55879 ?auto_55878 ) ( SURFACE-AT ?auto_55887 ?auto_55878 ) ( CLEAR ?auto_55887 ) ( IS-CRATE ?auto_55875 ) ( not ( = ?auto_55867 ?auto_55887 ) ) ( not ( = ?auto_55868 ?auto_55887 ) ) ( not ( = ?auto_55886 ?auto_55887 ) ) ( not ( = ?auto_55869 ?auto_55887 ) ) ( not ( = ?auto_55873 ?auto_55887 ) ) ( not ( = ?auto_55877 ?auto_55887 ) ) ( not ( = ?auto_55871 ?auto_55887 ) ) ( not ( = ?auto_55875 ?auto_55887 ) ) ( not ( = ?auto_55881 ?auto_55887 ) ) ( AVAILABLE ?auto_55876 ) ( IN ?auto_55875 ?auto_55879 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55876 ?auto_55875 ?auto_55879 ?auto_55878 )
      ( MAKE-ON ?auto_55867 ?auto_55868 )
      ( MAKE-ON-VERIFY ?auto_55867 ?auto_55868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55888 - SURFACE
      ?auto_55889 - SURFACE
    )
    :vars
    (
      ?auto_55891 - HOIST
      ?auto_55904 - PLACE
      ?auto_55895 - PLACE
      ?auto_55899 - HOIST
      ?auto_55894 - SURFACE
      ?auto_55898 - SURFACE
      ?auto_55897 - PLACE
      ?auto_55906 - HOIST
      ?auto_55901 - SURFACE
      ?auto_55908 - SURFACE
      ?auto_55902 - PLACE
      ?auto_55903 - HOIST
      ?auto_55896 - SURFACE
      ?auto_55892 - SURFACE
      ?auto_55890 - PLACE
      ?auto_55893 - HOIST
      ?auto_55907 - SURFACE
      ?auto_55905 - SURFACE
      ?auto_55900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55891 ?auto_55904 ) ( IS-CRATE ?auto_55888 ) ( not ( = ?auto_55888 ?auto_55889 ) ) ( not ( = ?auto_55895 ?auto_55904 ) ) ( HOIST-AT ?auto_55899 ?auto_55895 ) ( not ( = ?auto_55891 ?auto_55899 ) ) ( AVAILABLE ?auto_55899 ) ( SURFACE-AT ?auto_55888 ?auto_55895 ) ( ON ?auto_55888 ?auto_55894 ) ( CLEAR ?auto_55888 ) ( not ( = ?auto_55888 ?auto_55894 ) ) ( not ( = ?auto_55889 ?auto_55894 ) ) ( IS-CRATE ?auto_55889 ) ( not ( = ?auto_55888 ?auto_55898 ) ) ( not ( = ?auto_55889 ?auto_55898 ) ) ( not ( = ?auto_55894 ?auto_55898 ) ) ( not ( = ?auto_55897 ?auto_55904 ) ) ( not ( = ?auto_55895 ?auto_55897 ) ) ( HOIST-AT ?auto_55906 ?auto_55897 ) ( not ( = ?auto_55891 ?auto_55906 ) ) ( not ( = ?auto_55899 ?auto_55906 ) ) ( AVAILABLE ?auto_55906 ) ( SURFACE-AT ?auto_55889 ?auto_55897 ) ( ON ?auto_55889 ?auto_55901 ) ( CLEAR ?auto_55889 ) ( not ( = ?auto_55888 ?auto_55901 ) ) ( not ( = ?auto_55889 ?auto_55901 ) ) ( not ( = ?auto_55894 ?auto_55901 ) ) ( not ( = ?auto_55898 ?auto_55901 ) ) ( IS-CRATE ?auto_55898 ) ( not ( = ?auto_55888 ?auto_55908 ) ) ( not ( = ?auto_55889 ?auto_55908 ) ) ( not ( = ?auto_55894 ?auto_55908 ) ) ( not ( = ?auto_55898 ?auto_55908 ) ) ( not ( = ?auto_55901 ?auto_55908 ) ) ( not ( = ?auto_55902 ?auto_55904 ) ) ( not ( = ?auto_55895 ?auto_55902 ) ) ( not ( = ?auto_55897 ?auto_55902 ) ) ( HOIST-AT ?auto_55903 ?auto_55902 ) ( not ( = ?auto_55891 ?auto_55903 ) ) ( not ( = ?auto_55899 ?auto_55903 ) ) ( not ( = ?auto_55906 ?auto_55903 ) ) ( AVAILABLE ?auto_55903 ) ( SURFACE-AT ?auto_55898 ?auto_55902 ) ( ON ?auto_55898 ?auto_55896 ) ( CLEAR ?auto_55898 ) ( not ( = ?auto_55888 ?auto_55896 ) ) ( not ( = ?auto_55889 ?auto_55896 ) ) ( not ( = ?auto_55894 ?auto_55896 ) ) ( not ( = ?auto_55898 ?auto_55896 ) ) ( not ( = ?auto_55901 ?auto_55896 ) ) ( not ( = ?auto_55908 ?auto_55896 ) ) ( IS-CRATE ?auto_55908 ) ( not ( = ?auto_55888 ?auto_55892 ) ) ( not ( = ?auto_55889 ?auto_55892 ) ) ( not ( = ?auto_55894 ?auto_55892 ) ) ( not ( = ?auto_55898 ?auto_55892 ) ) ( not ( = ?auto_55901 ?auto_55892 ) ) ( not ( = ?auto_55908 ?auto_55892 ) ) ( not ( = ?auto_55896 ?auto_55892 ) ) ( not ( = ?auto_55890 ?auto_55904 ) ) ( not ( = ?auto_55895 ?auto_55890 ) ) ( not ( = ?auto_55897 ?auto_55890 ) ) ( not ( = ?auto_55902 ?auto_55890 ) ) ( HOIST-AT ?auto_55893 ?auto_55890 ) ( not ( = ?auto_55891 ?auto_55893 ) ) ( not ( = ?auto_55899 ?auto_55893 ) ) ( not ( = ?auto_55906 ?auto_55893 ) ) ( not ( = ?auto_55903 ?auto_55893 ) ) ( AVAILABLE ?auto_55893 ) ( SURFACE-AT ?auto_55908 ?auto_55890 ) ( ON ?auto_55908 ?auto_55907 ) ( CLEAR ?auto_55908 ) ( not ( = ?auto_55888 ?auto_55907 ) ) ( not ( = ?auto_55889 ?auto_55907 ) ) ( not ( = ?auto_55894 ?auto_55907 ) ) ( not ( = ?auto_55898 ?auto_55907 ) ) ( not ( = ?auto_55901 ?auto_55907 ) ) ( not ( = ?auto_55908 ?auto_55907 ) ) ( not ( = ?auto_55896 ?auto_55907 ) ) ( not ( = ?auto_55892 ?auto_55907 ) ) ( SURFACE-AT ?auto_55905 ?auto_55904 ) ( CLEAR ?auto_55905 ) ( IS-CRATE ?auto_55892 ) ( not ( = ?auto_55888 ?auto_55905 ) ) ( not ( = ?auto_55889 ?auto_55905 ) ) ( not ( = ?auto_55894 ?auto_55905 ) ) ( not ( = ?auto_55898 ?auto_55905 ) ) ( not ( = ?auto_55901 ?auto_55905 ) ) ( not ( = ?auto_55908 ?auto_55905 ) ) ( not ( = ?auto_55896 ?auto_55905 ) ) ( not ( = ?auto_55892 ?auto_55905 ) ) ( not ( = ?auto_55907 ?auto_55905 ) ) ( AVAILABLE ?auto_55891 ) ( IN ?auto_55892 ?auto_55900 ) ( TRUCK-AT ?auto_55900 ?auto_55890 ) )
    :subtasks
    ( ( !DRIVE ?auto_55900 ?auto_55890 ?auto_55904 )
      ( MAKE-ON ?auto_55888 ?auto_55889 )
      ( MAKE-ON-VERIFY ?auto_55888 ?auto_55889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55909 - SURFACE
      ?auto_55910 - SURFACE
    )
    :vars
    (
      ?auto_55915 - HOIST
      ?auto_55924 - PLACE
      ?auto_55927 - PLACE
      ?auto_55922 - HOIST
      ?auto_55911 - SURFACE
      ?auto_55920 - SURFACE
      ?auto_55925 - PLACE
      ?auto_55912 - HOIST
      ?auto_55923 - SURFACE
      ?auto_55919 - SURFACE
      ?auto_55914 - PLACE
      ?auto_55926 - HOIST
      ?auto_55918 - SURFACE
      ?auto_55916 - SURFACE
      ?auto_55917 - PLACE
      ?auto_55928 - HOIST
      ?auto_55929 - SURFACE
      ?auto_55921 - SURFACE
      ?auto_55913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55915 ?auto_55924 ) ( IS-CRATE ?auto_55909 ) ( not ( = ?auto_55909 ?auto_55910 ) ) ( not ( = ?auto_55927 ?auto_55924 ) ) ( HOIST-AT ?auto_55922 ?auto_55927 ) ( not ( = ?auto_55915 ?auto_55922 ) ) ( AVAILABLE ?auto_55922 ) ( SURFACE-AT ?auto_55909 ?auto_55927 ) ( ON ?auto_55909 ?auto_55911 ) ( CLEAR ?auto_55909 ) ( not ( = ?auto_55909 ?auto_55911 ) ) ( not ( = ?auto_55910 ?auto_55911 ) ) ( IS-CRATE ?auto_55910 ) ( not ( = ?auto_55909 ?auto_55920 ) ) ( not ( = ?auto_55910 ?auto_55920 ) ) ( not ( = ?auto_55911 ?auto_55920 ) ) ( not ( = ?auto_55925 ?auto_55924 ) ) ( not ( = ?auto_55927 ?auto_55925 ) ) ( HOIST-AT ?auto_55912 ?auto_55925 ) ( not ( = ?auto_55915 ?auto_55912 ) ) ( not ( = ?auto_55922 ?auto_55912 ) ) ( AVAILABLE ?auto_55912 ) ( SURFACE-AT ?auto_55910 ?auto_55925 ) ( ON ?auto_55910 ?auto_55923 ) ( CLEAR ?auto_55910 ) ( not ( = ?auto_55909 ?auto_55923 ) ) ( not ( = ?auto_55910 ?auto_55923 ) ) ( not ( = ?auto_55911 ?auto_55923 ) ) ( not ( = ?auto_55920 ?auto_55923 ) ) ( IS-CRATE ?auto_55920 ) ( not ( = ?auto_55909 ?auto_55919 ) ) ( not ( = ?auto_55910 ?auto_55919 ) ) ( not ( = ?auto_55911 ?auto_55919 ) ) ( not ( = ?auto_55920 ?auto_55919 ) ) ( not ( = ?auto_55923 ?auto_55919 ) ) ( not ( = ?auto_55914 ?auto_55924 ) ) ( not ( = ?auto_55927 ?auto_55914 ) ) ( not ( = ?auto_55925 ?auto_55914 ) ) ( HOIST-AT ?auto_55926 ?auto_55914 ) ( not ( = ?auto_55915 ?auto_55926 ) ) ( not ( = ?auto_55922 ?auto_55926 ) ) ( not ( = ?auto_55912 ?auto_55926 ) ) ( AVAILABLE ?auto_55926 ) ( SURFACE-AT ?auto_55920 ?auto_55914 ) ( ON ?auto_55920 ?auto_55918 ) ( CLEAR ?auto_55920 ) ( not ( = ?auto_55909 ?auto_55918 ) ) ( not ( = ?auto_55910 ?auto_55918 ) ) ( not ( = ?auto_55911 ?auto_55918 ) ) ( not ( = ?auto_55920 ?auto_55918 ) ) ( not ( = ?auto_55923 ?auto_55918 ) ) ( not ( = ?auto_55919 ?auto_55918 ) ) ( IS-CRATE ?auto_55919 ) ( not ( = ?auto_55909 ?auto_55916 ) ) ( not ( = ?auto_55910 ?auto_55916 ) ) ( not ( = ?auto_55911 ?auto_55916 ) ) ( not ( = ?auto_55920 ?auto_55916 ) ) ( not ( = ?auto_55923 ?auto_55916 ) ) ( not ( = ?auto_55919 ?auto_55916 ) ) ( not ( = ?auto_55918 ?auto_55916 ) ) ( not ( = ?auto_55917 ?auto_55924 ) ) ( not ( = ?auto_55927 ?auto_55917 ) ) ( not ( = ?auto_55925 ?auto_55917 ) ) ( not ( = ?auto_55914 ?auto_55917 ) ) ( HOIST-AT ?auto_55928 ?auto_55917 ) ( not ( = ?auto_55915 ?auto_55928 ) ) ( not ( = ?auto_55922 ?auto_55928 ) ) ( not ( = ?auto_55912 ?auto_55928 ) ) ( not ( = ?auto_55926 ?auto_55928 ) ) ( SURFACE-AT ?auto_55919 ?auto_55917 ) ( ON ?auto_55919 ?auto_55929 ) ( CLEAR ?auto_55919 ) ( not ( = ?auto_55909 ?auto_55929 ) ) ( not ( = ?auto_55910 ?auto_55929 ) ) ( not ( = ?auto_55911 ?auto_55929 ) ) ( not ( = ?auto_55920 ?auto_55929 ) ) ( not ( = ?auto_55923 ?auto_55929 ) ) ( not ( = ?auto_55919 ?auto_55929 ) ) ( not ( = ?auto_55918 ?auto_55929 ) ) ( not ( = ?auto_55916 ?auto_55929 ) ) ( SURFACE-AT ?auto_55921 ?auto_55924 ) ( CLEAR ?auto_55921 ) ( IS-CRATE ?auto_55916 ) ( not ( = ?auto_55909 ?auto_55921 ) ) ( not ( = ?auto_55910 ?auto_55921 ) ) ( not ( = ?auto_55911 ?auto_55921 ) ) ( not ( = ?auto_55920 ?auto_55921 ) ) ( not ( = ?auto_55923 ?auto_55921 ) ) ( not ( = ?auto_55919 ?auto_55921 ) ) ( not ( = ?auto_55918 ?auto_55921 ) ) ( not ( = ?auto_55916 ?auto_55921 ) ) ( not ( = ?auto_55929 ?auto_55921 ) ) ( AVAILABLE ?auto_55915 ) ( TRUCK-AT ?auto_55913 ?auto_55917 ) ( LIFTING ?auto_55928 ?auto_55916 ) )
    :subtasks
    ( ( !LOAD ?auto_55928 ?auto_55916 ?auto_55913 ?auto_55917 )
      ( MAKE-ON ?auto_55909 ?auto_55910 )
      ( MAKE-ON-VERIFY ?auto_55909 ?auto_55910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55930 - SURFACE
      ?auto_55931 - SURFACE
    )
    :vars
    (
      ?auto_55933 - HOIST
      ?auto_55932 - PLACE
      ?auto_55946 - PLACE
      ?auto_55934 - HOIST
      ?auto_55949 - SURFACE
      ?auto_55940 - SURFACE
      ?auto_55947 - PLACE
      ?auto_55936 - HOIST
      ?auto_55950 - SURFACE
      ?auto_55943 - SURFACE
      ?auto_55948 - PLACE
      ?auto_55935 - HOIST
      ?auto_55944 - SURFACE
      ?auto_55937 - SURFACE
      ?auto_55939 - PLACE
      ?auto_55945 - HOIST
      ?auto_55941 - SURFACE
      ?auto_55938 - SURFACE
      ?auto_55942 - TRUCK
      ?auto_55951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55933 ?auto_55932 ) ( IS-CRATE ?auto_55930 ) ( not ( = ?auto_55930 ?auto_55931 ) ) ( not ( = ?auto_55946 ?auto_55932 ) ) ( HOIST-AT ?auto_55934 ?auto_55946 ) ( not ( = ?auto_55933 ?auto_55934 ) ) ( AVAILABLE ?auto_55934 ) ( SURFACE-AT ?auto_55930 ?auto_55946 ) ( ON ?auto_55930 ?auto_55949 ) ( CLEAR ?auto_55930 ) ( not ( = ?auto_55930 ?auto_55949 ) ) ( not ( = ?auto_55931 ?auto_55949 ) ) ( IS-CRATE ?auto_55931 ) ( not ( = ?auto_55930 ?auto_55940 ) ) ( not ( = ?auto_55931 ?auto_55940 ) ) ( not ( = ?auto_55949 ?auto_55940 ) ) ( not ( = ?auto_55947 ?auto_55932 ) ) ( not ( = ?auto_55946 ?auto_55947 ) ) ( HOIST-AT ?auto_55936 ?auto_55947 ) ( not ( = ?auto_55933 ?auto_55936 ) ) ( not ( = ?auto_55934 ?auto_55936 ) ) ( AVAILABLE ?auto_55936 ) ( SURFACE-AT ?auto_55931 ?auto_55947 ) ( ON ?auto_55931 ?auto_55950 ) ( CLEAR ?auto_55931 ) ( not ( = ?auto_55930 ?auto_55950 ) ) ( not ( = ?auto_55931 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55950 ) ) ( not ( = ?auto_55940 ?auto_55950 ) ) ( IS-CRATE ?auto_55940 ) ( not ( = ?auto_55930 ?auto_55943 ) ) ( not ( = ?auto_55931 ?auto_55943 ) ) ( not ( = ?auto_55949 ?auto_55943 ) ) ( not ( = ?auto_55940 ?auto_55943 ) ) ( not ( = ?auto_55950 ?auto_55943 ) ) ( not ( = ?auto_55948 ?auto_55932 ) ) ( not ( = ?auto_55946 ?auto_55948 ) ) ( not ( = ?auto_55947 ?auto_55948 ) ) ( HOIST-AT ?auto_55935 ?auto_55948 ) ( not ( = ?auto_55933 ?auto_55935 ) ) ( not ( = ?auto_55934 ?auto_55935 ) ) ( not ( = ?auto_55936 ?auto_55935 ) ) ( AVAILABLE ?auto_55935 ) ( SURFACE-AT ?auto_55940 ?auto_55948 ) ( ON ?auto_55940 ?auto_55944 ) ( CLEAR ?auto_55940 ) ( not ( = ?auto_55930 ?auto_55944 ) ) ( not ( = ?auto_55931 ?auto_55944 ) ) ( not ( = ?auto_55949 ?auto_55944 ) ) ( not ( = ?auto_55940 ?auto_55944 ) ) ( not ( = ?auto_55950 ?auto_55944 ) ) ( not ( = ?auto_55943 ?auto_55944 ) ) ( IS-CRATE ?auto_55943 ) ( not ( = ?auto_55930 ?auto_55937 ) ) ( not ( = ?auto_55931 ?auto_55937 ) ) ( not ( = ?auto_55949 ?auto_55937 ) ) ( not ( = ?auto_55940 ?auto_55937 ) ) ( not ( = ?auto_55950 ?auto_55937 ) ) ( not ( = ?auto_55943 ?auto_55937 ) ) ( not ( = ?auto_55944 ?auto_55937 ) ) ( not ( = ?auto_55939 ?auto_55932 ) ) ( not ( = ?auto_55946 ?auto_55939 ) ) ( not ( = ?auto_55947 ?auto_55939 ) ) ( not ( = ?auto_55948 ?auto_55939 ) ) ( HOIST-AT ?auto_55945 ?auto_55939 ) ( not ( = ?auto_55933 ?auto_55945 ) ) ( not ( = ?auto_55934 ?auto_55945 ) ) ( not ( = ?auto_55936 ?auto_55945 ) ) ( not ( = ?auto_55935 ?auto_55945 ) ) ( SURFACE-AT ?auto_55943 ?auto_55939 ) ( ON ?auto_55943 ?auto_55941 ) ( CLEAR ?auto_55943 ) ( not ( = ?auto_55930 ?auto_55941 ) ) ( not ( = ?auto_55931 ?auto_55941 ) ) ( not ( = ?auto_55949 ?auto_55941 ) ) ( not ( = ?auto_55940 ?auto_55941 ) ) ( not ( = ?auto_55950 ?auto_55941 ) ) ( not ( = ?auto_55943 ?auto_55941 ) ) ( not ( = ?auto_55944 ?auto_55941 ) ) ( not ( = ?auto_55937 ?auto_55941 ) ) ( SURFACE-AT ?auto_55938 ?auto_55932 ) ( CLEAR ?auto_55938 ) ( IS-CRATE ?auto_55937 ) ( not ( = ?auto_55930 ?auto_55938 ) ) ( not ( = ?auto_55931 ?auto_55938 ) ) ( not ( = ?auto_55949 ?auto_55938 ) ) ( not ( = ?auto_55940 ?auto_55938 ) ) ( not ( = ?auto_55950 ?auto_55938 ) ) ( not ( = ?auto_55943 ?auto_55938 ) ) ( not ( = ?auto_55944 ?auto_55938 ) ) ( not ( = ?auto_55937 ?auto_55938 ) ) ( not ( = ?auto_55941 ?auto_55938 ) ) ( AVAILABLE ?auto_55933 ) ( TRUCK-AT ?auto_55942 ?auto_55939 ) ( AVAILABLE ?auto_55945 ) ( SURFACE-AT ?auto_55937 ?auto_55939 ) ( ON ?auto_55937 ?auto_55951 ) ( CLEAR ?auto_55937 ) ( not ( = ?auto_55930 ?auto_55951 ) ) ( not ( = ?auto_55931 ?auto_55951 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55940 ?auto_55951 ) ) ( not ( = ?auto_55950 ?auto_55951 ) ) ( not ( = ?auto_55943 ?auto_55951 ) ) ( not ( = ?auto_55944 ?auto_55951 ) ) ( not ( = ?auto_55937 ?auto_55951 ) ) ( not ( = ?auto_55941 ?auto_55951 ) ) ( not ( = ?auto_55938 ?auto_55951 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55945 ?auto_55937 ?auto_55951 ?auto_55939 )
      ( MAKE-ON ?auto_55930 ?auto_55931 )
      ( MAKE-ON-VERIFY ?auto_55930 ?auto_55931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55952 - SURFACE
      ?auto_55953 - SURFACE
    )
    :vars
    (
      ?auto_55964 - HOIST
      ?auto_55958 - PLACE
      ?auto_55967 - PLACE
      ?auto_55968 - HOIST
      ?auto_55962 - SURFACE
      ?auto_55955 - SURFACE
      ?auto_55960 - PLACE
      ?auto_55956 - HOIST
      ?auto_55963 - SURFACE
      ?auto_55965 - SURFACE
      ?auto_55954 - PLACE
      ?auto_55966 - HOIST
      ?auto_55970 - SURFACE
      ?auto_55973 - SURFACE
      ?auto_55959 - PLACE
      ?auto_55957 - HOIST
      ?auto_55969 - SURFACE
      ?auto_55961 - SURFACE
      ?auto_55971 - SURFACE
      ?auto_55972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55964 ?auto_55958 ) ( IS-CRATE ?auto_55952 ) ( not ( = ?auto_55952 ?auto_55953 ) ) ( not ( = ?auto_55967 ?auto_55958 ) ) ( HOIST-AT ?auto_55968 ?auto_55967 ) ( not ( = ?auto_55964 ?auto_55968 ) ) ( AVAILABLE ?auto_55968 ) ( SURFACE-AT ?auto_55952 ?auto_55967 ) ( ON ?auto_55952 ?auto_55962 ) ( CLEAR ?auto_55952 ) ( not ( = ?auto_55952 ?auto_55962 ) ) ( not ( = ?auto_55953 ?auto_55962 ) ) ( IS-CRATE ?auto_55953 ) ( not ( = ?auto_55952 ?auto_55955 ) ) ( not ( = ?auto_55953 ?auto_55955 ) ) ( not ( = ?auto_55962 ?auto_55955 ) ) ( not ( = ?auto_55960 ?auto_55958 ) ) ( not ( = ?auto_55967 ?auto_55960 ) ) ( HOIST-AT ?auto_55956 ?auto_55960 ) ( not ( = ?auto_55964 ?auto_55956 ) ) ( not ( = ?auto_55968 ?auto_55956 ) ) ( AVAILABLE ?auto_55956 ) ( SURFACE-AT ?auto_55953 ?auto_55960 ) ( ON ?auto_55953 ?auto_55963 ) ( CLEAR ?auto_55953 ) ( not ( = ?auto_55952 ?auto_55963 ) ) ( not ( = ?auto_55953 ?auto_55963 ) ) ( not ( = ?auto_55962 ?auto_55963 ) ) ( not ( = ?auto_55955 ?auto_55963 ) ) ( IS-CRATE ?auto_55955 ) ( not ( = ?auto_55952 ?auto_55965 ) ) ( not ( = ?auto_55953 ?auto_55965 ) ) ( not ( = ?auto_55962 ?auto_55965 ) ) ( not ( = ?auto_55955 ?auto_55965 ) ) ( not ( = ?auto_55963 ?auto_55965 ) ) ( not ( = ?auto_55954 ?auto_55958 ) ) ( not ( = ?auto_55967 ?auto_55954 ) ) ( not ( = ?auto_55960 ?auto_55954 ) ) ( HOIST-AT ?auto_55966 ?auto_55954 ) ( not ( = ?auto_55964 ?auto_55966 ) ) ( not ( = ?auto_55968 ?auto_55966 ) ) ( not ( = ?auto_55956 ?auto_55966 ) ) ( AVAILABLE ?auto_55966 ) ( SURFACE-AT ?auto_55955 ?auto_55954 ) ( ON ?auto_55955 ?auto_55970 ) ( CLEAR ?auto_55955 ) ( not ( = ?auto_55952 ?auto_55970 ) ) ( not ( = ?auto_55953 ?auto_55970 ) ) ( not ( = ?auto_55962 ?auto_55970 ) ) ( not ( = ?auto_55955 ?auto_55970 ) ) ( not ( = ?auto_55963 ?auto_55970 ) ) ( not ( = ?auto_55965 ?auto_55970 ) ) ( IS-CRATE ?auto_55965 ) ( not ( = ?auto_55952 ?auto_55973 ) ) ( not ( = ?auto_55953 ?auto_55973 ) ) ( not ( = ?auto_55962 ?auto_55973 ) ) ( not ( = ?auto_55955 ?auto_55973 ) ) ( not ( = ?auto_55963 ?auto_55973 ) ) ( not ( = ?auto_55965 ?auto_55973 ) ) ( not ( = ?auto_55970 ?auto_55973 ) ) ( not ( = ?auto_55959 ?auto_55958 ) ) ( not ( = ?auto_55967 ?auto_55959 ) ) ( not ( = ?auto_55960 ?auto_55959 ) ) ( not ( = ?auto_55954 ?auto_55959 ) ) ( HOIST-AT ?auto_55957 ?auto_55959 ) ( not ( = ?auto_55964 ?auto_55957 ) ) ( not ( = ?auto_55968 ?auto_55957 ) ) ( not ( = ?auto_55956 ?auto_55957 ) ) ( not ( = ?auto_55966 ?auto_55957 ) ) ( SURFACE-AT ?auto_55965 ?auto_55959 ) ( ON ?auto_55965 ?auto_55969 ) ( CLEAR ?auto_55965 ) ( not ( = ?auto_55952 ?auto_55969 ) ) ( not ( = ?auto_55953 ?auto_55969 ) ) ( not ( = ?auto_55962 ?auto_55969 ) ) ( not ( = ?auto_55955 ?auto_55969 ) ) ( not ( = ?auto_55963 ?auto_55969 ) ) ( not ( = ?auto_55965 ?auto_55969 ) ) ( not ( = ?auto_55970 ?auto_55969 ) ) ( not ( = ?auto_55973 ?auto_55969 ) ) ( SURFACE-AT ?auto_55961 ?auto_55958 ) ( CLEAR ?auto_55961 ) ( IS-CRATE ?auto_55973 ) ( not ( = ?auto_55952 ?auto_55961 ) ) ( not ( = ?auto_55953 ?auto_55961 ) ) ( not ( = ?auto_55962 ?auto_55961 ) ) ( not ( = ?auto_55955 ?auto_55961 ) ) ( not ( = ?auto_55963 ?auto_55961 ) ) ( not ( = ?auto_55965 ?auto_55961 ) ) ( not ( = ?auto_55970 ?auto_55961 ) ) ( not ( = ?auto_55973 ?auto_55961 ) ) ( not ( = ?auto_55969 ?auto_55961 ) ) ( AVAILABLE ?auto_55964 ) ( AVAILABLE ?auto_55957 ) ( SURFACE-AT ?auto_55973 ?auto_55959 ) ( ON ?auto_55973 ?auto_55971 ) ( CLEAR ?auto_55973 ) ( not ( = ?auto_55952 ?auto_55971 ) ) ( not ( = ?auto_55953 ?auto_55971 ) ) ( not ( = ?auto_55962 ?auto_55971 ) ) ( not ( = ?auto_55955 ?auto_55971 ) ) ( not ( = ?auto_55963 ?auto_55971 ) ) ( not ( = ?auto_55965 ?auto_55971 ) ) ( not ( = ?auto_55970 ?auto_55971 ) ) ( not ( = ?auto_55973 ?auto_55971 ) ) ( not ( = ?auto_55969 ?auto_55971 ) ) ( not ( = ?auto_55961 ?auto_55971 ) ) ( TRUCK-AT ?auto_55972 ?auto_55958 ) )
    :subtasks
    ( ( !DRIVE ?auto_55972 ?auto_55958 ?auto_55959 )
      ( MAKE-ON ?auto_55952 ?auto_55953 )
      ( MAKE-ON-VERIFY ?auto_55952 ?auto_55953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55976 - SURFACE
      ?auto_55977 - SURFACE
    )
    :vars
    (
      ?auto_55978 - HOIST
      ?auto_55979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55978 ?auto_55979 ) ( SURFACE-AT ?auto_55977 ?auto_55979 ) ( CLEAR ?auto_55977 ) ( LIFTING ?auto_55978 ?auto_55976 ) ( IS-CRATE ?auto_55976 ) ( not ( = ?auto_55976 ?auto_55977 ) ) )
    :subtasks
    ( ( !DROP ?auto_55978 ?auto_55976 ?auto_55977 ?auto_55979 )
      ( MAKE-ON-VERIFY ?auto_55976 ?auto_55977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55980 - SURFACE
      ?auto_55981 - SURFACE
    )
    :vars
    (
      ?auto_55982 - HOIST
      ?auto_55983 - PLACE
      ?auto_55984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55982 ?auto_55983 ) ( SURFACE-AT ?auto_55981 ?auto_55983 ) ( CLEAR ?auto_55981 ) ( IS-CRATE ?auto_55980 ) ( not ( = ?auto_55980 ?auto_55981 ) ) ( TRUCK-AT ?auto_55984 ?auto_55983 ) ( AVAILABLE ?auto_55982 ) ( IN ?auto_55980 ?auto_55984 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55982 ?auto_55980 ?auto_55984 ?auto_55983 )
      ( MAKE-ON ?auto_55980 ?auto_55981 )
      ( MAKE-ON-VERIFY ?auto_55980 ?auto_55981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55985 - SURFACE
      ?auto_55986 - SURFACE
    )
    :vars
    (
      ?auto_55987 - HOIST
      ?auto_55988 - PLACE
      ?auto_55989 - TRUCK
      ?auto_55990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55987 ?auto_55988 ) ( SURFACE-AT ?auto_55986 ?auto_55988 ) ( CLEAR ?auto_55986 ) ( IS-CRATE ?auto_55985 ) ( not ( = ?auto_55985 ?auto_55986 ) ) ( AVAILABLE ?auto_55987 ) ( IN ?auto_55985 ?auto_55989 ) ( TRUCK-AT ?auto_55989 ?auto_55990 ) ( not ( = ?auto_55990 ?auto_55988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55989 ?auto_55990 ?auto_55988 )
      ( MAKE-ON ?auto_55985 ?auto_55986 )
      ( MAKE-ON-VERIFY ?auto_55985 ?auto_55986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55991 - SURFACE
      ?auto_55992 - SURFACE
    )
    :vars
    (
      ?auto_55994 - HOIST
      ?auto_55993 - PLACE
      ?auto_55995 - TRUCK
      ?auto_55996 - PLACE
      ?auto_55997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55994 ?auto_55993 ) ( SURFACE-AT ?auto_55992 ?auto_55993 ) ( CLEAR ?auto_55992 ) ( IS-CRATE ?auto_55991 ) ( not ( = ?auto_55991 ?auto_55992 ) ) ( AVAILABLE ?auto_55994 ) ( TRUCK-AT ?auto_55995 ?auto_55996 ) ( not ( = ?auto_55996 ?auto_55993 ) ) ( HOIST-AT ?auto_55997 ?auto_55996 ) ( LIFTING ?auto_55997 ?auto_55991 ) ( not ( = ?auto_55994 ?auto_55997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55997 ?auto_55991 ?auto_55995 ?auto_55996 )
      ( MAKE-ON ?auto_55991 ?auto_55992 )
      ( MAKE-ON-VERIFY ?auto_55991 ?auto_55992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55998 - SURFACE
      ?auto_55999 - SURFACE
    )
    :vars
    (
      ?auto_56003 - HOIST
      ?auto_56001 - PLACE
      ?auto_56002 - TRUCK
      ?auto_56000 - PLACE
      ?auto_56004 - HOIST
      ?auto_56005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56003 ?auto_56001 ) ( SURFACE-AT ?auto_55999 ?auto_56001 ) ( CLEAR ?auto_55999 ) ( IS-CRATE ?auto_55998 ) ( not ( = ?auto_55998 ?auto_55999 ) ) ( AVAILABLE ?auto_56003 ) ( TRUCK-AT ?auto_56002 ?auto_56000 ) ( not ( = ?auto_56000 ?auto_56001 ) ) ( HOIST-AT ?auto_56004 ?auto_56000 ) ( not ( = ?auto_56003 ?auto_56004 ) ) ( AVAILABLE ?auto_56004 ) ( SURFACE-AT ?auto_55998 ?auto_56000 ) ( ON ?auto_55998 ?auto_56005 ) ( CLEAR ?auto_55998 ) ( not ( = ?auto_55998 ?auto_56005 ) ) ( not ( = ?auto_55999 ?auto_56005 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56004 ?auto_55998 ?auto_56005 ?auto_56000 )
      ( MAKE-ON ?auto_55998 ?auto_55999 )
      ( MAKE-ON-VERIFY ?auto_55998 ?auto_55999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56006 - SURFACE
      ?auto_56007 - SURFACE
    )
    :vars
    (
      ?auto_56009 - HOIST
      ?auto_56013 - PLACE
      ?auto_56011 - PLACE
      ?auto_56010 - HOIST
      ?auto_56012 - SURFACE
      ?auto_56008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56009 ?auto_56013 ) ( SURFACE-AT ?auto_56007 ?auto_56013 ) ( CLEAR ?auto_56007 ) ( IS-CRATE ?auto_56006 ) ( not ( = ?auto_56006 ?auto_56007 ) ) ( AVAILABLE ?auto_56009 ) ( not ( = ?auto_56011 ?auto_56013 ) ) ( HOIST-AT ?auto_56010 ?auto_56011 ) ( not ( = ?auto_56009 ?auto_56010 ) ) ( AVAILABLE ?auto_56010 ) ( SURFACE-AT ?auto_56006 ?auto_56011 ) ( ON ?auto_56006 ?auto_56012 ) ( CLEAR ?auto_56006 ) ( not ( = ?auto_56006 ?auto_56012 ) ) ( not ( = ?auto_56007 ?auto_56012 ) ) ( TRUCK-AT ?auto_56008 ?auto_56013 ) )
    :subtasks
    ( ( !DRIVE ?auto_56008 ?auto_56013 ?auto_56011 )
      ( MAKE-ON ?auto_56006 ?auto_56007 )
      ( MAKE-ON-VERIFY ?auto_56006 ?auto_56007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56014 - SURFACE
      ?auto_56015 - SURFACE
    )
    :vars
    (
      ?auto_56018 - HOIST
      ?auto_56020 - PLACE
      ?auto_56017 - PLACE
      ?auto_56021 - HOIST
      ?auto_56016 - SURFACE
      ?auto_56019 - TRUCK
      ?auto_56022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56018 ?auto_56020 ) ( IS-CRATE ?auto_56014 ) ( not ( = ?auto_56014 ?auto_56015 ) ) ( not ( = ?auto_56017 ?auto_56020 ) ) ( HOIST-AT ?auto_56021 ?auto_56017 ) ( not ( = ?auto_56018 ?auto_56021 ) ) ( AVAILABLE ?auto_56021 ) ( SURFACE-AT ?auto_56014 ?auto_56017 ) ( ON ?auto_56014 ?auto_56016 ) ( CLEAR ?auto_56014 ) ( not ( = ?auto_56014 ?auto_56016 ) ) ( not ( = ?auto_56015 ?auto_56016 ) ) ( TRUCK-AT ?auto_56019 ?auto_56020 ) ( SURFACE-AT ?auto_56022 ?auto_56020 ) ( CLEAR ?auto_56022 ) ( LIFTING ?auto_56018 ?auto_56015 ) ( IS-CRATE ?auto_56015 ) ( not ( = ?auto_56014 ?auto_56022 ) ) ( not ( = ?auto_56015 ?auto_56022 ) ) ( not ( = ?auto_56016 ?auto_56022 ) ) )
    :subtasks
    ( ( !DROP ?auto_56018 ?auto_56015 ?auto_56022 ?auto_56020 )
      ( MAKE-ON ?auto_56014 ?auto_56015 )
      ( MAKE-ON-VERIFY ?auto_56014 ?auto_56015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56023 - SURFACE
      ?auto_56024 - SURFACE
    )
    :vars
    (
      ?auto_56027 - HOIST
      ?auto_56030 - PLACE
      ?auto_56026 - PLACE
      ?auto_56031 - HOIST
      ?auto_56025 - SURFACE
      ?auto_56029 - TRUCK
      ?auto_56028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56027 ?auto_56030 ) ( IS-CRATE ?auto_56023 ) ( not ( = ?auto_56023 ?auto_56024 ) ) ( not ( = ?auto_56026 ?auto_56030 ) ) ( HOIST-AT ?auto_56031 ?auto_56026 ) ( not ( = ?auto_56027 ?auto_56031 ) ) ( AVAILABLE ?auto_56031 ) ( SURFACE-AT ?auto_56023 ?auto_56026 ) ( ON ?auto_56023 ?auto_56025 ) ( CLEAR ?auto_56023 ) ( not ( = ?auto_56023 ?auto_56025 ) ) ( not ( = ?auto_56024 ?auto_56025 ) ) ( TRUCK-AT ?auto_56029 ?auto_56030 ) ( SURFACE-AT ?auto_56028 ?auto_56030 ) ( CLEAR ?auto_56028 ) ( IS-CRATE ?auto_56024 ) ( not ( = ?auto_56023 ?auto_56028 ) ) ( not ( = ?auto_56024 ?auto_56028 ) ) ( not ( = ?auto_56025 ?auto_56028 ) ) ( AVAILABLE ?auto_56027 ) ( IN ?auto_56024 ?auto_56029 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56027 ?auto_56024 ?auto_56029 ?auto_56030 )
      ( MAKE-ON ?auto_56023 ?auto_56024 )
      ( MAKE-ON-VERIFY ?auto_56023 ?auto_56024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56032 - SURFACE
      ?auto_56033 - SURFACE
    )
    :vars
    (
      ?auto_56040 - HOIST
      ?auto_56037 - PLACE
      ?auto_56036 - PLACE
      ?auto_56035 - HOIST
      ?auto_56034 - SURFACE
      ?auto_56039 - SURFACE
      ?auto_56038 - TRUCK
      ?auto_56041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56040 ?auto_56037 ) ( IS-CRATE ?auto_56032 ) ( not ( = ?auto_56032 ?auto_56033 ) ) ( not ( = ?auto_56036 ?auto_56037 ) ) ( HOIST-AT ?auto_56035 ?auto_56036 ) ( not ( = ?auto_56040 ?auto_56035 ) ) ( AVAILABLE ?auto_56035 ) ( SURFACE-AT ?auto_56032 ?auto_56036 ) ( ON ?auto_56032 ?auto_56034 ) ( CLEAR ?auto_56032 ) ( not ( = ?auto_56032 ?auto_56034 ) ) ( not ( = ?auto_56033 ?auto_56034 ) ) ( SURFACE-AT ?auto_56039 ?auto_56037 ) ( CLEAR ?auto_56039 ) ( IS-CRATE ?auto_56033 ) ( not ( = ?auto_56032 ?auto_56039 ) ) ( not ( = ?auto_56033 ?auto_56039 ) ) ( not ( = ?auto_56034 ?auto_56039 ) ) ( AVAILABLE ?auto_56040 ) ( IN ?auto_56033 ?auto_56038 ) ( TRUCK-AT ?auto_56038 ?auto_56041 ) ( not ( = ?auto_56041 ?auto_56037 ) ) ( not ( = ?auto_56036 ?auto_56041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56038 ?auto_56041 ?auto_56037 )
      ( MAKE-ON ?auto_56032 ?auto_56033 )
      ( MAKE-ON-VERIFY ?auto_56032 ?auto_56033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56042 - SURFACE
      ?auto_56043 - SURFACE
    )
    :vars
    (
      ?auto_56044 - HOIST
      ?auto_56049 - PLACE
      ?auto_56045 - PLACE
      ?auto_56051 - HOIST
      ?auto_56047 - SURFACE
      ?auto_56048 - SURFACE
      ?auto_56046 - TRUCK
      ?auto_56050 - PLACE
      ?auto_56052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56044 ?auto_56049 ) ( IS-CRATE ?auto_56042 ) ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56045 ?auto_56049 ) ) ( HOIST-AT ?auto_56051 ?auto_56045 ) ( not ( = ?auto_56044 ?auto_56051 ) ) ( AVAILABLE ?auto_56051 ) ( SURFACE-AT ?auto_56042 ?auto_56045 ) ( ON ?auto_56042 ?auto_56047 ) ( CLEAR ?auto_56042 ) ( not ( = ?auto_56042 ?auto_56047 ) ) ( not ( = ?auto_56043 ?auto_56047 ) ) ( SURFACE-AT ?auto_56048 ?auto_56049 ) ( CLEAR ?auto_56048 ) ( IS-CRATE ?auto_56043 ) ( not ( = ?auto_56042 ?auto_56048 ) ) ( not ( = ?auto_56043 ?auto_56048 ) ) ( not ( = ?auto_56047 ?auto_56048 ) ) ( AVAILABLE ?auto_56044 ) ( TRUCK-AT ?auto_56046 ?auto_56050 ) ( not ( = ?auto_56050 ?auto_56049 ) ) ( not ( = ?auto_56045 ?auto_56050 ) ) ( HOIST-AT ?auto_56052 ?auto_56050 ) ( LIFTING ?auto_56052 ?auto_56043 ) ( not ( = ?auto_56044 ?auto_56052 ) ) ( not ( = ?auto_56051 ?auto_56052 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56052 ?auto_56043 ?auto_56046 ?auto_56050 )
      ( MAKE-ON ?auto_56042 ?auto_56043 )
      ( MAKE-ON-VERIFY ?auto_56042 ?auto_56043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56053 - SURFACE
      ?auto_56054 - SURFACE
    )
    :vars
    (
      ?auto_56057 - HOIST
      ?auto_56060 - PLACE
      ?auto_56058 - PLACE
      ?auto_56062 - HOIST
      ?auto_56059 - SURFACE
      ?auto_56061 - SURFACE
      ?auto_56055 - TRUCK
      ?auto_56063 - PLACE
      ?auto_56056 - HOIST
      ?auto_56064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56057 ?auto_56060 ) ( IS-CRATE ?auto_56053 ) ( not ( = ?auto_56053 ?auto_56054 ) ) ( not ( = ?auto_56058 ?auto_56060 ) ) ( HOIST-AT ?auto_56062 ?auto_56058 ) ( not ( = ?auto_56057 ?auto_56062 ) ) ( AVAILABLE ?auto_56062 ) ( SURFACE-AT ?auto_56053 ?auto_56058 ) ( ON ?auto_56053 ?auto_56059 ) ( CLEAR ?auto_56053 ) ( not ( = ?auto_56053 ?auto_56059 ) ) ( not ( = ?auto_56054 ?auto_56059 ) ) ( SURFACE-AT ?auto_56061 ?auto_56060 ) ( CLEAR ?auto_56061 ) ( IS-CRATE ?auto_56054 ) ( not ( = ?auto_56053 ?auto_56061 ) ) ( not ( = ?auto_56054 ?auto_56061 ) ) ( not ( = ?auto_56059 ?auto_56061 ) ) ( AVAILABLE ?auto_56057 ) ( TRUCK-AT ?auto_56055 ?auto_56063 ) ( not ( = ?auto_56063 ?auto_56060 ) ) ( not ( = ?auto_56058 ?auto_56063 ) ) ( HOIST-AT ?auto_56056 ?auto_56063 ) ( not ( = ?auto_56057 ?auto_56056 ) ) ( not ( = ?auto_56062 ?auto_56056 ) ) ( AVAILABLE ?auto_56056 ) ( SURFACE-AT ?auto_56054 ?auto_56063 ) ( ON ?auto_56054 ?auto_56064 ) ( CLEAR ?auto_56054 ) ( not ( = ?auto_56053 ?auto_56064 ) ) ( not ( = ?auto_56054 ?auto_56064 ) ) ( not ( = ?auto_56059 ?auto_56064 ) ) ( not ( = ?auto_56061 ?auto_56064 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56056 ?auto_56054 ?auto_56064 ?auto_56063 )
      ( MAKE-ON ?auto_56053 ?auto_56054 )
      ( MAKE-ON-VERIFY ?auto_56053 ?auto_56054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56065 - SURFACE
      ?auto_56066 - SURFACE
    )
    :vars
    (
      ?auto_56075 - HOIST
      ?auto_56071 - PLACE
      ?auto_56070 - PLACE
      ?auto_56076 - HOIST
      ?auto_56072 - SURFACE
      ?auto_56068 - SURFACE
      ?auto_56067 - PLACE
      ?auto_56074 - HOIST
      ?auto_56073 - SURFACE
      ?auto_56069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56075 ?auto_56071 ) ( IS-CRATE ?auto_56065 ) ( not ( = ?auto_56065 ?auto_56066 ) ) ( not ( = ?auto_56070 ?auto_56071 ) ) ( HOIST-AT ?auto_56076 ?auto_56070 ) ( not ( = ?auto_56075 ?auto_56076 ) ) ( AVAILABLE ?auto_56076 ) ( SURFACE-AT ?auto_56065 ?auto_56070 ) ( ON ?auto_56065 ?auto_56072 ) ( CLEAR ?auto_56065 ) ( not ( = ?auto_56065 ?auto_56072 ) ) ( not ( = ?auto_56066 ?auto_56072 ) ) ( SURFACE-AT ?auto_56068 ?auto_56071 ) ( CLEAR ?auto_56068 ) ( IS-CRATE ?auto_56066 ) ( not ( = ?auto_56065 ?auto_56068 ) ) ( not ( = ?auto_56066 ?auto_56068 ) ) ( not ( = ?auto_56072 ?auto_56068 ) ) ( AVAILABLE ?auto_56075 ) ( not ( = ?auto_56067 ?auto_56071 ) ) ( not ( = ?auto_56070 ?auto_56067 ) ) ( HOIST-AT ?auto_56074 ?auto_56067 ) ( not ( = ?auto_56075 ?auto_56074 ) ) ( not ( = ?auto_56076 ?auto_56074 ) ) ( AVAILABLE ?auto_56074 ) ( SURFACE-AT ?auto_56066 ?auto_56067 ) ( ON ?auto_56066 ?auto_56073 ) ( CLEAR ?auto_56066 ) ( not ( = ?auto_56065 ?auto_56073 ) ) ( not ( = ?auto_56066 ?auto_56073 ) ) ( not ( = ?auto_56072 ?auto_56073 ) ) ( not ( = ?auto_56068 ?auto_56073 ) ) ( TRUCK-AT ?auto_56069 ?auto_56071 ) )
    :subtasks
    ( ( !DRIVE ?auto_56069 ?auto_56071 ?auto_56067 )
      ( MAKE-ON ?auto_56065 ?auto_56066 )
      ( MAKE-ON-VERIFY ?auto_56065 ?auto_56066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56077 - SURFACE
      ?auto_56078 - SURFACE
    )
    :vars
    (
      ?auto_56079 - HOIST
      ?auto_56083 - PLACE
      ?auto_56081 - PLACE
      ?auto_56085 - HOIST
      ?auto_56087 - SURFACE
      ?auto_56082 - SURFACE
      ?auto_56086 - PLACE
      ?auto_56080 - HOIST
      ?auto_56084 - SURFACE
      ?auto_56088 - TRUCK
      ?auto_56089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56079 ?auto_56083 ) ( IS-CRATE ?auto_56077 ) ( not ( = ?auto_56077 ?auto_56078 ) ) ( not ( = ?auto_56081 ?auto_56083 ) ) ( HOIST-AT ?auto_56085 ?auto_56081 ) ( not ( = ?auto_56079 ?auto_56085 ) ) ( AVAILABLE ?auto_56085 ) ( SURFACE-AT ?auto_56077 ?auto_56081 ) ( ON ?auto_56077 ?auto_56087 ) ( CLEAR ?auto_56077 ) ( not ( = ?auto_56077 ?auto_56087 ) ) ( not ( = ?auto_56078 ?auto_56087 ) ) ( IS-CRATE ?auto_56078 ) ( not ( = ?auto_56077 ?auto_56082 ) ) ( not ( = ?auto_56078 ?auto_56082 ) ) ( not ( = ?auto_56087 ?auto_56082 ) ) ( not ( = ?auto_56086 ?auto_56083 ) ) ( not ( = ?auto_56081 ?auto_56086 ) ) ( HOIST-AT ?auto_56080 ?auto_56086 ) ( not ( = ?auto_56079 ?auto_56080 ) ) ( not ( = ?auto_56085 ?auto_56080 ) ) ( AVAILABLE ?auto_56080 ) ( SURFACE-AT ?auto_56078 ?auto_56086 ) ( ON ?auto_56078 ?auto_56084 ) ( CLEAR ?auto_56078 ) ( not ( = ?auto_56077 ?auto_56084 ) ) ( not ( = ?auto_56078 ?auto_56084 ) ) ( not ( = ?auto_56087 ?auto_56084 ) ) ( not ( = ?auto_56082 ?auto_56084 ) ) ( TRUCK-AT ?auto_56088 ?auto_56083 ) ( SURFACE-AT ?auto_56089 ?auto_56083 ) ( CLEAR ?auto_56089 ) ( LIFTING ?auto_56079 ?auto_56082 ) ( IS-CRATE ?auto_56082 ) ( not ( = ?auto_56077 ?auto_56089 ) ) ( not ( = ?auto_56078 ?auto_56089 ) ) ( not ( = ?auto_56087 ?auto_56089 ) ) ( not ( = ?auto_56082 ?auto_56089 ) ) ( not ( = ?auto_56084 ?auto_56089 ) ) )
    :subtasks
    ( ( !DROP ?auto_56079 ?auto_56082 ?auto_56089 ?auto_56083 )
      ( MAKE-ON ?auto_56077 ?auto_56078 )
      ( MAKE-ON-VERIFY ?auto_56077 ?auto_56078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56090 - SURFACE
      ?auto_56091 - SURFACE
    )
    :vars
    (
      ?auto_56094 - HOIST
      ?auto_56102 - PLACE
      ?auto_56096 - PLACE
      ?auto_56098 - HOIST
      ?auto_56095 - SURFACE
      ?auto_56101 - SURFACE
      ?auto_56093 - PLACE
      ?auto_56097 - HOIST
      ?auto_56100 - SURFACE
      ?auto_56092 - TRUCK
      ?auto_56099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56094 ?auto_56102 ) ( IS-CRATE ?auto_56090 ) ( not ( = ?auto_56090 ?auto_56091 ) ) ( not ( = ?auto_56096 ?auto_56102 ) ) ( HOIST-AT ?auto_56098 ?auto_56096 ) ( not ( = ?auto_56094 ?auto_56098 ) ) ( AVAILABLE ?auto_56098 ) ( SURFACE-AT ?auto_56090 ?auto_56096 ) ( ON ?auto_56090 ?auto_56095 ) ( CLEAR ?auto_56090 ) ( not ( = ?auto_56090 ?auto_56095 ) ) ( not ( = ?auto_56091 ?auto_56095 ) ) ( IS-CRATE ?auto_56091 ) ( not ( = ?auto_56090 ?auto_56101 ) ) ( not ( = ?auto_56091 ?auto_56101 ) ) ( not ( = ?auto_56095 ?auto_56101 ) ) ( not ( = ?auto_56093 ?auto_56102 ) ) ( not ( = ?auto_56096 ?auto_56093 ) ) ( HOIST-AT ?auto_56097 ?auto_56093 ) ( not ( = ?auto_56094 ?auto_56097 ) ) ( not ( = ?auto_56098 ?auto_56097 ) ) ( AVAILABLE ?auto_56097 ) ( SURFACE-AT ?auto_56091 ?auto_56093 ) ( ON ?auto_56091 ?auto_56100 ) ( CLEAR ?auto_56091 ) ( not ( = ?auto_56090 ?auto_56100 ) ) ( not ( = ?auto_56091 ?auto_56100 ) ) ( not ( = ?auto_56095 ?auto_56100 ) ) ( not ( = ?auto_56101 ?auto_56100 ) ) ( TRUCK-AT ?auto_56092 ?auto_56102 ) ( SURFACE-AT ?auto_56099 ?auto_56102 ) ( CLEAR ?auto_56099 ) ( IS-CRATE ?auto_56101 ) ( not ( = ?auto_56090 ?auto_56099 ) ) ( not ( = ?auto_56091 ?auto_56099 ) ) ( not ( = ?auto_56095 ?auto_56099 ) ) ( not ( = ?auto_56101 ?auto_56099 ) ) ( not ( = ?auto_56100 ?auto_56099 ) ) ( AVAILABLE ?auto_56094 ) ( IN ?auto_56101 ?auto_56092 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56094 ?auto_56101 ?auto_56092 ?auto_56102 )
      ( MAKE-ON ?auto_56090 ?auto_56091 )
      ( MAKE-ON-VERIFY ?auto_56090 ?auto_56091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56103 - SURFACE
      ?auto_56104 - SURFACE
    )
    :vars
    (
      ?auto_56112 - HOIST
      ?auto_56111 - PLACE
      ?auto_56109 - PLACE
      ?auto_56115 - HOIST
      ?auto_56106 - SURFACE
      ?auto_56107 - SURFACE
      ?auto_56105 - PLACE
      ?auto_56110 - HOIST
      ?auto_56113 - SURFACE
      ?auto_56108 - SURFACE
      ?auto_56114 - TRUCK
      ?auto_56116 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56112 ?auto_56111 ) ( IS-CRATE ?auto_56103 ) ( not ( = ?auto_56103 ?auto_56104 ) ) ( not ( = ?auto_56109 ?auto_56111 ) ) ( HOIST-AT ?auto_56115 ?auto_56109 ) ( not ( = ?auto_56112 ?auto_56115 ) ) ( AVAILABLE ?auto_56115 ) ( SURFACE-AT ?auto_56103 ?auto_56109 ) ( ON ?auto_56103 ?auto_56106 ) ( CLEAR ?auto_56103 ) ( not ( = ?auto_56103 ?auto_56106 ) ) ( not ( = ?auto_56104 ?auto_56106 ) ) ( IS-CRATE ?auto_56104 ) ( not ( = ?auto_56103 ?auto_56107 ) ) ( not ( = ?auto_56104 ?auto_56107 ) ) ( not ( = ?auto_56106 ?auto_56107 ) ) ( not ( = ?auto_56105 ?auto_56111 ) ) ( not ( = ?auto_56109 ?auto_56105 ) ) ( HOIST-AT ?auto_56110 ?auto_56105 ) ( not ( = ?auto_56112 ?auto_56110 ) ) ( not ( = ?auto_56115 ?auto_56110 ) ) ( AVAILABLE ?auto_56110 ) ( SURFACE-AT ?auto_56104 ?auto_56105 ) ( ON ?auto_56104 ?auto_56113 ) ( CLEAR ?auto_56104 ) ( not ( = ?auto_56103 ?auto_56113 ) ) ( not ( = ?auto_56104 ?auto_56113 ) ) ( not ( = ?auto_56106 ?auto_56113 ) ) ( not ( = ?auto_56107 ?auto_56113 ) ) ( SURFACE-AT ?auto_56108 ?auto_56111 ) ( CLEAR ?auto_56108 ) ( IS-CRATE ?auto_56107 ) ( not ( = ?auto_56103 ?auto_56108 ) ) ( not ( = ?auto_56104 ?auto_56108 ) ) ( not ( = ?auto_56106 ?auto_56108 ) ) ( not ( = ?auto_56107 ?auto_56108 ) ) ( not ( = ?auto_56113 ?auto_56108 ) ) ( AVAILABLE ?auto_56112 ) ( IN ?auto_56107 ?auto_56114 ) ( TRUCK-AT ?auto_56114 ?auto_56116 ) ( not ( = ?auto_56116 ?auto_56111 ) ) ( not ( = ?auto_56109 ?auto_56116 ) ) ( not ( = ?auto_56105 ?auto_56116 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56114 ?auto_56116 ?auto_56111 )
      ( MAKE-ON ?auto_56103 ?auto_56104 )
      ( MAKE-ON-VERIFY ?auto_56103 ?auto_56104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56117 - SURFACE
      ?auto_56118 - SURFACE
    )
    :vars
    (
      ?auto_56125 - HOIST
      ?auto_56121 - PLACE
      ?auto_56124 - PLACE
      ?auto_56129 - HOIST
      ?auto_56123 - SURFACE
      ?auto_56122 - SURFACE
      ?auto_56127 - PLACE
      ?auto_56126 - HOIST
      ?auto_56120 - SURFACE
      ?auto_56130 - SURFACE
      ?auto_56119 - TRUCK
      ?auto_56128 - PLACE
      ?auto_56131 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56125 ?auto_56121 ) ( IS-CRATE ?auto_56117 ) ( not ( = ?auto_56117 ?auto_56118 ) ) ( not ( = ?auto_56124 ?auto_56121 ) ) ( HOIST-AT ?auto_56129 ?auto_56124 ) ( not ( = ?auto_56125 ?auto_56129 ) ) ( AVAILABLE ?auto_56129 ) ( SURFACE-AT ?auto_56117 ?auto_56124 ) ( ON ?auto_56117 ?auto_56123 ) ( CLEAR ?auto_56117 ) ( not ( = ?auto_56117 ?auto_56123 ) ) ( not ( = ?auto_56118 ?auto_56123 ) ) ( IS-CRATE ?auto_56118 ) ( not ( = ?auto_56117 ?auto_56122 ) ) ( not ( = ?auto_56118 ?auto_56122 ) ) ( not ( = ?auto_56123 ?auto_56122 ) ) ( not ( = ?auto_56127 ?auto_56121 ) ) ( not ( = ?auto_56124 ?auto_56127 ) ) ( HOIST-AT ?auto_56126 ?auto_56127 ) ( not ( = ?auto_56125 ?auto_56126 ) ) ( not ( = ?auto_56129 ?auto_56126 ) ) ( AVAILABLE ?auto_56126 ) ( SURFACE-AT ?auto_56118 ?auto_56127 ) ( ON ?auto_56118 ?auto_56120 ) ( CLEAR ?auto_56118 ) ( not ( = ?auto_56117 ?auto_56120 ) ) ( not ( = ?auto_56118 ?auto_56120 ) ) ( not ( = ?auto_56123 ?auto_56120 ) ) ( not ( = ?auto_56122 ?auto_56120 ) ) ( SURFACE-AT ?auto_56130 ?auto_56121 ) ( CLEAR ?auto_56130 ) ( IS-CRATE ?auto_56122 ) ( not ( = ?auto_56117 ?auto_56130 ) ) ( not ( = ?auto_56118 ?auto_56130 ) ) ( not ( = ?auto_56123 ?auto_56130 ) ) ( not ( = ?auto_56122 ?auto_56130 ) ) ( not ( = ?auto_56120 ?auto_56130 ) ) ( AVAILABLE ?auto_56125 ) ( TRUCK-AT ?auto_56119 ?auto_56128 ) ( not ( = ?auto_56128 ?auto_56121 ) ) ( not ( = ?auto_56124 ?auto_56128 ) ) ( not ( = ?auto_56127 ?auto_56128 ) ) ( HOIST-AT ?auto_56131 ?auto_56128 ) ( LIFTING ?auto_56131 ?auto_56122 ) ( not ( = ?auto_56125 ?auto_56131 ) ) ( not ( = ?auto_56129 ?auto_56131 ) ) ( not ( = ?auto_56126 ?auto_56131 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56131 ?auto_56122 ?auto_56119 ?auto_56128 )
      ( MAKE-ON ?auto_56117 ?auto_56118 )
      ( MAKE-ON-VERIFY ?auto_56117 ?auto_56118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56132 - SURFACE
      ?auto_56133 - SURFACE
    )
    :vars
    (
      ?auto_56146 - HOIST
      ?auto_56143 - PLACE
      ?auto_56137 - PLACE
      ?auto_56139 - HOIST
      ?auto_56142 - SURFACE
      ?auto_56140 - SURFACE
      ?auto_56134 - PLACE
      ?auto_56135 - HOIST
      ?auto_56141 - SURFACE
      ?auto_56138 - SURFACE
      ?auto_56136 - TRUCK
      ?auto_56144 - PLACE
      ?auto_56145 - HOIST
      ?auto_56147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56146 ?auto_56143 ) ( IS-CRATE ?auto_56132 ) ( not ( = ?auto_56132 ?auto_56133 ) ) ( not ( = ?auto_56137 ?auto_56143 ) ) ( HOIST-AT ?auto_56139 ?auto_56137 ) ( not ( = ?auto_56146 ?auto_56139 ) ) ( AVAILABLE ?auto_56139 ) ( SURFACE-AT ?auto_56132 ?auto_56137 ) ( ON ?auto_56132 ?auto_56142 ) ( CLEAR ?auto_56132 ) ( not ( = ?auto_56132 ?auto_56142 ) ) ( not ( = ?auto_56133 ?auto_56142 ) ) ( IS-CRATE ?auto_56133 ) ( not ( = ?auto_56132 ?auto_56140 ) ) ( not ( = ?auto_56133 ?auto_56140 ) ) ( not ( = ?auto_56142 ?auto_56140 ) ) ( not ( = ?auto_56134 ?auto_56143 ) ) ( not ( = ?auto_56137 ?auto_56134 ) ) ( HOIST-AT ?auto_56135 ?auto_56134 ) ( not ( = ?auto_56146 ?auto_56135 ) ) ( not ( = ?auto_56139 ?auto_56135 ) ) ( AVAILABLE ?auto_56135 ) ( SURFACE-AT ?auto_56133 ?auto_56134 ) ( ON ?auto_56133 ?auto_56141 ) ( CLEAR ?auto_56133 ) ( not ( = ?auto_56132 ?auto_56141 ) ) ( not ( = ?auto_56133 ?auto_56141 ) ) ( not ( = ?auto_56142 ?auto_56141 ) ) ( not ( = ?auto_56140 ?auto_56141 ) ) ( SURFACE-AT ?auto_56138 ?auto_56143 ) ( CLEAR ?auto_56138 ) ( IS-CRATE ?auto_56140 ) ( not ( = ?auto_56132 ?auto_56138 ) ) ( not ( = ?auto_56133 ?auto_56138 ) ) ( not ( = ?auto_56142 ?auto_56138 ) ) ( not ( = ?auto_56140 ?auto_56138 ) ) ( not ( = ?auto_56141 ?auto_56138 ) ) ( AVAILABLE ?auto_56146 ) ( TRUCK-AT ?auto_56136 ?auto_56144 ) ( not ( = ?auto_56144 ?auto_56143 ) ) ( not ( = ?auto_56137 ?auto_56144 ) ) ( not ( = ?auto_56134 ?auto_56144 ) ) ( HOIST-AT ?auto_56145 ?auto_56144 ) ( not ( = ?auto_56146 ?auto_56145 ) ) ( not ( = ?auto_56139 ?auto_56145 ) ) ( not ( = ?auto_56135 ?auto_56145 ) ) ( AVAILABLE ?auto_56145 ) ( SURFACE-AT ?auto_56140 ?auto_56144 ) ( ON ?auto_56140 ?auto_56147 ) ( CLEAR ?auto_56140 ) ( not ( = ?auto_56132 ?auto_56147 ) ) ( not ( = ?auto_56133 ?auto_56147 ) ) ( not ( = ?auto_56142 ?auto_56147 ) ) ( not ( = ?auto_56140 ?auto_56147 ) ) ( not ( = ?auto_56141 ?auto_56147 ) ) ( not ( = ?auto_56138 ?auto_56147 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56145 ?auto_56140 ?auto_56147 ?auto_56144 )
      ( MAKE-ON ?auto_56132 ?auto_56133 )
      ( MAKE-ON-VERIFY ?auto_56132 ?auto_56133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56148 - SURFACE
      ?auto_56149 - SURFACE
    )
    :vars
    (
      ?auto_56151 - HOIST
      ?auto_56162 - PLACE
      ?auto_56153 - PLACE
      ?auto_56154 - HOIST
      ?auto_56156 - SURFACE
      ?auto_56152 - SURFACE
      ?auto_56155 - PLACE
      ?auto_56158 - HOIST
      ?auto_56163 - SURFACE
      ?auto_56160 - SURFACE
      ?auto_56150 - PLACE
      ?auto_56159 - HOIST
      ?auto_56157 - SURFACE
      ?auto_56161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56151 ?auto_56162 ) ( IS-CRATE ?auto_56148 ) ( not ( = ?auto_56148 ?auto_56149 ) ) ( not ( = ?auto_56153 ?auto_56162 ) ) ( HOIST-AT ?auto_56154 ?auto_56153 ) ( not ( = ?auto_56151 ?auto_56154 ) ) ( AVAILABLE ?auto_56154 ) ( SURFACE-AT ?auto_56148 ?auto_56153 ) ( ON ?auto_56148 ?auto_56156 ) ( CLEAR ?auto_56148 ) ( not ( = ?auto_56148 ?auto_56156 ) ) ( not ( = ?auto_56149 ?auto_56156 ) ) ( IS-CRATE ?auto_56149 ) ( not ( = ?auto_56148 ?auto_56152 ) ) ( not ( = ?auto_56149 ?auto_56152 ) ) ( not ( = ?auto_56156 ?auto_56152 ) ) ( not ( = ?auto_56155 ?auto_56162 ) ) ( not ( = ?auto_56153 ?auto_56155 ) ) ( HOIST-AT ?auto_56158 ?auto_56155 ) ( not ( = ?auto_56151 ?auto_56158 ) ) ( not ( = ?auto_56154 ?auto_56158 ) ) ( AVAILABLE ?auto_56158 ) ( SURFACE-AT ?auto_56149 ?auto_56155 ) ( ON ?auto_56149 ?auto_56163 ) ( CLEAR ?auto_56149 ) ( not ( = ?auto_56148 ?auto_56163 ) ) ( not ( = ?auto_56149 ?auto_56163 ) ) ( not ( = ?auto_56156 ?auto_56163 ) ) ( not ( = ?auto_56152 ?auto_56163 ) ) ( SURFACE-AT ?auto_56160 ?auto_56162 ) ( CLEAR ?auto_56160 ) ( IS-CRATE ?auto_56152 ) ( not ( = ?auto_56148 ?auto_56160 ) ) ( not ( = ?auto_56149 ?auto_56160 ) ) ( not ( = ?auto_56156 ?auto_56160 ) ) ( not ( = ?auto_56152 ?auto_56160 ) ) ( not ( = ?auto_56163 ?auto_56160 ) ) ( AVAILABLE ?auto_56151 ) ( not ( = ?auto_56150 ?auto_56162 ) ) ( not ( = ?auto_56153 ?auto_56150 ) ) ( not ( = ?auto_56155 ?auto_56150 ) ) ( HOIST-AT ?auto_56159 ?auto_56150 ) ( not ( = ?auto_56151 ?auto_56159 ) ) ( not ( = ?auto_56154 ?auto_56159 ) ) ( not ( = ?auto_56158 ?auto_56159 ) ) ( AVAILABLE ?auto_56159 ) ( SURFACE-AT ?auto_56152 ?auto_56150 ) ( ON ?auto_56152 ?auto_56157 ) ( CLEAR ?auto_56152 ) ( not ( = ?auto_56148 ?auto_56157 ) ) ( not ( = ?auto_56149 ?auto_56157 ) ) ( not ( = ?auto_56156 ?auto_56157 ) ) ( not ( = ?auto_56152 ?auto_56157 ) ) ( not ( = ?auto_56163 ?auto_56157 ) ) ( not ( = ?auto_56160 ?auto_56157 ) ) ( TRUCK-AT ?auto_56161 ?auto_56162 ) )
    :subtasks
    ( ( !DRIVE ?auto_56161 ?auto_56162 ?auto_56150 )
      ( MAKE-ON ?auto_56148 ?auto_56149 )
      ( MAKE-ON-VERIFY ?auto_56148 ?auto_56149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56164 - SURFACE
      ?auto_56165 - SURFACE
    )
    :vars
    (
      ?auto_56171 - HOIST
      ?auto_56178 - PLACE
      ?auto_56179 - PLACE
      ?auto_56174 - HOIST
      ?auto_56175 - SURFACE
      ?auto_56176 - SURFACE
      ?auto_56173 - PLACE
      ?auto_56168 - HOIST
      ?auto_56170 - SURFACE
      ?auto_56166 - SURFACE
      ?auto_56169 - PLACE
      ?auto_56177 - HOIST
      ?auto_56172 - SURFACE
      ?auto_56167 - TRUCK
      ?auto_56180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56171 ?auto_56178 ) ( IS-CRATE ?auto_56164 ) ( not ( = ?auto_56164 ?auto_56165 ) ) ( not ( = ?auto_56179 ?auto_56178 ) ) ( HOIST-AT ?auto_56174 ?auto_56179 ) ( not ( = ?auto_56171 ?auto_56174 ) ) ( AVAILABLE ?auto_56174 ) ( SURFACE-AT ?auto_56164 ?auto_56179 ) ( ON ?auto_56164 ?auto_56175 ) ( CLEAR ?auto_56164 ) ( not ( = ?auto_56164 ?auto_56175 ) ) ( not ( = ?auto_56165 ?auto_56175 ) ) ( IS-CRATE ?auto_56165 ) ( not ( = ?auto_56164 ?auto_56176 ) ) ( not ( = ?auto_56165 ?auto_56176 ) ) ( not ( = ?auto_56175 ?auto_56176 ) ) ( not ( = ?auto_56173 ?auto_56178 ) ) ( not ( = ?auto_56179 ?auto_56173 ) ) ( HOIST-AT ?auto_56168 ?auto_56173 ) ( not ( = ?auto_56171 ?auto_56168 ) ) ( not ( = ?auto_56174 ?auto_56168 ) ) ( AVAILABLE ?auto_56168 ) ( SURFACE-AT ?auto_56165 ?auto_56173 ) ( ON ?auto_56165 ?auto_56170 ) ( CLEAR ?auto_56165 ) ( not ( = ?auto_56164 ?auto_56170 ) ) ( not ( = ?auto_56165 ?auto_56170 ) ) ( not ( = ?auto_56175 ?auto_56170 ) ) ( not ( = ?auto_56176 ?auto_56170 ) ) ( IS-CRATE ?auto_56176 ) ( not ( = ?auto_56164 ?auto_56166 ) ) ( not ( = ?auto_56165 ?auto_56166 ) ) ( not ( = ?auto_56175 ?auto_56166 ) ) ( not ( = ?auto_56176 ?auto_56166 ) ) ( not ( = ?auto_56170 ?auto_56166 ) ) ( not ( = ?auto_56169 ?auto_56178 ) ) ( not ( = ?auto_56179 ?auto_56169 ) ) ( not ( = ?auto_56173 ?auto_56169 ) ) ( HOIST-AT ?auto_56177 ?auto_56169 ) ( not ( = ?auto_56171 ?auto_56177 ) ) ( not ( = ?auto_56174 ?auto_56177 ) ) ( not ( = ?auto_56168 ?auto_56177 ) ) ( AVAILABLE ?auto_56177 ) ( SURFACE-AT ?auto_56176 ?auto_56169 ) ( ON ?auto_56176 ?auto_56172 ) ( CLEAR ?auto_56176 ) ( not ( = ?auto_56164 ?auto_56172 ) ) ( not ( = ?auto_56165 ?auto_56172 ) ) ( not ( = ?auto_56175 ?auto_56172 ) ) ( not ( = ?auto_56176 ?auto_56172 ) ) ( not ( = ?auto_56170 ?auto_56172 ) ) ( not ( = ?auto_56166 ?auto_56172 ) ) ( TRUCK-AT ?auto_56167 ?auto_56178 ) ( SURFACE-AT ?auto_56180 ?auto_56178 ) ( CLEAR ?auto_56180 ) ( LIFTING ?auto_56171 ?auto_56166 ) ( IS-CRATE ?auto_56166 ) ( not ( = ?auto_56164 ?auto_56180 ) ) ( not ( = ?auto_56165 ?auto_56180 ) ) ( not ( = ?auto_56175 ?auto_56180 ) ) ( not ( = ?auto_56176 ?auto_56180 ) ) ( not ( = ?auto_56170 ?auto_56180 ) ) ( not ( = ?auto_56166 ?auto_56180 ) ) ( not ( = ?auto_56172 ?auto_56180 ) ) )
    :subtasks
    ( ( !DROP ?auto_56171 ?auto_56166 ?auto_56180 ?auto_56178 )
      ( MAKE-ON ?auto_56164 ?auto_56165 )
      ( MAKE-ON-VERIFY ?auto_56164 ?auto_56165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56181 - SURFACE
      ?auto_56182 - SURFACE
    )
    :vars
    (
      ?auto_56195 - HOIST
      ?auto_56190 - PLACE
      ?auto_56191 - PLACE
      ?auto_56188 - HOIST
      ?auto_56183 - SURFACE
      ?auto_56192 - SURFACE
      ?auto_56189 - PLACE
      ?auto_56184 - HOIST
      ?auto_56196 - SURFACE
      ?auto_56194 - SURFACE
      ?auto_56193 - PLACE
      ?auto_56185 - HOIST
      ?auto_56187 - SURFACE
      ?auto_56197 - TRUCK
      ?auto_56186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56195 ?auto_56190 ) ( IS-CRATE ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56182 ) ) ( not ( = ?auto_56191 ?auto_56190 ) ) ( HOIST-AT ?auto_56188 ?auto_56191 ) ( not ( = ?auto_56195 ?auto_56188 ) ) ( AVAILABLE ?auto_56188 ) ( SURFACE-AT ?auto_56181 ?auto_56191 ) ( ON ?auto_56181 ?auto_56183 ) ( CLEAR ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56183 ) ) ( not ( = ?auto_56182 ?auto_56183 ) ) ( IS-CRATE ?auto_56182 ) ( not ( = ?auto_56181 ?auto_56192 ) ) ( not ( = ?auto_56182 ?auto_56192 ) ) ( not ( = ?auto_56183 ?auto_56192 ) ) ( not ( = ?auto_56189 ?auto_56190 ) ) ( not ( = ?auto_56191 ?auto_56189 ) ) ( HOIST-AT ?auto_56184 ?auto_56189 ) ( not ( = ?auto_56195 ?auto_56184 ) ) ( not ( = ?auto_56188 ?auto_56184 ) ) ( AVAILABLE ?auto_56184 ) ( SURFACE-AT ?auto_56182 ?auto_56189 ) ( ON ?auto_56182 ?auto_56196 ) ( CLEAR ?auto_56182 ) ( not ( = ?auto_56181 ?auto_56196 ) ) ( not ( = ?auto_56182 ?auto_56196 ) ) ( not ( = ?auto_56183 ?auto_56196 ) ) ( not ( = ?auto_56192 ?auto_56196 ) ) ( IS-CRATE ?auto_56192 ) ( not ( = ?auto_56181 ?auto_56194 ) ) ( not ( = ?auto_56182 ?auto_56194 ) ) ( not ( = ?auto_56183 ?auto_56194 ) ) ( not ( = ?auto_56192 ?auto_56194 ) ) ( not ( = ?auto_56196 ?auto_56194 ) ) ( not ( = ?auto_56193 ?auto_56190 ) ) ( not ( = ?auto_56191 ?auto_56193 ) ) ( not ( = ?auto_56189 ?auto_56193 ) ) ( HOIST-AT ?auto_56185 ?auto_56193 ) ( not ( = ?auto_56195 ?auto_56185 ) ) ( not ( = ?auto_56188 ?auto_56185 ) ) ( not ( = ?auto_56184 ?auto_56185 ) ) ( AVAILABLE ?auto_56185 ) ( SURFACE-AT ?auto_56192 ?auto_56193 ) ( ON ?auto_56192 ?auto_56187 ) ( CLEAR ?auto_56192 ) ( not ( = ?auto_56181 ?auto_56187 ) ) ( not ( = ?auto_56182 ?auto_56187 ) ) ( not ( = ?auto_56183 ?auto_56187 ) ) ( not ( = ?auto_56192 ?auto_56187 ) ) ( not ( = ?auto_56196 ?auto_56187 ) ) ( not ( = ?auto_56194 ?auto_56187 ) ) ( TRUCK-AT ?auto_56197 ?auto_56190 ) ( SURFACE-AT ?auto_56186 ?auto_56190 ) ( CLEAR ?auto_56186 ) ( IS-CRATE ?auto_56194 ) ( not ( = ?auto_56181 ?auto_56186 ) ) ( not ( = ?auto_56182 ?auto_56186 ) ) ( not ( = ?auto_56183 ?auto_56186 ) ) ( not ( = ?auto_56192 ?auto_56186 ) ) ( not ( = ?auto_56196 ?auto_56186 ) ) ( not ( = ?auto_56194 ?auto_56186 ) ) ( not ( = ?auto_56187 ?auto_56186 ) ) ( AVAILABLE ?auto_56195 ) ( IN ?auto_56194 ?auto_56197 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56195 ?auto_56194 ?auto_56197 ?auto_56190 )
      ( MAKE-ON ?auto_56181 ?auto_56182 )
      ( MAKE-ON-VERIFY ?auto_56181 ?auto_56182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56198 - SURFACE
      ?auto_56199 - SURFACE
    )
    :vars
    (
      ?auto_56207 - HOIST
      ?auto_56213 - PLACE
      ?auto_56206 - PLACE
      ?auto_56204 - HOIST
      ?auto_56203 - SURFACE
      ?auto_56205 - SURFACE
      ?auto_56211 - PLACE
      ?auto_56214 - HOIST
      ?auto_56209 - SURFACE
      ?auto_56200 - SURFACE
      ?auto_56210 - PLACE
      ?auto_56201 - HOIST
      ?auto_56208 - SURFACE
      ?auto_56202 - SURFACE
      ?auto_56212 - TRUCK
      ?auto_56215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56207 ?auto_56213 ) ( IS-CRATE ?auto_56198 ) ( not ( = ?auto_56198 ?auto_56199 ) ) ( not ( = ?auto_56206 ?auto_56213 ) ) ( HOIST-AT ?auto_56204 ?auto_56206 ) ( not ( = ?auto_56207 ?auto_56204 ) ) ( AVAILABLE ?auto_56204 ) ( SURFACE-AT ?auto_56198 ?auto_56206 ) ( ON ?auto_56198 ?auto_56203 ) ( CLEAR ?auto_56198 ) ( not ( = ?auto_56198 ?auto_56203 ) ) ( not ( = ?auto_56199 ?auto_56203 ) ) ( IS-CRATE ?auto_56199 ) ( not ( = ?auto_56198 ?auto_56205 ) ) ( not ( = ?auto_56199 ?auto_56205 ) ) ( not ( = ?auto_56203 ?auto_56205 ) ) ( not ( = ?auto_56211 ?auto_56213 ) ) ( not ( = ?auto_56206 ?auto_56211 ) ) ( HOIST-AT ?auto_56214 ?auto_56211 ) ( not ( = ?auto_56207 ?auto_56214 ) ) ( not ( = ?auto_56204 ?auto_56214 ) ) ( AVAILABLE ?auto_56214 ) ( SURFACE-AT ?auto_56199 ?auto_56211 ) ( ON ?auto_56199 ?auto_56209 ) ( CLEAR ?auto_56199 ) ( not ( = ?auto_56198 ?auto_56209 ) ) ( not ( = ?auto_56199 ?auto_56209 ) ) ( not ( = ?auto_56203 ?auto_56209 ) ) ( not ( = ?auto_56205 ?auto_56209 ) ) ( IS-CRATE ?auto_56205 ) ( not ( = ?auto_56198 ?auto_56200 ) ) ( not ( = ?auto_56199 ?auto_56200 ) ) ( not ( = ?auto_56203 ?auto_56200 ) ) ( not ( = ?auto_56205 ?auto_56200 ) ) ( not ( = ?auto_56209 ?auto_56200 ) ) ( not ( = ?auto_56210 ?auto_56213 ) ) ( not ( = ?auto_56206 ?auto_56210 ) ) ( not ( = ?auto_56211 ?auto_56210 ) ) ( HOIST-AT ?auto_56201 ?auto_56210 ) ( not ( = ?auto_56207 ?auto_56201 ) ) ( not ( = ?auto_56204 ?auto_56201 ) ) ( not ( = ?auto_56214 ?auto_56201 ) ) ( AVAILABLE ?auto_56201 ) ( SURFACE-AT ?auto_56205 ?auto_56210 ) ( ON ?auto_56205 ?auto_56208 ) ( CLEAR ?auto_56205 ) ( not ( = ?auto_56198 ?auto_56208 ) ) ( not ( = ?auto_56199 ?auto_56208 ) ) ( not ( = ?auto_56203 ?auto_56208 ) ) ( not ( = ?auto_56205 ?auto_56208 ) ) ( not ( = ?auto_56209 ?auto_56208 ) ) ( not ( = ?auto_56200 ?auto_56208 ) ) ( SURFACE-AT ?auto_56202 ?auto_56213 ) ( CLEAR ?auto_56202 ) ( IS-CRATE ?auto_56200 ) ( not ( = ?auto_56198 ?auto_56202 ) ) ( not ( = ?auto_56199 ?auto_56202 ) ) ( not ( = ?auto_56203 ?auto_56202 ) ) ( not ( = ?auto_56205 ?auto_56202 ) ) ( not ( = ?auto_56209 ?auto_56202 ) ) ( not ( = ?auto_56200 ?auto_56202 ) ) ( not ( = ?auto_56208 ?auto_56202 ) ) ( AVAILABLE ?auto_56207 ) ( IN ?auto_56200 ?auto_56212 ) ( TRUCK-AT ?auto_56212 ?auto_56215 ) ( not ( = ?auto_56215 ?auto_56213 ) ) ( not ( = ?auto_56206 ?auto_56215 ) ) ( not ( = ?auto_56211 ?auto_56215 ) ) ( not ( = ?auto_56210 ?auto_56215 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56212 ?auto_56215 ?auto_56213 )
      ( MAKE-ON ?auto_56198 ?auto_56199 )
      ( MAKE-ON-VERIFY ?auto_56198 ?auto_56199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56216 - SURFACE
      ?auto_56217 - SURFACE
    )
    :vars
    (
      ?auto_56222 - HOIST
      ?auto_56233 - PLACE
      ?auto_56232 - PLACE
      ?auto_56228 - HOIST
      ?auto_56221 - SURFACE
      ?auto_56223 - SURFACE
      ?auto_56226 - PLACE
      ?auto_56231 - HOIST
      ?auto_56229 - SURFACE
      ?auto_56225 - SURFACE
      ?auto_56219 - PLACE
      ?auto_56220 - HOIST
      ?auto_56230 - SURFACE
      ?auto_56224 - SURFACE
      ?auto_56218 - TRUCK
      ?auto_56227 - PLACE
      ?auto_56234 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56222 ?auto_56233 ) ( IS-CRATE ?auto_56216 ) ( not ( = ?auto_56216 ?auto_56217 ) ) ( not ( = ?auto_56232 ?auto_56233 ) ) ( HOIST-AT ?auto_56228 ?auto_56232 ) ( not ( = ?auto_56222 ?auto_56228 ) ) ( AVAILABLE ?auto_56228 ) ( SURFACE-AT ?auto_56216 ?auto_56232 ) ( ON ?auto_56216 ?auto_56221 ) ( CLEAR ?auto_56216 ) ( not ( = ?auto_56216 ?auto_56221 ) ) ( not ( = ?auto_56217 ?auto_56221 ) ) ( IS-CRATE ?auto_56217 ) ( not ( = ?auto_56216 ?auto_56223 ) ) ( not ( = ?auto_56217 ?auto_56223 ) ) ( not ( = ?auto_56221 ?auto_56223 ) ) ( not ( = ?auto_56226 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56226 ) ) ( HOIST-AT ?auto_56231 ?auto_56226 ) ( not ( = ?auto_56222 ?auto_56231 ) ) ( not ( = ?auto_56228 ?auto_56231 ) ) ( AVAILABLE ?auto_56231 ) ( SURFACE-AT ?auto_56217 ?auto_56226 ) ( ON ?auto_56217 ?auto_56229 ) ( CLEAR ?auto_56217 ) ( not ( = ?auto_56216 ?auto_56229 ) ) ( not ( = ?auto_56217 ?auto_56229 ) ) ( not ( = ?auto_56221 ?auto_56229 ) ) ( not ( = ?auto_56223 ?auto_56229 ) ) ( IS-CRATE ?auto_56223 ) ( not ( = ?auto_56216 ?auto_56225 ) ) ( not ( = ?auto_56217 ?auto_56225 ) ) ( not ( = ?auto_56221 ?auto_56225 ) ) ( not ( = ?auto_56223 ?auto_56225 ) ) ( not ( = ?auto_56229 ?auto_56225 ) ) ( not ( = ?auto_56219 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56219 ) ) ( not ( = ?auto_56226 ?auto_56219 ) ) ( HOIST-AT ?auto_56220 ?auto_56219 ) ( not ( = ?auto_56222 ?auto_56220 ) ) ( not ( = ?auto_56228 ?auto_56220 ) ) ( not ( = ?auto_56231 ?auto_56220 ) ) ( AVAILABLE ?auto_56220 ) ( SURFACE-AT ?auto_56223 ?auto_56219 ) ( ON ?auto_56223 ?auto_56230 ) ( CLEAR ?auto_56223 ) ( not ( = ?auto_56216 ?auto_56230 ) ) ( not ( = ?auto_56217 ?auto_56230 ) ) ( not ( = ?auto_56221 ?auto_56230 ) ) ( not ( = ?auto_56223 ?auto_56230 ) ) ( not ( = ?auto_56229 ?auto_56230 ) ) ( not ( = ?auto_56225 ?auto_56230 ) ) ( SURFACE-AT ?auto_56224 ?auto_56233 ) ( CLEAR ?auto_56224 ) ( IS-CRATE ?auto_56225 ) ( not ( = ?auto_56216 ?auto_56224 ) ) ( not ( = ?auto_56217 ?auto_56224 ) ) ( not ( = ?auto_56221 ?auto_56224 ) ) ( not ( = ?auto_56223 ?auto_56224 ) ) ( not ( = ?auto_56229 ?auto_56224 ) ) ( not ( = ?auto_56225 ?auto_56224 ) ) ( not ( = ?auto_56230 ?auto_56224 ) ) ( AVAILABLE ?auto_56222 ) ( TRUCK-AT ?auto_56218 ?auto_56227 ) ( not ( = ?auto_56227 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56227 ) ) ( not ( = ?auto_56226 ?auto_56227 ) ) ( not ( = ?auto_56219 ?auto_56227 ) ) ( HOIST-AT ?auto_56234 ?auto_56227 ) ( LIFTING ?auto_56234 ?auto_56225 ) ( not ( = ?auto_56222 ?auto_56234 ) ) ( not ( = ?auto_56228 ?auto_56234 ) ) ( not ( = ?auto_56231 ?auto_56234 ) ) ( not ( = ?auto_56220 ?auto_56234 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56234 ?auto_56225 ?auto_56218 ?auto_56227 )
      ( MAKE-ON ?auto_56216 ?auto_56217 )
      ( MAKE-ON-VERIFY ?auto_56216 ?auto_56217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56235 - SURFACE
      ?auto_56236 - SURFACE
    )
    :vars
    (
      ?auto_56238 - HOIST
      ?auto_56243 - PLACE
      ?auto_56240 - PLACE
      ?auto_56239 - HOIST
      ?auto_56241 - SURFACE
      ?auto_56245 - SURFACE
      ?auto_56242 - PLACE
      ?auto_56237 - HOIST
      ?auto_56247 - SURFACE
      ?auto_56251 - SURFACE
      ?auto_56252 - PLACE
      ?auto_56244 - HOIST
      ?auto_56249 - SURFACE
      ?auto_56246 - SURFACE
      ?auto_56253 - TRUCK
      ?auto_56248 - PLACE
      ?auto_56250 - HOIST
      ?auto_56254 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56238 ?auto_56243 ) ( IS-CRATE ?auto_56235 ) ( not ( = ?auto_56235 ?auto_56236 ) ) ( not ( = ?auto_56240 ?auto_56243 ) ) ( HOIST-AT ?auto_56239 ?auto_56240 ) ( not ( = ?auto_56238 ?auto_56239 ) ) ( AVAILABLE ?auto_56239 ) ( SURFACE-AT ?auto_56235 ?auto_56240 ) ( ON ?auto_56235 ?auto_56241 ) ( CLEAR ?auto_56235 ) ( not ( = ?auto_56235 ?auto_56241 ) ) ( not ( = ?auto_56236 ?auto_56241 ) ) ( IS-CRATE ?auto_56236 ) ( not ( = ?auto_56235 ?auto_56245 ) ) ( not ( = ?auto_56236 ?auto_56245 ) ) ( not ( = ?auto_56241 ?auto_56245 ) ) ( not ( = ?auto_56242 ?auto_56243 ) ) ( not ( = ?auto_56240 ?auto_56242 ) ) ( HOIST-AT ?auto_56237 ?auto_56242 ) ( not ( = ?auto_56238 ?auto_56237 ) ) ( not ( = ?auto_56239 ?auto_56237 ) ) ( AVAILABLE ?auto_56237 ) ( SURFACE-AT ?auto_56236 ?auto_56242 ) ( ON ?auto_56236 ?auto_56247 ) ( CLEAR ?auto_56236 ) ( not ( = ?auto_56235 ?auto_56247 ) ) ( not ( = ?auto_56236 ?auto_56247 ) ) ( not ( = ?auto_56241 ?auto_56247 ) ) ( not ( = ?auto_56245 ?auto_56247 ) ) ( IS-CRATE ?auto_56245 ) ( not ( = ?auto_56235 ?auto_56251 ) ) ( not ( = ?auto_56236 ?auto_56251 ) ) ( not ( = ?auto_56241 ?auto_56251 ) ) ( not ( = ?auto_56245 ?auto_56251 ) ) ( not ( = ?auto_56247 ?auto_56251 ) ) ( not ( = ?auto_56252 ?auto_56243 ) ) ( not ( = ?auto_56240 ?auto_56252 ) ) ( not ( = ?auto_56242 ?auto_56252 ) ) ( HOIST-AT ?auto_56244 ?auto_56252 ) ( not ( = ?auto_56238 ?auto_56244 ) ) ( not ( = ?auto_56239 ?auto_56244 ) ) ( not ( = ?auto_56237 ?auto_56244 ) ) ( AVAILABLE ?auto_56244 ) ( SURFACE-AT ?auto_56245 ?auto_56252 ) ( ON ?auto_56245 ?auto_56249 ) ( CLEAR ?auto_56245 ) ( not ( = ?auto_56235 ?auto_56249 ) ) ( not ( = ?auto_56236 ?auto_56249 ) ) ( not ( = ?auto_56241 ?auto_56249 ) ) ( not ( = ?auto_56245 ?auto_56249 ) ) ( not ( = ?auto_56247 ?auto_56249 ) ) ( not ( = ?auto_56251 ?auto_56249 ) ) ( SURFACE-AT ?auto_56246 ?auto_56243 ) ( CLEAR ?auto_56246 ) ( IS-CRATE ?auto_56251 ) ( not ( = ?auto_56235 ?auto_56246 ) ) ( not ( = ?auto_56236 ?auto_56246 ) ) ( not ( = ?auto_56241 ?auto_56246 ) ) ( not ( = ?auto_56245 ?auto_56246 ) ) ( not ( = ?auto_56247 ?auto_56246 ) ) ( not ( = ?auto_56251 ?auto_56246 ) ) ( not ( = ?auto_56249 ?auto_56246 ) ) ( AVAILABLE ?auto_56238 ) ( TRUCK-AT ?auto_56253 ?auto_56248 ) ( not ( = ?auto_56248 ?auto_56243 ) ) ( not ( = ?auto_56240 ?auto_56248 ) ) ( not ( = ?auto_56242 ?auto_56248 ) ) ( not ( = ?auto_56252 ?auto_56248 ) ) ( HOIST-AT ?auto_56250 ?auto_56248 ) ( not ( = ?auto_56238 ?auto_56250 ) ) ( not ( = ?auto_56239 ?auto_56250 ) ) ( not ( = ?auto_56237 ?auto_56250 ) ) ( not ( = ?auto_56244 ?auto_56250 ) ) ( AVAILABLE ?auto_56250 ) ( SURFACE-AT ?auto_56251 ?auto_56248 ) ( ON ?auto_56251 ?auto_56254 ) ( CLEAR ?auto_56251 ) ( not ( = ?auto_56235 ?auto_56254 ) ) ( not ( = ?auto_56236 ?auto_56254 ) ) ( not ( = ?auto_56241 ?auto_56254 ) ) ( not ( = ?auto_56245 ?auto_56254 ) ) ( not ( = ?auto_56247 ?auto_56254 ) ) ( not ( = ?auto_56251 ?auto_56254 ) ) ( not ( = ?auto_56249 ?auto_56254 ) ) ( not ( = ?auto_56246 ?auto_56254 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56250 ?auto_56251 ?auto_56254 ?auto_56248 )
      ( MAKE-ON ?auto_56235 ?auto_56236 )
      ( MAKE-ON-VERIFY ?auto_56235 ?auto_56236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56255 - SURFACE
      ?auto_56256 - SURFACE
    )
    :vars
    (
      ?auto_56263 - HOIST
      ?auto_56271 - PLACE
      ?auto_56262 - PLACE
      ?auto_56258 - HOIST
      ?auto_56261 - SURFACE
      ?auto_56260 - SURFACE
      ?auto_56268 - PLACE
      ?auto_56259 - HOIST
      ?auto_56274 - SURFACE
      ?auto_56270 - SURFACE
      ?auto_56266 - PLACE
      ?auto_56257 - HOIST
      ?auto_56273 - SURFACE
      ?auto_56264 - SURFACE
      ?auto_56269 - PLACE
      ?auto_56267 - HOIST
      ?auto_56272 - SURFACE
      ?auto_56265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56263 ?auto_56271 ) ( IS-CRATE ?auto_56255 ) ( not ( = ?auto_56255 ?auto_56256 ) ) ( not ( = ?auto_56262 ?auto_56271 ) ) ( HOIST-AT ?auto_56258 ?auto_56262 ) ( not ( = ?auto_56263 ?auto_56258 ) ) ( AVAILABLE ?auto_56258 ) ( SURFACE-AT ?auto_56255 ?auto_56262 ) ( ON ?auto_56255 ?auto_56261 ) ( CLEAR ?auto_56255 ) ( not ( = ?auto_56255 ?auto_56261 ) ) ( not ( = ?auto_56256 ?auto_56261 ) ) ( IS-CRATE ?auto_56256 ) ( not ( = ?auto_56255 ?auto_56260 ) ) ( not ( = ?auto_56256 ?auto_56260 ) ) ( not ( = ?auto_56261 ?auto_56260 ) ) ( not ( = ?auto_56268 ?auto_56271 ) ) ( not ( = ?auto_56262 ?auto_56268 ) ) ( HOIST-AT ?auto_56259 ?auto_56268 ) ( not ( = ?auto_56263 ?auto_56259 ) ) ( not ( = ?auto_56258 ?auto_56259 ) ) ( AVAILABLE ?auto_56259 ) ( SURFACE-AT ?auto_56256 ?auto_56268 ) ( ON ?auto_56256 ?auto_56274 ) ( CLEAR ?auto_56256 ) ( not ( = ?auto_56255 ?auto_56274 ) ) ( not ( = ?auto_56256 ?auto_56274 ) ) ( not ( = ?auto_56261 ?auto_56274 ) ) ( not ( = ?auto_56260 ?auto_56274 ) ) ( IS-CRATE ?auto_56260 ) ( not ( = ?auto_56255 ?auto_56270 ) ) ( not ( = ?auto_56256 ?auto_56270 ) ) ( not ( = ?auto_56261 ?auto_56270 ) ) ( not ( = ?auto_56260 ?auto_56270 ) ) ( not ( = ?auto_56274 ?auto_56270 ) ) ( not ( = ?auto_56266 ?auto_56271 ) ) ( not ( = ?auto_56262 ?auto_56266 ) ) ( not ( = ?auto_56268 ?auto_56266 ) ) ( HOIST-AT ?auto_56257 ?auto_56266 ) ( not ( = ?auto_56263 ?auto_56257 ) ) ( not ( = ?auto_56258 ?auto_56257 ) ) ( not ( = ?auto_56259 ?auto_56257 ) ) ( AVAILABLE ?auto_56257 ) ( SURFACE-AT ?auto_56260 ?auto_56266 ) ( ON ?auto_56260 ?auto_56273 ) ( CLEAR ?auto_56260 ) ( not ( = ?auto_56255 ?auto_56273 ) ) ( not ( = ?auto_56256 ?auto_56273 ) ) ( not ( = ?auto_56261 ?auto_56273 ) ) ( not ( = ?auto_56260 ?auto_56273 ) ) ( not ( = ?auto_56274 ?auto_56273 ) ) ( not ( = ?auto_56270 ?auto_56273 ) ) ( SURFACE-AT ?auto_56264 ?auto_56271 ) ( CLEAR ?auto_56264 ) ( IS-CRATE ?auto_56270 ) ( not ( = ?auto_56255 ?auto_56264 ) ) ( not ( = ?auto_56256 ?auto_56264 ) ) ( not ( = ?auto_56261 ?auto_56264 ) ) ( not ( = ?auto_56260 ?auto_56264 ) ) ( not ( = ?auto_56274 ?auto_56264 ) ) ( not ( = ?auto_56270 ?auto_56264 ) ) ( not ( = ?auto_56273 ?auto_56264 ) ) ( AVAILABLE ?auto_56263 ) ( not ( = ?auto_56269 ?auto_56271 ) ) ( not ( = ?auto_56262 ?auto_56269 ) ) ( not ( = ?auto_56268 ?auto_56269 ) ) ( not ( = ?auto_56266 ?auto_56269 ) ) ( HOIST-AT ?auto_56267 ?auto_56269 ) ( not ( = ?auto_56263 ?auto_56267 ) ) ( not ( = ?auto_56258 ?auto_56267 ) ) ( not ( = ?auto_56259 ?auto_56267 ) ) ( not ( = ?auto_56257 ?auto_56267 ) ) ( AVAILABLE ?auto_56267 ) ( SURFACE-AT ?auto_56270 ?auto_56269 ) ( ON ?auto_56270 ?auto_56272 ) ( CLEAR ?auto_56270 ) ( not ( = ?auto_56255 ?auto_56272 ) ) ( not ( = ?auto_56256 ?auto_56272 ) ) ( not ( = ?auto_56261 ?auto_56272 ) ) ( not ( = ?auto_56260 ?auto_56272 ) ) ( not ( = ?auto_56274 ?auto_56272 ) ) ( not ( = ?auto_56270 ?auto_56272 ) ) ( not ( = ?auto_56273 ?auto_56272 ) ) ( not ( = ?auto_56264 ?auto_56272 ) ) ( TRUCK-AT ?auto_56265 ?auto_56271 ) )
    :subtasks
    ( ( !DRIVE ?auto_56265 ?auto_56271 ?auto_56269 )
      ( MAKE-ON ?auto_56255 ?auto_56256 )
      ( MAKE-ON-VERIFY ?auto_56255 ?auto_56256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56275 - SURFACE
      ?auto_56276 - SURFACE
    )
    :vars
    (
      ?auto_56285 - HOIST
      ?auto_56278 - PLACE
      ?auto_56281 - PLACE
      ?auto_56283 - HOIST
      ?auto_56280 - SURFACE
      ?auto_56288 - SURFACE
      ?auto_56291 - PLACE
      ?auto_56289 - HOIST
      ?auto_56279 - SURFACE
      ?auto_56277 - SURFACE
      ?auto_56294 - PLACE
      ?auto_56282 - HOIST
      ?auto_56284 - SURFACE
      ?auto_56292 - SURFACE
      ?auto_56293 - PLACE
      ?auto_56287 - HOIST
      ?auto_56286 - SURFACE
      ?auto_56290 - TRUCK
      ?auto_56295 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56285 ?auto_56278 ) ( IS-CRATE ?auto_56275 ) ( not ( = ?auto_56275 ?auto_56276 ) ) ( not ( = ?auto_56281 ?auto_56278 ) ) ( HOIST-AT ?auto_56283 ?auto_56281 ) ( not ( = ?auto_56285 ?auto_56283 ) ) ( AVAILABLE ?auto_56283 ) ( SURFACE-AT ?auto_56275 ?auto_56281 ) ( ON ?auto_56275 ?auto_56280 ) ( CLEAR ?auto_56275 ) ( not ( = ?auto_56275 ?auto_56280 ) ) ( not ( = ?auto_56276 ?auto_56280 ) ) ( IS-CRATE ?auto_56276 ) ( not ( = ?auto_56275 ?auto_56288 ) ) ( not ( = ?auto_56276 ?auto_56288 ) ) ( not ( = ?auto_56280 ?auto_56288 ) ) ( not ( = ?auto_56291 ?auto_56278 ) ) ( not ( = ?auto_56281 ?auto_56291 ) ) ( HOIST-AT ?auto_56289 ?auto_56291 ) ( not ( = ?auto_56285 ?auto_56289 ) ) ( not ( = ?auto_56283 ?auto_56289 ) ) ( AVAILABLE ?auto_56289 ) ( SURFACE-AT ?auto_56276 ?auto_56291 ) ( ON ?auto_56276 ?auto_56279 ) ( CLEAR ?auto_56276 ) ( not ( = ?auto_56275 ?auto_56279 ) ) ( not ( = ?auto_56276 ?auto_56279 ) ) ( not ( = ?auto_56280 ?auto_56279 ) ) ( not ( = ?auto_56288 ?auto_56279 ) ) ( IS-CRATE ?auto_56288 ) ( not ( = ?auto_56275 ?auto_56277 ) ) ( not ( = ?auto_56276 ?auto_56277 ) ) ( not ( = ?auto_56280 ?auto_56277 ) ) ( not ( = ?auto_56288 ?auto_56277 ) ) ( not ( = ?auto_56279 ?auto_56277 ) ) ( not ( = ?auto_56294 ?auto_56278 ) ) ( not ( = ?auto_56281 ?auto_56294 ) ) ( not ( = ?auto_56291 ?auto_56294 ) ) ( HOIST-AT ?auto_56282 ?auto_56294 ) ( not ( = ?auto_56285 ?auto_56282 ) ) ( not ( = ?auto_56283 ?auto_56282 ) ) ( not ( = ?auto_56289 ?auto_56282 ) ) ( AVAILABLE ?auto_56282 ) ( SURFACE-AT ?auto_56288 ?auto_56294 ) ( ON ?auto_56288 ?auto_56284 ) ( CLEAR ?auto_56288 ) ( not ( = ?auto_56275 ?auto_56284 ) ) ( not ( = ?auto_56276 ?auto_56284 ) ) ( not ( = ?auto_56280 ?auto_56284 ) ) ( not ( = ?auto_56288 ?auto_56284 ) ) ( not ( = ?auto_56279 ?auto_56284 ) ) ( not ( = ?auto_56277 ?auto_56284 ) ) ( IS-CRATE ?auto_56277 ) ( not ( = ?auto_56275 ?auto_56292 ) ) ( not ( = ?auto_56276 ?auto_56292 ) ) ( not ( = ?auto_56280 ?auto_56292 ) ) ( not ( = ?auto_56288 ?auto_56292 ) ) ( not ( = ?auto_56279 ?auto_56292 ) ) ( not ( = ?auto_56277 ?auto_56292 ) ) ( not ( = ?auto_56284 ?auto_56292 ) ) ( not ( = ?auto_56293 ?auto_56278 ) ) ( not ( = ?auto_56281 ?auto_56293 ) ) ( not ( = ?auto_56291 ?auto_56293 ) ) ( not ( = ?auto_56294 ?auto_56293 ) ) ( HOIST-AT ?auto_56287 ?auto_56293 ) ( not ( = ?auto_56285 ?auto_56287 ) ) ( not ( = ?auto_56283 ?auto_56287 ) ) ( not ( = ?auto_56289 ?auto_56287 ) ) ( not ( = ?auto_56282 ?auto_56287 ) ) ( AVAILABLE ?auto_56287 ) ( SURFACE-AT ?auto_56277 ?auto_56293 ) ( ON ?auto_56277 ?auto_56286 ) ( CLEAR ?auto_56277 ) ( not ( = ?auto_56275 ?auto_56286 ) ) ( not ( = ?auto_56276 ?auto_56286 ) ) ( not ( = ?auto_56280 ?auto_56286 ) ) ( not ( = ?auto_56288 ?auto_56286 ) ) ( not ( = ?auto_56279 ?auto_56286 ) ) ( not ( = ?auto_56277 ?auto_56286 ) ) ( not ( = ?auto_56284 ?auto_56286 ) ) ( not ( = ?auto_56292 ?auto_56286 ) ) ( TRUCK-AT ?auto_56290 ?auto_56278 ) ( SURFACE-AT ?auto_56295 ?auto_56278 ) ( CLEAR ?auto_56295 ) ( LIFTING ?auto_56285 ?auto_56292 ) ( IS-CRATE ?auto_56292 ) ( not ( = ?auto_56275 ?auto_56295 ) ) ( not ( = ?auto_56276 ?auto_56295 ) ) ( not ( = ?auto_56280 ?auto_56295 ) ) ( not ( = ?auto_56288 ?auto_56295 ) ) ( not ( = ?auto_56279 ?auto_56295 ) ) ( not ( = ?auto_56277 ?auto_56295 ) ) ( not ( = ?auto_56284 ?auto_56295 ) ) ( not ( = ?auto_56292 ?auto_56295 ) ) ( not ( = ?auto_56286 ?auto_56295 ) ) )
    :subtasks
    ( ( !DROP ?auto_56285 ?auto_56292 ?auto_56295 ?auto_56278 )
      ( MAKE-ON ?auto_56275 ?auto_56276 )
      ( MAKE-ON-VERIFY ?auto_56275 ?auto_56276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56296 - SURFACE
      ?auto_56297 - SURFACE
    )
    :vars
    (
      ?auto_56316 - HOIST
      ?auto_56299 - PLACE
      ?auto_56312 - PLACE
      ?auto_56300 - HOIST
      ?auto_56308 - SURFACE
      ?auto_56311 - SURFACE
      ?auto_56307 - PLACE
      ?auto_56306 - HOIST
      ?auto_56298 - SURFACE
      ?auto_56305 - SURFACE
      ?auto_56304 - PLACE
      ?auto_56313 - HOIST
      ?auto_56310 - SURFACE
      ?auto_56301 - SURFACE
      ?auto_56303 - PLACE
      ?auto_56314 - HOIST
      ?auto_56302 - SURFACE
      ?auto_56309 - TRUCK
      ?auto_56315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56316 ?auto_56299 ) ( IS-CRATE ?auto_56296 ) ( not ( = ?auto_56296 ?auto_56297 ) ) ( not ( = ?auto_56312 ?auto_56299 ) ) ( HOIST-AT ?auto_56300 ?auto_56312 ) ( not ( = ?auto_56316 ?auto_56300 ) ) ( AVAILABLE ?auto_56300 ) ( SURFACE-AT ?auto_56296 ?auto_56312 ) ( ON ?auto_56296 ?auto_56308 ) ( CLEAR ?auto_56296 ) ( not ( = ?auto_56296 ?auto_56308 ) ) ( not ( = ?auto_56297 ?auto_56308 ) ) ( IS-CRATE ?auto_56297 ) ( not ( = ?auto_56296 ?auto_56311 ) ) ( not ( = ?auto_56297 ?auto_56311 ) ) ( not ( = ?auto_56308 ?auto_56311 ) ) ( not ( = ?auto_56307 ?auto_56299 ) ) ( not ( = ?auto_56312 ?auto_56307 ) ) ( HOIST-AT ?auto_56306 ?auto_56307 ) ( not ( = ?auto_56316 ?auto_56306 ) ) ( not ( = ?auto_56300 ?auto_56306 ) ) ( AVAILABLE ?auto_56306 ) ( SURFACE-AT ?auto_56297 ?auto_56307 ) ( ON ?auto_56297 ?auto_56298 ) ( CLEAR ?auto_56297 ) ( not ( = ?auto_56296 ?auto_56298 ) ) ( not ( = ?auto_56297 ?auto_56298 ) ) ( not ( = ?auto_56308 ?auto_56298 ) ) ( not ( = ?auto_56311 ?auto_56298 ) ) ( IS-CRATE ?auto_56311 ) ( not ( = ?auto_56296 ?auto_56305 ) ) ( not ( = ?auto_56297 ?auto_56305 ) ) ( not ( = ?auto_56308 ?auto_56305 ) ) ( not ( = ?auto_56311 ?auto_56305 ) ) ( not ( = ?auto_56298 ?auto_56305 ) ) ( not ( = ?auto_56304 ?auto_56299 ) ) ( not ( = ?auto_56312 ?auto_56304 ) ) ( not ( = ?auto_56307 ?auto_56304 ) ) ( HOIST-AT ?auto_56313 ?auto_56304 ) ( not ( = ?auto_56316 ?auto_56313 ) ) ( not ( = ?auto_56300 ?auto_56313 ) ) ( not ( = ?auto_56306 ?auto_56313 ) ) ( AVAILABLE ?auto_56313 ) ( SURFACE-AT ?auto_56311 ?auto_56304 ) ( ON ?auto_56311 ?auto_56310 ) ( CLEAR ?auto_56311 ) ( not ( = ?auto_56296 ?auto_56310 ) ) ( not ( = ?auto_56297 ?auto_56310 ) ) ( not ( = ?auto_56308 ?auto_56310 ) ) ( not ( = ?auto_56311 ?auto_56310 ) ) ( not ( = ?auto_56298 ?auto_56310 ) ) ( not ( = ?auto_56305 ?auto_56310 ) ) ( IS-CRATE ?auto_56305 ) ( not ( = ?auto_56296 ?auto_56301 ) ) ( not ( = ?auto_56297 ?auto_56301 ) ) ( not ( = ?auto_56308 ?auto_56301 ) ) ( not ( = ?auto_56311 ?auto_56301 ) ) ( not ( = ?auto_56298 ?auto_56301 ) ) ( not ( = ?auto_56305 ?auto_56301 ) ) ( not ( = ?auto_56310 ?auto_56301 ) ) ( not ( = ?auto_56303 ?auto_56299 ) ) ( not ( = ?auto_56312 ?auto_56303 ) ) ( not ( = ?auto_56307 ?auto_56303 ) ) ( not ( = ?auto_56304 ?auto_56303 ) ) ( HOIST-AT ?auto_56314 ?auto_56303 ) ( not ( = ?auto_56316 ?auto_56314 ) ) ( not ( = ?auto_56300 ?auto_56314 ) ) ( not ( = ?auto_56306 ?auto_56314 ) ) ( not ( = ?auto_56313 ?auto_56314 ) ) ( AVAILABLE ?auto_56314 ) ( SURFACE-AT ?auto_56305 ?auto_56303 ) ( ON ?auto_56305 ?auto_56302 ) ( CLEAR ?auto_56305 ) ( not ( = ?auto_56296 ?auto_56302 ) ) ( not ( = ?auto_56297 ?auto_56302 ) ) ( not ( = ?auto_56308 ?auto_56302 ) ) ( not ( = ?auto_56311 ?auto_56302 ) ) ( not ( = ?auto_56298 ?auto_56302 ) ) ( not ( = ?auto_56305 ?auto_56302 ) ) ( not ( = ?auto_56310 ?auto_56302 ) ) ( not ( = ?auto_56301 ?auto_56302 ) ) ( TRUCK-AT ?auto_56309 ?auto_56299 ) ( SURFACE-AT ?auto_56315 ?auto_56299 ) ( CLEAR ?auto_56315 ) ( IS-CRATE ?auto_56301 ) ( not ( = ?auto_56296 ?auto_56315 ) ) ( not ( = ?auto_56297 ?auto_56315 ) ) ( not ( = ?auto_56308 ?auto_56315 ) ) ( not ( = ?auto_56311 ?auto_56315 ) ) ( not ( = ?auto_56298 ?auto_56315 ) ) ( not ( = ?auto_56305 ?auto_56315 ) ) ( not ( = ?auto_56310 ?auto_56315 ) ) ( not ( = ?auto_56301 ?auto_56315 ) ) ( not ( = ?auto_56302 ?auto_56315 ) ) ( AVAILABLE ?auto_56316 ) ( IN ?auto_56301 ?auto_56309 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56316 ?auto_56301 ?auto_56309 ?auto_56299 )
      ( MAKE-ON ?auto_56296 ?auto_56297 )
      ( MAKE-ON-VERIFY ?auto_56296 ?auto_56297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56317 - SURFACE
      ?auto_56318 - SURFACE
    )
    :vars
    (
      ?auto_56334 - HOIST
      ?auto_56323 - PLACE
      ?auto_56320 - PLACE
      ?auto_56332 - HOIST
      ?auto_56330 - SURFACE
      ?auto_56319 - SURFACE
      ?auto_56337 - PLACE
      ?auto_56331 - HOIST
      ?auto_56322 - SURFACE
      ?auto_56328 - SURFACE
      ?auto_56325 - PLACE
      ?auto_56335 - HOIST
      ?auto_56336 - SURFACE
      ?auto_56321 - SURFACE
      ?auto_56329 - PLACE
      ?auto_56327 - HOIST
      ?auto_56324 - SURFACE
      ?auto_56333 - SURFACE
      ?auto_56326 - TRUCK
      ?auto_56338 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56334 ?auto_56323 ) ( IS-CRATE ?auto_56317 ) ( not ( = ?auto_56317 ?auto_56318 ) ) ( not ( = ?auto_56320 ?auto_56323 ) ) ( HOIST-AT ?auto_56332 ?auto_56320 ) ( not ( = ?auto_56334 ?auto_56332 ) ) ( AVAILABLE ?auto_56332 ) ( SURFACE-AT ?auto_56317 ?auto_56320 ) ( ON ?auto_56317 ?auto_56330 ) ( CLEAR ?auto_56317 ) ( not ( = ?auto_56317 ?auto_56330 ) ) ( not ( = ?auto_56318 ?auto_56330 ) ) ( IS-CRATE ?auto_56318 ) ( not ( = ?auto_56317 ?auto_56319 ) ) ( not ( = ?auto_56318 ?auto_56319 ) ) ( not ( = ?auto_56330 ?auto_56319 ) ) ( not ( = ?auto_56337 ?auto_56323 ) ) ( not ( = ?auto_56320 ?auto_56337 ) ) ( HOIST-AT ?auto_56331 ?auto_56337 ) ( not ( = ?auto_56334 ?auto_56331 ) ) ( not ( = ?auto_56332 ?auto_56331 ) ) ( AVAILABLE ?auto_56331 ) ( SURFACE-AT ?auto_56318 ?auto_56337 ) ( ON ?auto_56318 ?auto_56322 ) ( CLEAR ?auto_56318 ) ( not ( = ?auto_56317 ?auto_56322 ) ) ( not ( = ?auto_56318 ?auto_56322 ) ) ( not ( = ?auto_56330 ?auto_56322 ) ) ( not ( = ?auto_56319 ?auto_56322 ) ) ( IS-CRATE ?auto_56319 ) ( not ( = ?auto_56317 ?auto_56328 ) ) ( not ( = ?auto_56318 ?auto_56328 ) ) ( not ( = ?auto_56330 ?auto_56328 ) ) ( not ( = ?auto_56319 ?auto_56328 ) ) ( not ( = ?auto_56322 ?auto_56328 ) ) ( not ( = ?auto_56325 ?auto_56323 ) ) ( not ( = ?auto_56320 ?auto_56325 ) ) ( not ( = ?auto_56337 ?auto_56325 ) ) ( HOIST-AT ?auto_56335 ?auto_56325 ) ( not ( = ?auto_56334 ?auto_56335 ) ) ( not ( = ?auto_56332 ?auto_56335 ) ) ( not ( = ?auto_56331 ?auto_56335 ) ) ( AVAILABLE ?auto_56335 ) ( SURFACE-AT ?auto_56319 ?auto_56325 ) ( ON ?auto_56319 ?auto_56336 ) ( CLEAR ?auto_56319 ) ( not ( = ?auto_56317 ?auto_56336 ) ) ( not ( = ?auto_56318 ?auto_56336 ) ) ( not ( = ?auto_56330 ?auto_56336 ) ) ( not ( = ?auto_56319 ?auto_56336 ) ) ( not ( = ?auto_56322 ?auto_56336 ) ) ( not ( = ?auto_56328 ?auto_56336 ) ) ( IS-CRATE ?auto_56328 ) ( not ( = ?auto_56317 ?auto_56321 ) ) ( not ( = ?auto_56318 ?auto_56321 ) ) ( not ( = ?auto_56330 ?auto_56321 ) ) ( not ( = ?auto_56319 ?auto_56321 ) ) ( not ( = ?auto_56322 ?auto_56321 ) ) ( not ( = ?auto_56328 ?auto_56321 ) ) ( not ( = ?auto_56336 ?auto_56321 ) ) ( not ( = ?auto_56329 ?auto_56323 ) ) ( not ( = ?auto_56320 ?auto_56329 ) ) ( not ( = ?auto_56337 ?auto_56329 ) ) ( not ( = ?auto_56325 ?auto_56329 ) ) ( HOIST-AT ?auto_56327 ?auto_56329 ) ( not ( = ?auto_56334 ?auto_56327 ) ) ( not ( = ?auto_56332 ?auto_56327 ) ) ( not ( = ?auto_56331 ?auto_56327 ) ) ( not ( = ?auto_56335 ?auto_56327 ) ) ( AVAILABLE ?auto_56327 ) ( SURFACE-AT ?auto_56328 ?auto_56329 ) ( ON ?auto_56328 ?auto_56324 ) ( CLEAR ?auto_56328 ) ( not ( = ?auto_56317 ?auto_56324 ) ) ( not ( = ?auto_56318 ?auto_56324 ) ) ( not ( = ?auto_56330 ?auto_56324 ) ) ( not ( = ?auto_56319 ?auto_56324 ) ) ( not ( = ?auto_56322 ?auto_56324 ) ) ( not ( = ?auto_56328 ?auto_56324 ) ) ( not ( = ?auto_56336 ?auto_56324 ) ) ( not ( = ?auto_56321 ?auto_56324 ) ) ( SURFACE-AT ?auto_56333 ?auto_56323 ) ( CLEAR ?auto_56333 ) ( IS-CRATE ?auto_56321 ) ( not ( = ?auto_56317 ?auto_56333 ) ) ( not ( = ?auto_56318 ?auto_56333 ) ) ( not ( = ?auto_56330 ?auto_56333 ) ) ( not ( = ?auto_56319 ?auto_56333 ) ) ( not ( = ?auto_56322 ?auto_56333 ) ) ( not ( = ?auto_56328 ?auto_56333 ) ) ( not ( = ?auto_56336 ?auto_56333 ) ) ( not ( = ?auto_56321 ?auto_56333 ) ) ( not ( = ?auto_56324 ?auto_56333 ) ) ( AVAILABLE ?auto_56334 ) ( IN ?auto_56321 ?auto_56326 ) ( TRUCK-AT ?auto_56326 ?auto_56338 ) ( not ( = ?auto_56338 ?auto_56323 ) ) ( not ( = ?auto_56320 ?auto_56338 ) ) ( not ( = ?auto_56337 ?auto_56338 ) ) ( not ( = ?auto_56325 ?auto_56338 ) ) ( not ( = ?auto_56329 ?auto_56338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56326 ?auto_56338 ?auto_56323 )
      ( MAKE-ON ?auto_56317 ?auto_56318 )
      ( MAKE-ON-VERIFY ?auto_56317 ?auto_56318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56339 - SURFACE
      ?auto_56340 - SURFACE
    )
    :vars
    (
      ?auto_56342 - HOIST
      ?auto_56360 - PLACE
      ?auto_56358 - PLACE
      ?auto_56345 - HOIST
      ?auto_56356 - SURFACE
      ?auto_56343 - SURFACE
      ?auto_56354 - PLACE
      ?auto_56352 - HOIST
      ?auto_56348 - SURFACE
      ?auto_56357 - SURFACE
      ?auto_56351 - PLACE
      ?auto_56359 - HOIST
      ?auto_56353 - SURFACE
      ?auto_56355 - SURFACE
      ?auto_56350 - PLACE
      ?auto_56344 - HOIST
      ?auto_56349 - SURFACE
      ?auto_56347 - SURFACE
      ?auto_56341 - TRUCK
      ?auto_56346 - PLACE
      ?auto_56361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56342 ?auto_56360 ) ( IS-CRATE ?auto_56339 ) ( not ( = ?auto_56339 ?auto_56340 ) ) ( not ( = ?auto_56358 ?auto_56360 ) ) ( HOIST-AT ?auto_56345 ?auto_56358 ) ( not ( = ?auto_56342 ?auto_56345 ) ) ( AVAILABLE ?auto_56345 ) ( SURFACE-AT ?auto_56339 ?auto_56358 ) ( ON ?auto_56339 ?auto_56356 ) ( CLEAR ?auto_56339 ) ( not ( = ?auto_56339 ?auto_56356 ) ) ( not ( = ?auto_56340 ?auto_56356 ) ) ( IS-CRATE ?auto_56340 ) ( not ( = ?auto_56339 ?auto_56343 ) ) ( not ( = ?auto_56340 ?auto_56343 ) ) ( not ( = ?auto_56356 ?auto_56343 ) ) ( not ( = ?auto_56354 ?auto_56360 ) ) ( not ( = ?auto_56358 ?auto_56354 ) ) ( HOIST-AT ?auto_56352 ?auto_56354 ) ( not ( = ?auto_56342 ?auto_56352 ) ) ( not ( = ?auto_56345 ?auto_56352 ) ) ( AVAILABLE ?auto_56352 ) ( SURFACE-AT ?auto_56340 ?auto_56354 ) ( ON ?auto_56340 ?auto_56348 ) ( CLEAR ?auto_56340 ) ( not ( = ?auto_56339 ?auto_56348 ) ) ( not ( = ?auto_56340 ?auto_56348 ) ) ( not ( = ?auto_56356 ?auto_56348 ) ) ( not ( = ?auto_56343 ?auto_56348 ) ) ( IS-CRATE ?auto_56343 ) ( not ( = ?auto_56339 ?auto_56357 ) ) ( not ( = ?auto_56340 ?auto_56357 ) ) ( not ( = ?auto_56356 ?auto_56357 ) ) ( not ( = ?auto_56343 ?auto_56357 ) ) ( not ( = ?auto_56348 ?auto_56357 ) ) ( not ( = ?auto_56351 ?auto_56360 ) ) ( not ( = ?auto_56358 ?auto_56351 ) ) ( not ( = ?auto_56354 ?auto_56351 ) ) ( HOIST-AT ?auto_56359 ?auto_56351 ) ( not ( = ?auto_56342 ?auto_56359 ) ) ( not ( = ?auto_56345 ?auto_56359 ) ) ( not ( = ?auto_56352 ?auto_56359 ) ) ( AVAILABLE ?auto_56359 ) ( SURFACE-AT ?auto_56343 ?auto_56351 ) ( ON ?auto_56343 ?auto_56353 ) ( CLEAR ?auto_56343 ) ( not ( = ?auto_56339 ?auto_56353 ) ) ( not ( = ?auto_56340 ?auto_56353 ) ) ( not ( = ?auto_56356 ?auto_56353 ) ) ( not ( = ?auto_56343 ?auto_56353 ) ) ( not ( = ?auto_56348 ?auto_56353 ) ) ( not ( = ?auto_56357 ?auto_56353 ) ) ( IS-CRATE ?auto_56357 ) ( not ( = ?auto_56339 ?auto_56355 ) ) ( not ( = ?auto_56340 ?auto_56355 ) ) ( not ( = ?auto_56356 ?auto_56355 ) ) ( not ( = ?auto_56343 ?auto_56355 ) ) ( not ( = ?auto_56348 ?auto_56355 ) ) ( not ( = ?auto_56357 ?auto_56355 ) ) ( not ( = ?auto_56353 ?auto_56355 ) ) ( not ( = ?auto_56350 ?auto_56360 ) ) ( not ( = ?auto_56358 ?auto_56350 ) ) ( not ( = ?auto_56354 ?auto_56350 ) ) ( not ( = ?auto_56351 ?auto_56350 ) ) ( HOIST-AT ?auto_56344 ?auto_56350 ) ( not ( = ?auto_56342 ?auto_56344 ) ) ( not ( = ?auto_56345 ?auto_56344 ) ) ( not ( = ?auto_56352 ?auto_56344 ) ) ( not ( = ?auto_56359 ?auto_56344 ) ) ( AVAILABLE ?auto_56344 ) ( SURFACE-AT ?auto_56357 ?auto_56350 ) ( ON ?auto_56357 ?auto_56349 ) ( CLEAR ?auto_56357 ) ( not ( = ?auto_56339 ?auto_56349 ) ) ( not ( = ?auto_56340 ?auto_56349 ) ) ( not ( = ?auto_56356 ?auto_56349 ) ) ( not ( = ?auto_56343 ?auto_56349 ) ) ( not ( = ?auto_56348 ?auto_56349 ) ) ( not ( = ?auto_56357 ?auto_56349 ) ) ( not ( = ?auto_56353 ?auto_56349 ) ) ( not ( = ?auto_56355 ?auto_56349 ) ) ( SURFACE-AT ?auto_56347 ?auto_56360 ) ( CLEAR ?auto_56347 ) ( IS-CRATE ?auto_56355 ) ( not ( = ?auto_56339 ?auto_56347 ) ) ( not ( = ?auto_56340 ?auto_56347 ) ) ( not ( = ?auto_56356 ?auto_56347 ) ) ( not ( = ?auto_56343 ?auto_56347 ) ) ( not ( = ?auto_56348 ?auto_56347 ) ) ( not ( = ?auto_56357 ?auto_56347 ) ) ( not ( = ?auto_56353 ?auto_56347 ) ) ( not ( = ?auto_56355 ?auto_56347 ) ) ( not ( = ?auto_56349 ?auto_56347 ) ) ( AVAILABLE ?auto_56342 ) ( TRUCK-AT ?auto_56341 ?auto_56346 ) ( not ( = ?auto_56346 ?auto_56360 ) ) ( not ( = ?auto_56358 ?auto_56346 ) ) ( not ( = ?auto_56354 ?auto_56346 ) ) ( not ( = ?auto_56351 ?auto_56346 ) ) ( not ( = ?auto_56350 ?auto_56346 ) ) ( HOIST-AT ?auto_56361 ?auto_56346 ) ( LIFTING ?auto_56361 ?auto_56355 ) ( not ( = ?auto_56342 ?auto_56361 ) ) ( not ( = ?auto_56345 ?auto_56361 ) ) ( not ( = ?auto_56352 ?auto_56361 ) ) ( not ( = ?auto_56359 ?auto_56361 ) ) ( not ( = ?auto_56344 ?auto_56361 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56361 ?auto_56355 ?auto_56341 ?auto_56346 )
      ( MAKE-ON ?auto_56339 ?auto_56340 )
      ( MAKE-ON-VERIFY ?auto_56339 ?auto_56340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56362 - SURFACE
      ?auto_56363 - SURFACE
    )
    :vars
    (
      ?auto_56373 - HOIST
      ?auto_56372 - PLACE
      ?auto_56365 - PLACE
      ?auto_56381 - HOIST
      ?auto_56371 - SURFACE
      ?auto_56379 - SURFACE
      ?auto_56376 - PLACE
      ?auto_56383 - HOIST
      ?auto_56375 - SURFACE
      ?auto_56366 - SURFACE
      ?auto_56369 - PLACE
      ?auto_56370 - HOIST
      ?auto_56378 - SURFACE
      ?auto_56377 - SURFACE
      ?auto_56364 - PLACE
      ?auto_56380 - HOIST
      ?auto_56374 - SURFACE
      ?auto_56384 - SURFACE
      ?auto_56368 - TRUCK
      ?auto_56382 - PLACE
      ?auto_56367 - HOIST
      ?auto_56385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56373 ?auto_56372 ) ( IS-CRATE ?auto_56362 ) ( not ( = ?auto_56362 ?auto_56363 ) ) ( not ( = ?auto_56365 ?auto_56372 ) ) ( HOIST-AT ?auto_56381 ?auto_56365 ) ( not ( = ?auto_56373 ?auto_56381 ) ) ( AVAILABLE ?auto_56381 ) ( SURFACE-AT ?auto_56362 ?auto_56365 ) ( ON ?auto_56362 ?auto_56371 ) ( CLEAR ?auto_56362 ) ( not ( = ?auto_56362 ?auto_56371 ) ) ( not ( = ?auto_56363 ?auto_56371 ) ) ( IS-CRATE ?auto_56363 ) ( not ( = ?auto_56362 ?auto_56379 ) ) ( not ( = ?auto_56363 ?auto_56379 ) ) ( not ( = ?auto_56371 ?auto_56379 ) ) ( not ( = ?auto_56376 ?auto_56372 ) ) ( not ( = ?auto_56365 ?auto_56376 ) ) ( HOIST-AT ?auto_56383 ?auto_56376 ) ( not ( = ?auto_56373 ?auto_56383 ) ) ( not ( = ?auto_56381 ?auto_56383 ) ) ( AVAILABLE ?auto_56383 ) ( SURFACE-AT ?auto_56363 ?auto_56376 ) ( ON ?auto_56363 ?auto_56375 ) ( CLEAR ?auto_56363 ) ( not ( = ?auto_56362 ?auto_56375 ) ) ( not ( = ?auto_56363 ?auto_56375 ) ) ( not ( = ?auto_56371 ?auto_56375 ) ) ( not ( = ?auto_56379 ?auto_56375 ) ) ( IS-CRATE ?auto_56379 ) ( not ( = ?auto_56362 ?auto_56366 ) ) ( not ( = ?auto_56363 ?auto_56366 ) ) ( not ( = ?auto_56371 ?auto_56366 ) ) ( not ( = ?auto_56379 ?auto_56366 ) ) ( not ( = ?auto_56375 ?auto_56366 ) ) ( not ( = ?auto_56369 ?auto_56372 ) ) ( not ( = ?auto_56365 ?auto_56369 ) ) ( not ( = ?auto_56376 ?auto_56369 ) ) ( HOIST-AT ?auto_56370 ?auto_56369 ) ( not ( = ?auto_56373 ?auto_56370 ) ) ( not ( = ?auto_56381 ?auto_56370 ) ) ( not ( = ?auto_56383 ?auto_56370 ) ) ( AVAILABLE ?auto_56370 ) ( SURFACE-AT ?auto_56379 ?auto_56369 ) ( ON ?auto_56379 ?auto_56378 ) ( CLEAR ?auto_56379 ) ( not ( = ?auto_56362 ?auto_56378 ) ) ( not ( = ?auto_56363 ?auto_56378 ) ) ( not ( = ?auto_56371 ?auto_56378 ) ) ( not ( = ?auto_56379 ?auto_56378 ) ) ( not ( = ?auto_56375 ?auto_56378 ) ) ( not ( = ?auto_56366 ?auto_56378 ) ) ( IS-CRATE ?auto_56366 ) ( not ( = ?auto_56362 ?auto_56377 ) ) ( not ( = ?auto_56363 ?auto_56377 ) ) ( not ( = ?auto_56371 ?auto_56377 ) ) ( not ( = ?auto_56379 ?auto_56377 ) ) ( not ( = ?auto_56375 ?auto_56377 ) ) ( not ( = ?auto_56366 ?auto_56377 ) ) ( not ( = ?auto_56378 ?auto_56377 ) ) ( not ( = ?auto_56364 ?auto_56372 ) ) ( not ( = ?auto_56365 ?auto_56364 ) ) ( not ( = ?auto_56376 ?auto_56364 ) ) ( not ( = ?auto_56369 ?auto_56364 ) ) ( HOIST-AT ?auto_56380 ?auto_56364 ) ( not ( = ?auto_56373 ?auto_56380 ) ) ( not ( = ?auto_56381 ?auto_56380 ) ) ( not ( = ?auto_56383 ?auto_56380 ) ) ( not ( = ?auto_56370 ?auto_56380 ) ) ( AVAILABLE ?auto_56380 ) ( SURFACE-AT ?auto_56366 ?auto_56364 ) ( ON ?auto_56366 ?auto_56374 ) ( CLEAR ?auto_56366 ) ( not ( = ?auto_56362 ?auto_56374 ) ) ( not ( = ?auto_56363 ?auto_56374 ) ) ( not ( = ?auto_56371 ?auto_56374 ) ) ( not ( = ?auto_56379 ?auto_56374 ) ) ( not ( = ?auto_56375 ?auto_56374 ) ) ( not ( = ?auto_56366 ?auto_56374 ) ) ( not ( = ?auto_56378 ?auto_56374 ) ) ( not ( = ?auto_56377 ?auto_56374 ) ) ( SURFACE-AT ?auto_56384 ?auto_56372 ) ( CLEAR ?auto_56384 ) ( IS-CRATE ?auto_56377 ) ( not ( = ?auto_56362 ?auto_56384 ) ) ( not ( = ?auto_56363 ?auto_56384 ) ) ( not ( = ?auto_56371 ?auto_56384 ) ) ( not ( = ?auto_56379 ?auto_56384 ) ) ( not ( = ?auto_56375 ?auto_56384 ) ) ( not ( = ?auto_56366 ?auto_56384 ) ) ( not ( = ?auto_56378 ?auto_56384 ) ) ( not ( = ?auto_56377 ?auto_56384 ) ) ( not ( = ?auto_56374 ?auto_56384 ) ) ( AVAILABLE ?auto_56373 ) ( TRUCK-AT ?auto_56368 ?auto_56382 ) ( not ( = ?auto_56382 ?auto_56372 ) ) ( not ( = ?auto_56365 ?auto_56382 ) ) ( not ( = ?auto_56376 ?auto_56382 ) ) ( not ( = ?auto_56369 ?auto_56382 ) ) ( not ( = ?auto_56364 ?auto_56382 ) ) ( HOIST-AT ?auto_56367 ?auto_56382 ) ( not ( = ?auto_56373 ?auto_56367 ) ) ( not ( = ?auto_56381 ?auto_56367 ) ) ( not ( = ?auto_56383 ?auto_56367 ) ) ( not ( = ?auto_56370 ?auto_56367 ) ) ( not ( = ?auto_56380 ?auto_56367 ) ) ( AVAILABLE ?auto_56367 ) ( SURFACE-AT ?auto_56377 ?auto_56382 ) ( ON ?auto_56377 ?auto_56385 ) ( CLEAR ?auto_56377 ) ( not ( = ?auto_56362 ?auto_56385 ) ) ( not ( = ?auto_56363 ?auto_56385 ) ) ( not ( = ?auto_56371 ?auto_56385 ) ) ( not ( = ?auto_56379 ?auto_56385 ) ) ( not ( = ?auto_56375 ?auto_56385 ) ) ( not ( = ?auto_56366 ?auto_56385 ) ) ( not ( = ?auto_56378 ?auto_56385 ) ) ( not ( = ?auto_56377 ?auto_56385 ) ) ( not ( = ?auto_56374 ?auto_56385 ) ) ( not ( = ?auto_56384 ?auto_56385 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56367 ?auto_56377 ?auto_56385 ?auto_56382 )
      ( MAKE-ON ?auto_56362 ?auto_56363 )
      ( MAKE-ON-VERIFY ?auto_56362 ?auto_56363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56386 - SURFACE
      ?auto_56387 - SURFACE
    )
    :vars
    (
      ?auto_56392 - HOIST
      ?auto_56400 - PLACE
      ?auto_56388 - PLACE
      ?auto_56401 - HOIST
      ?auto_56397 - SURFACE
      ?auto_56406 - SURFACE
      ?auto_56399 - PLACE
      ?auto_56405 - HOIST
      ?auto_56407 - SURFACE
      ?auto_56403 - SURFACE
      ?auto_56394 - PLACE
      ?auto_56404 - HOIST
      ?auto_56402 - SURFACE
      ?auto_56409 - SURFACE
      ?auto_56393 - PLACE
      ?auto_56390 - HOIST
      ?auto_56395 - SURFACE
      ?auto_56398 - SURFACE
      ?auto_56408 - PLACE
      ?auto_56391 - HOIST
      ?auto_56396 - SURFACE
      ?auto_56389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56392 ?auto_56400 ) ( IS-CRATE ?auto_56386 ) ( not ( = ?auto_56386 ?auto_56387 ) ) ( not ( = ?auto_56388 ?auto_56400 ) ) ( HOIST-AT ?auto_56401 ?auto_56388 ) ( not ( = ?auto_56392 ?auto_56401 ) ) ( AVAILABLE ?auto_56401 ) ( SURFACE-AT ?auto_56386 ?auto_56388 ) ( ON ?auto_56386 ?auto_56397 ) ( CLEAR ?auto_56386 ) ( not ( = ?auto_56386 ?auto_56397 ) ) ( not ( = ?auto_56387 ?auto_56397 ) ) ( IS-CRATE ?auto_56387 ) ( not ( = ?auto_56386 ?auto_56406 ) ) ( not ( = ?auto_56387 ?auto_56406 ) ) ( not ( = ?auto_56397 ?auto_56406 ) ) ( not ( = ?auto_56399 ?auto_56400 ) ) ( not ( = ?auto_56388 ?auto_56399 ) ) ( HOIST-AT ?auto_56405 ?auto_56399 ) ( not ( = ?auto_56392 ?auto_56405 ) ) ( not ( = ?auto_56401 ?auto_56405 ) ) ( AVAILABLE ?auto_56405 ) ( SURFACE-AT ?auto_56387 ?auto_56399 ) ( ON ?auto_56387 ?auto_56407 ) ( CLEAR ?auto_56387 ) ( not ( = ?auto_56386 ?auto_56407 ) ) ( not ( = ?auto_56387 ?auto_56407 ) ) ( not ( = ?auto_56397 ?auto_56407 ) ) ( not ( = ?auto_56406 ?auto_56407 ) ) ( IS-CRATE ?auto_56406 ) ( not ( = ?auto_56386 ?auto_56403 ) ) ( not ( = ?auto_56387 ?auto_56403 ) ) ( not ( = ?auto_56397 ?auto_56403 ) ) ( not ( = ?auto_56406 ?auto_56403 ) ) ( not ( = ?auto_56407 ?auto_56403 ) ) ( not ( = ?auto_56394 ?auto_56400 ) ) ( not ( = ?auto_56388 ?auto_56394 ) ) ( not ( = ?auto_56399 ?auto_56394 ) ) ( HOIST-AT ?auto_56404 ?auto_56394 ) ( not ( = ?auto_56392 ?auto_56404 ) ) ( not ( = ?auto_56401 ?auto_56404 ) ) ( not ( = ?auto_56405 ?auto_56404 ) ) ( AVAILABLE ?auto_56404 ) ( SURFACE-AT ?auto_56406 ?auto_56394 ) ( ON ?auto_56406 ?auto_56402 ) ( CLEAR ?auto_56406 ) ( not ( = ?auto_56386 ?auto_56402 ) ) ( not ( = ?auto_56387 ?auto_56402 ) ) ( not ( = ?auto_56397 ?auto_56402 ) ) ( not ( = ?auto_56406 ?auto_56402 ) ) ( not ( = ?auto_56407 ?auto_56402 ) ) ( not ( = ?auto_56403 ?auto_56402 ) ) ( IS-CRATE ?auto_56403 ) ( not ( = ?auto_56386 ?auto_56409 ) ) ( not ( = ?auto_56387 ?auto_56409 ) ) ( not ( = ?auto_56397 ?auto_56409 ) ) ( not ( = ?auto_56406 ?auto_56409 ) ) ( not ( = ?auto_56407 ?auto_56409 ) ) ( not ( = ?auto_56403 ?auto_56409 ) ) ( not ( = ?auto_56402 ?auto_56409 ) ) ( not ( = ?auto_56393 ?auto_56400 ) ) ( not ( = ?auto_56388 ?auto_56393 ) ) ( not ( = ?auto_56399 ?auto_56393 ) ) ( not ( = ?auto_56394 ?auto_56393 ) ) ( HOIST-AT ?auto_56390 ?auto_56393 ) ( not ( = ?auto_56392 ?auto_56390 ) ) ( not ( = ?auto_56401 ?auto_56390 ) ) ( not ( = ?auto_56405 ?auto_56390 ) ) ( not ( = ?auto_56404 ?auto_56390 ) ) ( AVAILABLE ?auto_56390 ) ( SURFACE-AT ?auto_56403 ?auto_56393 ) ( ON ?auto_56403 ?auto_56395 ) ( CLEAR ?auto_56403 ) ( not ( = ?auto_56386 ?auto_56395 ) ) ( not ( = ?auto_56387 ?auto_56395 ) ) ( not ( = ?auto_56397 ?auto_56395 ) ) ( not ( = ?auto_56406 ?auto_56395 ) ) ( not ( = ?auto_56407 ?auto_56395 ) ) ( not ( = ?auto_56403 ?auto_56395 ) ) ( not ( = ?auto_56402 ?auto_56395 ) ) ( not ( = ?auto_56409 ?auto_56395 ) ) ( SURFACE-AT ?auto_56398 ?auto_56400 ) ( CLEAR ?auto_56398 ) ( IS-CRATE ?auto_56409 ) ( not ( = ?auto_56386 ?auto_56398 ) ) ( not ( = ?auto_56387 ?auto_56398 ) ) ( not ( = ?auto_56397 ?auto_56398 ) ) ( not ( = ?auto_56406 ?auto_56398 ) ) ( not ( = ?auto_56407 ?auto_56398 ) ) ( not ( = ?auto_56403 ?auto_56398 ) ) ( not ( = ?auto_56402 ?auto_56398 ) ) ( not ( = ?auto_56409 ?auto_56398 ) ) ( not ( = ?auto_56395 ?auto_56398 ) ) ( AVAILABLE ?auto_56392 ) ( not ( = ?auto_56408 ?auto_56400 ) ) ( not ( = ?auto_56388 ?auto_56408 ) ) ( not ( = ?auto_56399 ?auto_56408 ) ) ( not ( = ?auto_56394 ?auto_56408 ) ) ( not ( = ?auto_56393 ?auto_56408 ) ) ( HOIST-AT ?auto_56391 ?auto_56408 ) ( not ( = ?auto_56392 ?auto_56391 ) ) ( not ( = ?auto_56401 ?auto_56391 ) ) ( not ( = ?auto_56405 ?auto_56391 ) ) ( not ( = ?auto_56404 ?auto_56391 ) ) ( not ( = ?auto_56390 ?auto_56391 ) ) ( AVAILABLE ?auto_56391 ) ( SURFACE-AT ?auto_56409 ?auto_56408 ) ( ON ?auto_56409 ?auto_56396 ) ( CLEAR ?auto_56409 ) ( not ( = ?auto_56386 ?auto_56396 ) ) ( not ( = ?auto_56387 ?auto_56396 ) ) ( not ( = ?auto_56397 ?auto_56396 ) ) ( not ( = ?auto_56406 ?auto_56396 ) ) ( not ( = ?auto_56407 ?auto_56396 ) ) ( not ( = ?auto_56403 ?auto_56396 ) ) ( not ( = ?auto_56402 ?auto_56396 ) ) ( not ( = ?auto_56409 ?auto_56396 ) ) ( not ( = ?auto_56395 ?auto_56396 ) ) ( not ( = ?auto_56398 ?auto_56396 ) ) ( TRUCK-AT ?auto_56389 ?auto_56400 ) )
    :subtasks
    ( ( !DRIVE ?auto_56389 ?auto_56400 ?auto_56408 )
      ( MAKE-ON ?auto_56386 ?auto_56387 )
      ( MAKE-ON-VERIFY ?auto_56386 ?auto_56387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56410 - SURFACE
      ?auto_56411 - SURFACE
    )
    :vars
    (
      ?auto_56413 - HOIST
      ?auto_56422 - PLACE
      ?auto_56419 - PLACE
      ?auto_56432 - HOIST
      ?auto_56430 - SURFACE
      ?auto_56420 - SURFACE
      ?auto_56424 - PLACE
      ?auto_56421 - HOIST
      ?auto_56417 - SURFACE
      ?auto_56425 - SURFACE
      ?auto_56423 - PLACE
      ?auto_56416 - HOIST
      ?auto_56427 - SURFACE
      ?auto_56428 - SURFACE
      ?auto_56412 - PLACE
      ?auto_56429 - HOIST
      ?auto_56415 - SURFACE
      ?auto_56433 - SURFACE
      ?auto_56418 - PLACE
      ?auto_56431 - HOIST
      ?auto_56426 - SURFACE
      ?auto_56414 - TRUCK
      ?auto_56434 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56413 ?auto_56422 ) ( IS-CRATE ?auto_56410 ) ( not ( = ?auto_56410 ?auto_56411 ) ) ( not ( = ?auto_56419 ?auto_56422 ) ) ( HOIST-AT ?auto_56432 ?auto_56419 ) ( not ( = ?auto_56413 ?auto_56432 ) ) ( AVAILABLE ?auto_56432 ) ( SURFACE-AT ?auto_56410 ?auto_56419 ) ( ON ?auto_56410 ?auto_56430 ) ( CLEAR ?auto_56410 ) ( not ( = ?auto_56410 ?auto_56430 ) ) ( not ( = ?auto_56411 ?auto_56430 ) ) ( IS-CRATE ?auto_56411 ) ( not ( = ?auto_56410 ?auto_56420 ) ) ( not ( = ?auto_56411 ?auto_56420 ) ) ( not ( = ?auto_56430 ?auto_56420 ) ) ( not ( = ?auto_56424 ?auto_56422 ) ) ( not ( = ?auto_56419 ?auto_56424 ) ) ( HOIST-AT ?auto_56421 ?auto_56424 ) ( not ( = ?auto_56413 ?auto_56421 ) ) ( not ( = ?auto_56432 ?auto_56421 ) ) ( AVAILABLE ?auto_56421 ) ( SURFACE-AT ?auto_56411 ?auto_56424 ) ( ON ?auto_56411 ?auto_56417 ) ( CLEAR ?auto_56411 ) ( not ( = ?auto_56410 ?auto_56417 ) ) ( not ( = ?auto_56411 ?auto_56417 ) ) ( not ( = ?auto_56430 ?auto_56417 ) ) ( not ( = ?auto_56420 ?auto_56417 ) ) ( IS-CRATE ?auto_56420 ) ( not ( = ?auto_56410 ?auto_56425 ) ) ( not ( = ?auto_56411 ?auto_56425 ) ) ( not ( = ?auto_56430 ?auto_56425 ) ) ( not ( = ?auto_56420 ?auto_56425 ) ) ( not ( = ?auto_56417 ?auto_56425 ) ) ( not ( = ?auto_56423 ?auto_56422 ) ) ( not ( = ?auto_56419 ?auto_56423 ) ) ( not ( = ?auto_56424 ?auto_56423 ) ) ( HOIST-AT ?auto_56416 ?auto_56423 ) ( not ( = ?auto_56413 ?auto_56416 ) ) ( not ( = ?auto_56432 ?auto_56416 ) ) ( not ( = ?auto_56421 ?auto_56416 ) ) ( AVAILABLE ?auto_56416 ) ( SURFACE-AT ?auto_56420 ?auto_56423 ) ( ON ?auto_56420 ?auto_56427 ) ( CLEAR ?auto_56420 ) ( not ( = ?auto_56410 ?auto_56427 ) ) ( not ( = ?auto_56411 ?auto_56427 ) ) ( not ( = ?auto_56430 ?auto_56427 ) ) ( not ( = ?auto_56420 ?auto_56427 ) ) ( not ( = ?auto_56417 ?auto_56427 ) ) ( not ( = ?auto_56425 ?auto_56427 ) ) ( IS-CRATE ?auto_56425 ) ( not ( = ?auto_56410 ?auto_56428 ) ) ( not ( = ?auto_56411 ?auto_56428 ) ) ( not ( = ?auto_56430 ?auto_56428 ) ) ( not ( = ?auto_56420 ?auto_56428 ) ) ( not ( = ?auto_56417 ?auto_56428 ) ) ( not ( = ?auto_56425 ?auto_56428 ) ) ( not ( = ?auto_56427 ?auto_56428 ) ) ( not ( = ?auto_56412 ?auto_56422 ) ) ( not ( = ?auto_56419 ?auto_56412 ) ) ( not ( = ?auto_56424 ?auto_56412 ) ) ( not ( = ?auto_56423 ?auto_56412 ) ) ( HOIST-AT ?auto_56429 ?auto_56412 ) ( not ( = ?auto_56413 ?auto_56429 ) ) ( not ( = ?auto_56432 ?auto_56429 ) ) ( not ( = ?auto_56421 ?auto_56429 ) ) ( not ( = ?auto_56416 ?auto_56429 ) ) ( AVAILABLE ?auto_56429 ) ( SURFACE-AT ?auto_56425 ?auto_56412 ) ( ON ?auto_56425 ?auto_56415 ) ( CLEAR ?auto_56425 ) ( not ( = ?auto_56410 ?auto_56415 ) ) ( not ( = ?auto_56411 ?auto_56415 ) ) ( not ( = ?auto_56430 ?auto_56415 ) ) ( not ( = ?auto_56420 ?auto_56415 ) ) ( not ( = ?auto_56417 ?auto_56415 ) ) ( not ( = ?auto_56425 ?auto_56415 ) ) ( not ( = ?auto_56427 ?auto_56415 ) ) ( not ( = ?auto_56428 ?auto_56415 ) ) ( IS-CRATE ?auto_56428 ) ( not ( = ?auto_56410 ?auto_56433 ) ) ( not ( = ?auto_56411 ?auto_56433 ) ) ( not ( = ?auto_56430 ?auto_56433 ) ) ( not ( = ?auto_56420 ?auto_56433 ) ) ( not ( = ?auto_56417 ?auto_56433 ) ) ( not ( = ?auto_56425 ?auto_56433 ) ) ( not ( = ?auto_56427 ?auto_56433 ) ) ( not ( = ?auto_56428 ?auto_56433 ) ) ( not ( = ?auto_56415 ?auto_56433 ) ) ( not ( = ?auto_56418 ?auto_56422 ) ) ( not ( = ?auto_56419 ?auto_56418 ) ) ( not ( = ?auto_56424 ?auto_56418 ) ) ( not ( = ?auto_56423 ?auto_56418 ) ) ( not ( = ?auto_56412 ?auto_56418 ) ) ( HOIST-AT ?auto_56431 ?auto_56418 ) ( not ( = ?auto_56413 ?auto_56431 ) ) ( not ( = ?auto_56432 ?auto_56431 ) ) ( not ( = ?auto_56421 ?auto_56431 ) ) ( not ( = ?auto_56416 ?auto_56431 ) ) ( not ( = ?auto_56429 ?auto_56431 ) ) ( AVAILABLE ?auto_56431 ) ( SURFACE-AT ?auto_56428 ?auto_56418 ) ( ON ?auto_56428 ?auto_56426 ) ( CLEAR ?auto_56428 ) ( not ( = ?auto_56410 ?auto_56426 ) ) ( not ( = ?auto_56411 ?auto_56426 ) ) ( not ( = ?auto_56430 ?auto_56426 ) ) ( not ( = ?auto_56420 ?auto_56426 ) ) ( not ( = ?auto_56417 ?auto_56426 ) ) ( not ( = ?auto_56425 ?auto_56426 ) ) ( not ( = ?auto_56427 ?auto_56426 ) ) ( not ( = ?auto_56428 ?auto_56426 ) ) ( not ( = ?auto_56415 ?auto_56426 ) ) ( not ( = ?auto_56433 ?auto_56426 ) ) ( TRUCK-AT ?auto_56414 ?auto_56422 ) ( SURFACE-AT ?auto_56434 ?auto_56422 ) ( CLEAR ?auto_56434 ) ( LIFTING ?auto_56413 ?auto_56433 ) ( IS-CRATE ?auto_56433 ) ( not ( = ?auto_56410 ?auto_56434 ) ) ( not ( = ?auto_56411 ?auto_56434 ) ) ( not ( = ?auto_56430 ?auto_56434 ) ) ( not ( = ?auto_56420 ?auto_56434 ) ) ( not ( = ?auto_56417 ?auto_56434 ) ) ( not ( = ?auto_56425 ?auto_56434 ) ) ( not ( = ?auto_56427 ?auto_56434 ) ) ( not ( = ?auto_56428 ?auto_56434 ) ) ( not ( = ?auto_56415 ?auto_56434 ) ) ( not ( = ?auto_56433 ?auto_56434 ) ) ( not ( = ?auto_56426 ?auto_56434 ) ) )
    :subtasks
    ( ( !DROP ?auto_56413 ?auto_56433 ?auto_56434 ?auto_56422 )
      ( MAKE-ON ?auto_56410 ?auto_56411 )
      ( MAKE-ON-VERIFY ?auto_56410 ?auto_56411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56435 - SURFACE
      ?auto_56436 - SURFACE
    )
    :vars
    (
      ?auto_56441 - HOIST
      ?auto_56439 - PLACE
      ?auto_56444 - PLACE
      ?auto_56449 - HOIST
      ?auto_56457 - SURFACE
      ?auto_56446 - SURFACE
      ?auto_56453 - PLACE
      ?auto_56437 - HOIST
      ?auto_56452 - SURFACE
      ?auto_56443 - SURFACE
      ?auto_56456 - PLACE
      ?auto_56442 - HOIST
      ?auto_56454 - SURFACE
      ?auto_56450 - SURFACE
      ?auto_56455 - PLACE
      ?auto_56451 - HOIST
      ?auto_56445 - SURFACE
      ?auto_56438 - SURFACE
      ?auto_56440 - PLACE
      ?auto_56458 - HOIST
      ?auto_56459 - SURFACE
      ?auto_56447 - TRUCK
      ?auto_56448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56441 ?auto_56439 ) ( IS-CRATE ?auto_56435 ) ( not ( = ?auto_56435 ?auto_56436 ) ) ( not ( = ?auto_56444 ?auto_56439 ) ) ( HOIST-AT ?auto_56449 ?auto_56444 ) ( not ( = ?auto_56441 ?auto_56449 ) ) ( AVAILABLE ?auto_56449 ) ( SURFACE-AT ?auto_56435 ?auto_56444 ) ( ON ?auto_56435 ?auto_56457 ) ( CLEAR ?auto_56435 ) ( not ( = ?auto_56435 ?auto_56457 ) ) ( not ( = ?auto_56436 ?auto_56457 ) ) ( IS-CRATE ?auto_56436 ) ( not ( = ?auto_56435 ?auto_56446 ) ) ( not ( = ?auto_56436 ?auto_56446 ) ) ( not ( = ?auto_56457 ?auto_56446 ) ) ( not ( = ?auto_56453 ?auto_56439 ) ) ( not ( = ?auto_56444 ?auto_56453 ) ) ( HOIST-AT ?auto_56437 ?auto_56453 ) ( not ( = ?auto_56441 ?auto_56437 ) ) ( not ( = ?auto_56449 ?auto_56437 ) ) ( AVAILABLE ?auto_56437 ) ( SURFACE-AT ?auto_56436 ?auto_56453 ) ( ON ?auto_56436 ?auto_56452 ) ( CLEAR ?auto_56436 ) ( not ( = ?auto_56435 ?auto_56452 ) ) ( not ( = ?auto_56436 ?auto_56452 ) ) ( not ( = ?auto_56457 ?auto_56452 ) ) ( not ( = ?auto_56446 ?auto_56452 ) ) ( IS-CRATE ?auto_56446 ) ( not ( = ?auto_56435 ?auto_56443 ) ) ( not ( = ?auto_56436 ?auto_56443 ) ) ( not ( = ?auto_56457 ?auto_56443 ) ) ( not ( = ?auto_56446 ?auto_56443 ) ) ( not ( = ?auto_56452 ?auto_56443 ) ) ( not ( = ?auto_56456 ?auto_56439 ) ) ( not ( = ?auto_56444 ?auto_56456 ) ) ( not ( = ?auto_56453 ?auto_56456 ) ) ( HOIST-AT ?auto_56442 ?auto_56456 ) ( not ( = ?auto_56441 ?auto_56442 ) ) ( not ( = ?auto_56449 ?auto_56442 ) ) ( not ( = ?auto_56437 ?auto_56442 ) ) ( AVAILABLE ?auto_56442 ) ( SURFACE-AT ?auto_56446 ?auto_56456 ) ( ON ?auto_56446 ?auto_56454 ) ( CLEAR ?auto_56446 ) ( not ( = ?auto_56435 ?auto_56454 ) ) ( not ( = ?auto_56436 ?auto_56454 ) ) ( not ( = ?auto_56457 ?auto_56454 ) ) ( not ( = ?auto_56446 ?auto_56454 ) ) ( not ( = ?auto_56452 ?auto_56454 ) ) ( not ( = ?auto_56443 ?auto_56454 ) ) ( IS-CRATE ?auto_56443 ) ( not ( = ?auto_56435 ?auto_56450 ) ) ( not ( = ?auto_56436 ?auto_56450 ) ) ( not ( = ?auto_56457 ?auto_56450 ) ) ( not ( = ?auto_56446 ?auto_56450 ) ) ( not ( = ?auto_56452 ?auto_56450 ) ) ( not ( = ?auto_56443 ?auto_56450 ) ) ( not ( = ?auto_56454 ?auto_56450 ) ) ( not ( = ?auto_56455 ?auto_56439 ) ) ( not ( = ?auto_56444 ?auto_56455 ) ) ( not ( = ?auto_56453 ?auto_56455 ) ) ( not ( = ?auto_56456 ?auto_56455 ) ) ( HOIST-AT ?auto_56451 ?auto_56455 ) ( not ( = ?auto_56441 ?auto_56451 ) ) ( not ( = ?auto_56449 ?auto_56451 ) ) ( not ( = ?auto_56437 ?auto_56451 ) ) ( not ( = ?auto_56442 ?auto_56451 ) ) ( AVAILABLE ?auto_56451 ) ( SURFACE-AT ?auto_56443 ?auto_56455 ) ( ON ?auto_56443 ?auto_56445 ) ( CLEAR ?auto_56443 ) ( not ( = ?auto_56435 ?auto_56445 ) ) ( not ( = ?auto_56436 ?auto_56445 ) ) ( not ( = ?auto_56457 ?auto_56445 ) ) ( not ( = ?auto_56446 ?auto_56445 ) ) ( not ( = ?auto_56452 ?auto_56445 ) ) ( not ( = ?auto_56443 ?auto_56445 ) ) ( not ( = ?auto_56454 ?auto_56445 ) ) ( not ( = ?auto_56450 ?auto_56445 ) ) ( IS-CRATE ?auto_56450 ) ( not ( = ?auto_56435 ?auto_56438 ) ) ( not ( = ?auto_56436 ?auto_56438 ) ) ( not ( = ?auto_56457 ?auto_56438 ) ) ( not ( = ?auto_56446 ?auto_56438 ) ) ( not ( = ?auto_56452 ?auto_56438 ) ) ( not ( = ?auto_56443 ?auto_56438 ) ) ( not ( = ?auto_56454 ?auto_56438 ) ) ( not ( = ?auto_56450 ?auto_56438 ) ) ( not ( = ?auto_56445 ?auto_56438 ) ) ( not ( = ?auto_56440 ?auto_56439 ) ) ( not ( = ?auto_56444 ?auto_56440 ) ) ( not ( = ?auto_56453 ?auto_56440 ) ) ( not ( = ?auto_56456 ?auto_56440 ) ) ( not ( = ?auto_56455 ?auto_56440 ) ) ( HOIST-AT ?auto_56458 ?auto_56440 ) ( not ( = ?auto_56441 ?auto_56458 ) ) ( not ( = ?auto_56449 ?auto_56458 ) ) ( not ( = ?auto_56437 ?auto_56458 ) ) ( not ( = ?auto_56442 ?auto_56458 ) ) ( not ( = ?auto_56451 ?auto_56458 ) ) ( AVAILABLE ?auto_56458 ) ( SURFACE-AT ?auto_56450 ?auto_56440 ) ( ON ?auto_56450 ?auto_56459 ) ( CLEAR ?auto_56450 ) ( not ( = ?auto_56435 ?auto_56459 ) ) ( not ( = ?auto_56436 ?auto_56459 ) ) ( not ( = ?auto_56457 ?auto_56459 ) ) ( not ( = ?auto_56446 ?auto_56459 ) ) ( not ( = ?auto_56452 ?auto_56459 ) ) ( not ( = ?auto_56443 ?auto_56459 ) ) ( not ( = ?auto_56454 ?auto_56459 ) ) ( not ( = ?auto_56450 ?auto_56459 ) ) ( not ( = ?auto_56445 ?auto_56459 ) ) ( not ( = ?auto_56438 ?auto_56459 ) ) ( TRUCK-AT ?auto_56447 ?auto_56439 ) ( SURFACE-AT ?auto_56448 ?auto_56439 ) ( CLEAR ?auto_56448 ) ( IS-CRATE ?auto_56438 ) ( not ( = ?auto_56435 ?auto_56448 ) ) ( not ( = ?auto_56436 ?auto_56448 ) ) ( not ( = ?auto_56457 ?auto_56448 ) ) ( not ( = ?auto_56446 ?auto_56448 ) ) ( not ( = ?auto_56452 ?auto_56448 ) ) ( not ( = ?auto_56443 ?auto_56448 ) ) ( not ( = ?auto_56454 ?auto_56448 ) ) ( not ( = ?auto_56450 ?auto_56448 ) ) ( not ( = ?auto_56445 ?auto_56448 ) ) ( not ( = ?auto_56438 ?auto_56448 ) ) ( not ( = ?auto_56459 ?auto_56448 ) ) ( AVAILABLE ?auto_56441 ) ( IN ?auto_56438 ?auto_56447 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56441 ?auto_56438 ?auto_56447 ?auto_56439 )
      ( MAKE-ON ?auto_56435 ?auto_56436 )
      ( MAKE-ON-VERIFY ?auto_56435 ?auto_56436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56460 - SURFACE
      ?auto_56461 - SURFACE
    )
    :vars
    (
      ?auto_56464 - HOIST
      ?auto_56472 - PLACE
      ?auto_56475 - PLACE
      ?auto_56476 - HOIST
      ?auto_56466 - SURFACE
      ?auto_56481 - SURFACE
      ?auto_56484 - PLACE
      ?auto_56477 - HOIST
      ?auto_56482 - SURFACE
      ?auto_56470 - SURFACE
      ?auto_56465 - PLACE
      ?auto_56479 - HOIST
      ?auto_56462 - SURFACE
      ?auto_56473 - SURFACE
      ?auto_56480 - PLACE
      ?auto_56463 - HOIST
      ?auto_56471 - SURFACE
      ?auto_56469 - SURFACE
      ?auto_56483 - PLACE
      ?auto_56467 - HOIST
      ?auto_56468 - SURFACE
      ?auto_56474 - SURFACE
      ?auto_56478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56464 ?auto_56472 ) ( IS-CRATE ?auto_56460 ) ( not ( = ?auto_56460 ?auto_56461 ) ) ( not ( = ?auto_56475 ?auto_56472 ) ) ( HOIST-AT ?auto_56476 ?auto_56475 ) ( not ( = ?auto_56464 ?auto_56476 ) ) ( AVAILABLE ?auto_56476 ) ( SURFACE-AT ?auto_56460 ?auto_56475 ) ( ON ?auto_56460 ?auto_56466 ) ( CLEAR ?auto_56460 ) ( not ( = ?auto_56460 ?auto_56466 ) ) ( not ( = ?auto_56461 ?auto_56466 ) ) ( IS-CRATE ?auto_56461 ) ( not ( = ?auto_56460 ?auto_56481 ) ) ( not ( = ?auto_56461 ?auto_56481 ) ) ( not ( = ?auto_56466 ?auto_56481 ) ) ( not ( = ?auto_56484 ?auto_56472 ) ) ( not ( = ?auto_56475 ?auto_56484 ) ) ( HOIST-AT ?auto_56477 ?auto_56484 ) ( not ( = ?auto_56464 ?auto_56477 ) ) ( not ( = ?auto_56476 ?auto_56477 ) ) ( AVAILABLE ?auto_56477 ) ( SURFACE-AT ?auto_56461 ?auto_56484 ) ( ON ?auto_56461 ?auto_56482 ) ( CLEAR ?auto_56461 ) ( not ( = ?auto_56460 ?auto_56482 ) ) ( not ( = ?auto_56461 ?auto_56482 ) ) ( not ( = ?auto_56466 ?auto_56482 ) ) ( not ( = ?auto_56481 ?auto_56482 ) ) ( IS-CRATE ?auto_56481 ) ( not ( = ?auto_56460 ?auto_56470 ) ) ( not ( = ?auto_56461 ?auto_56470 ) ) ( not ( = ?auto_56466 ?auto_56470 ) ) ( not ( = ?auto_56481 ?auto_56470 ) ) ( not ( = ?auto_56482 ?auto_56470 ) ) ( not ( = ?auto_56465 ?auto_56472 ) ) ( not ( = ?auto_56475 ?auto_56465 ) ) ( not ( = ?auto_56484 ?auto_56465 ) ) ( HOIST-AT ?auto_56479 ?auto_56465 ) ( not ( = ?auto_56464 ?auto_56479 ) ) ( not ( = ?auto_56476 ?auto_56479 ) ) ( not ( = ?auto_56477 ?auto_56479 ) ) ( AVAILABLE ?auto_56479 ) ( SURFACE-AT ?auto_56481 ?auto_56465 ) ( ON ?auto_56481 ?auto_56462 ) ( CLEAR ?auto_56481 ) ( not ( = ?auto_56460 ?auto_56462 ) ) ( not ( = ?auto_56461 ?auto_56462 ) ) ( not ( = ?auto_56466 ?auto_56462 ) ) ( not ( = ?auto_56481 ?auto_56462 ) ) ( not ( = ?auto_56482 ?auto_56462 ) ) ( not ( = ?auto_56470 ?auto_56462 ) ) ( IS-CRATE ?auto_56470 ) ( not ( = ?auto_56460 ?auto_56473 ) ) ( not ( = ?auto_56461 ?auto_56473 ) ) ( not ( = ?auto_56466 ?auto_56473 ) ) ( not ( = ?auto_56481 ?auto_56473 ) ) ( not ( = ?auto_56482 ?auto_56473 ) ) ( not ( = ?auto_56470 ?auto_56473 ) ) ( not ( = ?auto_56462 ?auto_56473 ) ) ( not ( = ?auto_56480 ?auto_56472 ) ) ( not ( = ?auto_56475 ?auto_56480 ) ) ( not ( = ?auto_56484 ?auto_56480 ) ) ( not ( = ?auto_56465 ?auto_56480 ) ) ( HOIST-AT ?auto_56463 ?auto_56480 ) ( not ( = ?auto_56464 ?auto_56463 ) ) ( not ( = ?auto_56476 ?auto_56463 ) ) ( not ( = ?auto_56477 ?auto_56463 ) ) ( not ( = ?auto_56479 ?auto_56463 ) ) ( AVAILABLE ?auto_56463 ) ( SURFACE-AT ?auto_56470 ?auto_56480 ) ( ON ?auto_56470 ?auto_56471 ) ( CLEAR ?auto_56470 ) ( not ( = ?auto_56460 ?auto_56471 ) ) ( not ( = ?auto_56461 ?auto_56471 ) ) ( not ( = ?auto_56466 ?auto_56471 ) ) ( not ( = ?auto_56481 ?auto_56471 ) ) ( not ( = ?auto_56482 ?auto_56471 ) ) ( not ( = ?auto_56470 ?auto_56471 ) ) ( not ( = ?auto_56462 ?auto_56471 ) ) ( not ( = ?auto_56473 ?auto_56471 ) ) ( IS-CRATE ?auto_56473 ) ( not ( = ?auto_56460 ?auto_56469 ) ) ( not ( = ?auto_56461 ?auto_56469 ) ) ( not ( = ?auto_56466 ?auto_56469 ) ) ( not ( = ?auto_56481 ?auto_56469 ) ) ( not ( = ?auto_56482 ?auto_56469 ) ) ( not ( = ?auto_56470 ?auto_56469 ) ) ( not ( = ?auto_56462 ?auto_56469 ) ) ( not ( = ?auto_56473 ?auto_56469 ) ) ( not ( = ?auto_56471 ?auto_56469 ) ) ( not ( = ?auto_56483 ?auto_56472 ) ) ( not ( = ?auto_56475 ?auto_56483 ) ) ( not ( = ?auto_56484 ?auto_56483 ) ) ( not ( = ?auto_56465 ?auto_56483 ) ) ( not ( = ?auto_56480 ?auto_56483 ) ) ( HOIST-AT ?auto_56467 ?auto_56483 ) ( not ( = ?auto_56464 ?auto_56467 ) ) ( not ( = ?auto_56476 ?auto_56467 ) ) ( not ( = ?auto_56477 ?auto_56467 ) ) ( not ( = ?auto_56479 ?auto_56467 ) ) ( not ( = ?auto_56463 ?auto_56467 ) ) ( AVAILABLE ?auto_56467 ) ( SURFACE-AT ?auto_56473 ?auto_56483 ) ( ON ?auto_56473 ?auto_56468 ) ( CLEAR ?auto_56473 ) ( not ( = ?auto_56460 ?auto_56468 ) ) ( not ( = ?auto_56461 ?auto_56468 ) ) ( not ( = ?auto_56466 ?auto_56468 ) ) ( not ( = ?auto_56481 ?auto_56468 ) ) ( not ( = ?auto_56482 ?auto_56468 ) ) ( not ( = ?auto_56470 ?auto_56468 ) ) ( not ( = ?auto_56462 ?auto_56468 ) ) ( not ( = ?auto_56473 ?auto_56468 ) ) ( not ( = ?auto_56471 ?auto_56468 ) ) ( not ( = ?auto_56469 ?auto_56468 ) ) ( SURFACE-AT ?auto_56474 ?auto_56472 ) ( CLEAR ?auto_56474 ) ( IS-CRATE ?auto_56469 ) ( not ( = ?auto_56460 ?auto_56474 ) ) ( not ( = ?auto_56461 ?auto_56474 ) ) ( not ( = ?auto_56466 ?auto_56474 ) ) ( not ( = ?auto_56481 ?auto_56474 ) ) ( not ( = ?auto_56482 ?auto_56474 ) ) ( not ( = ?auto_56470 ?auto_56474 ) ) ( not ( = ?auto_56462 ?auto_56474 ) ) ( not ( = ?auto_56473 ?auto_56474 ) ) ( not ( = ?auto_56471 ?auto_56474 ) ) ( not ( = ?auto_56469 ?auto_56474 ) ) ( not ( = ?auto_56468 ?auto_56474 ) ) ( AVAILABLE ?auto_56464 ) ( IN ?auto_56469 ?auto_56478 ) ( TRUCK-AT ?auto_56478 ?auto_56483 ) )
    :subtasks
    ( ( !DRIVE ?auto_56478 ?auto_56483 ?auto_56472 )
      ( MAKE-ON ?auto_56460 ?auto_56461 )
      ( MAKE-ON-VERIFY ?auto_56460 ?auto_56461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56485 - SURFACE
      ?auto_56486 - SURFACE
    )
    :vars
    (
      ?auto_56496 - HOIST
      ?auto_56492 - PLACE
      ?auto_56507 - PLACE
      ?auto_56497 - HOIST
      ?auto_56491 - SURFACE
      ?auto_56504 - SURFACE
      ?auto_56488 - PLACE
      ?auto_56489 - HOIST
      ?auto_56505 - SURFACE
      ?auto_56502 - SURFACE
      ?auto_56509 - PLACE
      ?auto_56508 - HOIST
      ?auto_56501 - SURFACE
      ?auto_56494 - SURFACE
      ?auto_56500 - PLACE
      ?auto_56499 - HOIST
      ?auto_56493 - SURFACE
      ?auto_56498 - SURFACE
      ?auto_56487 - PLACE
      ?auto_56506 - HOIST
      ?auto_56490 - SURFACE
      ?auto_56495 - SURFACE
      ?auto_56503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56496 ?auto_56492 ) ( IS-CRATE ?auto_56485 ) ( not ( = ?auto_56485 ?auto_56486 ) ) ( not ( = ?auto_56507 ?auto_56492 ) ) ( HOIST-AT ?auto_56497 ?auto_56507 ) ( not ( = ?auto_56496 ?auto_56497 ) ) ( AVAILABLE ?auto_56497 ) ( SURFACE-AT ?auto_56485 ?auto_56507 ) ( ON ?auto_56485 ?auto_56491 ) ( CLEAR ?auto_56485 ) ( not ( = ?auto_56485 ?auto_56491 ) ) ( not ( = ?auto_56486 ?auto_56491 ) ) ( IS-CRATE ?auto_56486 ) ( not ( = ?auto_56485 ?auto_56504 ) ) ( not ( = ?auto_56486 ?auto_56504 ) ) ( not ( = ?auto_56491 ?auto_56504 ) ) ( not ( = ?auto_56488 ?auto_56492 ) ) ( not ( = ?auto_56507 ?auto_56488 ) ) ( HOIST-AT ?auto_56489 ?auto_56488 ) ( not ( = ?auto_56496 ?auto_56489 ) ) ( not ( = ?auto_56497 ?auto_56489 ) ) ( AVAILABLE ?auto_56489 ) ( SURFACE-AT ?auto_56486 ?auto_56488 ) ( ON ?auto_56486 ?auto_56505 ) ( CLEAR ?auto_56486 ) ( not ( = ?auto_56485 ?auto_56505 ) ) ( not ( = ?auto_56486 ?auto_56505 ) ) ( not ( = ?auto_56491 ?auto_56505 ) ) ( not ( = ?auto_56504 ?auto_56505 ) ) ( IS-CRATE ?auto_56504 ) ( not ( = ?auto_56485 ?auto_56502 ) ) ( not ( = ?auto_56486 ?auto_56502 ) ) ( not ( = ?auto_56491 ?auto_56502 ) ) ( not ( = ?auto_56504 ?auto_56502 ) ) ( not ( = ?auto_56505 ?auto_56502 ) ) ( not ( = ?auto_56509 ?auto_56492 ) ) ( not ( = ?auto_56507 ?auto_56509 ) ) ( not ( = ?auto_56488 ?auto_56509 ) ) ( HOIST-AT ?auto_56508 ?auto_56509 ) ( not ( = ?auto_56496 ?auto_56508 ) ) ( not ( = ?auto_56497 ?auto_56508 ) ) ( not ( = ?auto_56489 ?auto_56508 ) ) ( AVAILABLE ?auto_56508 ) ( SURFACE-AT ?auto_56504 ?auto_56509 ) ( ON ?auto_56504 ?auto_56501 ) ( CLEAR ?auto_56504 ) ( not ( = ?auto_56485 ?auto_56501 ) ) ( not ( = ?auto_56486 ?auto_56501 ) ) ( not ( = ?auto_56491 ?auto_56501 ) ) ( not ( = ?auto_56504 ?auto_56501 ) ) ( not ( = ?auto_56505 ?auto_56501 ) ) ( not ( = ?auto_56502 ?auto_56501 ) ) ( IS-CRATE ?auto_56502 ) ( not ( = ?auto_56485 ?auto_56494 ) ) ( not ( = ?auto_56486 ?auto_56494 ) ) ( not ( = ?auto_56491 ?auto_56494 ) ) ( not ( = ?auto_56504 ?auto_56494 ) ) ( not ( = ?auto_56505 ?auto_56494 ) ) ( not ( = ?auto_56502 ?auto_56494 ) ) ( not ( = ?auto_56501 ?auto_56494 ) ) ( not ( = ?auto_56500 ?auto_56492 ) ) ( not ( = ?auto_56507 ?auto_56500 ) ) ( not ( = ?auto_56488 ?auto_56500 ) ) ( not ( = ?auto_56509 ?auto_56500 ) ) ( HOIST-AT ?auto_56499 ?auto_56500 ) ( not ( = ?auto_56496 ?auto_56499 ) ) ( not ( = ?auto_56497 ?auto_56499 ) ) ( not ( = ?auto_56489 ?auto_56499 ) ) ( not ( = ?auto_56508 ?auto_56499 ) ) ( AVAILABLE ?auto_56499 ) ( SURFACE-AT ?auto_56502 ?auto_56500 ) ( ON ?auto_56502 ?auto_56493 ) ( CLEAR ?auto_56502 ) ( not ( = ?auto_56485 ?auto_56493 ) ) ( not ( = ?auto_56486 ?auto_56493 ) ) ( not ( = ?auto_56491 ?auto_56493 ) ) ( not ( = ?auto_56504 ?auto_56493 ) ) ( not ( = ?auto_56505 ?auto_56493 ) ) ( not ( = ?auto_56502 ?auto_56493 ) ) ( not ( = ?auto_56501 ?auto_56493 ) ) ( not ( = ?auto_56494 ?auto_56493 ) ) ( IS-CRATE ?auto_56494 ) ( not ( = ?auto_56485 ?auto_56498 ) ) ( not ( = ?auto_56486 ?auto_56498 ) ) ( not ( = ?auto_56491 ?auto_56498 ) ) ( not ( = ?auto_56504 ?auto_56498 ) ) ( not ( = ?auto_56505 ?auto_56498 ) ) ( not ( = ?auto_56502 ?auto_56498 ) ) ( not ( = ?auto_56501 ?auto_56498 ) ) ( not ( = ?auto_56494 ?auto_56498 ) ) ( not ( = ?auto_56493 ?auto_56498 ) ) ( not ( = ?auto_56487 ?auto_56492 ) ) ( not ( = ?auto_56507 ?auto_56487 ) ) ( not ( = ?auto_56488 ?auto_56487 ) ) ( not ( = ?auto_56509 ?auto_56487 ) ) ( not ( = ?auto_56500 ?auto_56487 ) ) ( HOIST-AT ?auto_56506 ?auto_56487 ) ( not ( = ?auto_56496 ?auto_56506 ) ) ( not ( = ?auto_56497 ?auto_56506 ) ) ( not ( = ?auto_56489 ?auto_56506 ) ) ( not ( = ?auto_56508 ?auto_56506 ) ) ( not ( = ?auto_56499 ?auto_56506 ) ) ( SURFACE-AT ?auto_56494 ?auto_56487 ) ( ON ?auto_56494 ?auto_56490 ) ( CLEAR ?auto_56494 ) ( not ( = ?auto_56485 ?auto_56490 ) ) ( not ( = ?auto_56486 ?auto_56490 ) ) ( not ( = ?auto_56491 ?auto_56490 ) ) ( not ( = ?auto_56504 ?auto_56490 ) ) ( not ( = ?auto_56505 ?auto_56490 ) ) ( not ( = ?auto_56502 ?auto_56490 ) ) ( not ( = ?auto_56501 ?auto_56490 ) ) ( not ( = ?auto_56494 ?auto_56490 ) ) ( not ( = ?auto_56493 ?auto_56490 ) ) ( not ( = ?auto_56498 ?auto_56490 ) ) ( SURFACE-AT ?auto_56495 ?auto_56492 ) ( CLEAR ?auto_56495 ) ( IS-CRATE ?auto_56498 ) ( not ( = ?auto_56485 ?auto_56495 ) ) ( not ( = ?auto_56486 ?auto_56495 ) ) ( not ( = ?auto_56491 ?auto_56495 ) ) ( not ( = ?auto_56504 ?auto_56495 ) ) ( not ( = ?auto_56505 ?auto_56495 ) ) ( not ( = ?auto_56502 ?auto_56495 ) ) ( not ( = ?auto_56501 ?auto_56495 ) ) ( not ( = ?auto_56494 ?auto_56495 ) ) ( not ( = ?auto_56493 ?auto_56495 ) ) ( not ( = ?auto_56498 ?auto_56495 ) ) ( not ( = ?auto_56490 ?auto_56495 ) ) ( AVAILABLE ?auto_56496 ) ( TRUCK-AT ?auto_56503 ?auto_56487 ) ( LIFTING ?auto_56506 ?auto_56498 ) )
    :subtasks
    ( ( !LOAD ?auto_56506 ?auto_56498 ?auto_56503 ?auto_56487 )
      ( MAKE-ON ?auto_56485 ?auto_56486 )
      ( MAKE-ON-VERIFY ?auto_56485 ?auto_56486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56510 - SURFACE
      ?auto_56511 - SURFACE
    )
    :vars
    (
      ?auto_56525 - HOIST
      ?auto_56517 - PLACE
      ?auto_56522 - PLACE
      ?auto_56513 - HOIST
      ?auto_56523 - SURFACE
      ?auto_56530 - SURFACE
      ?auto_56531 - PLACE
      ?auto_56534 - HOIST
      ?auto_56514 - SURFACE
      ?auto_56521 - SURFACE
      ?auto_56527 - PLACE
      ?auto_56526 - HOIST
      ?auto_56528 - SURFACE
      ?auto_56533 - SURFACE
      ?auto_56518 - PLACE
      ?auto_56524 - HOIST
      ?auto_56519 - SURFACE
      ?auto_56512 - SURFACE
      ?auto_56515 - PLACE
      ?auto_56529 - HOIST
      ?auto_56532 - SURFACE
      ?auto_56516 - SURFACE
      ?auto_56520 - TRUCK
      ?auto_56535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56525 ?auto_56517 ) ( IS-CRATE ?auto_56510 ) ( not ( = ?auto_56510 ?auto_56511 ) ) ( not ( = ?auto_56522 ?auto_56517 ) ) ( HOIST-AT ?auto_56513 ?auto_56522 ) ( not ( = ?auto_56525 ?auto_56513 ) ) ( AVAILABLE ?auto_56513 ) ( SURFACE-AT ?auto_56510 ?auto_56522 ) ( ON ?auto_56510 ?auto_56523 ) ( CLEAR ?auto_56510 ) ( not ( = ?auto_56510 ?auto_56523 ) ) ( not ( = ?auto_56511 ?auto_56523 ) ) ( IS-CRATE ?auto_56511 ) ( not ( = ?auto_56510 ?auto_56530 ) ) ( not ( = ?auto_56511 ?auto_56530 ) ) ( not ( = ?auto_56523 ?auto_56530 ) ) ( not ( = ?auto_56531 ?auto_56517 ) ) ( not ( = ?auto_56522 ?auto_56531 ) ) ( HOIST-AT ?auto_56534 ?auto_56531 ) ( not ( = ?auto_56525 ?auto_56534 ) ) ( not ( = ?auto_56513 ?auto_56534 ) ) ( AVAILABLE ?auto_56534 ) ( SURFACE-AT ?auto_56511 ?auto_56531 ) ( ON ?auto_56511 ?auto_56514 ) ( CLEAR ?auto_56511 ) ( not ( = ?auto_56510 ?auto_56514 ) ) ( not ( = ?auto_56511 ?auto_56514 ) ) ( not ( = ?auto_56523 ?auto_56514 ) ) ( not ( = ?auto_56530 ?auto_56514 ) ) ( IS-CRATE ?auto_56530 ) ( not ( = ?auto_56510 ?auto_56521 ) ) ( not ( = ?auto_56511 ?auto_56521 ) ) ( not ( = ?auto_56523 ?auto_56521 ) ) ( not ( = ?auto_56530 ?auto_56521 ) ) ( not ( = ?auto_56514 ?auto_56521 ) ) ( not ( = ?auto_56527 ?auto_56517 ) ) ( not ( = ?auto_56522 ?auto_56527 ) ) ( not ( = ?auto_56531 ?auto_56527 ) ) ( HOIST-AT ?auto_56526 ?auto_56527 ) ( not ( = ?auto_56525 ?auto_56526 ) ) ( not ( = ?auto_56513 ?auto_56526 ) ) ( not ( = ?auto_56534 ?auto_56526 ) ) ( AVAILABLE ?auto_56526 ) ( SURFACE-AT ?auto_56530 ?auto_56527 ) ( ON ?auto_56530 ?auto_56528 ) ( CLEAR ?auto_56530 ) ( not ( = ?auto_56510 ?auto_56528 ) ) ( not ( = ?auto_56511 ?auto_56528 ) ) ( not ( = ?auto_56523 ?auto_56528 ) ) ( not ( = ?auto_56530 ?auto_56528 ) ) ( not ( = ?auto_56514 ?auto_56528 ) ) ( not ( = ?auto_56521 ?auto_56528 ) ) ( IS-CRATE ?auto_56521 ) ( not ( = ?auto_56510 ?auto_56533 ) ) ( not ( = ?auto_56511 ?auto_56533 ) ) ( not ( = ?auto_56523 ?auto_56533 ) ) ( not ( = ?auto_56530 ?auto_56533 ) ) ( not ( = ?auto_56514 ?auto_56533 ) ) ( not ( = ?auto_56521 ?auto_56533 ) ) ( not ( = ?auto_56528 ?auto_56533 ) ) ( not ( = ?auto_56518 ?auto_56517 ) ) ( not ( = ?auto_56522 ?auto_56518 ) ) ( not ( = ?auto_56531 ?auto_56518 ) ) ( not ( = ?auto_56527 ?auto_56518 ) ) ( HOIST-AT ?auto_56524 ?auto_56518 ) ( not ( = ?auto_56525 ?auto_56524 ) ) ( not ( = ?auto_56513 ?auto_56524 ) ) ( not ( = ?auto_56534 ?auto_56524 ) ) ( not ( = ?auto_56526 ?auto_56524 ) ) ( AVAILABLE ?auto_56524 ) ( SURFACE-AT ?auto_56521 ?auto_56518 ) ( ON ?auto_56521 ?auto_56519 ) ( CLEAR ?auto_56521 ) ( not ( = ?auto_56510 ?auto_56519 ) ) ( not ( = ?auto_56511 ?auto_56519 ) ) ( not ( = ?auto_56523 ?auto_56519 ) ) ( not ( = ?auto_56530 ?auto_56519 ) ) ( not ( = ?auto_56514 ?auto_56519 ) ) ( not ( = ?auto_56521 ?auto_56519 ) ) ( not ( = ?auto_56528 ?auto_56519 ) ) ( not ( = ?auto_56533 ?auto_56519 ) ) ( IS-CRATE ?auto_56533 ) ( not ( = ?auto_56510 ?auto_56512 ) ) ( not ( = ?auto_56511 ?auto_56512 ) ) ( not ( = ?auto_56523 ?auto_56512 ) ) ( not ( = ?auto_56530 ?auto_56512 ) ) ( not ( = ?auto_56514 ?auto_56512 ) ) ( not ( = ?auto_56521 ?auto_56512 ) ) ( not ( = ?auto_56528 ?auto_56512 ) ) ( not ( = ?auto_56533 ?auto_56512 ) ) ( not ( = ?auto_56519 ?auto_56512 ) ) ( not ( = ?auto_56515 ?auto_56517 ) ) ( not ( = ?auto_56522 ?auto_56515 ) ) ( not ( = ?auto_56531 ?auto_56515 ) ) ( not ( = ?auto_56527 ?auto_56515 ) ) ( not ( = ?auto_56518 ?auto_56515 ) ) ( HOIST-AT ?auto_56529 ?auto_56515 ) ( not ( = ?auto_56525 ?auto_56529 ) ) ( not ( = ?auto_56513 ?auto_56529 ) ) ( not ( = ?auto_56534 ?auto_56529 ) ) ( not ( = ?auto_56526 ?auto_56529 ) ) ( not ( = ?auto_56524 ?auto_56529 ) ) ( SURFACE-AT ?auto_56533 ?auto_56515 ) ( ON ?auto_56533 ?auto_56532 ) ( CLEAR ?auto_56533 ) ( not ( = ?auto_56510 ?auto_56532 ) ) ( not ( = ?auto_56511 ?auto_56532 ) ) ( not ( = ?auto_56523 ?auto_56532 ) ) ( not ( = ?auto_56530 ?auto_56532 ) ) ( not ( = ?auto_56514 ?auto_56532 ) ) ( not ( = ?auto_56521 ?auto_56532 ) ) ( not ( = ?auto_56528 ?auto_56532 ) ) ( not ( = ?auto_56533 ?auto_56532 ) ) ( not ( = ?auto_56519 ?auto_56532 ) ) ( not ( = ?auto_56512 ?auto_56532 ) ) ( SURFACE-AT ?auto_56516 ?auto_56517 ) ( CLEAR ?auto_56516 ) ( IS-CRATE ?auto_56512 ) ( not ( = ?auto_56510 ?auto_56516 ) ) ( not ( = ?auto_56511 ?auto_56516 ) ) ( not ( = ?auto_56523 ?auto_56516 ) ) ( not ( = ?auto_56530 ?auto_56516 ) ) ( not ( = ?auto_56514 ?auto_56516 ) ) ( not ( = ?auto_56521 ?auto_56516 ) ) ( not ( = ?auto_56528 ?auto_56516 ) ) ( not ( = ?auto_56533 ?auto_56516 ) ) ( not ( = ?auto_56519 ?auto_56516 ) ) ( not ( = ?auto_56512 ?auto_56516 ) ) ( not ( = ?auto_56532 ?auto_56516 ) ) ( AVAILABLE ?auto_56525 ) ( TRUCK-AT ?auto_56520 ?auto_56515 ) ( AVAILABLE ?auto_56529 ) ( SURFACE-AT ?auto_56512 ?auto_56515 ) ( ON ?auto_56512 ?auto_56535 ) ( CLEAR ?auto_56512 ) ( not ( = ?auto_56510 ?auto_56535 ) ) ( not ( = ?auto_56511 ?auto_56535 ) ) ( not ( = ?auto_56523 ?auto_56535 ) ) ( not ( = ?auto_56530 ?auto_56535 ) ) ( not ( = ?auto_56514 ?auto_56535 ) ) ( not ( = ?auto_56521 ?auto_56535 ) ) ( not ( = ?auto_56528 ?auto_56535 ) ) ( not ( = ?auto_56533 ?auto_56535 ) ) ( not ( = ?auto_56519 ?auto_56535 ) ) ( not ( = ?auto_56512 ?auto_56535 ) ) ( not ( = ?auto_56532 ?auto_56535 ) ) ( not ( = ?auto_56516 ?auto_56535 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56529 ?auto_56512 ?auto_56535 ?auto_56515 )
      ( MAKE-ON ?auto_56510 ?auto_56511 )
      ( MAKE-ON-VERIFY ?auto_56510 ?auto_56511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56536 - SURFACE
      ?auto_56537 - SURFACE
    )
    :vars
    (
      ?auto_56557 - HOIST
      ?auto_56560 - PLACE
      ?auto_56552 - PLACE
      ?auto_56559 - HOIST
      ?auto_56553 - SURFACE
      ?auto_56541 - SURFACE
      ?auto_56540 - PLACE
      ?auto_56543 - HOIST
      ?auto_56558 - SURFACE
      ?auto_56546 - SURFACE
      ?auto_56542 - PLACE
      ?auto_56548 - HOIST
      ?auto_56538 - SURFACE
      ?auto_56545 - SURFACE
      ?auto_56549 - PLACE
      ?auto_56554 - HOIST
      ?auto_56555 - SURFACE
      ?auto_56561 - SURFACE
      ?auto_56551 - PLACE
      ?auto_56556 - HOIST
      ?auto_56544 - SURFACE
      ?auto_56550 - SURFACE
      ?auto_56547 - SURFACE
      ?auto_56539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56557 ?auto_56560 ) ( IS-CRATE ?auto_56536 ) ( not ( = ?auto_56536 ?auto_56537 ) ) ( not ( = ?auto_56552 ?auto_56560 ) ) ( HOIST-AT ?auto_56559 ?auto_56552 ) ( not ( = ?auto_56557 ?auto_56559 ) ) ( AVAILABLE ?auto_56559 ) ( SURFACE-AT ?auto_56536 ?auto_56552 ) ( ON ?auto_56536 ?auto_56553 ) ( CLEAR ?auto_56536 ) ( not ( = ?auto_56536 ?auto_56553 ) ) ( not ( = ?auto_56537 ?auto_56553 ) ) ( IS-CRATE ?auto_56537 ) ( not ( = ?auto_56536 ?auto_56541 ) ) ( not ( = ?auto_56537 ?auto_56541 ) ) ( not ( = ?auto_56553 ?auto_56541 ) ) ( not ( = ?auto_56540 ?auto_56560 ) ) ( not ( = ?auto_56552 ?auto_56540 ) ) ( HOIST-AT ?auto_56543 ?auto_56540 ) ( not ( = ?auto_56557 ?auto_56543 ) ) ( not ( = ?auto_56559 ?auto_56543 ) ) ( AVAILABLE ?auto_56543 ) ( SURFACE-AT ?auto_56537 ?auto_56540 ) ( ON ?auto_56537 ?auto_56558 ) ( CLEAR ?auto_56537 ) ( not ( = ?auto_56536 ?auto_56558 ) ) ( not ( = ?auto_56537 ?auto_56558 ) ) ( not ( = ?auto_56553 ?auto_56558 ) ) ( not ( = ?auto_56541 ?auto_56558 ) ) ( IS-CRATE ?auto_56541 ) ( not ( = ?auto_56536 ?auto_56546 ) ) ( not ( = ?auto_56537 ?auto_56546 ) ) ( not ( = ?auto_56553 ?auto_56546 ) ) ( not ( = ?auto_56541 ?auto_56546 ) ) ( not ( = ?auto_56558 ?auto_56546 ) ) ( not ( = ?auto_56542 ?auto_56560 ) ) ( not ( = ?auto_56552 ?auto_56542 ) ) ( not ( = ?auto_56540 ?auto_56542 ) ) ( HOIST-AT ?auto_56548 ?auto_56542 ) ( not ( = ?auto_56557 ?auto_56548 ) ) ( not ( = ?auto_56559 ?auto_56548 ) ) ( not ( = ?auto_56543 ?auto_56548 ) ) ( AVAILABLE ?auto_56548 ) ( SURFACE-AT ?auto_56541 ?auto_56542 ) ( ON ?auto_56541 ?auto_56538 ) ( CLEAR ?auto_56541 ) ( not ( = ?auto_56536 ?auto_56538 ) ) ( not ( = ?auto_56537 ?auto_56538 ) ) ( not ( = ?auto_56553 ?auto_56538 ) ) ( not ( = ?auto_56541 ?auto_56538 ) ) ( not ( = ?auto_56558 ?auto_56538 ) ) ( not ( = ?auto_56546 ?auto_56538 ) ) ( IS-CRATE ?auto_56546 ) ( not ( = ?auto_56536 ?auto_56545 ) ) ( not ( = ?auto_56537 ?auto_56545 ) ) ( not ( = ?auto_56553 ?auto_56545 ) ) ( not ( = ?auto_56541 ?auto_56545 ) ) ( not ( = ?auto_56558 ?auto_56545 ) ) ( not ( = ?auto_56546 ?auto_56545 ) ) ( not ( = ?auto_56538 ?auto_56545 ) ) ( not ( = ?auto_56549 ?auto_56560 ) ) ( not ( = ?auto_56552 ?auto_56549 ) ) ( not ( = ?auto_56540 ?auto_56549 ) ) ( not ( = ?auto_56542 ?auto_56549 ) ) ( HOIST-AT ?auto_56554 ?auto_56549 ) ( not ( = ?auto_56557 ?auto_56554 ) ) ( not ( = ?auto_56559 ?auto_56554 ) ) ( not ( = ?auto_56543 ?auto_56554 ) ) ( not ( = ?auto_56548 ?auto_56554 ) ) ( AVAILABLE ?auto_56554 ) ( SURFACE-AT ?auto_56546 ?auto_56549 ) ( ON ?auto_56546 ?auto_56555 ) ( CLEAR ?auto_56546 ) ( not ( = ?auto_56536 ?auto_56555 ) ) ( not ( = ?auto_56537 ?auto_56555 ) ) ( not ( = ?auto_56553 ?auto_56555 ) ) ( not ( = ?auto_56541 ?auto_56555 ) ) ( not ( = ?auto_56558 ?auto_56555 ) ) ( not ( = ?auto_56546 ?auto_56555 ) ) ( not ( = ?auto_56538 ?auto_56555 ) ) ( not ( = ?auto_56545 ?auto_56555 ) ) ( IS-CRATE ?auto_56545 ) ( not ( = ?auto_56536 ?auto_56561 ) ) ( not ( = ?auto_56537 ?auto_56561 ) ) ( not ( = ?auto_56553 ?auto_56561 ) ) ( not ( = ?auto_56541 ?auto_56561 ) ) ( not ( = ?auto_56558 ?auto_56561 ) ) ( not ( = ?auto_56546 ?auto_56561 ) ) ( not ( = ?auto_56538 ?auto_56561 ) ) ( not ( = ?auto_56545 ?auto_56561 ) ) ( not ( = ?auto_56555 ?auto_56561 ) ) ( not ( = ?auto_56551 ?auto_56560 ) ) ( not ( = ?auto_56552 ?auto_56551 ) ) ( not ( = ?auto_56540 ?auto_56551 ) ) ( not ( = ?auto_56542 ?auto_56551 ) ) ( not ( = ?auto_56549 ?auto_56551 ) ) ( HOIST-AT ?auto_56556 ?auto_56551 ) ( not ( = ?auto_56557 ?auto_56556 ) ) ( not ( = ?auto_56559 ?auto_56556 ) ) ( not ( = ?auto_56543 ?auto_56556 ) ) ( not ( = ?auto_56548 ?auto_56556 ) ) ( not ( = ?auto_56554 ?auto_56556 ) ) ( SURFACE-AT ?auto_56545 ?auto_56551 ) ( ON ?auto_56545 ?auto_56544 ) ( CLEAR ?auto_56545 ) ( not ( = ?auto_56536 ?auto_56544 ) ) ( not ( = ?auto_56537 ?auto_56544 ) ) ( not ( = ?auto_56553 ?auto_56544 ) ) ( not ( = ?auto_56541 ?auto_56544 ) ) ( not ( = ?auto_56558 ?auto_56544 ) ) ( not ( = ?auto_56546 ?auto_56544 ) ) ( not ( = ?auto_56538 ?auto_56544 ) ) ( not ( = ?auto_56545 ?auto_56544 ) ) ( not ( = ?auto_56555 ?auto_56544 ) ) ( not ( = ?auto_56561 ?auto_56544 ) ) ( SURFACE-AT ?auto_56550 ?auto_56560 ) ( CLEAR ?auto_56550 ) ( IS-CRATE ?auto_56561 ) ( not ( = ?auto_56536 ?auto_56550 ) ) ( not ( = ?auto_56537 ?auto_56550 ) ) ( not ( = ?auto_56553 ?auto_56550 ) ) ( not ( = ?auto_56541 ?auto_56550 ) ) ( not ( = ?auto_56558 ?auto_56550 ) ) ( not ( = ?auto_56546 ?auto_56550 ) ) ( not ( = ?auto_56538 ?auto_56550 ) ) ( not ( = ?auto_56545 ?auto_56550 ) ) ( not ( = ?auto_56555 ?auto_56550 ) ) ( not ( = ?auto_56561 ?auto_56550 ) ) ( not ( = ?auto_56544 ?auto_56550 ) ) ( AVAILABLE ?auto_56557 ) ( AVAILABLE ?auto_56556 ) ( SURFACE-AT ?auto_56561 ?auto_56551 ) ( ON ?auto_56561 ?auto_56547 ) ( CLEAR ?auto_56561 ) ( not ( = ?auto_56536 ?auto_56547 ) ) ( not ( = ?auto_56537 ?auto_56547 ) ) ( not ( = ?auto_56553 ?auto_56547 ) ) ( not ( = ?auto_56541 ?auto_56547 ) ) ( not ( = ?auto_56558 ?auto_56547 ) ) ( not ( = ?auto_56546 ?auto_56547 ) ) ( not ( = ?auto_56538 ?auto_56547 ) ) ( not ( = ?auto_56545 ?auto_56547 ) ) ( not ( = ?auto_56555 ?auto_56547 ) ) ( not ( = ?auto_56561 ?auto_56547 ) ) ( not ( = ?auto_56544 ?auto_56547 ) ) ( not ( = ?auto_56550 ?auto_56547 ) ) ( TRUCK-AT ?auto_56539 ?auto_56560 ) )
    :subtasks
    ( ( !DRIVE ?auto_56539 ?auto_56560 ?auto_56551 )
      ( MAKE-ON ?auto_56536 ?auto_56537 )
      ( MAKE-ON-VERIFY ?auto_56536 ?auto_56537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56564 - SURFACE
      ?auto_56565 - SURFACE
    )
    :vars
    (
      ?auto_56566 - HOIST
      ?auto_56567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56566 ?auto_56567 ) ( SURFACE-AT ?auto_56565 ?auto_56567 ) ( CLEAR ?auto_56565 ) ( LIFTING ?auto_56566 ?auto_56564 ) ( IS-CRATE ?auto_56564 ) ( not ( = ?auto_56564 ?auto_56565 ) ) )
    :subtasks
    ( ( !DROP ?auto_56566 ?auto_56564 ?auto_56565 ?auto_56567 )
      ( MAKE-ON-VERIFY ?auto_56564 ?auto_56565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56568 - SURFACE
      ?auto_56569 - SURFACE
    )
    :vars
    (
      ?auto_56571 - HOIST
      ?auto_56570 - PLACE
      ?auto_56572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56571 ?auto_56570 ) ( SURFACE-AT ?auto_56569 ?auto_56570 ) ( CLEAR ?auto_56569 ) ( IS-CRATE ?auto_56568 ) ( not ( = ?auto_56568 ?auto_56569 ) ) ( TRUCK-AT ?auto_56572 ?auto_56570 ) ( AVAILABLE ?auto_56571 ) ( IN ?auto_56568 ?auto_56572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56571 ?auto_56568 ?auto_56572 ?auto_56570 )
      ( MAKE-ON ?auto_56568 ?auto_56569 )
      ( MAKE-ON-VERIFY ?auto_56568 ?auto_56569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56573 - SURFACE
      ?auto_56574 - SURFACE
    )
    :vars
    (
      ?auto_56577 - HOIST
      ?auto_56575 - PLACE
      ?auto_56576 - TRUCK
      ?auto_56578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56577 ?auto_56575 ) ( SURFACE-AT ?auto_56574 ?auto_56575 ) ( CLEAR ?auto_56574 ) ( IS-CRATE ?auto_56573 ) ( not ( = ?auto_56573 ?auto_56574 ) ) ( AVAILABLE ?auto_56577 ) ( IN ?auto_56573 ?auto_56576 ) ( TRUCK-AT ?auto_56576 ?auto_56578 ) ( not ( = ?auto_56578 ?auto_56575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56576 ?auto_56578 ?auto_56575 )
      ( MAKE-ON ?auto_56573 ?auto_56574 )
      ( MAKE-ON-VERIFY ?auto_56573 ?auto_56574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56579 - SURFACE
      ?auto_56580 - SURFACE
    )
    :vars
    (
      ?auto_56582 - HOIST
      ?auto_56584 - PLACE
      ?auto_56583 - TRUCK
      ?auto_56581 - PLACE
      ?auto_56585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56582 ?auto_56584 ) ( SURFACE-AT ?auto_56580 ?auto_56584 ) ( CLEAR ?auto_56580 ) ( IS-CRATE ?auto_56579 ) ( not ( = ?auto_56579 ?auto_56580 ) ) ( AVAILABLE ?auto_56582 ) ( TRUCK-AT ?auto_56583 ?auto_56581 ) ( not ( = ?auto_56581 ?auto_56584 ) ) ( HOIST-AT ?auto_56585 ?auto_56581 ) ( LIFTING ?auto_56585 ?auto_56579 ) ( not ( = ?auto_56582 ?auto_56585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56585 ?auto_56579 ?auto_56583 ?auto_56581 )
      ( MAKE-ON ?auto_56579 ?auto_56580 )
      ( MAKE-ON-VERIFY ?auto_56579 ?auto_56580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56586 - SURFACE
      ?auto_56587 - SURFACE
    )
    :vars
    (
      ?auto_56588 - HOIST
      ?auto_56591 - PLACE
      ?auto_56592 - TRUCK
      ?auto_56590 - PLACE
      ?auto_56589 - HOIST
      ?auto_56593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56588 ?auto_56591 ) ( SURFACE-AT ?auto_56587 ?auto_56591 ) ( CLEAR ?auto_56587 ) ( IS-CRATE ?auto_56586 ) ( not ( = ?auto_56586 ?auto_56587 ) ) ( AVAILABLE ?auto_56588 ) ( TRUCK-AT ?auto_56592 ?auto_56590 ) ( not ( = ?auto_56590 ?auto_56591 ) ) ( HOIST-AT ?auto_56589 ?auto_56590 ) ( not ( = ?auto_56588 ?auto_56589 ) ) ( AVAILABLE ?auto_56589 ) ( SURFACE-AT ?auto_56586 ?auto_56590 ) ( ON ?auto_56586 ?auto_56593 ) ( CLEAR ?auto_56586 ) ( not ( = ?auto_56586 ?auto_56593 ) ) ( not ( = ?auto_56587 ?auto_56593 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56589 ?auto_56586 ?auto_56593 ?auto_56590 )
      ( MAKE-ON ?auto_56586 ?auto_56587 )
      ( MAKE-ON-VERIFY ?auto_56586 ?auto_56587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56594 - SURFACE
      ?auto_56595 - SURFACE
    )
    :vars
    (
      ?auto_56601 - HOIST
      ?auto_56598 - PLACE
      ?auto_56597 - PLACE
      ?auto_56596 - HOIST
      ?auto_56600 - SURFACE
      ?auto_56599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56601 ?auto_56598 ) ( SURFACE-AT ?auto_56595 ?auto_56598 ) ( CLEAR ?auto_56595 ) ( IS-CRATE ?auto_56594 ) ( not ( = ?auto_56594 ?auto_56595 ) ) ( AVAILABLE ?auto_56601 ) ( not ( = ?auto_56597 ?auto_56598 ) ) ( HOIST-AT ?auto_56596 ?auto_56597 ) ( not ( = ?auto_56601 ?auto_56596 ) ) ( AVAILABLE ?auto_56596 ) ( SURFACE-AT ?auto_56594 ?auto_56597 ) ( ON ?auto_56594 ?auto_56600 ) ( CLEAR ?auto_56594 ) ( not ( = ?auto_56594 ?auto_56600 ) ) ( not ( = ?auto_56595 ?auto_56600 ) ) ( TRUCK-AT ?auto_56599 ?auto_56598 ) )
    :subtasks
    ( ( !DRIVE ?auto_56599 ?auto_56598 ?auto_56597 )
      ( MAKE-ON ?auto_56594 ?auto_56595 )
      ( MAKE-ON-VERIFY ?auto_56594 ?auto_56595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56602 - SURFACE
      ?auto_56603 - SURFACE
    )
    :vars
    (
      ?auto_56609 - HOIST
      ?auto_56604 - PLACE
      ?auto_56606 - PLACE
      ?auto_56605 - HOIST
      ?auto_56607 - SURFACE
      ?auto_56608 - TRUCK
      ?auto_56610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56609 ?auto_56604 ) ( IS-CRATE ?auto_56602 ) ( not ( = ?auto_56602 ?auto_56603 ) ) ( not ( = ?auto_56606 ?auto_56604 ) ) ( HOIST-AT ?auto_56605 ?auto_56606 ) ( not ( = ?auto_56609 ?auto_56605 ) ) ( AVAILABLE ?auto_56605 ) ( SURFACE-AT ?auto_56602 ?auto_56606 ) ( ON ?auto_56602 ?auto_56607 ) ( CLEAR ?auto_56602 ) ( not ( = ?auto_56602 ?auto_56607 ) ) ( not ( = ?auto_56603 ?auto_56607 ) ) ( TRUCK-AT ?auto_56608 ?auto_56604 ) ( SURFACE-AT ?auto_56610 ?auto_56604 ) ( CLEAR ?auto_56610 ) ( LIFTING ?auto_56609 ?auto_56603 ) ( IS-CRATE ?auto_56603 ) ( not ( = ?auto_56602 ?auto_56610 ) ) ( not ( = ?auto_56603 ?auto_56610 ) ) ( not ( = ?auto_56607 ?auto_56610 ) ) )
    :subtasks
    ( ( !DROP ?auto_56609 ?auto_56603 ?auto_56610 ?auto_56604 )
      ( MAKE-ON ?auto_56602 ?auto_56603 )
      ( MAKE-ON-VERIFY ?auto_56602 ?auto_56603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56611 - SURFACE
      ?auto_56612 - SURFACE
    )
    :vars
    (
      ?auto_56617 - HOIST
      ?auto_56618 - PLACE
      ?auto_56615 - PLACE
      ?auto_56616 - HOIST
      ?auto_56613 - SURFACE
      ?auto_56619 - TRUCK
      ?auto_56614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56617 ?auto_56618 ) ( IS-CRATE ?auto_56611 ) ( not ( = ?auto_56611 ?auto_56612 ) ) ( not ( = ?auto_56615 ?auto_56618 ) ) ( HOIST-AT ?auto_56616 ?auto_56615 ) ( not ( = ?auto_56617 ?auto_56616 ) ) ( AVAILABLE ?auto_56616 ) ( SURFACE-AT ?auto_56611 ?auto_56615 ) ( ON ?auto_56611 ?auto_56613 ) ( CLEAR ?auto_56611 ) ( not ( = ?auto_56611 ?auto_56613 ) ) ( not ( = ?auto_56612 ?auto_56613 ) ) ( TRUCK-AT ?auto_56619 ?auto_56618 ) ( SURFACE-AT ?auto_56614 ?auto_56618 ) ( CLEAR ?auto_56614 ) ( IS-CRATE ?auto_56612 ) ( not ( = ?auto_56611 ?auto_56614 ) ) ( not ( = ?auto_56612 ?auto_56614 ) ) ( not ( = ?auto_56613 ?auto_56614 ) ) ( AVAILABLE ?auto_56617 ) ( IN ?auto_56612 ?auto_56619 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56617 ?auto_56612 ?auto_56619 ?auto_56618 )
      ( MAKE-ON ?auto_56611 ?auto_56612 )
      ( MAKE-ON-VERIFY ?auto_56611 ?auto_56612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56620 - SURFACE
      ?auto_56621 - SURFACE
    )
    :vars
    (
      ?auto_56623 - HOIST
      ?auto_56626 - PLACE
      ?auto_56625 - PLACE
      ?auto_56624 - HOIST
      ?auto_56622 - SURFACE
      ?auto_56628 - SURFACE
      ?auto_56627 - TRUCK
      ?auto_56629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56623 ?auto_56626 ) ( IS-CRATE ?auto_56620 ) ( not ( = ?auto_56620 ?auto_56621 ) ) ( not ( = ?auto_56625 ?auto_56626 ) ) ( HOIST-AT ?auto_56624 ?auto_56625 ) ( not ( = ?auto_56623 ?auto_56624 ) ) ( AVAILABLE ?auto_56624 ) ( SURFACE-AT ?auto_56620 ?auto_56625 ) ( ON ?auto_56620 ?auto_56622 ) ( CLEAR ?auto_56620 ) ( not ( = ?auto_56620 ?auto_56622 ) ) ( not ( = ?auto_56621 ?auto_56622 ) ) ( SURFACE-AT ?auto_56628 ?auto_56626 ) ( CLEAR ?auto_56628 ) ( IS-CRATE ?auto_56621 ) ( not ( = ?auto_56620 ?auto_56628 ) ) ( not ( = ?auto_56621 ?auto_56628 ) ) ( not ( = ?auto_56622 ?auto_56628 ) ) ( AVAILABLE ?auto_56623 ) ( IN ?auto_56621 ?auto_56627 ) ( TRUCK-AT ?auto_56627 ?auto_56629 ) ( not ( = ?auto_56629 ?auto_56626 ) ) ( not ( = ?auto_56625 ?auto_56629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56627 ?auto_56629 ?auto_56626 )
      ( MAKE-ON ?auto_56620 ?auto_56621 )
      ( MAKE-ON-VERIFY ?auto_56620 ?auto_56621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56630 - SURFACE
      ?auto_56631 - SURFACE
    )
    :vars
    (
      ?auto_56636 - HOIST
      ?auto_56639 - PLACE
      ?auto_56637 - PLACE
      ?auto_56635 - HOIST
      ?auto_56632 - SURFACE
      ?auto_56634 - SURFACE
      ?auto_56633 - TRUCK
      ?auto_56638 - PLACE
      ?auto_56640 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56636 ?auto_56639 ) ( IS-CRATE ?auto_56630 ) ( not ( = ?auto_56630 ?auto_56631 ) ) ( not ( = ?auto_56637 ?auto_56639 ) ) ( HOIST-AT ?auto_56635 ?auto_56637 ) ( not ( = ?auto_56636 ?auto_56635 ) ) ( AVAILABLE ?auto_56635 ) ( SURFACE-AT ?auto_56630 ?auto_56637 ) ( ON ?auto_56630 ?auto_56632 ) ( CLEAR ?auto_56630 ) ( not ( = ?auto_56630 ?auto_56632 ) ) ( not ( = ?auto_56631 ?auto_56632 ) ) ( SURFACE-AT ?auto_56634 ?auto_56639 ) ( CLEAR ?auto_56634 ) ( IS-CRATE ?auto_56631 ) ( not ( = ?auto_56630 ?auto_56634 ) ) ( not ( = ?auto_56631 ?auto_56634 ) ) ( not ( = ?auto_56632 ?auto_56634 ) ) ( AVAILABLE ?auto_56636 ) ( TRUCK-AT ?auto_56633 ?auto_56638 ) ( not ( = ?auto_56638 ?auto_56639 ) ) ( not ( = ?auto_56637 ?auto_56638 ) ) ( HOIST-AT ?auto_56640 ?auto_56638 ) ( LIFTING ?auto_56640 ?auto_56631 ) ( not ( = ?auto_56636 ?auto_56640 ) ) ( not ( = ?auto_56635 ?auto_56640 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56640 ?auto_56631 ?auto_56633 ?auto_56638 )
      ( MAKE-ON ?auto_56630 ?auto_56631 )
      ( MAKE-ON-VERIFY ?auto_56630 ?auto_56631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56641 - SURFACE
      ?auto_56642 - SURFACE
    )
    :vars
    (
      ?auto_56651 - HOIST
      ?auto_56644 - PLACE
      ?auto_56646 - PLACE
      ?auto_56647 - HOIST
      ?auto_56649 - SURFACE
      ?auto_56645 - SURFACE
      ?auto_56643 - TRUCK
      ?auto_56650 - PLACE
      ?auto_56648 - HOIST
      ?auto_56652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56651 ?auto_56644 ) ( IS-CRATE ?auto_56641 ) ( not ( = ?auto_56641 ?auto_56642 ) ) ( not ( = ?auto_56646 ?auto_56644 ) ) ( HOIST-AT ?auto_56647 ?auto_56646 ) ( not ( = ?auto_56651 ?auto_56647 ) ) ( AVAILABLE ?auto_56647 ) ( SURFACE-AT ?auto_56641 ?auto_56646 ) ( ON ?auto_56641 ?auto_56649 ) ( CLEAR ?auto_56641 ) ( not ( = ?auto_56641 ?auto_56649 ) ) ( not ( = ?auto_56642 ?auto_56649 ) ) ( SURFACE-AT ?auto_56645 ?auto_56644 ) ( CLEAR ?auto_56645 ) ( IS-CRATE ?auto_56642 ) ( not ( = ?auto_56641 ?auto_56645 ) ) ( not ( = ?auto_56642 ?auto_56645 ) ) ( not ( = ?auto_56649 ?auto_56645 ) ) ( AVAILABLE ?auto_56651 ) ( TRUCK-AT ?auto_56643 ?auto_56650 ) ( not ( = ?auto_56650 ?auto_56644 ) ) ( not ( = ?auto_56646 ?auto_56650 ) ) ( HOIST-AT ?auto_56648 ?auto_56650 ) ( not ( = ?auto_56651 ?auto_56648 ) ) ( not ( = ?auto_56647 ?auto_56648 ) ) ( AVAILABLE ?auto_56648 ) ( SURFACE-AT ?auto_56642 ?auto_56650 ) ( ON ?auto_56642 ?auto_56652 ) ( CLEAR ?auto_56642 ) ( not ( = ?auto_56641 ?auto_56652 ) ) ( not ( = ?auto_56642 ?auto_56652 ) ) ( not ( = ?auto_56649 ?auto_56652 ) ) ( not ( = ?auto_56645 ?auto_56652 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56648 ?auto_56642 ?auto_56652 ?auto_56650 )
      ( MAKE-ON ?auto_56641 ?auto_56642 )
      ( MAKE-ON-VERIFY ?auto_56641 ?auto_56642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56653 - SURFACE
      ?auto_56654 - SURFACE
    )
    :vars
    (
      ?auto_56655 - HOIST
      ?auto_56659 - PLACE
      ?auto_56656 - PLACE
      ?auto_56657 - HOIST
      ?auto_56664 - SURFACE
      ?auto_56660 - SURFACE
      ?auto_56658 - PLACE
      ?auto_56662 - HOIST
      ?auto_56663 - SURFACE
      ?auto_56661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56655 ?auto_56659 ) ( IS-CRATE ?auto_56653 ) ( not ( = ?auto_56653 ?auto_56654 ) ) ( not ( = ?auto_56656 ?auto_56659 ) ) ( HOIST-AT ?auto_56657 ?auto_56656 ) ( not ( = ?auto_56655 ?auto_56657 ) ) ( AVAILABLE ?auto_56657 ) ( SURFACE-AT ?auto_56653 ?auto_56656 ) ( ON ?auto_56653 ?auto_56664 ) ( CLEAR ?auto_56653 ) ( not ( = ?auto_56653 ?auto_56664 ) ) ( not ( = ?auto_56654 ?auto_56664 ) ) ( SURFACE-AT ?auto_56660 ?auto_56659 ) ( CLEAR ?auto_56660 ) ( IS-CRATE ?auto_56654 ) ( not ( = ?auto_56653 ?auto_56660 ) ) ( not ( = ?auto_56654 ?auto_56660 ) ) ( not ( = ?auto_56664 ?auto_56660 ) ) ( AVAILABLE ?auto_56655 ) ( not ( = ?auto_56658 ?auto_56659 ) ) ( not ( = ?auto_56656 ?auto_56658 ) ) ( HOIST-AT ?auto_56662 ?auto_56658 ) ( not ( = ?auto_56655 ?auto_56662 ) ) ( not ( = ?auto_56657 ?auto_56662 ) ) ( AVAILABLE ?auto_56662 ) ( SURFACE-AT ?auto_56654 ?auto_56658 ) ( ON ?auto_56654 ?auto_56663 ) ( CLEAR ?auto_56654 ) ( not ( = ?auto_56653 ?auto_56663 ) ) ( not ( = ?auto_56654 ?auto_56663 ) ) ( not ( = ?auto_56664 ?auto_56663 ) ) ( not ( = ?auto_56660 ?auto_56663 ) ) ( TRUCK-AT ?auto_56661 ?auto_56659 ) )
    :subtasks
    ( ( !DRIVE ?auto_56661 ?auto_56659 ?auto_56658 )
      ( MAKE-ON ?auto_56653 ?auto_56654 )
      ( MAKE-ON-VERIFY ?auto_56653 ?auto_56654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56665 - SURFACE
      ?auto_56666 - SURFACE
    )
    :vars
    (
      ?auto_56673 - HOIST
      ?auto_56670 - PLACE
      ?auto_56675 - PLACE
      ?auto_56671 - HOIST
      ?auto_56676 - SURFACE
      ?auto_56672 - SURFACE
      ?auto_56669 - PLACE
      ?auto_56668 - HOIST
      ?auto_56667 - SURFACE
      ?auto_56674 - TRUCK
      ?auto_56677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56673 ?auto_56670 ) ( IS-CRATE ?auto_56665 ) ( not ( = ?auto_56665 ?auto_56666 ) ) ( not ( = ?auto_56675 ?auto_56670 ) ) ( HOIST-AT ?auto_56671 ?auto_56675 ) ( not ( = ?auto_56673 ?auto_56671 ) ) ( AVAILABLE ?auto_56671 ) ( SURFACE-AT ?auto_56665 ?auto_56675 ) ( ON ?auto_56665 ?auto_56676 ) ( CLEAR ?auto_56665 ) ( not ( = ?auto_56665 ?auto_56676 ) ) ( not ( = ?auto_56666 ?auto_56676 ) ) ( IS-CRATE ?auto_56666 ) ( not ( = ?auto_56665 ?auto_56672 ) ) ( not ( = ?auto_56666 ?auto_56672 ) ) ( not ( = ?auto_56676 ?auto_56672 ) ) ( not ( = ?auto_56669 ?auto_56670 ) ) ( not ( = ?auto_56675 ?auto_56669 ) ) ( HOIST-AT ?auto_56668 ?auto_56669 ) ( not ( = ?auto_56673 ?auto_56668 ) ) ( not ( = ?auto_56671 ?auto_56668 ) ) ( AVAILABLE ?auto_56668 ) ( SURFACE-AT ?auto_56666 ?auto_56669 ) ( ON ?auto_56666 ?auto_56667 ) ( CLEAR ?auto_56666 ) ( not ( = ?auto_56665 ?auto_56667 ) ) ( not ( = ?auto_56666 ?auto_56667 ) ) ( not ( = ?auto_56676 ?auto_56667 ) ) ( not ( = ?auto_56672 ?auto_56667 ) ) ( TRUCK-AT ?auto_56674 ?auto_56670 ) ( SURFACE-AT ?auto_56677 ?auto_56670 ) ( CLEAR ?auto_56677 ) ( LIFTING ?auto_56673 ?auto_56672 ) ( IS-CRATE ?auto_56672 ) ( not ( = ?auto_56665 ?auto_56677 ) ) ( not ( = ?auto_56666 ?auto_56677 ) ) ( not ( = ?auto_56676 ?auto_56677 ) ) ( not ( = ?auto_56672 ?auto_56677 ) ) ( not ( = ?auto_56667 ?auto_56677 ) ) )
    :subtasks
    ( ( !DROP ?auto_56673 ?auto_56672 ?auto_56677 ?auto_56670 )
      ( MAKE-ON ?auto_56665 ?auto_56666 )
      ( MAKE-ON-VERIFY ?auto_56665 ?auto_56666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56678 - SURFACE
      ?auto_56679 - SURFACE
    )
    :vars
    (
      ?auto_56680 - HOIST
      ?auto_56684 - PLACE
      ?auto_56681 - PLACE
      ?auto_56688 - HOIST
      ?auto_56689 - SURFACE
      ?auto_56686 - SURFACE
      ?auto_56687 - PLACE
      ?auto_56685 - HOIST
      ?auto_56682 - SURFACE
      ?auto_56690 - TRUCK
      ?auto_56683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56680 ?auto_56684 ) ( IS-CRATE ?auto_56678 ) ( not ( = ?auto_56678 ?auto_56679 ) ) ( not ( = ?auto_56681 ?auto_56684 ) ) ( HOIST-AT ?auto_56688 ?auto_56681 ) ( not ( = ?auto_56680 ?auto_56688 ) ) ( AVAILABLE ?auto_56688 ) ( SURFACE-AT ?auto_56678 ?auto_56681 ) ( ON ?auto_56678 ?auto_56689 ) ( CLEAR ?auto_56678 ) ( not ( = ?auto_56678 ?auto_56689 ) ) ( not ( = ?auto_56679 ?auto_56689 ) ) ( IS-CRATE ?auto_56679 ) ( not ( = ?auto_56678 ?auto_56686 ) ) ( not ( = ?auto_56679 ?auto_56686 ) ) ( not ( = ?auto_56689 ?auto_56686 ) ) ( not ( = ?auto_56687 ?auto_56684 ) ) ( not ( = ?auto_56681 ?auto_56687 ) ) ( HOIST-AT ?auto_56685 ?auto_56687 ) ( not ( = ?auto_56680 ?auto_56685 ) ) ( not ( = ?auto_56688 ?auto_56685 ) ) ( AVAILABLE ?auto_56685 ) ( SURFACE-AT ?auto_56679 ?auto_56687 ) ( ON ?auto_56679 ?auto_56682 ) ( CLEAR ?auto_56679 ) ( not ( = ?auto_56678 ?auto_56682 ) ) ( not ( = ?auto_56679 ?auto_56682 ) ) ( not ( = ?auto_56689 ?auto_56682 ) ) ( not ( = ?auto_56686 ?auto_56682 ) ) ( TRUCK-AT ?auto_56690 ?auto_56684 ) ( SURFACE-AT ?auto_56683 ?auto_56684 ) ( CLEAR ?auto_56683 ) ( IS-CRATE ?auto_56686 ) ( not ( = ?auto_56678 ?auto_56683 ) ) ( not ( = ?auto_56679 ?auto_56683 ) ) ( not ( = ?auto_56689 ?auto_56683 ) ) ( not ( = ?auto_56686 ?auto_56683 ) ) ( not ( = ?auto_56682 ?auto_56683 ) ) ( AVAILABLE ?auto_56680 ) ( IN ?auto_56686 ?auto_56690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56680 ?auto_56686 ?auto_56690 ?auto_56684 )
      ( MAKE-ON ?auto_56678 ?auto_56679 )
      ( MAKE-ON-VERIFY ?auto_56678 ?auto_56679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56691 - SURFACE
      ?auto_56692 - SURFACE
    )
    :vars
    (
      ?auto_56701 - HOIST
      ?auto_56697 - PLACE
      ?auto_56693 - PLACE
      ?auto_56696 - HOIST
      ?auto_56702 - SURFACE
      ?auto_56695 - SURFACE
      ?auto_56703 - PLACE
      ?auto_56694 - HOIST
      ?auto_56698 - SURFACE
      ?auto_56700 - SURFACE
      ?auto_56699 - TRUCK
      ?auto_56704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56701 ?auto_56697 ) ( IS-CRATE ?auto_56691 ) ( not ( = ?auto_56691 ?auto_56692 ) ) ( not ( = ?auto_56693 ?auto_56697 ) ) ( HOIST-AT ?auto_56696 ?auto_56693 ) ( not ( = ?auto_56701 ?auto_56696 ) ) ( AVAILABLE ?auto_56696 ) ( SURFACE-AT ?auto_56691 ?auto_56693 ) ( ON ?auto_56691 ?auto_56702 ) ( CLEAR ?auto_56691 ) ( not ( = ?auto_56691 ?auto_56702 ) ) ( not ( = ?auto_56692 ?auto_56702 ) ) ( IS-CRATE ?auto_56692 ) ( not ( = ?auto_56691 ?auto_56695 ) ) ( not ( = ?auto_56692 ?auto_56695 ) ) ( not ( = ?auto_56702 ?auto_56695 ) ) ( not ( = ?auto_56703 ?auto_56697 ) ) ( not ( = ?auto_56693 ?auto_56703 ) ) ( HOIST-AT ?auto_56694 ?auto_56703 ) ( not ( = ?auto_56701 ?auto_56694 ) ) ( not ( = ?auto_56696 ?auto_56694 ) ) ( AVAILABLE ?auto_56694 ) ( SURFACE-AT ?auto_56692 ?auto_56703 ) ( ON ?auto_56692 ?auto_56698 ) ( CLEAR ?auto_56692 ) ( not ( = ?auto_56691 ?auto_56698 ) ) ( not ( = ?auto_56692 ?auto_56698 ) ) ( not ( = ?auto_56702 ?auto_56698 ) ) ( not ( = ?auto_56695 ?auto_56698 ) ) ( SURFACE-AT ?auto_56700 ?auto_56697 ) ( CLEAR ?auto_56700 ) ( IS-CRATE ?auto_56695 ) ( not ( = ?auto_56691 ?auto_56700 ) ) ( not ( = ?auto_56692 ?auto_56700 ) ) ( not ( = ?auto_56702 ?auto_56700 ) ) ( not ( = ?auto_56695 ?auto_56700 ) ) ( not ( = ?auto_56698 ?auto_56700 ) ) ( AVAILABLE ?auto_56701 ) ( IN ?auto_56695 ?auto_56699 ) ( TRUCK-AT ?auto_56699 ?auto_56704 ) ( not ( = ?auto_56704 ?auto_56697 ) ) ( not ( = ?auto_56693 ?auto_56704 ) ) ( not ( = ?auto_56703 ?auto_56704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56699 ?auto_56704 ?auto_56697 )
      ( MAKE-ON ?auto_56691 ?auto_56692 )
      ( MAKE-ON-VERIFY ?auto_56691 ?auto_56692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56705 - SURFACE
      ?auto_56706 - SURFACE
    )
    :vars
    (
      ?auto_56716 - HOIST
      ?auto_56717 - PLACE
      ?auto_56713 - PLACE
      ?auto_56707 - HOIST
      ?auto_56712 - SURFACE
      ?auto_56709 - SURFACE
      ?auto_56715 - PLACE
      ?auto_56708 - HOIST
      ?auto_56710 - SURFACE
      ?auto_56711 - SURFACE
      ?auto_56714 - TRUCK
      ?auto_56718 - PLACE
      ?auto_56719 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56716 ?auto_56717 ) ( IS-CRATE ?auto_56705 ) ( not ( = ?auto_56705 ?auto_56706 ) ) ( not ( = ?auto_56713 ?auto_56717 ) ) ( HOIST-AT ?auto_56707 ?auto_56713 ) ( not ( = ?auto_56716 ?auto_56707 ) ) ( AVAILABLE ?auto_56707 ) ( SURFACE-AT ?auto_56705 ?auto_56713 ) ( ON ?auto_56705 ?auto_56712 ) ( CLEAR ?auto_56705 ) ( not ( = ?auto_56705 ?auto_56712 ) ) ( not ( = ?auto_56706 ?auto_56712 ) ) ( IS-CRATE ?auto_56706 ) ( not ( = ?auto_56705 ?auto_56709 ) ) ( not ( = ?auto_56706 ?auto_56709 ) ) ( not ( = ?auto_56712 ?auto_56709 ) ) ( not ( = ?auto_56715 ?auto_56717 ) ) ( not ( = ?auto_56713 ?auto_56715 ) ) ( HOIST-AT ?auto_56708 ?auto_56715 ) ( not ( = ?auto_56716 ?auto_56708 ) ) ( not ( = ?auto_56707 ?auto_56708 ) ) ( AVAILABLE ?auto_56708 ) ( SURFACE-AT ?auto_56706 ?auto_56715 ) ( ON ?auto_56706 ?auto_56710 ) ( CLEAR ?auto_56706 ) ( not ( = ?auto_56705 ?auto_56710 ) ) ( not ( = ?auto_56706 ?auto_56710 ) ) ( not ( = ?auto_56712 ?auto_56710 ) ) ( not ( = ?auto_56709 ?auto_56710 ) ) ( SURFACE-AT ?auto_56711 ?auto_56717 ) ( CLEAR ?auto_56711 ) ( IS-CRATE ?auto_56709 ) ( not ( = ?auto_56705 ?auto_56711 ) ) ( not ( = ?auto_56706 ?auto_56711 ) ) ( not ( = ?auto_56712 ?auto_56711 ) ) ( not ( = ?auto_56709 ?auto_56711 ) ) ( not ( = ?auto_56710 ?auto_56711 ) ) ( AVAILABLE ?auto_56716 ) ( TRUCK-AT ?auto_56714 ?auto_56718 ) ( not ( = ?auto_56718 ?auto_56717 ) ) ( not ( = ?auto_56713 ?auto_56718 ) ) ( not ( = ?auto_56715 ?auto_56718 ) ) ( HOIST-AT ?auto_56719 ?auto_56718 ) ( LIFTING ?auto_56719 ?auto_56709 ) ( not ( = ?auto_56716 ?auto_56719 ) ) ( not ( = ?auto_56707 ?auto_56719 ) ) ( not ( = ?auto_56708 ?auto_56719 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56719 ?auto_56709 ?auto_56714 ?auto_56718 )
      ( MAKE-ON ?auto_56705 ?auto_56706 )
      ( MAKE-ON-VERIFY ?auto_56705 ?auto_56706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56720 - SURFACE
      ?auto_56721 - SURFACE
    )
    :vars
    (
      ?auto_56731 - HOIST
      ?auto_56724 - PLACE
      ?auto_56734 - PLACE
      ?auto_56727 - HOIST
      ?auto_56729 - SURFACE
      ?auto_56732 - SURFACE
      ?auto_56722 - PLACE
      ?auto_56726 - HOIST
      ?auto_56725 - SURFACE
      ?auto_56723 - SURFACE
      ?auto_56730 - TRUCK
      ?auto_56728 - PLACE
      ?auto_56733 - HOIST
      ?auto_56735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56731 ?auto_56724 ) ( IS-CRATE ?auto_56720 ) ( not ( = ?auto_56720 ?auto_56721 ) ) ( not ( = ?auto_56734 ?auto_56724 ) ) ( HOIST-AT ?auto_56727 ?auto_56734 ) ( not ( = ?auto_56731 ?auto_56727 ) ) ( AVAILABLE ?auto_56727 ) ( SURFACE-AT ?auto_56720 ?auto_56734 ) ( ON ?auto_56720 ?auto_56729 ) ( CLEAR ?auto_56720 ) ( not ( = ?auto_56720 ?auto_56729 ) ) ( not ( = ?auto_56721 ?auto_56729 ) ) ( IS-CRATE ?auto_56721 ) ( not ( = ?auto_56720 ?auto_56732 ) ) ( not ( = ?auto_56721 ?auto_56732 ) ) ( not ( = ?auto_56729 ?auto_56732 ) ) ( not ( = ?auto_56722 ?auto_56724 ) ) ( not ( = ?auto_56734 ?auto_56722 ) ) ( HOIST-AT ?auto_56726 ?auto_56722 ) ( not ( = ?auto_56731 ?auto_56726 ) ) ( not ( = ?auto_56727 ?auto_56726 ) ) ( AVAILABLE ?auto_56726 ) ( SURFACE-AT ?auto_56721 ?auto_56722 ) ( ON ?auto_56721 ?auto_56725 ) ( CLEAR ?auto_56721 ) ( not ( = ?auto_56720 ?auto_56725 ) ) ( not ( = ?auto_56721 ?auto_56725 ) ) ( not ( = ?auto_56729 ?auto_56725 ) ) ( not ( = ?auto_56732 ?auto_56725 ) ) ( SURFACE-AT ?auto_56723 ?auto_56724 ) ( CLEAR ?auto_56723 ) ( IS-CRATE ?auto_56732 ) ( not ( = ?auto_56720 ?auto_56723 ) ) ( not ( = ?auto_56721 ?auto_56723 ) ) ( not ( = ?auto_56729 ?auto_56723 ) ) ( not ( = ?auto_56732 ?auto_56723 ) ) ( not ( = ?auto_56725 ?auto_56723 ) ) ( AVAILABLE ?auto_56731 ) ( TRUCK-AT ?auto_56730 ?auto_56728 ) ( not ( = ?auto_56728 ?auto_56724 ) ) ( not ( = ?auto_56734 ?auto_56728 ) ) ( not ( = ?auto_56722 ?auto_56728 ) ) ( HOIST-AT ?auto_56733 ?auto_56728 ) ( not ( = ?auto_56731 ?auto_56733 ) ) ( not ( = ?auto_56727 ?auto_56733 ) ) ( not ( = ?auto_56726 ?auto_56733 ) ) ( AVAILABLE ?auto_56733 ) ( SURFACE-AT ?auto_56732 ?auto_56728 ) ( ON ?auto_56732 ?auto_56735 ) ( CLEAR ?auto_56732 ) ( not ( = ?auto_56720 ?auto_56735 ) ) ( not ( = ?auto_56721 ?auto_56735 ) ) ( not ( = ?auto_56729 ?auto_56735 ) ) ( not ( = ?auto_56732 ?auto_56735 ) ) ( not ( = ?auto_56725 ?auto_56735 ) ) ( not ( = ?auto_56723 ?auto_56735 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56733 ?auto_56732 ?auto_56735 ?auto_56728 )
      ( MAKE-ON ?auto_56720 ?auto_56721 )
      ( MAKE-ON-VERIFY ?auto_56720 ?auto_56721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56736 - SURFACE
      ?auto_56737 - SURFACE
    )
    :vars
    (
      ?auto_56750 - HOIST
      ?auto_56745 - PLACE
      ?auto_56748 - PLACE
      ?auto_56743 - HOIST
      ?auto_56744 - SURFACE
      ?auto_56739 - SURFACE
      ?auto_56747 - PLACE
      ?auto_56738 - HOIST
      ?auto_56740 - SURFACE
      ?auto_56742 - SURFACE
      ?auto_56749 - PLACE
      ?auto_56741 - HOIST
      ?auto_56751 - SURFACE
      ?auto_56746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56750 ?auto_56745 ) ( IS-CRATE ?auto_56736 ) ( not ( = ?auto_56736 ?auto_56737 ) ) ( not ( = ?auto_56748 ?auto_56745 ) ) ( HOIST-AT ?auto_56743 ?auto_56748 ) ( not ( = ?auto_56750 ?auto_56743 ) ) ( AVAILABLE ?auto_56743 ) ( SURFACE-AT ?auto_56736 ?auto_56748 ) ( ON ?auto_56736 ?auto_56744 ) ( CLEAR ?auto_56736 ) ( not ( = ?auto_56736 ?auto_56744 ) ) ( not ( = ?auto_56737 ?auto_56744 ) ) ( IS-CRATE ?auto_56737 ) ( not ( = ?auto_56736 ?auto_56739 ) ) ( not ( = ?auto_56737 ?auto_56739 ) ) ( not ( = ?auto_56744 ?auto_56739 ) ) ( not ( = ?auto_56747 ?auto_56745 ) ) ( not ( = ?auto_56748 ?auto_56747 ) ) ( HOIST-AT ?auto_56738 ?auto_56747 ) ( not ( = ?auto_56750 ?auto_56738 ) ) ( not ( = ?auto_56743 ?auto_56738 ) ) ( AVAILABLE ?auto_56738 ) ( SURFACE-AT ?auto_56737 ?auto_56747 ) ( ON ?auto_56737 ?auto_56740 ) ( CLEAR ?auto_56737 ) ( not ( = ?auto_56736 ?auto_56740 ) ) ( not ( = ?auto_56737 ?auto_56740 ) ) ( not ( = ?auto_56744 ?auto_56740 ) ) ( not ( = ?auto_56739 ?auto_56740 ) ) ( SURFACE-AT ?auto_56742 ?auto_56745 ) ( CLEAR ?auto_56742 ) ( IS-CRATE ?auto_56739 ) ( not ( = ?auto_56736 ?auto_56742 ) ) ( not ( = ?auto_56737 ?auto_56742 ) ) ( not ( = ?auto_56744 ?auto_56742 ) ) ( not ( = ?auto_56739 ?auto_56742 ) ) ( not ( = ?auto_56740 ?auto_56742 ) ) ( AVAILABLE ?auto_56750 ) ( not ( = ?auto_56749 ?auto_56745 ) ) ( not ( = ?auto_56748 ?auto_56749 ) ) ( not ( = ?auto_56747 ?auto_56749 ) ) ( HOIST-AT ?auto_56741 ?auto_56749 ) ( not ( = ?auto_56750 ?auto_56741 ) ) ( not ( = ?auto_56743 ?auto_56741 ) ) ( not ( = ?auto_56738 ?auto_56741 ) ) ( AVAILABLE ?auto_56741 ) ( SURFACE-AT ?auto_56739 ?auto_56749 ) ( ON ?auto_56739 ?auto_56751 ) ( CLEAR ?auto_56739 ) ( not ( = ?auto_56736 ?auto_56751 ) ) ( not ( = ?auto_56737 ?auto_56751 ) ) ( not ( = ?auto_56744 ?auto_56751 ) ) ( not ( = ?auto_56739 ?auto_56751 ) ) ( not ( = ?auto_56740 ?auto_56751 ) ) ( not ( = ?auto_56742 ?auto_56751 ) ) ( TRUCK-AT ?auto_56746 ?auto_56745 ) )
    :subtasks
    ( ( !DRIVE ?auto_56746 ?auto_56745 ?auto_56749 )
      ( MAKE-ON ?auto_56736 ?auto_56737 )
      ( MAKE-ON-VERIFY ?auto_56736 ?auto_56737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56752 - SURFACE
      ?auto_56753 - SURFACE
    )
    :vars
    (
      ?auto_56765 - HOIST
      ?auto_56757 - PLACE
      ?auto_56762 - PLACE
      ?auto_56754 - HOIST
      ?auto_56756 - SURFACE
      ?auto_56758 - SURFACE
      ?auto_56763 - PLACE
      ?auto_56766 - HOIST
      ?auto_56767 - SURFACE
      ?auto_56764 - SURFACE
      ?auto_56759 - PLACE
      ?auto_56761 - HOIST
      ?auto_56760 - SURFACE
      ?auto_56755 - TRUCK
      ?auto_56768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56765 ?auto_56757 ) ( IS-CRATE ?auto_56752 ) ( not ( = ?auto_56752 ?auto_56753 ) ) ( not ( = ?auto_56762 ?auto_56757 ) ) ( HOIST-AT ?auto_56754 ?auto_56762 ) ( not ( = ?auto_56765 ?auto_56754 ) ) ( AVAILABLE ?auto_56754 ) ( SURFACE-AT ?auto_56752 ?auto_56762 ) ( ON ?auto_56752 ?auto_56756 ) ( CLEAR ?auto_56752 ) ( not ( = ?auto_56752 ?auto_56756 ) ) ( not ( = ?auto_56753 ?auto_56756 ) ) ( IS-CRATE ?auto_56753 ) ( not ( = ?auto_56752 ?auto_56758 ) ) ( not ( = ?auto_56753 ?auto_56758 ) ) ( not ( = ?auto_56756 ?auto_56758 ) ) ( not ( = ?auto_56763 ?auto_56757 ) ) ( not ( = ?auto_56762 ?auto_56763 ) ) ( HOIST-AT ?auto_56766 ?auto_56763 ) ( not ( = ?auto_56765 ?auto_56766 ) ) ( not ( = ?auto_56754 ?auto_56766 ) ) ( AVAILABLE ?auto_56766 ) ( SURFACE-AT ?auto_56753 ?auto_56763 ) ( ON ?auto_56753 ?auto_56767 ) ( CLEAR ?auto_56753 ) ( not ( = ?auto_56752 ?auto_56767 ) ) ( not ( = ?auto_56753 ?auto_56767 ) ) ( not ( = ?auto_56756 ?auto_56767 ) ) ( not ( = ?auto_56758 ?auto_56767 ) ) ( IS-CRATE ?auto_56758 ) ( not ( = ?auto_56752 ?auto_56764 ) ) ( not ( = ?auto_56753 ?auto_56764 ) ) ( not ( = ?auto_56756 ?auto_56764 ) ) ( not ( = ?auto_56758 ?auto_56764 ) ) ( not ( = ?auto_56767 ?auto_56764 ) ) ( not ( = ?auto_56759 ?auto_56757 ) ) ( not ( = ?auto_56762 ?auto_56759 ) ) ( not ( = ?auto_56763 ?auto_56759 ) ) ( HOIST-AT ?auto_56761 ?auto_56759 ) ( not ( = ?auto_56765 ?auto_56761 ) ) ( not ( = ?auto_56754 ?auto_56761 ) ) ( not ( = ?auto_56766 ?auto_56761 ) ) ( AVAILABLE ?auto_56761 ) ( SURFACE-AT ?auto_56758 ?auto_56759 ) ( ON ?auto_56758 ?auto_56760 ) ( CLEAR ?auto_56758 ) ( not ( = ?auto_56752 ?auto_56760 ) ) ( not ( = ?auto_56753 ?auto_56760 ) ) ( not ( = ?auto_56756 ?auto_56760 ) ) ( not ( = ?auto_56758 ?auto_56760 ) ) ( not ( = ?auto_56767 ?auto_56760 ) ) ( not ( = ?auto_56764 ?auto_56760 ) ) ( TRUCK-AT ?auto_56755 ?auto_56757 ) ( SURFACE-AT ?auto_56768 ?auto_56757 ) ( CLEAR ?auto_56768 ) ( LIFTING ?auto_56765 ?auto_56764 ) ( IS-CRATE ?auto_56764 ) ( not ( = ?auto_56752 ?auto_56768 ) ) ( not ( = ?auto_56753 ?auto_56768 ) ) ( not ( = ?auto_56756 ?auto_56768 ) ) ( not ( = ?auto_56758 ?auto_56768 ) ) ( not ( = ?auto_56767 ?auto_56768 ) ) ( not ( = ?auto_56764 ?auto_56768 ) ) ( not ( = ?auto_56760 ?auto_56768 ) ) )
    :subtasks
    ( ( !DROP ?auto_56765 ?auto_56764 ?auto_56768 ?auto_56757 )
      ( MAKE-ON ?auto_56752 ?auto_56753 )
      ( MAKE-ON-VERIFY ?auto_56752 ?auto_56753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56769 - SURFACE
      ?auto_56770 - SURFACE
    )
    :vars
    (
      ?auto_56775 - HOIST
      ?auto_56772 - PLACE
      ?auto_56774 - PLACE
      ?auto_56780 - HOIST
      ?auto_56779 - SURFACE
      ?auto_56782 - SURFACE
      ?auto_56781 - PLACE
      ?auto_56778 - HOIST
      ?auto_56785 - SURFACE
      ?auto_56777 - SURFACE
      ?auto_56784 - PLACE
      ?auto_56783 - HOIST
      ?auto_56773 - SURFACE
      ?auto_56771 - TRUCK
      ?auto_56776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56775 ?auto_56772 ) ( IS-CRATE ?auto_56769 ) ( not ( = ?auto_56769 ?auto_56770 ) ) ( not ( = ?auto_56774 ?auto_56772 ) ) ( HOIST-AT ?auto_56780 ?auto_56774 ) ( not ( = ?auto_56775 ?auto_56780 ) ) ( AVAILABLE ?auto_56780 ) ( SURFACE-AT ?auto_56769 ?auto_56774 ) ( ON ?auto_56769 ?auto_56779 ) ( CLEAR ?auto_56769 ) ( not ( = ?auto_56769 ?auto_56779 ) ) ( not ( = ?auto_56770 ?auto_56779 ) ) ( IS-CRATE ?auto_56770 ) ( not ( = ?auto_56769 ?auto_56782 ) ) ( not ( = ?auto_56770 ?auto_56782 ) ) ( not ( = ?auto_56779 ?auto_56782 ) ) ( not ( = ?auto_56781 ?auto_56772 ) ) ( not ( = ?auto_56774 ?auto_56781 ) ) ( HOIST-AT ?auto_56778 ?auto_56781 ) ( not ( = ?auto_56775 ?auto_56778 ) ) ( not ( = ?auto_56780 ?auto_56778 ) ) ( AVAILABLE ?auto_56778 ) ( SURFACE-AT ?auto_56770 ?auto_56781 ) ( ON ?auto_56770 ?auto_56785 ) ( CLEAR ?auto_56770 ) ( not ( = ?auto_56769 ?auto_56785 ) ) ( not ( = ?auto_56770 ?auto_56785 ) ) ( not ( = ?auto_56779 ?auto_56785 ) ) ( not ( = ?auto_56782 ?auto_56785 ) ) ( IS-CRATE ?auto_56782 ) ( not ( = ?auto_56769 ?auto_56777 ) ) ( not ( = ?auto_56770 ?auto_56777 ) ) ( not ( = ?auto_56779 ?auto_56777 ) ) ( not ( = ?auto_56782 ?auto_56777 ) ) ( not ( = ?auto_56785 ?auto_56777 ) ) ( not ( = ?auto_56784 ?auto_56772 ) ) ( not ( = ?auto_56774 ?auto_56784 ) ) ( not ( = ?auto_56781 ?auto_56784 ) ) ( HOIST-AT ?auto_56783 ?auto_56784 ) ( not ( = ?auto_56775 ?auto_56783 ) ) ( not ( = ?auto_56780 ?auto_56783 ) ) ( not ( = ?auto_56778 ?auto_56783 ) ) ( AVAILABLE ?auto_56783 ) ( SURFACE-AT ?auto_56782 ?auto_56784 ) ( ON ?auto_56782 ?auto_56773 ) ( CLEAR ?auto_56782 ) ( not ( = ?auto_56769 ?auto_56773 ) ) ( not ( = ?auto_56770 ?auto_56773 ) ) ( not ( = ?auto_56779 ?auto_56773 ) ) ( not ( = ?auto_56782 ?auto_56773 ) ) ( not ( = ?auto_56785 ?auto_56773 ) ) ( not ( = ?auto_56777 ?auto_56773 ) ) ( TRUCK-AT ?auto_56771 ?auto_56772 ) ( SURFACE-AT ?auto_56776 ?auto_56772 ) ( CLEAR ?auto_56776 ) ( IS-CRATE ?auto_56777 ) ( not ( = ?auto_56769 ?auto_56776 ) ) ( not ( = ?auto_56770 ?auto_56776 ) ) ( not ( = ?auto_56779 ?auto_56776 ) ) ( not ( = ?auto_56782 ?auto_56776 ) ) ( not ( = ?auto_56785 ?auto_56776 ) ) ( not ( = ?auto_56777 ?auto_56776 ) ) ( not ( = ?auto_56773 ?auto_56776 ) ) ( AVAILABLE ?auto_56775 ) ( IN ?auto_56777 ?auto_56771 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56775 ?auto_56777 ?auto_56771 ?auto_56772 )
      ( MAKE-ON ?auto_56769 ?auto_56770 )
      ( MAKE-ON-VERIFY ?auto_56769 ?auto_56770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56786 - SURFACE
      ?auto_56787 - SURFACE
    )
    :vars
    (
      ?auto_56796 - HOIST
      ?auto_56791 - PLACE
      ?auto_56797 - PLACE
      ?auto_56800 - HOIST
      ?auto_56788 - SURFACE
      ?auto_56795 - SURFACE
      ?auto_56799 - PLACE
      ?auto_56789 - HOIST
      ?auto_56790 - SURFACE
      ?auto_56801 - SURFACE
      ?auto_56798 - PLACE
      ?auto_56802 - HOIST
      ?auto_56792 - SURFACE
      ?auto_56793 - SURFACE
      ?auto_56794 - TRUCK
      ?auto_56803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56796 ?auto_56791 ) ( IS-CRATE ?auto_56786 ) ( not ( = ?auto_56786 ?auto_56787 ) ) ( not ( = ?auto_56797 ?auto_56791 ) ) ( HOIST-AT ?auto_56800 ?auto_56797 ) ( not ( = ?auto_56796 ?auto_56800 ) ) ( AVAILABLE ?auto_56800 ) ( SURFACE-AT ?auto_56786 ?auto_56797 ) ( ON ?auto_56786 ?auto_56788 ) ( CLEAR ?auto_56786 ) ( not ( = ?auto_56786 ?auto_56788 ) ) ( not ( = ?auto_56787 ?auto_56788 ) ) ( IS-CRATE ?auto_56787 ) ( not ( = ?auto_56786 ?auto_56795 ) ) ( not ( = ?auto_56787 ?auto_56795 ) ) ( not ( = ?auto_56788 ?auto_56795 ) ) ( not ( = ?auto_56799 ?auto_56791 ) ) ( not ( = ?auto_56797 ?auto_56799 ) ) ( HOIST-AT ?auto_56789 ?auto_56799 ) ( not ( = ?auto_56796 ?auto_56789 ) ) ( not ( = ?auto_56800 ?auto_56789 ) ) ( AVAILABLE ?auto_56789 ) ( SURFACE-AT ?auto_56787 ?auto_56799 ) ( ON ?auto_56787 ?auto_56790 ) ( CLEAR ?auto_56787 ) ( not ( = ?auto_56786 ?auto_56790 ) ) ( not ( = ?auto_56787 ?auto_56790 ) ) ( not ( = ?auto_56788 ?auto_56790 ) ) ( not ( = ?auto_56795 ?auto_56790 ) ) ( IS-CRATE ?auto_56795 ) ( not ( = ?auto_56786 ?auto_56801 ) ) ( not ( = ?auto_56787 ?auto_56801 ) ) ( not ( = ?auto_56788 ?auto_56801 ) ) ( not ( = ?auto_56795 ?auto_56801 ) ) ( not ( = ?auto_56790 ?auto_56801 ) ) ( not ( = ?auto_56798 ?auto_56791 ) ) ( not ( = ?auto_56797 ?auto_56798 ) ) ( not ( = ?auto_56799 ?auto_56798 ) ) ( HOIST-AT ?auto_56802 ?auto_56798 ) ( not ( = ?auto_56796 ?auto_56802 ) ) ( not ( = ?auto_56800 ?auto_56802 ) ) ( not ( = ?auto_56789 ?auto_56802 ) ) ( AVAILABLE ?auto_56802 ) ( SURFACE-AT ?auto_56795 ?auto_56798 ) ( ON ?auto_56795 ?auto_56792 ) ( CLEAR ?auto_56795 ) ( not ( = ?auto_56786 ?auto_56792 ) ) ( not ( = ?auto_56787 ?auto_56792 ) ) ( not ( = ?auto_56788 ?auto_56792 ) ) ( not ( = ?auto_56795 ?auto_56792 ) ) ( not ( = ?auto_56790 ?auto_56792 ) ) ( not ( = ?auto_56801 ?auto_56792 ) ) ( SURFACE-AT ?auto_56793 ?auto_56791 ) ( CLEAR ?auto_56793 ) ( IS-CRATE ?auto_56801 ) ( not ( = ?auto_56786 ?auto_56793 ) ) ( not ( = ?auto_56787 ?auto_56793 ) ) ( not ( = ?auto_56788 ?auto_56793 ) ) ( not ( = ?auto_56795 ?auto_56793 ) ) ( not ( = ?auto_56790 ?auto_56793 ) ) ( not ( = ?auto_56801 ?auto_56793 ) ) ( not ( = ?auto_56792 ?auto_56793 ) ) ( AVAILABLE ?auto_56796 ) ( IN ?auto_56801 ?auto_56794 ) ( TRUCK-AT ?auto_56794 ?auto_56803 ) ( not ( = ?auto_56803 ?auto_56791 ) ) ( not ( = ?auto_56797 ?auto_56803 ) ) ( not ( = ?auto_56799 ?auto_56803 ) ) ( not ( = ?auto_56798 ?auto_56803 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56794 ?auto_56803 ?auto_56791 )
      ( MAKE-ON ?auto_56786 ?auto_56787 )
      ( MAKE-ON-VERIFY ?auto_56786 ?auto_56787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56804 - SURFACE
      ?auto_56805 - SURFACE
    )
    :vars
    (
      ?auto_56814 - HOIST
      ?auto_56811 - PLACE
      ?auto_56817 - PLACE
      ?auto_56812 - HOIST
      ?auto_56816 - SURFACE
      ?auto_56806 - SURFACE
      ?auto_56813 - PLACE
      ?auto_56808 - HOIST
      ?auto_56809 - SURFACE
      ?auto_56821 - SURFACE
      ?auto_56810 - PLACE
      ?auto_56820 - HOIST
      ?auto_56818 - SURFACE
      ?auto_56807 - SURFACE
      ?auto_56819 - TRUCK
      ?auto_56815 - PLACE
      ?auto_56822 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56814 ?auto_56811 ) ( IS-CRATE ?auto_56804 ) ( not ( = ?auto_56804 ?auto_56805 ) ) ( not ( = ?auto_56817 ?auto_56811 ) ) ( HOIST-AT ?auto_56812 ?auto_56817 ) ( not ( = ?auto_56814 ?auto_56812 ) ) ( AVAILABLE ?auto_56812 ) ( SURFACE-AT ?auto_56804 ?auto_56817 ) ( ON ?auto_56804 ?auto_56816 ) ( CLEAR ?auto_56804 ) ( not ( = ?auto_56804 ?auto_56816 ) ) ( not ( = ?auto_56805 ?auto_56816 ) ) ( IS-CRATE ?auto_56805 ) ( not ( = ?auto_56804 ?auto_56806 ) ) ( not ( = ?auto_56805 ?auto_56806 ) ) ( not ( = ?auto_56816 ?auto_56806 ) ) ( not ( = ?auto_56813 ?auto_56811 ) ) ( not ( = ?auto_56817 ?auto_56813 ) ) ( HOIST-AT ?auto_56808 ?auto_56813 ) ( not ( = ?auto_56814 ?auto_56808 ) ) ( not ( = ?auto_56812 ?auto_56808 ) ) ( AVAILABLE ?auto_56808 ) ( SURFACE-AT ?auto_56805 ?auto_56813 ) ( ON ?auto_56805 ?auto_56809 ) ( CLEAR ?auto_56805 ) ( not ( = ?auto_56804 ?auto_56809 ) ) ( not ( = ?auto_56805 ?auto_56809 ) ) ( not ( = ?auto_56816 ?auto_56809 ) ) ( not ( = ?auto_56806 ?auto_56809 ) ) ( IS-CRATE ?auto_56806 ) ( not ( = ?auto_56804 ?auto_56821 ) ) ( not ( = ?auto_56805 ?auto_56821 ) ) ( not ( = ?auto_56816 ?auto_56821 ) ) ( not ( = ?auto_56806 ?auto_56821 ) ) ( not ( = ?auto_56809 ?auto_56821 ) ) ( not ( = ?auto_56810 ?auto_56811 ) ) ( not ( = ?auto_56817 ?auto_56810 ) ) ( not ( = ?auto_56813 ?auto_56810 ) ) ( HOIST-AT ?auto_56820 ?auto_56810 ) ( not ( = ?auto_56814 ?auto_56820 ) ) ( not ( = ?auto_56812 ?auto_56820 ) ) ( not ( = ?auto_56808 ?auto_56820 ) ) ( AVAILABLE ?auto_56820 ) ( SURFACE-AT ?auto_56806 ?auto_56810 ) ( ON ?auto_56806 ?auto_56818 ) ( CLEAR ?auto_56806 ) ( not ( = ?auto_56804 ?auto_56818 ) ) ( not ( = ?auto_56805 ?auto_56818 ) ) ( not ( = ?auto_56816 ?auto_56818 ) ) ( not ( = ?auto_56806 ?auto_56818 ) ) ( not ( = ?auto_56809 ?auto_56818 ) ) ( not ( = ?auto_56821 ?auto_56818 ) ) ( SURFACE-AT ?auto_56807 ?auto_56811 ) ( CLEAR ?auto_56807 ) ( IS-CRATE ?auto_56821 ) ( not ( = ?auto_56804 ?auto_56807 ) ) ( not ( = ?auto_56805 ?auto_56807 ) ) ( not ( = ?auto_56816 ?auto_56807 ) ) ( not ( = ?auto_56806 ?auto_56807 ) ) ( not ( = ?auto_56809 ?auto_56807 ) ) ( not ( = ?auto_56821 ?auto_56807 ) ) ( not ( = ?auto_56818 ?auto_56807 ) ) ( AVAILABLE ?auto_56814 ) ( TRUCK-AT ?auto_56819 ?auto_56815 ) ( not ( = ?auto_56815 ?auto_56811 ) ) ( not ( = ?auto_56817 ?auto_56815 ) ) ( not ( = ?auto_56813 ?auto_56815 ) ) ( not ( = ?auto_56810 ?auto_56815 ) ) ( HOIST-AT ?auto_56822 ?auto_56815 ) ( LIFTING ?auto_56822 ?auto_56821 ) ( not ( = ?auto_56814 ?auto_56822 ) ) ( not ( = ?auto_56812 ?auto_56822 ) ) ( not ( = ?auto_56808 ?auto_56822 ) ) ( not ( = ?auto_56820 ?auto_56822 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56822 ?auto_56821 ?auto_56819 ?auto_56815 )
      ( MAKE-ON ?auto_56804 ?auto_56805 )
      ( MAKE-ON-VERIFY ?auto_56804 ?auto_56805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56823 - SURFACE
      ?auto_56824 - SURFACE
    )
    :vars
    (
      ?auto_56839 - HOIST
      ?auto_56840 - PLACE
      ?auto_56826 - PLACE
      ?auto_56832 - HOIST
      ?auto_56825 - SURFACE
      ?auto_56833 - SURFACE
      ?auto_56836 - PLACE
      ?auto_56835 - HOIST
      ?auto_56828 - SURFACE
      ?auto_56838 - SURFACE
      ?auto_56831 - PLACE
      ?auto_56841 - HOIST
      ?auto_56827 - SURFACE
      ?auto_56837 - SURFACE
      ?auto_56830 - TRUCK
      ?auto_56834 - PLACE
      ?auto_56829 - HOIST
      ?auto_56842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56839 ?auto_56840 ) ( IS-CRATE ?auto_56823 ) ( not ( = ?auto_56823 ?auto_56824 ) ) ( not ( = ?auto_56826 ?auto_56840 ) ) ( HOIST-AT ?auto_56832 ?auto_56826 ) ( not ( = ?auto_56839 ?auto_56832 ) ) ( AVAILABLE ?auto_56832 ) ( SURFACE-AT ?auto_56823 ?auto_56826 ) ( ON ?auto_56823 ?auto_56825 ) ( CLEAR ?auto_56823 ) ( not ( = ?auto_56823 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56825 ) ) ( IS-CRATE ?auto_56824 ) ( not ( = ?auto_56823 ?auto_56833 ) ) ( not ( = ?auto_56824 ?auto_56833 ) ) ( not ( = ?auto_56825 ?auto_56833 ) ) ( not ( = ?auto_56836 ?auto_56840 ) ) ( not ( = ?auto_56826 ?auto_56836 ) ) ( HOIST-AT ?auto_56835 ?auto_56836 ) ( not ( = ?auto_56839 ?auto_56835 ) ) ( not ( = ?auto_56832 ?auto_56835 ) ) ( AVAILABLE ?auto_56835 ) ( SURFACE-AT ?auto_56824 ?auto_56836 ) ( ON ?auto_56824 ?auto_56828 ) ( CLEAR ?auto_56824 ) ( not ( = ?auto_56823 ?auto_56828 ) ) ( not ( = ?auto_56824 ?auto_56828 ) ) ( not ( = ?auto_56825 ?auto_56828 ) ) ( not ( = ?auto_56833 ?auto_56828 ) ) ( IS-CRATE ?auto_56833 ) ( not ( = ?auto_56823 ?auto_56838 ) ) ( not ( = ?auto_56824 ?auto_56838 ) ) ( not ( = ?auto_56825 ?auto_56838 ) ) ( not ( = ?auto_56833 ?auto_56838 ) ) ( not ( = ?auto_56828 ?auto_56838 ) ) ( not ( = ?auto_56831 ?auto_56840 ) ) ( not ( = ?auto_56826 ?auto_56831 ) ) ( not ( = ?auto_56836 ?auto_56831 ) ) ( HOIST-AT ?auto_56841 ?auto_56831 ) ( not ( = ?auto_56839 ?auto_56841 ) ) ( not ( = ?auto_56832 ?auto_56841 ) ) ( not ( = ?auto_56835 ?auto_56841 ) ) ( AVAILABLE ?auto_56841 ) ( SURFACE-AT ?auto_56833 ?auto_56831 ) ( ON ?auto_56833 ?auto_56827 ) ( CLEAR ?auto_56833 ) ( not ( = ?auto_56823 ?auto_56827 ) ) ( not ( = ?auto_56824 ?auto_56827 ) ) ( not ( = ?auto_56825 ?auto_56827 ) ) ( not ( = ?auto_56833 ?auto_56827 ) ) ( not ( = ?auto_56828 ?auto_56827 ) ) ( not ( = ?auto_56838 ?auto_56827 ) ) ( SURFACE-AT ?auto_56837 ?auto_56840 ) ( CLEAR ?auto_56837 ) ( IS-CRATE ?auto_56838 ) ( not ( = ?auto_56823 ?auto_56837 ) ) ( not ( = ?auto_56824 ?auto_56837 ) ) ( not ( = ?auto_56825 ?auto_56837 ) ) ( not ( = ?auto_56833 ?auto_56837 ) ) ( not ( = ?auto_56828 ?auto_56837 ) ) ( not ( = ?auto_56838 ?auto_56837 ) ) ( not ( = ?auto_56827 ?auto_56837 ) ) ( AVAILABLE ?auto_56839 ) ( TRUCK-AT ?auto_56830 ?auto_56834 ) ( not ( = ?auto_56834 ?auto_56840 ) ) ( not ( = ?auto_56826 ?auto_56834 ) ) ( not ( = ?auto_56836 ?auto_56834 ) ) ( not ( = ?auto_56831 ?auto_56834 ) ) ( HOIST-AT ?auto_56829 ?auto_56834 ) ( not ( = ?auto_56839 ?auto_56829 ) ) ( not ( = ?auto_56832 ?auto_56829 ) ) ( not ( = ?auto_56835 ?auto_56829 ) ) ( not ( = ?auto_56841 ?auto_56829 ) ) ( AVAILABLE ?auto_56829 ) ( SURFACE-AT ?auto_56838 ?auto_56834 ) ( ON ?auto_56838 ?auto_56842 ) ( CLEAR ?auto_56838 ) ( not ( = ?auto_56823 ?auto_56842 ) ) ( not ( = ?auto_56824 ?auto_56842 ) ) ( not ( = ?auto_56825 ?auto_56842 ) ) ( not ( = ?auto_56833 ?auto_56842 ) ) ( not ( = ?auto_56828 ?auto_56842 ) ) ( not ( = ?auto_56838 ?auto_56842 ) ) ( not ( = ?auto_56827 ?auto_56842 ) ) ( not ( = ?auto_56837 ?auto_56842 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56829 ?auto_56838 ?auto_56842 ?auto_56834 )
      ( MAKE-ON ?auto_56823 ?auto_56824 )
      ( MAKE-ON-VERIFY ?auto_56823 ?auto_56824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56843 - SURFACE
      ?auto_56844 - SURFACE
    )
    :vars
    (
      ?auto_56862 - HOIST
      ?auto_56850 - PLACE
      ?auto_56858 - PLACE
      ?auto_56859 - HOIST
      ?auto_56853 - SURFACE
      ?auto_56855 - SURFACE
      ?auto_56861 - PLACE
      ?auto_56860 - HOIST
      ?auto_56846 - SURFACE
      ?auto_56854 - SURFACE
      ?auto_56845 - PLACE
      ?auto_56848 - HOIST
      ?auto_56857 - SURFACE
      ?auto_56851 - SURFACE
      ?auto_56856 - PLACE
      ?auto_56847 - HOIST
      ?auto_56849 - SURFACE
      ?auto_56852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56862 ?auto_56850 ) ( IS-CRATE ?auto_56843 ) ( not ( = ?auto_56843 ?auto_56844 ) ) ( not ( = ?auto_56858 ?auto_56850 ) ) ( HOIST-AT ?auto_56859 ?auto_56858 ) ( not ( = ?auto_56862 ?auto_56859 ) ) ( AVAILABLE ?auto_56859 ) ( SURFACE-AT ?auto_56843 ?auto_56858 ) ( ON ?auto_56843 ?auto_56853 ) ( CLEAR ?auto_56843 ) ( not ( = ?auto_56843 ?auto_56853 ) ) ( not ( = ?auto_56844 ?auto_56853 ) ) ( IS-CRATE ?auto_56844 ) ( not ( = ?auto_56843 ?auto_56855 ) ) ( not ( = ?auto_56844 ?auto_56855 ) ) ( not ( = ?auto_56853 ?auto_56855 ) ) ( not ( = ?auto_56861 ?auto_56850 ) ) ( not ( = ?auto_56858 ?auto_56861 ) ) ( HOIST-AT ?auto_56860 ?auto_56861 ) ( not ( = ?auto_56862 ?auto_56860 ) ) ( not ( = ?auto_56859 ?auto_56860 ) ) ( AVAILABLE ?auto_56860 ) ( SURFACE-AT ?auto_56844 ?auto_56861 ) ( ON ?auto_56844 ?auto_56846 ) ( CLEAR ?auto_56844 ) ( not ( = ?auto_56843 ?auto_56846 ) ) ( not ( = ?auto_56844 ?auto_56846 ) ) ( not ( = ?auto_56853 ?auto_56846 ) ) ( not ( = ?auto_56855 ?auto_56846 ) ) ( IS-CRATE ?auto_56855 ) ( not ( = ?auto_56843 ?auto_56854 ) ) ( not ( = ?auto_56844 ?auto_56854 ) ) ( not ( = ?auto_56853 ?auto_56854 ) ) ( not ( = ?auto_56855 ?auto_56854 ) ) ( not ( = ?auto_56846 ?auto_56854 ) ) ( not ( = ?auto_56845 ?auto_56850 ) ) ( not ( = ?auto_56858 ?auto_56845 ) ) ( not ( = ?auto_56861 ?auto_56845 ) ) ( HOIST-AT ?auto_56848 ?auto_56845 ) ( not ( = ?auto_56862 ?auto_56848 ) ) ( not ( = ?auto_56859 ?auto_56848 ) ) ( not ( = ?auto_56860 ?auto_56848 ) ) ( AVAILABLE ?auto_56848 ) ( SURFACE-AT ?auto_56855 ?auto_56845 ) ( ON ?auto_56855 ?auto_56857 ) ( CLEAR ?auto_56855 ) ( not ( = ?auto_56843 ?auto_56857 ) ) ( not ( = ?auto_56844 ?auto_56857 ) ) ( not ( = ?auto_56853 ?auto_56857 ) ) ( not ( = ?auto_56855 ?auto_56857 ) ) ( not ( = ?auto_56846 ?auto_56857 ) ) ( not ( = ?auto_56854 ?auto_56857 ) ) ( SURFACE-AT ?auto_56851 ?auto_56850 ) ( CLEAR ?auto_56851 ) ( IS-CRATE ?auto_56854 ) ( not ( = ?auto_56843 ?auto_56851 ) ) ( not ( = ?auto_56844 ?auto_56851 ) ) ( not ( = ?auto_56853 ?auto_56851 ) ) ( not ( = ?auto_56855 ?auto_56851 ) ) ( not ( = ?auto_56846 ?auto_56851 ) ) ( not ( = ?auto_56854 ?auto_56851 ) ) ( not ( = ?auto_56857 ?auto_56851 ) ) ( AVAILABLE ?auto_56862 ) ( not ( = ?auto_56856 ?auto_56850 ) ) ( not ( = ?auto_56858 ?auto_56856 ) ) ( not ( = ?auto_56861 ?auto_56856 ) ) ( not ( = ?auto_56845 ?auto_56856 ) ) ( HOIST-AT ?auto_56847 ?auto_56856 ) ( not ( = ?auto_56862 ?auto_56847 ) ) ( not ( = ?auto_56859 ?auto_56847 ) ) ( not ( = ?auto_56860 ?auto_56847 ) ) ( not ( = ?auto_56848 ?auto_56847 ) ) ( AVAILABLE ?auto_56847 ) ( SURFACE-AT ?auto_56854 ?auto_56856 ) ( ON ?auto_56854 ?auto_56849 ) ( CLEAR ?auto_56854 ) ( not ( = ?auto_56843 ?auto_56849 ) ) ( not ( = ?auto_56844 ?auto_56849 ) ) ( not ( = ?auto_56853 ?auto_56849 ) ) ( not ( = ?auto_56855 ?auto_56849 ) ) ( not ( = ?auto_56846 ?auto_56849 ) ) ( not ( = ?auto_56854 ?auto_56849 ) ) ( not ( = ?auto_56857 ?auto_56849 ) ) ( not ( = ?auto_56851 ?auto_56849 ) ) ( TRUCK-AT ?auto_56852 ?auto_56850 ) )
    :subtasks
    ( ( !DRIVE ?auto_56852 ?auto_56850 ?auto_56856 )
      ( MAKE-ON ?auto_56843 ?auto_56844 )
      ( MAKE-ON-VERIFY ?auto_56843 ?auto_56844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56863 - SURFACE
      ?auto_56864 - SURFACE
    )
    :vars
    (
      ?auto_56873 - HOIST
      ?auto_56868 - PLACE
      ?auto_56874 - PLACE
      ?auto_56872 - HOIST
      ?auto_56879 - SURFACE
      ?auto_56876 - SURFACE
      ?auto_56880 - PLACE
      ?auto_56871 - HOIST
      ?auto_56870 - SURFACE
      ?auto_56877 - SURFACE
      ?auto_56869 - PLACE
      ?auto_56881 - HOIST
      ?auto_56866 - SURFACE
      ?auto_56875 - SURFACE
      ?auto_56882 - PLACE
      ?auto_56878 - HOIST
      ?auto_56867 - SURFACE
      ?auto_56865 - TRUCK
      ?auto_56883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56873 ?auto_56868 ) ( IS-CRATE ?auto_56863 ) ( not ( = ?auto_56863 ?auto_56864 ) ) ( not ( = ?auto_56874 ?auto_56868 ) ) ( HOIST-AT ?auto_56872 ?auto_56874 ) ( not ( = ?auto_56873 ?auto_56872 ) ) ( AVAILABLE ?auto_56872 ) ( SURFACE-AT ?auto_56863 ?auto_56874 ) ( ON ?auto_56863 ?auto_56879 ) ( CLEAR ?auto_56863 ) ( not ( = ?auto_56863 ?auto_56879 ) ) ( not ( = ?auto_56864 ?auto_56879 ) ) ( IS-CRATE ?auto_56864 ) ( not ( = ?auto_56863 ?auto_56876 ) ) ( not ( = ?auto_56864 ?auto_56876 ) ) ( not ( = ?auto_56879 ?auto_56876 ) ) ( not ( = ?auto_56880 ?auto_56868 ) ) ( not ( = ?auto_56874 ?auto_56880 ) ) ( HOIST-AT ?auto_56871 ?auto_56880 ) ( not ( = ?auto_56873 ?auto_56871 ) ) ( not ( = ?auto_56872 ?auto_56871 ) ) ( AVAILABLE ?auto_56871 ) ( SURFACE-AT ?auto_56864 ?auto_56880 ) ( ON ?auto_56864 ?auto_56870 ) ( CLEAR ?auto_56864 ) ( not ( = ?auto_56863 ?auto_56870 ) ) ( not ( = ?auto_56864 ?auto_56870 ) ) ( not ( = ?auto_56879 ?auto_56870 ) ) ( not ( = ?auto_56876 ?auto_56870 ) ) ( IS-CRATE ?auto_56876 ) ( not ( = ?auto_56863 ?auto_56877 ) ) ( not ( = ?auto_56864 ?auto_56877 ) ) ( not ( = ?auto_56879 ?auto_56877 ) ) ( not ( = ?auto_56876 ?auto_56877 ) ) ( not ( = ?auto_56870 ?auto_56877 ) ) ( not ( = ?auto_56869 ?auto_56868 ) ) ( not ( = ?auto_56874 ?auto_56869 ) ) ( not ( = ?auto_56880 ?auto_56869 ) ) ( HOIST-AT ?auto_56881 ?auto_56869 ) ( not ( = ?auto_56873 ?auto_56881 ) ) ( not ( = ?auto_56872 ?auto_56881 ) ) ( not ( = ?auto_56871 ?auto_56881 ) ) ( AVAILABLE ?auto_56881 ) ( SURFACE-AT ?auto_56876 ?auto_56869 ) ( ON ?auto_56876 ?auto_56866 ) ( CLEAR ?auto_56876 ) ( not ( = ?auto_56863 ?auto_56866 ) ) ( not ( = ?auto_56864 ?auto_56866 ) ) ( not ( = ?auto_56879 ?auto_56866 ) ) ( not ( = ?auto_56876 ?auto_56866 ) ) ( not ( = ?auto_56870 ?auto_56866 ) ) ( not ( = ?auto_56877 ?auto_56866 ) ) ( IS-CRATE ?auto_56877 ) ( not ( = ?auto_56863 ?auto_56875 ) ) ( not ( = ?auto_56864 ?auto_56875 ) ) ( not ( = ?auto_56879 ?auto_56875 ) ) ( not ( = ?auto_56876 ?auto_56875 ) ) ( not ( = ?auto_56870 ?auto_56875 ) ) ( not ( = ?auto_56877 ?auto_56875 ) ) ( not ( = ?auto_56866 ?auto_56875 ) ) ( not ( = ?auto_56882 ?auto_56868 ) ) ( not ( = ?auto_56874 ?auto_56882 ) ) ( not ( = ?auto_56880 ?auto_56882 ) ) ( not ( = ?auto_56869 ?auto_56882 ) ) ( HOIST-AT ?auto_56878 ?auto_56882 ) ( not ( = ?auto_56873 ?auto_56878 ) ) ( not ( = ?auto_56872 ?auto_56878 ) ) ( not ( = ?auto_56871 ?auto_56878 ) ) ( not ( = ?auto_56881 ?auto_56878 ) ) ( AVAILABLE ?auto_56878 ) ( SURFACE-AT ?auto_56877 ?auto_56882 ) ( ON ?auto_56877 ?auto_56867 ) ( CLEAR ?auto_56877 ) ( not ( = ?auto_56863 ?auto_56867 ) ) ( not ( = ?auto_56864 ?auto_56867 ) ) ( not ( = ?auto_56879 ?auto_56867 ) ) ( not ( = ?auto_56876 ?auto_56867 ) ) ( not ( = ?auto_56870 ?auto_56867 ) ) ( not ( = ?auto_56877 ?auto_56867 ) ) ( not ( = ?auto_56866 ?auto_56867 ) ) ( not ( = ?auto_56875 ?auto_56867 ) ) ( TRUCK-AT ?auto_56865 ?auto_56868 ) ( SURFACE-AT ?auto_56883 ?auto_56868 ) ( CLEAR ?auto_56883 ) ( LIFTING ?auto_56873 ?auto_56875 ) ( IS-CRATE ?auto_56875 ) ( not ( = ?auto_56863 ?auto_56883 ) ) ( not ( = ?auto_56864 ?auto_56883 ) ) ( not ( = ?auto_56879 ?auto_56883 ) ) ( not ( = ?auto_56876 ?auto_56883 ) ) ( not ( = ?auto_56870 ?auto_56883 ) ) ( not ( = ?auto_56877 ?auto_56883 ) ) ( not ( = ?auto_56866 ?auto_56883 ) ) ( not ( = ?auto_56875 ?auto_56883 ) ) ( not ( = ?auto_56867 ?auto_56883 ) ) )
    :subtasks
    ( ( !DROP ?auto_56873 ?auto_56875 ?auto_56883 ?auto_56868 )
      ( MAKE-ON ?auto_56863 ?auto_56864 )
      ( MAKE-ON-VERIFY ?auto_56863 ?auto_56864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56884 - SURFACE
      ?auto_56885 - SURFACE
    )
    :vars
    (
      ?auto_56897 - HOIST
      ?auto_56891 - PLACE
      ?auto_56887 - PLACE
      ?auto_56903 - HOIST
      ?auto_56888 - SURFACE
      ?auto_56895 - SURFACE
      ?auto_56892 - PLACE
      ?auto_56893 - HOIST
      ?auto_56900 - SURFACE
      ?auto_56889 - SURFACE
      ?auto_56899 - PLACE
      ?auto_56886 - HOIST
      ?auto_56894 - SURFACE
      ?auto_56901 - SURFACE
      ?auto_56904 - PLACE
      ?auto_56902 - HOIST
      ?auto_56890 - SURFACE
      ?auto_56898 - TRUCK
      ?auto_56896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56897 ?auto_56891 ) ( IS-CRATE ?auto_56884 ) ( not ( = ?auto_56884 ?auto_56885 ) ) ( not ( = ?auto_56887 ?auto_56891 ) ) ( HOIST-AT ?auto_56903 ?auto_56887 ) ( not ( = ?auto_56897 ?auto_56903 ) ) ( AVAILABLE ?auto_56903 ) ( SURFACE-AT ?auto_56884 ?auto_56887 ) ( ON ?auto_56884 ?auto_56888 ) ( CLEAR ?auto_56884 ) ( not ( = ?auto_56884 ?auto_56888 ) ) ( not ( = ?auto_56885 ?auto_56888 ) ) ( IS-CRATE ?auto_56885 ) ( not ( = ?auto_56884 ?auto_56895 ) ) ( not ( = ?auto_56885 ?auto_56895 ) ) ( not ( = ?auto_56888 ?auto_56895 ) ) ( not ( = ?auto_56892 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56892 ) ) ( HOIST-AT ?auto_56893 ?auto_56892 ) ( not ( = ?auto_56897 ?auto_56893 ) ) ( not ( = ?auto_56903 ?auto_56893 ) ) ( AVAILABLE ?auto_56893 ) ( SURFACE-AT ?auto_56885 ?auto_56892 ) ( ON ?auto_56885 ?auto_56900 ) ( CLEAR ?auto_56885 ) ( not ( = ?auto_56884 ?auto_56900 ) ) ( not ( = ?auto_56885 ?auto_56900 ) ) ( not ( = ?auto_56888 ?auto_56900 ) ) ( not ( = ?auto_56895 ?auto_56900 ) ) ( IS-CRATE ?auto_56895 ) ( not ( = ?auto_56884 ?auto_56889 ) ) ( not ( = ?auto_56885 ?auto_56889 ) ) ( not ( = ?auto_56888 ?auto_56889 ) ) ( not ( = ?auto_56895 ?auto_56889 ) ) ( not ( = ?auto_56900 ?auto_56889 ) ) ( not ( = ?auto_56899 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56899 ) ) ( not ( = ?auto_56892 ?auto_56899 ) ) ( HOIST-AT ?auto_56886 ?auto_56899 ) ( not ( = ?auto_56897 ?auto_56886 ) ) ( not ( = ?auto_56903 ?auto_56886 ) ) ( not ( = ?auto_56893 ?auto_56886 ) ) ( AVAILABLE ?auto_56886 ) ( SURFACE-AT ?auto_56895 ?auto_56899 ) ( ON ?auto_56895 ?auto_56894 ) ( CLEAR ?auto_56895 ) ( not ( = ?auto_56884 ?auto_56894 ) ) ( not ( = ?auto_56885 ?auto_56894 ) ) ( not ( = ?auto_56888 ?auto_56894 ) ) ( not ( = ?auto_56895 ?auto_56894 ) ) ( not ( = ?auto_56900 ?auto_56894 ) ) ( not ( = ?auto_56889 ?auto_56894 ) ) ( IS-CRATE ?auto_56889 ) ( not ( = ?auto_56884 ?auto_56901 ) ) ( not ( = ?auto_56885 ?auto_56901 ) ) ( not ( = ?auto_56888 ?auto_56901 ) ) ( not ( = ?auto_56895 ?auto_56901 ) ) ( not ( = ?auto_56900 ?auto_56901 ) ) ( not ( = ?auto_56889 ?auto_56901 ) ) ( not ( = ?auto_56894 ?auto_56901 ) ) ( not ( = ?auto_56904 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56904 ) ) ( not ( = ?auto_56892 ?auto_56904 ) ) ( not ( = ?auto_56899 ?auto_56904 ) ) ( HOIST-AT ?auto_56902 ?auto_56904 ) ( not ( = ?auto_56897 ?auto_56902 ) ) ( not ( = ?auto_56903 ?auto_56902 ) ) ( not ( = ?auto_56893 ?auto_56902 ) ) ( not ( = ?auto_56886 ?auto_56902 ) ) ( AVAILABLE ?auto_56902 ) ( SURFACE-AT ?auto_56889 ?auto_56904 ) ( ON ?auto_56889 ?auto_56890 ) ( CLEAR ?auto_56889 ) ( not ( = ?auto_56884 ?auto_56890 ) ) ( not ( = ?auto_56885 ?auto_56890 ) ) ( not ( = ?auto_56888 ?auto_56890 ) ) ( not ( = ?auto_56895 ?auto_56890 ) ) ( not ( = ?auto_56900 ?auto_56890 ) ) ( not ( = ?auto_56889 ?auto_56890 ) ) ( not ( = ?auto_56894 ?auto_56890 ) ) ( not ( = ?auto_56901 ?auto_56890 ) ) ( TRUCK-AT ?auto_56898 ?auto_56891 ) ( SURFACE-AT ?auto_56896 ?auto_56891 ) ( CLEAR ?auto_56896 ) ( IS-CRATE ?auto_56901 ) ( not ( = ?auto_56884 ?auto_56896 ) ) ( not ( = ?auto_56885 ?auto_56896 ) ) ( not ( = ?auto_56888 ?auto_56896 ) ) ( not ( = ?auto_56895 ?auto_56896 ) ) ( not ( = ?auto_56900 ?auto_56896 ) ) ( not ( = ?auto_56889 ?auto_56896 ) ) ( not ( = ?auto_56894 ?auto_56896 ) ) ( not ( = ?auto_56901 ?auto_56896 ) ) ( not ( = ?auto_56890 ?auto_56896 ) ) ( AVAILABLE ?auto_56897 ) ( IN ?auto_56901 ?auto_56898 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56897 ?auto_56901 ?auto_56898 ?auto_56891 )
      ( MAKE-ON ?auto_56884 ?auto_56885 )
      ( MAKE-ON-VERIFY ?auto_56884 ?auto_56885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56905 - SURFACE
      ?auto_56906 - SURFACE
    )
    :vars
    (
      ?auto_56916 - HOIST
      ?auto_56922 - PLACE
      ?auto_56913 - PLACE
      ?auto_56911 - HOIST
      ?auto_56917 - SURFACE
      ?auto_56921 - SURFACE
      ?auto_56915 - PLACE
      ?auto_56920 - HOIST
      ?auto_56907 - SURFACE
      ?auto_56923 - SURFACE
      ?auto_56912 - PLACE
      ?auto_56925 - HOIST
      ?auto_56918 - SURFACE
      ?auto_56908 - SURFACE
      ?auto_56924 - PLACE
      ?auto_56910 - HOIST
      ?auto_56914 - SURFACE
      ?auto_56909 - SURFACE
      ?auto_56919 - TRUCK
      ?auto_56926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56916 ?auto_56922 ) ( IS-CRATE ?auto_56905 ) ( not ( = ?auto_56905 ?auto_56906 ) ) ( not ( = ?auto_56913 ?auto_56922 ) ) ( HOIST-AT ?auto_56911 ?auto_56913 ) ( not ( = ?auto_56916 ?auto_56911 ) ) ( AVAILABLE ?auto_56911 ) ( SURFACE-AT ?auto_56905 ?auto_56913 ) ( ON ?auto_56905 ?auto_56917 ) ( CLEAR ?auto_56905 ) ( not ( = ?auto_56905 ?auto_56917 ) ) ( not ( = ?auto_56906 ?auto_56917 ) ) ( IS-CRATE ?auto_56906 ) ( not ( = ?auto_56905 ?auto_56921 ) ) ( not ( = ?auto_56906 ?auto_56921 ) ) ( not ( = ?auto_56917 ?auto_56921 ) ) ( not ( = ?auto_56915 ?auto_56922 ) ) ( not ( = ?auto_56913 ?auto_56915 ) ) ( HOIST-AT ?auto_56920 ?auto_56915 ) ( not ( = ?auto_56916 ?auto_56920 ) ) ( not ( = ?auto_56911 ?auto_56920 ) ) ( AVAILABLE ?auto_56920 ) ( SURFACE-AT ?auto_56906 ?auto_56915 ) ( ON ?auto_56906 ?auto_56907 ) ( CLEAR ?auto_56906 ) ( not ( = ?auto_56905 ?auto_56907 ) ) ( not ( = ?auto_56906 ?auto_56907 ) ) ( not ( = ?auto_56917 ?auto_56907 ) ) ( not ( = ?auto_56921 ?auto_56907 ) ) ( IS-CRATE ?auto_56921 ) ( not ( = ?auto_56905 ?auto_56923 ) ) ( not ( = ?auto_56906 ?auto_56923 ) ) ( not ( = ?auto_56917 ?auto_56923 ) ) ( not ( = ?auto_56921 ?auto_56923 ) ) ( not ( = ?auto_56907 ?auto_56923 ) ) ( not ( = ?auto_56912 ?auto_56922 ) ) ( not ( = ?auto_56913 ?auto_56912 ) ) ( not ( = ?auto_56915 ?auto_56912 ) ) ( HOIST-AT ?auto_56925 ?auto_56912 ) ( not ( = ?auto_56916 ?auto_56925 ) ) ( not ( = ?auto_56911 ?auto_56925 ) ) ( not ( = ?auto_56920 ?auto_56925 ) ) ( AVAILABLE ?auto_56925 ) ( SURFACE-AT ?auto_56921 ?auto_56912 ) ( ON ?auto_56921 ?auto_56918 ) ( CLEAR ?auto_56921 ) ( not ( = ?auto_56905 ?auto_56918 ) ) ( not ( = ?auto_56906 ?auto_56918 ) ) ( not ( = ?auto_56917 ?auto_56918 ) ) ( not ( = ?auto_56921 ?auto_56918 ) ) ( not ( = ?auto_56907 ?auto_56918 ) ) ( not ( = ?auto_56923 ?auto_56918 ) ) ( IS-CRATE ?auto_56923 ) ( not ( = ?auto_56905 ?auto_56908 ) ) ( not ( = ?auto_56906 ?auto_56908 ) ) ( not ( = ?auto_56917 ?auto_56908 ) ) ( not ( = ?auto_56921 ?auto_56908 ) ) ( not ( = ?auto_56907 ?auto_56908 ) ) ( not ( = ?auto_56923 ?auto_56908 ) ) ( not ( = ?auto_56918 ?auto_56908 ) ) ( not ( = ?auto_56924 ?auto_56922 ) ) ( not ( = ?auto_56913 ?auto_56924 ) ) ( not ( = ?auto_56915 ?auto_56924 ) ) ( not ( = ?auto_56912 ?auto_56924 ) ) ( HOIST-AT ?auto_56910 ?auto_56924 ) ( not ( = ?auto_56916 ?auto_56910 ) ) ( not ( = ?auto_56911 ?auto_56910 ) ) ( not ( = ?auto_56920 ?auto_56910 ) ) ( not ( = ?auto_56925 ?auto_56910 ) ) ( AVAILABLE ?auto_56910 ) ( SURFACE-AT ?auto_56923 ?auto_56924 ) ( ON ?auto_56923 ?auto_56914 ) ( CLEAR ?auto_56923 ) ( not ( = ?auto_56905 ?auto_56914 ) ) ( not ( = ?auto_56906 ?auto_56914 ) ) ( not ( = ?auto_56917 ?auto_56914 ) ) ( not ( = ?auto_56921 ?auto_56914 ) ) ( not ( = ?auto_56907 ?auto_56914 ) ) ( not ( = ?auto_56923 ?auto_56914 ) ) ( not ( = ?auto_56918 ?auto_56914 ) ) ( not ( = ?auto_56908 ?auto_56914 ) ) ( SURFACE-AT ?auto_56909 ?auto_56922 ) ( CLEAR ?auto_56909 ) ( IS-CRATE ?auto_56908 ) ( not ( = ?auto_56905 ?auto_56909 ) ) ( not ( = ?auto_56906 ?auto_56909 ) ) ( not ( = ?auto_56917 ?auto_56909 ) ) ( not ( = ?auto_56921 ?auto_56909 ) ) ( not ( = ?auto_56907 ?auto_56909 ) ) ( not ( = ?auto_56923 ?auto_56909 ) ) ( not ( = ?auto_56918 ?auto_56909 ) ) ( not ( = ?auto_56908 ?auto_56909 ) ) ( not ( = ?auto_56914 ?auto_56909 ) ) ( AVAILABLE ?auto_56916 ) ( IN ?auto_56908 ?auto_56919 ) ( TRUCK-AT ?auto_56919 ?auto_56926 ) ( not ( = ?auto_56926 ?auto_56922 ) ) ( not ( = ?auto_56913 ?auto_56926 ) ) ( not ( = ?auto_56915 ?auto_56926 ) ) ( not ( = ?auto_56912 ?auto_56926 ) ) ( not ( = ?auto_56924 ?auto_56926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56919 ?auto_56926 ?auto_56922 )
      ( MAKE-ON ?auto_56905 ?auto_56906 )
      ( MAKE-ON-VERIFY ?auto_56905 ?auto_56906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56927 - SURFACE
      ?auto_56928 - SURFACE
    )
    :vars
    (
      ?auto_56945 - HOIST
      ?auto_56940 - PLACE
      ?auto_56936 - PLACE
      ?auto_56942 - HOIST
      ?auto_56930 - SURFACE
      ?auto_56935 - SURFACE
      ?auto_56937 - PLACE
      ?auto_56938 - HOIST
      ?auto_56941 - SURFACE
      ?auto_56948 - SURFACE
      ?auto_56929 - PLACE
      ?auto_56947 - HOIST
      ?auto_56932 - SURFACE
      ?auto_56931 - SURFACE
      ?auto_56946 - PLACE
      ?auto_56943 - HOIST
      ?auto_56933 - SURFACE
      ?auto_56939 - SURFACE
      ?auto_56944 - TRUCK
      ?auto_56934 - PLACE
      ?auto_56949 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56945 ?auto_56940 ) ( IS-CRATE ?auto_56927 ) ( not ( = ?auto_56927 ?auto_56928 ) ) ( not ( = ?auto_56936 ?auto_56940 ) ) ( HOIST-AT ?auto_56942 ?auto_56936 ) ( not ( = ?auto_56945 ?auto_56942 ) ) ( AVAILABLE ?auto_56942 ) ( SURFACE-AT ?auto_56927 ?auto_56936 ) ( ON ?auto_56927 ?auto_56930 ) ( CLEAR ?auto_56927 ) ( not ( = ?auto_56927 ?auto_56930 ) ) ( not ( = ?auto_56928 ?auto_56930 ) ) ( IS-CRATE ?auto_56928 ) ( not ( = ?auto_56927 ?auto_56935 ) ) ( not ( = ?auto_56928 ?auto_56935 ) ) ( not ( = ?auto_56930 ?auto_56935 ) ) ( not ( = ?auto_56937 ?auto_56940 ) ) ( not ( = ?auto_56936 ?auto_56937 ) ) ( HOIST-AT ?auto_56938 ?auto_56937 ) ( not ( = ?auto_56945 ?auto_56938 ) ) ( not ( = ?auto_56942 ?auto_56938 ) ) ( AVAILABLE ?auto_56938 ) ( SURFACE-AT ?auto_56928 ?auto_56937 ) ( ON ?auto_56928 ?auto_56941 ) ( CLEAR ?auto_56928 ) ( not ( = ?auto_56927 ?auto_56941 ) ) ( not ( = ?auto_56928 ?auto_56941 ) ) ( not ( = ?auto_56930 ?auto_56941 ) ) ( not ( = ?auto_56935 ?auto_56941 ) ) ( IS-CRATE ?auto_56935 ) ( not ( = ?auto_56927 ?auto_56948 ) ) ( not ( = ?auto_56928 ?auto_56948 ) ) ( not ( = ?auto_56930 ?auto_56948 ) ) ( not ( = ?auto_56935 ?auto_56948 ) ) ( not ( = ?auto_56941 ?auto_56948 ) ) ( not ( = ?auto_56929 ?auto_56940 ) ) ( not ( = ?auto_56936 ?auto_56929 ) ) ( not ( = ?auto_56937 ?auto_56929 ) ) ( HOIST-AT ?auto_56947 ?auto_56929 ) ( not ( = ?auto_56945 ?auto_56947 ) ) ( not ( = ?auto_56942 ?auto_56947 ) ) ( not ( = ?auto_56938 ?auto_56947 ) ) ( AVAILABLE ?auto_56947 ) ( SURFACE-AT ?auto_56935 ?auto_56929 ) ( ON ?auto_56935 ?auto_56932 ) ( CLEAR ?auto_56935 ) ( not ( = ?auto_56927 ?auto_56932 ) ) ( not ( = ?auto_56928 ?auto_56932 ) ) ( not ( = ?auto_56930 ?auto_56932 ) ) ( not ( = ?auto_56935 ?auto_56932 ) ) ( not ( = ?auto_56941 ?auto_56932 ) ) ( not ( = ?auto_56948 ?auto_56932 ) ) ( IS-CRATE ?auto_56948 ) ( not ( = ?auto_56927 ?auto_56931 ) ) ( not ( = ?auto_56928 ?auto_56931 ) ) ( not ( = ?auto_56930 ?auto_56931 ) ) ( not ( = ?auto_56935 ?auto_56931 ) ) ( not ( = ?auto_56941 ?auto_56931 ) ) ( not ( = ?auto_56948 ?auto_56931 ) ) ( not ( = ?auto_56932 ?auto_56931 ) ) ( not ( = ?auto_56946 ?auto_56940 ) ) ( not ( = ?auto_56936 ?auto_56946 ) ) ( not ( = ?auto_56937 ?auto_56946 ) ) ( not ( = ?auto_56929 ?auto_56946 ) ) ( HOIST-AT ?auto_56943 ?auto_56946 ) ( not ( = ?auto_56945 ?auto_56943 ) ) ( not ( = ?auto_56942 ?auto_56943 ) ) ( not ( = ?auto_56938 ?auto_56943 ) ) ( not ( = ?auto_56947 ?auto_56943 ) ) ( AVAILABLE ?auto_56943 ) ( SURFACE-AT ?auto_56948 ?auto_56946 ) ( ON ?auto_56948 ?auto_56933 ) ( CLEAR ?auto_56948 ) ( not ( = ?auto_56927 ?auto_56933 ) ) ( not ( = ?auto_56928 ?auto_56933 ) ) ( not ( = ?auto_56930 ?auto_56933 ) ) ( not ( = ?auto_56935 ?auto_56933 ) ) ( not ( = ?auto_56941 ?auto_56933 ) ) ( not ( = ?auto_56948 ?auto_56933 ) ) ( not ( = ?auto_56932 ?auto_56933 ) ) ( not ( = ?auto_56931 ?auto_56933 ) ) ( SURFACE-AT ?auto_56939 ?auto_56940 ) ( CLEAR ?auto_56939 ) ( IS-CRATE ?auto_56931 ) ( not ( = ?auto_56927 ?auto_56939 ) ) ( not ( = ?auto_56928 ?auto_56939 ) ) ( not ( = ?auto_56930 ?auto_56939 ) ) ( not ( = ?auto_56935 ?auto_56939 ) ) ( not ( = ?auto_56941 ?auto_56939 ) ) ( not ( = ?auto_56948 ?auto_56939 ) ) ( not ( = ?auto_56932 ?auto_56939 ) ) ( not ( = ?auto_56931 ?auto_56939 ) ) ( not ( = ?auto_56933 ?auto_56939 ) ) ( AVAILABLE ?auto_56945 ) ( TRUCK-AT ?auto_56944 ?auto_56934 ) ( not ( = ?auto_56934 ?auto_56940 ) ) ( not ( = ?auto_56936 ?auto_56934 ) ) ( not ( = ?auto_56937 ?auto_56934 ) ) ( not ( = ?auto_56929 ?auto_56934 ) ) ( not ( = ?auto_56946 ?auto_56934 ) ) ( HOIST-AT ?auto_56949 ?auto_56934 ) ( LIFTING ?auto_56949 ?auto_56931 ) ( not ( = ?auto_56945 ?auto_56949 ) ) ( not ( = ?auto_56942 ?auto_56949 ) ) ( not ( = ?auto_56938 ?auto_56949 ) ) ( not ( = ?auto_56947 ?auto_56949 ) ) ( not ( = ?auto_56943 ?auto_56949 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56949 ?auto_56931 ?auto_56944 ?auto_56934 )
      ( MAKE-ON ?auto_56927 ?auto_56928 )
      ( MAKE-ON-VERIFY ?auto_56927 ?auto_56928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56950 - SURFACE
      ?auto_56951 - SURFACE
    )
    :vars
    (
      ?auto_56970 - HOIST
      ?auto_56955 - PLACE
      ?auto_56957 - PLACE
      ?auto_56958 - HOIST
      ?auto_56953 - SURFACE
      ?auto_56963 - SURFACE
      ?auto_56964 - PLACE
      ?auto_56959 - HOIST
      ?auto_56960 - SURFACE
      ?auto_56952 - SURFACE
      ?auto_56972 - PLACE
      ?auto_56966 - HOIST
      ?auto_56962 - SURFACE
      ?auto_56961 - SURFACE
      ?auto_56971 - PLACE
      ?auto_56956 - HOIST
      ?auto_56967 - SURFACE
      ?auto_56969 - SURFACE
      ?auto_56968 - TRUCK
      ?auto_56954 - PLACE
      ?auto_56965 - HOIST
      ?auto_56973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56970 ?auto_56955 ) ( IS-CRATE ?auto_56950 ) ( not ( = ?auto_56950 ?auto_56951 ) ) ( not ( = ?auto_56957 ?auto_56955 ) ) ( HOIST-AT ?auto_56958 ?auto_56957 ) ( not ( = ?auto_56970 ?auto_56958 ) ) ( AVAILABLE ?auto_56958 ) ( SURFACE-AT ?auto_56950 ?auto_56957 ) ( ON ?auto_56950 ?auto_56953 ) ( CLEAR ?auto_56950 ) ( not ( = ?auto_56950 ?auto_56953 ) ) ( not ( = ?auto_56951 ?auto_56953 ) ) ( IS-CRATE ?auto_56951 ) ( not ( = ?auto_56950 ?auto_56963 ) ) ( not ( = ?auto_56951 ?auto_56963 ) ) ( not ( = ?auto_56953 ?auto_56963 ) ) ( not ( = ?auto_56964 ?auto_56955 ) ) ( not ( = ?auto_56957 ?auto_56964 ) ) ( HOIST-AT ?auto_56959 ?auto_56964 ) ( not ( = ?auto_56970 ?auto_56959 ) ) ( not ( = ?auto_56958 ?auto_56959 ) ) ( AVAILABLE ?auto_56959 ) ( SURFACE-AT ?auto_56951 ?auto_56964 ) ( ON ?auto_56951 ?auto_56960 ) ( CLEAR ?auto_56951 ) ( not ( = ?auto_56950 ?auto_56960 ) ) ( not ( = ?auto_56951 ?auto_56960 ) ) ( not ( = ?auto_56953 ?auto_56960 ) ) ( not ( = ?auto_56963 ?auto_56960 ) ) ( IS-CRATE ?auto_56963 ) ( not ( = ?auto_56950 ?auto_56952 ) ) ( not ( = ?auto_56951 ?auto_56952 ) ) ( not ( = ?auto_56953 ?auto_56952 ) ) ( not ( = ?auto_56963 ?auto_56952 ) ) ( not ( = ?auto_56960 ?auto_56952 ) ) ( not ( = ?auto_56972 ?auto_56955 ) ) ( not ( = ?auto_56957 ?auto_56972 ) ) ( not ( = ?auto_56964 ?auto_56972 ) ) ( HOIST-AT ?auto_56966 ?auto_56972 ) ( not ( = ?auto_56970 ?auto_56966 ) ) ( not ( = ?auto_56958 ?auto_56966 ) ) ( not ( = ?auto_56959 ?auto_56966 ) ) ( AVAILABLE ?auto_56966 ) ( SURFACE-AT ?auto_56963 ?auto_56972 ) ( ON ?auto_56963 ?auto_56962 ) ( CLEAR ?auto_56963 ) ( not ( = ?auto_56950 ?auto_56962 ) ) ( not ( = ?auto_56951 ?auto_56962 ) ) ( not ( = ?auto_56953 ?auto_56962 ) ) ( not ( = ?auto_56963 ?auto_56962 ) ) ( not ( = ?auto_56960 ?auto_56962 ) ) ( not ( = ?auto_56952 ?auto_56962 ) ) ( IS-CRATE ?auto_56952 ) ( not ( = ?auto_56950 ?auto_56961 ) ) ( not ( = ?auto_56951 ?auto_56961 ) ) ( not ( = ?auto_56953 ?auto_56961 ) ) ( not ( = ?auto_56963 ?auto_56961 ) ) ( not ( = ?auto_56960 ?auto_56961 ) ) ( not ( = ?auto_56952 ?auto_56961 ) ) ( not ( = ?auto_56962 ?auto_56961 ) ) ( not ( = ?auto_56971 ?auto_56955 ) ) ( not ( = ?auto_56957 ?auto_56971 ) ) ( not ( = ?auto_56964 ?auto_56971 ) ) ( not ( = ?auto_56972 ?auto_56971 ) ) ( HOIST-AT ?auto_56956 ?auto_56971 ) ( not ( = ?auto_56970 ?auto_56956 ) ) ( not ( = ?auto_56958 ?auto_56956 ) ) ( not ( = ?auto_56959 ?auto_56956 ) ) ( not ( = ?auto_56966 ?auto_56956 ) ) ( AVAILABLE ?auto_56956 ) ( SURFACE-AT ?auto_56952 ?auto_56971 ) ( ON ?auto_56952 ?auto_56967 ) ( CLEAR ?auto_56952 ) ( not ( = ?auto_56950 ?auto_56967 ) ) ( not ( = ?auto_56951 ?auto_56967 ) ) ( not ( = ?auto_56953 ?auto_56967 ) ) ( not ( = ?auto_56963 ?auto_56967 ) ) ( not ( = ?auto_56960 ?auto_56967 ) ) ( not ( = ?auto_56952 ?auto_56967 ) ) ( not ( = ?auto_56962 ?auto_56967 ) ) ( not ( = ?auto_56961 ?auto_56967 ) ) ( SURFACE-AT ?auto_56969 ?auto_56955 ) ( CLEAR ?auto_56969 ) ( IS-CRATE ?auto_56961 ) ( not ( = ?auto_56950 ?auto_56969 ) ) ( not ( = ?auto_56951 ?auto_56969 ) ) ( not ( = ?auto_56953 ?auto_56969 ) ) ( not ( = ?auto_56963 ?auto_56969 ) ) ( not ( = ?auto_56960 ?auto_56969 ) ) ( not ( = ?auto_56952 ?auto_56969 ) ) ( not ( = ?auto_56962 ?auto_56969 ) ) ( not ( = ?auto_56961 ?auto_56969 ) ) ( not ( = ?auto_56967 ?auto_56969 ) ) ( AVAILABLE ?auto_56970 ) ( TRUCK-AT ?auto_56968 ?auto_56954 ) ( not ( = ?auto_56954 ?auto_56955 ) ) ( not ( = ?auto_56957 ?auto_56954 ) ) ( not ( = ?auto_56964 ?auto_56954 ) ) ( not ( = ?auto_56972 ?auto_56954 ) ) ( not ( = ?auto_56971 ?auto_56954 ) ) ( HOIST-AT ?auto_56965 ?auto_56954 ) ( not ( = ?auto_56970 ?auto_56965 ) ) ( not ( = ?auto_56958 ?auto_56965 ) ) ( not ( = ?auto_56959 ?auto_56965 ) ) ( not ( = ?auto_56966 ?auto_56965 ) ) ( not ( = ?auto_56956 ?auto_56965 ) ) ( AVAILABLE ?auto_56965 ) ( SURFACE-AT ?auto_56961 ?auto_56954 ) ( ON ?auto_56961 ?auto_56973 ) ( CLEAR ?auto_56961 ) ( not ( = ?auto_56950 ?auto_56973 ) ) ( not ( = ?auto_56951 ?auto_56973 ) ) ( not ( = ?auto_56953 ?auto_56973 ) ) ( not ( = ?auto_56963 ?auto_56973 ) ) ( not ( = ?auto_56960 ?auto_56973 ) ) ( not ( = ?auto_56952 ?auto_56973 ) ) ( not ( = ?auto_56962 ?auto_56973 ) ) ( not ( = ?auto_56961 ?auto_56973 ) ) ( not ( = ?auto_56967 ?auto_56973 ) ) ( not ( = ?auto_56969 ?auto_56973 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56965 ?auto_56961 ?auto_56973 ?auto_56954 )
      ( MAKE-ON ?auto_56950 ?auto_56951 )
      ( MAKE-ON-VERIFY ?auto_56950 ?auto_56951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56974 - SURFACE
      ?auto_56975 - SURFACE
    )
    :vars
    (
      ?auto_56989 - HOIST
      ?auto_56991 - PLACE
      ?auto_56978 - PLACE
      ?auto_56986 - HOIST
      ?auto_56977 - SURFACE
      ?auto_56976 - SURFACE
      ?auto_56993 - PLACE
      ?auto_56980 - HOIST
      ?auto_56994 - SURFACE
      ?auto_56995 - SURFACE
      ?auto_56984 - PLACE
      ?auto_56979 - HOIST
      ?auto_56981 - SURFACE
      ?auto_56992 - SURFACE
      ?auto_56983 - PLACE
      ?auto_56985 - HOIST
      ?auto_56987 - SURFACE
      ?auto_56988 - SURFACE
      ?auto_56990 - PLACE
      ?auto_56982 - HOIST
      ?auto_56996 - SURFACE
      ?auto_56997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56989 ?auto_56991 ) ( IS-CRATE ?auto_56974 ) ( not ( = ?auto_56974 ?auto_56975 ) ) ( not ( = ?auto_56978 ?auto_56991 ) ) ( HOIST-AT ?auto_56986 ?auto_56978 ) ( not ( = ?auto_56989 ?auto_56986 ) ) ( AVAILABLE ?auto_56986 ) ( SURFACE-AT ?auto_56974 ?auto_56978 ) ( ON ?auto_56974 ?auto_56977 ) ( CLEAR ?auto_56974 ) ( not ( = ?auto_56974 ?auto_56977 ) ) ( not ( = ?auto_56975 ?auto_56977 ) ) ( IS-CRATE ?auto_56975 ) ( not ( = ?auto_56974 ?auto_56976 ) ) ( not ( = ?auto_56975 ?auto_56976 ) ) ( not ( = ?auto_56977 ?auto_56976 ) ) ( not ( = ?auto_56993 ?auto_56991 ) ) ( not ( = ?auto_56978 ?auto_56993 ) ) ( HOIST-AT ?auto_56980 ?auto_56993 ) ( not ( = ?auto_56989 ?auto_56980 ) ) ( not ( = ?auto_56986 ?auto_56980 ) ) ( AVAILABLE ?auto_56980 ) ( SURFACE-AT ?auto_56975 ?auto_56993 ) ( ON ?auto_56975 ?auto_56994 ) ( CLEAR ?auto_56975 ) ( not ( = ?auto_56974 ?auto_56994 ) ) ( not ( = ?auto_56975 ?auto_56994 ) ) ( not ( = ?auto_56977 ?auto_56994 ) ) ( not ( = ?auto_56976 ?auto_56994 ) ) ( IS-CRATE ?auto_56976 ) ( not ( = ?auto_56974 ?auto_56995 ) ) ( not ( = ?auto_56975 ?auto_56995 ) ) ( not ( = ?auto_56977 ?auto_56995 ) ) ( not ( = ?auto_56976 ?auto_56995 ) ) ( not ( = ?auto_56994 ?auto_56995 ) ) ( not ( = ?auto_56984 ?auto_56991 ) ) ( not ( = ?auto_56978 ?auto_56984 ) ) ( not ( = ?auto_56993 ?auto_56984 ) ) ( HOIST-AT ?auto_56979 ?auto_56984 ) ( not ( = ?auto_56989 ?auto_56979 ) ) ( not ( = ?auto_56986 ?auto_56979 ) ) ( not ( = ?auto_56980 ?auto_56979 ) ) ( AVAILABLE ?auto_56979 ) ( SURFACE-AT ?auto_56976 ?auto_56984 ) ( ON ?auto_56976 ?auto_56981 ) ( CLEAR ?auto_56976 ) ( not ( = ?auto_56974 ?auto_56981 ) ) ( not ( = ?auto_56975 ?auto_56981 ) ) ( not ( = ?auto_56977 ?auto_56981 ) ) ( not ( = ?auto_56976 ?auto_56981 ) ) ( not ( = ?auto_56994 ?auto_56981 ) ) ( not ( = ?auto_56995 ?auto_56981 ) ) ( IS-CRATE ?auto_56995 ) ( not ( = ?auto_56974 ?auto_56992 ) ) ( not ( = ?auto_56975 ?auto_56992 ) ) ( not ( = ?auto_56977 ?auto_56992 ) ) ( not ( = ?auto_56976 ?auto_56992 ) ) ( not ( = ?auto_56994 ?auto_56992 ) ) ( not ( = ?auto_56995 ?auto_56992 ) ) ( not ( = ?auto_56981 ?auto_56992 ) ) ( not ( = ?auto_56983 ?auto_56991 ) ) ( not ( = ?auto_56978 ?auto_56983 ) ) ( not ( = ?auto_56993 ?auto_56983 ) ) ( not ( = ?auto_56984 ?auto_56983 ) ) ( HOIST-AT ?auto_56985 ?auto_56983 ) ( not ( = ?auto_56989 ?auto_56985 ) ) ( not ( = ?auto_56986 ?auto_56985 ) ) ( not ( = ?auto_56980 ?auto_56985 ) ) ( not ( = ?auto_56979 ?auto_56985 ) ) ( AVAILABLE ?auto_56985 ) ( SURFACE-AT ?auto_56995 ?auto_56983 ) ( ON ?auto_56995 ?auto_56987 ) ( CLEAR ?auto_56995 ) ( not ( = ?auto_56974 ?auto_56987 ) ) ( not ( = ?auto_56975 ?auto_56987 ) ) ( not ( = ?auto_56977 ?auto_56987 ) ) ( not ( = ?auto_56976 ?auto_56987 ) ) ( not ( = ?auto_56994 ?auto_56987 ) ) ( not ( = ?auto_56995 ?auto_56987 ) ) ( not ( = ?auto_56981 ?auto_56987 ) ) ( not ( = ?auto_56992 ?auto_56987 ) ) ( SURFACE-AT ?auto_56988 ?auto_56991 ) ( CLEAR ?auto_56988 ) ( IS-CRATE ?auto_56992 ) ( not ( = ?auto_56974 ?auto_56988 ) ) ( not ( = ?auto_56975 ?auto_56988 ) ) ( not ( = ?auto_56977 ?auto_56988 ) ) ( not ( = ?auto_56976 ?auto_56988 ) ) ( not ( = ?auto_56994 ?auto_56988 ) ) ( not ( = ?auto_56995 ?auto_56988 ) ) ( not ( = ?auto_56981 ?auto_56988 ) ) ( not ( = ?auto_56992 ?auto_56988 ) ) ( not ( = ?auto_56987 ?auto_56988 ) ) ( AVAILABLE ?auto_56989 ) ( not ( = ?auto_56990 ?auto_56991 ) ) ( not ( = ?auto_56978 ?auto_56990 ) ) ( not ( = ?auto_56993 ?auto_56990 ) ) ( not ( = ?auto_56984 ?auto_56990 ) ) ( not ( = ?auto_56983 ?auto_56990 ) ) ( HOIST-AT ?auto_56982 ?auto_56990 ) ( not ( = ?auto_56989 ?auto_56982 ) ) ( not ( = ?auto_56986 ?auto_56982 ) ) ( not ( = ?auto_56980 ?auto_56982 ) ) ( not ( = ?auto_56979 ?auto_56982 ) ) ( not ( = ?auto_56985 ?auto_56982 ) ) ( AVAILABLE ?auto_56982 ) ( SURFACE-AT ?auto_56992 ?auto_56990 ) ( ON ?auto_56992 ?auto_56996 ) ( CLEAR ?auto_56992 ) ( not ( = ?auto_56974 ?auto_56996 ) ) ( not ( = ?auto_56975 ?auto_56996 ) ) ( not ( = ?auto_56977 ?auto_56996 ) ) ( not ( = ?auto_56976 ?auto_56996 ) ) ( not ( = ?auto_56994 ?auto_56996 ) ) ( not ( = ?auto_56995 ?auto_56996 ) ) ( not ( = ?auto_56981 ?auto_56996 ) ) ( not ( = ?auto_56992 ?auto_56996 ) ) ( not ( = ?auto_56987 ?auto_56996 ) ) ( not ( = ?auto_56988 ?auto_56996 ) ) ( TRUCK-AT ?auto_56997 ?auto_56991 ) )
    :subtasks
    ( ( !DRIVE ?auto_56997 ?auto_56991 ?auto_56990 )
      ( MAKE-ON ?auto_56974 ?auto_56975 )
      ( MAKE-ON-VERIFY ?auto_56974 ?auto_56975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56998 - SURFACE
      ?auto_56999 - SURFACE
    )
    :vars
    (
      ?auto_57010 - HOIST
      ?auto_57012 - PLACE
      ?auto_57014 - PLACE
      ?auto_57011 - HOIST
      ?auto_57020 - SURFACE
      ?auto_57018 - SURFACE
      ?auto_57000 - PLACE
      ?auto_57017 - HOIST
      ?auto_57004 - SURFACE
      ?auto_57003 - SURFACE
      ?auto_57013 - PLACE
      ?auto_57009 - HOIST
      ?auto_57007 - SURFACE
      ?auto_57021 - SURFACE
      ?auto_57019 - PLACE
      ?auto_57016 - HOIST
      ?auto_57002 - SURFACE
      ?auto_57008 - SURFACE
      ?auto_57015 - PLACE
      ?auto_57001 - HOIST
      ?auto_57005 - SURFACE
      ?auto_57006 - TRUCK
      ?auto_57022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57010 ?auto_57012 ) ( IS-CRATE ?auto_56998 ) ( not ( = ?auto_56998 ?auto_56999 ) ) ( not ( = ?auto_57014 ?auto_57012 ) ) ( HOIST-AT ?auto_57011 ?auto_57014 ) ( not ( = ?auto_57010 ?auto_57011 ) ) ( AVAILABLE ?auto_57011 ) ( SURFACE-AT ?auto_56998 ?auto_57014 ) ( ON ?auto_56998 ?auto_57020 ) ( CLEAR ?auto_56998 ) ( not ( = ?auto_56998 ?auto_57020 ) ) ( not ( = ?auto_56999 ?auto_57020 ) ) ( IS-CRATE ?auto_56999 ) ( not ( = ?auto_56998 ?auto_57018 ) ) ( not ( = ?auto_56999 ?auto_57018 ) ) ( not ( = ?auto_57020 ?auto_57018 ) ) ( not ( = ?auto_57000 ?auto_57012 ) ) ( not ( = ?auto_57014 ?auto_57000 ) ) ( HOIST-AT ?auto_57017 ?auto_57000 ) ( not ( = ?auto_57010 ?auto_57017 ) ) ( not ( = ?auto_57011 ?auto_57017 ) ) ( AVAILABLE ?auto_57017 ) ( SURFACE-AT ?auto_56999 ?auto_57000 ) ( ON ?auto_56999 ?auto_57004 ) ( CLEAR ?auto_56999 ) ( not ( = ?auto_56998 ?auto_57004 ) ) ( not ( = ?auto_56999 ?auto_57004 ) ) ( not ( = ?auto_57020 ?auto_57004 ) ) ( not ( = ?auto_57018 ?auto_57004 ) ) ( IS-CRATE ?auto_57018 ) ( not ( = ?auto_56998 ?auto_57003 ) ) ( not ( = ?auto_56999 ?auto_57003 ) ) ( not ( = ?auto_57020 ?auto_57003 ) ) ( not ( = ?auto_57018 ?auto_57003 ) ) ( not ( = ?auto_57004 ?auto_57003 ) ) ( not ( = ?auto_57013 ?auto_57012 ) ) ( not ( = ?auto_57014 ?auto_57013 ) ) ( not ( = ?auto_57000 ?auto_57013 ) ) ( HOIST-AT ?auto_57009 ?auto_57013 ) ( not ( = ?auto_57010 ?auto_57009 ) ) ( not ( = ?auto_57011 ?auto_57009 ) ) ( not ( = ?auto_57017 ?auto_57009 ) ) ( AVAILABLE ?auto_57009 ) ( SURFACE-AT ?auto_57018 ?auto_57013 ) ( ON ?auto_57018 ?auto_57007 ) ( CLEAR ?auto_57018 ) ( not ( = ?auto_56998 ?auto_57007 ) ) ( not ( = ?auto_56999 ?auto_57007 ) ) ( not ( = ?auto_57020 ?auto_57007 ) ) ( not ( = ?auto_57018 ?auto_57007 ) ) ( not ( = ?auto_57004 ?auto_57007 ) ) ( not ( = ?auto_57003 ?auto_57007 ) ) ( IS-CRATE ?auto_57003 ) ( not ( = ?auto_56998 ?auto_57021 ) ) ( not ( = ?auto_56999 ?auto_57021 ) ) ( not ( = ?auto_57020 ?auto_57021 ) ) ( not ( = ?auto_57018 ?auto_57021 ) ) ( not ( = ?auto_57004 ?auto_57021 ) ) ( not ( = ?auto_57003 ?auto_57021 ) ) ( not ( = ?auto_57007 ?auto_57021 ) ) ( not ( = ?auto_57019 ?auto_57012 ) ) ( not ( = ?auto_57014 ?auto_57019 ) ) ( not ( = ?auto_57000 ?auto_57019 ) ) ( not ( = ?auto_57013 ?auto_57019 ) ) ( HOIST-AT ?auto_57016 ?auto_57019 ) ( not ( = ?auto_57010 ?auto_57016 ) ) ( not ( = ?auto_57011 ?auto_57016 ) ) ( not ( = ?auto_57017 ?auto_57016 ) ) ( not ( = ?auto_57009 ?auto_57016 ) ) ( AVAILABLE ?auto_57016 ) ( SURFACE-AT ?auto_57003 ?auto_57019 ) ( ON ?auto_57003 ?auto_57002 ) ( CLEAR ?auto_57003 ) ( not ( = ?auto_56998 ?auto_57002 ) ) ( not ( = ?auto_56999 ?auto_57002 ) ) ( not ( = ?auto_57020 ?auto_57002 ) ) ( not ( = ?auto_57018 ?auto_57002 ) ) ( not ( = ?auto_57004 ?auto_57002 ) ) ( not ( = ?auto_57003 ?auto_57002 ) ) ( not ( = ?auto_57007 ?auto_57002 ) ) ( not ( = ?auto_57021 ?auto_57002 ) ) ( IS-CRATE ?auto_57021 ) ( not ( = ?auto_56998 ?auto_57008 ) ) ( not ( = ?auto_56999 ?auto_57008 ) ) ( not ( = ?auto_57020 ?auto_57008 ) ) ( not ( = ?auto_57018 ?auto_57008 ) ) ( not ( = ?auto_57004 ?auto_57008 ) ) ( not ( = ?auto_57003 ?auto_57008 ) ) ( not ( = ?auto_57007 ?auto_57008 ) ) ( not ( = ?auto_57021 ?auto_57008 ) ) ( not ( = ?auto_57002 ?auto_57008 ) ) ( not ( = ?auto_57015 ?auto_57012 ) ) ( not ( = ?auto_57014 ?auto_57015 ) ) ( not ( = ?auto_57000 ?auto_57015 ) ) ( not ( = ?auto_57013 ?auto_57015 ) ) ( not ( = ?auto_57019 ?auto_57015 ) ) ( HOIST-AT ?auto_57001 ?auto_57015 ) ( not ( = ?auto_57010 ?auto_57001 ) ) ( not ( = ?auto_57011 ?auto_57001 ) ) ( not ( = ?auto_57017 ?auto_57001 ) ) ( not ( = ?auto_57009 ?auto_57001 ) ) ( not ( = ?auto_57016 ?auto_57001 ) ) ( AVAILABLE ?auto_57001 ) ( SURFACE-AT ?auto_57021 ?auto_57015 ) ( ON ?auto_57021 ?auto_57005 ) ( CLEAR ?auto_57021 ) ( not ( = ?auto_56998 ?auto_57005 ) ) ( not ( = ?auto_56999 ?auto_57005 ) ) ( not ( = ?auto_57020 ?auto_57005 ) ) ( not ( = ?auto_57018 ?auto_57005 ) ) ( not ( = ?auto_57004 ?auto_57005 ) ) ( not ( = ?auto_57003 ?auto_57005 ) ) ( not ( = ?auto_57007 ?auto_57005 ) ) ( not ( = ?auto_57021 ?auto_57005 ) ) ( not ( = ?auto_57002 ?auto_57005 ) ) ( not ( = ?auto_57008 ?auto_57005 ) ) ( TRUCK-AT ?auto_57006 ?auto_57012 ) ( SURFACE-AT ?auto_57022 ?auto_57012 ) ( CLEAR ?auto_57022 ) ( LIFTING ?auto_57010 ?auto_57008 ) ( IS-CRATE ?auto_57008 ) ( not ( = ?auto_56998 ?auto_57022 ) ) ( not ( = ?auto_56999 ?auto_57022 ) ) ( not ( = ?auto_57020 ?auto_57022 ) ) ( not ( = ?auto_57018 ?auto_57022 ) ) ( not ( = ?auto_57004 ?auto_57022 ) ) ( not ( = ?auto_57003 ?auto_57022 ) ) ( not ( = ?auto_57007 ?auto_57022 ) ) ( not ( = ?auto_57021 ?auto_57022 ) ) ( not ( = ?auto_57002 ?auto_57022 ) ) ( not ( = ?auto_57008 ?auto_57022 ) ) ( not ( = ?auto_57005 ?auto_57022 ) ) )
    :subtasks
    ( ( !DROP ?auto_57010 ?auto_57008 ?auto_57022 ?auto_57012 )
      ( MAKE-ON ?auto_56998 ?auto_56999 )
      ( MAKE-ON-VERIFY ?auto_56998 ?auto_56999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57023 - SURFACE
      ?auto_57024 - SURFACE
    )
    :vars
    (
      ?auto_57039 - HOIST
      ?auto_57027 - PLACE
      ?auto_57047 - PLACE
      ?auto_57035 - HOIST
      ?auto_57032 - SURFACE
      ?auto_57043 - SURFACE
      ?auto_57034 - PLACE
      ?auto_57042 - HOIST
      ?auto_57046 - SURFACE
      ?auto_57044 - SURFACE
      ?auto_57038 - PLACE
      ?auto_57040 - HOIST
      ?auto_57041 - SURFACE
      ?auto_57036 - SURFACE
      ?auto_57031 - PLACE
      ?auto_57037 - HOIST
      ?auto_57026 - SURFACE
      ?auto_57025 - SURFACE
      ?auto_57033 - PLACE
      ?auto_57045 - HOIST
      ?auto_57028 - SURFACE
      ?auto_57029 - TRUCK
      ?auto_57030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57039 ?auto_57027 ) ( IS-CRATE ?auto_57023 ) ( not ( = ?auto_57023 ?auto_57024 ) ) ( not ( = ?auto_57047 ?auto_57027 ) ) ( HOIST-AT ?auto_57035 ?auto_57047 ) ( not ( = ?auto_57039 ?auto_57035 ) ) ( AVAILABLE ?auto_57035 ) ( SURFACE-AT ?auto_57023 ?auto_57047 ) ( ON ?auto_57023 ?auto_57032 ) ( CLEAR ?auto_57023 ) ( not ( = ?auto_57023 ?auto_57032 ) ) ( not ( = ?auto_57024 ?auto_57032 ) ) ( IS-CRATE ?auto_57024 ) ( not ( = ?auto_57023 ?auto_57043 ) ) ( not ( = ?auto_57024 ?auto_57043 ) ) ( not ( = ?auto_57032 ?auto_57043 ) ) ( not ( = ?auto_57034 ?auto_57027 ) ) ( not ( = ?auto_57047 ?auto_57034 ) ) ( HOIST-AT ?auto_57042 ?auto_57034 ) ( not ( = ?auto_57039 ?auto_57042 ) ) ( not ( = ?auto_57035 ?auto_57042 ) ) ( AVAILABLE ?auto_57042 ) ( SURFACE-AT ?auto_57024 ?auto_57034 ) ( ON ?auto_57024 ?auto_57046 ) ( CLEAR ?auto_57024 ) ( not ( = ?auto_57023 ?auto_57046 ) ) ( not ( = ?auto_57024 ?auto_57046 ) ) ( not ( = ?auto_57032 ?auto_57046 ) ) ( not ( = ?auto_57043 ?auto_57046 ) ) ( IS-CRATE ?auto_57043 ) ( not ( = ?auto_57023 ?auto_57044 ) ) ( not ( = ?auto_57024 ?auto_57044 ) ) ( not ( = ?auto_57032 ?auto_57044 ) ) ( not ( = ?auto_57043 ?auto_57044 ) ) ( not ( = ?auto_57046 ?auto_57044 ) ) ( not ( = ?auto_57038 ?auto_57027 ) ) ( not ( = ?auto_57047 ?auto_57038 ) ) ( not ( = ?auto_57034 ?auto_57038 ) ) ( HOIST-AT ?auto_57040 ?auto_57038 ) ( not ( = ?auto_57039 ?auto_57040 ) ) ( not ( = ?auto_57035 ?auto_57040 ) ) ( not ( = ?auto_57042 ?auto_57040 ) ) ( AVAILABLE ?auto_57040 ) ( SURFACE-AT ?auto_57043 ?auto_57038 ) ( ON ?auto_57043 ?auto_57041 ) ( CLEAR ?auto_57043 ) ( not ( = ?auto_57023 ?auto_57041 ) ) ( not ( = ?auto_57024 ?auto_57041 ) ) ( not ( = ?auto_57032 ?auto_57041 ) ) ( not ( = ?auto_57043 ?auto_57041 ) ) ( not ( = ?auto_57046 ?auto_57041 ) ) ( not ( = ?auto_57044 ?auto_57041 ) ) ( IS-CRATE ?auto_57044 ) ( not ( = ?auto_57023 ?auto_57036 ) ) ( not ( = ?auto_57024 ?auto_57036 ) ) ( not ( = ?auto_57032 ?auto_57036 ) ) ( not ( = ?auto_57043 ?auto_57036 ) ) ( not ( = ?auto_57046 ?auto_57036 ) ) ( not ( = ?auto_57044 ?auto_57036 ) ) ( not ( = ?auto_57041 ?auto_57036 ) ) ( not ( = ?auto_57031 ?auto_57027 ) ) ( not ( = ?auto_57047 ?auto_57031 ) ) ( not ( = ?auto_57034 ?auto_57031 ) ) ( not ( = ?auto_57038 ?auto_57031 ) ) ( HOIST-AT ?auto_57037 ?auto_57031 ) ( not ( = ?auto_57039 ?auto_57037 ) ) ( not ( = ?auto_57035 ?auto_57037 ) ) ( not ( = ?auto_57042 ?auto_57037 ) ) ( not ( = ?auto_57040 ?auto_57037 ) ) ( AVAILABLE ?auto_57037 ) ( SURFACE-AT ?auto_57044 ?auto_57031 ) ( ON ?auto_57044 ?auto_57026 ) ( CLEAR ?auto_57044 ) ( not ( = ?auto_57023 ?auto_57026 ) ) ( not ( = ?auto_57024 ?auto_57026 ) ) ( not ( = ?auto_57032 ?auto_57026 ) ) ( not ( = ?auto_57043 ?auto_57026 ) ) ( not ( = ?auto_57046 ?auto_57026 ) ) ( not ( = ?auto_57044 ?auto_57026 ) ) ( not ( = ?auto_57041 ?auto_57026 ) ) ( not ( = ?auto_57036 ?auto_57026 ) ) ( IS-CRATE ?auto_57036 ) ( not ( = ?auto_57023 ?auto_57025 ) ) ( not ( = ?auto_57024 ?auto_57025 ) ) ( not ( = ?auto_57032 ?auto_57025 ) ) ( not ( = ?auto_57043 ?auto_57025 ) ) ( not ( = ?auto_57046 ?auto_57025 ) ) ( not ( = ?auto_57044 ?auto_57025 ) ) ( not ( = ?auto_57041 ?auto_57025 ) ) ( not ( = ?auto_57036 ?auto_57025 ) ) ( not ( = ?auto_57026 ?auto_57025 ) ) ( not ( = ?auto_57033 ?auto_57027 ) ) ( not ( = ?auto_57047 ?auto_57033 ) ) ( not ( = ?auto_57034 ?auto_57033 ) ) ( not ( = ?auto_57038 ?auto_57033 ) ) ( not ( = ?auto_57031 ?auto_57033 ) ) ( HOIST-AT ?auto_57045 ?auto_57033 ) ( not ( = ?auto_57039 ?auto_57045 ) ) ( not ( = ?auto_57035 ?auto_57045 ) ) ( not ( = ?auto_57042 ?auto_57045 ) ) ( not ( = ?auto_57040 ?auto_57045 ) ) ( not ( = ?auto_57037 ?auto_57045 ) ) ( AVAILABLE ?auto_57045 ) ( SURFACE-AT ?auto_57036 ?auto_57033 ) ( ON ?auto_57036 ?auto_57028 ) ( CLEAR ?auto_57036 ) ( not ( = ?auto_57023 ?auto_57028 ) ) ( not ( = ?auto_57024 ?auto_57028 ) ) ( not ( = ?auto_57032 ?auto_57028 ) ) ( not ( = ?auto_57043 ?auto_57028 ) ) ( not ( = ?auto_57046 ?auto_57028 ) ) ( not ( = ?auto_57044 ?auto_57028 ) ) ( not ( = ?auto_57041 ?auto_57028 ) ) ( not ( = ?auto_57036 ?auto_57028 ) ) ( not ( = ?auto_57026 ?auto_57028 ) ) ( not ( = ?auto_57025 ?auto_57028 ) ) ( TRUCK-AT ?auto_57029 ?auto_57027 ) ( SURFACE-AT ?auto_57030 ?auto_57027 ) ( CLEAR ?auto_57030 ) ( IS-CRATE ?auto_57025 ) ( not ( = ?auto_57023 ?auto_57030 ) ) ( not ( = ?auto_57024 ?auto_57030 ) ) ( not ( = ?auto_57032 ?auto_57030 ) ) ( not ( = ?auto_57043 ?auto_57030 ) ) ( not ( = ?auto_57046 ?auto_57030 ) ) ( not ( = ?auto_57044 ?auto_57030 ) ) ( not ( = ?auto_57041 ?auto_57030 ) ) ( not ( = ?auto_57036 ?auto_57030 ) ) ( not ( = ?auto_57026 ?auto_57030 ) ) ( not ( = ?auto_57025 ?auto_57030 ) ) ( not ( = ?auto_57028 ?auto_57030 ) ) ( AVAILABLE ?auto_57039 ) ( IN ?auto_57025 ?auto_57029 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57039 ?auto_57025 ?auto_57029 ?auto_57027 )
      ( MAKE-ON ?auto_57023 ?auto_57024 )
      ( MAKE-ON-VERIFY ?auto_57023 ?auto_57024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57048 - SURFACE
      ?auto_57049 - SURFACE
    )
    :vars
    (
      ?auto_57069 - HOIST
      ?auto_57054 - PLACE
      ?auto_57066 - PLACE
      ?auto_57058 - HOIST
      ?auto_57067 - SURFACE
      ?auto_57062 - SURFACE
      ?auto_57052 - PLACE
      ?auto_57061 - HOIST
      ?auto_57065 - SURFACE
      ?auto_57063 - SURFACE
      ?auto_57059 - PLACE
      ?auto_57050 - HOIST
      ?auto_57051 - SURFACE
      ?auto_57070 - SURFACE
      ?auto_57056 - PLACE
      ?auto_57068 - HOIST
      ?auto_57055 - SURFACE
      ?auto_57071 - SURFACE
      ?auto_57057 - PLACE
      ?auto_57064 - HOIST
      ?auto_57072 - SURFACE
      ?auto_57053 - SURFACE
      ?auto_57060 - TRUCK
      ?auto_57073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57069 ?auto_57054 ) ( IS-CRATE ?auto_57048 ) ( not ( = ?auto_57048 ?auto_57049 ) ) ( not ( = ?auto_57066 ?auto_57054 ) ) ( HOIST-AT ?auto_57058 ?auto_57066 ) ( not ( = ?auto_57069 ?auto_57058 ) ) ( AVAILABLE ?auto_57058 ) ( SURFACE-AT ?auto_57048 ?auto_57066 ) ( ON ?auto_57048 ?auto_57067 ) ( CLEAR ?auto_57048 ) ( not ( = ?auto_57048 ?auto_57067 ) ) ( not ( = ?auto_57049 ?auto_57067 ) ) ( IS-CRATE ?auto_57049 ) ( not ( = ?auto_57048 ?auto_57062 ) ) ( not ( = ?auto_57049 ?auto_57062 ) ) ( not ( = ?auto_57067 ?auto_57062 ) ) ( not ( = ?auto_57052 ?auto_57054 ) ) ( not ( = ?auto_57066 ?auto_57052 ) ) ( HOIST-AT ?auto_57061 ?auto_57052 ) ( not ( = ?auto_57069 ?auto_57061 ) ) ( not ( = ?auto_57058 ?auto_57061 ) ) ( AVAILABLE ?auto_57061 ) ( SURFACE-AT ?auto_57049 ?auto_57052 ) ( ON ?auto_57049 ?auto_57065 ) ( CLEAR ?auto_57049 ) ( not ( = ?auto_57048 ?auto_57065 ) ) ( not ( = ?auto_57049 ?auto_57065 ) ) ( not ( = ?auto_57067 ?auto_57065 ) ) ( not ( = ?auto_57062 ?auto_57065 ) ) ( IS-CRATE ?auto_57062 ) ( not ( = ?auto_57048 ?auto_57063 ) ) ( not ( = ?auto_57049 ?auto_57063 ) ) ( not ( = ?auto_57067 ?auto_57063 ) ) ( not ( = ?auto_57062 ?auto_57063 ) ) ( not ( = ?auto_57065 ?auto_57063 ) ) ( not ( = ?auto_57059 ?auto_57054 ) ) ( not ( = ?auto_57066 ?auto_57059 ) ) ( not ( = ?auto_57052 ?auto_57059 ) ) ( HOIST-AT ?auto_57050 ?auto_57059 ) ( not ( = ?auto_57069 ?auto_57050 ) ) ( not ( = ?auto_57058 ?auto_57050 ) ) ( not ( = ?auto_57061 ?auto_57050 ) ) ( AVAILABLE ?auto_57050 ) ( SURFACE-AT ?auto_57062 ?auto_57059 ) ( ON ?auto_57062 ?auto_57051 ) ( CLEAR ?auto_57062 ) ( not ( = ?auto_57048 ?auto_57051 ) ) ( not ( = ?auto_57049 ?auto_57051 ) ) ( not ( = ?auto_57067 ?auto_57051 ) ) ( not ( = ?auto_57062 ?auto_57051 ) ) ( not ( = ?auto_57065 ?auto_57051 ) ) ( not ( = ?auto_57063 ?auto_57051 ) ) ( IS-CRATE ?auto_57063 ) ( not ( = ?auto_57048 ?auto_57070 ) ) ( not ( = ?auto_57049 ?auto_57070 ) ) ( not ( = ?auto_57067 ?auto_57070 ) ) ( not ( = ?auto_57062 ?auto_57070 ) ) ( not ( = ?auto_57065 ?auto_57070 ) ) ( not ( = ?auto_57063 ?auto_57070 ) ) ( not ( = ?auto_57051 ?auto_57070 ) ) ( not ( = ?auto_57056 ?auto_57054 ) ) ( not ( = ?auto_57066 ?auto_57056 ) ) ( not ( = ?auto_57052 ?auto_57056 ) ) ( not ( = ?auto_57059 ?auto_57056 ) ) ( HOIST-AT ?auto_57068 ?auto_57056 ) ( not ( = ?auto_57069 ?auto_57068 ) ) ( not ( = ?auto_57058 ?auto_57068 ) ) ( not ( = ?auto_57061 ?auto_57068 ) ) ( not ( = ?auto_57050 ?auto_57068 ) ) ( AVAILABLE ?auto_57068 ) ( SURFACE-AT ?auto_57063 ?auto_57056 ) ( ON ?auto_57063 ?auto_57055 ) ( CLEAR ?auto_57063 ) ( not ( = ?auto_57048 ?auto_57055 ) ) ( not ( = ?auto_57049 ?auto_57055 ) ) ( not ( = ?auto_57067 ?auto_57055 ) ) ( not ( = ?auto_57062 ?auto_57055 ) ) ( not ( = ?auto_57065 ?auto_57055 ) ) ( not ( = ?auto_57063 ?auto_57055 ) ) ( not ( = ?auto_57051 ?auto_57055 ) ) ( not ( = ?auto_57070 ?auto_57055 ) ) ( IS-CRATE ?auto_57070 ) ( not ( = ?auto_57048 ?auto_57071 ) ) ( not ( = ?auto_57049 ?auto_57071 ) ) ( not ( = ?auto_57067 ?auto_57071 ) ) ( not ( = ?auto_57062 ?auto_57071 ) ) ( not ( = ?auto_57065 ?auto_57071 ) ) ( not ( = ?auto_57063 ?auto_57071 ) ) ( not ( = ?auto_57051 ?auto_57071 ) ) ( not ( = ?auto_57070 ?auto_57071 ) ) ( not ( = ?auto_57055 ?auto_57071 ) ) ( not ( = ?auto_57057 ?auto_57054 ) ) ( not ( = ?auto_57066 ?auto_57057 ) ) ( not ( = ?auto_57052 ?auto_57057 ) ) ( not ( = ?auto_57059 ?auto_57057 ) ) ( not ( = ?auto_57056 ?auto_57057 ) ) ( HOIST-AT ?auto_57064 ?auto_57057 ) ( not ( = ?auto_57069 ?auto_57064 ) ) ( not ( = ?auto_57058 ?auto_57064 ) ) ( not ( = ?auto_57061 ?auto_57064 ) ) ( not ( = ?auto_57050 ?auto_57064 ) ) ( not ( = ?auto_57068 ?auto_57064 ) ) ( AVAILABLE ?auto_57064 ) ( SURFACE-AT ?auto_57070 ?auto_57057 ) ( ON ?auto_57070 ?auto_57072 ) ( CLEAR ?auto_57070 ) ( not ( = ?auto_57048 ?auto_57072 ) ) ( not ( = ?auto_57049 ?auto_57072 ) ) ( not ( = ?auto_57067 ?auto_57072 ) ) ( not ( = ?auto_57062 ?auto_57072 ) ) ( not ( = ?auto_57065 ?auto_57072 ) ) ( not ( = ?auto_57063 ?auto_57072 ) ) ( not ( = ?auto_57051 ?auto_57072 ) ) ( not ( = ?auto_57070 ?auto_57072 ) ) ( not ( = ?auto_57055 ?auto_57072 ) ) ( not ( = ?auto_57071 ?auto_57072 ) ) ( SURFACE-AT ?auto_57053 ?auto_57054 ) ( CLEAR ?auto_57053 ) ( IS-CRATE ?auto_57071 ) ( not ( = ?auto_57048 ?auto_57053 ) ) ( not ( = ?auto_57049 ?auto_57053 ) ) ( not ( = ?auto_57067 ?auto_57053 ) ) ( not ( = ?auto_57062 ?auto_57053 ) ) ( not ( = ?auto_57065 ?auto_57053 ) ) ( not ( = ?auto_57063 ?auto_57053 ) ) ( not ( = ?auto_57051 ?auto_57053 ) ) ( not ( = ?auto_57070 ?auto_57053 ) ) ( not ( = ?auto_57055 ?auto_57053 ) ) ( not ( = ?auto_57071 ?auto_57053 ) ) ( not ( = ?auto_57072 ?auto_57053 ) ) ( AVAILABLE ?auto_57069 ) ( IN ?auto_57071 ?auto_57060 ) ( TRUCK-AT ?auto_57060 ?auto_57073 ) ( not ( = ?auto_57073 ?auto_57054 ) ) ( not ( = ?auto_57066 ?auto_57073 ) ) ( not ( = ?auto_57052 ?auto_57073 ) ) ( not ( = ?auto_57059 ?auto_57073 ) ) ( not ( = ?auto_57056 ?auto_57073 ) ) ( not ( = ?auto_57057 ?auto_57073 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57060 ?auto_57073 ?auto_57054 )
      ( MAKE-ON ?auto_57048 ?auto_57049 )
      ( MAKE-ON-VERIFY ?auto_57048 ?auto_57049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57074 - SURFACE
      ?auto_57075 - SURFACE
    )
    :vars
    (
      ?auto_57086 - HOIST
      ?auto_57083 - PLACE
      ?auto_57087 - PLACE
      ?auto_57077 - HOIST
      ?auto_57088 - SURFACE
      ?auto_57091 - SURFACE
      ?auto_57092 - PLACE
      ?auto_57090 - HOIST
      ?auto_57080 - SURFACE
      ?auto_57082 - SURFACE
      ?auto_57089 - PLACE
      ?auto_57078 - HOIST
      ?auto_57095 - SURFACE
      ?auto_57098 - SURFACE
      ?auto_57081 - PLACE
      ?auto_57085 - HOIST
      ?auto_57097 - SURFACE
      ?auto_57099 - SURFACE
      ?auto_57094 - PLACE
      ?auto_57096 - HOIST
      ?auto_57079 - SURFACE
      ?auto_57093 - SURFACE
      ?auto_57084 - TRUCK
      ?auto_57076 - PLACE
      ?auto_57100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57086 ?auto_57083 ) ( IS-CRATE ?auto_57074 ) ( not ( = ?auto_57074 ?auto_57075 ) ) ( not ( = ?auto_57087 ?auto_57083 ) ) ( HOIST-AT ?auto_57077 ?auto_57087 ) ( not ( = ?auto_57086 ?auto_57077 ) ) ( AVAILABLE ?auto_57077 ) ( SURFACE-AT ?auto_57074 ?auto_57087 ) ( ON ?auto_57074 ?auto_57088 ) ( CLEAR ?auto_57074 ) ( not ( = ?auto_57074 ?auto_57088 ) ) ( not ( = ?auto_57075 ?auto_57088 ) ) ( IS-CRATE ?auto_57075 ) ( not ( = ?auto_57074 ?auto_57091 ) ) ( not ( = ?auto_57075 ?auto_57091 ) ) ( not ( = ?auto_57088 ?auto_57091 ) ) ( not ( = ?auto_57092 ?auto_57083 ) ) ( not ( = ?auto_57087 ?auto_57092 ) ) ( HOIST-AT ?auto_57090 ?auto_57092 ) ( not ( = ?auto_57086 ?auto_57090 ) ) ( not ( = ?auto_57077 ?auto_57090 ) ) ( AVAILABLE ?auto_57090 ) ( SURFACE-AT ?auto_57075 ?auto_57092 ) ( ON ?auto_57075 ?auto_57080 ) ( CLEAR ?auto_57075 ) ( not ( = ?auto_57074 ?auto_57080 ) ) ( not ( = ?auto_57075 ?auto_57080 ) ) ( not ( = ?auto_57088 ?auto_57080 ) ) ( not ( = ?auto_57091 ?auto_57080 ) ) ( IS-CRATE ?auto_57091 ) ( not ( = ?auto_57074 ?auto_57082 ) ) ( not ( = ?auto_57075 ?auto_57082 ) ) ( not ( = ?auto_57088 ?auto_57082 ) ) ( not ( = ?auto_57091 ?auto_57082 ) ) ( not ( = ?auto_57080 ?auto_57082 ) ) ( not ( = ?auto_57089 ?auto_57083 ) ) ( not ( = ?auto_57087 ?auto_57089 ) ) ( not ( = ?auto_57092 ?auto_57089 ) ) ( HOIST-AT ?auto_57078 ?auto_57089 ) ( not ( = ?auto_57086 ?auto_57078 ) ) ( not ( = ?auto_57077 ?auto_57078 ) ) ( not ( = ?auto_57090 ?auto_57078 ) ) ( AVAILABLE ?auto_57078 ) ( SURFACE-AT ?auto_57091 ?auto_57089 ) ( ON ?auto_57091 ?auto_57095 ) ( CLEAR ?auto_57091 ) ( not ( = ?auto_57074 ?auto_57095 ) ) ( not ( = ?auto_57075 ?auto_57095 ) ) ( not ( = ?auto_57088 ?auto_57095 ) ) ( not ( = ?auto_57091 ?auto_57095 ) ) ( not ( = ?auto_57080 ?auto_57095 ) ) ( not ( = ?auto_57082 ?auto_57095 ) ) ( IS-CRATE ?auto_57082 ) ( not ( = ?auto_57074 ?auto_57098 ) ) ( not ( = ?auto_57075 ?auto_57098 ) ) ( not ( = ?auto_57088 ?auto_57098 ) ) ( not ( = ?auto_57091 ?auto_57098 ) ) ( not ( = ?auto_57080 ?auto_57098 ) ) ( not ( = ?auto_57082 ?auto_57098 ) ) ( not ( = ?auto_57095 ?auto_57098 ) ) ( not ( = ?auto_57081 ?auto_57083 ) ) ( not ( = ?auto_57087 ?auto_57081 ) ) ( not ( = ?auto_57092 ?auto_57081 ) ) ( not ( = ?auto_57089 ?auto_57081 ) ) ( HOIST-AT ?auto_57085 ?auto_57081 ) ( not ( = ?auto_57086 ?auto_57085 ) ) ( not ( = ?auto_57077 ?auto_57085 ) ) ( not ( = ?auto_57090 ?auto_57085 ) ) ( not ( = ?auto_57078 ?auto_57085 ) ) ( AVAILABLE ?auto_57085 ) ( SURFACE-AT ?auto_57082 ?auto_57081 ) ( ON ?auto_57082 ?auto_57097 ) ( CLEAR ?auto_57082 ) ( not ( = ?auto_57074 ?auto_57097 ) ) ( not ( = ?auto_57075 ?auto_57097 ) ) ( not ( = ?auto_57088 ?auto_57097 ) ) ( not ( = ?auto_57091 ?auto_57097 ) ) ( not ( = ?auto_57080 ?auto_57097 ) ) ( not ( = ?auto_57082 ?auto_57097 ) ) ( not ( = ?auto_57095 ?auto_57097 ) ) ( not ( = ?auto_57098 ?auto_57097 ) ) ( IS-CRATE ?auto_57098 ) ( not ( = ?auto_57074 ?auto_57099 ) ) ( not ( = ?auto_57075 ?auto_57099 ) ) ( not ( = ?auto_57088 ?auto_57099 ) ) ( not ( = ?auto_57091 ?auto_57099 ) ) ( not ( = ?auto_57080 ?auto_57099 ) ) ( not ( = ?auto_57082 ?auto_57099 ) ) ( not ( = ?auto_57095 ?auto_57099 ) ) ( not ( = ?auto_57098 ?auto_57099 ) ) ( not ( = ?auto_57097 ?auto_57099 ) ) ( not ( = ?auto_57094 ?auto_57083 ) ) ( not ( = ?auto_57087 ?auto_57094 ) ) ( not ( = ?auto_57092 ?auto_57094 ) ) ( not ( = ?auto_57089 ?auto_57094 ) ) ( not ( = ?auto_57081 ?auto_57094 ) ) ( HOIST-AT ?auto_57096 ?auto_57094 ) ( not ( = ?auto_57086 ?auto_57096 ) ) ( not ( = ?auto_57077 ?auto_57096 ) ) ( not ( = ?auto_57090 ?auto_57096 ) ) ( not ( = ?auto_57078 ?auto_57096 ) ) ( not ( = ?auto_57085 ?auto_57096 ) ) ( AVAILABLE ?auto_57096 ) ( SURFACE-AT ?auto_57098 ?auto_57094 ) ( ON ?auto_57098 ?auto_57079 ) ( CLEAR ?auto_57098 ) ( not ( = ?auto_57074 ?auto_57079 ) ) ( not ( = ?auto_57075 ?auto_57079 ) ) ( not ( = ?auto_57088 ?auto_57079 ) ) ( not ( = ?auto_57091 ?auto_57079 ) ) ( not ( = ?auto_57080 ?auto_57079 ) ) ( not ( = ?auto_57082 ?auto_57079 ) ) ( not ( = ?auto_57095 ?auto_57079 ) ) ( not ( = ?auto_57098 ?auto_57079 ) ) ( not ( = ?auto_57097 ?auto_57079 ) ) ( not ( = ?auto_57099 ?auto_57079 ) ) ( SURFACE-AT ?auto_57093 ?auto_57083 ) ( CLEAR ?auto_57093 ) ( IS-CRATE ?auto_57099 ) ( not ( = ?auto_57074 ?auto_57093 ) ) ( not ( = ?auto_57075 ?auto_57093 ) ) ( not ( = ?auto_57088 ?auto_57093 ) ) ( not ( = ?auto_57091 ?auto_57093 ) ) ( not ( = ?auto_57080 ?auto_57093 ) ) ( not ( = ?auto_57082 ?auto_57093 ) ) ( not ( = ?auto_57095 ?auto_57093 ) ) ( not ( = ?auto_57098 ?auto_57093 ) ) ( not ( = ?auto_57097 ?auto_57093 ) ) ( not ( = ?auto_57099 ?auto_57093 ) ) ( not ( = ?auto_57079 ?auto_57093 ) ) ( AVAILABLE ?auto_57086 ) ( TRUCK-AT ?auto_57084 ?auto_57076 ) ( not ( = ?auto_57076 ?auto_57083 ) ) ( not ( = ?auto_57087 ?auto_57076 ) ) ( not ( = ?auto_57092 ?auto_57076 ) ) ( not ( = ?auto_57089 ?auto_57076 ) ) ( not ( = ?auto_57081 ?auto_57076 ) ) ( not ( = ?auto_57094 ?auto_57076 ) ) ( HOIST-AT ?auto_57100 ?auto_57076 ) ( LIFTING ?auto_57100 ?auto_57099 ) ( not ( = ?auto_57086 ?auto_57100 ) ) ( not ( = ?auto_57077 ?auto_57100 ) ) ( not ( = ?auto_57090 ?auto_57100 ) ) ( not ( = ?auto_57078 ?auto_57100 ) ) ( not ( = ?auto_57085 ?auto_57100 ) ) ( not ( = ?auto_57096 ?auto_57100 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57100 ?auto_57099 ?auto_57084 ?auto_57076 )
      ( MAKE-ON ?auto_57074 ?auto_57075 )
      ( MAKE-ON-VERIFY ?auto_57074 ?auto_57075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57101 - SURFACE
      ?auto_57102 - SURFACE
    )
    :vars
    (
      ?auto_57104 - HOIST
      ?auto_57121 - PLACE
      ?auto_57106 - PLACE
      ?auto_57124 - HOIST
      ?auto_57107 - SURFACE
      ?auto_57113 - SURFACE
      ?auto_57127 - PLACE
      ?auto_57117 - HOIST
      ?auto_57125 - SURFACE
      ?auto_57118 - SURFACE
      ?auto_57103 - PLACE
      ?auto_57122 - HOIST
      ?auto_57126 - SURFACE
      ?auto_57112 - SURFACE
      ?auto_57120 - PLACE
      ?auto_57105 - HOIST
      ?auto_57111 - SURFACE
      ?auto_57108 - SURFACE
      ?auto_57116 - PLACE
      ?auto_57110 - HOIST
      ?auto_57123 - SURFACE
      ?auto_57115 - SURFACE
      ?auto_57119 - TRUCK
      ?auto_57109 - PLACE
      ?auto_57114 - HOIST
      ?auto_57128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57104 ?auto_57121 ) ( IS-CRATE ?auto_57101 ) ( not ( = ?auto_57101 ?auto_57102 ) ) ( not ( = ?auto_57106 ?auto_57121 ) ) ( HOIST-AT ?auto_57124 ?auto_57106 ) ( not ( = ?auto_57104 ?auto_57124 ) ) ( AVAILABLE ?auto_57124 ) ( SURFACE-AT ?auto_57101 ?auto_57106 ) ( ON ?auto_57101 ?auto_57107 ) ( CLEAR ?auto_57101 ) ( not ( = ?auto_57101 ?auto_57107 ) ) ( not ( = ?auto_57102 ?auto_57107 ) ) ( IS-CRATE ?auto_57102 ) ( not ( = ?auto_57101 ?auto_57113 ) ) ( not ( = ?auto_57102 ?auto_57113 ) ) ( not ( = ?auto_57107 ?auto_57113 ) ) ( not ( = ?auto_57127 ?auto_57121 ) ) ( not ( = ?auto_57106 ?auto_57127 ) ) ( HOIST-AT ?auto_57117 ?auto_57127 ) ( not ( = ?auto_57104 ?auto_57117 ) ) ( not ( = ?auto_57124 ?auto_57117 ) ) ( AVAILABLE ?auto_57117 ) ( SURFACE-AT ?auto_57102 ?auto_57127 ) ( ON ?auto_57102 ?auto_57125 ) ( CLEAR ?auto_57102 ) ( not ( = ?auto_57101 ?auto_57125 ) ) ( not ( = ?auto_57102 ?auto_57125 ) ) ( not ( = ?auto_57107 ?auto_57125 ) ) ( not ( = ?auto_57113 ?auto_57125 ) ) ( IS-CRATE ?auto_57113 ) ( not ( = ?auto_57101 ?auto_57118 ) ) ( not ( = ?auto_57102 ?auto_57118 ) ) ( not ( = ?auto_57107 ?auto_57118 ) ) ( not ( = ?auto_57113 ?auto_57118 ) ) ( not ( = ?auto_57125 ?auto_57118 ) ) ( not ( = ?auto_57103 ?auto_57121 ) ) ( not ( = ?auto_57106 ?auto_57103 ) ) ( not ( = ?auto_57127 ?auto_57103 ) ) ( HOIST-AT ?auto_57122 ?auto_57103 ) ( not ( = ?auto_57104 ?auto_57122 ) ) ( not ( = ?auto_57124 ?auto_57122 ) ) ( not ( = ?auto_57117 ?auto_57122 ) ) ( AVAILABLE ?auto_57122 ) ( SURFACE-AT ?auto_57113 ?auto_57103 ) ( ON ?auto_57113 ?auto_57126 ) ( CLEAR ?auto_57113 ) ( not ( = ?auto_57101 ?auto_57126 ) ) ( not ( = ?auto_57102 ?auto_57126 ) ) ( not ( = ?auto_57107 ?auto_57126 ) ) ( not ( = ?auto_57113 ?auto_57126 ) ) ( not ( = ?auto_57125 ?auto_57126 ) ) ( not ( = ?auto_57118 ?auto_57126 ) ) ( IS-CRATE ?auto_57118 ) ( not ( = ?auto_57101 ?auto_57112 ) ) ( not ( = ?auto_57102 ?auto_57112 ) ) ( not ( = ?auto_57107 ?auto_57112 ) ) ( not ( = ?auto_57113 ?auto_57112 ) ) ( not ( = ?auto_57125 ?auto_57112 ) ) ( not ( = ?auto_57118 ?auto_57112 ) ) ( not ( = ?auto_57126 ?auto_57112 ) ) ( not ( = ?auto_57120 ?auto_57121 ) ) ( not ( = ?auto_57106 ?auto_57120 ) ) ( not ( = ?auto_57127 ?auto_57120 ) ) ( not ( = ?auto_57103 ?auto_57120 ) ) ( HOIST-AT ?auto_57105 ?auto_57120 ) ( not ( = ?auto_57104 ?auto_57105 ) ) ( not ( = ?auto_57124 ?auto_57105 ) ) ( not ( = ?auto_57117 ?auto_57105 ) ) ( not ( = ?auto_57122 ?auto_57105 ) ) ( AVAILABLE ?auto_57105 ) ( SURFACE-AT ?auto_57118 ?auto_57120 ) ( ON ?auto_57118 ?auto_57111 ) ( CLEAR ?auto_57118 ) ( not ( = ?auto_57101 ?auto_57111 ) ) ( not ( = ?auto_57102 ?auto_57111 ) ) ( not ( = ?auto_57107 ?auto_57111 ) ) ( not ( = ?auto_57113 ?auto_57111 ) ) ( not ( = ?auto_57125 ?auto_57111 ) ) ( not ( = ?auto_57118 ?auto_57111 ) ) ( not ( = ?auto_57126 ?auto_57111 ) ) ( not ( = ?auto_57112 ?auto_57111 ) ) ( IS-CRATE ?auto_57112 ) ( not ( = ?auto_57101 ?auto_57108 ) ) ( not ( = ?auto_57102 ?auto_57108 ) ) ( not ( = ?auto_57107 ?auto_57108 ) ) ( not ( = ?auto_57113 ?auto_57108 ) ) ( not ( = ?auto_57125 ?auto_57108 ) ) ( not ( = ?auto_57118 ?auto_57108 ) ) ( not ( = ?auto_57126 ?auto_57108 ) ) ( not ( = ?auto_57112 ?auto_57108 ) ) ( not ( = ?auto_57111 ?auto_57108 ) ) ( not ( = ?auto_57116 ?auto_57121 ) ) ( not ( = ?auto_57106 ?auto_57116 ) ) ( not ( = ?auto_57127 ?auto_57116 ) ) ( not ( = ?auto_57103 ?auto_57116 ) ) ( not ( = ?auto_57120 ?auto_57116 ) ) ( HOIST-AT ?auto_57110 ?auto_57116 ) ( not ( = ?auto_57104 ?auto_57110 ) ) ( not ( = ?auto_57124 ?auto_57110 ) ) ( not ( = ?auto_57117 ?auto_57110 ) ) ( not ( = ?auto_57122 ?auto_57110 ) ) ( not ( = ?auto_57105 ?auto_57110 ) ) ( AVAILABLE ?auto_57110 ) ( SURFACE-AT ?auto_57112 ?auto_57116 ) ( ON ?auto_57112 ?auto_57123 ) ( CLEAR ?auto_57112 ) ( not ( = ?auto_57101 ?auto_57123 ) ) ( not ( = ?auto_57102 ?auto_57123 ) ) ( not ( = ?auto_57107 ?auto_57123 ) ) ( not ( = ?auto_57113 ?auto_57123 ) ) ( not ( = ?auto_57125 ?auto_57123 ) ) ( not ( = ?auto_57118 ?auto_57123 ) ) ( not ( = ?auto_57126 ?auto_57123 ) ) ( not ( = ?auto_57112 ?auto_57123 ) ) ( not ( = ?auto_57111 ?auto_57123 ) ) ( not ( = ?auto_57108 ?auto_57123 ) ) ( SURFACE-AT ?auto_57115 ?auto_57121 ) ( CLEAR ?auto_57115 ) ( IS-CRATE ?auto_57108 ) ( not ( = ?auto_57101 ?auto_57115 ) ) ( not ( = ?auto_57102 ?auto_57115 ) ) ( not ( = ?auto_57107 ?auto_57115 ) ) ( not ( = ?auto_57113 ?auto_57115 ) ) ( not ( = ?auto_57125 ?auto_57115 ) ) ( not ( = ?auto_57118 ?auto_57115 ) ) ( not ( = ?auto_57126 ?auto_57115 ) ) ( not ( = ?auto_57112 ?auto_57115 ) ) ( not ( = ?auto_57111 ?auto_57115 ) ) ( not ( = ?auto_57108 ?auto_57115 ) ) ( not ( = ?auto_57123 ?auto_57115 ) ) ( AVAILABLE ?auto_57104 ) ( TRUCK-AT ?auto_57119 ?auto_57109 ) ( not ( = ?auto_57109 ?auto_57121 ) ) ( not ( = ?auto_57106 ?auto_57109 ) ) ( not ( = ?auto_57127 ?auto_57109 ) ) ( not ( = ?auto_57103 ?auto_57109 ) ) ( not ( = ?auto_57120 ?auto_57109 ) ) ( not ( = ?auto_57116 ?auto_57109 ) ) ( HOIST-AT ?auto_57114 ?auto_57109 ) ( not ( = ?auto_57104 ?auto_57114 ) ) ( not ( = ?auto_57124 ?auto_57114 ) ) ( not ( = ?auto_57117 ?auto_57114 ) ) ( not ( = ?auto_57122 ?auto_57114 ) ) ( not ( = ?auto_57105 ?auto_57114 ) ) ( not ( = ?auto_57110 ?auto_57114 ) ) ( AVAILABLE ?auto_57114 ) ( SURFACE-AT ?auto_57108 ?auto_57109 ) ( ON ?auto_57108 ?auto_57128 ) ( CLEAR ?auto_57108 ) ( not ( = ?auto_57101 ?auto_57128 ) ) ( not ( = ?auto_57102 ?auto_57128 ) ) ( not ( = ?auto_57107 ?auto_57128 ) ) ( not ( = ?auto_57113 ?auto_57128 ) ) ( not ( = ?auto_57125 ?auto_57128 ) ) ( not ( = ?auto_57118 ?auto_57128 ) ) ( not ( = ?auto_57126 ?auto_57128 ) ) ( not ( = ?auto_57112 ?auto_57128 ) ) ( not ( = ?auto_57111 ?auto_57128 ) ) ( not ( = ?auto_57108 ?auto_57128 ) ) ( not ( = ?auto_57123 ?auto_57128 ) ) ( not ( = ?auto_57115 ?auto_57128 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57114 ?auto_57108 ?auto_57128 ?auto_57109 )
      ( MAKE-ON ?auto_57101 ?auto_57102 )
      ( MAKE-ON-VERIFY ?auto_57101 ?auto_57102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57129 - SURFACE
      ?auto_57130 - SURFACE
    )
    :vars
    (
      ?auto_57154 - HOIST
      ?auto_57142 - PLACE
      ?auto_57132 - PLACE
      ?auto_57141 - HOIST
      ?auto_57131 - SURFACE
      ?auto_57149 - SURFACE
      ?auto_57139 - PLACE
      ?auto_57135 - HOIST
      ?auto_57152 - SURFACE
      ?auto_57153 - SURFACE
      ?auto_57136 - PLACE
      ?auto_57143 - HOIST
      ?auto_57138 - SURFACE
      ?auto_57148 - SURFACE
      ?auto_57137 - PLACE
      ?auto_57156 - HOIST
      ?auto_57155 - SURFACE
      ?auto_57147 - SURFACE
      ?auto_57145 - PLACE
      ?auto_57146 - HOIST
      ?auto_57140 - SURFACE
      ?auto_57144 - SURFACE
      ?auto_57134 - PLACE
      ?auto_57150 - HOIST
      ?auto_57151 - SURFACE
      ?auto_57133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57154 ?auto_57142 ) ( IS-CRATE ?auto_57129 ) ( not ( = ?auto_57129 ?auto_57130 ) ) ( not ( = ?auto_57132 ?auto_57142 ) ) ( HOIST-AT ?auto_57141 ?auto_57132 ) ( not ( = ?auto_57154 ?auto_57141 ) ) ( AVAILABLE ?auto_57141 ) ( SURFACE-AT ?auto_57129 ?auto_57132 ) ( ON ?auto_57129 ?auto_57131 ) ( CLEAR ?auto_57129 ) ( not ( = ?auto_57129 ?auto_57131 ) ) ( not ( = ?auto_57130 ?auto_57131 ) ) ( IS-CRATE ?auto_57130 ) ( not ( = ?auto_57129 ?auto_57149 ) ) ( not ( = ?auto_57130 ?auto_57149 ) ) ( not ( = ?auto_57131 ?auto_57149 ) ) ( not ( = ?auto_57139 ?auto_57142 ) ) ( not ( = ?auto_57132 ?auto_57139 ) ) ( HOIST-AT ?auto_57135 ?auto_57139 ) ( not ( = ?auto_57154 ?auto_57135 ) ) ( not ( = ?auto_57141 ?auto_57135 ) ) ( AVAILABLE ?auto_57135 ) ( SURFACE-AT ?auto_57130 ?auto_57139 ) ( ON ?auto_57130 ?auto_57152 ) ( CLEAR ?auto_57130 ) ( not ( = ?auto_57129 ?auto_57152 ) ) ( not ( = ?auto_57130 ?auto_57152 ) ) ( not ( = ?auto_57131 ?auto_57152 ) ) ( not ( = ?auto_57149 ?auto_57152 ) ) ( IS-CRATE ?auto_57149 ) ( not ( = ?auto_57129 ?auto_57153 ) ) ( not ( = ?auto_57130 ?auto_57153 ) ) ( not ( = ?auto_57131 ?auto_57153 ) ) ( not ( = ?auto_57149 ?auto_57153 ) ) ( not ( = ?auto_57152 ?auto_57153 ) ) ( not ( = ?auto_57136 ?auto_57142 ) ) ( not ( = ?auto_57132 ?auto_57136 ) ) ( not ( = ?auto_57139 ?auto_57136 ) ) ( HOIST-AT ?auto_57143 ?auto_57136 ) ( not ( = ?auto_57154 ?auto_57143 ) ) ( not ( = ?auto_57141 ?auto_57143 ) ) ( not ( = ?auto_57135 ?auto_57143 ) ) ( AVAILABLE ?auto_57143 ) ( SURFACE-AT ?auto_57149 ?auto_57136 ) ( ON ?auto_57149 ?auto_57138 ) ( CLEAR ?auto_57149 ) ( not ( = ?auto_57129 ?auto_57138 ) ) ( not ( = ?auto_57130 ?auto_57138 ) ) ( not ( = ?auto_57131 ?auto_57138 ) ) ( not ( = ?auto_57149 ?auto_57138 ) ) ( not ( = ?auto_57152 ?auto_57138 ) ) ( not ( = ?auto_57153 ?auto_57138 ) ) ( IS-CRATE ?auto_57153 ) ( not ( = ?auto_57129 ?auto_57148 ) ) ( not ( = ?auto_57130 ?auto_57148 ) ) ( not ( = ?auto_57131 ?auto_57148 ) ) ( not ( = ?auto_57149 ?auto_57148 ) ) ( not ( = ?auto_57152 ?auto_57148 ) ) ( not ( = ?auto_57153 ?auto_57148 ) ) ( not ( = ?auto_57138 ?auto_57148 ) ) ( not ( = ?auto_57137 ?auto_57142 ) ) ( not ( = ?auto_57132 ?auto_57137 ) ) ( not ( = ?auto_57139 ?auto_57137 ) ) ( not ( = ?auto_57136 ?auto_57137 ) ) ( HOIST-AT ?auto_57156 ?auto_57137 ) ( not ( = ?auto_57154 ?auto_57156 ) ) ( not ( = ?auto_57141 ?auto_57156 ) ) ( not ( = ?auto_57135 ?auto_57156 ) ) ( not ( = ?auto_57143 ?auto_57156 ) ) ( AVAILABLE ?auto_57156 ) ( SURFACE-AT ?auto_57153 ?auto_57137 ) ( ON ?auto_57153 ?auto_57155 ) ( CLEAR ?auto_57153 ) ( not ( = ?auto_57129 ?auto_57155 ) ) ( not ( = ?auto_57130 ?auto_57155 ) ) ( not ( = ?auto_57131 ?auto_57155 ) ) ( not ( = ?auto_57149 ?auto_57155 ) ) ( not ( = ?auto_57152 ?auto_57155 ) ) ( not ( = ?auto_57153 ?auto_57155 ) ) ( not ( = ?auto_57138 ?auto_57155 ) ) ( not ( = ?auto_57148 ?auto_57155 ) ) ( IS-CRATE ?auto_57148 ) ( not ( = ?auto_57129 ?auto_57147 ) ) ( not ( = ?auto_57130 ?auto_57147 ) ) ( not ( = ?auto_57131 ?auto_57147 ) ) ( not ( = ?auto_57149 ?auto_57147 ) ) ( not ( = ?auto_57152 ?auto_57147 ) ) ( not ( = ?auto_57153 ?auto_57147 ) ) ( not ( = ?auto_57138 ?auto_57147 ) ) ( not ( = ?auto_57148 ?auto_57147 ) ) ( not ( = ?auto_57155 ?auto_57147 ) ) ( not ( = ?auto_57145 ?auto_57142 ) ) ( not ( = ?auto_57132 ?auto_57145 ) ) ( not ( = ?auto_57139 ?auto_57145 ) ) ( not ( = ?auto_57136 ?auto_57145 ) ) ( not ( = ?auto_57137 ?auto_57145 ) ) ( HOIST-AT ?auto_57146 ?auto_57145 ) ( not ( = ?auto_57154 ?auto_57146 ) ) ( not ( = ?auto_57141 ?auto_57146 ) ) ( not ( = ?auto_57135 ?auto_57146 ) ) ( not ( = ?auto_57143 ?auto_57146 ) ) ( not ( = ?auto_57156 ?auto_57146 ) ) ( AVAILABLE ?auto_57146 ) ( SURFACE-AT ?auto_57148 ?auto_57145 ) ( ON ?auto_57148 ?auto_57140 ) ( CLEAR ?auto_57148 ) ( not ( = ?auto_57129 ?auto_57140 ) ) ( not ( = ?auto_57130 ?auto_57140 ) ) ( not ( = ?auto_57131 ?auto_57140 ) ) ( not ( = ?auto_57149 ?auto_57140 ) ) ( not ( = ?auto_57152 ?auto_57140 ) ) ( not ( = ?auto_57153 ?auto_57140 ) ) ( not ( = ?auto_57138 ?auto_57140 ) ) ( not ( = ?auto_57148 ?auto_57140 ) ) ( not ( = ?auto_57155 ?auto_57140 ) ) ( not ( = ?auto_57147 ?auto_57140 ) ) ( SURFACE-AT ?auto_57144 ?auto_57142 ) ( CLEAR ?auto_57144 ) ( IS-CRATE ?auto_57147 ) ( not ( = ?auto_57129 ?auto_57144 ) ) ( not ( = ?auto_57130 ?auto_57144 ) ) ( not ( = ?auto_57131 ?auto_57144 ) ) ( not ( = ?auto_57149 ?auto_57144 ) ) ( not ( = ?auto_57152 ?auto_57144 ) ) ( not ( = ?auto_57153 ?auto_57144 ) ) ( not ( = ?auto_57138 ?auto_57144 ) ) ( not ( = ?auto_57148 ?auto_57144 ) ) ( not ( = ?auto_57155 ?auto_57144 ) ) ( not ( = ?auto_57147 ?auto_57144 ) ) ( not ( = ?auto_57140 ?auto_57144 ) ) ( AVAILABLE ?auto_57154 ) ( not ( = ?auto_57134 ?auto_57142 ) ) ( not ( = ?auto_57132 ?auto_57134 ) ) ( not ( = ?auto_57139 ?auto_57134 ) ) ( not ( = ?auto_57136 ?auto_57134 ) ) ( not ( = ?auto_57137 ?auto_57134 ) ) ( not ( = ?auto_57145 ?auto_57134 ) ) ( HOIST-AT ?auto_57150 ?auto_57134 ) ( not ( = ?auto_57154 ?auto_57150 ) ) ( not ( = ?auto_57141 ?auto_57150 ) ) ( not ( = ?auto_57135 ?auto_57150 ) ) ( not ( = ?auto_57143 ?auto_57150 ) ) ( not ( = ?auto_57156 ?auto_57150 ) ) ( not ( = ?auto_57146 ?auto_57150 ) ) ( AVAILABLE ?auto_57150 ) ( SURFACE-AT ?auto_57147 ?auto_57134 ) ( ON ?auto_57147 ?auto_57151 ) ( CLEAR ?auto_57147 ) ( not ( = ?auto_57129 ?auto_57151 ) ) ( not ( = ?auto_57130 ?auto_57151 ) ) ( not ( = ?auto_57131 ?auto_57151 ) ) ( not ( = ?auto_57149 ?auto_57151 ) ) ( not ( = ?auto_57152 ?auto_57151 ) ) ( not ( = ?auto_57153 ?auto_57151 ) ) ( not ( = ?auto_57138 ?auto_57151 ) ) ( not ( = ?auto_57148 ?auto_57151 ) ) ( not ( = ?auto_57155 ?auto_57151 ) ) ( not ( = ?auto_57147 ?auto_57151 ) ) ( not ( = ?auto_57140 ?auto_57151 ) ) ( not ( = ?auto_57144 ?auto_57151 ) ) ( TRUCK-AT ?auto_57133 ?auto_57142 ) )
    :subtasks
    ( ( !DRIVE ?auto_57133 ?auto_57142 ?auto_57134 )
      ( MAKE-ON ?auto_57129 ?auto_57130 )
      ( MAKE-ON-VERIFY ?auto_57129 ?auto_57130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57157 - SURFACE
      ?auto_57158 - SURFACE
    )
    :vars
    (
      ?auto_57184 - HOIST
      ?auto_57181 - PLACE
      ?auto_57167 - PLACE
      ?auto_57161 - HOIST
      ?auto_57165 - SURFACE
      ?auto_57172 - SURFACE
      ?auto_57159 - PLACE
      ?auto_57162 - HOIST
      ?auto_57178 - SURFACE
      ?auto_57175 - SURFACE
      ?auto_57182 - PLACE
      ?auto_57166 - HOIST
      ?auto_57163 - SURFACE
      ?auto_57170 - SURFACE
      ?auto_57173 - PLACE
      ?auto_57183 - HOIST
      ?auto_57179 - SURFACE
      ?auto_57169 - SURFACE
      ?auto_57174 - PLACE
      ?auto_57171 - HOIST
      ?auto_57164 - SURFACE
      ?auto_57180 - SURFACE
      ?auto_57160 - PLACE
      ?auto_57176 - HOIST
      ?auto_57177 - SURFACE
      ?auto_57168 - TRUCK
      ?auto_57185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57184 ?auto_57181 ) ( IS-CRATE ?auto_57157 ) ( not ( = ?auto_57157 ?auto_57158 ) ) ( not ( = ?auto_57167 ?auto_57181 ) ) ( HOIST-AT ?auto_57161 ?auto_57167 ) ( not ( = ?auto_57184 ?auto_57161 ) ) ( AVAILABLE ?auto_57161 ) ( SURFACE-AT ?auto_57157 ?auto_57167 ) ( ON ?auto_57157 ?auto_57165 ) ( CLEAR ?auto_57157 ) ( not ( = ?auto_57157 ?auto_57165 ) ) ( not ( = ?auto_57158 ?auto_57165 ) ) ( IS-CRATE ?auto_57158 ) ( not ( = ?auto_57157 ?auto_57172 ) ) ( not ( = ?auto_57158 ?auto_57172 ) ) ( not ( = ?auto_57165 ?auto_57172 ) ) ( not ( = ?auto_57159 ?auto_57181 ) ) ( not ( = ?auto_57167 ?auto_57159 ) ) ( HOIST-AT ?auto_57162 ?auto_57159 ) ( not ( = ?auto_57184 ?auto_57162 ) ) ( not ( = ?auto_57161 ?auto_57162 ) ) ( AVAILABLE ?auto_57162 ) ( SURFACE-AT ?auto_57158 ?auto_57159 ) ( ON ?auto_57158 ?auto_57178 ) ( CLEAR ?auto_57158 ) ( not ( = ?auto_57157 ?auto_57178 ) ) ( not ( = ?auto_57158 ?auto_57178 ) ) ( not ( = ?auto_57165 ?auto_57178 ) ) ( not ( = ?auto_57172 ?auto_57178 ) ) ( IS-CRATE ?auto_57172 ) ( not ( = ?auto_57157 ?auto_57175 ) ) ( not ( = ?auto_57158 ?auto_57175 ) ) ( not ( = ?auto_57165 ?auto_57175 ) ) ( not ( = ?auto_57172 ?auto_57175 ) ) ( not ( = ?auto_57178 ?auto_57175 ) ) ( not ( = ?auto_57182 ?auto_57181 ) ) ( not ( = ?auto_57167 ?auto_57182 ) ) ( not ( = ?auto_57159 ?auto_57182 ) ) ( HOIST-AT ?auto_57166 ?auto_57182 ) ( not ( = ?auto_57184 ?auto_57166 ) ) ( not ( = ?auto_57161 ?auto_57166 ) ) ( not ( = ?auto_57162 ?auto_57166 ) ) ( AVAILABLE ?auto_57166 ) ( SURFACE-AT ?auto_57172 ?auto_57182 ) ( ON ?auto_57172 ?auto_57163 ) ( CLEAR ?auto_57172 ) ( not ( = ?auto_57157 ?auto_57163 ) ) ( not ( = ?auto_57158 ?auto_57163 ) ) ( not ( = ?auto_57165 ?auto_57163 ) ) ( not ( = ?auto_57172 ?auto_57163 ) ) ( not ( = ?auto_57178 ?auto_57163 ) ) ( not ( = ?auto_57175 ?auto_57163 ) ) ( IS-CRATE ?auto_57175 ) ( not ( = ?auto_57157 ?auto_57170 ) ) ( not ( = ?auto_57158 ?auto_57170 ) ) ( not ( = ?auto_57165 ?auto_57170 ) ) ( not ( = ?auto_57172 ?auto_57170 ) ) ( not ( = ?auto_57178 ?auto_57170 ) ) ( not ( = ?auto_57175 ?auto_57170 ) ) ( not ( = ?auto_57163 ?auto_57170 ) ) ( not ( = ?auto_57173 ?auto_57181 ) ) ( not ( = ?auto_57167 ?auto_57173 ) ) ( not ( = ?auto_57159 ?auto_57173 ) ) ( not ( = ?auto_57182 ?auto_57173 ) ) ( HOIST-AT ?auto_57183 ?auto_57173 ) ( not ( = ?auto_57184 ?auto_57183 ) ) ( not ( = ?auto_57161 ?auto_57183 ) ) ( not ( = ?auto_57162 ?auto_57183 ) ) ( not ( = ?auto_57166 ?auto_57183 ) ) ( AVAILABLE ?auto_57183 ) ( SURFACE-AT ?auto_57175 ?auto_57173 ) ( ON ?auto_57175 ?auto_57179 ) ( CLEAR ?auto_57175 ) ( not ( = ?auto_57157 ?auto_57179 ) ) ( not ( = ?auto_57158 ?auto_57179 ) ) ( not ( = ?auto_57165 ?auto_57179 ) ) ( not ( = ?auto_57172 ?auto_57179 ) ) ( not ( = ?auto_57178 ?auto_57179 ) ) ( not ( = ?auto_57175 ?auto_57179 ) ) ( not ( = ?auto_57163 ?auto_57179 ) ) ( not ( = ?auto_57170 ?auto_57179 ) ) ( IS-CRATE ?auto_57170 ) ( not ( = ?auto_57157 ?auto_57169 ) ) ( not ( = ?auto_57158 ?auto_57169 ) ) ( not ( = ?auto_57165 ?auto_57169 ) ) ( not ( = ?auto_57172 ?auto_57169 ) ) ( not ( = ?auto_57178 ?auto_57169 ) ) ( not ( = ?auto_57175 ?auto_57169 ) ) ( not ( = ?auto_57163 ?auto_57169 ) ) ( not ( = ?auto_57170 ?auto_57169 ) ) ( not ( = ?auto_57179 ?auto_57169 ) ) ( not ( = ?auto_57174 ?auto_57181 ) ) ( not ( = ?auto_57167 ?auto_57174 ) ) ( not ( = ?auto_57159 ?auto_57174 ) ) ( not ( = ?auto_57182 ?auto_57174 ) ) ( not ( = ?auto_57173 ?auto_57174 ) ) ( HOIST-AT ?auto_57171 ?auto_57174 ) ( not ( = ?auto_57184 ?auto_57171 ) ) ( not ( = ?auto_57161 ?auto_57171 ) ) ( not ( = ?auto_57162 ?auto_57171 ) ) ( not ( = ?auto_57166 ?auto_57171 ) ) ( not ( = ?auto_57183 ?auto_57171 ) ) ( AVAILABLE ?auto_57171 ) ( SURFACE-AT ?auto_57170 ?auto_57174 ) ( ON ?auto_57170 ?auto_57164 ) ( CLEAR ?auto_57170 ) ( not ( = ?auto_57157 ?auto_57164 ) ) ( not ( = ?auto_57158 ?auto_57164 ) ) ( not ( = ?auto_57165 ?auto_57164 ) ) ( not ( = ?auto_57172 ?auto_57164 ) ) ( not ( = ?auto_57178 ?auto_57164 ) ) ( not ( = ?auto_57175 ?auto_57164 ) ) ( not ( = ?auto_57163 ?auto_57164 ) ) ( not ( = ?auto_57170 ?auto_57164 ) ) ( not ( = ?auto_57179 ?auto_57164 ) ) ( not ( = ?auto_57169 ?auto_57164 ) ) ( IS-CRATE ?auto_57169 ) ( not ( = ?auto_57157 ?auto_57180 ) ) ( not ( = ?auto_57158 ?auto_57180 ) ) ( not ( = ?auto_57165 ?auto_57180 ) ) ( not ( = ?auto_57172 ?auto_57180 ) ) ( not ( = ?auto_57178 ?auto_57180 ) ) ( not ( = ?auto_57175 ?auto_57180 ) ) ( not ( = ?auto_57163 ?auto_57180 ) ) ( not ( = ?auto_57170 ?auto_57180 ) ) ( not ( = ?auto_57179 ?auto_57180 ) ) ( not ( = ?auto_57169 ?auto_57180 ) ) ( not ( = ?auto_57164 ?auto_57180 ) ) ( not ( = ?auto_57160 ?auto_57181 ) ) ( not ( = ?auto_57167 ?auto_57160 ) ) ( not ( = ?auto_57159 ?auto_57160 ) ) ( not ( = ?auto_57182 ?auto_57160 ) ) ( not ( = ?auto_57173 ?auto_57160 ) ) ( not ( = ?auto_57174 ?auto_57160 ) ) ( HOIST-AT ?auto_57176 ?auto_57160 ) ( not ( = ?auto_57184 ?auto_57176 ) ) ( not ( = ?auto_57161 ?auto_57176 ) ) ( not ( = ?auto_57162 ?auto_57176 ) ) ( not ( = ?auto_57166 ?auto_57176 ) ) ( not ( = ?auto_57183 ?auto_57176 ) ) ( not ( = ?auto_57171 ?auto_57176 ) ) ( AVAILABLE ?auto_57176 ) ( SURFACE-AT ?auto_57169 ?auto_57160 ) ( ON ?auto_57169 ?auto_57177 ) ( CLEAR ?auto_57169 ) ( not ( = ?auto_57157 ?auto_57177 ) ) ( not ( = ?auto_57158 ?auto_57177 ) ) ( not ( = ?auto_57165 ?auto_57177 ) ) ( not ( = ?auto_57172 ?auto_57177 ) ) ( not ( = ?auto_57178 ?auto_57177 ) ) ( not ( = ?auto_57175 ?auto_57177 ) ) ( not ( = ?auto_57163 ?auto_57177 ) ) ( not ( = ?auto_57170 ?auto_57177 ) ) ( not ( = ?auto_57179 ?auto_57177 ) ) ( not ( = ?auto_57169 ?auto_57177 ) ) ( not ( = ?auto_57164 ?auto_57177 ) ) ( not ( = ?auto_57180 ?auto_57177 ) ) ( TRUCK-AT ?auto_57168 ?auto_57181 ) ( SURFACE-AT ?auto_57185 ?auto_57181 ) ( CLEAR ?auto_57185 ) ( LIFTING ?auto_57184 ?auto_57180 ) ( IS-CRATE ?auto_57180 ) ( not ( = ?auto_57157 ?auto_57185 ) ) ( not ( = ?auto_57158 ?auto_57185 ) ) ( not ( = ?auto_57165 ?auto_57185 ) ) ( not ( = ?auto_57172 ?auto_57185 ) ) ( not ( = ?auto_57178 ?auto_57185 ) ) ( not ( = ?auto_57175 ?auto_57185 ) ) ( not ( = ?auto_57163 ?auto_57185 ) ) ( not ( = ?auto_57170 ?auto_57185 ) ) ( not ( = ?auto_57179 ?auto_57185 ) ) ( not ( = ?auto_57169 ?auto_57185 ) ) ( not ( = ?auto_57164 ?auto_57185 ) ) ( not ( = ?auto_57180 ?auto_57185 ) ) ( not ( = ?auto_57177 ?auto_57185 ) ) )
    :subtasks
    ( ( !DROP ?auto_57184 ?auto_57180 ?auto_57185 ?auto_57181 )
      ( MAKE-ON ?auto_57157 ?auto_57158 )
      ( MAKE-ON-VERIFY ?auto_57157 ?auto_57158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57186 - SURFACE
      ?auto_57187 - SURFACE
    )
    :vars
    (
      ?auto_57210 - HOIST
      ?auto_57205 - PLACE
      ?auto_57209 - PLACE
      ?auto_57192 - HOIST
      ?auto_57197 - SURFACE
      ?auto_57200 - SURFACE
      ?auto_57212 - PLACE
      ?auto_57195 - HOIST
      ?auto_57202 - SURFACE
      ?auto_57208 - SURFACE
      ?auto_57207 - PLACE
      ?auto_57201 - HOIST
      ?auto_57190 - SURFACE
      ?auto_57199 - SURFACE
      ?auto_57188 - PLACE
      ?auto_57211 - HOIST
      ?auto_57203 - SURFACE
      ?auto_57194 - SURFACE
      ?auto_57196 - PLACE
      ?auto_57198 - HOIST
      ?auto_57193 - SURFACE
      ?auto_57204 - SURFACE
      ?auto_57189 - PLACE
      ?auto_57213 - HOIST
      ?auto_57214 - SURFACE
      ?auto_57191 - TRUCK
      ?auto_57206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57210 ?auto_57205 ) ( IS-CRATE ?auto_57186 ) ( not ( = ?auto_57186 ?auto_57187 ) ) ( not ( = ?auto_57209 ?auto_57205 ) ) ( HOIST-AT ?auto_57192 ?auto_57209 ) ( not ( = ?auto_57210 ?auto_57192 ) ) ( AVAILABLE ?auto_57192 ) ( SURFACE-AT ?auto_57186 ?auto_57209 ) ( ON ?auto_57186 ?auto_57197 ) ( CLEAR ?auto_57186 ) ( not ( = ?auto_57186 ?auto_57197 ) ) ( not ( = ?auto_57187 ?auto_57197 ) ) ( IS-CRATE ?auto_57187 ) ( not ( = ?auto_57186 ?auto_57200 ) ) ( not ( = ?auto_57187 ?auto_57200 ) ) ( not ( = ?auto_57197 ?auto_57200 ) ) ( not ( = ?auto_57212 ?auto_57205 ) ) ( not ( = ?auto_57209 ?auto_57212 ) ) ( HOIST-AT ?auto_57195 ?auto_57212 ) ( not ( = ?auto_57210 ?auto_57195 ) ) ( not ( = ?auto_57192 ?auto_57195 ) ) ( AVAILABLE ?auto_57195 ) ( SURFACE-AT ?auto_57187 ?auto_57212 ) ( ON ?auto_57187 ?auto_57202 ) ( CLEAR ?auto_57187 ) ( not ( = ?auto_57186 ?auto_57202 ) ) ( not ( = ?auto_57187 ?auto_57202 ) ) ( not ( = ?auto_57197 ?auto_57202 ) ) ( not ( = ?auto_57200 ?auto_57202 ) ) ( IS-CRATE ?auto_57200 ) ( not ( = ?auto_57186 ?auto_57208 ) ) ( not ( = ?auto_57187 ?auto_57208 ) ) ( not ( = ?auto_57197 ?auto_57208 ) ) ( not ( = ?auto_57200 ?auto_57208 ) ) ( not ( = ?auto_57202 ?auto_57208 ) ) ( not ( = ?auto_57207 ?auto_57205 ) ) ( not ( = ?auto_57209 ?auto_57207 ) ) ( not ( = ?auto_57212 ?auto_57207 ) ) ( HOIST-AT ?auto_57201 ?auto_57207 ) ( not ( = ?auto_57210 ?auto_57201 ) ) ( not ( = ?auto_57192 ?auto_57201 ) ) ( not ( = ?auto_57195 ?auto_57201 ) ) ( AVAILABLE ?auto_57201 ) ( SURFACE-AT ?auto_57200 ?auto_57207 ) ( ON ?auto_57200 ?auto_57190 ) ( CLEAR ?auto_57200 ) ( not ( = ?auto_57186 ?auto_57190 ) ) ( not ( = ?auto_57187 ?auto_57190 ) ) ( not ( = ?auto_57197 ?auto_57190 ) ) ( not ( = ?auto_57200 ?auto_57190 ) ) ( not ( = ?auto_57202 ?auto_57190 ) ) ( not ( = ?auto_57208 ?auto_57190 ) ) ( IS-CRATE ?auto_57208 ) ( not ( = ?auto_57186 ?auto_57199 ) ) ( not ( = ?auto_57187 ?auto_57199 ) ) ( not ( = ?auto_57197 ?auto_57199 ) ) ( not ( = ?auto_57200 ?auto_57199 ) ) ( not ( = ?auto_57202 ?auto_57199 ) ) ( not ( = ?auto_57208 ?auto_57199 ) ) ( not ( = ?auto_57190 ?auto_57199 ) ) ( not ( = ?auto_57188 ?auto_57205 ) ) ( not ( = ?auto_57209 ?auto_57188 ) ) ( not ( = ?auto_57212 ?auto_57188 ) ) ( not ( = ?auto_57207 ?auto_57188 ) ) ( HOIST-AT ?auto_57211 ?auto_57188 ) ( not ( = ?auto_57210 ?auto_57211 ) ) ( not ( = ?auto_57192 ?auto_57211 ) ) ( not ( = ?auto_57195 ?auto_57211 ) ) ( not ( = ?auto_57201 ?auto_57211 ) ) ( AVAILABLE ?auto_57211 ) ( SURFACE-AT ?auto_57208 ?auto_57188 ) ( ON ?auto_57208 ?auto_57203 ) ( CLEAR ?auto_57208 ) ( not ( = ?auto_57186 ?auto_57203 ) ) ( not ( = ?auto_57187 ?auto_57203 ) ) ( not ( = ?auto_57197 ?auto_57203 ) ) ( not ( = ?auto_57200 ?auto_57203 ) ) ( not ( = ?auto_57202 ?auto_57203 ) ) ( not ( = ?auto_57208 ?auto_57203 ) ) ( not ( = ?auto_57190 ?auto_57203 ) ) ( not ( = ?auto_57199 ?auto_57203 ) ) ( IS-CRATE ?auto_57199 ) ( not ( = ?auto_57186 ?auto_57194 ) ) ( not ( = ?auto_57187 ?auto_57194 ) ) ( not ( = ?auto_57197 ?auto_57194 ) ) ( not ( = ?auto_57200 ?auto_57194 ) ) ( not ( = ?auto_57202 ?auto_57194 ) ) ( not ( = ?auto_57208 ?auto_57194 ) ) ( not ( = ?auto_57190 ?auto_57194 ) ) ( not ( = ?auto_57199 ?auto_57194 ) ) ( not ( = ?auto_57203 ?auto_57194 ) ) ( not ( = ?auto_57196 ?auto_57205 ) ) ( not ( = ?auto_57209 ?auto_57196 ) ) ( not ( = ?auto_57212 ?auto_57196 ) ) ( not ( = ?auto_57207 ?auto_57196 ) ) ( not ( = ?auto_57188 ?auto_57196 ) ) ( HOIST-AT ?auto_57198 ?auto_57196 ) ( not ( = ?auto_57210 ?auto_57198 ) ) ( not ( = ?auto_57192 ?auto_57198 ) ) ( not ( = ?auto_57195 ?auto_57198 ) ) ( not ( = ?auto_57201 ?auto_57198 ) ) ( not ( = ?auto_57211 ?auto_57198 ) ) ( AVAILABLE ?auto_57198 ) ( SURFACE-AT ?auto_57199 ?auto_57196 ) ( ON ?auto_57199 ?auto_57193 ) ( CLEAR ?auto_57199 ) ( not ( = ?auto_57186 ?auto_57193 ) ) ( not ( = ?auto_57187 ?auto_57193 ) ) ( not ( = ?auto_57197 ?auto_57193 ) ) ( not ( = ?auto_57200 ?auto_57193 ) ) ( not ( = ?auto_57202 ?auto_57193 ) ) ( not ( = ?auto_57208 ?auto_57193 ) ) ( not ( = ?auto_57190 ?auto_57193 ) ) ( not ( = ?auto_57199 ?auto_57193 ) ) ( not ( = ?auto_57203 ?auto_57193 ) ) ( not ( = ?auto_57194 ?auto_57193 ) ) ( IS-CRATE ?auto_57194 ) ( not ( = ?auto_57186 ?auto_57204 ) ) ( not ( = ?auto_57187 ?auto_57204 ) ) ( not ( = ?auto_57197 ?auto_57204 ) ) ( not ( = ?auto_57200 ?auto_57204 ) ) ( not ( = ?auto_57202 ?auto_57204 ) ) ( not ( = ?auto_57208 ?auto_57204 ) ) ( not ( = ?auto_57190 ?auto_57204 ) ) ( not ( = ?auto_57199 ?auto_57204 ) ) ( not ( = ?auto_57203 ?auto_57204 ) ) ( not ( = ?auto_57194 ?auto_57204 ) ) ( not ( = ?auto_57193 ?auto_57204 ) ) ( not ( = ?auto_57189 ?auto_57205 ) ) ( not ( = ?auto_57209 ?auto_57189 ) ) ( not ( = ?auto_57212 ?auto_57189 ) ) ( not ( = ?auto_57207 ?auto_57189 ) ) ( not ( = ?auto_57188 ?auto_57189 ) ) ( not ( = ?auto_57196 ?auto_57189 ) ) ( HOIST-AT ?auto_57213 ?auto_57189 ) ( not ( = ?auto_57210 ?auto_57213 ) ) ( not ( = ?auto_57192 ?auto_57213 ) ) ( not ( = ?auto_57195 ?auto_57213 ) ) ( not ( = ?auto_57201 ?auto_57213 ) ) ( not ( = ?auto_57211 ?auto_57213 ) ) ( not ( = ?auto_57198 ?auto_57213 ) ) ( AVAILABLE ?auto_57213 ) ( SURFACE-AT ?auto_57194 ?auto_57189 ) ( ON ?auto_57194 ?auto_57214 ) ( CLEAR ?auto_57194 ) ( not ( = ?auto_57186 ?auto_57214 ) ) ( not ( = ?auto_57187 ?auto_57214 ) ) ( not ( = ?auto_57197 ?auto_57214 ) ) ( not ( = ?auto_57200 ?auto_57214 ) ) ( not ( = ?auto_57202 ?auto_57214 ) ) ( not ( = ?auto_57208 ?auto_57214 ) ) ( not ( = ?auto_57190 ?auto_57214 ) ) ( not ( = ?auto_57199 ?auto_57214 ) ) ( not ( = ?auto_57203 ?auto_57214 ) ) ( not ( = ?auto_57194 ?auto_57214 ) ) ( not ( = ?auto_57193 ?auto_57214 ) ) ( not ( = ?auto_57204 ?auto_57214 ) ) ( TRUCK-AT ?auto_57191 ?auto_57205 ) ( SURFACE-AT ?auto_57206 ?auto_57205 ) ( CLEAR ?auto_57206 ) ( IS-CRATE ?auto_57204 ) ( not ( = ?auto_57186 ?auto_57206 ) ) ( not ( = ?auto_57187 ?auto_57206 ) ) ( not ( = ?auto_57197 ?auto_57206 ) ) ( not ( = ?auto_57200 ?auto_57206 ) ) ( not ( = ?auto_57202 ?auto_57206 ) ) ( not ( = ?auto_57208 ?auto_57206 ) ) ( not ( = ?auto_57190 ?auto_57206 ) ) ( not ( = ?auto_57199 ?auto_57206 ) ) ( not ( = ?auto_57203 ?auto_57206 ) ) ( not ( = ?auto_57194 ?auto_57206 ) ) ( not ( = ?auto_57193 ?auto_57206 ) ) ( not ( = ?auto_57204 ?auto_57206 ) ) ( not ( = ?auto_57214 ?auto_57206 ) ) ( AVAILABLE ?auto_57210 ) ( IN ?auto_57204 ?auto_57191 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57210 ?auto_57204 ?auto_57191 ?auto_57205 )
      ( MAKE-ON ?auto_57186 ?auto_57187 )
      ( MAKE-ON-VERIFY ?auto_57186 ?auto_57187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57215 - SURFACE
      ?auto_57216 - SURFACE
    )
    :vars
    (
      ?auto_57226 - HOIST
      ?auto_57217 - PLACE
      ?auto_57225 - PLACE
      ?auto_57228 - HOIST
      ?auto_57221 - SURFACE
      ?auto_57237 - SURFACE
      ?auto_57232 - PLACE
      ?auto_57239 - HOIST
      ?auto_57236 - SURFACE
      ?auto_57224 - SURFACE
      ?auto_57223 - PLACE
      ?auto_57234 - HOIST
      ?auto_57243 - SURFACE
      ?auto_57231 - SURFACE
      ?auto_57235 - PLACE
      ?auto_57219 - HOIST
      ?auto_57227 - SURFACE
      ?auto_57242 - SURFACE
      ?auto_57229 - PLACE
      ?auto_57222 - HOIST
      ?auto_57238 - SURFACE
      ?auto_57218 - SURFACE
      ?auto_57233 - PLACE
      ?auto_57240 - HOIST
      ?auto_57241 - SURFACE
      ?auto_57220 - SURFACE
      ?auto_57230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57226 ?auto_57217 ) ( IS-CRATE ?auto_57215 ) ( not ( = ?auto_57215 ?auto_57216 ) ) ( not ( = ?auto_57225 ?auto_57217 ) ) ( HOIST-AT ?auto_57228 ?auto_57225 ) ( not ( = ?auto_57226 ?auto_57228 ) ) ( AVAILABLE ?auto_57228 ) ( SURFACE-AT ?auto_57215 ?auto_57225 ) ( ON ?auto_57215 ?auto_57221 ) ( CLEAR ?auto_57215 ) ( not ( = ?auto_57215 ?auto_57221 ) ) ( not ( = ?auto_57216 ?auto_57221 ) ) ( IS-CRATE ?auto_57216 ) ( not ( = ?auto_57215 ?auto_57237 ) ) ( not ( = ?auto_57216 ?auto_57237 ) ) ( not ( = ?auto_57221 ?auto_57237 ) ) ( not ( = ?auto_57232 ?auto_57217 ) ) ( not ( = ?auto_57225 ?auto_57232 ) ) ( HOIST-AT ?auto_57239 ?auto_57232 ) ( not ( = ?auto_57226 ?auto_57239 ) ) ( not ( = ?auto_57228 ?auto_57239 ) ) ( AVAILABLE ?auto_57239 ) ( SURFACE-AT ?auto_57216 ?auto_57232 ) ( ON ?auto_57216 ?auto_57236 ) ( CLEAR ?auto_57216 ) ( not ( = ?auto_57215 ?auto_57236 ) ) ( not ( = ?auto_57216 ?auto_57236 ) ) ( not ( = ?auto_57221 ?auto_57236 ) ) ( not ( = ?auto_57237 ?auto_57236 ) ) ( IS-CRATE ?auto_57237 ) ( not ( = ?auto_57215 ?auto_57224 ) ) ( not ( = ?auto_57216 ?auto_57224 ) ) ( not ( = ?auto_57221 ?auto_57224 ) ) ( not ( = ?auto_57237 ?auto_57224 ) ) ( not ( = ?auto_57236 ?auto_57224 ) ) ( not ( = ?auto_57223 ?auto_57217 ) ) ( not ( = ?auto_57225 ?auto_57223 ) ) ( not ( = ?auto_57232 ?auto_57223 ) ) ( HOIST-AT ?auto_57234 ?auto_57223 ) ( not ( = ?auto_57226 ?auto_57234 ) ) ( not ( = ?auto_57228 ?auto_57234 ) ) ( not ( = ?auto_57239 ?auto_57234 ) ) ( AVAILABLE ?auto_57234 ) ( SURFACE-AT ?auto_57237 ?auto_57223 ) ( ON ?auto_57237 ?auto_57243 ) ( CLEAR ?auto_57237 ) ( not ( = ?auto_57215 ?auto_57243 ) ) ( not ( = ?auto_57216 ?auto_57243 ) ) ( not ( = ?auto_57221 ?auto_57243 ) ) ( not ( = ?auto_57237 ?auto_57243 ) ) ( not ( = ?auto_57236 ?auto_57243 ) ) ( not ( = ?auto_57224 ?auto_57243 ) ) ( IS-CRATE ?auto_57224 ) ( not ( = ?auto_57215 ?auto_57231 ) ) ( not ( = ?auto_57216 ?auto_57231 ) ) ( not ( = ?auto_57221 ?auto_57231 ) ) ( not ( = ?auto_57237 ?auto_57231 ) ) ( not ( = ?auto_57236 ?auto_57231 ) ) ( not ( = ?auto_57224 ?auto_57231 ) ) ( not ( = ?auto_57243 ?auto_57231 ) ) ( not ( = ?auto_57235 ?auto_57217 ) ) ( not ( = ?auto_57225 ?auto_57235 ) ) ( not ( = ?auto_57232 ?auto_57235 ) ) ( not ( = ?auto_57223 ?auto_57235 ) ) ( HOIST-AT ?auto_57219 ?auto_57235 ) ( not ( = ?auto_57226 ?auto_57219 ) ) ( not ( = ?auto_57228 ?auto_57219 ) ) ( not ( = ?auto_57239 ?auto_57219 ) ) ( not ( = ?auto_57234 ?auto_57219 ) ) ( AVAILABLE ?auto_57219 ) ( SURFACE-AT ?auto_57224 ?auto_57235 ) ( ON ?auto_57224 ?auto_57227 ) ( CLEAR ?auto_57224 ) ( not ( = ?auto_57215 ?auto_57227 ) ) ( not ( = ?auto_57216 ?auto_57227 ) ) ( not ( = ?auto_57221 ?auto_57227 ) ) ( not ( = ?auto_57237 ?auto_57227 ) ) ( not ( = ?auto_57236 ?auto_57227 ) ) ( not ( = ?auto_57224 ?auto_57227 ) ) ( not ( = ?auto_57243 ?auto_57227 ) ) ( not ( = ?auto_57231 ?auto_57227 ) ) ( IS-CRATE ?auto_57231 ) ( not ( = ?auto_57215 ?auto_57242 ) ) ( not ( = ?auto_57216 ?auto_57242 ) ) ( not ( = ?auto_57221 ?auto_57242 ) ) ( not ( = ?auto_57237 ?auto_57242 ) ) ( not ( = ?auto_57236 ?auto_57242 ) ) ( not ( = ?auto_57224 ?auto_57242 ) ) ( not ( = ?auto_57243 ?auto_57242 ) ) ( not ( = ?auto_57231 ?auto_57242 ) ) ( not ( = ?auto_57227 ?auto_57242 ) ) ( not ( = ?auto_57229 ?auto_57217 ) ) ( not ( = ?auto_57225 ?auto_57229 ) ) ( not ( = ?auto_57232 ?auto_57229 ) ) ( not ( = ?auto_57223 ?auto_57229 ) ) ( not ( = ?auto_57235 ?auto_57229 ) ) ( HOIST-AT ?auto_57222 ?auto_57229 ) ( not ( = ?auto_57226 ?auto_57222 ) ) ( not ( = ?auto_57228 ?auto_57222 ) ) ( not ( = ?auto_57239 ?auto_57222 ) ) ( not ( = ?auto_57234 ?auto_57222 ) ) ( not ( = ?auto_57219 ?auto_57222 ) ) ( AVAILABLE ?auto_57222 ) ( SURFACE-AT ?auto_57231 ?auto_57229 ) ( ON ?auto_57231 ?auto_57238 ) ( CLEAR ?auto_57231 ) ( not ( = ?auto_57215 ?auto_57238 ) ) ( not ( = ?auto_57216 ?auto_57238 ) ) ( not ( = ?auto_57221 ?auto_57238 ) ) ( not ( = ?auto_57237 ?auto_57238 ) ) ( not ( = ?auto_57236 ?auto_57238 ) ) ( not ( = ?auto_57224 ?auto_57238 ) ) ( not ( = ?auto_57243 ?auto_57238 ) ) ( not ( = ?auto_57231 ?auto_57238 ) ) ( not ( = ?auto_57227 ?auto_57238 ) ) ( not ( = ?auto_57242 ?auto_57238 ) ) ( IS-CRATE ?auto_57242 ) ( not ( = ?auto_57215 ?auto_57218 ) ) ( not ( = ?auto_57216 ?auto_57218 ) ) ( not ( = ?auto_57221 ?auto_57218 ) ) ( not ( = ?auto_57237 ?auto_57218 ) ) ( not ( = ?auto_57236 ?auto_57218 ) ) ( not ( = ?auto_57224 ?auto_57218 ) ) ( not ( = ?auto_57243 ?auto_57218 ) ) ( not ( = ?auto_57231 ?auto_57218 ) ) ( not ( = ?auto_57227 ?auto_57218 ) ) ( not ( = ?auto_57242 ?auto_57218 ) ) ( not ( = ?auto_57238 ?auto_57218 ) ) ( not ( = ?auto_57233 ?auto_57217 ) ) ( not ( = ?auto_57225 ?auto_57233 ) ) ( not ( = ?auto_57232 ?auto_57233 ) ) ( not ( = ?auto_57223 ?auto_57233 ) ) ( not ( = ?auto_57235 ?auto_57233 ) ) ( not ( = ?auto_57229 ?auto_57233 ) ) ( HOIST-AT ?auto_57240 ?auto_57233 ) ( not ( = ?auto_57226 ?auto_57240 ) ) ( not ( = ?auto_57228 ?auto_57240 ) ) ( not ( = ?auto_57239 ?auto_57240 ) ) ( not ( = ?auto_57234 ?auto_57240 ) ) ( not ( = ?auto_57219 ?auto_57240 ) ) ( not ( = ?auto_57222 ?auto_57240 ) ) ( AVAILABLE ?auto_57240 ) ( SURFACE-AT ?auto_57242 ?auto_57233 ) ( ON ?auto_57242 ?auto_57241 ) ( CLEAR ?auto_57242 ) ( not ( = ?auto_57215 ?auto_57241 ) ) ( not ( = ?auto_57216 ?auto_57241 ) ) ( not ( = ?auto_57221 ?auto_57241 ) ) ( not ( = ?auto_57237 ?auto_57241 ) ) ( not ( = ?auto_57236 ?auto_57241 ) ) ( not ( = ?auto_57224 ?auto_57241 ) ) ( not ( = ?auto_57243 ?auto_57241 ) ) ( not ( = ?auto_57231 ?auto_57241 ) ) ( not ( = ?auto_57227 ?auto_57241 ) ) ( not ( = ?auto_57242 ?auto_57241 ) ) ( not ( = ?auto_57238 ?auto_57241 ) ) ( not ( = ?auto_57218 ?auto_57241 ) ) ( SURFACE-AT ?auto_57220 ?auto_57217 ) ( CLEAR ?auto_57220 ) ( IS-CRATE ?auto_57218 ) ( not ( = ?auto_57215 ?auto_57220 ) ) ( not ( = ?auto_57216 ?auto_57220 ) ) ( not ( = ?auto_57221 ?auto_57220 ) ) ( not ( = ?auto_57237 ?auto_57220 ) ) ( not ( = ?auto_57236 ?auto_57220 ) ) ( not ( = ?auto_57224 ?auto_57220 ) ) ( not ( = ?auto_57243 ?auto_57220 ) ) ( not ( = ?auto_57231 ?auto_57220 ) ) ( not ( = ?auto_57227 ?auto_57220 ) ) ( not ( = ?auto_57242 ?auto_57220 ) ) ( not ( = ?auto_57238 ?auto_57220 ) ) ( not ( = ?auto_57218 ?auto_57220 ) ) ( not ( = ?auto_57241 ?auto_57220 ) ) ( AVAILABLE ?auto_57226 ) ( IN ?auto_57218 ?auto_57230 ) ( TRUCK-AT ?auto_57230 ?auto_57233 ) )
    :subtasks
    ( ( !DRIVE ?auto_57230 ?auto_57233 ?auto_57217 )
      ( MAKE-ON ?auto_57215 ?auto_57216 )
      ( MAKE-ON-VERIFY ?auto_57215 ?auto_57216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57244 - SURFACE
      ?auto_57245 - SURFACE
    )
    :vars
    (
      ?auto_57246 - HOIST
      ?auto_57270 - PLACE
      ?auto_57251 - PLACE
      ?auto_57253 - HOIST
      ?auto_57264 - SURFACE
      ?auto_57265 - SURFACE
      ?auto_57269 - PLACE
      ?auto_57268 - HOIST
      ?auto_57266 - SURFACE
      ?auto_57271 - SURFACE
      ?auto_57260 - PLACE
      ?auto_57256 - HOIST
      ?auto_57262 - SURFACE
      ?auto_57259 - SURFACE
      ?auto_57257 - PLACE
      ?auto_57247 - HOIST
      ?auto_57250 - SURFACE
      ?auto_57263 - SURFACE
      ?auto_57248 - PLACE
      ?auto_57252 - HOIST
      ?auto_57267 - SURFACE
      ?auto_57258 - SURFACE
      ?auto_57255 - PLACE
      ?auto_57254 - HOIST
      ?auto_57261 - SURFACE
      ?auto_57249 - SURFACE
      ?auto_57272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57246 ?auto_57270 ) ( IS-CRATE ?auto_57244 ) ( not ( = ?auto_57244 ?auto_57245 ) ) ( not ( = ?auto_57251 ?auto_57270 ) ) ( HOIST-AT ?auto_57253 ?auto_57251 ) ( not ( = ?auto_57246 ?auto_57253 ) ) ( AVAILABLE ?auto_57253 ) ( SURFACE-AT ?auto_57244 ?auto_57251 ) ( ON ?auto_57244 ?auto_57264 ) ( CLEAR ?auto_57244 ) ( not ( = ?auto_57244 ?auto_57264 ) ) ( not ( = ?auto_57245 ?auto_57264 ) ) ( IS-CRATE ?auto_57245 ) ( not ( = ?auto_57244 ?auto_57265 ) ) ( not ( = ?auto_57245 ?auto_57265 ) ) ( not ( = ?auto_57264 ?auto_57265 ) ) ( not ( = ?auto_57269 ?auto_57270 ) ) ( not ( = ?auto_57251 ?auto_57269 ) ) ( HOIST-AT ?auto_57268 ?auto_57269 ) ( not ( = ?auto_57246 ?auto_57268 ) ) ( not ( = ?auto_57253 ?auto_57268 ) ) ( AVAILABLE ?auto_57268 ) ( SURFACE-AT ?auto_57245 ?auto_57269 ) ( ON ?auto_57245 ?auto_57266 ) ( CLEAR ?auto_57245 ) ( not ( = ?auto_57244 ?auto_57266 ) ) ( not ( = ?auto_57245 ?auto_57266 ) ) ( not ( = ?auto_57264 ?auto_57266 ) ) ( not ( = ?auto_57265 ?auto_57266 ) ) ( IS-CRATE ?auto_57265 ) ( not ( = ?auto_57244 ?auto_57271 ) ) ( not ( = ?auto_57245 ?auto_57271 ) ) ( not ( = ?auto_57264 ?auto_57271 ) ) ( not ( = ?auto_57265 ?auto_57271 ) ) ( not ( = ?auto_57266 ?auto_57271 ) ) ( not ( = ?auto_57260 ?auto_57270 ) ) ( not ( = ?auto_57251 ?auto_57260 ) ) ( not ( = ?auto_57269 ?auto_57260 ) ) ( HOIST-AT ?auto_57256 ?auto_57260 ) ( not ( = ?auto_57246 ?auto_57256 ) ) ( not ( = ?auto_57253 ?auto_57256 ) ) ( not ( = ?auto_57268 ?auto_57256 ) ) ( AVAILABLE ?auto_57256 ) ( SURFACE-AT ?auto_57265 ?auto_57260 ) ( ON ?auto_57265 ?auto_57262 ) ( CLEAR ?auto_57265 ) ( not ( = ?auto_57244 ?auto_57262 ) ) ( not ( = ?auto_57245 ?auto_57262 ) ) ( not ( = ?auto_57264 ?auto_57262 ) ) ( not ( = ?auto_57265 ?auto_57262 ) ) ( not ( = ?auto_57266 ?auto_57262 ) ) ( not ( = ?auto_57271 ?auto_57262 ) ) ( IS-CRATE ?auto_57271 ) ( not ( = ?auto_57244 ?auto_57259 ) ) ( not ( = ?auto_57245 ?auto_57259 ) ) ( not ( = ?auto_57264 ?auto_57259 ) ) ( not ( = ?auto_57265 ?auto_57259 ) ) ( not ( = ?auto_57266 ?auto_57259 ) ) ( not ( = ?auto_57271 ?auto_57259 ) ) ( not ( = ?auto_57262 ?auto_57259 ) ) ( not ( = ?auto_57257 ?auto_57270 ) ) ( not ( = ?auto_57251 ?auto_57257 ) ) ( not ( = ?auto_57269 ?auto_57257 ) ) ( not ( = ?auto_57260 ?auto_57257 ) ) ( HOIST-AT ?auto_57247 ?auto_57257 ) ( not ( = ?auto_57246 ?auto_57247 ) ) ( not ( = ?auto_57253 ?auto_57247 ) ) ( not ( = ?auto_57268 ?auto_57247 ) ) ( not ( = ?auto_57256 ?auto_57247 ) ) ( AVAILABLE ?auto_57247 ) ( SURFACE-AT ?auto_57271 ?auto_57257 ) ( ON ?auto_57271 ?auto_57250 ) ( CLEAR ?auto_57271 ) ( not ( = ?auto_57244 ?auto_57250 ) ) ( not ( = ?auto_57245 ?auto_57250 ) ) ( not ( = ?auto_57264 ?auto_57250 ) ) ( not ( = ?auto_57265 ?auto_57250 ) ) ( not ( = ?auto_57266 ?auto_57250 ) ) ( not ( = ?auto_57271 ?auto_57250 ) ) ( not ( = ?auto_57262 ?auto_57250 ) ) ( not ( = ?auto_57259 ?auto_57250 ) ) ( IS-CRATE ?auto_57259 ) ( not ( = ?auto_57244 ?auto_57263 ) ) ( not ( = ?auto_57245 ?auto_57263 ) ) ( not ( = ?auto_57264 ?auto_57263 ) ) ( not ( = ?auto_57265 ?auto_57263 ) ) ( not ( = ?auto_57266 ?auto_57263 ) ) ( not ( = ?auto_57271 ?auto_57263 ) ) ( not ( = ?auto_57262 ?auto_57263 ) ) ( not ( = ?auto_57259 ?auto_57263 ) ) ( not ( = ?auto_57250 ?auto_57263 ) ) ( not ( = ?auto_57248 ?auto_57270 ) ) ( not ( = ?auto_57251 ?auto_57248 ) ) ( not ( = ?auto_57269 ?auto_57248 ) ) ( not ( = ?auto_57260 ?auto_57248 ) ) ( not ( = ?auto_57257 ?auto_57248 ) ) ( HOIST-AT ?auto_57252 ?auto_57248 ) ( not ( = ?auto_57246 ?auto_57252 ) ) ( not ( = ?auto_57253 ?auto_57252 ) ) ( not ( = ?auto_57268 ?auto_57252 ) ) ( not ( = ?auto_57256 ?auto_57252 ) ) ( not ( = ?auto_57247 ?auto_57252 ) ) ( AVAILABLE ?auto_57252 ) ( SURFACE-AT ?auto_57259 ?auto_57248 ) ( ON ?auto_57259 ?auto_57267 ) ( CLEAR ?auto_57259 ) ( not ( = ?auto_57244 ?auto_57267 ) ) ( not ( = ?auto_57245 ?auto_57267 ) ) ( not ( = ?auto_57264 ?auto_57267 ) ) ( not ( = ?auto_57265 ?auto_57267 ) ) ( not ( = ?auto_57266 ?auto_57267 ) ) ( not ( = ?auto_57271 ?auto_57267 ) ) ( not ( = ?auto_57262 ?auto_57267 ) ) ( not ( = ?auto_57259 ?auto_57267 ) ) ( not ( = ?auto_57250 ?auto_57267 ) ) ( not ( = ?auto_57263 ?auto_57267 ) ) ( IS-CRATE ?auto_57263 ) ( not ( = ?auto_57244 ?auto_57258 ) ) ( not ( = ?auto_57245 ?auto_57258 ) ) ( not ( = ?auto_57264 ?auto_57258 ) ) ( not ( = ?auto_57265 ?auto_57258 ) ) ( not ( = ?auto_57266 ?auto_57258 ) ) ( not ( = ?auto_57271 ?auto_57258 ) ) ( not ( = ?auto_57262 ?auto_57258 ) ) ( not ( = ?auto_57259 ?auto_57258 ) ) ( not ( = ?auto_57250 ?auto_57258 ) ) ( not ( = ?auto_57263 ?auto_57258 ) ) ( not ( = ?auto_57267 ?auto_57258 ) ) ( not ( = ?auto_57255 ?auto_57270 ) ) ( not ( = ?auto_57251 ?auto_57255 ) ) ( not ( = ?auto_57269 ?auto_57255 ) ) ( not ( = ?auto_57260 ?auto_57255 ) ) ( not ( = ?auto_57257 ?auto_57255 ) ) ( not ( = ?auto_57248 ?auto_57255 ) ) ( HOIST-AT ?auto_57254 ?auto_57255 ) ( not ( = ?auto_57246 ?auto_57254 ) ) ( not ( = ?auto_57253 ?auto_57254 ) ) ( not ( = ?auto_57268 ?auto_57254 ) ) ( not ( = ?auto_57256 ?auto_57254 ) ) ( not ( = ?auto_57247 ?auto_57254 ) ) ( not ( = ?auto_57252 ?auto_57254 ) ) ( SURFACE-AT ?auto_57263 ?auto_57255 ) ( ON ?auto_57263 ?auto_57261 ) ( CLEAR ?auto_57263 ) ( not ( = ?auto_57244 ?auto_57261 ) ) ( not ( = ?auto_57245 ?auto_57261 ) ) ( not ( = ?auto_57264 ?auto_57261 ) ) ( not ( = ?auto_57265 ?auto_57261 ) ) ( not ( = ?auto_57266 ?auto_57261 ) ) ( not ( = ?auto_57271 ?auto_57261 ) ) ( not ( = ?auto_57262 ?auto_57261 ) ) ( not ( = ?auto_57259 ?auto_57261 ) ) ( not ( = ?auto_57250 ?auto_57261 ) ) ( not ( = ?auto_57263 ?auto_57261 ) ) ( not ( = ?auto_57267 ?auto_57261 ) ) ( not ( = ?auto_57258 ?auto_57261 ) ) ( SURFACE-AT ?auto_57249 ?auto_57270 ) ( CLEAR ?auto_57249 ) ( IS-CRATE ?auto_57258 ) ( not ( = ?auto_57244 ?auto_57249 ) ) ( not ( = ?auto_57245 ?auto_57249 ) ) ( not ( = ?auto_57264 ?auto_57249 ) ) ( not ( = ?auto_57265 ?auto_57249 ) ) ( not ( = ?auto_57266 ?auto_57249 ) ) ( not ( = ?auto_57271 ?auto_57249 ) ) ( not ( = ?auto_57262 ?auto_57249 ) ) ( not ( = ?auto_57259 ?auto_57249 ) ) ( not ( = ?auto_57250 ?auto_57249 ) ) ( not ( = ?auto_57263 ?auto_57249 ) ) ( not ( = ?auto_57267 ?auto_57249 ) ) ( not ( = ?auto_57258 ?auto_57249 ) ) ( not ( = ?auto_57261 ?auto_57249 ) ) ( AVAILABLE ?auto_57246 ) ( TRUCK-AT ?auto_57272 ?auto_57255 ) ( LIFTING ?auto_57254 ?auto_57258 ) )
    :subtasks
    ( ( !LOAD ?auto_57254 ?auto_57258 ?auto_57272 ?auto_57255 )
      ( MAKE-ON ?auto_57244 ?auto_57245 )
      ( MAKE-ON-VERIFY ?auto_57244 ?auto_57245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57273 - SURFACE
      ?auto_57274 - SURFACE
    )
    :vars
    (
      ?auto_57296 - HOIST
      ?auto_57290 - PLACE
      ?auto_57277 - PLACE
      ?auto_57297 - HOIST
      ?auto_57295 - SURFACE
      ?auto_57287 - SURFACE
      ?auto_57294 - PLACE
      ?auto_57300 - HOIST
      ?auto_57293 - SURFACE
      ?auto_57289 - SURFACE
      ?auto_57275 - PLACE
      ?auto_57276 - HOIST
      ?auto_57286 - SURFACE
      ?auto_57281 - SURFACE
      ?auto_57279 - PLACE
      ?auto_57278 - HOIST
      ?auto_57280 - SURFACE
      ?auto_57285 - SURFACE
      ?auto_57298 - PLACE
      ?auto_57288 - HOIST
      ?auto_57299 - SURFACE
      ?auto_57283 - SURFACE
      ?auto_57284 - PLACE
      ?auto_57292 - HOIST
      ?auto_57301 - SURFACE
      ?auto_57282 - SURFACE
      ?auto_57291 - TRUCK
      ?auto_57302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57296 ?auto_57290 ) ( IS-CRATE ?auto_57273 ) ( not ( = ?auto_57273 ?auto_57274 ) ) ( not ( = ?auto_57277 ?auto_57290 ) ) ( HOIST-AT ?auto_57297 ?auto_57277 ) ( not ( = ?auto_57296 ?auto_57297 ) ) ( AVAILABLE ?auto_57297 ) ( SURFACE-AT ?auto_57273 ?auto_57277 ) ( ON ?auto_57273 ?auto_57295 ) ( CLEAR ?auto_57273 ) ( not ( = ?auto_57273 ?auto_57295 ) ) ( not ( = ?auto_57274 ?auto_57295 ) ) ( IS-CRATE ?auto_57274 ) ( not ( = ?auto_57273 ?auto_57287 ) ) ( not ( = ?auto_57274 ?auto_57287 ) ) ( not ( = ?auto_57295 ?auto_57287 ) ) ( not ( = ?auto_57294 ?auto_57290 ) ) ( not ( = ?auto_57277 ?auto_57294 ) ) ( HOIST-AT ?auto_57300 ?auto_57294 ) ( not ( = ?auto_57296 ?auto_57300 ) ) ( not ( = ?auto_57297 ?auto_57300 ) ) ( AVAILABLE ?auto_57300 ) ( SURFACE-AT ?auto_57274 ?auto_57294 ) ( ON ?auto_57274 ?auto_57293 ) ( CLEAR ?auto_57274 ) ( not ( = ?auto_57273 ?auto_57293 ) ) ( not ( = ?auto_57274 ?auto_57293 ) ) ( not ( = ?auto_57295 ?auto_57293 ) ) ( not ( = ?auto_57287 ?auto_57293 ) ) ( IS-CRATE ?auto_57287 ) ( not ( = ?auto_57273 ?auto_57289 ) ) ( not ( = ?auto_57274 ?auto_57289 ) ) ( not ( = ?auto_57295 ?auto_57289 ) ) ( not ( = ?auto_57287 ?auto_57289 ) ) ( not ( = ?auto_57293 ?auto_57289 ) ) ( not ( = ?auto_57275 ?auto_57290 ) ) ( not ( = ?auto_57277 ?auto_57275 ) ) ( not ( = ?auto_57294 ?auto_57275 ) ) ( HOIST-AT ?auto_57276 ?auto_57275 ) ( not ( = ?auto_57296 ?auto_57276 ) ) ( not ( = ?auto_57297 ?auto_57276 ) ) ( not ( = ?auto_57300 ?auto_57276 ) ) ( AVAILABLE ?auto_57276 ) ( SURFACE-AT ?auto_57287 ?auto_57275 ) ( ON ?auto_57287 ?auto_57286 ) ( CLEAR ?auto_57287 ) ( not ( = ?auto_57273 ?auto_57286 ) ) ( not ( = ?auto_57274 ?auto_57286 ) ) ( not ( = ?auto_57295 ?auto_57286 ) ) ( not ( = ?auto_57287 ?auto_57286 ) ) ( not ( = ?auto_57293 ?auto_57286 ) ) ( not ( = ?auto_57289 ?auto_57286 ) ) ( IS-CRATE ?auto_57289 ) ( not ( = ?auto_57273 ?auto_57281 ) ) ( not ( = ?auto_57274 ?auto_57281 ) ) ( not ( = ?auto_57295 ?auto_57281 ) ) ( not ( = ?auto_57287 ?auto_57281 ) ) ( not ( = ?auto_57293 ?auto_57281 ) ) ( not ( = ?auto_57289 ?auto_57281 ) ) ( not ( = ?auto_57286 ?auto_57281 ) ) ( not ( = ?auto_57279 ?auto_57290 ) ) ( not ( = ?auto_57277 ?auto_57279 ) ) ( not ( = ?auto_57294 ?auto_57279 ) ) ( not ( = ?auto_57275 ?auto_57279 ) ) ( HOIST-AT ?auto_57278 ?auto_57279 ) ( not ( = ?auto_57296 ?auto_57278 ) ) ( not ( = ?auto_57297 ?auto_57278 ) ) ( not ( = ?auto_57300 ?auto_57278 ) ) ( not ( = ?auto_57276 ?auto_57278 ) ) ( AVAILABLE ?auto_57278 ) ( SURFACE-AT ?auto_57289 ?auto_57279 ) ( ON ?auto_57289 ?auto_57280 ) ( CLEAR ?auto_57289 ) ( not ( = ?auto_57273 ?auto_57280 ) ) ( not ( = ?auto_57274 ?auto_57280 ) ) ( not ( = ?auto_57295 ?auto_57280 ) ) ( not ( = ?auto_57287 ?auto_57280 ) ) ( not ( = ?auto_57293 ?auto_57280 ) ) ( not ( = ?auto_57289 ?auto_57280 ) ) ( not ( = ?auto_57286 ?auto_57280 ) ) ( not ( = ?auto_57281 ?auto_57280 ) ) ( IS-CRATE ?auto_57281 ) ( not ( = ?auto_57273 ?auto_57285 ) ) ( not ( = ?auto_57274 ?auto_57285 ) ) ( not ( = ?auto_57295 ?auto_57285 ) ) ( not ( = ?auto_57287 ?auto_57285 ) ) ( not ( = ?auto_57293 ?auto_57285 ) ) ( not ( = ?auto_57289 ?auto_57285 ) ) ( not ( = ?auto_57286 ?auto_57285 ) ) ( not ( = ?auto_57281 ?auto_57285 ) ) ( not ( = ?auto_57280 ?auto_57285 ) ) ( not ( = ?auto_57298 ?auto_57290 ) ) ( not ( = ?auto_57277 ?auto_57298 ) ) ( not ( = ?auto_57294 ?auto_57298 ) ) ( not ( = ?auto_57275 ?auto_57298 ) ) ( not ( = ?auto_57279 ?auto_57298 ) ) ( HOIST-AT ?auto_57288 ?auto_57298 ) ( not ( = ?auto_57296 ?auto_57288 ) ) ( not ( = ?auto_57297 ?auto_57288 ) ) ( not ( = ?auto_57300 ?auto_57288 ) ) ( not ( = ?auto_57276 ?auto_57288 ) ) ( not ( = ?auto_57278 ?auto_57288 ) ) ( AVAILABLE ?auto_57288 ) ( SURFACE-AT ?auto_57281 ?auto_57298 ) ( ON ?auto_57281 ?auto_57299 ) ( CLEAR ?auto_57281 ) ( not ( = ?auto_57273 ?auto_57299 ) ) ( not ( = ?auto_57274 ?auto_57299 ) ) ( not ( = ?auto_57295 ?auto_57299 ) ) ( not ( = ?auto_57287 ?auto_57299 ) ) ( not ( = ?auto_57293 ?auto_57299 ) ) ( not ( = ?auto_57289 ?auto_57299 ) ) ( not ( = ?auto_57286 ?auto_57299 ) ) ( not ( = ?auto_57281 ?auto_57299 ) ) ( not ( = ?auto_57280 ?auto_57299 ) ) ( not ( = ?auto_57285 ?auto_57299 ) ) ( IS-CRATE ?auto_57285 ) ( not ( = ?auto_57273 ?auto_57283 ) ) ( not ( = ?auto_57274 ?auto_57283 ) ) ( not ( = ?auto_57295 ?auto_57283 ) ) ( not ( = ?auto_57287 ?auto_57283 ) ) ( not ( = ?auto_57293 ?auto_57283 ) ) ( not ( = ?auto_57289 ?auto_57283 ) ) ( not ( = ?auto_57286 ?auto_57283 ) ) ( not ( = ?auto_57281 ?auto_57283 ) ) ( not ( = ?auto_57280 ?auto_57283 ) ) ( not ( = ?auto_57285 ?auto_57283 ) ) ( not ( = ?auto_57299 ?auto_57283 ) ) ( not ( = ?auto_57284 ?auto_57290 ) ) ( not ( = ?auto_57277 ?auto_57284 ) ) ( not ( = ?auto_57294 ?auto_57284 ) ) ( not ( = ?auto_57275 ?auto_57284 ) ) ( not ( = ?auto_57279 ?auto_57284 ) ) ( not ( = ?auto_57298 ?auto_57284 ) ) ( HOIST-AT ?auto_57292 ?auto_57284 ) ( not ( = ?auto_57296 ?auto_57292 ) ) ( not ( = ?auto_57297 ?auto_57292 ) ) ( not ( = ?auto_57300 ?auto_57292 ) ) ( not ( = ?auto_57276 ?auto_57292 ) ) ( not ( = ?auto_57278 ?auto_57292 ) ) ( not ( = ?auto_57288 ?auto_57292 ) ) ( SURFACE-AT ?auto_57285 ?auto_57284 ) ( ON ?auto_57285 ?auto_57301 ) ( CLEAR ?auto_57285 ) ( not ( = ?auto_57273 ?auto_57301 ) ) ( not ( = ?auto_57274 ?auto_57301 ) ) ( not ( = ?auto_57295 ?auto_57301 ) ) ( not ( = ?auto_57287 ?auto_57301 ) ) ( not ( = ?auto_57293 ?auto_57301 ) ) ( not ( = ?auto_57289 ?auto_57301 ) ) ( not ( = ?auto_57286 ?auto_57301 ) ) ( not ( = ?auto_57281 ?auto_57301 ) ) ( not ( = ?auto_57280 ?auto_57301 ) ) ( not ( = ?auto_57285 ?auto_57301 ) ) ( not ( = ?auto_57299 ?auto_57301 ) ) ( not ( = ?auto_57283 ?auto_57301 ) ) ( SURFACE-AT ?auto_57282 ?auto_57290 ) ( CLEAR ?auto_57282 ) ( IS-CRATE ?auto_57283 ) ( not ( = ?auto_57273 ?auto_57282 ) ) ( not ( = ?auto_57274 ?auto_57282 ) ) ( not ( = ?auto_57295 ?auto_57282 ) ) ( not ( = ?auto_57287 ?auto_57282 ) ) ( not ( = ?auto_57293 ?auto_57282 ) ) ( not ( = ?auto_57289 ?auto_57282 ) ) ( not ( = ?auto_57286 ?auto_57282 ) ) ( not ( = ?auto_57281 ?auto_57282 ) ) ( not ( = ?auto_57280 ?auto_57282 ) ) ( not ( = ?auto_57285 ?auto_57282 ) ) ( not ( = ?auto_57299 ?auto_57282 ) ) ( not ( = ?auto_57283 ?auto_57282 ) ) ( not ( = ?auto_57301 ?auto_57282 ) ) ( AVAILABLE ?auto_57296 ) ( TRUCK-AT ?auto_57291 ?auto_57284 ) ( AVAILABLE ?auto_57292 ) ( SURFACE-AT ?auto_57283 ?auto_57284 ) ( ON ?auto_57283 ?auto_57302 ) ( CLEAR ?auto_57283 ) ( not ( = ?auto_57273 ?auto_57302 ) ) ( not ( = ?auto_57274 ?auto_57302 ) ) ( not ( = ?auto_57295 ?auto_57302 ) ) ( not ( = ?auto_57287 ?auto_57302 ) ) ( not ( = ?auto_57293 ?auto_57302 ) ) ( not ( = ?auto_57289 ?auto_57302 ) ) ( not ( = ?auto_57286 ?auto_57302 ) ) ( not ( = ?auto_57281 ?auto_57302 ) ) ( not ( = ?auto_57280 ?auto_57302 ) ) ( not ( = ?auto_57285 ?auto_57302 ) ) ( not ( = ?auto_57299 ?auto_57302 ) ) ( not ( = ?auto_57283 ?auto_57302 ) ) ( not ( = ?auto_57301 ?auto_57302 ) ) ( not ( = ?auto_57282 ?auto_57302 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57292 ?auto_57283 ?auto_57302 ?auto_57284 )
      ( MAKE-ON ?auto_57273 ?auto_57274 )
      ( MAKE-ON-VERIFY ?auto_57273 ?auto_57274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57303 - SURFACE
      ?auto_57304 - SURFACE
    )
    :vars
    (
      ?auto_57323 - HOIST
      ?auto_57329 - PLACE
      ?auto_57332 - PLACE
      ?auto_57328 - HOIST
      ?auto_57322 - SURFACE
      ?auto_57308 - SURFACE
      ?auto_57314 - PLACE
      ?auto_57325 - HOIST
      ?auto_57313 - SURFACE
      ?auto_57318 - SURFACE
      ?auto_57321 - PLACE
      ?auto_57326 - HOIST
      ?auto_57315 - SURFACE
      ?auto_57331 - SURFACE
      ?auto_57320 - PLACE
      ?auto_57311 - HOIST
      ?auto_57330 - SURFACE
      ?auto_57317 - SURFACE
      ?auto_57327 - PLACE
      ?auto_57319 - HOIST
      ?auto_57324 - SURFACE
      ?auto_57305 - SURFACE
      ?auto_57309 - PLACE
      ?auto_57306 - HOIST
      ?auto_57316 - SURFACE
      ?auto_57312 - SURFACE
      ?auto_57310 - SURFACE
      ?auto_57307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57323 ?auto_57329 ) ( IS-CRATE ?auto_57303 ) ( not ( = ?auto_57303 ?auto_57304 ) ) ( not ( = ?auto_57332 ?auto_57329 ) ) ( HOIST-AT ?auto_57328 ?auto_57332 ) ( not ( = ?auto_57323 ?auto_57328 ) ) ( AVAILABLE ?auto_57328 ) ( SURFACE-AT ?auto_57303 ?auto_57332 ) ( ON ?auto_57303 ?auto_57322 ) ( CLEAR ?auto_57303 ) ( not ( = ?auto_57303 ?auto_57322 ) ) ( not ( = ?auto_57304 ?auto_57322 ) ) ( IS-CRATE ?auto_57304 ) ( not ( = ?auto_57303 ?auto_57308 ) ) ( not ( = ?auto_57304 ?auto_57308 ) ) ( not ( = ?auto_57322 ?auto_57308 ) ) ( not ( = ?auto_57314 ?auto_57329 ) ) ( not ( = ?auto_57332 ?auto_57314 ) ) ( HOIST-AT ?auto_57325 ?auto_57314 ) ( not ( = ?auto_57323 ?auto_57325 ) ) ( not ( = ?auto_57328 ?auto_57325 ) ) ( AVAILABLE ?auto_57325 ) ( SURFACE-AT ?auto_57304 ?auto_57314 ) ( ON ?auto_57304 ?auto_57313 ) ( CLEAR ?auto_57304 ) ( not ( = ?auto_57303 ?auto_57313 ) ) ( not ( = ?auto_57304 ?auto_57313 ) ) ( not ( = ?auto_57322 ?auto_57313 ) ) ( not ( = ?auto_57308 ?auto_57313 ) ) ( IS-CRATE ?auto_57308 ) ( not ( = ?auto_57303 ?auto_57318 ) ) ( not ( = ?auto_57304 ?auto_57318 ) ) ( not ( = ?auto_57322 ?auto_57318 ) ) ( not ( = ?auto_57308 ?auto_57318 ) ) ( not ( = ?auto_57313 ?auto_57318 ) ) ( not ( = ?auto_57321 ?auto_57329 ) ) ( not ( = ?auto_57332 ?auto_57321 ) ) ( not ( = ?auto_57314 ?auto_57321 ) ) ( HOIST-AT ?auto_57326 ?auto_57321 ) ( not ( = ?auto_57323 ?auto_57326 ) ) ( not ( = ?auto_57328 ?auto_57326 ) ) ( not ( = ?auto_57325 ?auto_57326 ) ) ( AVAILABLE ?auto_57326 ) ( SURFACE-AT ?auto_57308 ?auto_57321 ) ( ON ?auto_57308 ?auto_57315 ) ( CLEAR ?auto_57308 ) ( not ( = ?auto_57303 ?auto_57315 ) ) ( not ( = ?auto_57304 ?auto_57315 ) ) ( not ( = ?auto_57322 ?auto_57315 ) ) ( not ( = ?auto_57308 ?auto_57315 ) ) ( not ( = ?auto_57313 ?auto_57315 ) ) ( not ( = ?auto_57318 ?auto_57315 ) ) ( IS-CRATE ?auto_57318 ) ( not ( = ?auto_57303 ?auto_57331 ) ) ( not ( = ?auto_57304 ?auto_57331 ) ) ( not ( = ?auto_57322 ?auto_57331 ) ) ( not ( = ?auto_57308 ?auto_57331 ) ) ( not ( = ?auto_57313 ?auto_57331 ) ) ( not ( = ?auto_57318 ?auto_57331 ) ) ( not ( = ?auto_57315 ?auto_57331 ) ) ( not ( = ?auto_57320 ?auto_57329 ) ) ( not ( = ?auto_57332 ?auto_57320 ) ) ( not ( = ?auto_57314 ?auto_57320 ) ) ( not ( = ?auto_57321 ?auto_57320 ) ) ( HOIST-AT ?auto_57311 ?auto_57320 ) ( not ( = ?auto_57323 ?auto_57311 ) ) ( not ( = ?auto_57328 ?auto_57311 ) ) ( not ( = ?auto_57325 ?auto_57311 ) ) ( not ( = ?auto_57326 ?auto_57311 ) ) ( AVAILABLE ?auto_57311 ) ( SURFACE-AT ?auto_57318 ?auto_57320 ) ( ON ?auto_57318 ?auto_57330 ) ( CLEAR ?auto_57318 ) ( not ( = ?auto_57303 ?auto_57330 ) ) ( not ( = ?auto_57304 ?auto_57330 ) ) ( not ( = ?auto_57322 ?auto_57330 ) ) ( not ( = ?auto_57308 ?auto_57330 ) ) ( not ( = ?auto_57313 ?auto_57330 ) ) ( not ( = ?auto_57318 ?auto_57330 ) ) ( not ( = ?auto_57315 ?auto_57330 ) ) ( not ( = ?auto_57331 ?auto_57330 ) ) ( IS-CRATE ?auto_57331 ) ( not ( = ?auto_57303 ?auto_57317 ) ) ( not ( = ?auto_57304 ?auto_57317 ) ) ( not ( = ?auto_57322 ?auto_57317 ) ) ( not ( = ?auto_57308 ?auto_57317 ) ) ( not ( = ?auto_57313 ?auto_57317 ) ) ( not ( = ?auto_57318 ?auto_57317 ) ) ( not ( = ?auto_57315 ?auto_57317 ) ) ( not ( = ?auto_57331 ?auto_57317 ) ) ( not ( = ?auto_57330 ?auto_57317 ) ) ( not ( = ?auto_57327 ?auto_57329 ) ) ( not ( = ?auto_57332 ?auto_57327 ) ) ( not ( = ?auto_57314 ?auto_57327 ) ) ( not ( = ?auto_57321 ?auto_57327 ) ) ( not ( = ?auto_57320 ?auto_57327 ) ) ( HOIST-AT ?auto_57319 ?auto_57327 ) ( not ( = ?auto_57323 ?auto_57319 ) ) ( not ( = ?auto_57328 ?auto_57319 ) ) ( not ( = ?auto_57325 ?auto_57319 ) ) ( not ( = ?auto_57326 ?auto_57319 ) ) ( not ( = ?auto_57311 ?auto_57319 ) ) ( AVAILABLE ?auto_57319 ) ( SURFACE-AT ?auto_57331 ?auto_57327 ) ( ON ?auto_57331 ?auto_57324 ) ( CLEAR ?auto_57331 ) ( not ( = ?auto_57303 ?auto_57324 ) ) ( not ( = ?auto_57304 ?auto_57324 ) ) ( not ( = ?auto_57322 ?auto_57324 ) ) ( not ( = ?auto_57308 ?auto_57324 ) ) ( not ( = ?auto_57313 ?auto_57324 ) ) ( not ( = ?auto_57318 ?auto_57324 ) ) ( not ( = ?auto_57315 ?auto_57324 ) ) ( not ( = ?auto_57331 ?auto_57324 ) ) ( not ( = ?auto_57330 ?auto_57324 ) ) ( not ( = ?auto_57317 ?auto_57324 ) ) ( IS-CRATE ?auto_57317 ) ( not ( = ?auto_57303 ?auto_57305 ) ) ( not ( = ?auto_57304 ?auto_57305 ) ) ( not ( = ?auto_57322 ?auto_57305 ) ) ( not ( = ?auto_57308 ?auto_57305 ) ) ( not ( = ?auto_57313 ?auto_57305 ) ) ( not ( = ?auto_57318 ?auto_57305 ) ) ( not ( = ?auto_57315 ?auto_57305 ) ) ( not ( = ?auto_57331 ?auto_57305 ) ) ( not ( = ?auto_57330 ?auto_57305 ) ) ( not ( = ?auto_57317 ?auto_57305 ) ) ( not ( = ?auto_57324 ?auto_57305 ) ) ( not ( = ?auto_57309 ?auto_57329 ) ) ( not ( = ?auto_57332 ?auto_57309 ) ) ( not ( = ?auto_57314 ?auto_57309 ) ) ( not ( = ?auto_57321 ?auto_57309 ) ) ( not ( = ?auto_57320 ?auto_57309 ) ) ( not ( = ?auto_57327 ?auto_57309 ) ) ( HOIST-AT ?auto_57306 ?auto_57309 ) ( not ( = ?auto_57323 ?auto_57306 ) ) ( not ( = ?auto_57328 ?auto_57306 ) ) ( not ( = ?auto_57325 ?auto_57306 ) ) ( not ( = ?auto_57326 ?auto_57306 ) ) ( not ( = ?auto_57311 ?auto_57306 ) ) ( not ( = ?auto_57319 ?auto_57306 ) ) ( SURFACE-AT ?auto_57317 ?auto_57309 ) ( ON ?auto_57317 ?auto_57316 ) ( CLEAR ?auto_57317 ) ( not ( = ?auto_57303 ?auto_57316 ) ) ( not ( = ?auto_57304 ?auto_57316 ) ) ( not ( = ?auto_57322 ?auto_57316 ) ) ( not ( = ?auto_57308 ?auto_57316 ) ) ( not ( = ?auto_57313 ?auto_57316 ) ) ( not ( = ?auto_57318 ?auto_57316 ) ) ( not ( = ?auto_57315 ?auto_57316 ) ) ( not ( = ?auto_57331 ?auto_57316 ) ) ( not ( = ?auto_57330 ?auto_57316 ) ) ( not ( = ?auto_57317 ?auto_57316 ) ) ( not ( = ?auto_57324 ?auto_57316 ) ) ( not ( = ?auto_57305 ?auto_57316 ) ) ( SURFACE-AT ?auto_57312 ?auto_57329 ) ( CLEAR ?auto_57312 ) ( IS-CRATE ?auto_57305 ) ( not ( = ?auto_57303 ?auto_57312 ) ) ( not ( = ?auto_57304 ?auto_57312 ) ) ( not ( = ?auto_57322 ?auto_57312 ) ) ( not ( = ?auto_57308 ?auto_57312 ) ) ( not ( = ?auto_57313 ?auto_57312 ) ) ( not ( = ?auto_57318 ?auto_57312 ) ) ( not ( = ?auto_57315 ?auto_57312 ) ) ( not ( = ?auto_57331 ?auto_57312 ) ) ( not ( = ?auto_57330 ?auto_57312 ) ) ( not ( = ?auto_57317 ?auto_57312 ) ) ( not ( = ?auto_57324 ?auto_57312 ) ) ( not ( = ?auto_57305 ?auto_57312 ) ) ( not ( = ?auto_57316 ?auto_57312 ) ) ( AVAILABLE ?auto_57323 ) ( AVAILABLE ?auto_57306 ) ( SURFACE-AT ?auto_57305 ?auto_57309 ) ( ON ?auto_57305 ?auto_57310 ) ( CLEAR ?auto_57305 ) ( not ( = ?auto_57303 ?auto_57310 ) ) ( not ( = ?auto_57304 ?auto_57310 ) ) ( not ( = ?auto_57322 ?auto_57310 ) ) ( not ( = ?auto_57308 ?auto_57310 ) ) ( not ( = ?auto_57313 ?auto_57310 ) ) ( not ( = ?auto_57318 ?auto_57310 ) ) ( not ( = ?auto_57315 ?auto_57310 ) ) ( not ( = ?auto_57331 ?auto_57310 ) ) ( not ( = ?auto_57330 ?auto_57310 ) ) ( not ( = ?auto_57317 ?auto_57310 ) ) ( not ( = ?auto_57324 ?auto_57310 ) ) ( not ( = ?auto_57305 ?auto_57310 ) ) ( not ( = ?auto_57316 ?auto_57310 ) ) ( not ( = ?auto_57312 ?auto_57310 ) ) ( TRUCK-AT ?auto_57307 ?auto_57329 ) )
    :subtasks
    ( ( !DRIVE ?auto_57307 ?auto_57329 ?auto_57309 )
      ( MAKE-ON ?auto_57303 ?auto_57304 )
      ( MAKE-ON-VERIFY ?auto_57303 ?auto_57304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57335 - SURFACE
      ?auto_57336 - SURFACE
    )
    :vars
    (
      ?auto_57337 - HOIST
      ?auto_57338 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57337 ?auto_57338 ) ( SURFACE-AT ?auto_57336 ?auto_57338 ) ( CLEAR ?auto_57336 ) ( LIFTING ?auto_57337 ?auto_57335 ) ( IS-CRATE ?auto_57335 ) ( not ( = ?auto_57335 ?auto_57336 ) ) )
    :subtasks
    ( ( !DROP ?auto_57337 ?auto_57335 ?auto_57336 ?auto_57338 )
      ( MAKE-ON-VERIFY ?auto_57335 ?auto_57336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57339 - SURFACE
      ?auto_57340 - SURFACE
    )
    :vars
    (
      ?auto_57341 - HOIST
      ?auto_57342 - PLACE
      ?auto_57343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57341 ?auto_57342 ) ( SURFACE-AT ?auto_57340 ?auto_57342 ) ( CLEAR ?auto_57340 ) ( IS-CRATE ?auto_57339 ) ( not ( = ?auto_57339 ?auto_57340 ) ) ( TRUCK-AT ?auto_57343 ?auto_57342 ) ( AVAILABLE ?auto_57341 ) ( IN ?auto_57339 ?auto_57343 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57341 ?auto_57339 ?auto_57343 ?auto_57342 )
      ( MAKE-ON ?auto_57339 ?auto_57340 )
      ( MAKE-ON-VERIFY ?auto_57339 ?auto_57340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57344 - SURFACE
      ?auto_57345 - SURFACE
    )
    :vars
    (
      ?auto_57347 - HOIST
      ?auto_57348 - PLACE
      ?auto_57346 - TRUCK
      ?auto_57349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57347 ?auto_57348 ) ( SURFACE-AT ?auto_57345 ?auto_57348 ) ( CLEAR ?auto_57345 ) ( IS-CRATE ?auto_57344 ) ( not ( = ?auto_57344 ?auto_57345 ) ) ( AVAILABLE ?auto_57347 ) ( IN ?auto_57344 ?auto_57346 ) ( TRUCK-AT ?auto_57346 ?auto_57349 ) ( not ( = ?auto_57349 ?auto_57348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57346 ?auto_57349 ?auto_57348 )
      ( MAKE-ON ?auto_57344 ?auto_57345 )
      ( MAKE-ON-VERIFY ?auto_57344 ?auto_57345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57350 - SURFACE
      ?auto_57351 - SURFACE
    )
    :vars
    (
      ?auto_57355 - HOIST
      ?auto_57352 - PLACE
      ?auto_57354 - TRUCK
      ?auto_57353 - PLACE
      ?auto_57356 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57355 ?auto_57352 ) ( SURFACE-AT ?auto_57351 ?auto_57352 ) ( CLEAR ?auto_57351 ) ( IS-CRATE ?auto_57350 ) ( not ( = ?auto_57350 ?auto_57351 ) ) ( AVAILABLE ?auto_57355 ) ( TRUCK-AT ?auto_57354 ?auto_57353 ) ( not ( = ?auto_57353 ?auto_57352 ) ) ( HOIST-AT ?auto_57356 ?auto_57353 ) ( LIFTING ?auto_57356 ?auto_57350 ) ( not ( = ?auto_57355 ?auto_57356 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57356 ?auto_57350 ?auto_57354 ?auto_57353 )
      ( MAKE-ON ?auto_57350 ?auto_57351 )
      ( MAKE-ON-VERIFY ?auto_57350 ?auto_57351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57357 - SURFACE
      ?auto_57358 - SURFACE
    )
    :vars
    (
      ?auto_57363 - HOIST
      ?auto_57359 - PLACE
      ?auto_57361 - TRUCK
      ?auto_57362 - PLACE
      ?auto_57360 - HOIST
      ?auto_57364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57363 ?auto_57359 ) ( SURFACE-AT ?auto_57358 ?auto_57359 ) ( CLEAR ?auto_57358 ) ( IS-CRATE ?auto_57357 ) ( not ( = ?auto_57357 ?auto_57358 ) ) ( AVAILABLE ?auto_57363 ) ( TRUCK-AT ?auto_57361 ?auto_57362 ) ( not ( = ?auto_57362 ?auto_57359 ) ) ( HOIST-AT ?auto_57360 ?auto_57362 ) ( not ( = ?auto_57363 ?auto_57360 ) ) ( AVAILABLE ?auto_57360 ) ( SURFACE-AT ?auto_57357 ?auto_57362 ) ( ON ?auto_57357 ?auto_57364 ) ( CLEAR ?auto_57357 ) ( not ( = ?auto_57357 ?auto_57364 ) ) ( not ( = ?auto_57358 ?auto_57364 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57360 ?auto_57357 ?auto_57364 ?auto_57362 )
      ( MAKE-ON ?auto_57357 ?auto_57358 )
      ( MAKE-ON-VERIFY ?auto_57357 ?auto_57358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57365 - SURFACE
      ?auto_57366 - SURFACE
    )
    :vars
    (
      ?auto_57370 - HOIST
      ?auto_57372 - PLACE
      ?auto_57368 - PLACE
      ?auto_57369 - HOIST
      ?auto_57367 - SURFACE
      ?auto_57371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57370 ?auto_57372 ) ( SURFACE-AT ?auto_57366 ?auto_57372 ) ( CLEAR ?auto_57366 ) ( IS-CRATE ?auto_57365 ) ( not ( = ?auto_57365 ?auto_57366 ) ) ( AVAILABLE ?auto_57370 ) ( not ( = ?auto_57368 ?auto_57372 ) ) ( HOIST-AT ?auto_57369 ?auto_57368 ) ( not ( = ?auto_57370 ?auto_57369 ) ) ( AVAILABLE ?auto_57369 ) ( SURFACE-AT ?auto_57365 ?auto_57368 ) ( ON ?auto_57365 ?auto_57367 ) ( CLEAR ?auto_57365 ) ( not ( = ?auto_57365 ?auto_57367 ) ) ( not ( = ?auto_57366 ?auto_57367 ) ) ( TRUCK-AT ?auto_57371 ?auto_57372 ) )
    :subtasks
    ( ( !DRIVE ?auto_57371 ?auto_57372 ?auto_57368 )
      ( MAKE-ON ?auto_57365 ?auto_57366 )
      ( MAKE-ON-VERIFY ?auto_57365 ?auto_57366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57373 - SURFACE
      ?auto_57374 - SURFACE
    )
    :vars
    (
      ?auto_57379 - HOIST
      ?auto_57380 - PLACE
      ?auto_57378 - PLACE
      ?auto_57376 - HOIST
      ?auto_57377 - SURFACE
      ?auto_57375 - TRUCK
      ?auto_57381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57379 ?auto_57380 ) ( IS-CRATE ?auto_57373 ) ( not ( = ?auto_57373 ?auto_57374 ) ) ( not ( = ?auto_57378 ?auto_57380 ) ) ( HOIST-AT ?auto_57376 ?auto_57378 ) ( not ( = ?auto_57379 ?auto_57376 ) ) ( AVAILABLE ?auto_57376 ) ( SURFACE-AT ?auto_57373 ?auto_57378 ) ( ON ?auto_57373 ?auto_57377 ) ( CLEAR ?auto_57373 ) ( not ( = ?auto_57373 ?auto_57377 ) ) ( not ( = ?auto_57374 ?auto_57377 ) ) ( TRUCK-AT ?auto_57375 ?auto_57380 ) ( SURFACE-AT ?auto_57381 ?auto_57380 ) ( CLEAR ?auto_57381 ) ( LIFTING ?auto_57379 ?auto_57374 ) ( IS-CRATE ?auto_57374 ) ( not ( = ?auto_57373 ?auto_57381 ) ) ( not ( = ?auto_57374 ?auto_57381 ) ) ( not ( = ?auto_57377 ?auto_57381 ) ) )
    :subtasks
    ( ( !DROP ?auto_57379 ?auto_57374 ?auto_57381 ?auto_57380 )
      ( MAKE-ON ?auto_57373 ?auto_57374 )
      ( MAKE-ON-VERIFY ?auto_57373 ?auto_57374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57382 - SURFACE
      ?auto_57383 - SURFACE
    )
    :vars
    (
      ?auto_57389 - HOIST
      ?auto_57388 - PLACE
      ?auto_57385 - PLACE
      ?auto_57387 - HOIST
      ?auto_57386 - SURFACE
      ?auto_57384 - TRUCK
      ?auto_57390 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57389 ?auto_57388 ) ( IS-CRATE ?auto_57382 ) ( not ( = ?auto_57382 ?auto_57383 ) ) ( not ( = ?auto_57385 ?auto_57388 ) ) ( HOIST-AT ?auto_57387 ?auto_57385 ) ( not ( = ?auto_57389 ?auto_57387 ) ) ( AVAILABLE ?auto_57387 ) ( SURFACE-AT ?auto_57382 ?auto_57385 ) ( ON ?auto_57382 ?auto_57386 ) ( CLEAR ?auto_57382 ) ( not ( = ?auto_57382 ?auto_57386 ) ) ( not ( = ?auto_57383 ?auto_57386 ) ) ( TRUCK-AT ?auto_57384 ?auto_57388 ) ( SURFACE-AT ?auto_57390 ?auto_57388 ) ( CLEAR ?auto_57390 ) ( IS-CRATE ?auto_57383 ) ( not ( = ?auto_57382 ?auto_57390 ) ) ( not ( = ?auto_57383 ?auto_57390 ) ) ( not ( = ?auto_57386 ?auto_57390 ) ) ( AVAILABLE ?auto_57389 ) ( IN ?auto_57383 ?auto_57384 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57389 ?auto_57383 ?auto_57384 ?auto_57388 )
      ( MAKE-ON ?auto_57382 ?auto_57383 )
      ( MAKE-ON-VERIFY ?auto_57382 ?auto_57383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57391 - SURFACE
      ?auto_57392 - SURFACE
    )
    :vars
    (
      ?auto_57397 - HOIST
      ?auto_57393 - PLACE
      ?auto_57398 - PLACE
      ?auto_57394 - HOIST
      ?auto_57395 - SURFACE
      ?auto_57396 - SURFACE
      ?auto_57399 - TRUCK
      ?auto_57400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57397 ?auto_57393 ) ( IS-CRATE ?auto_57391 ) ( not ( = ?auto_57391 ?auto_57392 ) ) ( not ( = ?auto_57398 ?auto_57393 ) ) ( HOIST-AT ?auto_57394 ?auto_57398 ) ( not ( = ?auto_57397 ?auto_57394 ) ) ( AVAILABLE ?auto_57394 ) ( SURFACE-AT ?auto_57391 ?auto_57398 ) ( ON ?auto_57391 ?auto_57395 ) ( CLEAR ?auto_57391 ) ( not ( = ?auto_57391 ?auto_57395 ) ) ( not ( = ?auto_57392 ?auto_57395 ) ) ( SURFACE-AT ?auto_57396 ?auto_57393 ) ( CLEAR ?auto_57396 ) ( IS-CRATE ?auto_57392 ) ( not ( = ?auto_57391 ?auto_57396 ) ) ( not ( = ?auto_57392 ?auto_57396 ) ) ( not ( = ?auto_57395 ?auto_57396 ) ) ( AVAILABLE ?auto_57397 ) ( IN ?auto_57392 ?auto_57399 ) ( TRUCK-AT ?auto_57399 ?auto_57400 ) ( not ( = ?auto_57400 ?auto_57393 ) ) ( not ( = ?auto_57398 ?auto_57400 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57399 ?auto_57400 ?auto_57393 )
      ( MAKE-ON ?auto_57391 ?auto_57392 )
      ( MAKE-ON-VERIFY ?auto_57391 ?auto_57392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57401 - SURFACE
      ?auto_57402 - SURFACE
    )
    :vars
    (
      ?auto_57403 - HOIST
      ?auto_57409 - PLACE
      ?auto_57406 - PLACE
      ?auto_57405 - HOIST
      ?auto_57407 - SURFACE
      ?auto_57404 - SURFACE
      ?auto_57410 - TRUCK
      ?auto_57408 - PLACE
      ?auto_57411 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57403 ?auto_57409 ) ( IS-CRATE ?auto_57401 ) ( not ( = ?auto_57401 ?auto_57402 ) ) ( not ( = ?auto_57406 ?auto_57409 ) ) ( HOIST-AT ?auto_57405 ?auto_57406 ) ( not ( = ?auto_57403 ?auto_57405 ) ) ( AVAILABLE ?auto_57405 ) ( SURFACE-AT ?auto_57401 ?auto_57406 ) ( ON ?auto_57401 ?auto_57407 ) ( CLEAR ?auto_57401 ) ( not ( = ?auto_57401 ?auto_57407 ) ) ( not ( = ?auto_57402 ?auto_57407 ) ) ( SURFACE-AT ?auto_57404 ?auto_57409 ) ( CLEAR ?auto_57404 ) ( IS-CRATE ?auto_57402 ) ( not ( = ?auto_57401 ?auto_57404 ) ) ( not ( = ?auto_57402 ?auto_57404 ) ) ( not ( = ?auto_57407 ?auto_57404 ) ) ( AVAILABLE ?auto_57403 ) ( TRUCK-AT ?auto_57410 ?auto_57408 ) ( not ( = ?auto_57408 ?auto_57409 ) ) ( not ( = ?auto_57406 ?auto_57408 ) ) ( HOIST-AT ?auto_57411 ?auto_57408 ) ( LIFTING ?auto_57411 ?auto_57402 ) ( not ( = ?auto_57403 ?auto_57411 ) ) ( not ( = ?auto_57405 ?auto_57411 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57411 ?auto_57402 ?auto_57410 ?auto_57408 )
      ( MAKE-ON ?auto_57401 ?auto_57402 )
      ( MAKE-ON-VERIFY ?auto_57401 ?auto_57402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57412 - SURFACE
      ?auto_57413 - SURFACE
    )
    :vars
    (
      ?auto_57421 - HOIST
      ?auto_57422 - PLACE
      ?auto_57416 - PLACE
      ?auto_57414 - HOIST
      ?auto_57417 - SURFACE
      ?auto_57418 - SURFACE
      ?auto_57419 - TRUCK
      ?auto_57415 - PLACE
      ?auto_57420 - HOIST
      ?auto_57423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57421 ?auto_57422 ) ( IS-CRATE ?auto_57412 ) ( not ( = ?auto_57412 ?auto_57413 ) ) ( not ( = ?auto_57416 ?auto_57422 ) ) ( HOIST-AT ?auto_57414 ?auto_57416 ) ( not ( = ?auto_57421 ?auto_57414 ) ) ( AVAILABLE ?auto_57414 ) ( SURFACE-AT ?auto_57412 ?auto_57416 ) ( ON ?auto_57412 ?auto_57417 ) ( CLEAR ?auto_57412 ) ( not ( = ?auto_57412 ?auto_57417 ) ) ( not ( = ?auto_57413 ?auto_57417 ) ) ( SURFACE-AT ?auto_57418 ?auto_57422 ) ( CLEAR ?auto_57418 ) ( IS-CRATE ?auto_57413 ) ( not ( = ?auto_57412 ?auto_57418 ) ) ( not ( = ?auto_57413 ?auto_57418 ) ) ( not ( = ?auto_57417 ?auto_57418 ) ) ( AVAILABLE ?auto_57421 ) ( TRUCK-AT ?auto_57419 ?auto_57415 ) ( not ( = ?auto_57415 ?auto_57422 ) ) ( not ( = ?auto_57416 ?auto_57415 ) ) ( HOIST-AT ?auto_57420 ?auto_57415 ) ( not ( = ?auto_57421 ?auto_57420 ) ) ( not ( = ?auto_57414 ?auto_57420 ) ) ( AVAILABLE ?auto_57420 ) ( SURFACE-AT ?auto_57413 ?auto_57415 ) ( ON ?auto_57413 ?auto_57423 ) ( CLEAR ?auto_57413 ) ( not ( = ?auto_57412 ?auto_57423 ) ) ( not ( = ?auto_57413 ?auto_57423 ) ) ( not ( = ?auto_57417 ?auto_57423 ) ) ( not ( = ?auto_57418 ?auto_57423 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57420 ?auto_57413 ?auto_57423 ?auto_57415 )
      ( MAKE-ON ?auto_57412 ?auto_57413 )
      ( MAKE-ON-VERIFY ?auto_57412 ?auto_57413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57424 - SURFACE
      ?auto_57425 - SURFACE
    )
    :vars
    (
      ?auto_57426 - HOIST
      ?auto_57427 - PLACE
      ?auto_57432 - PLACE
      ?auto_57428 - HOIST
      ?auto_57431 - SURFACE
      ?auto_57434 - SURFACE
      ?auto_57433 - PLACE
      ?auto_57435 - HOIST
      ?auto_57429 - SURFACE
      ?auto_57430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57426 ?auto_57427 ) ( IS-CRATE ?auto_57424 ) ( not ( = ?auto_57424 ?auto_57425 ) ) ( not ( = ?auto_57432 ?auto_57427 ) ) ( HOIST-AT ?auto_57428 ?auto_57432 ) ( not ( = ?auto_57426 ?auto_57428 ) ) ( AVAILABLE ?auto_57428 ) ( SURFACE-AT ?auto_57424 ?auto_57432 ) ( ON ?auto_57424 ?auto_57431 ) ( CLEAR ?auto_57424 ) ( not ( = ?auto_57424 ?auto_57431 ) ) ( not ( = ?auto_57425 ?auto_57431 ) ) ( SURFACE-AT ?auto_57434 ?auto_57427 ) ( CLEAR ?auto_57434 ) ( IS-CRATE ?auto_57425 ) ( not ( = ?auto_57424 ?auto_57434 ) ) ( not ( = ?auto_57425 ?auto_57434 ) ) ( not ( = ?auto_57431 ?auto_57434 ) ) ( AVAILABLE ?auto_57426 ) ( not ( = ?auto_57433 ?auto_57427 ) ) ( not ( = ?auto_57432 ?auto_57433 ) ) ( HOIST-AT ?auto_57435 ?auto_57433 ) ( not ( = ?auto_57426 ?auto_57435 ) ) ( not ( = ?auto_57428 ?auto_57435 ) ) ( AVAILABLE ?auto_57435 ) ( SURFACE-AT ?auto_57425 ?auto_57433 ) ( ON ?auto_57425 ?auto_57429 ) ( CLEAR ?auto_57425 ) ( not ( = ?auto_57424 ?auto_57429 ) ) ( not ( = ?auto_57425 ?auto_57429 ) ) ( not ( = ?auto_57431 ?auto_57429 ) ) ( not ( = ?auto_57434 ?auto_57429 ) ) ( TRUCK-AT ?auto_57430 ?auto_57427 ) )
    :subtasks
    ( ( !DRIVE ?auto_57430 ?auto_57427 ?auto_57433 )
      ( MAKE-ON ?auto_57424 ?auto_57425 )
      ( MAKE-ON-VERIFY ?auto_57424 ?auto_57425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57436 - SURFACE
      ?auto_57437 - SURFACE
    )
    :vars
    (
      ?auto_57445 - HOIST
      ?auto_57443 - PLACE
      ?auto_57441 - PLACE
      ?auto_57442 - HOIST
      ?auto_57440 - SURFACE
      ?auto_57446 - SURFACE
      ?auto_57447 - PLACE
      ?auto_57444 - HOIST
      ?auto_57438 - SURFACE
      ?auto_57439 - TRUCK
      ?auto_57448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57445 ?auto_57443 ) ( IS-CRATE ?auto_57436 ) ( not ( = ?auto_57436 ?auto_57437 ) ) ( not ( = ?auto_57441 ?auto_57443 ) ) ( HOIST-AT ?auto_57442 ?auto_57441 ) ( not ( = ?auto_57445 ?auto_57442 ) ) ( AVAILABLE ?auto_57442 ) ( SURFACE-AT ?auto_57436 ?auto_57441 ) ( ON ?auto_57436 ?auto_57440 ) ( CLEAR ?auto_57436 ) ( not ( = ?auto_57436 ?auto_57440 ) ) ( not ( = ?auto_57437 ?auto_57440 ) ) ( IS-CRATE ?auto_57437 ) ( not ( = ?auto_57436 ?auto_57446 ) ) ( not ( = ?auto_57437 ?auto_57446 ) ) ( not ( = ?auto_57440 ?auto_57446 ) ) ( not ( = ?auto_57447 ?auto_57443 ) ) ( not ( = ?auto_57441 ?auto_57447 ) ) ( HOIST-AT ?auto_57444 ?auto_57447 ) ( not ( = ?auto_57445 ?auto_57444 ) ) ( not ( = ?auto_57442 ?auto_57444 ) ) ( AVAILABLE ?auto_57444 ) ( SURFACE-AT ?auto_57437 ?auto_57447 ) ( ON ?auto_57437 ?auto_57438 ) ( CLEAR ?auto_57437 ) ( not ( = ?auto_57436 ?auto_57438 ) ) ( not ( = ?auto_57437 ?auto_57438 ) ) ( not ( = ?auto_57440 ?auto_57438 ) ) ( not ( = ?auto_57446 ?auto_57438 ) ) ( TRUCK-AT ?auto_57439 ?auto_57443 ) ( SURFACE-AT ?auto_57448 ?auto_57443 ) ( CLEAR ?auto_57448 ) ( LIFTING ?auto_57445 ?auto_57446 ) ( IS-CRATE ?auto_57446 ) ( not ( = ?auto_57436 ?auto_57448 ) ) ( not ( = ?auto_57437 ?auto_57448 ) ) ( not ( = ?auto_57440 ?auto_57448 ) ) ( not ( = ?auto_57446 ?auto_57448 ) ) ( not ( = ?auto_57438 ?auto_57448 ) ) )
    :subtasks
    ( ( !DROP ?auto_57445 ?auto_57446 ?auto_57448 ?auto_57443 )
      ( MAKE-ON ?auto_57436 ?auto_57437 )
      ( MAKE-ON-VERIFY ?auto_57436 ?auto_57437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57449 - SURFACE
      ?auto_57450 - SURFACE
    )
    :vars
    (
      ?auto_57453 - HOIST
      ?auto_57459 - PLACE
      ?auto_57458 - PLACE
      ?auto_57461 - HOIST
      ?auto_57460 - SURFACE
      ?auto_57454 - SURFACE
      ?auto_57452 - PLACE
      ?auto_57451 - HOIST
      ?auto_57455 - SURFACE
      ?auto_57457 - TRUCK
      ?auto_57456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57453 ?auto_57459 ) ( IS-CRATE ?auto_57449 ) ( not ( = ?auto_57449 ?auto_57450 ) ) ( not ( = ?auto_57458 ?auto_57459 ) ) ( HOIST-AT ?auto_57461 ?auto_57458 ) ( not ( = ?auto_57453 ?auto_57461 ) ) ( AVAILABLE ?auto_57461 ) ( SURFACE-AT ?auto_57449 ?auto_57458 ) ( ON ?auto_57449 ?auto_57460 ) ( CLEAR ?auto_57449 ) ( not ( = ?auto_57449 ?auto_57460 ) ) ( not ( = ?auto_57450 ?auto_57460 ) ) ( IS-CRATE ?auto_57450 ) ( not ( = ?auto_57449 ?auto_57454 ) ) ( not ( = ?auto_57450 ?auto_57454 ) ) ( not ( = ?auto_57460 ?auto_57454 ) ) ( not ( = ?auto_57452 ?auto_57459 ) ) ( not ( = ?auto_57458 ?auto_57452 ) ) ( HOIST-AT ?auto_57451 ?auto_57452 ) ( not ( = ?auto_57453 ?auto_57451 ) ) ( not ( = ?auto_57461 ?auto_57451 ) ) ( AVAILABLE ?auto_57451 ) ( SURFACE-AT ?auto_57450 ?auto_57452 ) ( ON ?auto_57450 ?auto_57455 ) ( CLEAR ?auto_57450 ) ( not ( = ?auto_57449 ?auto_57455 ) ) ( not ( = ?auto_57450 ?auto_57455 ) ) ( not ( = ?auto_57460 ?auto_57455 ) ) ( not ( = ?auto_57454 ?auto_57455 ) ) ( TRUCK-AT ?auto_57457 ?auto_57459 ) ( SURFACE-AT ?auto_57456 ?auto_57459 ) ( CLEAR ?auto_57456 ) ( IS-CRATE ?auto_57454 ) ( not ( = ?auto_57449 ?auto_57456 ) ) ( not ( = ?auto_57450 ?auto_57456 ) ) ( not ( = ?auto_57460 ?auto_57456 ) ) ( not ( = ?auto_57454 ?auto_57456 ) ) ( not ( = ?auto_57455 ?auto_57456 ) ) ( AVAILABLE ?auto_57453 ) ( IN ?auto_57454 ?auto_57457 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57453 ?auto_57454 ?auto_57457 ?auto_57459 )
      ( MAKE-ON ?auto_57449 ?auto_57450 )
      ( MAKE-ON-VERIFY ?auto_57449 ?auto_57450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57462 - SURFACE
      ?auto_57463 - SURFACE
    )
    :vars
    (
      ?auto_57464 - HOIST
      ?auto_57471 - PLACE
      ?auto_57474 - PLACE
      ?auto_57465 - HOIST
      ?auto_57473 - SURFACE
      ?auto_57469 - SURFACE
      ?auto_57470 - PLACE
      ?auto_57467 - HOIST
      ?auto_57468 - SURFACE
      ?auto_57466 - SURFACE
      ?auto_57472 - TRUCK
      ?auto_57475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57464 ?auto_57471 ) ( IS-CRATE ?auto_57462 ) ( not ( = ?auto_57462 ?auto_57463 ) ) ( not ( = ?auto_57474 ?auto_57471 ) ) ( HOIST-AT ?auto_57465 ?auto_57474 ) ( not ( = ?auto_57464 ?auto_57465 ) ) ( AVAILABLE ?auto_57465 ) ( SURFACE-AT ?auto_57462 ?auto_57474 ) ( ON ?auto_57462 ?auto_57473 ) ( CLEAR ?auto_57462 ) ( not ( = ?auto_57462 ?auto_57473 ) ) ( not ( = ?auto_57463 ?auto_57473 ) ) ( IS-CRATE ?auto_57463 ) ( not ( = ?auto_57462 ?auto_57469 ) ) ( not ( = ?auto_57463 ?auto_57469 ) ) ( not ( = ?auto_57473 ?auto_57469 ) ) ( not ( = ?auto_57470 ?auto_57471 ) ) ( not ( = ?auto_57474 ?auto_57470 ) ) ( HOIST-AT ?auto_57467 ?auto_57470 ) ( not ( = ?auto_57464 ?auto_57467 ) ) ( not ( = ?auto_57465 ?auto_57467 ) ) ( AVAILABLE ?auto_57467 ) ( SURFACE-AT ?auto_57463 ?auto_57470 ) ( ON ?auto_57463 ?auto_57468 ) ( CLEAR ?auto_57463 ) ( not ( = ?auto_57462 ?auto_57468 ) ) ( not ( = ?auto_57463 ?auto_57468 ) ) ( not ( = ?auto_57473 ?auto_57468 ) ) ( not ( = ?auto_57469 ?auto_57468 ) ) ( SURFACE-AT ?auto_57466 ?auto_57471 ) ( CLEAR ?auto_57466 ) ( IS-CRATE ?auto_57469 ) ( not ( = ?auto_57462 ?auto_57466 ) ) ( not ( = ?auto_57463 ?auto_57466 ) ) ( not ( = ?auto_57473 ?auto_57466 ) ) ( not ( = ?auto_57469 ?auto_57466 ) ) ( not ( = ?auto_57468 ?auto_57466 ) ) ( AVAILABLE ?auto_57464 ) ( IN ?auto_57469 ?auto_57472 ) ( TRUCK-AT ?auto_57472 ?auto_57475 ) ( not ( = ?auto_57475 ?auto_57471 ) ) ( not ( = ?auto_57474 ?auto_57475 ) ) ( not ( = ?auto_57470 ?auto_57475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57472 ?auto_57475 ?auto_57471 )
      ( MAKE-ON ?auto_57462 ?auto_57463 )
      ( MAKE-ON-VERIFY ?auto_57462 ?auto_57463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57476 - SURFACE
      ?auto_57477 - SURFACE
    )
    :vars
    (
      ?auto_57489 - HOIST
      ?auto_57479 - PLACE
      ?auto_57483 - PLACE
      ?auto_57485 - HOIST
      ?auto_57480 - SURFACE
      ?auto_57478 - SURFACE
      ?auto_57482 - PLACE
      ?auto_57484 - HOIST
      ?auto_57487 - SURFACE
      ?auto_57481 - SURFACE
      ?auto_57486 - TRUCK
      ?auto_57488 - PLACE
      ?auto_57490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57489 ?auto_57479 ) ( IS-CRATE ?auto_57476 ) ( not ( = ?auto_57476 ?auto_57477 ) ) ( not ( = ?auto_57483 ?auto_57479 ) ) ( HOIST-AT ?auto_57485 ?auto_57483 ) ( not ( = ?auto_57489 ?auto_57485 ) ) ( AVAILABLE ?auto_57485 ) ( SURFACE-AT ?auto_57476 ?auto_57483 ) ( ON ?auto_57476 ?auto_57480 ) ( CLEAR ?auto_57476 ) ( not ( = ?auto_57476 ?auto_57480 ) ) ( not ( = ?auto_57477 ?auto_57480 ) ) ( IS-CRATE ?auto_57477 ) ( not ( = ?auto_57476 ?auto_57478 ) ) ( not ( = ?auto_57477 ?auto_57478 ) ) ( not ( = ?auto_57480 ?auto_57478 ) ) ( not ( = ?auto_57482 ?auto_57479 ) ) ( not ( = ?auto_57483 ?auto_57482 ) ) ( HOIST-AT ?auto_57484 ?auto_57482 ) ( not ( = ?auto_57489 ?auto_57484 ) ) ( not ( = ?auto_57485 ?auto_57484 ) ) ( AVAILABLE ?auto_57484 ) ( SURFACE-AT ?auto_57477 ?auto_57482 ) ( ON ?auto_57477 ?auto_57487 ) ( CLEAR ?auto_57477 ) ( not ( = ?auto_57476 ?auto_57487 ) ) ( not ( = ?auto_57477 ?auto_57487 ) ) ( not ( = ?auto_57480 ?auto_57487 ) ) ( not ( = ?auto_57478 ?auto_57487 ) ) ( SURFACE-AT ?auto_57481 ?auto_57479 ) ( CLEAR ?auto_57481 ) ( IS-CRATE ?auto_57478 ) ( not ( = ?auto_57476 ?auto_57481 ) ) ( not ( = ?auto_57477 ?auto_57481 ) ) ( not ( = ?auto_57480 ?auto_57481 ) ) ( not ( = ?auto_57478 ?auto_57481 ) ) ( not ( = ?auto_57487 ?auto_57481 ) ) ( AVAILABLE ?auto_57489 ) ( TRUCK-AT ?auto_57486 ?auto_57488 ) ( not ( = ?auto_57488 ?auto_57479 ) ) ( not ( = ?auto_57483 ?auto_57488 ) ) ( not ( = ?auto_57482 ?auto_57488 ) ) ( HOIST-AT ?auto_57490 ?auto_57488 ) ( LIFTING ?auto_57490 ?auto_57478 ) ( not ( = ?auto_57489 ?auto_57490 ) ) ( not ( = ?auto_57485 ?auto_57490 ) ) ( not ( = ?auto_57484 ?auto_57490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57490 ?auto_57478 ?auto_57486 ?auto_57488 )
      ( MAKE-ON ?auto_57476 ?auto_57477 )
      ( MAKE-ON-VERIFY ?auto_57476 ?auto_57477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57491 - SURFACE
      ?auto_57492 - SURFACE
    )
    :vars
    (
      ?auto_57495 - HOIST
      ?auto_57500 - PLACE
      ?auto_57502 - PLACE
      ?auto_57501 - HOIST
      ?auto_57504 - SURFACE
      ?auto_57496 - SURFACE
      ?auto_57497 - PLACE
      ?auto_57494 - HOIST
      ?auto_57503 - SURFACE
      ?auto_57499 - SURFACE
      ?auto_57505 - TRUCK
      ?auto_57498 - PLACE
      ?auto_57493 - HOIST
      ?auto_57506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57495 ?auto_57500 ) ( IS-CRATE ?auto_57491 ) ( not ( = ?auto_57491 ?auto_57492 ) ) ( not ( = ?auto_57502 ?auto_57500 ) ) ( HOIST-AT ?auto_57501 ?auto_57502 ) ( not ( = ?auto_57495 ?auto_57501 ) ) ( AVAILABLE ?auto_57501 ) ( SURFACE-AT ?auto_57491 ?auto_57502 ) ( ON ?auto_57491 ?auto_57504 ) ( CLEAR ?auto_57491 ) ( not ( = ?auto_57491 ?auto_57504 ) ) ( not ( = ?auto_57492 ?auto_57504 ) ) ( IS-CRATE ?auto_57492 ) ( not ( = ?auto_57491 ?auto_57496 ) ) ( not ( = ?auto_57492 ?auto_57496 ) ) ( not ( = ?auto_57504 ?auto_57496 ) ) ( not ( = ?auto_57497 ?auto_57500 ) ) ( not ( = ?auto_57502 ?auto_57497 ) ) ( HOIST-AT ?auto_57494 ?auto_57497 ) ( not ( = ?auto_57495 ?auto_57494 ) ) ( not ( = ?auto_57501 ?auto_57494 ) ) ( AVAILABLE ?auto_57494 ) ( SURFACE-AT ?auto_57492 ?auto_57497 ) ( ON ?auto_57492 ?auto_57503 ) ( CLEAR ?auto_57492 ) ( not ( = ?auto_57491 ?auto_57503 ) ) ( not ( = ?auto_57492 ?auto_57503 ) ) ( not ( = ?auto_57504 ?auto_57503 ) ) ( not ( = ?auto_57496 ?auto_57503 ) ) ( SURFACE-AT ?auto_57499 ?auto_57500 ) ( CLEAR ?auto_57499 ) ( IS-CRATE ?auto_57496 ) ( not ( = ?auto_57491 ?auto_57499 ) ) ( not ( = ?auto_57492 ?auto_57499 ) ) ( not ( = ?auto_57504 ?auto_57499 ) ) ( not ( = ?auto_57496 ?auto_57499 ) ) ( not ( = ?auto_57503 ?auto_57499 ) ) ( AVAILABLE ?auto_57495 ) ( TRUCK-AT ?auto_57505 ?auto_57498 ) ( not ( = ?auto_57498 ?auto_57500 ) ) ( not ( = ?auto_57502 ?auto_57498 ) ) ( not ( = ?auto_57497 ?auto_57498 ) ) ( HOIST-AT ?auto_57493 ?auto_57498 ) ( not ( = ?auto_57495 ?auto_57493 ) ) ( not ( = ?auto_57501 ?auto_57493 ) ) ( not ( = ?auto_57494 ?auto_57493 ) ) ( AVAILABLE ?auto_57493 ) ( SURFACE-AT ?auto_57496 ?auto_57498 ) ( ON ?auto_57496 ?auto_57506 ) ( CLEAR ?auto_57496 ) ( not ( = ?auto_57491 ?auto_57506 ) ) ( not ( = ?auto_57492 ?auto_57506 ) ) ( not ( = ?auto_57504 ?auto_57506 ) ) ( not ( = ?auto_57496 ?auto_57506 ) ) ( not ( = ?auto_57503 ?auto_57506 ) ) ( not ( = ?auto_57499 ?auto_57506 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57493 ?auto_57496 ?auto_57506 ?auto_57498 )
      ( MAKE-ON ?auto_57491 ?auto_57492 )
      ( MAKE-ON-VERIFY ?auto_57491 ?auto_57492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57507 - SURFACE
      ?auto_57508 - SURFACE
    )
    :vars
    (
      ?auto_57521 - HOIST
      ?auto_57520 - PLACE
      ?auto_57522 - PLACE
      ?auto_57512 - HOIST
      ?auto_57510 - SURFACE
      ?auto_57516 - SURFACE
      ?auto_57514 - PLACE
      ?auto_57515 - HOIST
      ?auto_57509 - SURFACE
      ?auto_57519 - SURFACE
      ?auto_57513 - PLACE
      ?auto_57511 - HOIST
      ?auto_57517 - SURFACE
      ?auto_57518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57521 ?auto_57520 ) ( IS-CRATE ?auto_57507 ) ( not ( = ?auto_57507 ?auto_57508 ) ) ( not ( = ?auto_57522 ?auto_57520 ) ) ( HOIST-AT ?auto_57512 ?auto_57522 ) ( not ( = ?auto_57521 ?auto_57512 ) ) ( AVAILABLE ?auto_57512 ) ( SURFACE-AT ?auto_57507 ?auto_57522 ) ( ON ?auto_57507 ?auto_57510 ) ( CLEAR ?auto_57507 ) ( not ( = ?auto_57507 ?auto_57510 ) ) ( not ( = ?auto_57508 ?auto_57510 ) ) ( IS-CRATE ?auto_57508 ) ( not ( = ?auto_57507 ?auto_57516 ) ) ( not ( = ?auto_57508 ?auto_57516 ) ) ( not ( = ?auto_57510 ?auto_57516 ) ) ( not ( = ?auto_57514 ?auto_57520 ) ) ( not ( = ?auto_57522 ?auto_57514 ) ) ( HOIST-AT ?auto_57515 ?auto_57514 ) ( not ( = ?auto_57521 ?auto_57515 ) ) ( not ( = ?auto_57512 ?auto_57515 ) ) ( AVAILABLE ?auto_57515 ) ( SURFACE-AT ?auto_57508 ?auto_57514 ) ( ON ?auto_57508 ?auto_57509 ) ( CLEAR ?auto_57508 ) ( not ( = ?auto_57507 ?auto_57509 ) ) ( not ( = ?auto_57508 ?auto_57509 ) ) ( not ( = ?auto_57510 ?auto_57509 ) ) ( not ( = ?auto_57516 ?auto_57509 ) ) ( SURFACE-AT ?auto_57519 ?auto_57520 ) ( CLEAR ?auto_57519 ) ( IS-CRATE ?auto_57516 ) ( not ( = ?auto_57507 ?auto_57519 ) ) ( not ( = ?auto_57508 ?auto_57519 ) ) ( not ( = ?auto_57510 ?auto_57519 ) ) ( not ( = ?auto_57516 ?auto_57519 ) ) ( not ( = ?auto_57509 ?auto_57519 ) ) ( AVAILABLE ?auto_57521 ) ( not ( = ?auto_57513 ?auto_57520 ) ) ( not ( = ?auto_57522 ?auto_57513 ) ) ( not ( = ?auto_57514 ?auto_57513 ) ) ( HOIST-AT ?auto_57511 ?auto_57513 ) ( not ( = ?auto_57521 ?auto_57511 ) ) ( not ( = ?auto_57512 ?auto_57511 ) ) ( not ( = ?auto_57515 ?auto_57511 ) ) ( AVAILABLE ?auto_57511 ) ( SURFACE-AT ?auto_57516 ?auto_57513 ) ( ON ?auto_57516 ?auto_57517 ) ( CLEAR ?auto_57516 ) ( not ( = ?auto_57507 ?auto_57517 ) ) ( not ( = ?auto_57508 ?auto_57517 ) ) ( not ( = ?auto_57510 ?auto_57517 ) ) ( not ( = ?auto_57516 ?auto_57517 ) ) ( not ( = ?auto_57509 ?auto_57517 ) ) ( not ( = ?auto_57519 ?auto_57517 ) ) ( TRUCK-AT ?auto_57518 ?auto_57520 ) )
    :subtasks
    ( ( !DRIVE ?auto_57518 ?auto_57520 ?auto_57513 )
      ( MAKE-ON ?auto_57507 ?auto_57508 )
      ( MAKE-ON-VERIFY ?auto_57507 ?auto_57508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57523 - SURFACE
      ?auto_57524 - SURFACE
    )
    :vars
    (
      ?auto_57534 - HOIST
      ?auto_57538 - PLACE
      ?auto_57526 - PLACE
      ?auto_57527 - HOIST
      ?auto_57537 - SURFACE
      ?auto_57530 - SURFACE
      ?auto_57525 - PLACE
      ?auto_57535 - HOIST
      ?auto_57529 - SURFACE
      ?auto_57531 - SURFACE
      ?auto_57533 - PLACE
      ?auto_57536 - HOIST
      ?auto_57528 - SURFACE
      ?auto_57532 - TRUCK
      ?auto_57539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57534 ?auto_57538 ) ( IS-CRATE ?auto_57523 ) ( not ( = ?auto_57523 ?auto_57524 ) ) ( not ( = ?auto_57526 ?auto_57538 ) ) ( HOIST-AT ?auto_57527 ?auto_57526 ) ( not ( = ?auto_57534 ?auto_57527 ) ) ( AVAILABLE ?auto_57527 ) ( SURFACE-AT ?auto_57523 ?auto_57526 ) ( ON ?auto_57523 ?auto_57537 ) ( CLEAR ?auto_57523 ) ( not ( = ?auto_57523 ?auto_57537 ) ) ( not ( = ?auto_57524 ?auto_57537 ) ) ( IS-CRATE ?auto_57524 ) ( not ( = ?auto_57523 ?auto_57530 ) ) ( not ( = ?auto_57524 ?auto_57530 ) ) ( not ( = ?auto_57537 ?auto_57530 ) ) ( not ( = ?auto_57525 ?auto_57538 ) ) ( not ( = ?auto_57526 ?auto_57525 ) ) ( HOIST-AT ?auto_57535 ?auto_57525 ) ( not ( = ?auto_57534 ?auto_57535 ) ) ( not ( = ?auto_57527 ?auto_57535 ) ) ( AVAILABLE ?auto_57535 ) ( SURFACE-AT ?auto_57524 ?auto_57525 ) ( ON ?auto_57524 ?auto_57529 ) ( CLEAR ?auto_57524 ) ( not ( = ?auto_57523 ?auto_57529 ) ) ( not ( = ?auto_57524 ?auto_57529 ) ) ( not ( = ?auto_57537 ?auto_57529 ) ) ( not ( = ?auto_57530 ?auto_57529 ) ) ( IS-CRATE ?auto_57530 ) ( not ( = ?auto_57523 ?auto_57531 ) ) ( not ( = ?auto_57524 ?auto_57531 ) ) ( not ( = ?auto_57537 ?auto_57531 ) ) ( not ( = ?auto_57530 ?auto_57531 ) ) ( not ( = ?auto_57529 ?auto_57531 ) ) ( not ( = ?auto_57533 ?auto_57538 ) ) ( not ( = ?auto_57526 ?auto_57533 ) ) ( not ( = ?auto_57525 ?auto_57533 ) ) ( HOIST-AT ?auto_57536 ?auto_57533 ) ( not ( = ?auto_57534 ?auto_57536 ) ) ( not ( = ?auto_57527 ?auto_57536 ) ) ( not ( = ?auto_57535 ?auto_57536 ) ) ( AVAILABLE ?auto_57536 ) ( SURFACE-AT ?auto_57530 ?auto_57533 ) ( ON ?auto_57530 ?auto_57528 ) ( CLEAR ?auto_57530 ) ( not ( = ?auto_57523 ?auto_57528 ) ) ( not ( = ?auto_57524 ?auto_57528 ) ) ( not ( = ?auto_57537 ?auto_57528 ) ) ( not ( = ?auto_57530 ?auto_57528 ) ) ( not ( = ?auto_57529 ?auto_57528 ) ) ( not ( = ?auto_57531 ?auto_57528 ) ) ( TRUCK-AT ?auto_57532 ?auto_57538 ) ( SURFACE-AT ?auto_57539 ?auto_57538 ) ( CLEAR ?auto_57539 ) ( LIFTING ?auto_57534 ?auto_57531 ) ( IS-CRATE ?auto_57531 ) ( not ( = ?auto_57523 ?auto_57539 ) ) ( not ( = ?auto_57524 ?auto_57539 ) ) ( not ( = ?auto_57537 ?auto_57539 ) ) ( not ( = ?auto_57530 ?auto_57539 ) ) ( not ( = ?auto_57529 ?auto_57539 ) ) ( not ( = ?auto_57531 ?auto_57539 ) ) ( not ( = ?auto_57528 ?auto_57539 ) ) )
    :subtasks
    ( ( !DROP ?auto_57534 ?auto_57531 ?auto_57539 ?auto_57538 )
      ( MAKE-ON ?auto_57523 ?auto_57524 )
      ( MAKE-ON-VERIFY ?auto_57523 ?auto_57524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57540 - SURFACE
      ?auto_57541 - SURFACE
    )
    :vars
    (
      ?auto_57552 - HOIST
      ?auto_57543 - PLACE
      ?auto_57544 - PLACE
      ?auto_57550 - HOIST
      ?auto_57549 - SURFACE
      ?auto_57542 - SURFACE
      ?auto_57551 - PLACE
      ?auto_57548 - HOIST
      ?auto_57553 - SURFACE
      ?auto_57555 - SURFACE
      ?auto_57547 - PLACE
      ?auto_57546 - HOIST
      ?auto_57545 - SURFACE
      ?auto_57556 - TRUCK
      ?auto_57554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57552 ?auto_57543 ) ( IS-CRATE ?auto_57540 ) ( not ( = ?auto_57540 ?auto_57541 ) ) ( not ( = ?auto_57544 ?auto_57543 ) ) ( HOIST-AT ?auto_57550 ?auto_57544 ) ( not ( = ?auto_57552 ?auto_57550 ) ) ( AVAILABLE ?auto_57550 ) ( SURFACE-AT ?auto_57540 ?auto_57544 ) ( ON ?auto_57540 ?auto_57549 ) ( CLEAR ?auto_57540 ) ( not ( = ?auto_57540 ?auto_57549 ) ) ( not ( = ?auto_57541 ?auto_57549 ) ) ( IS-CRATE ?auto_57541 ) ( not ( = ?auto_57540 ?auto_57542 ) ) ( not ( = ?auto_57541 ?auto_57542 ) ) ( not ( = ?auto_57549 ?auto_57542 ) ) ( not ( = ?auto_57551 ?auto_57543 ) ) ( not ( = ?auto_57544 ?auto_57551 ) ) ( HOIST-AT ?auto_57548 ?auto_57551 ) ( not ( = ?auto_57552 ?auto_57548 ) ) ( not ( = ?auto_57550 ?auto_57548 ) ) ( AVAILABLE ?auto_57548 ) ( SURFACE-AT ?auto_57541 ?auto_57551 ) ( ON ?auto_57541 ?auto_57553 ) ( CLEAR ?auto_57541 ) ( not ( = ?auto_57540 ?auto_57553 ) ) ( not ( = ?auto_57541 ?auto_57553 ) ) ( not ( = ?auto_57549 ?auto_57553 ) ) ( not ( = ?auto_57542 ?auto_57553 ) ) ( IS-CRATE ?auto_57542 ) ( not ( = ?auto_57540 ?auto_57555 ) ) ( not ( = ?auto_57541 ?auto_57555 ) ) ( not ( = ?auto_57549 ?auto_57555 ) ) ( not ( = ?auto_57542 ?auto_57555 ) ) ( not ( = ?auto_57553 ?auto_57555 ) ) ( not ( = ?auto_57547 ?auto_57543 ) ) ( not ( = ?auto_57544 ?auto_57547 ) ) ( not ( = ?auto_57551 ?auto_57547 ) ) ( HOIST-AT ?auto_57546 ?auto_57547 ) ( not ( = ?auto_57552 ?auto_57546 ) ) ( not ( = ?auto_57550 ?auto_57546 ) ) ( not ( = ?auto_57548 ?auto_57546 ) ) ( AVAILABLE ?auto_57546 ) ( SURFACE-AT ?auto_57542 ?auto_57547 ) ( ON ?auto_57542 ?auto_57545 ) ( CLEAR ?auto_57542 ) ( not ( = ?auto_57540 ?auto_57545 ) ) ( not ( = ?auto_57541 ?auto_57545 ) ) ( not ( = ?auto_57549 ?auto_57545 ) ) ( not ( = ?auto_57542 ?auto_57545 ) ) ( not ( = ?auto_57553 ?auto_57545 ) ) ( not ( = ?auto_57555 ?auto_57545 ) ) ( TRUCK-AT ?auto_57556 ?auto_57543 ) ( SURFACE-AT ?auto_57554 ?auto_57543 ) ( CLEAR ?auto_57554 ) ( IS-CRATE ?auto_57555 ) ( not ( = ?auto_57540 ?auto_57554 ) ) ( not ( = ?auto_57541 ?auto_57554 ) ) ( not ( = ?auto_57549 ?auto_57554 ) ) ( not ( = ?auto_57542 ?auto_57554 ) ) ( not ( = ?auto_57553 ?auto_57554 ) ) ( not ( = ?auto_57555 ?auto_57554 ) ) ( not ( = ?auto_57545 ?auto_57554 ) ) ( AVAILABLE ?auto_57552 ) ( IN ?auto_57555 ?auto_57556 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57552 ?auto_57555 ?auto_57556 ?auto_57543 )
      ( MAKE-ON ?auto_57540 ?auto_57541 )
      ( MAKE-ON-VERIFY ?auto_57540 ?auto_57541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57557 - SURFACE
      ?auto_57558 - SURFACE
    )
    :vars
    (
      ?auto_57572 - HOIST
      ?auto_57569 - PLACE
      ?auto_57559 - PLACE
      ?auto_57571 - HOIST
      ?auto_57573 - SURFACE
      ?auto_57561 - SURFACE
      ?auto_57567 - PLACE
      ?auto_57570 - HOIST
      ?auto_57563 - SURFACE
      ?auto_57565 - SURFACE
      ?auto_57562 - PLACE
      ?auto_57566 - HOIST
      ?auto_57560 - SURFACE
      ?auto_57568 - SURFACE
      ?auto_57564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57572 ?auto_57569 ) ( IS-CRATE ?auto_57557 ) ( not ( = ?auto_57557 ?auto_57558 ) ) ( not ( = ?auto_57559 ?auto_57569 ) ) ( HOIST-AT ?auto_57571 ?auto_57559 ) ( not ( = ?auto_57572 ?auto_57571 ) ) ( AVAILABLE ?auto_57571 ) ( SURFACE-AT ?auto_57557 ?auto_57559 ) ( ON ?auto_57557 ?auto_57573 ) ( CLEAR ?auto_57557 ) ( not ( = ?auto_57557 ?auto_57573 ) ) ( not ( = ?auto_57558 ?auto_57573 ) ) ( IS-CRATE ?auto_57558 ) ( not ( = ?auto_57557 ?auto_57561 ) ) ( not ( = ?auto_57558 ?auto_57561 ) ) ( not ( = ?auto_57573 ?auto_57561 ) ) ( not ( = ?auto_57567 ?auto_57569 ) ) ( not ( = ?auto_57559 ?auto_57567 ) ) ( HOIST-AT ?auto_57570 ?auto_57567 ) ( not ( = ?auto_57572 ?auto_57570 ) ) ( not ( = ?auto_57571 ?auto_57570 ) ) ( AVAILABLE ?auto_57570 ) ( SURFACE-AT ?auto_57558 ?auto_57567 ) ( ON ?auto_57558 ?auto_57563 ) ( CLEAR ?auto_57558 ) ( not ( = ?auto_57557 ?auto_57563 ) ) ( not ( = ?auto_57558 ?auto_57563 ) ) ( not ( = ?auto_57573 ?auto_57563 ) ) ( not ( = ?auto_57561 ?auto_57563 ) ) ( IS-CRATE ?auto_57561 ) ( not ( = ?auto_57557 ?auto_57565 ) ) ( not ( = ?auto_57558 ?auto_57565 ) ) ( not ( = ?auto_57573 ?auto_57565 ) ) ( not ( = ?auto_57561 ?auto_57565 ) ) ( not ( = ?auto_57563 ?auto_57565 ) ) ( not ( = ?auto_57562 ?auto_57569 ) ) ( not ( = ?auto_57559 ?auto_57562 ) ) ( not ( = ?auto_57567 ?auto_57562 ) ) ( HOIST-AT ?auto_57566 ?auto_57562 ) ( not ( = ?auto_57572 ?auto_57566 ) ) ( not ( = ?auto_57571 ?auto_57566 ) ) ( not ( = ?auto_57570 ?auto_57566 ) ) ( AVAILABLE ?auto_57566 ) ( SURFACE-AT ?auto_57561 ?auto_57562 ) ( ON ?auto_57561 ?auto_57560 ) ( CLEAR ?auto_57561 ) ( not ( = ?auto_57557 ?auto_57560 ) ) ( not ( = ?auto_57558 ?auto_57560 ) ) ( not ( = ?auto_57573 ?auto_57560 ) ) ( not ( = ?auto_57561 ?auto_57560 ) ) ( not ( = ?auto_57563 ?auto_57560 ) ) ( not ( = ?auto_57565 ?auto_57560 ) ) ( SURFACE-AT ?auto_57568 ?auto_57569 ) ( CLEAR ?auto_57568 ) ( IS-CRATE ?auto_57565 ) ( not ( = ?auto_57557 ?auto_57568 ) ) ( not ( = ?auto_57558 ?auto_57568 ) ) ( not ( = ?auto_57573 ?auto_57568 ) ) ( not ( = ?auto_57561 ?auto_57568 ) ) ( not ( = ?auto_57563 ?auto_57568 ) ) ( not ( = ?auto_57565 ?auto_57568 ) ) ( not ( = ?auto_57560 ?auto_57568 ) ) ( AVAILABLE ?auto_57572 ) ( IN ?auto_57565 ?auto_57564 ) ( TRUCK-AT ?auto_57564 ?auto_57559 ) )
    :subtasks
    ( ( !DRIVE ?auto_57564 ?auto_57559 ?auto_57569 )
      ( MAKE-ON ?auto_57557 ?auto_57558 )
      ( MAKE-ON-VERIFY ?auto_57557 ?auto_57558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57574 - SURFACE
      ?auto_57575 - SURFACE
    )
    :vars
    (
      ?auto_57590 - HOIST
      ?auto_57581 - PLACE
      ?auto_57588 - PLACE
      ?auto_57584 - HOIST
      ?auto_57589 - SURFACE
      ?auto_57580 - SURFACE
      ?auto_57576 - PLACE
      ?auto_57585 - HOIST
      ?auto_57586 - SURFACE
      ?auto_57583 - SURFACE
      ?auto_57582 - PLACE
      ?auto_57577 - HOIST
      ?auto_57579 - SURFACE
      ?auto_57587 - SURFACE
      ?auto_57578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57590 ?auto_57581 ) ( IS-CRATE ?auto_57574 ) ( not ( = ?auto_57574 ?auto_57575 ) ) ( not ( = ?auto_57588 ?auto_57581 ) ) ( HOIST-AT ?auto_57584 ?auto_57588 ) ( not ( = ?auto_57590 ?auto_57584 ) ) ( SURFACE-AT ?auto_57574 ?auto_57588 ) ( ON ?auto_57574 ?auto_57589 ) ( CLEAR ?auto_57574 ) ( not ( = ?auto_57574 ?auto_57589 ) ) ( not ( = ?auto_57575 ?auto_57589 ) ) ( IS-CRATE ?auto_57575 ) ( not ( = ?auto_57574 ?auto_57580 ) ) ( not ( = ?auto_57575 ?auto_57580 ) ) ( not ( = ?auto_57589 ?auto_57580 ) ) ( not ( = ?auto_57576 ?auto_57581 ) ) ( not ( = ?auto_57588 ?auto_57576 ) ) ( HOIST-AT ?auto_57585 ?auto_57576 ) ( not ( = ?auto_57590 ?auto_57585 ) ) ( not ( = ?auto_57584 ?auto_57585 ) ) ( AVAILABLE ?auto_57585 ) ( SURFACE-AT ?auto_57575 ?auto_57576 ) ( ON ?auto_57575 ?auto_57586 ) ( CLEAR ?auto_57575 ) ( not ( = ?auto_57574 ?auto_57586 ) ) ( not ( = ?auto_57575 ?auto_57586 ) ) ( not ( = ?auto_57589 ?auto_57586 ) ) ( not ( = ?auto_57580 ?auto_57586 ) ) ( IS-CRATE ?auto_57580 ) ( not ( = ?auto_57574 ?auto_57583 ) ) ( not ( = ?auto_57575 ?auto_57583 ) ) ( not ( = ?auto_57589 ?auto_57583 ) ) ( not ( = ?auto_57580 ?auto_57583 ) ) ( not ( = ?auto_57586 ?auto_57583 ) ) ( not ( = ?auto_57582 ?auto_57581 ) ) ( not ( = ?auto_57588 ?auto_57582 ) ) ( not ( = ?auto_57576 ?auto_57582 ) ) ( HOIST-AT ?auto_57577 ?auto_57582 ) ( not ( = ?auto_57590 ?auto_57577 ) ) ( not ( = ?auto_57584 ?auto_57577 ) ) ( not ( = ?auto_57585 ?auto_57577 ) ) ( AVAILABLE ?auto_57577 ) ( SURFACE-AT ?auto_57580 ?auto_57582 ) ( ON ?auto_57580 ?auto_57579 ) ( CLEAR ?auto_57580 ) ( not ( = ?auto_57574 ?auto_57579 ) ) ( not ( = ?auto_57575 ?auto_57579 ) ) ( not ( = ?auto_57589 ?auto_57579 ) ) ( not ( = ?auto_57580 ?auto_57579 ) ) ( not ( = ?auto_57586 ?auto_57579 ) ) ( not ( = ?auto_57583 ?auto_57579 ) ) ( SURFACE-AT ?auto_57587 ?auto_57581 ) ( CLEAR ?auto_57587 ) ( IS-CRATE ?auto_57583 ) ( not ( = ?auto_57574 ?auto_57587 ) ) ( not ( = ?auto_57575 ?auto_57587 ) ) ( not ( = ?auto_57589 ?auto_57587 ) ) ( not ( = ?auto_57580 ?auto_57587 ) ) ( not ( = ?auto_57586 ?auto_57587 ) ) ( not ( = ?auto_57583 ?auto_57587 ) ) ( not ( = ?auto_57579 ?auto_57587 ) ) ( AVAILABLE ?auto_57590 ) ( TRUCK-AT ?auto_57578 ?auto_57588 ) ( LIFTING ?auto_57584 ?auto_57583 ) )
    :subtasks
    ( ( !LOAD ?auto_57584 ?auto_57583 ?auto_57578 ?auto_57588 )
      ( MAKE-ON ?auto_57574 ?auto_57575 )
      ( MAKE-ON-VERIFY ?auto_57574 ?auto_57575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57591 - SURFACE
      ?auto_57592 - SURFACE
    )
    :vars
    (
      ?auto_57596 - HOIST
      ?auto_57599 - PLACE
      ?auto_57603 - PLACE
      ?auto_57605 - HOIST
      ?auto_57606 - SURFACE
      ?auto_57607 - SURFACE
      ?auto_57593 - PLACE
      ?auto_57594 - HOIST
      ?auto_57595 - SURFACE
      ?auto_57598 - SURFACE
      ?auto_57600 - PLACE
      ?auto_57604 - HOIST
      ?auto_57601 - SURFACE
      ?auto_57602 - SURFACE
      ?auto_57597 - TRUCK
      ?auto_57608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57596 ?auto_57599 ) ( IS-CRATE ?auto_57591 ) ( not ( = ?auto_57591 ?auto_57592 ) ) ( not ( = ?auto_57603 ?auto_57599 ) ) ( HOIST-AT ?auto_57605 ?auto_57603 ) ( not ( = ?auto_57596 ?auto_57605 ) ) ( SURFACE-AT ?auto_57591 ?auto_57603 ) ( ON ?auto_57591 ?auto_57606 ) ( CLEAR ?auto_57591 ) ( not ( = ?auto_57591 ?auto_57606 ) ) ( not ( = ?auto_57592 ?auto_57606 ) ) ( IS-CRATE ?auto_57592 ) ( not ( = ?auto_57591 ?auto_57607 ) ) ( not ( = ?auto_57592 ?auto_57607 ) ) ( not ( = ?auto_57606 ?auto_57607 ) ) ( not ( = ?auto_57593 ?auto_57599 ) ) ( not ( = ?auto_57603 ?auto_57593 ) ) ( HOIST-AT ?auto_57594 ?auto_57593 ) ( not ( = ?auto_57596 ?auto_57594 ) ) ( not ( = ?auto_57605 ?auto_57594 ) ) ( AVAILABLE ?auto_57594 ) ( SURFACE-AT ?auto_57592 ?auto_57593 ) ( ON ?auto_57592 ?auto_57595 ) ( CLEAR ?auto_57592 ) ( not ( = ?auto_57591 ?auto_57595 ) ) ( not ( = ?auto_57592 ?auto_57595 ) ) ( not ( = ?auto_57606 ?auto_57595 ) ) ( not ( = ?auto_57607 ?auto_57595 ) ) ( IS-CRATE ?auto_57607 ) ( not ( = ?auto_57591 ?auto_57598 ) ) ( not ( = ?auto_57592 ?auto_57598 ) ) ( not ( = ?auto_57606 ?auto_57598 ) ) ( not ( = ?auto_57607 ?auto_57598 ) ) ( not ( = ?auto_57595 ?auto_57598 ) ) ( not ( = ?auto_57600 ?auto_57599 ) ) ( not ( = ?auto_57603 ?auto_57600 ) ) ( not ( = ?auto_57593 ?auto_57600 ) ) ( HOIST-AT ?auto_57604 ?auto_57600 ) ( not ( = ?auto_57596 ?auto_57604 ) ) ( not ( = ?auto_57605 ?auto_57604 ) ) ( not ( = ?auto_57594 ?auto_57604 ) ) ( AVAILABLE ?auto_57604 ) ( SURFACE-AT ?auto_57607 ?auto_57600 ) ( ON ?auto_57607 ?auto_57601 ) ( CLEAR ?auto_57607 ) ( not ( = ?auto_57591 ?auto_57601 ) ) ( not ( = ?auto_57592 ?auto_57601 ) ) ( not ( = ?auto_57606 ?auto_57601 ) ) ( not ( = ?auto_57607 ?auto_57601 ) ) ( not ( = ?auto_57595 ?auto_57601 ) ) ( not ( = ?auto_57598 ?auto_57601 ) ) ( SURFACE-AT ?auto_57602 ?auto_57599 ) ( CLEAR ?auto_57602 ) ( IS-CRATE ?auto_57598 ) ( not ( = ?auto_57591 ?auto_57602 ) ) ( not ( = ?auto_57592 ?auto_57602 ) ) ( not ( = ?auto_57606 ?auto_57602 ) ) ( not ( = ?auto_57607 ?auto_57602 ) ) ( not ( = ?auto_57595 ?auto_57602 ) ) ( not ( = ?auto_57598 ?auto_57602 ) ) ( not ( = ?auto_57601 ?auto_57602 ) ) ( AVAILABLE ?auto_57596 ) ( TRUCK-AT ?auto_57597 ?auto_57603 ) ( AVAILABLE ?auto_57605 ) ( SURFACE-AT ?auto_57598 ?auto_57603 ) ( ON ?auto_57598 ?auto_57608 ) ( CLEAR ?auto_57598 ) ( not ( = ?auto_57591 ?auto_57608 ) ) ( not ( = ?auto_57592 ?auto_57608 ) ) ( not ( = ?auto_57606 ?auto_57608 ) ) ( not ( = ?auto_57607 ?auto_57608 ) ) ( not ( = ?auto_57595 ?auto_57608 ) ) ( not ( = ?auto_57598 ?auto_57608 ) ) ( not ( = ?auto_57601 ?auto_57608 ) ) ( not ( = ?auto_57602 ?auto_57608 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57605 ?auto_57598 ?auto_57608 ?auto_57603 )
      ( MAKE-ON ?auto_57591 ?auto_57592 )
      ( MAKE-ON-VERIFY ?auto_57591 ?auto_57592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57609 - SURFACE
      ?auto_57610 - SURFACE
    )
    :vars
    (
      ?auto_57622 - HOIST
      ?auto_57626 - PLACE
      ?auto_57620 - PLACE
      ?auto_57619 - HOIST
      ?auto_57618 - SURFACE
      ?auto_57625 - SURFACE
      ?auto_57616 - PLACE
      ?auto_57621 - HOIST
      ?auto_57613 - SURFACE
      ?auto_57615 - SURFACE
      ?auto_57614 - PLACE
      ?auto_57617 - HOIST
      ?auto_57611 - SURFACE
      ?auto_57612 - SURFACE
      ?auto_57624 - SURFACE
      ?auto_57623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57622 ?auto_57626 ) ( IS-CRATE ?auto_57609 ) ( not ( = ?auto_57609 ?auto_57610 ) ) ( not ( = ?auto_57620 ?auto_57626 ) ) ( HOIST-AT ?auto_57619 ?auto_57620 ) ( not ( = ?auto_57622 ?auto_57619 ) ) ( SURFACE-AT ?auto_57609 ?auto_57620 ) ( ON ?auto_57609 ?auto_57618 ) ( CLEAR ?auto_57609 ) ( not ( = ?auto_57609 ?auto_57618 ) ) ( not ( = ?auto_57610 ?auto_57618 ) ) ( IS-CRATE ?auto_57610 ) ( not ( = ?auto_57609 ?auto_57625 ) ) ( not ( = ?auto_57610 ?auto_57625 ) ) ( not ( = ?auto_57618 ?auto_57625 ) ) ( not ( = ?auto_57616 ?auto_57626 ) ) ( not ( = ?auto_57620 ?auto_57616 ) ) ( HOIST-AT ?auto_57621 ?auto_57616 ) ( not ( = ?auto_57622 ?auto_57621 ) ) ( not ( = ?auto_57619 ?auto_57621 ) ) ( AVAILABLE ?auto_57621 ) ( SURFACE-AT ?auto_57610 ?auto_57616 ) ( ON ?auto_57610 ?auto_57613 ) ( CLEAR ?auto_57610 ) ( not ( = ?auto_57609 ?auto_57613 ) ) ( not ( = ?auto_57610 ?auto_57613 ) ) ( not ( = ?auto_57618 ?auto_57613 ) ) ( not ( = ?auto_57625 ?auto_57613 ) ) ( IS-CRATE ?auto_57625 ) ( not ( = ?auto_57609 ?auto_57615 ) ) ( not ( = ?auto_57610 ?auto_57615 ) ) ( not ( = ?auto_57618 ?auto_57615 ) ) ( not ( = ?auto_57625 ?auto_57615 ) ) ( not ( = ?auto_57613 ?auto_57615 ) ) ( not ( = ?auto_57614 ?auto_57626 ) ) ( not ( = ?auto_57620 ?auto_57614 ) ) ( not ( = ?auto_57616 ?auto_57614 ) ) ( HOIST-AT ?auto_57617 ?auto_57614 ) ( not ( = ?auto_57622 ?auto_57617 ) ) ( not ( = ?auto_57619 ?auto_57617 ) ) ( not ( = ?auto_57621 ?auto_57617 ) ) ( AVAILABLE ?auto_57617 ) ( SURFACE-AT ?auto_57625 ?auto_57614 ) ( ON ?auto_57625 ?auto_57611 ) ( CLEAR ?auto_57625 ) ( not ( = ?auto_57609 ?auto_57611 ) ) ( not ( = ?auto_57610 ?auto_57611 ) ) ( not ( = ?auto_57618 ?auto_57611 ) ) ( not ( = ?auto_57625 ?auto_57611 ) ) ( not ( = ?auto_57613 ?auto_57611 ) ) ( not ( = ?auto_57615 ?auto_57611 ) ) ( SURFACE-AT ?auto_57612 ?auto_57626 ) ( CLEAR ?auto_57612 ) ( IS-CRATE ?auto_57615 ) ( not ( = ?auto_57609 ?auto_57612 ) ) ( not ( = ?auto_57610 ?auto_57612 ) ) ( not ( = ?auto_57618 ?auto_57612 ) ) ( not ( = ?auto_57625 ?auto_57612 ) ) ( not ( = ?auto_57613 ?auto_57612 ) ) ( not ( = ?auto_57615 ?auto_57612 ) ) ( not ( = ?auto_57611 ?auto_57612 ) ) ( AVAILABLE ?auto_57622 ) ( AVAILABLE ?auto_57619 ) ( SURFACE-AT ?auto_57615 ?auto_57620 ) ( ON ?auto_57615 ?auto_57624 ) ( CLEAR ?auto_57615 ) ( not ( = ?auto_57609 ?auto_57624 ) ) ( not ( = ?auto_57610 ?auto_57624 ) ) ( not ( = ?auto_57618 ?auto_57624 ) ) ( not ( = ?auto_57625 ?auto_57624 ) ) ( not ( = ?auto_57613 ?auto_57624 ) ) ( not ( = ?auto_57615 ?auto_57624 ) ) ( not ( = ?auto_57611 ?auto_57624 ) ) ( not ( = ?auto_57612 ?auto_57624 ) ) ( TRUCK-AT ?auto_57623 ?auto_57626 ) )
    :subtasks
    ( ( !DRIVE ?auto_57623 ?auto_57626 ?auto_57620 )
      ( MAKE-ON ?auto_57609 ?auto_57610 )
      ( MAKE-ON-VERIFY ?auto_57609 ?auto_57610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57627 - SURFACE
      ?auto_57628 - SURFACE
    )
    :vars
    (
      ?auto_57630 - HOIST
      ?auto_57637 - PLACE
      ?auto_57633 - PLACE
      ?auto_57638 - HOIST
      ?auto_57631 - SURFACE
      ?auto_57639 - SURFACE
      ?auto_57644 - PLACE
      ?auto_57640 - HOIST
      ?auto_57642 - SURFACE
      ?auto_57636 - SURFACE
      ?auto_57641 - PLACE
      ?auto_57634 - HOIST
      ?auto_57635 - SURFACE
      ?auto_57643 - SURFACE
      ?auto_57629 - SURFACE
      ?auto_57632 - TRUCK
      ?auto_57645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57630 ?auto_57637 ) ( IS-CRATE ?auto_57627 ) ( not ( = ?auto_57627 ?auto_57628 ) ) ( not ( = ?auto_57633 ?auto_57637 ) ) ( HOIST-AT ?auto_57638 ?auto_57633 ) ( not ( = ?auto_57630 ?auto_57638 ) ) ( SURFACE-AT ?auto_57627 ?auto_57633 ) ( ON ?auto_57627 ?auto_57631 ) ( CLEAR ?auto_57627 ) ( not ( = ?auto_57627 ?auto_57631 ) ) ( not ( = ?auto_57628 ?auto_57631 ) ) ( IS-CRATE ?auto_57628 ) ( not ( = ?auto_57627 ?auto_57639 ) ) ( not ( = ?auto_57628 ?auto_57639 ) ) ( not ( = ?auto_57631 ?auto_57639 ) ) ( not ( = ?auto_57644 ?auto_57637 ) ) ( not ( = ?auto_57633 ?auto_57644 ) ) ( HOIST-AT ?auto_57640 ?auto_57644 ) ( not ( = ?auto_57630 ?auto_57640 ) ) ( not ( = ?auto_57638 ?auto_57640 ) ) ( AVAILABLE ?auto_57640 ) ( SURFACE-AT ?auto_57628 ?auto_57644 ) ( ON ?auto_57628 ?auto_57642 ) ( CLEAR ?auto_57628 ) ( not ( = ?auto_57627 ?auto_57642 ) ) ( not ( = ?auto_57628 ?auto_57642 ) ) ( not ( = ?auto_57631 ?auto_57642 ) ) ( not ( = ?auto_57639 ?auto_57642 ) ) ( IS-CRATE ?auto_57639 ) ( not ( = ?auto_57627 ?auto_57636 ) ) ( not ( = ?auto_57628 ?auto_57636 ) ) ( not ( = ?auto_57631 ?auto_57636 ) ) ( not ( = ?auto_57639 ?auto_57636 ) ) ( not ( = ?auto_57642 ?auto_57636 ) ) ( not ( = ?auto_57641 ?auto_57637 ) ) ( not ( = ?auto_57633 ?auto_57641 ) ) ( not ( = ?auto_57644 ?auto_57641 ) ) ( HOIST-AT ?auto_57634 ?auto_57641 ) ( not ( = ?auto_57630 ?auto_57634 ) ) ( not ( = ?auto_57638 ?auto_57634 ) ) ( not ( = ?auto_57640 ?auto_57634 ) ) ( AVAILABLE ?auto_57634 ) ( SURFACE-AT ?auto_57639 ?auto_57641 ) ( ON ?auto_57639 ?auto_57635 ) ( CLEAR ?auto_57639 ) ( not ( = ?auto_57627 ?auto_57635 ) ) ( not ( = ?auto_57628 ?auto_57635 ) ) ( not ( = ?auto_57631 ?auto_57635 ) ) ( not ( = ?auto_57639 ?auto_57635 ) ) ( not ( = ?auto_57642 ?auto_57635 ) ) ( not ( = ?auto_57636 ?auto_57635 ) ) ( IS-CRATE ?auto_57636 ) ( not ( = ?auto_57627 ?auto_57643 ) ) ( not ( = ?auto_57628 ?auto_57643 ) ) ( not ( = ?auto_57631 ?auto_57643 ) ) ( not ( = ?auto_57639 ?auto_57643 ) ) ( not ( = ?auto_57642 ?auto_57643 ) ) ( not ( = ?auto_57636 ?auto_57643 ) ) ( not ( = ?auto_57635 ?auto_57643 ) ) ( AVAILABLE ?auto_57638 ) ( SURFACE-AT ?auto_57636 ?auto_57633 ) ( ON ?auto_57636 ?auto_57629 ) ( CLEAR ?auto_57636 ) ( not ( = ?auto_57627 ?auto_57629 ) ) ( not ( = ?auto_57628 ?auto_57629 ) ) ( not ( = ?auto_57631 ?auto_57629 ) ) ( not ( = ?auto_57639 ?auto_57629 ) ) ( not ( = ?auto_57642 ?auto_57629 ) ) ( not ( = ?auto_57636 ?auto_57629 ) ) ( not ( = ?auto_57635 ?auto_57629 ) ) ( not ( = ?auto_57643 ?auto_57629 ) ) ( TRUCK-AT ?auto_57632 ?auto_57637 ) ( SURFACE-AT ?auto_57645 ?auto_57637 ) ( CLEAR ?auto_57645 ) ( LIFTING ?auto_57630 ?auto_57643 ) ( IS-CRATE ?auto_57643 ) ( not ( = ?auto_57627 ?auto_57645 ) ) ( not ( = ?auto_57628 ?auto_57645 ) ) ( not ( = ?auto_57631 ?auto_57645 ) ) ( not ( = ?auto_57639 ?auto_57645 ) ) ( not ( = ?auto_57642 ?auto_57645 ) ) ( not ( = ?auto_57636 ?auto_57645 ) ) ( not ( = ?auto_57635 ?auto_57645 ) ) ( not ( = ?auto_57643 ?auto_57645 ) ) ( not ( = ?auto_57629 ?auto_57645 ) ) )
    :subtasks
    ( ( !DROP ?auto_57630 ?auto_57643 ?auto_57645 ?auto_57637 )
      ( MAKE-ON ?auto_57627 ?auto_57628 )
      ( MAKE-ON-VERIFY ?auto_57627 ?auto_57628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57646 - SURFACE
      ?auto_57647 - SURFACE
    )
    :vars
    (
      ?auto_57649 - HOIST
      ?auto_57657 - PLACE
      ?auto_57664 - PLACE
      ?auto_57659 - HOIST
      ?auto_57662 - SURFACE
      ?auto_57654 - SURFACE
      ?auto_57651 - PLACE
      ?auto_57652 - HOIST
      ?auto_57655 - SURFACE
      ?auto_57648 - SURFACE
      ?auto_57661 - PLACE
      ?auto_57653 - HOIST
      ?auto_57650 - SURFACE
      ?auto_57660 - SURFACE
      ?auto_57658 - SURFACE
      ?auto_57663 - TRUCK
      ?auto_57656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57649 ?auto_57657 ) ( IS-CRATE ?auto_57646 ) ( not ( = ?auto_57646 ?auto_57647 ) ) ( not ( = ?auto_57664 ?auto_57657 ) ) ( HOIST-AT ?auto_57659 ?auto_57664 ) ( not ( = ?auto_57649 ?auto_57659 ) ) ( SURFACE-AT ?auto_57646 ?auto_57664 ) ( ON ?auto_57646 ?auto_57662 ) ( CLEAR ?auto_57646 ) ( not ( = ?auto_57646 ?auto_57662 ) ) ( not ( = ?auto_57647 ?auto_57662 ) ) ( IS-CRATE ?auto_57647 ) ( not ( = ?auto_57646 ?auto_57654 ) ) ( not ( = ?auto_57647 ?auto_57654 ) ) ( not ( = ?auto_57662 ?auto_57654 ) ) ( not ( = ?auto_57651 ?auto_57657 ) ) ( not ( = ?auto_57664 ?auto_57651 ) ) ( HOIST-AT ?auto_57652 ?auto_57651 ) ( not ( = ?auto_57649 ?auto_57652 ) ) ( not ( = ?auto_57659 ?auto_57652 ) ) ( AVAILABLE ?auto_57652 ) ( SURFACE-AT ?auto_57647 ?auto_57651 ) ( ON ?auto_57647 ?auto_57655 ) ( CLEAR ?auto_57647 ) ( not ( = ?auto_57646 ?auto_57655 ) ) ( not ( = ?auto_57647 ?auto_57655 ) ) ( not ( = ?auto_57662 ?auto_57655 ) ) ( not ( = ?auto_57654 ?auto_57655 ) ) ( IS-CRATE ?auto_57654 ) ( not ( = ?auto_57646 ?auto_57648 ) ) ( not ( = ?auto_57647 ?auto_57648 ) ) ( not ( = ?auto_57662 ?auto_57648 ) ) ( not ( = ?auto_57654 ?auto_57648 ) ) ( not ( = ?auto_57655 ?auto_57648 ) ) ( not ( = ?auto_57661 ?auto_57657 ) ) ( not ( = ?auto_57664 ?auto_57661 ) ) ( not ( = ?auto_57651 ?auto_57661 ) ) ( HOIST-AT ?auto_57653 ?auto_57661 ) ( not ( = ?auto_57649 ?auto_57653 ) ) ( not ( = ?auto_57659 ?auto_57653 ) ) ( not ( = ?auto_57652 ?auto_57653 ) ) ( AVAILABLE ?auto_57653 ) ( SURFACE-AT ?auto_57654 ?auto_57661 ) ( ON ?auto_57654 ?auto_57650 ) ( CLEAR ?auto_57654 ) ( not ( = ?auto_57646 ?auto_57650 ) ) ( not ( = ?auto_57647 ?auto_57650 ) ) ( not ( = ?auto_57662 ?auto_57650 ) ) ( not ( = ?auto_57654 ?auto_57650 ) ) ( not ( = ?auto_57655 ?auto_57650 ) ) ( not ( = ?auto_57648 ?auto_57650 ) ) ( IS-CRATE ?auto_57648 ) ( not ( = ?auto_57646 ?auto_57660 ) ) ( not ( = ?auto_57647 ?auto_57660 ) ) ( not ( = ?auto_57662 ?auto_57660 ) ) ( not ( = ?auto_57654 ?auto_57660 ) ) ( not ( = ?auto_57655 ?auto_57660 ) ) ( not ( = ?auto_57648 ?auto_57660 ) ) ( not ( = ?auto_57650 ?auto_57660 ) ) ( AVAILABLE ?auto_57659 ) ( SURFACE-AT ?auto_57648 ?auto_57664 ) ( ON ?auto_57648 ?auto_57658 ) ( CLEAR ?auto_57648 ) ( not ( = ?auto_57646 ?auto_57658 ) ) ( not ( = ?auto_57647 ?auto_57658 ) ) ( not ( = ?auto_57662 ?auto_57658 ) ) ( not ( = ?auto_57654 ?auto_57658 ) ) ( not ( = ?auto_57655 ?auto_57658 ) ) ( not ( = ?auto_57648 ?auto_57658 ) ) ( not ( = ?auto_57650 ?auto_57658 ) ) ( not ( = ?auto_57660 ?auto_57658 ) ) ( TRUCK-AT ?auto_57663 ?auto_57657 ) ( SURFACE-AT ?auto_57656 ?auto_57657 ) ( CLEAR ?auto_57656 ) ( IS-CRATE ?auto_57660 ) ( not ( = ?auto_57646 ?auto_57656 ) ) ( not ( = ?auto_57647 ?auto_57656 ) ) ( not ( = ?auto_57662 ?auto_57656 ) ) ( not ( = ?auto_57654 ?auto_57656 ) ) ( not ( = ?auto_57655 ?auto_57656 ) ) ( not ( = ?auto_57648 ?auto_57656 ) ) ( not ( = ?auto_57650 ?auto_57656 ) ) ( not ( = ?auto_57660 ?auto_57656 ) ) ( not ( = ?auto_57658 ?auto_57656 ) ) ( AVAILABLE ?auto_57649 ) ( IN ?auto_57660 ?auto_57663 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57649 ?auto_57660 ?auto_57663 ?auto_57657 )
      ( MAKE-ON ?auto_57646 ?auto_57647 )
      ( MAKE-ON-VERIFY ?auto_57646 ?auto_57647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57665 - SURFACE
      ?auto_57666 - SURFACE
    )
    :vars
    (
      ?auto_57669 - HOIST
      ?auto_57680 - PLACE
      ?auto_57681 - PLACE
      ?auto_57668 - HOIST
      ?auto_57683 - SURFACE
      ?auto_57676 - SURFACE
      ?auto_57677 - PLACE
      ?auto_57675 - HOIST
      ?auto_57679 - SURFACE
      ?auto_57682 - SURFACE
      ?auto_57672 - PLACE
      ?auto_57670 - HOIST
      ?auto_57678 - SURFACE
      ?auto_57674 - SURFACE
      ?auto_57671 - SURFACE
      ?auto_57667 - SURFACE
      ?auto_57673 - TRUCK
      ?auto_57684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57669 ?auto_57680 ) ( IS-CRATE ?auto_57665 ) ( not ( = ?auto_57665 ?auto_57666 ) ) ( not ( = ?auto_57681 ?auto_57680 ) ) ( HOIST-AT ?auto_57668 ?auto_57681 ) ( not ( = ?auto_57669 ?auto_57668 ) ) ( SURFACE-AT ?auto_57665 ?auto_57681 ) ( ON ?auto_57665 ?auto_57683 ) ( CLEAR ?auto_57665 ) ( not ( = ?auto_57665 ?auto_57683 ) ) ( not ( = ?auto_57666 ?auto_57683 ) ) ( IS-CRATE ?auto_57666 ) ( not ( = ?auto_57665 ?auto_57676 ) ) ( not ( = ?auto_57666 ?auto_57676 ) ) ( not ( = ?auto_57683 ?auto_57676 ) ) ( not ( = ?auto_57677 ?auto_57680 ) ) ( not ( = ?auto_57681 ?auto_57677 ) ) ( HOIST-AT ?auto_57675 ?auto_57677 ) ( not ( = ?auto_57669 ?auto_57675 ) ) ( not ( = ?auto_57668 ?auto_57675 ) ) ( AVAILABLE ?auto_57675 ) ( SURFACE-AT ?auto_57666 ?auto_57677 ) ( ON ?auto_57666 ?auto_57679 ) ( CLEAR ?auto_57666 ) ( not ( = ?auto_57665 ?auto_57679 ) ) ( not ( = ?auto_57666 ?auto_57679 ) ) ( not ( = ?auto_57683 ?auto_57679 ) ) ( not ( = ?auto_57676 ?auto_57679 ) ) ( IS-CRATE ?auto_57676 ) ( not ( = ?auto_57665 ?auto_57682 ) ) ( not ( = ?auto_57666 ?auto_57682 ) ) ( not ( = ?auto_57683 ?auto_57682 ) ) ( not ( = ?auto_57676 ?auto_57682 ) ) ( not ( = ?auto_57679 ?auto_57682 ) ) ( not ( = ?auto_57672 ?auto_57680 ) ) ( not ( = ?auto_57681 ?auto_57672 ) ) ( not ( = ?auto_57677 ?auto_57672 ) ) ( HOIST-AT ?auto_57670 ?auto_57672 ) ( not ( = ?auto_57669 ?auto_57670 ) ) ( not ( = ?auto_57668 ?auto_57670 ) ) ( not ( = ?auto_57675 ?auto_57670 ) ) ( AVAILABLE ?auto_57670 ) ( SURFACE-AT ?auto_57676 ?auto_57672 ) ( ON ?auto_57676 ?auto_57678 ) ( CLEAR ?auto_57676 ) ( not ( = ?auto_57665 ?auto_57678 ) ) ( not ( = ?auto_57666 ?auto_57678 ) ) ( not ( = ?auto_57683 ?auto_57678 ) ) ( not ( = ?auto_57676 ?auto_57678 ) ) ( not ( = ?auto_57679 ?auto_57678 ) ) ( not ( = ?auto_57682 ?auto_57678 ) ) ( IS-CRATE ?auto_57682 ) ( not ( = ?auto_57665 ?auto_57674 ) ) ( not ( = ?auto_57666 ?auto_57674 ) ) ( not ( = ?auto_57683 ?auto_57674 ) ) ( not ( = ?auto_57676 ?auto_57674 ) ) ( not ( = ?auto_57679 ?auto_57674 ) ) ( not ( = ?auto_57682 ?auto_57674 ) ) ( not ( = ?auto_57678 ?auto_57674 ) ) ( AVAILABLE ?auto_57668 ) ( SURFACE-AT ?auto_57682 ?auto_57681 ) ( ON ?auto_57682 ?auto_57671 ) ( CLEAR ?auto_57682 ) ( not ( = ?auto_57665 ?auto_57671 ) ) ( not ( = ?auto_57666 ?auto_57671 ) ) ( not ( = ?auto_57683 ?auto_57671 ) ) ( not ( = ?auto_57676 ?auto_57671 ) ) ( not ( = ?auto_57679 ?auto_57671 ) ) ( not ( = ?auto_57682 ?auto_57671 ) ) ( not ( = ?auto_57678 ?auto_57671 ) ) ( not ( = ?auto_57674 ?auto_57671 ) ) ( SURFACE-AT ?auto_57667 ?auto_57680 ) ( CLEAR ?auto_57667 ) ( IS-CRATE ?auto_57674 ) ( not ( = ?auto_57665 ?auto_57667 ) ) ( not ( = ?auto_57666 ?auto_57667 ) ) ( not ( = ?auto_57683 ?auto_57667 ) ) ( not ( = ?auto_57676 ?auto_57667 ) ) ( not ( = ?auto_57679 ?auto_57667 ) ) ( not ( = ?auto_57682 ?auto_57667 ) ) ( not ( = ?auto_57678 ?auto_57667 ) ) ( not ( = ?auto_57674 ?auto_57667 ) ) ( not ( = ?auto_57671 ?auto_57667 ) ) ( AVAILABLE ?auto_57669 ) ( IN ?auto_57674 ?auto_57673 ) ( TRUCK-AT ?auto_57673 ?auto_57684 ) ( not ( = ?auto_57684 ?auto_57680 ) ) ( not ( = ?auto_57681 ?auto_57684 ) ) ( not ( = ?auto_57677 ?auto_57684 ) ) ( not ( = ?auto_57672 ?auto_57684 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57673 ?auto_57684 ?auto_57680 )
      ( MAKE-ON ?auto_57665 ?auto_57666 )
      ( MAKE-ON-VERIFY ?auto_57665 ?auto_57666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57685 - SURFACE
      ?auto_57686 - SURFACE
    )
    :vars
    (
      ?auto_57700 - HOIST
      ?auto_57701 - PLACE
      ?auto_57694 - PLACE
      ?auto_57689 - HOIST
      ?auto_57698 - SURFACE
      ?auto_57703 - SURFACE
      ?auto_57688 - PLACE
      ?auto_57699 - HOIST
      ?auto_57704 - SURFACE
      ?auto_57697 - SURFACE
      ?auto_57687 - PLACE
      ?auto_57693 - HOIST
      ?auto_57702 - SURFACE
      ?auto_57690 - SURFACE
      ?auto_57692 - SURFACE
      ?auto_57691 - SURFACE
      ?auto_57696 - TRUCK
      ?auto_57695 - PLACE
      ?auto_57705 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57700 ?auto_57701 ) ( IS-CRATE ?auto_57685 ) ( not ( = ?auto_57685 ?auto_57686 ) ) ( not ( = ?auto_57694 ?auto_57701 ) ) ( HOIST-AT ?auto_57689 ?auto_57694 ) ( not ( = ?auto_57700 ?auto_57689 ) ) ( SURFACE-AT ?auto_57685 ?auto_57694 ) ( ON ?auto_57685 ?auto_57698 ) ( CLEAR ?auto_57685 ) ( not ( = ?auto_57685 ?auto_57698 ) ) ( not ( = ?auto_57686 ?auto_57698 ) ) ( IS-CRATE ?auto_57686 ) ( not ( = ?auto_57685 ?auto_57703 ) ) ( not ( = ?auto_57686 ?auto_57703 ) ) ( not ( = ?auto_57698 ?auto_57703 ) ) ( not ( = ?auto_57688 ?auto_57701 ) ) ( not ( = ?auto_57694 ?auto_57688 ) ) ( HOIST-AT ?auto_57699 ?auto_57688 ) ( not ( = ?auto_57700 ?auto_57699 ) ) ( not ( = ?auto_57689 ?auto_57699 ) ) ( AVAILABLE ?auto_57699 ) ( SURFACE-AT ?auto_57686 ?auto_57688 ) ( ON ?auto_57686 ?auto_57704 ) ( CLEAR ?auto_57686 ) ( not ( = ?auto_57685 ?auto_57704 ) ) ( not ( = ?auto_57686 ?auto_57704 ) ) ( not ( = ?auto_57698 ?auto_57704 ) ) ( not ( = ?auto_57703 ?auto_57704 ) ) ( IS-CRATE ?auto_57703 ) ( not ( = ?auto_57685 ?auto_57697 ) ) ( not ( = ?auto_57686 ?auto_57697 ) ) ( not ( = ?auto_57698 ?auto_57697 ) ) ( not ( = ?auto_57703 ?auto_57697 ) ) ( not ( = ?auto_57704 ?auto_57697 ) ) ( not ( = ?auto_57687 ?auto_57701 ) ) ( not ( = ?auto_57694 ?auto_57687 ) ) ( not ( = ?auto_57688 ?auto_57687 ) ) ( HOIST-AT ?auto_57693 ?auto_57687 ) ( not ( = ?auto_57700 ?auto_57693 ) ) ( not ( = ?auto_57689 ?auto_57693 ) ) ( not ( = ?auto_57699 ?auto_57693 ) ) ( AVAILABLE ?auto_57693 ) ( SURFACE-AT ?auto_57703 ?auto_57687 ) ( ON ?auto_57703 ?auto_57702 ) ( CLEAR ?auto_57703 ) ( not ( = ?auto_57685 ?auto_57702 ) ) ( not ( = ?auto_57686 ?auto_57702 ) ) ( not ( = ?auto_57698 ?auto_57702 ) ) ( not ( = ?auto_57703 ?auto_57702 ) ) ( not ( = ?auto_57704 ?auto_57702 ) ) ( not ( = ?auto_57697 ?auto_57702 ) ) ( IS-CRATE ?auto_57697 ) ( not ( = ?auto_57685 ?auto_57690 ) ) ( not ( = ?auto_57686 ?auto_57690 ) ) ( not ( = ?auto_57698 ?auto_57690 ) ) ( not ( = ?auto_57703 ?auto_57690 ) ) ( not ( = ?auto_57704 ?auto_57690 ) ) ( not ( = ?auto_57697 ?auto_57690 ) ) ( not ( = ?auto_57702 ?auto_57690 ) ) ( AVAILABLE ?auto_57689 ) ( SURFACE-AT ?auto_57697 ?auto_57694 ) ( ON ?auto_57697 ?auto_57692 ) ( CLEAR ?auto_57697 ) ( not ( = ?auto_57685 ?auto_57692 ) ) ( not ( = ?auto_57686 ?auto_57692 ) ) ( not ( = ?auto_57698 ?auto_57692 ) ) ( not ( = ?auto_57703 ?auto_57692 ) ) ( not ( = ?auto_57704 ?auto_57692 ) ) ( not ( = ?auto_57697 ?auto_57692 ) ) ( not ( = ?auto_57702 ?auto_57692 ) ) ( not ( = ?auto_57690 ?auto_57692 ) ) ( SURFACE-AT ?auto_57691 ?auto_57701 ) ( CLEAR ?auto_57691 ) ( IS-CRATE ?auto_57690 ) ( not ( = ?auto_57685 ?auto_57691 ) ) ( not ( = ?auto_57686 ?auto_57691 ) ) ( not ( = ?auto_57698 ?auto_57691 ) ) ( not ( = ?auto_57703 ?auto_57691 ) ) ( not ( = ?auto_57704 ?auto_57691 ) ) ( not ( = ?auto_57697 ?auto_57691 ) ) ( not ( = ?auto_57702 ?auto_57691 ) ) ( not ( = ?auto_57690 ?auto_57691 ) ) ( not ( = ?auto_57692 ?auto_57691 ) ) ( AVAILABLE ?auto_57700 ) ( TRUCK-AT ?auto_57696 ?auto_57695 ) ( not ( = ?auto_57695 ?auto_57701 ) ) ( not ( = ?auto_57694 ?auto_57695 ) ) ( not ( = ?auto_57688 ?auto_57695 ) ) ( not ( = ?auto_57687 ?auto_57695 ) ) ( HOIST-AT ?auto_57705 ?auto_57695 ) ( LIFTING ?auto_57705 ?auto_57690 ) ( not ( = ?auto_57700 ?auto_57705 ) ) ( not ( = ?auto_57689 ?auto_57705 ) ) ( not ( = ?auto_57699 ?auto_57705 ) ) ( not ( = ?auto_57693 ?auto_57705 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57705 ?auto_57690 ?auto_57696 ?auto_57695 )
      ( MAKE-ON ?auto_57685 ?auto_57686 )
      ( MAKE-ON-VERIFY ?auto_57685 ?auto_57686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57706 - SURFACE
      ?auto_57707 - SURFACE
    )
    :vars
    (
      ?auto_57713 - HOIST
      ?auto_57711 - PLACE
      ?auto_57712 - PLACE
      ?auto_57716 - HOIST
      ?auto_57724 - SURFACE
      ?auto_57725 - SURFACE
      ?auto_57723 - PLACE
      ?auto_57715 - HOIST
      ?auto_57720 - SURFACE
      ?auto_57718 - SURFACE
      ?auto_57719 - PLACE
      ?auto_57726 - HOIST
      ?auto_57710 - SURFACE
      ?auto_57717 - SURFACE
      ?auto_57722 - SURFACE
      ?auto_57709 - SURFACE
      ?auto_57714 - TRUCK
      ?auto_57708 - PLACE
      ?auto_57721 - HOIST
      ?auto_57727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57713 ?auto_57711 ) ( IS-CRATE ?auto_57706 ) ( not ( = ?auto_57706 ?auto_57707 ) ) ( not ( = ?auto_57712 ?auto_57711 ) ) ( HOIST-AT ?auto_57716 ?auto_57712 ) ( not ( = ?auto_57713 ?auto_57716 ) ) ( SURFACE-AT ?auto_57706 ?auto_57712 ) ( ON ?auto_57706 ?auto_57724 ) ( CLEAR ?auto_57706 ) ( not ( = ?auto_57706 ?auto_57724 ) ) ( not ( = ?auto_57707 ?auto_57724 ) ) ( IS-CRATE ?auto_57707 ) ( not ( = ?auto_57706 ?auto_57725 ) ) ( not ( = ?auto_57707 ?auto_57725 ) ) ( not ( = ?auto_57724 ?auto_57725 ) ) ( not ( = ?auto_57723 ?auto_57711 ) ) ( not ( = ?auto_57712 ?auto_57723 ) ) ( HOIST-AT ?auto_57715 ?auto_57723 ) ( not ( = ?auto_57713 ?auto_57715 ) ) ( not ( = ?auto_57716 ?auto_57715 ) ) ( AVAILABLE ?auto_57715 ) ( SURFACE-AT ?auto_57707 ?auto_57723 ) ( ON ?auto_57707 ?auto_57720 ) ( CLEAR ?auto_57707 ) ( not ( = ?auto_57706 ?auto_57720 ) ) ( not ( = ?auto_57707 ?auto_57720 ) ) ( not ( = ?auto_57724 ?auto_57720 ) ) ( not ( = ?auto_57725 ?auto_57720 ) ) ( IS-CRATE ?auto_57725 ) ( not ( = ?auto_57706 ?auto_57718 ) ) ( not ( = ?auto_57707 ?auto_57718 ) ) ( not ( = ?auto_57724 ?auto_57718 ) ) ( not ( = ?auto_57725 ?auto_57718 ) ) ( not ( = ?auto_57720 ?auto_57718 ) ) ( not ( = ?auto_57719 ?auto_57711 ) ) ( not ( = ?auto_57712 ?auto_57719 ) ) ( not ( = ?auto_57723 ?auto_57719 ) ) ( HOIST-AT ?auto_57726 ?auto_57719 ) ( not ( = ?auto_57713 ?auto_57726 ) ) ( not ( = ?auto_57716 ?auto_57726 ) ) ( not ( = ?auto_57715 ?auto_57726 ) ) ( AVAILABLE ?auto_57726 ) ( SURFACE-AT ?auto_57725 ?auto_57719 ) ( ON ?auto_57725 ?auto_57710 ) ( CLEAR ?auto_57725 ) ( not ( = ?auto_57706 ?auto_57710 ) ) ( not ( = ?auto_57707 ?auto_57710 ) ) ( not ( = ?auto_57724 ?auto_57710 ) ) ( not ( = ?auto_57725 ?auto_57710 ) ) ( not ( = ?auto_57720 ?auto_57710 ) ) ( not ( = ?auto_57718 ?auto_57710 ) ) ( IS-CRATE ?auto_57718 ) ( not ( = ?auto_57706 ?auto_57717 ) ) ( not ( = ?auto_57707 ?auto_57717 ) ) ( not ( = ?auto_57724 ?auto_57717 ) ) ( not ( = ?auto_57725 ?auto_57717 ) ) ( not ( = ?auto_57720 ?auto_57717 ) ) ( not ( = ?auto_57718 ?auto_57717 ) ) ( not ( = ?auto_57710 ?auto_57717 ) ) ( AVAILABLE ?auto_57716 ) ( SURFACE-AT ?auto_57718 ?auto_57712 ) ( ON ?auto_57718 ?auto_57722 ) ( CLEAR ?auto_57718 ) ( not ( = ?auto_57706 ?auto_57722 ) ) ( not ( = ?auto_57707 ?auto_57722 ) ) ( not ( = ?auto_57724 ?auto_57722 ) ) ( not ( = ?auto_57725 ?auto_57722 ) ) ( not ( = ?auto_57720 ?auto_57722 ) ) ( not ( = ?auto_57718 ?auto_57722 ) ) ( not ( = ?auto_57710 ?auto_57722 ) ) ( not ( = ?auto_57717 ?auto_57722 ) ) ( SURFACE-AT ?auto_57709 ?auto_57711 ) ( CLEAR ?auto_57709 ) ( IS-CRATE ?auto_57717 ) ( not ( = ?auto_57706 ?auto_57709 ) ) ( not ( = ?auto_57707 ?auto_57709 ) ) ( not ( = ?auto_57724 ?auto_57709 ) ) ( not ( = ?auto_57725 ?auto_57709 ) ) ( not ( = ?auto_57720 ?auto_57709 ) ) ( not ( = ?auto_57718 ?auto_57709 ) ) ( not ( = ?auto_57710 ?auto_57709 ) ) ( not ( = ?auto_57717 ?auto_57709 ) ) ( not ( = ?auto_57722 ?auto_57709 ) ) ( AVAILABLE ?auto_57713 ) ( TRUCK-AT ?auto_57714 ?auto_57708 ) ( not ( = ?auto_57708 ?auto_57711 ) ) ( not ( = ?auto_57712 ?auto_57708 ) ) ( not ( = ?auto_57723 ?auto_57708 ) ) ( not ( = ?auto_57719 ?auto_57708 ) ) ( HOIST-AT ?auto_57721 ?auto_57708 ) ( not ( = ?auto_57713 ?auto_57721 ) ) ( not ( = ?auto_57716 ?auto_57721 ) ) ( not ( = ?auto_57715 ?auto_57721 ) ) ( not ( = ?auto_57726 ?auto_57721 ) ) ( AVAILABLE ?auto_57721 ) ( SURFACE-AT ?auto_57717 ?auto_57708 ) ( ON ?auto_57717 ?auto_57727 ) ( CLEAR ?auto_57717 ) ( not ( = ?auto_57706 ?auto_57727 ) ) ( not ( = ?auto_57707 ?auto_57727 ) ) ( not ( = ?auto_57724 ?auto_57727 ) ) ( not ( = ?auto_57725 ?auto_57727 ) ) ( not ( = ?auto_57720 ?auto_57727 ) ) ( not ( = ?auto_57718 ?auto_57727 ) ) ( not ( = ?auto_57710 ?auto_57727 ) ) ( not ( = ?auto_57717 ?auto_57727 ) ) ( not ( = ?auto_57722 ?auto_57727 ) ) ( not ( = ?auto_57709 ?auto_57727 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57721 ?auto_57717 ?auto_57727 ?auto_57708 )
      ( MAKE-ON ?auto_57706 ?auto_57707 )
      ( MAKE-ON-VERIFY ?auto_57706 ?auto_57707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57728 - SURFACE
      ?auto_57729 - SURFACE
    )
    :vars
    (
      ?auto_57732 - HOIST
      ?auto_57739 - PLACE
      ?auto_57743 - PLACE
      ?auto_57741 - HOIST
      ?auto_57745 - SURFACE
      ?auto_57734 - SURFACE
      ?auto_57731 - PLACE
      ?auto_57735 - HOIST
      ?auto_57749 - SURFACE
      ?auto_57733 - SURFACE
      ?auto_57737 - PLACE
      ?auto_57746 - HOIST
      ?auto_57747 - SURFACE
      ?auto_57738 - SURFACE
      ?auto_57748 - SURFACE
      ?auto_57736 - SURFACE
      ?auto_57742 - PLACE
      ?auto_57744 - HOIST
      ?auto_57740 - SURFACE
      ?auto_57730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57732 ?auto_57739 ) ( IS-CRATE ?auto_57728 ) ( not ( = ?auto_57728 ?auto_57729 ) ) ( not ( = ?auto_57743 ?auto_57739 ) ) ( HOIST-AT ?auto_57741 ?auto_57743 ) ( not ( = ?auto_57732 ?auto_57741 ) ) ( SURFACE-AT ?auto_57728 ?auto_57743 ) ( ON ?auto_57728 ?auto_57745 ) ( CLEAR ?auto_57728 ) ( not ( = ?auto_57728 ?auto_57745 ) ) ( not ( = ?auto_57729 ?auto_57745 ) ) ( IS-CRATE ?auto_57729 ) ( not ( = ?auto_57728 ?auto_57734 ) ) ( not ( = ?auto_57729 ?auto_57734 ) ) ( not ( = ?auto_57745 ?auto_57734 ) ) ( not ( = ?auto_57731 ?auto_57739 ) ) ( not ( = ?auto_57743 ?auto_57731 ) ) ( HOIST-AT ?auto_57735 ?auto_57731 ) ( not ( = ?auto_57732 ?auto_57735 ) ) ( not ( = ?auto_57741 ?auto_57735 ) ) ( AVAILABLE ?auto_57735 ) ( SURFACE-AT ?auto_57729 ?auto_57731 ) ( ON ?auto_57729 ?auto_57749 ) ( CLEAR ?auto_57729 ) ( not ( = ?auto_57728 ?auto_57749 ) ) ( not ( = ?auto_57729 ?auto_57749 ) ) ( not ( = ?auto_57745 ?auto_57749 ) ) ( not ( = ?auto_57734 ?auto_57749 ) ) ( IS-CRATE ?auto_57734 ) ( not ( = ?auto_57728 ?auto_57733 ) ) ( not ( = ?auto_57729 ?auto_57733 ) ) ( not ( = ?auto_57745 ?auto_57733 ) ) ( not ( = ?auto_57734 ?auto_57733 ) ) ( not ( = ?auto_57749 ?auto_57733 ) ) ( not ( = ?auto_57737 ?auto_57739 ) ) ( not ( = ?auto_57743 ?auto_57737 ) ) ( not ( = ?auto_57731 ?auto_57737 ) ) ( HOIST-AT ?auto_57746 ?auto_57737 ) ( not ( = ?auto_57732 ?auto_57746 ) ) ( not ( = ?auto_57741 ?auto_57746 ) ) ( not ( = ?auto_57735 ?auto_57746 ) ) ( AVAILABLE ?auto_57746 ) ( SURFACE-AT ?auto_57734 ?auto_57737 ) ( ON ?auto_57734 ?auto_57747 ) ( CLEAR ?auto_57734 ) ( not ( = ?auto_57728 ?auto_57747 ) ) ( not ( = ?auto_57729 ?auto_57747 ) ) ( not ( = ?auto_57745 ?auto_57747 ) ) ( not ( = ?auto_57734 ?auto_57747 ) ) ( not ( = ?auto_57749 ?auto_57747 ) ) ( not ( = ?auto_57733 ?auto_57747 ) ) ( IS-CRATE ?auto_57733 ) ( not ( = ?auto_57728 ?auto_57738 ) ) ( not ( = ?auto_57729 ?auto_57738 ) ) ( not ( = ?auto_57745 ?auto_57738 ) ) ( not ( = ?auto_57734 ?auto_57738 ) ) ( not ( = ?auto_57749 ?auto_57738 ) ) ( not ( = ?auto_57733 ?auto_57738 ) ) ( not ( = ?auto_57747 ?auto_57738 ) ) ( AVAILABLE ?auto_57741 ) ( SURFACE-AT ?auto_57733 ?auto_57743 ) ( ON ?auto_57733 ?auto_57748 ) ( CLEAR ?auto_57733 ) ( not ( = ?auto_57728 ?auto_57748 ) ) ( not ( = ?auto_57729 ?auto_57748 ) ) ( not ( = ?auto_57745 ?auto_57748 ) ) ( not ( = ?auto_57734 ?auto_57748 ) ) ( not ( = ?auto_57749 ?auto_57748 ) ) ( not ( = ?auto_57733 ?auto_57748 ) ) ( not ( = ?auto_57747 ?auto_57748 ) ) ( not ( = ?auto_57738 ?auto_57748 ) ) ( SURFACE-AT ?auto_57736 ?auto_57739 ) ( CLEAR ?auto_57736 ) ( IS-CRATE ?auto_57738 ) ( not ( = ?auto_57728 ?auto_57736 ) ) ( not ( = ?auto_57729 ?auto_57736 ) ) ( not ( = ?auto_57745 ?auto_57736 ) ) ( not ( = ?auto_57734 ?auto_57736 ) ) ( not ( = ?auto_57749 ?auto_57736 ) ) ( not ( = ?auto_57733 ?auto_57736 ) ) ( not ( = ?auto_57747 ?auto_57736 ) ) ( not ( = ?auto_57738 ?auto_57736 ) ) ( not ( = ?auto_57748 ?auto_57736 ) ) ( AVAILABLE ?auto_57732 ) ( not ( = ?auto_57742 ?auto_57739 ) ) ( not ( = ?auto_57743 ?auto_57742 ) ) ( not ( = ?auto_57731 ?auto_57742 ) ) ( not ( = ?auto_57737 ?auto_57742 ) ) ( HOIST-AT ?auto_57744 ?auto_57742 ) ( not ( = ?auto_57732 ?auto_57744 ) ) ( not ( = ?auto_57741 ?auto_57744 ) ) ( not ( = ?auto_57735 ?auto_57744 ) ) ( not ( = ?auto_57746 ?auto_57744 ) ) ( AVAILABLE ?auto_57744 ) ( SURFACE-AT ?auto_57738 ?auto_57742 ) ( ON ?auto_57738 ?auto_57740 ) ( CLEAR ?auto_57738 ) ( not ( = ?auto_57728 ?auto_57740 ) ) ( not ( = ?auto_57729 ?auto_57740 ) ) ( not ( = ?auto_57745 ?auto_57740 ) ) ( not ( = ?auto_57734 ?auto_57740 ) ) ( not ( = ?auto_57749 ?auto_57740 ) ) ( not ( = ?auto_57733 ?auto_57740 ) ) ( not ( = ?auto_57747 ?auto_57740 ) ) ( not ( = ?auto_57738 ?auto_57740 ) ) ( not ( = ?auto_57748 ?auto_57740 ) ) ( not ( = ?auto_57736 ?auto_57740 ) ) ( TRUCK-AT ?auto_57730 ?auto_57739 ) )
    :subtasks
    ( ( !DRIVE ?auto_57730 ?auto_57739 ?auto_57742 )
      ( MAKE-ON ?auto_57728 ?auto_57729 )
      ( MAKE-ON-VERIFY ?auto_57728 ?auto_57729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57750 - SURFACE
      ?auto_57751 - SURFACE
    )
    :vars
    (
      ?auto_57753 - HOIST
      ?auto_57758 - PLACE
      ?auto_57762 - PLACE
      ?auto_57765 - HOIST
      ?auto_57754 - SURFACE
      ?auto_57769 - SURFACE
      ?auto_57757 - PLACE
      ?auto_57759 - HOIST
      ?auto_57755 - SURFACE
      ?auto_57761 - SURFACE
      ?auto_57766 - PLACE
      ?auto_57767 - HOIST
      ?auto_57768 - SURFACE
      ?auto_57760 - SURFACE
      ?auto_57756 - SURFACE
      ?auto_57764 - SURFACE
      ?auto_57752 - PLACE
      ?auto_57771 - HOIST
      ?auto_57763 - SURFACE
      ?auto_57770 - TRUCK
      ?auto_57772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57753 ?auto_57758 ) ( IS-CRATE ?auto_57750 ) ( not ( = ?auto_57750 ?auto_57751 ) ) ( not ( = ?auto_57762 ?auto_57758 ) ) ( HOIST-AT ?auto_57765 ?auto_57762 ) ( not ( = ?auto_57753 ?auto_57765 ) ) ( SURFACE-AT ?auto_57750 ?auto_57762 ) ( ON ?auto_57750 ?auto_57754 ) ( CLEAR ?auto_57750 ) ( not ( = ?auto_57750 ?auto_57754 ) ) ( not ( = ?auto_57751 ?auto_57754 ) ) ( IS-CRATE ?auto_57751 ) ( not ( = ?auto_57750 ?auto_57769 ) ) ( not ( = ?auto_57751 ?auto_57769 ) ) ( not ( = ?auto_57754 ?auto_57769 ) ) ( not ( = ?auto_57757 ?auto_57758 ) ) ( not ( = ?auto_57762 ?auto_57757 ) ) ( HOIST-AT ?auto_57759 ?auto_57757 ) ( not ( = ?auto_57753 ?auto_57759 ) ) ( not ( = ?auto_57765 ?auto_57759 ) ) ( AVAILABLE ?auto_57759 ) ( SURFACE-AT ?auto_57751 ?auto_57757 ) ( ON ?auto_57751 ?auto_57755 ) ( CLEAR ?auto_57751 ) ( not ( = ?auto_57750 ?auto_57755 ) ) ( not ( = ?auto_57751 ?auto_57755 ) ) ( not ( = ?auto_57754 ?auto_57755 ) ) ( not ( = ?auto_57769 ?auto_57755 ) ) ( IS-CRATE ?auto_57769 ) ( not ( = ?auto_57750 ?auto_57761 ) ) ( not ( = ?auto_57751 ?auto_57761 ) ) ( not ( = ?auto_57754 ?auto_57761 ) ) ( not ( = ?auto_57769 ?auto_57761 ) ) ( not ( = ?auto_57755 ?auto_57761 ) ) ( not ( = ?auto_57766 ?auto_57758 ) ) ( not ( = ?auto_57762 ?auto_57766 ) ) ( not ( = ?auto_57757 ?auto_57766 ) ) ( HOIST-AT ?auto_57767 ?auto_57766 ) ( not ( = ?auto_57753 ?auto_57767 ) ) ( not ( = ?auto_57765 ?auto_57767 ) ) ( not ( = ?auto_57759 ?auto_57767 ) ) ( AVAILABLE ?auto_57767 ) ( SURFACE-AT ?auto_57769 ?auto_57766 ) ( ON ?auto_57769 ?auto_57768 ) ( CLEAR ?auto_57769 ) ( not ( = ?auto_57750 ?auto_57768 ) ) ( not ( = ?auto_57751 ?auto_57768 ) ) ( not ( = ?auto_57754 ?auto_57768 ) ) ( not ( = ?auto_57769 ?auto_57768 ) ) ( not ( = ?auto_57755 ?auto_57768 ) ) ( not ( = ?auto_57761 ?auto_57768 ) ) ( IS-CRATE ?auto_57761 ) ( not ( = ?auto_57750 ?auto_57760 ) ) ( not ( = ?auto_57751 ?auto_57760 ) ) ( not ( = ?auto_57754 ?auto_57760 ) ) ( not ( = ?auto_57769 ?auto_57760 ) ) ( not ( = ?auto_57755 ?auto_57760 ) ) ( not ( = ?auto_57761 ?auto_57760 ) ) ( not ( = ?auto_57768 ?auto_57760 ) ) ( AVAILABLE ?auto_57765 ) ( SURFACE-AT ?auto_57761 ?auto_57762 ) ( ON ?auto_57761 ?auto_57756 ) ( CLEAR ?auto_57761 ) ( not ( = ?auto_57750 ?auto_57756 ) ) ( not ( = ?auto_57751 ?auto_57756 ) ) ( not ( = ?auto_57754 ?auto_57756 ) ) ( not ( = ?auto_57769 ?auto_57756 ) ) ( not ( = ?auto_57755 ?auto_57756 ) ) ( not ( = ?auto_57761 ?auto_57756 ) ) ( not ( = ?auto_57768 ?auto_57756 ) ) ( not ( = ?auto_57760 ?auto_57756 ) ) ( IS-CRATE ?auto_57760 ) ( not ( = ?auto_57750 ?auto_57764 ) ) ( not ( = ?auto_57751 ?auto_57764 ) ) ( not ( = ?auto_57754 ?auto_57764 ) ) ( not ( = ?auto_57769 ?auto_57764 ) ) ( not ( = ?auto_57755 ?auto_57764 ) ) ( not ( = ?auto_57761 ?auto_57764 ) ) ( not ( = ?auto_57768 ?auto_57764 ) ) ( not ( = ?auto_57760 ?auto_57764 ) ) ( not ( = ?auto_57756 ?auto_57764 ) ) ( not ( = ?auto_57752 ?auto_57758 ) ) ( not ( = ?auto_57762 ?auto_57752 ) ) ( not ( = ?auto_57757 ?auto_57752 ) ) ( not ( = ?auto_57766 ?auto_57752 ) ) ( HOIST-AT ?auto_57771 ?auto_57752 ) ( not ( = ?auto_57753 ?auto_57771 ) ) ( not ( = ?auto_57765 ?auto_57771 ) ) ( not ( = ?auto_57759 ?auto_57771 ) ) ( not ( = ?auto_57767 ?auto_57771 ) ) ( AVAILABLE ?auto_57771 ) ( SURFACE-AT ?auto_57760 ?auto_57752 ) ( ON ?auto_57760 ?auto_57763 ) ( CLEAR ?auto_57760 ) ( not ( = ?auto_57750 ?auto_57763 ) ) ( not ( = ?auto_57751 ?auto_57763 ) ) ( not ( = ?auto_57754 ?auto_57763 ) ) ( not ( = ?auto_57769 ?auto_57763 ) ) ( not ( = ?auto_57755 ?auto_57763 ) ) ( not ( = ?auto_57761 ?auto_57763 ) ) ( not ( = ?auto_57768 ?auto_57763 ) ) ( not ( = ?auto_57760 ?auto_57763 ) ) ( not ( = ?auto_57756 ?auto_57763 ) ) ( not ( = ?auto_57764 ?auto_57763 ) ) ( TRUCK-AT ?auto_57770 ?auto_57758 ) ( SURFACE-AT ?auto_57772 ?auto_57758 ) ( CLEAR ?auto_57772 ) ( LIFTING ?auto_57753 ?auto_57764 ) ( IS-CRATE ?auto_57764 ) ( not ( = ?auto_57750 ?auto_57772 ) ) ( not ( = ?auto_57751 ?auto_57772 ) ) ( not ( = ?auto_57754 ?auto_57772 ) ) ( not ( = ?auto_57769 ?auto_57772 ) ) ( not ( = ?auto_57755 ?auto_57772 ) ) ( not ( = ?auto_57761 ?auto_57772 ) ) ( not ( = ?auto_57768 ?auto_57772 ) ) ( not ( = ?auto_57760 ?auto_57772 ) ) ( not ( = ?auto_57756 ?auto_57772 ) ) ( not ( = ?auto_57764 ?auto_57772 ) ) ( not ( = ?auto_57763 ?auto_57772 ) ) )
    :subtasks
    ( ( !DROP ?auto_57753 ?auto_57764 ?auto_57772 ?auto_57758 )
      ( MAKE-ON ?auto_57750 ?auto_57751 )
      ( MAKE-ON-VERIFY ?auto_57750 ?auto_57751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57773 - SURFACE
      ?auto_57774 - SURFACE
    )
    :vars
    (
      ?auto_57791 - HOIST
      ?auto_57781 - PLACE
      ?auto_57779 - PLACE
      ?auto_57778 - HOIST
      ?auto_57789 - SURFACE
      ?auto_57786 - SURFACE
      ?auto_57793 - PLACE
      ?auto_57775 - HOIST
      ?auto_57788 - SURFACE
      ?auto_57795 - SURFACE
      ?auto_57780 - PLACE
      ?auto_57776 - HOIST
      ?auto_57782 - SURFACE
      ?auto_57787 - SURFACE
      ?auto_57792 - SURFACE
      ?auto_57794 - SURFACE
      ?auto_57777 - PLACE
      ?auto_57783 - HOIST
      ?auto_57790 - SURFACE
      ?auto_57784 - TRUCK
      ?auto_57785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57791 ?auto_57781 ) ( IS-CRATE ?auto_57773 ) ( not ( = ?auto_57773 ?auto_57774 ) ) ( not ( = ?auto_57779 ?auto_57781 ) ) ( HOIST-AT ?auto_57778 ?auto_57779 ) ( not ( = ?auto_57791 ?auto_57778 ) ) ( SURFACE-AT ?auto_57773 ?auto_57779 ) ( ON ?auto_57773 ?auto_57789 ) ( CLEAR ?auto_57773 ) ( not ( = ?auto_57773 ?auto_57789 ) ) ( not ( = ?auto_57774 ?auto_57789 ) ) ( IS-CRATE ?auto_57774 ) ( not ( = ?auto_57773 ?auto_57786 ) ) ( not ( = ?auto_57774 ?auto_57786 ) ) ( not ( = ?auto_57789 ?auto_57786 ) ) ( not ( = ?auto_57793 ?auto_57781 ) ) ( not ( = ?auto_57779 ?auto_57793 ) ) ( HOIST-AT ?auto_57775 ?auto_57793 ) ( not ( = ?auto_57791 ?auto_57775 ) ) ( not ( = ?auto_57778 ?auto_57775 ) ) ( AVAILABLE ?auto_57775 ) ( SURFACE-AT ?auto_57774 ?auto_57793 ) ( ON ?auto_57774 ?auto_57788 ) ( CLEAR ?auto_57774 ) ( not ( = ?auto_57773 ?auto_57788 ) ) ( not ( = ?auto_57774 ?auto_57788 ) ) ( not ( = ?auto_57789 ?auto_57788 ) ) ( not ( = ?auto_57786 ?auto_57788 ) ) ( IS-CRATE ?auto_57786 ) ( not ( = ?auto_57773 ?auto_57795 ) ) ( not ( = ?auto_57774 ?auto_57795 ) ) ( not ( = ?auto_57789 ?auto_57795 ) ) ( not ( = ?auto_57786 ?auto_57795 ) ) ( not ( = ?auto_57788 ?auto_57795 ) ) ( not ( = ?auto_57780 ?auto_57781 ) ) ( not ( = ?auto_57779 ?auto_57780 ) ) ( not ( = ?auto_57793 ?auto_57780 ) ) ( HOIST-AT ?auto_57776 ?auto_57780 ) ( not ( = ?auto_57791 ?auto_57776 ) ) ( not ( = ?auto_57778 ?auto_57776 ) ) ( not ( = ?auto_57775 ?auto_57776 ) ) ( AVAILABLE ?auto_57776 ) ( SURFACE-AT ?auto_57786 ?auto_57780 ) ( ON ?auto_57786 ?auto_57782 ) ( CLEAR ?auto_57786 ) ( not ( = ?auto_57773 ?auto_57782 ) ) ( not ( = ?auto_57774 ?auto_57782 ) ) ( not ( = ?auto_57789 ?auto_57782 ) ) ( not ( = ?auto_57786 ?auto_57782 ) ) ( not ( = ?auto_57788 ?auto_57782 ) ) ( not ( = ?auto_57795 ?auto_57782 ) ) ( IS-CRATE ?auto_57795 ) ( not ( = ?auto_57773 ?auto_57787 ) ) ( not ( = ?auto_57774 ?auto_57787 ) ) ( not ( = ?auto_57789 ?auto_57787 ) ) ( not ( = ?auto_57786 ?auto_57787 ) ) ( not ( = ?auto_57788 ?auto_57787 ) ) ( not ( = ?auto_57795 ?auto_57787 ) ) ( not ( = ?auto_57782 ?auto_57787 ) ) ( AVAILABLE ?auto_57778 ) ( SURFACE-AT ?auto_57795 ?auto_57779 ) ( ON ?auto_57795 ?auto_57792 ) ( CLEAR ?auto_57795 ) ( not ( = ?auto_57773 ?auto_57792 ) ) ( not ( = ?auto_57774 ?auto_57792 ) ) ( not ( = ?auto_57789 ?auto_57792 ) ) ( not ( = ?auto_57786 ?auto_57792 ) ) ( not ( = ?auto_57788 ?auto_57792 ) ) ( not ( = ?auto_57795 ?auto_57792 ) ) ( not ( = ?auto_57782 ?auto_57792 ) ) ( not ( = ?auto_57787 ?auto_57792 ) ) ( IS-CRATE ?auto_57787 ) ( not ( = ?auto_57773 ?auto_57794 ) ) ( not ( = ?auto_57774 ?auto_57794 ) ) ( not ( = ?auto_57789 ?auto_57794 ) ) ( not ( = ?auto_57786 ?auto_57794 ) ) ( not ( = ?auto_57788 ?auto_57794 ) ) ( not ( = ?auto_57795 ?auto_57794 ) ) ( not ( = ?auto_57782 ?auto_57794 ) ) ( not ( = ?auto_57787 ?auto_57794 ) ) ( not ( = ?auto_57792 ?auto_57794 ) ) ( not ( = ?auto_57777 ?auto_57781 ) ) ( not ( = ?auto_57779 ?auto_57777 ) ) ( not ( = ?auto_57793 ?auto_57777 ) ) ( not ( = ?auto_57780 ?auto_57777 ) ) ( HOIST-AT ?auto_57783 ?auto_57777 ) ( not ( = ?auto_57791 ?auto_57783 ) ) ( not ( = ?auto_57778 ?auto_57783 ) ) ( not ( = ?auto_57775 ?auto_57783 ) ) ( not ( = ?auto_57776 ?auto_57783 ) ) ( AVAILABLE ?auto_57783 ) ( SURFACE-AT ?auto_57787 ?auto_57777 ) ( ON ?auto_57787 ?auto_57790 ) ( CLEAR ?auto_57787 ) ( not ( = ?auto_57773 ?auto_57790 ) ) ( not ( = ?auto_57774 ?auto_57790 ) ) ( not ( = ?auto_57789 ?auto_57790 ) ) ( not ( = ?auto_57786 ?auto_57790 ) ) ( not ( = ?auto_57788 ?auto_57790 ) ) ( not ( = ?auto_57795 ?auto_57790 ) ) ( not ( = ?auto_57782 ?auto_57790 ) ) ( not ( = ?auto_57787 ?auto_57790 ) ) ( not ( = ?auto_57792 ?auto_57790 ) ) ( not ( = ?auto_57794 ?auto_57790 ) ) ( TRUCK-AT ?auto_57784 ?auto_57781 ) ( SURFACE-AT ?auto_57785 ?auto_57781 ) ( CLEAR ?auto_57785 ) ( IS-CRATE ?auto_57794 ) ( not ( = ?auto_57773 ?auto_57785 ) ) ( not ( = ?auto_57774 ?auto_57785 ) ) ( not ( = ?auto_57789 ?auto_57785 ) ) ( not ( = ?auto_57786 ?auto_57785 ) ) ( not ( = ?auto_57788 ?auto_57785 ) ) ( not ( = ?auto_57795 ?auto_57785 ) ) ( not ( = ?auto_57782 ?auto_57785 ) ) ( not ( = ?auto_57787 ?auto_57785 ) ) ( not ( = ?auto_57792 ?auto_57785 ) ) ( not ( = ?auto_57794 ?auto_57785 ) ) ( not ( = ?auto_57790 ?auto_57785 ) ) ( AVAILABLE ?auto_57791 ) ( IN ?auto_57794 ?auto_57784 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57791 ?auto_57794 ?auto_57784 ?auto_57781 )
      ( MAKE-ON ?auto_57773 ?auto_57774 )
      ( MAKE-ON-VERIFY ?auto_57773 ?auto_57774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57796 - SURFACE
      ?auto_57797 - SURFACE
    )
    :vars
    (
      ?auto_57816 - HOIST
      ?auto_57808 - PLACE
      ?auto_57810 - PLACE
      ?auto_57798 - HOIST
      ?auto_57801 - SURFACE
      ?auto_57817 - SURFACE
      ?auto_57806 - PLACE
      ?auto_57811 - HOIST
      ?auto_57800 - SURFACE
      ?auto_57807 - SURFACE
      ?auto_57813 - PLACE
      ?auto_57802 - HOIST
      ?auto_57803 - SURFACE
      ?auto_57804 - SURFACE
      ?auto_57815 - SURFACE
      ?auto_57805 - SURFACE
      ?auto_57818 - PLACE
      ?auto_57809 - HOIST
      ?auto_57799 - SURFACE
      ?auto_57814 - SURFACE
      ?auto_57812 - TRUCK
      ?auto_57819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57816 ?auto_57808 ) ( IS-CRATE ?auto_57796 ) ( not ( = ?auto_57796 ?auto_57797 ) ) ( not ( = ?auto_57810 ?auto_57808 ) ) ( HOIST-AT ?auto_57798 ?auto_57810 ) ( not ( = ?auto_57816 ?auto_57798 ) ) ( SURFACE-AT ?auto_57796 ?auto_57810 ) ( ON ?auto_57796 ?auto_57801 ) ( CLEAR ?auto_57796 ) ( not ( = ?auto_57796 ?auto_57801 ) ) ( not ( = ?auto_57797 ?auto_57801 ) ) ( IS-CRATE ?auto_57797 ) ( not ( = ?auto_57796 ?auto_57817 ) ) ( not ( = ?auto_57797 ?auto_57817 ) ) ( not ( = ?auto_57801 ?auto_57817 ) ) ( not ( = ?auto_57806 ?auto_57808 ) ) ( not ( = ?auto_57810 ?auto_57806 ) ) ( HOIST-AT ?auto_57811 ?auto_57806 ) ( not ( = ?auto_57816 ?auto_57811 ) ) ( not ( = ?auto_57798 ?auto_57811 ) ) ( AVAILABLE ?auto_57811 ) ( SURFACE-AT ?auto_57797 ?auto_57806 ) ( ON ?auto_57797 ?auto_57800 ) ( CLEAR ?auto_57797 ) ( not ( = ?auto_57796 ?auto_57800 ) ) ( not ( = ?auto_57797 ?auto_57800 ) ) ( not ( = ?auto_57801 ?auto_57800 ) ) ( not ( = ?auto_57817 ?auto_57800 ) ) ( IS-CRATE ?auto_57817 ) ( not ( = ?auto_57796 ?auto_57807 ) ) ( not ( = ?auto_57797 ?auto_57807 ) ) ( not ( = ?auto_57801 ?auto_57807 ) ) ( not ( = ?auto_57817 ?auto_57807 ) ) ( not ( = ?auto_57800 ?auto_57807 ) ) ( not ( = ?auto_57813 ?auto_57808 ) ) ( not ( = ?auto_57810 ?auto_57813 ) ) ( not ( = ?auto_57806 ?auto_57813 ) ) ( HOIST-AT ?auto_57802 ?auto_57813 ) ( not ( = ?auto_57816 ?auto_57802 ) ) ( not ( = ?auto_57798 ?auto_57802 ) ) ( not ( = ?auto_57811 ?auto_57802 ) ) ( AVAILABLE ?auto_57802 ) ( SURFACE-AT ?auto_57817 ?auto_57813 ) ( ON ?auto_57817 ?auto_57803 ) ( CLEAR ?auto_57817 ) ( not ( = ?auto_57796 ?auto_57803 ) ) ( not ( = ?auto_57797 ?auto_57803 ) ) ( not ( = ?auto_57801 ?auto_57803 ) ) ( not ( = ?auto_57817 ?auto_57803 ) ) ( not ( = ?auto_57800 ?auto_57803 ) ) ( not ( = ?auto_57807 ?auto_57803 ) ) ( IS-CRATE ?auto_57807 ) ( not ( = ?auto_57796 ?auto_57804 ) ) ( not ( = ?auto_57797 ?auto_57804 ) ) ( not ( = ?auto_57801 ?auto_57804 ) ) ( not ( = ?auto_57817 ?auto_57804 ) ) ( not ( = ?auto_57800 ?auto_57804 ) ) ( not ( = ?auto_57807 ?auto_57804 ) ) ( not ( = ?auto_57803 ?auto_57804 ) ) ( AVAILABLE ?auto_57798 ) ( SURFACE-AT ?auto_57807 ?auto_57810 ) ( ON ?auto_57807 ?auto_57815 ) ( CLEAR ?auto_57807 ) ( not ( = ?auto_57796 ?auto_57815 ) ) ( not ( = ?auto_57797 ?auto_57815 ) ) ( not ( = ?auto_57801 ?auto_57815 ) ) ( not ( = ?auto_57817 ?auto_57815 ) ) ( not ( = ?auto_57800 ?auto_57815 ) ) ( not ( = ?auto_57807 ?auto_57815 ) ) ( not ( = ?auto_57803 ?auto_57815 ) ) ( not ( = ?auto_57804 ?auto_57815 ) ) ( IS-CRATE ?auto_57804 ) ( not ( = ?auto_57796 ?auto_57805 ) ) ( not ( = ?auto_57797 ?auto_57805 ) ) ( not ( = ?auto_57801 ?auto_57805 ) ) ( not ( = ?auto_57817 ?auto_57805 ) ) ( not ( = ?auto_57800 ?auto_57805 ) ) ( not ( = ?auto_57807 ?auto_57805 ) ) ( not ( = ?auto_57803 ?auto_57805 ) ) ( not ( = ?auto_57804 ?auto_57805 ) ) ( not ( = ?auto_57815 ?auto_57805 ) ) ( not ( = ?auto_57818 ?auto_57808 ) ) ( not ( = ?auto_57810 ?auto_57818 ) ) ( not ( = ?auto_57806 ?auto_57818 ) ) ( not ( = ?auto_57813 ?auto_57818 ) ) ( HOIST-AT ?auto_57809 ?auto_57818 ) ( not ( = ?auto_57816 ?auto_57809 ) ) ( not ( = ?auto_57798 ?auto_57809 ) ) ( not ( = ?auto_57811 ?auto_57809 ) ) ( not ( = ?auto_57802 ?auto_57809 ) ) ( AVAILABLE ?auto_57809 ) ( SURFACE-AT ?auto_57804 ?auto_57818 ) ( ON ?auto_57804 ?auto_57799 ) ( CLEAR ?auto_57804 ) ( not ( = ?auto_57796 ?auto_57799 ) ) ( not ( = ?auto_57797 ?auto_57799 ) ) ( not ( = ?auto_57801 ?auto_57799 ) ) ( not ( = ?auto_57817 ?auto_57799 ) ) ( not ( = ?auto_57800 ?auto_57799 ) ) ( not ( = ?auto_57807 ?auto_57799 ) ) ( not ( = ?auto_57803 ?auto_57799 ) ) ( not ( = ?auto_57804 ?auto_57799 ) ) ( not ( = ?auto_57815 ?auto_57799 ) ) ( not ( = ?auto_57805 ?auto_57799 ) ) ( SURFACE-AT ?auto_57814 ?auto_57808 ) ( CLEAR ?auto_57814 ) ( IS-CRATE ?auto_57805 ) ( not ( = ?auto_57796 ?auto_57814 ) ) ( not ( = ?auto_57797 ?auto_57814 ) ) ( not ( = ?auto_57801 ?auto_57814 ) ) ( not ( = ?auto_57817 ?auto_57814 ) ) ( not ( = ?auto_57800 ?auto_57814 ) ) ( not ( = ?auto_57807 ?auto_57814 ) ) ( not ( = ?auto_57803 ?auto_57814 ) ) ( not ( = ?auto_57804 ?auto_57814 ) ) ( not ( = ?auto_57815 ?auto_57814 ) ) ( not ( = ?auto_57805 ?auto_57814 ) ) ( not ( = ?auto_57799 ?auto_57814 ) ) ( AVAILABLE ?auto_57816 ) ( IN ?auto_57805 ?auto_57812 ) ( TRUCK-AT ?auto_57812 ?auto_57819 ) ( not ( = ?auto_57819 ?auto_57808 ) ) ( not ( = ?auto_57810 ?auto_57819 ) ) ( not ( = ?auto_57806 ?auto_57819 ) ) ( not ( = ?auto_57813 ?auto_57819 ) ) ( not ( = ?auto_57818 ?auto_57819 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57812 ?auto_57819 ?auto_57808 )
      ( MAKE-ON ?auto_57796 ?auto_57797 )
      ( MAKE-ON-VERIFY ?auto_57796 ?auto_57797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57820 - SURFACE
      ?auto_57821 - SURFACE
    )
    :vars
    (
      ?auto_57826 - HOIST
      ?auto_57832 - PLACE
      ?auto_57823 - PLACE
      ?auto_57822 - HOIST
      ?auto_57839 - SURFACE
      ?auto_57827 - SURFACE
      ?auto_57843 - PLACE
      ?auto_57830 - HOIST
      ?auto_57824 - SURFACE
      ?auto_57833 - SURFACE
      ?auto_57828 - PLACE
      ?auto_57831 - HOIST
      ?auto_57840 - SURFACE
      ?auto_57829 - SURFACE
      ?auto_57825 - SURFACE
      ?auto_57837 - SURFACE
      ?auto_57835 - PLACE
      ?auto_57834 - HOIST
      ?auto_57836 - SURFACE
      ?auto_57841 - SURFACE
      ?auto_57838 - TRUCK
      ?auto_57842 - PLACE
      ?auto_57844 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_57826 ?auto_57832 ) ( IS-CRATE ?auto_57820 ) ( not ( = ?auto_57820 ?auto_57821 ) ) ( not ( = ?auto_57823 ?auto_57832 ) ) ( HOIST-AT ?auto_57822 ?auto_57823 ) ( not ( = ?auto_57826 ?auto_57822 ) ) ( SURFACE-AT ?auto_57820 ?auto_57823 ) ( ON ?auto_57820 ?auto_57839 ) ( CLEAR ?auto_57820 ) ( not ( = ?auto_57820 ?auto_57839 ) ) ( not ( = ?auto_57821 ?auto_57839 ) ) ( IS-CRATE ?auto_57821 ) ( not ( = ?auto_57820 ?auto_57827 ) ) ( not ( = ?auto_57821 ?auto_57827 ) ) ( not ( = ?auto_57839 ?auto_57827 ) ) ( not ( = ?auto_57843 ?auto_57832 ) ) ( not ( = ?auto_57823 ?auto_57843 ) ) ( HOIST-AT ?auto_57830 ?auto_57843 ) ( not ( = ?auto_57826 ?auto_57830 ) ) ( not ( = ?auto_57822 ?auto_57830 ) ) ( AVAILABLE ?auto_57830 ) ( SURFACE-AT ?auto_57821 ?auto_57843 ) ( ON ?auto_57821 ?auto_57824 ) ( CLEAR ?auto_57821 ) ( not ( = ?auto_57820 ?auto_57824 ) ) ( not ( = ?auto_57821 ?auto_57824 ) ) ( not ( = ?auto_57839 ?auto_57824 ) ) ( not ( = ?auto_57827 ?auto_57824 ) ) ( IS-CRATE ?auto_57827 ) ( not ( = ?auto_57820 ?auto_57833 ) ) ( not ( = ?auto_57821 ?auto_57833 ) ) ( not ( = ?auto_57839 ?auto_57833 ) ) ( not ( = ?auto_57827 ?auto_57833 ) ) ( not ( = ?auto_57824 ?auto_57833 ) ) ( not ( = ?auto_57828 ?auto_57832 ) ) ( not ( = ?auto_57823 ?auto_57828 ) ) ( not ( = ?auto_57843 ?auto_57828 ) ) ( HOIST-AT ?auto_57831 ?auto_57828 ) ( not ( = ?auto_57826 ?auto_57831 ) ) ( not ( = ?auto_57822 ?auto_57831 ) ) ( not ( = ?auto_57830 ?auto_57831 ) ) ( AVAILABLE ?auto_57831 ) ( SURFACE-AT ?auto_57827 ?auto_57828 ) ( ON ?auto_57827 ?auto_57840 ) ( CLEAR ?auto_57827 ) ( not ( = ?auto_57820 ?auto_57840 ) ) ( not ( = ?auto_57821 ?auto_57840 ) ) ( not ( = ?auto_57839 ?auto_57840 ) ) ( not ( = ?auto_57827 ?auto_57840 ) ) ( not ( = ?auto_57824 ?auto_57840 ) ) ( not ( = ?auto_57833 ?auto_57840 ) ) ( IS-CRATE ?auto_57833 ) ( not ( = ?auto_57820 ?auto_57829 ) ) ( not ( = ?auto_57821 ?auto_57829 ) ) ( not ( = ?auto_57839 ?auto_57829 ) ) ( not ( = ?auto_57827 ?auto_57829 ) ) ( not ( = ?auto_57824 ?auto_57829 ) ) ( not ( = ?auto_57833 ?auto_57829 ) ) ( not ( = ?auto_57840 ?auto_57829 ) ) ( AVAILABLE ?auto_57822 ) ( SURFACE-AT ?auto_57833 ?auto_57823 ) ( ON ?auto_57833 ?auto_57825 ) ( CLEAR ?auto_57833 ) ( not ( = ?auto_57820 ?auto_57825 ) ) ( not ( = ?auto_57821 ?auto_57825 ) ) ( not ( = ?auto_57839 ?auto_57825 ) ) ( not ( = ?auto_57827 ?auto_57825 ) ) ( not ( = ?auto_57824 ?auto_57825 ) ) ( not ( = ?auto_57833 ?auto_57825 ) ) ( not ( = ?auto_57840 ?auto_57825 ) ) ( not ( = ?auto_57829 ?auto_57825 ) ) ( IS-CRATE ?auto_57829 ) ( not ( = ?auto_57820 ?auto_57837 ) ) ( not ( = ?auto_57821 ?auto_57837 ) ) ( not ( = ?auto_57839 ?auto_57837 ) ) ( not ( = ?auto_57827 ?auto_57837 ) ) ( not ( = ?auto_57824 ?auto_57837 ) ) ( not ( = ?auto_57833 ?auto_57837 ) ) ( not ( = ?auto_57840 ?auto_57837 ) ) ( not ( = ?auto_57829 ?auto_57837 ) ) ( not ( = ?auto_57825 ?auto_57837 ) ) ( not ( = ?auto_57835 ?auto_57832 ) ) ( not ( = ?auto_57823 ?auto_57835 ) ) ( not ( = ?auto_57843 ?auto_57835 ) ) ( not ( = ?auto_57828 ?auto_57835 ) ) ( HOIST-AT ?auto_57834 ?auto_57835 ) ( not ( = ?auto_57826 ?auto_57834 ) ) ( not ( = ?auto_57822 ?auto_57834 ) ) ( not ( = ?auto_57830 ?auto_57834 ) ) ( not ( = ?auto_57831 ?auto_57834 ) ) ( AVAILABLE ?auto_57834 ) ( SURFACE-AT ?auto_57829 ?auto_57835 ) ( ON ?auto_57829 ?auto_57836 ) ( CLEAR ?auto_57829 ) ( not ( = ?auto_57820 ?auto_57836 ) ) ( not ( = ?auto_57821 ?auto_57836 ) ) ( not ( = ?auto_57839 ?auto_57836 ) ) ( not ( = ?auto_57827 ?auto_57836 ) ) ( not ( = ?auto_57824 ?auto_57836 ) ) ( not ( = ?auto_57833 ?auto_57836 ) ) ( not ( = ?auto_57840 ?auto_57836 ) ) ( not ( = ?auto_57829 ?auto_57836 ) ) ( not ( = ?auto_57825 ?auto_57836 ) ) ( not ( = ?auto_57837 ?auto_57836 ) ) ( SURFACE-AT ?auto_57841 ?auto_57832 ) ( CLEAR ?auto_57841 ) ( IS-CRATE ?auto_57837 ) ( not ( = ?auto_57820 ?auto_57841 ) ) ( not ( = ?auto_57821 ?auto_57841 ) ) ( not ( = ?auto_57839 ?auto_57841 ) ) ( not ( = ?auto_57827 ?auto_57841 ) ) ( not ( = ?auto_57824 ?auto_57841 ) ) ( not ( = ?auto_57833 ?auto_57841 ) ) ( not ( = ?auto_57840 ?auto_57841 ) ) ( not ( = ?auto_57829 ?auto_57841 ) ) ( not ( = ?auto_57825 ?auto_57841 ) ) ( not ( = ?auto_57837 ?auto_57841 ) ) ( not ( = ?auto_57836 ?auto_57841 ) ) ( AVAILABLE ?auto_57826 ) ( TRUCK-AT ?auto_57838 ?auto_57842 ) ( not ( = ?auto_57842 ?auto_57832 ) ) ( not ( = ?auto_57823 ?auto_57842 ) ) ( not ( = ?auto_57843 ?auto_57842 ) ) ( not ( = ?auto_57828 ?auto_57842 ) ) ( not ( = ?auto_57835 ?auto_57842 ) ) ( HOIST-AT ?auto_57844 ?auto_57842 ) ( LIFTING ?auto_57844 ?auto_57837 ) ( not ( = ?auto_57826 ?auto_57844 ) ) ( not ( = ?auto_57822 ?auto_57844 ) ) ( not ( = ?auto_57830 ?auto_57844 ) ) ( not ( = ?auto_57831 ?auto_57844 ) ) ( not ( = ?auto_57834 ?auto_57844 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57844 ?auto_57837 ?auto_57838 ?auto_57842 )
      ( MAKE-ON ?auto_57820 ?auto_57821 )
      ( MAKE-ON-VERIFY ?auto_57820 ?auto_57821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57845 - SURFACE
      ?auto_57846 - SURFACE
    )
    :vars
    (
      ?auto_57863 - HOIST
      ?auto_57851 - PLACE
      ?auto_57862 - PLACE
      ?auto_57866 - HOIST
      ?auto_57850 - SURFACE
      ?auto_57858 - SURFACE
      ?auto_57849 - PLACE
      ?auto_57857 - HOIST
      ?auto_57860 - SURFACE
      ?auto_57852 - SURFACE
      ?auto_57847 - PLACE
      ?auto_57855 - HOIST
      ?auto_57848 - SURFACE
      ?auto_57859 - SURFACE
      ?auto_57861 - SURFACE
      ?auto_57856 - SURFACE
      ?auto_57864 - PLACE
      ?auto_57853 - HOIST
      ?auto_57868 - SURFACE
      ?auto_57867 - SURFACE
      ?auto_57854 - TRUCK
      ?auto_57865 - PLACE
      ?auto_57869 - HOIST
      ?auto_57870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57863 ?auto_57851 ) ( IS-CRATE ?auto_57845 ) ( not ( = ?auto_57845 ?auto_57846 ) ) ( not ( = ?auto_57862 ?auto_57851 ) ) ( HOIST-AT ?auto_57866 ?auto_57862 ) ( not ( = ?auto_57863 ?auto_57866 ) ) ( SURFACE-AT ?auto_57845 ?auto_57862 ) ( ON ?auto_57845 ?auto_57850 ) ( CLEAR ?auto_57845 ) ( not ( = ?auto_57845 ?auto_57850 ) ) ( not ( = ?auto_57846 ?auto_57850 ) ) ( IS-CRATE ?auto_57846 ) ( not ( = ?auto_57845 ?auto_57858 ) ) ( not ( = ?auto_57846 ?auto_57858 ) ) ( not ( = ?auto_57850 ?auto_57858 ) ) ( not ( = ?auto_57849 ?auto_57851 ) ) ( not ( = ?auto_57862 ?auto_57849 ) ) ( HOIST-AT ?auto_57857 ?auto_57849 ) ( not ( = ?auto_57863 ?auto_57857 ) ) ( not ( = ?auto_57866 ?auto_57857 ) ) ( AVAILABLE ?auto_57857 ) ( SURFACE-AT ?auto_57846 ?auto_57849 ) ( ON ?auto_57846 ?auto_57860 ) ( CLEAR ?auto_57846 ) ( not ( = ?auto_57845 ?auto_57860 ) ) ( not ( = ?auto_57846 ?auto_57860 ) ) ( not ( = ?auto_57850 ?auto_57860 ) ) ( not ( = ?auto_57858 ?auto_57860 ) ) ( IS-CRATE ?auto_57858 ) ( not ( = ?auto_57845 ?auto_57852 ) ) ( not ( = ?auto_57846 ?auto_57852 ) ) ( not ( = ?auto_57850 ?auto_57852 ) ) ( not ( = ?auto_57858 ?auto_57852 ) ) ( not ( = ?auto_57860 ?auto_57852 ) ) ( not ( = ?auto_57847 ?auto_57851 ) ) ( not ( = ?auto_57862 ?auto_57847 ) ) ( not ( = ?auto_57849 ?auto_57847 ) ) ( HOIST-AT ?auto_57855 ?auto_57847 ) ( not ( = ?auto_57863 ?auto_57855 ) ) ( not ( = ?auto_57866 ?auto_57855 ) ) ( not ( = ?auto_57857 ?auto_57855 ) ) ( AVAILABLE ?auto_57855 ) ( SURFACE-AT ?auto_57858 ?auto_57847 ) ( ON ?auto_57858 ?auto_57848 ) ( CLEAR ?auto_57858 ) ( not ( = ?auto_57845 ?auto_57848 ) ) ( not ( = ?auto_57846 ?auto_57848 ) ) ( not ( = ?auto_57850 ?auto_57848 ) ) ( not ( = ?auto_57858 ?auto_57848 ) ) ( not ( = ?auto_57860 ?auto_57848 ) ) ( not ( = ?auto_57852 ?auto_57848 ) ) ( IS-CRATE ?auto_57852 ) ( not ( = ?auto_57845 ?auto_57859 ) ) ( not ( = ?auto_57846 ?auto_57859 ) ) ( not ( = ?auto_57850 ?auto_57859 ) ) ( not ( = ?auto_57858 ?auto_57859 ) ) ( not ( = ?auto_57860 ?auto_57859 ) ) ( not ( = ?auto_57852 ?auto_57859 ) ) ( not ( = ?auto_57848 ?auto_57859 ) ) ( AVAILABLE ?auto_57866 ) ( SURFACE-AT ?auto_57852 ?auto_57862 ) ( ON ?auto_57852 ?auto_57861 ) ( CLEAR ?auto_57852 ) ( not ( = ?auto_57845 ?auto_57861 ) ) ( not ( = ?auto_57846 ?auto_57861 ) ) ( not ( = ?auto_57850 ?auto_57861 ) ) ( not ( = ?auto_57858 ?auto_57861 ) ) ( not ( = ?auto_57860 ?auto_57861 ) ) ( not ( = ?auto_57852 ?auto_57861 ) ) ( not ( = ?auto_57848 ?auto_57861 ) ) ( not ( = ?auto_57859 ?auto_57861 ) ) ( IS-CRATE ?auto_57859 ) ( not ( = ?auto_57845 ?auto_57856 ) ) ( not ( = ?auto_57846 ?auto_57856 ) ) ( not ( = ?auto_57850 ?auto_57856 ) ) ( not ( = ?auto_57858 ?auto_57856 ) ) ( not ( = ?auto_57860 ?auto_57856 ) ) ( not ( = ?auto_57852 ?auto_57856 ) ) ( not ( = ?auto_57848 ?auto_57856 ) ) ( not ( = ?auto_57859 ?auto_57856 ) ) ( not ( = ?auto_57861 ?auto_57856 ) ) ( not ( = ?auto_57864 ?auto_57851 ) ) ( not ( = ?auto_57862 ?auto_57864 ) ) ( not ( = ?auto_57849 ?auto_57864 ) ) ( not ( = ?auto_57847 ?auto_57864 ) ) ( HOIST-AT ?auto_57853 ?auto_57864 ) ( not ( = ?auto_57863 ?auto_57853 ) ) ( not ( = ?auto_57866 ?auto_57853 ) ) ( not ( = ?auto_57857 ?auto_57853 ) ) ( not ( = ?auto_57855 ?auto_57853 ) ) ( AVAILABLE ?auto_57853 ) ( SURFACE-AT ?auto_57859 ?auto_57864 ) ( ON ?auto_57859 ?auto_57868 ) ( CLEAR ?auto_57859 ) ( not ( = ?auto_57845 ?auto_57868 ) ) ( not ( = ?auto_57846 ?auto_57868 ) ) ( not ( = ?auto_57850 ?auto_57868 ) ) ( not ( = ?auto_57858 ?auto_57868 ) ) ( not ( = ?auto_57860 ?auto_57868 ) ) ( not ( = ?auto_57852 ?auto_57868 ) ) ( not ( = ?auto_57848 ?auto_57868 ) ) ( not ( = ?auto_57859 ?auto_57868 ) ) ( not ( = ?auto_57861 ?auto_57868 ) ) ( not ( = ?auto_57856 ?auto_57868 ) ) ( SURFACE-AT ?auto_57867 ?auto_57851 ) ( CLEAR ?auto_57867 ) ( IS-CRATE ?auto_57856 ) ( not ( = ?auto_57845 ?auto_57867 ) ) ( not ( = ?auto_57846 ?auto_57867 ) ) ( not ( = ?auto_57850 ?auto_57867 ) ) ( not ( = ?auto_57858 ?auto_57867 ) ) ( not ( = ?auto_57860 ?auto_57867 ) ) ( not ( = ?auto_57852 ?auto_57867 ) ) ( not ( = ?auto_57848 ?auto_57867 ) ) ( not ( = ?auto_57859 ?auto_57867 ) ) ( not ( = ?auto_57861 ?auto_57867 ) ) ( not ( = ?auto_57856 ?auto_57867 ) ) ( not ( = ?auto_57868 ?auto_57867 ) ) ( AVAILABLE ?auto_57863 ) ( TRUCK-AT ?auto_57854 ?auto_57865 ) ( not ( = ?auto_57865 ?auto_57851 ) ) ( not ( = ?auto_57862 ?auto_57865 ) ) ( not ( = ?auto_57849 ?auto_57865 ) ) ( not ( = ?auto_57847 ?auto_57865 ) ) ( not ( = ?auto_57864 ?auto_57865 ) ) ( HOIST-AT ?auto_57869 ?auto_57865 ) ( not ( = ?auto_57863 ?auto_57869 ) ) ( not ( = ?auto_57866 ?auto_57869 ) ) ( not ( = ?auto_57857 ?auto_57869 ) ) ( not ( = ?auto_57855 ?auto_57869 ) ) ( not ( = ?auto_57853 ?auto_57869 ) ) ( AVAILABLE ?auto_57869 ) ( SURFACE-AT ?auto_57856 ?auto_57865 ) ( ON ?auto_57856 ?auto_57870 ) ( CLEAR ?auto_57856 ) ( not ( = ?auto_57845 ?auto_57870 ) ) ( not ( = ?auto_57846 ?auto_57870 ) ) ( not ( = ?auto_57850 ?auto_57870 ) ) ( not ( = ?auto_57858 ?auto_57870 ) ) ( not ( = ?auto_57860 ?auto_57870 ) ) ( not ( = ?auto_57852 ?auto_57870 ) ) ( not ( = ?auto_57848 ?auto_57870 ) ) ( not ( = ?auto_57859 ?auto_57870 ) ) ( not ( = ?auto_57861 ?auto_57870 ) ) ( not ( = ?auto_57856 ?auto_57870 ) ) ( not ( = ?auto_57868 ?auto_57870 ) ) ( not ( = ?auto_57867 ?auto_57870 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57869 ?auto_57856 ?auto_57870 ?auto_57865 )
      ( MAKE-ON ?auto_57845 ?auto_57846 )
      ( MAKE-ON-VERIFY ?auto_57845 ?auto_57846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57871 - SURFACE
      ?auto_57872 - SURFACE
    )
    :vars
    (
      ?auto_57895 - HOIST
      ?auto_57892 - PLACE
      ?auto_57883 - PLACE
      ?auto_57888 - HOIST
      ?auto_57874 - SURFACE
      ?auto_57896 - SURFACE
      ?auto_57893 - PLACE
      ?auto_57890 - HOIST
      ?auto_57879 - SURFACE
      ?auto_57878 - SURFACE
      ?auto_57884 - PLACE
      ?auto_57877 - HOIST
      ?auto_57887 - SURFACE
      ?auto_57873 - SURFACE
      ?auto_57894 - SURFACE
      ?auto_57891 - SURFACE
      ?auto_57885 - PLACE
      ?auto_57881 - HOIST
      ?auto_57875 - SURFACE
      ?auto_57889 - SURFACE
      ?auto_57886 - PLACE
      ?auto_57876 - HOIST
      ?auto_57882 - SURFACE
      ?auto_57880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57895 ?auto_57892 ) ( IS-CRATE ?auto_57871 ) ( not ( = ?auto_57871 ?auto_57872 ) ) ( not ( = ?auto_57883 ?auto_57892 ) ) ( HOIST-AT ?auto_57888 ?auto_57883 ) ( not ( = ?auto_57895 ?auto_57888 ) ) ( SURFACE-AT ?auto_57871 ?auto_57883 ) ( ON ?auto_57871 ?auto_57874 ) ( CLEAR ?auto_57871 ) ( not ( = ?auto_57871 ?auto_57874 ) ) ( not ( = ?auto_57872 ?auto_57874 ) ) ( IS-CRATE ?auto_57872 ) ( not ( = ?auto_57871 ?auto_57896 ) ) ( not ( = ?auto_57872 ?auto_57896 ) ) ( not ( = ?auto_57874 ?auto_57896 ) ) ( not ( = ?auto_57893 ?auto_57892 ) ) ( not ( = ?auto_57883 ?auto_57893 ) ) ( HOIST-AT ?auto_57890 ?auto_57893 ) ( not ( = ?auto_57895 ?auto_57890 ) ) ( not ( = ?auto_57888 ?auto_57890 ) ) ( AVAILABLE ?auto_57890 ) ( SURFACE-AT ?auto_57872 ?auto_57893 ) ( ON ?auto_57872 ?auto_57879 ) ( CLEAR ?auto_57872 ) ( not ( = ?auto_57871 ?auto_57879 ) ) ( not ( = ?auto_57872 ?auto_57879 ) ) ( not ( = ?auto_57874 ?auto_57879 ) ) ( not ( = ?auto_57896 ?auto_57879 ) ) ( IS-CRATE ?auto_57896 ) ( not ( = ?auto_57871 ?auto_57878 ) ) ( not ( = ?auto_57872 ?auto_57878 ) ) ( not ( = ?auto_57874 ?auto_57878 ) ) ( not ( = ?auto_57896 ?auto_57878 ) ) ( not ( = ?auto_57879 ?auto_57878 ) ) ( not ( = ?auto_57884 ?auto_57892 ) ) ( not ( = ?auto_57883 ?auto_57884 ) ) ( not ( = ?auto_57893 ?auto_57884 ) ) ( HOIST-AT ?auto_57877 ?auto_57884 ) ( not ( = ?auto_57895 ?auto_57877 ) ) ( not ( = ?auto_57888 ?auto_57877 ) ) ( not ( = ?auto_57890 ?auto_57877 ) ) ( AVAILABLE ?auto_57877 ) ( SURFACE-AT ?auto_57896 ?auto_57884 ) ( ON ?auto_57896 ?auto_57887 ) ( CLEAR ?auto_57896 ) ( not ( = ?auto_57871 ?auto_57887 ) ) ( not ( = ?auto_57872 ?auto_57887 ) ) ( not ( = ?auto_57874 ?auto_57887 ) ) ( not ( = ?auto_57896 ?auto_57887 ) ) ( not ( = ?auto_57879 ?auto_57887 ) ) ( not ( = ?auto_57878 ?auto_57887 ) ) ( IS-CRATE ?auto_57878 ) ( not ( = ?auto_57871 ?auto_57873 ) ) ( not ( = ?auto_57872 ?auto_57873 ) ) ( not ( = ?auto_57874 ?auto_57873 ) ) ( not ( = ?auto_57896 ?auto_57873 ) ) ( not ( = ?auto_57879 ?auto_57873 ) ) ( not ( = ?auto_57878 ?auto_57873 ) ) ( not ( = ?auto_57887 ?auto_57873 ) ) ( AVAILABLE ?auto_57888 ) ( SURFACE-AT ?auto_57878 ?auto_57883 ) ( ON ?auto_57878 ?auto_57894 ) ( CLEAR ?auto_57878 ) ( not ( = ?auto_57871 ?auto_57894 ) ) ( not ( = ?auto_57872 ?auto_57894 ) ) ( not ( = ?auto_57874 ?auto_57894 ) ) ( not ( = ?auto_57896 ?auto_57894 ) ) ( not ( = ?auto_57879 ?auto_57894 ) ) ( not ( = ?auto_57878 ?auto_57894 ) ) ( not ( = ?auto_57887 ?auto_57894 ) ) ( not ( = ?auto_57873 ?auto_57894 ) ) ( IS-CRATE ?auto_57873 ) ( not ( = ?auto_57871 ?auto_57891 ) ) ( not ( = ?auto_57872 ?auto_57891 ) ) ( not ( = ?auto_57874 ?auto_57891 ) ) ( not ( = ?auto_57896 ?auto_57891 ) ) ( not ( = ?auto_57879 ?auto_57891 ) ) ( not ( = ?auto_57878 ?auto_57891 ) ) ( not ( = ?auto_57887 ?auto_57891 ) ) ( not ( = ?auto_57873 ?auto_57891 ) ) ( not ( = ?auto_57894 ?auto_57891 ) ) ( not ( = ?auto_57885 ?auto_57892 ) ) ( not ( = ?auto_57883 ?auto_57885 ) ) ( not ( = ?auto_57893 ?auto_57885 ) ) ( not ( = ?auto_57884 ?auto_57885 ) ) ( HOIST-AT ?auto_57881 ?auto_57885 ) ( not ( = ?auto_57895 ?auto_57881 ) ) ( not ( = ?auto_57888 ?auto_57881 ) ) ( not ( = ?auto_57890 ?auto_57881 ) ) ( not ( = ?auto_57877 ?auto_57881 ) ) ( AVAILABLE ?auto_57881 ) ( SURFACE-AT ?auto_57873 ?auto_57885 ) ( ON ?auto_57873 ?auto_57875 ) ( CLEAR ?auto_57873 ) ( not ( = ?auto_57871 ?auto_57875 ) ) ( not ( = ?auto_57872 ?auto_57875 ) ) ( not ( = ?auto_57874 ?auto_57875 ) ) ( not ( = ?auto_57896 ?auto_57875 ) ) ( not ( = ?auto_57879 ?auto_57875 ) ) ( not ( = ?auto_57878 ?auto_57875 ) ) ( not ( = ?auto_57887 ?auto_57875 ) ) ( not ( = ?auto_57873 ?auto_57875 ) ) ( not ( = ?auto_57894 ?auto_57875 ) ) ( not ( = ?auto_57891 ?auto_57875 ) ) ( SURFACE-AT ?auto_57889 ?auto_57892 ) ( CLEAR ?auto_57889 ) ( IS-CRATE ?auto_57891 ) ( not ( = ?auto_57871 ?auto_57889 ) ) ( not ( = ?auto_57872 ?auto_57889 ) ) ( not ( = ?auto_57874 ?auto_57889 ) ) ( not ( = ?auto_57896 ?auto_57889 ) ) ( not ( = ?auto_57879 ?auto_57889 ) ) ( not ( = ?auto_57878 ?auto_57889 ) ) ( not ( = ?auto_57887 ?auto_57889 ) ) ( not ( = ?auto_57873 ?auto_57889 ) ) ( not ( = ?auto_57894 ?auto_57889 ) ) ( not ( = ?auto_57891 ?auto_57889 ) ) ( not ( = ?auto_57875 ?auto_57889 ) ) ( AVAILABLE ?auto_57895 ) ( not ( = ?auto_57886 ?auto_57892 ) ) ( not ( = ?auto_57883 ?auto_57886 ) ) ( not ( = ?auto_57893 ?auto_57886 ) ) ( not ( = ?auto_57884 ?auto_57886 ) ) ( not ( = ?auto_57885 ?auto_57886 ) ) ( HOIST-AT ?auto_57876 ?auto_57886 ) ( not ( = ?auto_57895 ?auto_57876 ) ) ( not ( = ?auto_57888 ?auto_57876 ) ) ( not ( = ?auto_57890 ?auto_57876 ) ) ( not ( = ?auto_57877 ?auto_57876 ) ) ( not ( = ?auto_57881 ?auto_57876 ) ) ( AVAILABLE ?auto_57876 ) ( SURFACE-AT ?auto_57891 ?auto_57886 ) ( ON ?auto_57891 ?auto_57882 ) ( CLEAR ?auto_57891 ) ( not ( = ?auto_57871 ?auto_57882 ) ) ( not ( = ?auto_57872 ?auto_57882 ) ) ( not ( = ?auto_57874 ?auto_57882 ) ) ( not ( = ?auto_57896 ?auto_57882 ) ) ( not ( = ?auto_57879 ?auto_57882 ) ) ( not ( = ?auto_57878 ?auto_57882 ) ) ( not ( = ?auto_57887 ?auto_57882 ) ) ( not ( = ?auto_57873 ?auto_57882 ) ) ( not ( = ?auto_57894 ?auto_57882 ) ) ( not ( = ?auto_57891 ?auto_57882 ) ) ( not ( = ?auto_57875 ?auto_57882 ) ) ( not ( = ?auto_57889 ?auto_57882 ) ) ( TRUCK-AT ?auto_57880 ?auto_57892 ) )
    :subtasks
    ( ( !DRIVE ?auto_57880 ?auto_57892 ?auto_57886 )
      ( MAKE-ON ?auto_57871 ?auto_57872 )
      ( MAKE-ON-VERIFY ?auto_57871 ?auto_57872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57897 - SURFACE
      ?auto_57898 - SURFACE
    )
    :vars
    (
      ?auto_57916 - HOIST
      ?auto_57900 - PLACE
      ?auto_57902 - PLACE
      ?auto_57917 - HOIST
      ?auto_57919 - SURFACE
      ?auto_57922 - SURFACE
      ?auto_57901 - PLACE
      ?auto_57914 - HOIST
      ?auto_57921 - SURFACE
      ?auto_57909 - SURFACE
      ?auto_57910 - PLACE
      ?auto_57904 - HOIST
      ?auto_57918 - SURFACE
      ?auto_57907 - SURFACE
      ?auto_57913 - SURFACE
      ?auto_57912 - SURFACE
      ?auto_57908 - PLACE
      ?auto_57899 - HOIST
      ?auto_57920 - SURFACE
      ?auto_57915 - SURFACE
      ?auto_57911 - PLACE
      ?auto_57903 - HOIST
      ?auto_57906 - SURFACE
      ?auto_57905 - TRUCK
      ?auto_57923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57916 ?auto_57900 ) ( IS-CRATE ?auto_57897 ) ( not ( = ?auto_57897 ?auto_57898 ) ) ( not ( = ?auto_57902 ?auto_57900 ) ) ( HOIST-AT ?auto_57917 ?auto_57902 ) ( not ( = ?auto_57916 ?auto_57917 ) ) ( SURFACE-AT ?auto_57897 ?auto_57902 ) ( ON ?auto_57897 ?auto_57919 ) ( CLEAR ?auto_57897 ) ( not ( = ?auto_57897 ?auto_57919 ) ) ( not ( = ?auto_57898 ?auto_57919 ) ) ( IS-CRATE ?auto_57898 ) ( not ( = ?auto_57897 ?auto_57922 ) ) ( not ( = ?auto_57898 ?auto_57922 ) ) ( not ( = ?auto_57919 ?auto_57922 ) ) ( not ( = ?auto_57901 ?auto_57900 ) ) ( not ( = ?auto_57902 ?auto_57901 ) ) ( HOIST-AT ?auto_57914 ?auto_57901 ) ( not ( = ?auto_57916 ?auto_57914 ) ) ( not ( = ?auto_57917 ?auto_57914 ) ) ( AVAILABLE ?auto_57914 ) ( SURFACE-AT ?auto_57898 ?auto_57901 ) ( ON ?auto_57898 ?auto_57921 ) ( CLEAR ?auto_57898 ) ( not ( = ?auto_57897 ?auto_57921 ) ) ( not ( = ?auto_57898 ?auto_57921 ) ) ( not ( = ?auto_57919 ?auto_57921 ) ) ( not ( = ?auto_57922 ?auto_57921 ) ) ( IS-CRATE ?auto_57922 ) ( not ( = ?auto_57897 ?auto_57909 ) ) ( not ( = ?auto_57898 ?auto_57909 ) ) ( not ( = ?auto_57919 ?auto_57909 ) ) ( not ( = ?auto_57922 ?auto_57909 ) ) ( not ( = ?auto_57921 ?auto_57909 ) ) ( not ( = ?auto_57910 ?auto_57900 ) ) ( not ( = ?auto_57902 ?auto_57910 ) ) ( not ( = ?auto_57901 ?auto_57910 ) ) ( HOIST-AT ?auto_57904 ?auto_57910 ) ( not ( = ?auto_57916 ?auto_57904 ) ) ( not ( = ?auto_57917 ?auto_57904 ) ) ( not ( = ?auto_57914 ?auto_57904 ) ) ( AVAILABLE ?auto_57904 ) ( SURFACE-AT ?auto_57922 ?auto_57910 ) ( ON ?auto_57922 ?auto_57918 ) ( CLEAR ?auto_57922 ) ( not ( = ?auto_57897 ?auto_57918 ) ) ( not ( = ?auto_57898 ?auto_57918 ) ) ( not ( = ?auto_57919 ?auto_57918 ) ) ( not ( = ?auto_57922 ?auto_57918 ) ) ( not ( = ?auto_57921 ?auto_57918 ) ) ( not ( = ?auto_57909 ?auto_57918 ) ) ( IS-CRATE ?auto_57909 ) ( not ( = ?auto_57897 ?auto_57907 ) ) ( not ( = ?auto_57898 ?auto_57907 ) ) ( not ( = ?auto_57919 ?auto_57907 ) ) ( not ( = ?auto_57922 ?auto_57907 ) ) ( not ( = ?auto_57921 ?auto_57907 ) ) ( not ( = ?auto_57909 ?auto_57907 ) ) ( not ( = ?auto_57918 ?auto_57907 ) ) ( AVAILABLE ?auto_57917 ) ( SURFACE-AT ?auto_57909 ?auto_57902 ) ( ON ?auto_57909 ?auto_57913 ) ( CLEAR ?auto_57909 ) ( not ( = ?auto_57897 ?auto_57913 ) ) ( not ( = ?auto_57898 ?auto_57913 ) ) ( not ( = ?auto_57919 ?auto_57913 ) ) ( not ( = ?auto_57922 ?auto_57913 ) ) ( not ( = ?auto_57921 ?auto_57913 ) ) ( not ( = ?auto_57909 ?auto_57913 ) ) ( not ( = ?auto_57918 ?auto_57913 ) ) ( not ( = ?auto_57907 ?auto_57913 ) ) ( IS-CRATE ?auto_57907 ) ( not ( = ?auto_57897 ?auto_57912 ) ) ( not ( = ?auto_57898 ?auto_57912 ) ) ( not ( = ?auto_57919 ?auto_57912 ) ) ( not ( = ?auto_57922 ?auto_57912 ) ) ( not ( = ?auto_57921 ?auto_57912 ) ) ( not ( = ?auto_57909 ?auto_57912 ) ) ( not ( = ?auto_57918 ?auto_57912 ) ) ( not ( = ?auto_57907 ?auto_57912 ) ) ( not ( = ?auto_57913 ?auto_57912 ) ) ( not ( = ?auto_57908 ?auto_57900 ) ) ( not ( = ?auto_57902 ?auto_57908 ) ) ( not ( = ?auto_57901 ?auto_57908 ) ) ( not ( = ?auto_57910 ?auto_57908 ) ) ( HOIST-AT ?auto_57899 ?auto_57908 ) ( not ( = ?auto_57916 ?auto_57899 ) ) ( not ( = ?auto_57917 ?auto_57899 ) ) ( not ( = ?auto_57914 ?auto_57899 ) ) ( not ( = ?auto_57904 ?auto_57899 ) ) ( AVAILABLE ?auto_57899 ) ( SURFACE-AT ?auto_57907 ?auto_57908 ) ( ON ?auto_57907 ?auto_57920 ) ( CLEAR ?auto_57907 ) ( not ( = ?auto_57897 ?auto_57920 ) ) ( not ( = ?auto_57898 ?auto_57920 ) ) ( not ( = ?auto_57919 ?auto_57920 ) ) ( not ( = ?auto_57922 ?auto_57920 ) ) ( not ( = ?auto_57921 ?auto_57920 ) ) ( not ( = ?auto_57909 ?auto_57920 ) ) ( not ( = ?auto_57918 ?auto_57920 ) ) ( not ( = ?auto_57907 ?auto_57920 ) ) ( not ( = ?auto_57913 ?auto_57920 ) ) ( not ( = ?auto_57912 ?auto_57920 ) ) ( IS-CRATE ?auto_57912 ) ( not ( = ?auto_57897 ?auto_57915 ) ) ( not ( = ?auto_57898 ?auto_57915 ) ) ( not ( = ?auto_57919 ?auto_57915 ) ) ( not ( = ?auto_57922 ?auto_57915 ) ) ( not ( = ?auto_57921 ?auto_57915 ) ) ( not ( = ?auto_57909 ?auto_57915 ) ) ( not ( = ?auto_57918 ?auto_57915 ) ) ( not ( = ?auto_57907 ?auto_57915 ) ) ( not ( = ?auto_57913 ?auto_57915 ) ) ( not ( = ?auto_57912 ?auto_57915 ) ) ( not ( = ?auto_57920 ?auto_57915 ) ) ( not ( = ?auto_57911 ?auto_57900 ) ) ( not ( = ?auto_57902 ?auto_57911 ) ) ( not ( = ?auto_57901 ?auto_57911 ) ) ( not ( = ?auto_57910 ?auto_57911 ) ) ( not ( = ?auto_57908 ?auto_57911 ) ) ( HOIST-AT ?auto_57903 ?auto_57911 ) ( not ( = ?auto_57916 ?auto_57903 ) ) ( not ( = ?auto_57917 ?auto_57903 ) ) ( not ( = ?auto_57914 ?auto_57903 ) ) ( not ( = ?auto_57904 ?auto_57903 ) ) ( not ( = ?auto_57899 ?auto_57903 ) ) ( AVAILABLE ?auto_57903 ) ( SURFACE-AT ?auto_57912 ?auto_57911 ) ( ON ?auto_57912 ?auto_57906 ) ( CLEAR ?auto_57912 ) ( not ( = ?auto_57897 ?auto_57906 ) ) ( not ( = ?auto_57898 ?auto_57906 ) ) ( not ( = ?auto_57919 ?auto_57906 ) ) ( not ( = ?auto_57922 ?auto_57906 ) ) ( not ( = ?auto_57921 ?auto_57906 ) ) ( not ( = ?auto_57909 ?auto_57906 ) ) ( not ( = ?auto_57918 ?auto_57906 ) ) ( not ( = ?auto_57907 ?auto_57906 ) ) ( not ( = ?auto_57913 ?auto_57906 ) ) ( not ( = ?auto_57912 ?auto_57906 ) ) ( not ( = ?auto_57920 ?auto_57906 ) ) ( not ( = ?auto_57915 ?auto_57906 ) ) ( TRUCK-AT ?auto_57905 ?auto_57900 ) ( SURFACE-AT ?auto_57923 ?auto_57900 ) ( CLEAR ?auto_57923 ) ( LIFTING ?auto_57916 ?auto_57915 ) ( IS-CRATE ?auto_57915 ) ( not ( = ?auto_57897 ?auto_57923 ) ) ( not ( = ?auto_57898 ?auto_57923 ) ) ( not ( = ?auto_57919 ?auto_57923 ) ) ( not ( = ?auto_57922 ?auto_57923 ) ) ( not ( = ?auto_57921 ?auto_57923 ) ) ( not ( = ?auto_57909 ?auto_57923 ) ) ( not ( = ?auto_57918 ?auto_57923 ) ) ( not ( = ?auto_57907 ?auto_57923 ) ) ( not ( = ?auto_57913 ?auto_57923 ) ) ( not ( = ?auto_57912 ?auto_57923 ) ) ( not ( = ?auto_57920 ?auto_57923 ) ) ( not ( = ?auto_57915 ?auto_57923 ) ) ( not ( = ?auto_57906 ?auto_57923 ) ) )
    :subtasks
    ( ( !DROP ?auto_57916 ?auto_57915 ?auto_57923 ?auto_57900 )
      ( MAKE-ON ?auto_57897 ?auto_57898 )
      ( MAKE-ON-VERIFY ?auto_57897 ?auto_57898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57924 - SURFACE
      ?auto_57925 - SURFACE
    )
    :vars
    (
      ?auto_57928 - HOIST
      ?auto_57944 - PLACE
      ?auto_57941 - PLACE
      ?auto_57927 - HOIST
      ?auto_57930 - SURFACE
      ?auto_57938 - SURFACE
      ?auto_57950 - PLACE
      ?auto_57936 - HOIST
      ?auto_57935 - SURFACE
      ?auto_57940 - SURFACE
      ?auto_57946 - PLACE
      ?auto_57939 - HOIST
      ?auto_57926 - SURFACE
      ?auto_57932 - SURFACE
      ?auto_57942 - SURFACE
      ?auto_57947 - SURFACE
      ?auto_57949 - PLACE
      ?auto_57933 - HOIST
      ?auto_57934 - SURFACE
      ?auto_57929 - SURFACE
      ?auto_57945 - PLACE
      ?auto_57943 - HOIST
      ?auto_57948 - SURFACE
      ?auto_57937 - TRUCK
      ?auto_57931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57928 ?auto_57944 ) ( IS-CRATE ?auto_57924 ) ( not ( = ?auto_57924 ?auto_57925 ) ) ( not ( = ?auto_57941 ?auto_57944 ) ) ( HOIST-AT ?auto_57927 ?auto_57941 ) ( not ( = ?auto_57928 ?auto_57927 ) ) ( SURFACE-AT ?auto_57924 ?auto_57941 ) ( ON ?auto_57924 ?auto_57930 ) ( CLEAR ?auto_57924 ) ( not ( = ?auto_57924 ?auto_57930 ) ) ( not ( = ?auto_57925 ?auto_57930 ) ) ( IS-CRATE ?auto_57925 ) ( not ( = ?auto_57924 ?auto_57938 ) ) ( not ( = ?auto_57925 ?auto_57938 ) ) ( not ( = ?auto_57930 ?auto_57938 ) ) ( not ( = ?auto_57950 ?auto_57944 ) ) ( not ( = ?auto_57941 ?auto_57950 ) ) ( HOIST-AT ?auto_57936 ?auto_57950 ) ( not ( = ?auto_57928 ?auto_57936 ) ) ( not ( = ?auto_57927 ?auto_57936 ) ) ( AVAILABLE ?auto_57936 ) ( SURFACE-AT ?auto_57925 ?auto_57950 ) ( ON ?auto_57925 ?auto_57935 ) ( CLEAR ?auto_57925 ) ( not ( = ?auto_57924 ?auto_57935 ) ) ( not ( = ?auto_57925 ?auto_57935 ) ) ( not ( = ?auto_57930 ?auto_57935 ) ) ( not ( = ?auto_57938 ?auto_57935 ) ) ( IS-CRATE ?auto_57938 ) ( not ( = ?auto_57924 ?auto_57940 ) ) ( not ( = ?auto_57925 ?auto_57940 ) ) ( not ( = ?auto_57930 ?auto_57940 ) ) ( not ( = ?auto_57938 ?auto_57940 ) ) ( not ( = ?auto_57935 ?auto_57940 ) ) ( not ( = ?auto_57946 ?auto_57944 ) ) ( not ( = ?auto_57941 ?auto_57946 ) ) ( not ( = ?auto_57950 ?auto_57946 ) ) ( HOIST-AT ?auto_57939 ?auto_57946 ) ( not ( = ?auto_57928 ?auto_57939 ) ) ( not ( = ?auto_57927 ?auto_57939 ) ) ( not ( = ?auto_57936 ?auto_57939 ) ) ( AVAILABLE ?auto_57939 ) ( SURFACE-AT ?auto_57938 ?auto_57946 ) ( ON ?auto_57938 ?auto_57926 ) ( CLEAR ?auto_57938 ) ( not ( = ?auto_57924 ?auto_57926 ) ) ( not ( = ?auto_57925 ?auto_57926 ) ) ( not ( = ?auto_57930 ?auto_57926 ) ) ( not ( = ?auto_57938 ?auto_57926 ) ) ( not ( = ?auto_57935 ?auto_57926 ) ) ( not ( = ?auto_57940 ?auto_57926 ) ) ( IS-CRATE ?auto_57940 ) ( not ( = ?auto_57924 ?auto_57932 ) ) ( not ( = ?auto_57925 ?auto_57932 ) ) ( not ( = ?auto_57930 ?auto_57932 ) ) ( not ( = ?auto_57938 ?auto_57932 ) ) ( not ( = ?auto_57935 ?auto_57932 ) ) ( not ( = ?auto_57940 ?auto_57932 ) ) ( not ( = ?auto_57926 ?auto_57932 ) ) ( AVAILABLE ?auto_57927 ) ( SURFACE-AT ?auto_57940 ?auto_57941 ) ( ON ?auto_57940 ?auto_57942 ) ( CLEAR ?auto_57940 ) ( not ( = ?auto_57924 ?auto_57942 ) ) ( not ( = ?auto_57925 ?auto_57942 ) ) ( not ( = ?auto_57930 ?auto_57942 ) ) ( not ( = ?auto_57938 ?auto_57942 ) ) ( not ( = ?auto_57935 ?auto_57942 ) ) ( not ( = ?auto_57940 ?auto_57942 ) ) ( not ( = ?auto_57926 ?auto_57942 ) ) ( not ( = ?auto_57932 ?auto_57942 ) ) ( IS-CRATE ?auto_57932 ) ( not ( = ?auto_57924 ?auto_57947 ) ) ( not ( = ?auto_57925 ?auto_57947 ) ) ( not ( = ?auto_57930 ?auto_57947 ) ) ( not ( = ?auto_57938 ?auto_57947 ) ) ( not ( = ?auto_57935 ?auto_57947 ) ) ( not ( = ?auto_57940 ?auto_57947 ) ) ( not ( = ?auto_57926 ?auto_57947 ) ) ( not ( = ?auto_57932 ?auto_57947 ) ) ( not ( = ?auto_57942 ?auto_57947 ) ) ( not ( = ?auto_57949 ?auto_57944 ) ) ( not ( = ?auto_57941 ?auto_57949 ) ) ( not ( = ?auto_57950 ?auto_57949 ) ) ( not ( = ?auto_57946 ?auto_57949 ) ) ( HOIST-AT ?auto_57933 ?auto_57949 ) ( not ( = ?auto_57928 ?auto_57933 ) ) ( not ( = ?auto_57927 ?auto_57933 ) ) ( not ( = ?auto_57936 ?auto_57933 ) ) ( not ( = ?auto_57939 ?auto_57933 ) ) ( AVAILABLE ?auto_57933 ) ( SURFACE-AT ?auto_57932 ?auto_57949 ) ( ON ?auto_57932 ?auto_57934 ) ( CLEAR ?auto_57932 ) ( not ( = ?auto_57924 ?auto_57934 ) ) ( not ( = ?auto_57925 ?auto_57934 ) ) ( not ( = ?auto_57930 ?auto_57934 ) ) ( not ( = ?auto_57938 ?auto_57934 ) ) ( not ( = ?auto_57935 ?auto_57934 ) ) ( not ( = ?auto_57940 ?auto_57934 ) ) ( not ( = ?auto_57926 ?auto_57934 ) ) ( not ( = ?auto_57932 ?auto_57934 ) ) ( not ( = ?auto_57942 ?auto_57934 ) ) ( not ( = ?auto_57947 ?auto_57934 ) ) ( IS-CRATE ?auto_57947 ) ( not ( = ?auto_57924 ?auto_57929 ) ) ( not ( = ?auto_57925 ?auto_57929 ) ) ( not ( = ?auto_57930 ?auto_57929 ) ) ( not ( = ?auto_57938 ?auto_57929 ) ) ( not ( = ?auto_57935 ?auto_57929 ) ) ( not ( = ?auto_57940 ?auto_57929 ) ) ( not ( = ?auto_57926 ?auto_57929 ) ) ( not ( = ?auto_57932 ?auto_57929 ) ) ( not ( = ?auto_57942 ?auto_57929 ) ) ( not ( = ?auto_57947 ?auto_57929 ) ) ( not ( = ?auto_57934 ?auto_57929 ) ) ( not ( = ?auto_57945 ?auto_57944 ) ) ( not ( = ?auto_57941 ?auto_57945 ) ) ( not ( = ?auto_57950 ?auto_57945 ) ) ( not ( = ?auto_57946 ?auto_57945 ) ) ( not ( = ?auto_57949 ?auto_57945 ) ) ( HOIST-AT ?auto_57943 ?auto_57945 ) ( not ( = ?auto_57928 ?auto_57943 ) ) ( not ( = ?auto_57927 ?auto_57943 ) ) ( not ( = ?auto_57936 ?auto_57943 ) ) ( not ( = ?auto_57939 ?auto_57943 ) ) ( not ( = ?auto_57933 ?auto_57943 ) ) ( AVAILABLE ?auto_57943 ) ( SURFACE-AT ?auto_57947 ?auto_57945 ) ( ON ?auto_57947 ?auto_57948 ) ( CLEAR ?auto_57947 ) ( not ( = ?auto_57924 ?auto_57948 ) ) ( not ( = ?auto_57925 ?auto_57948 ) ) ( not ( = ?auto_57930 ?auto_57948 ) ) ( not ( = ?auto_57938 ?auto_57948 ) ) ( not ( = ?auto_57935 ?auto_57948 ) ) ( not ( = ?auto_57940 ?auto_57948 ) ) ( not ( = ?auto_57926 ?auto_57948 ) ) ( not ( = ?auto_57932 ?auto_57948 ) ) ( not ( = ?auto_57942 ?auto_57948 ) ) ( not ( = ?auto_57947 ?auto_57948 ) ) ( not ( = ?auto_57934 ?auto_57948 ) ) ( not ( = ?auto_57929 ?auto_57948 ) ) ( TRUCK-AT ?auto_57937 ?auto_57944 ) ( SURFACE-AT ?auto_57931 ?auto_57944 ) ( CLEAR ?auto_57931 ) ( IS-CRATE ?auto_57929 ) ( not ( = ?auto_57924 ?auto_57931 ) ) ( not ( = ?auto_57925 ?auto_57931 ) ) ( not ( = ?auto_57930 ?auto_57931 ) ) ( not ( = ?auto_57938 ?auto_57931 ) ) ( not ( = ?auto_57935 ?auto_57931 ) ) ( not ( = ?auto_57940 ?auto_57931 ) ) ( not ( = ?auto_57926 ?auto_57931 ) ) ( not ( = ?auto_57932 ?auto_57931 ) ) ( not ( = ?auto_57942 ?auto_57931 ) ) ( not ( = ?auto_57947 ?auto_57931 ) ) ( not ( = ?auto_57934 ?auto_57931 ) ) ( not ( = ?auto_57929 ?auto_57931 ) ) ( not ( = ?auto_57948 ?auto_57931 ) ) ( AVAILABLE ?auto_57928 ) ( IN ?auto_57929 ?auto_57937 ) )
    :subtasks
    ( ( !UNLOAD ?auto_57928 ?auto_57929 ?auto_57937 ?auto_57944 )
      ( MAKE-ON ?auto_57924 ?auto_57925 )
      ( MAKE-ON-VERIFY ?auto_57924 ?auto_57925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57951 - SURFACE
      ?auto_57952 - SURFACE
    )
    :vars
    (
      ?auto_57974 - HOIST
      ?auto_57965 - PLACE
      ?auto_57960 - PLACE
      ?auto_57967 - HOIST
      ?auto_57961 - SURFACE
      ?auto_57969 - SURFACE
      ?auto_57970 - PLACE
      ?auto_57966 - HOIST
      ?auto_57972 - SURFACE
      ?auto_57977 - SURFACE
      ?auto_57953 - PLACE
      ?auto_57975 - HOIST
      ?auto_57976 - SURFACE
      ?auto_57973 - SURFACE
      ?auto_57957 - SURFACE
      ?auto_57956 - SURFACE
      ?auto_57971 - PLACE
      ?auto_57955 - HOIST
      ?auto_57962 - SURFACE
      ?auto_57963 - SURFACE
      ?auto_57954 - PLACE
      ?auto_57964 - HOIST
      ?auto_57959 - SURFACE
      ?auto_57958 - SURFACE
      ?auto_57968 - TRUCK
      ?auto_57978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57974 ?auto_57965 ) ( IS-CRATE ?auto_57951 ) ( not ( = ?auto_57951 ?auto_57952 ) ) ( not ( = ?auto_57960 ?auto_57965 ) ) ( HOIST-AT ?auto_57967 ?auto_57960 ) ( not ( = ?auto_57974 ?auto_57967 ) ) ( SURFACE-AT ?auto_57951 ?auto_57960 ) ( ON ?auto_57951 ?auto_57961 ) ( CLEAR ?auto_57951 ) ( not ( = ?auto_57951 ?auto_57961 ) ) ( not ( = ?auto_57952 ?auto_57961 ) ) ( IS-CRATE ?auto_57952 ) ( not ( = ?auto_57951 ?auto_57969 ) ) ( not ( = ?auto_57952 ?auto_57969 ) ) ( not ( = ?auto_57961 ?auto_57969 ) ) ( not ( = ?auto_57970 ?auto_57965 ) ) ( not ( = ?auto_57960 ?auto_57970 ) ) ( HOIST-AT ?auto_57966 ?auto_57970 ) ( not ( = ?auto_57974 ?auto_57966 ) ) ( not ( = ?auto_57967 ?auto_57966 ) ) ( AVAILABLE ?auto_57966 ) ( SURFACE-AT ?auto_57952 ?auto_57970 ) ( ON ?auto_57952 ?auto_57972 ) ( CLEAR ?auto_57952 ) ( not ( = ?auto_57951 ?auto_57972 ) ) ( not ( = ?auto_57952 ?auto_57972 ) ) ( not ( = ?auto_57961 ?auto_57972 ) ) ( not ( = ?auto_57969 ?auto_57972 ) ) ( IS-CRATE ?auto_57969 ) ( not ( = ?auto_57951 ?auto_57977 ) ) ( not ( = ?auto_57952 ?auto_57977 ) ) ( not ( = ?auto_57961 ?auto_57977 ) ) ( not ( = ?auto_57969 ?auto_57977 ) ) ( not ( = ?auto_57972 ?auto_57977 ) ) ( not ( = ?auto_57953 ?auto_57965 ) ) ( not ( = ?auto_57960 ?auto_57953 ) ) ( not ( = ?auto_57970 ?auto_57953 ) ) ( HOIST-AT ?auto_57975 ?auto_57953 ) ( not ( = ?auto_57974 ?auto_57975 ) ) ( not ( = ?auto_57967 ?auto_57975 ) ) ( not ( = ?auto_57966 ?auto_57975 ) ) ( AVAILABLE ?auto_57975 ) ( SURFACE-AT ?auto_57969 ?auto_57953 ) ( ON ?auto_57969 ?auto_57976 ) ( CLEAR ?auto_57969 ) ( not ( = ?auto_57951 ?auto_57976 ) ) ( not ( = ?auto_57952 ?auto_57976 ) ) ( not ( = ?auto_57961 ?auto_57976 ) ) ( not ( = ?auto_57969 ?auto_57976 ) ) ( not ( = ?auto_57972 ?auto_57976 ) ) ( not ( = ?auto_57977 ?auto_57976 ) ) ( IS-CRATE ?auto_57977 ) ( not ( = ?auto_57951 ?auto_57973 ) ) ( not ( = ?auto_57952 ?auto_57973 ) ) ( not ( = ?auto_57961 ?auto_57973 ) ) ( not ( = ?auto_57969 ?auto_57973 ) ) ( not ( = ?auto_57972 ?auto_57973 ) ) ( not ( = ?auto_57977 ?auto_57973 ) ) ( not ( = ?auto_57976 ?auto_57973 ) ) ( AVAILABLE ?auto_57967 ) ( SURFACE-AT ?auto_57977 ?auto_57960 ) ( ON ?auto_57977 ?auto_57957 ) ( CLEAR ?auto_57977 ) ( not ( = ?auto_57951 ?auto_57957 ) ) ( not ( = ?auto_57952 ?auto_57957 ) ) ( not ( = ?auto_57961 ?auto_57957 ) ) ( not ( = ?auto_57969 ?auto_57957 ) ) ( not ( = ?auto_57972 ?auto_57957 ) ) ( not ( = ?auto_57977 ?auto_57957 ) ) ( not ( = ?auto_57976 ?auto_57957 ) ) ( not ( = ?auto_57973 ?auto_57957 ) ) ( IS-CRATE ?auto_57973 ) ( not ( = ?auto_57951 ?auto_57956 ) ) ( not ( = ?auto_57952 ?auto_57956 ) ) ( not ( = ?auto_57961 ?auto_57956 ) ) ( not ( = ?auto_57969 ?auto_57956 ) ) ( not ( = ?auto_57972 ?auto_57956 ) ) ( not ( = ?auto_57977 ?auto_57956 ) ) ( not ( = ?auto_57976 ?auto_57956 ) ) ( not ( = ?auto_57973 ?auto_57956 ) ) ( not ( = ?auto_57957 ?auto_57956 ) ) ( not ( = ?auto_57971 ?auto_57965 ) ) ( not ( = ?auto_57960 ?auto_57971 ) ) ( not ( = ?auto_57970 ?auto_57971 ) ) ( not ( = ?auto_57953 ?auto_57971 ) ) ( HOIST-AT ?auto_57955 ?auto_57971 ) ( not ( = ?auto_57974 ?auto_57955 ) ) ( not ( = ?auto_57967 ?auto_57955 ) ) ( not ( = ?auto_57966 ?auto_57955 ) ) ( not ( = ?auto_57975 ?auto_57955 ) ) ( AVAILABLE ?auto_57955 ) ( SURFACE-AT ?auto_57973 ?auto_57971 ) ( ON ?auto_57973 ?auto_57962 ) ( CLEAR ?auto_57973 ) ( not ( = ?auto_57951 ?auto_57962 ) ) ( not ( = ?auto_57952 ?auto_57962 ) ) ( not ( = ?auto_57961 ?auto_57962 ) ) ( not ( = ?auto_57969 ?auto_57962 ) ) ( not ( = ?auto_57972 ?auto_57962 ) ) ( not ( = ?auto_57977 ?auto_57962 ) ) ( not ( = ?auto_57976 ?auto_57962 ) ) ( not ( = ?auto_57973 ?auto_57962 ) ) ( not ( = ?auto_57957 ?auto_57962 ) ) ( not ( = ?auto_57956 ?auto_57962 ) ) ( IS-CRATE ?auto_57956 ) ( not ( = ?auto_57951 ?auto_57963 ) ) ( not ( = ?auto_57952 ?auto_57963 ) ) ( not ( = ?auto_57961 ?auto_57963 ) ) ( not ( = ?auto_57969 ?auto_57963 ) ) ( not ( = ?auto_57972 ?auto_57963 ) ) ( not ( = ?auto_57977 ?auto_57963 ) ) ( not ( = ?auto_57976 ?auto_57963 ) ) ( not ( = ?auto_57973 ?auto_57963 ) ) ( not ( = ?auto_57957 ?auto_57963 ) ) ( not ( = ?auto_57956 ?auto_57963 ) ) ( not ( = ?auto_57962 ?auto_57963 ) ) ( not ( = ?auto_57954 ?auto_57965 ) ) ( not ( = ?auto_57960 ?auto_57954 ) ) ( not ( = ?auto_57970 ?auto_57954 ) ) ( not ( = ?auto_57953 ?auto_57954 ) ) ( not ( = ?auto_57971 ?auto_57954 ) ) ( HOIST-AT ?auto_57964 ?auto_57954 ) ( not ( = ?auto_57974 ?auto_57964 ) ) ( not ( = ?auto_57967 ?auto_57964 ) ) ( not ( = ?auto_57966 ?auto_57964 ) ) ( not ( = ?auto_57975 ?auto_57964 ) ) ( not ( = ?auto_57955 ?auto_57964 ) ) ( AVAILABLE ?auto_57964 ) ( SURFACE-AT ?auto_57956 ?auto_57954 ) ( ON ?auto_57956 ?auto_57959 ) ( CLEAR ?auto_57956 ) ( not ( = ?auto_57951 ?auto_57959 ) ) ( not ( = ?auto_57952 ?auto_57959 ) ) ( not ( = ?auto_57961 ?auto_57959 ) ) ( not ( = ?auto_57969 ?auto_57959 ) ) ( not ( = ?auto_57972 ?auto_57959 ) ) ( not ( = ?auto_57977 ?auto_57959 ) ) ( not ( = ?auto_57976 ?auto_57959 ) ) ( not ( = ?auto_57973 ?auto_57959 ) ) ( not ( = ?auto_57957 ?auto_57959 ) ) ( not ( = ?auto_57956 ?auto_57959 ) ) ( not ( = ?auto_57962 ?auto_57959 ) ) ( not ( = ?auto_57963 ?auto_57959 ) ) ( SURFACE-AT ?auto_57958 ?auto_57965 ) ( CLEAR ?auto_57958 ) ( IS-CRATE ?auto_57963 ) ( not ( = ?auto_57951 ?auto_57958 ) ) ( not ( = ?auto_57952 ?auto_57958 ) ) ( not ( = ?auto_57961 ?auto_57958 ) ) ( not ( = ?auto_57969 ?auto_57958 ) ) ( not ( = ?auto_57972 ?auto_57958 ) ) ( not ( = ?auto_57977 ?auto_57958 ) ) ( not ( = ?auto_57976 ?auto_57958 ) ) ( not ( = ?auto_57973 ?auto_57958 ) ) ( not ( = ?auto_57957 ?auto_57958 ) ) ( not ( = ?auto_57956 ?auto_57958 ) ) ( not ( = ?auto_57962 ?auto_57958 ) ) ( not ( = ?auto_57963 ?auto_57958 ) ) ( not ( = ?auto_57959 ?auto_57958 ) ) ( AVAILABLE ?auto_57974 ) ( IN ?auto_57963 ?auto_57968 ) ( TRUCK-AT ?auto_57968 ?auto_57978 ) ( not ( = ?auto_57978 ?auto_57965 ) ) ( not ( = ?auto_57960 ?auto_57978 ) ) ( not ( = ?auto_57970 ?auto_57978 ) ) ( not ( = ?auto_57953 ?auto_57978 ) ) ( not ( = ?auto_57971 ?auto_57978 ) ) ( not ( = ?auto_57954 ?auto_57978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_57968 ?auto_57978 ?auto_57965 )
      ( MAKE-ON ?auto_57951 ?auto_57952 )
      ( MAKE-ON-VERIFY ?auto_57951 ?auto_57952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57979 - SURFACE
      ?auto_57980 - SURFACE
    )
    :vars
    (
      ?auto_58006 - HOIST
      ?auto_57998 - PLACE
      ?auto_57983 - PLACE
      ?auto_57985 - HOIST
      ?auto_58002 - SURFACE
      ?auto_57994 - SURFACE
      ?auto_57995 - PLACE
      ?auto_58000 - HOIST
      ?auto_57997 - SURFACE
      ?auto_57992 - SURFACE
      ?auto_57990 - PLACE
      ?auto_58005 - HOIST
      ?auto_57993 - SURFACE
      ?auto_57991 - SURFACE
      ?auto_57989 - SURFACE
      ?auto_57982 - SURFACE
      ?auto_57996 - PLACE
      ?auto_57999 - HOIST
      ?auto_58004 - SURFACE
      ?auto_57988 - SURFACE
      ?auto_58001 - PLACE
      ?auto_58003 - HOIST
      ?auto_57986 - SURFACE
      ?auto_57981 - SURFACE
      ?auto_57987 - TRUCK
      ?auto_57984 - PLACE
      ?auto_58007 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58006 ?auto_57998 ) ( IS-CRATE ?auto_57979 ) ( not ( = ?auto_57979 ?auto_57980 ) ) ( not ( = ?auto_57983 ?auto_57998 ) ) ( HOIST-AT ?auto_57985 ?auto_57983 ) ( not ( = ?auto_58006 ?auto_57985 ) ) ( SURFACE-AT ?auto_57979 ?auto_57983 ) ( ON ?auto_57979 ?auto_58002 ) ( CLEAR ?auto_57979 ) ( not ( = ?auto_57979 ?auto_58002 ) ) ( not ( = ?auto_57980 ?auto_58002 ) ) ( IS-CRATE ?auto_57980 ) ( not ( = ?auto_57979 ?auto_57994 ) ) ( not ( = ?auto_57980 ?auto_57994 ) ) ( not ( = ?auto_58002 ?auto_57994 ) ) ( not ( = ?auto_57995 ?auto_57998 ) ) ( not ( = ?auto_57983 ?auto_57995 ) ) ( HOIST-AT ?auto_58000 ?auto_57995 ) ( not ( = ?auto_58006 ?auto_58000 ) ) ( not ( = ?auto_57985 ?auto_58000 ) ) ( AVAILABLE ?auto_58000 ) ( SURFACE-AT ?auto_57980 ?auto_57995 ) ( ON ?auto_57980 ?auto_57997 ) ( CLEAR ?auto_57980 ) ( not ( = ?auto_57979 ?auto_57997 ) ) ( not ( = ?auto_57980 ?auto_57997 ) ) ( not ( = ?auto_58002 ?auto_57997 ) ) ( not ( = ?auto_57994 ?auto_57997 ) ) ( IS-CRATE ?auto_57994 ) ( not ( = ?auto_57979 ?auto_57992 ) ) ( not ( = ?auto_57980 ?auto_57992 ) ) ( not ( = ?auto_58002 ?auto_57992 ) ) ( not ( = ?auto_57994 ?auto_57992 ) ) ( not ( = ?auto_57997 ?auto_57992 ) ) ( not ( = ?auto_57990 ?auto_57998 ) ) ( not ( = ?auto_57983 ?auto_57990 ) ) ( not ( = ?auto_57995 ?auto_57990 ) ) ( HOIST-AT ?auto_58005 ?auto_57990 ) ( not ( = ?auto_58006 ?auto_58005 ) ) ( not ( = ?auto_57985 ?auto_58005 ) ) ( not ( = ?auto_58000 ?auto_58005 ) ) ( AVAILABLE ?auto_58005 ) ( SURFACE-AT ?auto_57994 ?auto_57990 ) ( ON ?auto_57994 ?auto_57993 ) ( CLEAR ?auto_57994 ) ( not ( = ?auto_57979 ?auto_57993 ) ) ( not ( = ?auto_57980 ?auto_57993 ) ) ( not ( = ?auto_58002 ?auto_57993 ) ) ( not ( = ?auto_57994 ?auto_57993 ) ) ( not ( = ?auto_57997 ?auto_57993 ) ) ( not ( = ?auto_57992 ?auto_57993 ) ) ( IS-CRATE ?auto_57992 ) ( not ( = ?auto_57979 ?auto_57991 ) ) ( not ( = ?auto_57980 ?auto_57991 ) ) ( not ( = ?auto_58002 ?auto_57991 ) ) ( not ( = ?auto_57994 ?auto_57991 ) ) ( not ( = ?auto_57997 ?auto_57991 ) ) ( not ( = ?auto_57992 ?auto_57991 ) ) ( not ( = ?auto_57993 ?auto_57991 ) ) ( AVAILABLE ?auto_57985 ) ( SURFACE-AT ?auto_57992 ?auto_57983 ) ( ON ?auto_57992 ?auto_57989 ) ( CLEAR ?auto_57992 ) ( not ( = ?auto_57979 ?auto_57989 ) ) ( not ( = ?auto_57980 ?auto_57989 ) ) ( not ( = ?auto_58002 ?auto_57989 ) ) ( not ( = ?auto_57994 ?auto_57989 ) ) ( not ( = ?auto_57997 ?auto_57989 ) ) ( not ( = ?auto_57992 ?auto_57989 ) ) ( not ( = ?auto_57993 ?auto_57989 ) ) ( not ( = ?auto_57991 ?auto_57989 ) ) ( IS-CRATE ?auto_57991 ) ( not ( = ?auto_57979 ?auto_57982 ) ) ( not ( = ?auto_57980 ?auto_57982 ) ) ( not ( = ?auto_58002 ?auto_57982 ) ) ( not ( = ?auto_57994 ?auto_57982 ) ) ( not ( = ?auto_57997 ?auto_57982 ) ) ( not ( = ?auto_57992 ?auto_57982 ) ) ( not ( = ?auto_57993 ?auto_57982 ) ) ( not ( = ?auto_57991 ?auto_57982 ) ) ( not ( = ?auto_57989 ?auto_57982 ) ) ( not ( = ?auto_57996 ?auto_57998 ) ) ( not ( = ?auto_57983 ?auto_57996 ) ) ( not ( = ?auto_57995 ?auto_57996 ) ) ( not ( = ?auto_57990 ?auto_57996 ) ) ( HOIST-AT ?auto_57999 ?auto_57996 ) ( not ( = ?auto_58006 ?auto_57999 ) ) ( not ( = ?auto_57985 ?auto_57999 ) ) ( not ( = ?auto_58000 ?auto_57999 ) ) ( not ( = ?auto_58005 ?auto_57999 ) ) ( AVAILABLE ?auto_57999 ) ( SURFACE-AT ?auto_57991 ?auto_57996 ) ( ON ?auto_57991 ?auto_58004 ) ( CLEAR ?auto_57991 ) ( not ( = ?auto_57979 ?auto_58004 ) ) ( not ( = ?auto_57980 ?auto_58004 ) ) ( not ( = ?auto_58002 ?auto_58004 ) ) ( not ( = ?auto_57994 ?auto_58004 ) ) ( not ( = ?auto_57997 ?auto_58004 ) ) ( not ( = ?auto_57992 ?auto_58004 ) ) ( not ( = ?auto_57993 ?auto_58004 ) ) ( not ( = ?auto_57991 ?auto_58004 ) ) ( not ( = ?auto_57989 ?auto_58004 ) ) ( not ( = ?auto_57982 ?auto_58004 ) ) ( IS-CRATE ?auto_57982 ) ( not ( = ?auto_57979 ?auto_57988 ) ) ( not ( = ?auto_57980 ?auto_57988 ) ) ( not ( = ?auto_58002 ?auto_57988 ) ) ( not ( = ?auto_57994 ?auto_57988 ) ) ( not ( = ?auto_57997 ?auto_57988 ) ) ( not ( = ?auto_57992 ?auto_57988 ) ) ( not ( = ?auto_57993 ?auto_57988 ) ) ( not ( = ?auto_57991 ?auto_57988 ) ) ( not ( = ?auto_57989 ?auto_57988 ) ) ( not ( = ?auto_57982 ?auto_57988 ) ) ( not ( = ?auto_58004 ?auto_57988 ) ) ( not ( = ?auto_58001 ?auto_57998 ) ) ( not ( = ?auto_57983 ?auto_58001 ) ) ( not ( = ?auto_57995 ?auto_58001 ) ) ( not ( = ?auto_57990 ?auto_58001 ) ) ( not ( = ?auto_57996 ?auto_58001 ) ) ( HOIST-AT ?auto_58003 ?auto_58001 ) ( not ( = ?auto_58006 ?auto_58003 ) ) ( not ( = ?auto_57985 ?auto_58003 ) ) ( not ( = ?auto_58000 ?auto_58003 ) ) ( not ( = ?auto_58005 ?auto_58003 ) ) ( not ( = ?auto_57999 ?auto_58003 ) ) ( AVAILABLE ?auto_58003 ) ( SURFACE-AT ?auto_57982 ?auto_58001 ) ( ON ?auto_57982 ?auto_57986 ) ( CLEAR ?auto_57982 ) ( not ( = ?auto_57979 ?auto_57986 ) ) ( not ( = ?auto_57980 ?auto_57986 ) ) ( not ( = ?auto_58002 ?auto_57986 ) ) ( not ( = ?auto_57994 ?auto_57986 ) ) ( not ( = ?auto_57997 ?auto_57986 ) ) ( not ( = ?auto_57992 ?auto_57986 ) ) ( not ( = ?auto_57993 ?auto_57986 ) ) ( not ( = ?auto_57991 ?auto_57986 ) ) ( not ( = ?auto_57989 ?auto_57986 ) ) ( not ( = ?auto_57982 ?auto_57986 ) ) ( not ( = ?auto_58004 ?auto_57986 ) ) ( not ( = ?auto_57988 ?auto_57986 ) ) ( SURFACE-AT ?auto_57981 ?auto_57998 ) ( CLEAR ?auto_57981 ) ( IS-CRATE ?auto_57988 ) ( not ( = ?auto_57979 ?auto_57981 ) ) ( not ( = ?auto_57980 ?auto_57981 ) ) ( not ( = ?auto_58002 ?auto_57981 ) ) ( not ( = ?auto_57994 ?auto_57981 ) ) ( not ( = ?auto_57997 ?auto_57981 ) ) ( not ( = ?auto_57992 ?auto_57981 ) ) ( not ( = ?auto_57993 ?auto_57981 ) ) ( not ( = ?auto_57991 ?auto_57981 ) ) ( not ( = ?auto_57989 ?auto_57981 ) ) ( not ( = ?auto_57982 ?auto_57981 ) ) ( not ( = ?auto_58004 ?auto_57981 ) ) ( not ( = ?auto_57988 ?auto_57981 ) ) ( not ( = ?auto_57986 ?auto_57981 ) ) ( AVAILABLE ?auto_58006 ) ( TRUCK-AT ?auto_57987 ?auto_57984 ) ( not ( = ?auto_57984 ?auto_57998 ) ) ( not ( = ?auto_57983 ?auto_57984 ) ) ( not ( = ?auto_57995 ?auto_57984 ) ) ( not ( = ?auto_57990 ?auto_57984 ) ) ( not ( = ?auto_57996 ?auto_57984 ) ) ( not ( = ?auto_58001 ?auto_57984 ) ) ( HOIST-AT ?auto_58007 ?auto_57984 ) ( LIFTING ?auto_58007 ?auto_57988 ) ( not ( = ?auto_58006 ?auto_58007 ) ) ( not ( = ?auto_57985 ?auto_58007 ) ) ( not ( = ?auto_58000 ?auto_58007 ) ) ( not ( = ?auto_58005 ?auto_58007 ) ) ( not ( = ?auto_57999 ?auto_58007 ) ) ( not ( = ?auto_58003 ?auto_58007 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58007 ?auto_57988 ?auto_57987 ?auto_57984 )
      ( MAKE-ON ?auto_57979 ?auto_57980 )
      ( MAKE-ON-VERIFY ?auto_57979 ?auto_57980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58008 - SURFACE
      ?auto_58009 - SURFACE
    )
    :vars
    (
      ?auto_58012 - HOIST
      ?auto_58031 - PLACE
      ?auto_58010 - PLACE
      ?auto_58025 - HOIST
      ?auto_58018 - SURFACE
      ?auto_58027 - SURFACE
      ?auto_58021 - PLACE
      ?auto_58016 - HOIST
      ?auto_58028 - SURFACE
      ?auto_58026 - SURFACE
      ?auto_58032 - PLACE
      ?auto_58014 - HOIST
      ?auto_58033 - SURFACE
      ?auto_58022 - SURFACE
      ?auto_58030 - SURFACE
      ?auto_58024 - SURFACE
      ?auto_58020 - PLACE
      ?auto_58013 - HOIST
      ?auto_58011 - SURFACE
      ?auto_58015 - SURFACE
      ?auto_58017 - PLACE
      ?auto_58019 - HOIST
      ?auto_58023 - SURFACE
      ?auto_58035 - SURFACE
      ?auto_58029 - TRUCK
      ?auto_58034 - PLACE
      ?auto_58036 - HOIST
      ?auto_58037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58012 ?auto_58031 ) ( IS-CRATE ?auto_58008 ) ( not ( = ?auto_58008 ?auto_58009 ) ) ( not ( = ?auto_58010 ?auto_58031 ) ) ( HOIST-AT ?auto_58025 ?auto_58010 ) ( not ( = ?auto_58012 ?auto_58025 ) ) ( SURFACE-AT ?auto_58008 ?auto_58010 ) ( ON ?auto_58008 ?auto_58018 ) ( CLEAR ?auto_58008 ) ( not ( = ?auto_58008 ?auto_58018 ) ) ( not ( = ?auto_58009 ?auto_58018 ) ) ( IS-CRATE ?auto_58009 ) ( not ( = ?auto_58008 ?auto_58027 ) ) ( not ( = ?auto_58009 ?auto_58027 ) ) ( not ( = ?auto_58018 ?auto_58027 ) ) ( not ( = ?auto_58021 ?auto_58031 ) ) ( not ( = ?auto_58010 ?auto_58021 ) ) ( HOIST-AT ?auto_58016 ?auto_58021 ) ( not ( = ?auto_58012 ?auto_58016 ) ) ( not ( = ?auto_58025 ?auto_58016 ) ) ( AVAILABLE ?auto_58016 ) ( SURFACE-AT ?auto_58009 ?auto_58021 ) ( ON ?auto_58009 ?auto_58028 ) ( CLEAR ?auto_58009 ) ( not ( = ?auto_58008 ?auto_58028 ) ) ( not ( = ?auto_58009 ?auto_58028 ) ) ( not ( = ?auto_58018 ?auto_58028 ) ) ( not ( = ?auto_58027 ?auto_58028 ) ) ( IS-CRATE ?auto_58027 ) ( not ( = ?auto_58008 ?auto_58026 ) ) ( not ( = ?auto_58009 ?auto_58026 ) ) ( not ( = ?auto_58018 ?auto_58026 ) ) ( not ( = ?auto_58027 ?auto_58026 ) ) ( not ( = ?auto_58028 ?auto_58026 ) ) ( not ( = ?auto_58032 ?auto_58031 ) ) ( not ( = ?auto_58010 ?auto_58032 ) ) ( not ( = ?auto_58021 ?auto_58032 ) ) ( HOIST-AT ?auto_58014 ?auto_58032 ) ( not ( = ?auto_58012 ?auto_58014 ) ) ( not ( = ?auto_58025 ?auto_58014 ) ) ( not ( = ?auto_58016 ?auto_58014 ) ) ( AVAILABLE ?auto_58014 ) ( SURFACE-AT ?auto_58027 ?auto_58032 ) ( ON ?auto_58027 ?auto_58033 ) ( CLEAR ?auto_58027 ) ( not ( = ?auto_58008 ?auto_58033 ) ) ( not ( = ?auto_58009 ?auto_58033 ) ) ( not ( = ?auto_58018 ?auto_58033 ) ) ( not ( = ?auto_58027 ?auto_58033 ) ) ( not ( = ?auto_58028 ?auto_58033 ) ) ( not ( = ?auto_58026 ?auto_58033 ) ) ( IS-CRATE ?auto_58026 ) ( not ( = ?auto_58008 ?auto_58022 ) ) ( not ( = ?auto_58009 ?auto_58022 ) ) ( not ( = ?auto_58018 ?auto_58022 ) ) ( not ( = ?auto_58027 ?auto_58022 ) ) ( not ( = ?auto_58028 ?auto_58022 ) ) ( not ( = ?auto_58026 ?auto_58022 ) ) ( not ( = ?auto_58033 ?auto_58022 ) ) ( AVAILABLE ?auto_58025 ) ( SURFACE-AT ?auto_58026 ?auto_58010 ) ( ON ?auto_58026 ?auto_58030 ) ( CLEAR ?auto_58026 ) ( not ( = ?auto_58008 ?auto_58030 ) ) ( not ( = ?auto_58009 ?auto_58030 ) ) ( not ( = ?auto_58018 ?auto_58030 ) ) ( not ( = ?auto_58027 ?auto_58030 ) ) ( not ( = ?auto_58028 ?auto_58030 ) ) ( not ( = ?auto_58026 ?auto_58030 ) ) ( not ( = ?auto_58033 ?auto_58030 ) ) ( not ( = ?auto_58022 ?auto_58030 ) ) ( IS-CRATE ?auto_58022 ) ( not ( = ?auto_58008 ?auto_58024 ) ) ( not ( = ?auto_58009 ?auto_58024 ) ) ( not ( = ?auto_58018 ?auto_58024 ) ) ( not ( = ?auto_58027 ?auto_58024 ) ) ( not ( = ?auto_58028 ?auto_58024 ) ) ( not ( = ?auto_58026 ?auto_58024 ) ) ( not ( = ?auto_58033 ?auto_58024 ) ) ( not ( = ?auto_58022 ?auto_58024 ) ) ( not ( = ?auto_58030 ?auto_58024 ) ) ( not ( = ?auto_58020 ?auto_58031 ) ) ( not ( = ?auto_58010 ?auto_58020 ) ) ( not ( = ?auto_58021 ?auto_58020 ) ) ( not ( = ?auto_58032 ?auto_58020 ) ) ( HOIST-AT ?auto_58013 ?auto_58020 ) ( not ( = ?auto_58012 ?auto_58013 ) ) ( not ( = ?auto_58025 ?auto_58013 ) ) ( not ( = ?auto_58016 ?auto_58013 ) ) ( not ( = ?auto_58014 ?auto_58013 ) ) ( AVAILABLE ?auto_58013 ) ( SURFACE-AT ?auto_58022 ?auto_58020 ) ( ON ?auto_58022 ?auto_58011 ) ( CLEAR ?auto_58022 ) ( not ( = ?auto_58008 ?auto_58011 ) ) ( not ( = ?auto_58009 ?auto_58011 ) ) ( not ( = ?auto_58018 ?auto_58011 ) ) ( not ( = ?auto_58027 ?auto_58011 ) ) ( not ( = ?auto_58028 ?auto_58011 ) ) ( not ( = ?auto_58026 ?auto_58011 ) ) ( not ( = ?auto_58033 ?auto_58011 ) ) ( not ( = ?auto_58022 ?auto_58011 ) ) ( not ( = ?auto_58030 ?auto_58011 ) ) ( not ( = ?auto_58024 ?auto_58011 ) ) ( IS-CRATE ?auto_58024 ) ( not ( = ?auto_58008 ?auto_58015 ) ) ( not ( = ?auto_58009 ?auto_58015 ) ) ( not ( = ?auto_58018 ?auto_58015 ) ) ( not ( = ?auto_58027 ?auto_58015 ) ) ( not ( = ?auto_58028 ?auto_58015 ) ) ( not ( = ?auto_58026 ?auto_58015 ) ) ( not ( = ?auto_58033 ?auto_58015 ) ) ( not ( = ?auto_58022 ?auto_58015 ) ) ( not ( = ?auto_58030 ?auto_58015 ) ) ( not ( = ?auto_58024 ?auto_58015 ) ) ( not ( = ?auto_58011 ?auto_58015 ) ) ( not ( = ?auto_58017 ?auto_58031 ) ) ( not ( = ?auto_58010 ?auto_58017 ) ) ( not ( = ?auto_58021 ?auto_58017 ) ) ( not ( = ?auto_58032 ?auto_58017 ) ) ( not ( = ?auto_58020 ?auto_58017 ) ) ( HOIST-AT ?auto_58019 ?auto_58017 ) ( not ( = ?auto_58012 ?auto_58019 ) ) ( not ( = ?auto_58025 ?auto_58019 ) ) ( not ( = ?auto_58016 ?auto_58019 ) ) ( not ( = ?auto_58014 ?auto_58019 ) ) ( not ( = ?auto_58013 ?auto_58019 ) ) ( AVAILABLE ?auto_58019 ) ( SURFACE-AT ?auto_58024 ?auto_58017 ) ( ON ?auto_58024 ?auto_58023 ) ( CLEAR ?auto_58024 ) ( not ( = ?auto_58008 ?auto_58023 ) ) ( not ( = ?auto_58009 ?auto_58023 ) ) ( not ( = ?auto_58018 ?auto_58023 ) ) ( not ( = ?auto_58027 ?auto_58023 ) ) ( not ( = ?auto_58028 ?auto_58023 ) ) ( not ( = ?auto_58026 ?auto_58023 ) ) ( not ( = ?auto_58033 ?auto_58023 ) ) ( not ( = ?auto_58022 ?auto_58023 ) ) ( not ( = ?auto_58030 ?auto_58023 ) ) ( not ( = ?auto_58024 ?auto_58023 ) ) ( not ( = ?auto_58011 ?auto_58023 ) ) ( not ( = ?auto_58015 ?auto_58023 ) ) ( SURFACE-AT ?auto_58035 ?auto_58031 ) ( CLEAR ?auto_58035 ) ( IS-CRATE ?auto_58015 ) ( not ( = ?auto_58008 ?auto_58035 ) ) ( not ( = ?auto_58009 ?auto_58035 ) ) ( not ( = ?auto_58018 ?auto_58035 ) ) ( not ( = ?auto_58027 ?auto_58035 ) ) ( not ( = ?auto_58028 ?auto_58035 ) ) ( not ( = ?auto_58026 ?auto_58035 ) ) ( not ( = ?auto_58033 ?auto_58035 ) ) ( not ( = ?auto_58022 ?auto_58035 ) ) ( not ( = ?auto_58030 ?auto_58035 ) ) ( not ( = ?auto_58024 ?auto_58035 ) ) ( not ( = ?auto_58011 ?auto_58035 ) ) ( not ( = ?auto_58015 ?auto_58035 ) ) ( not ( = ?auto_58023 ?auto_58035 ) ) ( AVAILABLE ?auto_58012 ) ( TRUCK-AT ?auto_58029 ?auto_58034 ) ( not ( = ?auto_58034 ?auto_58031 ) ) ( not ( = ?auto_58010 ?auto_58034 ) ) ( not ( = ?auto_58021 ?auto_58034 ) ) ( not ( = ?auto_58032 ?auto_58034 ) ) ( not ( = ?auto_58020 ?auto_58034 ) ) ( not ( = ?auto_58017 ?auto_58034 ) ) ( HOIST-AT ?auto_58036 ?auto_58034 ) ( not ( = ?auto_58012 ?auto_58036 ) ) ( not ( = ?auto_58025 ?auto_58036 ) ) ( not ( = ?auto_58016 ?auto_58036 ) ) ( not ( = ?auto_58014 ?auto_58036 ) ) ( not ( = ?auto_58013 ?auto_58036 ) ) ( not ( = ?auto_58019 ?auto_58036 ) ) ( AVAILABLE ?auto_58036 ) ( SURFACE-AT ?auto_58015 ?auto_58034 ) ( ON ?auto_58015 ?auto_58037 ) ( CLEAR ?auto_58015 ) ( not ( = ?auto_58008 ?auto_58037 ) ) ( not ( = ?auto_58009 ?auto_58037 ) ) ( not ( = ?auto_58018 ?auto_58037 ) ) ( not ( = ?auto_58027 ?auto_58037 ) ) ( not ( = ?auto_58028 ?auto_58037 ) ) ( not ( = ?auto_58026 ?auto_58037 ) ) ( not ( = ?auto_58033 ?auto_58037 ) ) ( not ( = ?auto_58022 ?auto_58037 ) ) ( not ( = ?auto_58030 ?auto_58037 ) ) ( not ( = ?auto_58024 ?auto_58037 ) ) ( not ( = ?auto_58011 ?auto_58037 ) ) ( not ( = ?auto_58015 ?auto_58037 ) ) ( not ( = ?auto_58023 ?auto_58037 ) ) ( not ( = ?auto_58035 ?auto_58037 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58036 ?auto_58015 ?auto_58037 ?auto_58034 )
      ( MAKE-ON ?auto_58008 ?auto_58009 )
      ( MAKE-ON-VERIFY ?auto_58008 ?auto_58009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58038 - SURFACE
      ?auto_58039 - SURFACE
    )
    :vars
    (
      ?auto_58043 - HOIST
      ?auto_58040 - PLACE
      ?auto_58065 - PLACE
      ?auto_58041 - HOIST
      ?auto_58066 - SURFACE
      ?auto_58057 - SURFACE
      ?auto_58051 - PLACE
      ?auto_58042 - HOIST
      ?auto_58058 - SURFACE
      ?auto_58056 - SURFACE
      ?auto_58067 - PLACE
      ?auto_58063 - HOIST
      ?auto_58055 - SURFACE
      ?auto_58045 - SURFACE
      ?auto_58060 - SURFACE
      ?auto_58052 - SURFACE
      ?auto_58053 - PLACE
      ?auto_58046 - HOIST
      ?auto_58061 - SURFACE
      ?auto_58048 - SURFACE
      ?auto_58047 - PLACE
      ?auto_58044 - HOIST
      ?auto_58062 - SURFACE
      ?auto_58050 - SURFACE
      ?auto_58049 - PLACE
      ?auto_58054 - HOIST
      ?auto_58064 - SURFACE
      ?auto_58059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58043 ?auto_58040 ) ( IS-CRATE ?auto_58038 ) ( not ( = ?auto_58038 ?auto_58039 ) ) ( not ( = ?auto_58065 ?auto_58040 ) ) ( HOIST-AT ?auto_58041 ?auto_58065 ) ( not ( = ?auto_58043 ?auto_58041 ) ) ( SURFACE-AT ?auto_58038 ?auto_58065 ) ( ON ?auto_58038 ?auto_58066 ) ( CLEAR ?auto_58038 ) ( not ( = ?auto_58038 ?auto_58066 ) ) ( not ( = ?auto_58039 ?auto_58066 ) ) ( IS-CRATE ?auto_58039 ) ( not ( = ?auto_58038 ?auto_58057 ) ) ( not ( = ?auto_58039 ?auto_58057 ) ) ( not ( = ?auto_58066 ?auto_58057 ) ) ( not ( = ?auto_58051 ?auto_58040 ) ) ( not ( = ?auto_58065 ?auto_58051 ) ) ( HOIST-AT ?auto_58042 ?auto_58051 ) ( not ( = ?auto_58043 ?auto_58042 ) ) ( not ( = ?auto_58041 ?auto_58042 ) ) ( AVAILABLE ?auto_58042 ) ( SURFACE-AT ?auto_58039 ?auto_58051 ) ( ON ?auto_58039 ?auto_58058 ) ( CLEAR ?auto_58039 ) ( not ( = ?auto_58038 ?auto_58058 ) ) ( not ( = ?auto_58039 ?auto_58058 ) ) ( not ( = ?auto_58066 ?auto_58058 ) ) ( not ( = ?auto_58057 ?auto_58058 ) ) ( IS-CRATE ?auto_58057 ) ( not ( = ?auto_58038 ?auto_58056 ) ) ( not ( = ?auto_58039 ?auto_58056 ) ) ( not ( = ?auto_58066 ?auto_58056 ) ) ( not ( = ?auto_58057 ?auto_58056 ) ) ( not ( = ?auto_58058 ?auto_58056 ) ) ( not ( = ?auto_58067 ?auto_58040 ) ) ( not ( = ?auto_58065 ?auto_58067 ) ) ( not ( = ?auto_58051 ?auto_58067 ) ) ( HOIST-AT ?auto_58063 ?auto_58067 ) ( not ( = ?auto_58043 ?auto_58063 ) ) ( not ( = ?auto_58041 ?auto_58063 ) ) ( not ( = ?auto_58042 ?auto_58063 ) ) ( AVAILABLE ?auto_58063 ) ( SURFACE-AT ?auto_58057 ?auto_58067 ) ( ON ?auto_58057 ?auto_58055 ) ( CLEAR ?auto_58057 ) ( not ( = ?auto_58038 ?auto_58055 ) ) ( not ( = ?auto_58039 ?auto_58055 ) ) ( not ( = ?auto_58066 ?auto_58055 ) ) ( not ( = ?auto_58057 ?auto_58055 ) ) ( not ( = ?auto_58058 ?auto_58055 ) ) ( not ( = ?auto_58056 ?auto_58055 ) ) ( IS-CRATE ?auto_58056 ) ( not ( = ?auto_58038 ?auto_58045 ) ) ( not ( = ?auto_58039 ?auto_58045 ) ) ( not ( = ?auto_58066 ?auto_58045 ) ) ( not ( = ?auto_58057 ?auto_58045 ) ) ( not ( = ?auto_58058 ?auto_58045 ) ) ( not ( = ?auto_58056 ?auto_58045 ) ) ( not ( = ?auto_58055 ?auto_58045 ) ) ( AVAILABLE ?auto_58041 ) ( SURFACE-AT ?auto_58056 ?auto_58065 ) ( ON ?auto_58056 ?auto_58060 ) ( CLEAR ?auto_58056 ) ( not ( = ?auto_58038 ?auto_58060 ) ) ( not ( = ?auto_58039 ?auto_58060 ) ) ( not ( = ?auto_58066 ?auto_58060 ) ) ( not ( = ?auto_58057 ?auto_58060 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( not ( = ?auto_58056 ?auto_58060 ) ) ( not ( = ?auto_58055 ?auto_58060 ) ) ( not ( = ?auto_58045 ?auto_58060 ) ) ( IS-CRATE ?auto_58045 ) ( not ( = ?auto_58038 ?auto_58052 ) ) ( not ( = ?auto_58039 ?auto_58052 ) ) ( not ( = ?auto_58066 ?auto_58052 ) ) ( not ( = ?auto_58057 ?auto_58052 ) ) ( not ( = ?auto_58058 ?auto_58052 ) ) ( not ( = ?auto_58056 ?auto_58052 ) ) ( not ( = ?auto_58055 ?auto_58052 ) ) ( not ( = ?auto_58045 ?auto_58052 ) ) ( not ( = ?auto_58060 ?auto_58052 ) ) ( not ( = ?auto_58053 ?auto_58040 ) ) ( not ( = ?auto_58065 ?auto_58053 ) ) ( not ( = ?auto_58051 ?auto_58053 ) ) ( not ( = ?auto_58067 ?auto_58053 ) ) ( HOIST-AT ?auto_58046 ?auto_58053 ) ( not ( = ?auto_58043 ?auto_58046 ) ) ( not ( = ?auto_58041 ?auto_58046 ) ) ( not ( = ?auto_58042 ?auto_58046 ) ) ( not ( = ?auto_58063 ?auto_58046 ) ) ( AVAILABLE ?auto_58046 ) ( SURFACE-AT ?auto_58045 ?auto_58053 ) ( ON ?auto_58045 ?auto_58061 ) ( CLEAR ?auto_58045 ) ( not ( = ?auto_58038 ?auto_58061 ) ) ( not ( = ?auto_58039 ?auto_58061 ) ) ( not ( = ?auto_58066 ?auto_58061 ) ) ( not ( = ?auto_58057 ?auto_58061 ) ) ( not ( = ?auto_58058 ?auto_58061 ) ) ( not ( = ?auto_58056 ?auto_58061 ) ) ( not ( = ?auto_58055 ?auto_58061 ) ) ( not ( = ?auto_58045 ?auto_58061 ) ) ( not ( = ?auto_58060 ?auto_58061 ) ) ( not ( = ?auto_58052 ?auto_58061 ) ) ( IS-CRATE ?auto_58052 ) ( not ( = ?auto_58038 ?auto_58048 ) ) ( not ( = ?auto_58039 ?auto_58048 ) ) ( not ( = ?auto_58066 ?auto_58048 ) ) ( not ( = ?auto_58057 ?auto_58048 ) ) ( not ( = ?auto_58058 ?auto_58048 ) ) ( not ( = ?auto_58056 ?auto_58048 ) ) ( not ( = ?auto_58055 ?auto_58048 ) ) ( not ( = ?auto_58045 ?auto_58048 ) ) ( not ( = ?auto_58060 ?auto_58048 ) ) ( not ( = ?auto_58052 ?auto_58048 ) ) ( not ( = ?auto_58061 ?auto_58048 ) ) ( not ( = ?auto_58047 ?auto_58040 ) ) ( not ( = ?auto_58065 ?auto_58047 ) ) ( not ( = ?auto_58051 ?auto_58047 ) ) ( not ( = ?auto_58067 ?auto_58047 ) ) ( not ( = ?auto_58053 ?auto_58047 ) ) ( HOIST-AT ?auto_58044 ?auto_58047 ) ( not ( = ?auto_58043 ?auto_58044 ) ) ( not ( = ?auto_58041 ?auto_58044 ) ) ( not ( = ?auto_58042 ?auto_58044 ) ) ( not ( = ?auto_58063 ?auto_58044 ) ) ( not ( = ?auto_58046 ?auto_58044 ) ) ( AVAILABLE ?auto_58044 ) ( SURFACE-AT ?auto_58052 ?auto_58047 ) ( ON ?auto_58052 ?auto_58062 ) ( CLEAR ?auto_58052 ) ( not ( = ?auto_58038 ?auto_58062 ) ) ( not ( = ?auto_58039 ?auto_58062 ) ) ( not ( = ?auto_58066 ?auto_58062 ) ) ( not ( = ?auto_58057 ?auto_58062 ) ) ( not ( = ?auto_58058 ?auto_58062 ) ) ( not ( = ?auto_58056 ?auto_58062 ) ) ( not ( = ?auto_58055 ?auto_58062 ) ) ( not ( = ?auto_58045 ?auto_58062 ) ) ( not ( = ?auto_58060 ?auto_58062 ) ) ( not ( = ?auto_58052 ?auto_58062 ) ) ( not ( = ?auto_58061 ?auto_58062 ) ) ( not ( = ?auto_58048 ?auto_58062 ) ) ( SURFACE-AT ?auto_58050 ?auto_58040 ) ( CLEAR ?auto_58050 ) ( IS-CRATE ?auto_58048 ) ( not ( = ?auto_58038 ?auto_58050 ) ) ( not ( = ?auto_58039 ?auto_58050 ) ) ( not ( = ?auto_58066 ?auto_58050 ) ) ( not ( = ?auto_58057 ?auto_58050 ) ) ( not ( = ?auto_58058 ?auto_58050 ) ) ( not ( = ?auto_58056 ?auto_58050 ) ) ( not ( = ?auto_58055 ?auto_58050 ) ) ( not ( = ?auto_58045 ?auto_58050 ) ) ( not ( = ?auto_58060 ?auto_58050 ) ) ( not ( = ?auto_58052 ?auto_58050 ) ) ( not ( = ?auto_58061 ?auto_58050 ) ) ( not ( = ?auto_58048 ?auto_58050 ) ) ( not ( = ?auto_58062 ?auto_58050 ) ) ( AVAILABLE ?auto_58043 ) ( not ( = ?auto_58049 ?auto_58040 ) ) ( not ( = ?auto_58065 ?auto_58049 ) ) ( not ( = ?auto_58051 ?auto_58049 ) ) ( not ( = ?auto_58067 ?auto_58049 ) ) ( not ( = ?auto_58053 ?auto_58049 ) ) ( not ( = ?auto_58047 ?auto_58049 ) ) ( HOIST-AT ?auto_58054 ?auto_58049 ) ( not ( = ?auto_58043 ?auto_58054 ) ) ( not ( = ?auto_58041 ?auto_58054 ) ) ( not ( = ?auto_58042 ?auto_58054 ) ) ( not ( = ?auto_58063 ?auto_58054 ) ) ( not ( = ?auto_58046 ?auto_58054 ) ) ( not ( = ?auto_58044 ?auto_58054 ) ) ( AVAILABLE ?auto_58054 ) ( SURFACE-AT ?auto_58048 ?auto_58049 ) ( ON ?auto_58048 ?auto_58064 ) ( CLEAR ?auto_58048 ) ( not ( = ?auto_58038 ?auto_58064 ) ) ( not ( = ?auto_58039 ?auto_58064 ) ) ( not ( = ?auto_58066 ?auto_58064 ) ) ( not ( = ?auto_58057 ?auto_58064 ) ) ( not ( = ?auto_58058 ?auto_58064 ) ) ( not ( = ?auto_58056 ?auto_58064 ) ) ( not ( = ?auto_58055 ?auto_58064 ) ) ( not ( = ?auto_58045 ?auto_58064 ) ) ( not ( = ?auto_58060 ?auto_58064 ) ) ( not ( = ?auto_58052 ?auto_58064 ) ) ( not ( = ?auto_58061 ?auto_58064 ) ) ( not ( = ?auto_58048 ?auto_58064 ) ) ( not ( = ?auto_58062 ?auto_58064 ) ) ( not ( = ?auto_58050 ?auto_58064 ) ) ( TRUCK-AT ?auto_58059 ?auto_58040 ) )
    :subtasks
    ( ( !DRIVE ?auto_58059 ?auto_58040 ?auto_58049 )
      ( MAKE-ON ?auto_58038 ?auto_58039 )
      ( MAKE-ON-VERIFY ?auto_58038 ?auto_58039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58068 - SURFACE
      ?auto_58069 - SURFACE
    )
    :vars
    (
      ?auto_58079 - HOIST
      ?auto_58071 - PLACE
      ?auto_58089 - PLACE
      ?auto_58084 - HOIST
      ?auto_58090 - SURFACE
      ?auto_58094 - SURFACE
      ?auto_58082 - PLACE
      ?auto_58077 - HOIST
      ?auto_58073 - SURFACE
      ?auto_58093 - SURFACE
      ?auto_58091 - PLACE
      ?auto_58092 - HOIST
      ?auto_58080 - SURFACE
      ?auto_58076 - SURFACE
      ?auto_58095 - SURFACE
      ?auto_58087 - SURFACE
      ?auto_58075 - PLACE
      ?auto_58078 - HOIST
      ?auto_58096 - SURFACE
      ?auto_58081 - SURFACE
      ?auto_58086 - PLACE
      ?auto_58074 - HOIST
      ?auto_58097 - SURFACE
      ?auto_58088 - SURFACE
      ?auto_58083 - PLACE
      ?auto_58070 - HOIST
      ?auto_58085 - SURFACE
      ?auto_58072 - TRUCK
      ?auto_58098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58079 ?auto_58071 ) ( IS-CRATE ?auto_58068 ) ( not ( = ?auto_58068 ?auto_58069 ) ) ( not ( = ?auto_58089 ?auto_58071 ) ) ( HOIST-AT ?auto_58084 ?auto_58089 ) ( not ( = ?auto_58079 ?auto_58084 ) ) ( SURFACE-AT ?auto_58068 ?auto_58089 ) ( ON ?auto_58068 ?auto_58090 ) ( CLEAR ?auto_58068 ) ( not ( = ?auto_58068 ?auto_58090 ) ) ( not ( = ?auto_58069 ?auto_58090 ) ) ( IS-CRATE ?auto_58069 ) ( not ( = ?auto_58068 ?auto_58094 ) ) ( not ( = ?auto_58069 ?auto_58094 ) ) ( not ( = ?auto_58090 ?auto_58094 ) ) ( not ( = ?auto_58082 ?auto_58071 ) ) ( not ( = ?auto_58089 ?auto_58082 ) ) ( HOIST-AT ?auto_58077 ?auto_58082 ) ( not ( = ?auto_58079 ?auto_58077 ) ) ( not ( = ?auto_58084 ?auto_58077 ) ) ( AVAILABLE ?auto_58077 ) ( SURFACE-AT ?auto_58069 ?auto_58082 ) ( ON ?auto_58069 ?auto_58073 ) ( CLEAR ?auto_58069 ) ( not ( = ?auto_58068 ?auto_58073 ) ) ( not ( = ?auto_58069 ?auto_58073 ) ) ( not ( = ?auto_58090 ?auto_58073 ) ) ( not ( = ?auto_58094 ?auto_58073 ) ) ( IS-CRATE ?auto_58094 ) ( not ( = ?auto_58068 ?auto_58093 ) ) ( not ( = ?auto_58069 ?auto_58093 ) ) ( not ( = ?auto_58090 ?auto_58093 ) ) ( not ( = ?auto_58094 ?auto_58093 ) ) ( not ( = ?auto_58073 ?auto_58093 ) ) ( not ( = ?auto_58091 ?auto_58071 ) ) ( not ( = ?auto_58089 ?auto_58091 ) ) ( not ( = ?auto_58082 ?auto_58091 ) ) ( HOIST-AT ?auto_58092 ?auto_58091 ) ( not ( = ?auto_58079 ?auto_58092 ) ) ( not ( = ?auto_58084 ?auto_58092 ) ) ( not ( = ?auto_58077 ?auto_58092 ) ) ( AVAILABLE ?auto_58092 ) ( SURFACE-AT ?auto_58094 ?auto_58091 ) ( ON ?auto_58094 ?auto_58080 ) ( CLEAR ?auto_58094 ) ( not ( = ?auto_58068 ?auto_58080 ) ) ( not ( = ?auto_58069 ?auto_58080 ) ) ( not ( = ?auto_58090 ?auto_58080 ) ) ( not ( = ?auto_58094 ?auto_58080 ) ) ( not ( = ?auto_58073 ?auto_58080 ) ) ( not ( = ?auto_58093 ?auto_58080 ) ) ( IS-CRATE ?auto_58093 ) ( not ( = ?auto_58068 ?auto_58076 ) ) ( not ( = ?auto_58069 ?auto_58076 ) ) ( not ( = ?auto_58090 ?auto_58076 ) ) ( not ( = ?auto_58094 ?auto_58076 ) ) ( not ( = ?auto_58073 ?auto_58076 ) ) ( not ( = ?auto_58093 ?auto_58076 ) ) ( not ( = ?auto_58080 ?auto_58076 ) ) ( AVAILABLE ?auto_58084 ) ( SURFACE-AT ?auto_58093 ?auto_58089 ) ( ON ?auto_58093 ?auto_58095 ) ( CLEAR ?auto_58093 ) ( not ( = ?auto_58068 ?auto_58095 ) ) ( not ( = ?auto_58069 ?auto_58095 ) ) ( not ( = ?auto_58090 ?auto_58095 ) ) ( not ( = ?auto_58094 ?auto_58095 ) ) ( not ( = ?auto_58073 ?auto_58095 ) ) ( not ( = ?auto_58093 ?auto_58095 ) ) ( not ( = ?auto_58080 ?auto_58095 ) ) ( not ( = ?auto_58076 ?auto_58095 ) ) ( IS-CRATE ?auto_58076 ) ( not ( = ?auto_58068 ?auto_58087 ) ) ( not ( = ?auto_58069 ?auto_58087 ) ) ( not ( = ?auto_58090 ?auto_58087 ) ) ( not ( = ?auto_58094 ?auto_58087 ) ) ( not ( = ?auto_58073 ?auto_58087 ) ) ( not ( = ?auto_58093 ?auto_58087 ) ) ( not ( = ?auto_58080 ?auto_58087 ) ) ( not ( = ?auto_58076 ?auto_58087 ) ) ( not ( = ?auto_58095 ?auto_58087 ) ) ( not ( = ?auto_58075 ?auto_58071 ) ) ( not ( = ?auto_58089 ?auto_58075 ) ) ( not ( = ?auto_58082 ?auto_58075 ) ) ( not ( = ?auto_58091 ?auto_58075 ) ) ( HOIST-AT ?auto_58078 ?auto_58075 ) ( not ( = ?auto_58079 ?auto_58078 ) ) ( not ( = ?auto_58084 ?auto_58078 ) ) ( not ( = ?auto_58077 ?auto_58078 ) ) ( not ( = ?auto_58092 ?auto_58078 ) ) ( AVAILABLE ?auto_58078 ) ( SURFACE-AT ?auto_58076 ?auto_58075 ) ( ON ?auto_58076 ?auto_58096 ) ( CLEAR ?auto_58076 ) ( not ( = ?auto_58068 ?auto_58096 ) ) ( not ( = ?auto_58069 ?auto_58096 ) ) ( not ( = ?auto_58090 ?auto_58096 ) ) ( not ( = ?auto_58094 ?auto_58096 ) ) ( not ( = ?auto_58073 ?auto_58096 ) ) ( not ( = ?auto_58093 ?auto_58096 ) ) ( not ( = ?auto_58080 ?auto_58096 ) ) ( not ( = ?auto_58076 ?auto_58096 ) ) ( not ( = ?auto_58095 ?auto_58096 ) ) ( not ( = ?auto_58087 ?auto_58096 ) ) ( IS-CRATE ?auto_58087 ) ( not ( = ?auto_58068 ?auto_58081 ) ) ( not ( = ?auto_58069 ?auto_58081 ) ) ( not ( = ?auto_58090 ?auto_58081 ) ) ( not ( = ?auto_58094 ?auto_58081 ) ) ( not ( = ?auto_58073 ?auto_58081 ) ) ( not ( = ?auto_58093 ?auto_58081 ) ) ( not ( = ?auto_58080 ?auto_58081 ) ) ( not ( = ?auto_58076 ?auto_58081 ) ) ( not ( = ?auto_58095 ?auto_58081 ) ) ( not ( = ?auto_58087 ?auto_58081 ) ) ( not ( = ?auto_58096 ?auto_58081 ) ) ( not ( = ?auto_58086 ?auto_58071 ) ) ( not ( = ?auto_58089 ?auto_58086 ) ) ( not ( = ?auto_58082 ?auto_58086 ) ) ( not ( = ?auto_58091 ?auto_58086 ) ) ( not ( = ?auto_58075 ?auto_58086 ) ) ( HOIST-AT ?auto_58074 ?auto_58086 ) ( not ( = ?auto_58079 ?auto_58074 ) ) ( not ( = ?auto_58084 ?auto_58074 ) ) ( not ( = ?auto_58077 ?auto_58074 ) ) ( not ( = ?auto_58092 ?auto_58074 ) ) ( not ( = ?auto_58078 ?auto_58074 ) ) ( AVAILABLE ?auto_58074 ) ( SURFACE-AT ?auto_58087 ?auto_58086 ) ( ON ?auto_58087 ?auto_58097 ) ( CLEAR ?auto_58087 ) ( not ( = ?auto_58068 ?auto_58097 ) ) ( not ( = ?auto_58069 ?auto_58097 ) ) ( not ( = ?auto_58090 ?auto_58097 ) ) ( not ( = ?auto_58094 ?auto_58097 ) ) ( not ( = ?auto_58073 ?auto_58097 ) ) ( not ( = ?auto_58093 ?auto_58097 ) ) ( not ( = ?auto_58080 ?auto_58097 ) ) ( not ( = ?auto_58076 ?auto_58097 ) ) ( not ( = ?auto_58095 ?auto_58097 ) ) ( not ( = ?auto_58087 ?auto_58097 ) ) ( not ( = ?auto_58096 ?auto_58097 ) ) ( not ( = ?auto_58081 ?auto_58097 ) ) ( IS-CRATE ?auto_58081 ) ( not ( = ?auto_58068 ?auto_58088 ) ) ( not ( = ?auto_58069 ?auto_58088 ) ) ( not ( = ?auto_58090 ?auto_58088 ) ) ( not ( = ?auto_58094 ?auto_58088 ) ) ( not ( = ?auto_58073 ?auto_58088 ) ) ( not ( = ?auto_58093 ?auto_58088 ) ) ( not ( = ?auto_58080 ?auto_58088 ) ) ( not ( = ?auto_58076 ?auto_58088 ) ) ( not ( = ?auto_58095 ?auto_58088 ) ) ( not ( = ?auto_58087 ?auto_58088 ) ) ( not ( = ?auto_58096 ?auto_58088 ) ) ( not ( = ?auto_58081 ?auto_58088 ) ) ( not ( = ?auto_58097 ?auto_58088 ) ) ( not ( = ?auto_58083 ?auto_58071 ) ) ( not ( = ?auto_58089 ?auto_58083 ) ) ( not ( = ?auto_58082 ?auto_58083 ) ) ( not ( = ?auto_58091 ?auto_58083 ) ) ( not ( = ?auto_58075 ?auto_58083 ) ) ( not ( = ?auto_58086 ?auto_58083 ) ) ( HOIST-AT ?auto_58070 ?auto_58083 ) ( not ( = ?auto_58079 ?auto_58070 ) ) ( not ( = ?auto_58084 ?auto_58070 ) ) ( not ( = ?auto_58077 ?auto_58070 ) ) ( not ( = ?auto_58092 ?auto_58070 ) ) ( not ( = ?auto_58078 ?auto_58070 ) ) ( not ( = ?auto_58074 ?auto_58070 ) ) ( AVAILABLE ?auto_58070 ) ( SURFACE-AT ?auto_58081 ?auto_58083 ) ( ON ?auto_58081 ?auto_58085 ) ( CLEAR ?auto_58081 ) ( not ( = ?auto_58068 ?auto_58085 ) ) ( not ( = ?auto_58069 ?auto_58085 ) ) ( not ( = ?auto_58090 ?auto_58085 ) ) ( not ( = ?auto_58094 ?auto_58085 ) ) ( not ( = ?auto_58073 ?auto_58085 ) ) ( not ( = ?auto_58093 ?auto_58085 ) ) ( not ( = ?auto_58080 ?auto_58085 ) ) ( not ( = ?auto_58076 ?auto_58085 ) ) ( not ( = ?auto_58095 ?auto_58085 ) ) ( not ( = ?auto_58087 ?auto_58085 ) ) ( not ( = ?auto_58096 ?auto_58085 ) ) ( not ( = ?auto_58081 ?auto_58085 ) ) ( not ( = ?auto_58097 ?auto_58085 ) ) ( not ( = ?auto_58088 ?auto_58085 ) ) ( TRUCK-AT ?auto_58072 ?auto_58071 ) ( SURFACE-AT ?auto_58098 ?auto_58071 ) ( CLEAR ?auto_58098 ) ( LIFTING ?auto_58079 ?auto_58088 ) ( IS-CRATE ?auto_58088 ) ( not ( = ?auto_58068 ?auto_58098 ) ) ( not ( = ?auto_58069 ?auto_58098 ) ) ( not ( = ?auto_58090 ?auto_58098 ) ) ( not ( = ?auto_58094 ?auto_58098 ) ) ( not ( = ?auto_58073 ?auto_58098 ) ) ( not ( = ?auto_58093 ?auto_58098 ) ) ( not ( = ?auto_58080 ?auto_58098 ) ) ( not ( = ?auto_58076 ?auto_58098 ) ) ( not ( = ?auto_58095 ?auto_58098 ) ) ( not ( = ?auto_58087 ?auto_58098 ) ) ( not ( = ?auto_58096 ?auto_58098 ) ) ( not ( = ?auto_58081 ?auto_58098 ) ) ( not ( = ?auto_58097 ?auto_58098 ) ) ( not ( = ?auto_58088 ?auto_58098 ) ) ( not ( = ?auto_58085 ?auto_58098 ) ) )
    :subtasks
    ( ( !DROP ?auto_58079 ?auto_58088 ?auto_58098 ?auto_58071 )
      ( MAKE-ON ?auto_58068 ?auto_58069 )
      ( MAKE-ON-VERIFY ?auto_58068 ?auto_58069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58099 - SURFACE
      ?auto_58100 - SURFACE
    )
    :vars
    (
      ?auto_58118 - HOIST
      ?auto_58120 - PLACE
      ?auto_58104 - PLACE
      ?auto_58121 - HOIST
      ?auto_58105 - SURFACE
      ?auto_58128 - SURFACE
      ?auto_58111 - PLACE
      ?auto_58123 - HOIST
      ?auto_58110 - SURFACE
      ?auto_58129 - SURFACE
      ?auto_58106 - PLACE
      ?auto_58107 - HOIST
      ?auto_58117 - SURFACE
      ?auto_58112 - SURFACE
      ?auto_58127 - SURFACE
      ?auto_58102 - SURFACE
      ?auto_58124 - PLACE
      ?auto_58114 - HOIST
      ?auto_58126 - SURFACE
      ?auto_58113 - SURFACE
      ?auto_58101 - PLACE
      ?auto_58116 - HOIST
      ?auto_58125 - SURFACE
      ?auto_58103 - SURFACE
      ?auto_58115 - PLACE
      ?auto_58109 - HOIST
      ?auto_58108 - SURFACE
      ?auto_58119 - TRUCK
      ?auto_58122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58118 ?auto_58120 ) ( IS-CRATE ?auto_58099 ) ( not ( = ?auto_58099 ?auto_58100 ) ) ( not ( = ?auto_58104 ?auto_58120 ) ) ( HOIST-AT ?auto_58121 ?auto_58104 ) ( not ( = ?auto_58118 ?auto_58121 ) ) ( SURFACE-AT ?auto_58099 ?auto_58104 ) ( ON ?auto_58099 ?auto_58105 ) ( CLEAR ?auto_58099 ) ( not ( = ?auto_58099 ?auto_58105 ) ) ( not ( = ?auto_58100 ?auto_58105 ) ) ( IS-CRATE ?auto_58100 ) ( not ( = ?auto_58099 ?auto_58128 ) ) ( not ( = ?auto_58100 ?auto_58128 ) ) ( not ( = ?auto_58105 ?auto_58128 ) ) ( not ( = ?auto_58111 ?auto_58120 ) ) ( not ( = ?auto_58104 ?auto_58111 ) ) ( HOIST-AT ?auto_58123 ?auto_58111 ) ( not ( = ?auto_58118 ?auto_58123 ) ) ( not ( = ?auto_58121 ?auto_58123 ) ) ( AVAILABLE ?auto_58123 ) ( SURFACE-AT ?auto_58100 ?auto_58111 ) ( ON ?auto_58100 ?auto_58110 ) ( CLEAR ?auto_58100 ) ( not ( = ?auto_58099 ?auto_58110 ) ) ( not ( = ?auto_58100 ?auto_58110 ) ) ( not ( = ?auto_58105 ?auto_58110 ) ) ( not ( = ?auto_58128 ?auto_58110 ) ) ( IS-CRATE ?auto_58128 ) ( not ( = ?auto_58099 ?auto_58129 ) ) ( not ( = ?auto_58100 ?auto_58129 ) ) ( not ( = ?auto_58105 ?auto_58129 ) ) ( not ( = ?auto_58128 ?auto_58129 ) ) ( not ( = ?auto_58110 ?auto_58129 ) ) ( not ( = ?auto_58106 ?auto_58120 ) ) ( not ( = ?auto_58104 ?auto_58106 ) ) ( not ( = ?auto_58111 ?auto_58106 ) ) ( HOIST-AT ?auto_58107 ?auto_58106 ) ( not ( = ?auto_58118 ?auto_58107 ) ) ( not ( = ?auto_58121 ?auto_58107 ) ) ( not ( = ?auto_58123 ?auto_58107 ) ) ( AVAILABLE ?auto_58107 ) ( SURFACE-AT ?auto_58128 ?auto_58106 ) ( ON ?auto_58128 ?auto_58117 ) ( CLEAR ?auto_58128 ) ( not ( = ?auto_58099 ?auto_58117 ) ) ( not ( = ?auto_58100 ?auto_58117 ) ) ( not ( = ?auto_58105 ?auto_58117 ) ) ( not ( = ?auto_58128 ?auto_58117 ) ) ( not ( = ?auto_58110 ?auto_58117 ) ) ( not ( = ?auto_58129 ?auto_58117 ) ) ( IS-CRATE ?auto_58129 ) ( not ( = ?auto_58099 ?auto_58112 ) ) ( not ( = ?auto_58100 ?auto_58112 ) ) ( not ( = ?auto_58105 ?auto_58112 ) ) ( not ( = ?auto_58128 ?auto_58112 ) ) ( not ( = ?auto_58110 ?auto_58112 ) ) ( not ( = ?auto_58129 ?auto_58112 ) ) ( not ( = ?auto_58117 ?auto_58112 ) ) ( AVAILABLE ?auto_58121 ) ( SURFACE-AT ?auto_58129 ?auto_58104 ) ( ON ?auto_58129 ?auto_58127 ) ( CLEAR ?auto_58129 ) ( not ( = ?auto_58099 ?auto_58127 ) ) ( not ( = ?auto_58100 ?auto_58127 ) ) ( not ( = ?auto_58105 ?auto_58127 ) ) ( not ( = ?auto_58128 ?auto_58127 ) ) ( not ( = ?auto_58110 ?auto_58127 ) ) ( not ( = ?auto_58129 ?auto_58127 ) ) ( not ( = ?auto_58117 ?auto_58127 ) ) ( not ( = ?auto_58112 ?auto_58127 ) ) ( IS-CRATE ?auto_58112 ) ( not ( = ?auto_58099 ?auto_58102 ) ) ( not ( = ?auto_58100 ?auto_58102 ) ) ( not ( = ?auto_58105 ?auto_58102 ) ) ( not ( = ?auto_58128 ?auto_58102 ) ) ( not ( = ?auto_58110 ?auto_58102 ) ) ( not ( = ?auto_58129 ?auto_58102 ) ) ( not ( = ?auto_58117 ?auto_58102 ) ) ( not ( = ?auto_58112 ?auto_58102 ) ) ( not ( = ?auto_58127 ?auto_58102 ) ) ( not ( = ?auto_58124 ?auto_58120 ) ) ( not ( = ?auto_58104 ?auto_58124 ) ) ( not ( = ?auto_58111 ?auto_58124 ) ) ( not ( = ?auto_58106 ?auto_58124 ) ) ( HOIST-AT ?auto_58114 ?auto_58124 ) ( not ( = ?auto_58118 ?auto_58114 ) ) ( not ( = ?auto_58121 ?auto_58114 ) ) ( not ( = ?auto_58123 ?auto_58114 ) ) ( not ( = ?auto_58107 ?auto_58114 ) ) ( AVAILABLE ?auto_58114 ) ( SURFACE-AT ?auto_58112 ?auto_58124 ) ( ON ?auto_58112 ?auto_58126 ) ( CLEAR ?auto_58112 ) ( not ( = ?auto_58099 ?auto_58126 ) ) ( not ( = ?auto_58100 ?auto_58126 ) ) ( not ( = ?auto_58105 ?auto_58126 ) ) ( not ( = ?auto_58128 ?auto_58126 ) ) ( not ( = ?auto_58110 ?auto_58126 ) ) ( not ( = ?auto_58129 ?auto_58126 ) ) ( not ( = ?auto_58117 ?auto_58126 ) ) ( not ( = ?auto_58112 ?auto_58126 ) ) ( not ( = ?auto_58127 ?auto_58126 ) ) ( not ( = ?auto_58102 ?auto_58126 ) ) ( IS-CRATE ?auto_58102 ) ( not ( = ?auto_58099 ?auto_58113 ) ) ( not ( = ?auto_58100 ?auto_58113 ) ) ( not ( = ?auto_58105 ?auto_58113 ) ) ( not ( = ?auto_58128 ?auto_58113 ) ) ( not ( = ?auto_58110 ?auto_58113 ) ) ( not ( = ?auto_58129 ?auto_58113 ) ) ( not ( = ?auto_58117 ?auto_58113 ) ) ( not ( = ?auto_58112 ?auto_58113 ) ) ( not ( = ?auto_58127 ?auto_58113 ) ) ( not ( = ?auto_58102 ?auto_58113 ) ) ( not ( = ?auto_58126 ?auto_58113 ) ) ( not ( = ?auto_58101 ?auto_58120 ) ) ( not ( = ?auto_58104 ?auto_58101 ) ) ( not ( = ?auto_58111 ?auto_58101 ) ) ( not ( = ?auto_58106 ?auto_58101 ) ) ( not ( = ?auto_58124 ?auto_58101 ) ) ( HOIST-AT ?auto_58116 ?auto_58101 ) ( not ( = ?auto_58118 ?auto_58116 ) ) ( not ( = ?auto_58121 ?auto_58116 ) ) ( not ( = ?auto_58123 ?auto_58116 ) ) ( not ( = ?auto_58107 ?auto_58116 ) ) ( not ( = ?auto_58114 ?auto_58116 ) ) ( AVAILABLE ?auto_58116 ) ( SURFACE-AT ?auto_58102 ?auto_58101 ) ( ON ?auto_58102 ?auto_58125 ) ( CLEAR ?auto_58102 ) ( not ( = ?auto_58099 ?auto_58125 ) ) ( not ( = ?auto_58100 ?auto_58125 ) ) ( not ( = ?auto_58105 ?auto_58125 ) ) ( not ( = ?auto_58128 ?auto_58125 ) ) ( not ( = ?auto_58110 ?auto_58125 ) ) ( not ( = ?auto_58129 ?auto_58125 ) ) ( not ( = ?auto_58117 ?auto_58125 ) ) ( not ( = ?auto_58112 ?auto_58125 ) ) ( not ( = ?auto_58127 ?auto_58125 ) ) ( not ( = ?auto_58102 ?auto_58125 ) ) ( not ( = ?auto_58126 ?auto_58125 ) ) ( not ( = ?auto_58113 ?auto_58125 ) ) ( IS-CRATE ?auto_58113 ) ( not ( = ?auto_58099 ?auto_58103 ) ) ( not ( = ?auto_58100 ?auto_58103 ) ) ( not ( = ?auto_58105 ?auto_58103 ) ) ( not ( = ?auto_58128 ?auto_58103 ) ) ( not ( = ?auto_58110 ?auto_58103 ) ) ( not ( = ?auto_58129 ?auto_58103 ) ) ( not ( = ?auto_58117 ?auto_58103 ) ) ( not ( = ?auto_58112 ?auto_58103 ) ) ( not ( = ?auto_58127 ?auto_58103 ) ) ( not ( = ?auto_58102 ?auto_58103 ) ) ( not ( = ?auto_58126 ?auto_58103 ) ) ( not ( = ?auto_58113 ?auto_58103 ) ) ( not ( = ?auto_58125 ?auto_58103 ) ) ( not ( = ?auto_58115 ?auto_58120 ) ) ( not ( = ?auto_58104 ?auto_58115 ) ) ( not ( = ?auto_58111 ?auto_58115 ) ) ( not ( = ?auto_58106 ?auto_58115 ) ) ( not ( = ?auto_58124 ?auto_58115 ) ) ( not ( = ?auto_58101 ?auto_58115 ) ) ( HOIST-AT ?auto_58109 ?auto_58115 ) ( not ( = ?auto_58118 ?auto_58109 ) ) ( not ( = ?auto_58121 ?auto_58109 ) ) ( not ( = ?auto_58123 ?auto_58109 ) ) ( not ( = ?auto_58107 ?auto_58109 ) ) ( not ( = ?auto_58114 ?auto_58109 ) ) ( not ( = ?auto_58116 ?auto_58109 ) ) ( AVAILABLE ?auto_58109 ) ( SURFACE-AT ?auto_58113 ?auto_58115 ) ( ON ?auto_58113 ?auto_58108 ) ( CLEAR ?auto_58113 ) ( not ( = ?auto_58099 ?auto_58108 ) ) ( not ( = ?auto_58100 ?auto_58108 ) ) ( not ( = ?auto_58105 ?auto_58108 ) ) ( not ( = ?auto_58128 ?auto_58108 ) ) ( not ( = ?auto_58110 ?auto_58108 ) ) ( not ( = ?auto_58129 ?auto_58108 ) ) ( not ( = ?auto_58117 ?auto_58108 ) ) ( not ( = ?auto_58112 ?auto_58108 ) ) ( not ( = ?auto_58127 ?auto_58108 ) ) ( not ( = ?auto_58102 ?auto_58108 ) ) ( not ( = ?auto_58126 ?auto_58108 ) ) ( not ( = ?auto_58113 ?auto_58108 ) ) ( not ( = ?auto_58125 ?auto_58108 ) ) ( not ( = ?auto_58103 ?auto_58108 ) ) ( TRUCK-AT ?auto_58119 ?auto_58120 ) ( SURFACE-AT ?auto_58122 ?auto_58120 ) ( CLEAR ?auto_58122 ) ( IS-CRATE ?auto_58103 ) ( not ( = ?auto_58099 ?auto_58122 ) ) ( not ( = ?auto_58100 ?auto_58122 ) ) ( not ( = ?auto_58105 ?auto_58122 ) ) ( not ( = ?auto_58128 ?auto_58122 ) ) ( not ( = ?auto_58110 ?auto_58122 ) ) ( not ( = ?auto_58129 ?auto_58122 ) ) ( not ( = ?auto_58117 ?auto_58122 ) ) ( not ( = ?auto_58112 ?auto_58122 ) ) ( not ( = ?auto_58127 ?auto_58122 ) ) ( not ( = ?auto_58102 ?auto_58122 ) ) ( not ( = ?auto_58126 ?auto_58122 ) ) ( not ( = ?auto_58113 ?auto_58122 ) ) ( not ( = ?auto_58125 ?auto_58122 ) ) ( not ( = ?auto_58103 ?auto_58122 ) ) ( not ( = ?auto_58108 ?auto_58122 ) ) ( AVAILABLE ?auto_58118 ) ( IN ?auto_58103 ?auto_58119 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58118 ?auto_58103 ?auto_58119 ?auto_58120 )
      ( MAKE-ON ?auto_58099 ?auto_58100 )
      ( MAKE-ON-VERIFY ?auto_58099 ?auto_58100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58130 - SURFACE
      ?auto_58131 - SURFACE
    )
    :vars
    (
      ?auto_58147 - HOIST
      ?auto_58149 - PLACE
      ?auto_58157 - PLACE
      ?auto_58150 - HOIST
      ?auto_58156 - SURFACE
      ?auto_58143 - SURFACE
      ?auto_58158 - PLACE
      ?auto_58152 - HOIST
      ?auto_58134 - SURFACE
      ?auto_58144 - SURFACE
      ?auto_58159 - PLACE
      ?auto_58138 - HOIST
      ?auto_58146 - SURFACE
      ?auto_58133 - SURFACE
      ?auto_58142 - SURFACE
      ?auto_58160 - SURFACE
      ?auto_58145 - PLACE
      ?auto_58154 - HOIST
      ?auto_58141 - SURFACE
      ?auto_58137 - SURFACE
      ?auto_58132 - PLACE
      ?auto_58153 - HOIST
      ?auto_58140 - SURFACE
      ?auto_58135 - SURFACE
      ?auto_58155 - PLACE
      ?auto_58139 - HOIST
      ?auto_58136 - SURFACE
      ?auto_58151 - SURFACE
      ?auto_58148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58147 ?auto_58149 ) ( IS-CRATE ?auto_58130 ) ( not ( = ?auto_58130 ?auto_58131 ) ) ( not ( = ?auto_58157 ?auto_58149 ) ) ( HOIST-AT ?auto_58150 ?auto_58157 ) ( not ( = ?auto_58147 ?auto_58150 ) ) ( SURFACE-AT ?auto_58130 ?auto_58157 ) ( ON ?auto_58130 ?auto_58156 ) ( CLEAR ?auto_58130 ) ( not ( = ?auto_58130 ?auto_58156 ) ) ( not ( = ?auto_58131 ?auto_58156 ) ) ( IS-CRATE ?auto_58131 ) ( not ( = ?auto_58130 ?auto_58143 ) ) ( not ( = ?auto_58131 ?auto_58143 ) ) ( not ( = ?auto_58156 ?auto_58143 ) ) ( not ( = ?auto_58158 ?auto_58149 ) ) ( not ( = ?auto_58157 ?auto_58158 ) ) ( HOIST-AT ?auto_58152 ?auto_58158 ) ( not ( = ?auto_58147 ?auto_58152 ) ) ( not ( = ?auto_58150 ?auto_58152 ) ) ( AVAILABLE ?auto_58152 ) ( SURFACE-AT ?auto_58131 ?auto_58158 ) ( ON ?auto_58131 ?auto_58134 ) ( CLEAR ?auto_58131 ) ( not ( = ?auto_58130 ?auto_58134 ) ) ( not ( = ?auto_58131 ?auto_58134 ) ) ( not ( = ?auto_58156 ?auto_58134 ) ) ( not ( = ?auto_58143 ?auto_58134 ) ) ( IS-CRATE ?auto_58143 ) ( not ( = ?auto_58130 ?auto_58144 ) ) ( not ( = ?auto_58131 ?auto_58144 ) ) ( not ( = ?auto_58156 ?auto_58144 ) ) ( not ( = ?auto_58143 ?auto_58144 ) ) ( not ( = ?auto_58134 ?auto_58144 ) ) ( not ( = ?auto_58159 ?auto_58149 ) ) ( not ( = ?auto_58157 ?auto_58159 ) ) ( not ( = ?auto_58158 ?auto_58159 ) ) ( HOIST-AT ?auto_58138 ?auto_58159 ) ( not ( = ?auto_58147 ?auto_58138 ) ) ( not ( = ?auto_58150 ?auto_58138 ) ) ( not ( = ?auto_58152 ?auto_58138 ) ) ( AVAILABLE ?auto_58138 ) ( SURFACE-AT ?auto_58143 ?auto_58159 ) ( ON ?auto_58143 ?auto_58146 ) ( CLEAR ?auto_58143 ) ( not ( = ?auto_58130 ?auto_58146 ) ) ( not ( = ?auto_58131 ?auto_58146 ) ) ( not ( = ?auto_58156 ?auto_58146 ) ) ( not ( = ?auto_58143 ?auto_58146 ) ) ( not ( = ?auto_58134 ?auto_58146 ) ) ( not ( = ?auto_58144 ?auto_58146 ) ) ( IS-CRATE ?auto_58144 ) ( not ( = ?auto_58130 ?auto_58133 ) ) ( not ( = ?auto_58131 ?auto_58133 ) ) ( not ( = ?auto_58156 ?auto_58133 ) ) ( not ( = ?auto_58143 ?auto_58133 ) ) ( not ( = ?auto_58134 ?auto_58133 ) ) ( not ( = ?auto_58144 ?auto_58133 ) ) ( not ( = ?auto_58146 ?auto_58133 ) ) ( AVAILABLE ?auto_58150 ) ( SURFACE-AT ?auto_58144 ?auto_58157 ) ( ON ?auto_58144 ?auto_58142 ) ( CLEAR ?auto_58144 ) ( not ( = ?auto_58130 ?auto_58142 ) ) ( not ( = ?auto_58131 ?auto_58142 ) ) ( not ( = ?auto_58156 ?auto_58142 ) ) ( not ( = ?auto_58143 ?auto_58142 ) ) ( not ( = ?auto_58134 ?auto_58142 ) ) ( not ( = ?auto_58144 ?auto_58142 ) ) ( not ( = ?auto_58146 ?auto_58142 ) ) ( not ( = ?auto_58133 ?auto_58142 ) ) ( IS-CRATE ?auto_58133 ) ( not ( = ?auto_58130 ?auto_58160 ) ) ( not ( = ?auto_58131 ?auto_58160 ) ) ( not ( = ?auto_58156 ?auto_58160 ) ) ( not ( = ?auto_58143 ?auto_58160 ) ) ( not ( = ?auto_58134 ?auto_58160 ) ) ( not ( = ?auto_58144 ?auto_58160 ) ) ( not ( = ?auto_58146 ?auto_58160 ) ) ( not ( = ?auto_58133 ?auto_58160 ) ) ( not ( = ?auto_58142 ?auto_58160 ) ) ( not ( = ?auto_58145 ?auto_58149 ) ) ( not ( = ?auto_58157 ?auto_58145 ) ) ( not ( = ?auto_58158 ?auto_58145 ) ) ( not ( = ?auto_58159 ?auto_58145 ) ) ( HOIST-AT ?auto_58154 ?auto_58145 ) ( not ( = ?auto_58147 ?auto_58154 ) ) ( not ( = ?auto_58150 ?auto_58154 ) ) ( not ( = ?auto_58152 ?auto_58154 ) ) ( not ( = ?auto_58138 ?auto_58154 ) ) ( AVAILABLE ?auto_58154 ) ( SURFACE-AT ?auto_58133 ?auto_58145 ) ( ON ?auto_58133 ?auto_58141 ) ( CLEAR ?auto_58133 ) ( not ( = ?auto_58130 ?auto_58141 ) ) ( not ( = ?auto_58131 ?auto_58141 ) ) ( not ( = ?auto_58156 ?auto_58141 ) ) ( not ( = ?auto_58143 ?auto_58141 ) ) ( not ( = ?auto_58134 ?auto_58141 ) ) ( not ( = ?auto_58144 ?auto_58141 ) ) ( not ( = ?auto_58146 ?auto_58141 ) ) ( not ( = ?auto_58133 ?auto_58141 ) ) ( not ( = ?auto_58142 ?auto_58141 ) ) ( not ( = ?auto_58160 ?auto_58141 ) ) ( IS-CRATE ?auto_58160 ) ( not ( = ?auto_58130 ?auto_58137 ) ) ( not ( = ?auto_58131 ?auto_58137 ) ) ( not ( = ?auto_58156 ?auto_58137 ) ) ( not ( = ?auto_58143 ?auto_58137 ) ) ( not ( = ?auto_58134 ?auto_58137 ) ) ( not ( = ?auto_58144 ?auto_58137 ) ) ( not ( = ?auto_58146 ?auto_58137 ) ) ( not ( = ?auto_58133 ?auto_58137 ) ) ( not ( = ?auto_58142 ?auto_58137 ) ) ( not ( = ?auto_58160 ?auto_58137 ) ) ( not ( = ?auto_58141 ?auto_58137 ) ) ( not ( = ?auto_58132 ?auto_58149 ) ) ( not ( = ?auto_58157 ?auto_58132 ) ) ( not ( = ?auto_58158 ?auto_58132 ) ) ( not ( = ?auto_58159 ?auto_58132 ) ) ( not ( = ?auto_58145 ?auto_58132 ) ) ( HOIST-AT ?auto_58153 ?auto_58132 ) ( not ( = ?auto_58147 ?auto_58153 ) ) ( not ( = ?auto_58150 ?auto_58153 ) ) ( not ( = ?auto_58152 ?auto_58153 ) ) ( not ( = ?auto_58138 ?auto_58153 ) ) ( not ( = ?auto_58154 ?auto_58153 ) ) ( AVAILABLE ?auto_58153 ) ( SURFACE-AT ?auto_58160 ?auto_58132 ) ( ON ?auto_58160 ?auto_58140 ) ( CLEAR ?auto_58160 ) ( not ( = ?auto_58130 ?auto_58140 ) ) ( not ( = ?auto_58131 ?auto_58140 ) ) ( not ( = ?auto_58156 ?auto_58140 ) ) ( not ( = ?auto_58143 ?auto_58140 ) ) ( not ( = ?auto_58134 ?auto_58140 ) ) ( not ( = ?auto_58144 ?auto_58140 ) ) ( not ( = ?auto_58146 ?auto_58140 ) ) ( not ( = ?auto_58133 ?auto_58140 ) ) ( not ( = ?auto_58142 ?auto_58140 ) ) ( not ( = ?auto_58160 ?auto_58140 ) ) ( not ( = ?auto_58141 ?auto_58140 ) ) ( not ( = ?auto_58137 ?auto_58140 ) ) ( IS-CRATE ?auto_58137 ) ( not ( = ?auto_58130 ?auto_58135 ) ) ( not ( = ?auto_58131 ?auto_58135 ) ) ( not ( = ?auto_58156 ?auto_58135 ) ) ( not ( = ?auto_58143 ?auto_58135 ) ) ( not ( = ?auto_58134 ?auto_58135 ) ) ( not ( = ?auto_58144 ?auto_58135 ) ) ( not ( = ?auto_58146 ?auto_58135 ) ) ( not ( = ?auto_58133 ?auto_58135 ) ) ( not ( = ?auto_58142 ?auto_58135 ) ) ( not ( = ?auto_58160 ?auto_58135 ) ) ( not ( = ?auto_58141 ?auto_58135 ) ) ( not ( = ?auto_58137 ?auto_58135 ) ) ( not ( = ?auto_58140 ?auto_58135 ) ) ( not ( = ?auto_58155 ?auto_58149 ) ) ( not ( = ?auto_58157 ?auto_58155 ) ) ( not ( = ?auto_58158 ?auto_58155 ) ) ( not ( = ?auto_58159 ?auto_58155 ) ) ( not ( = ?auto_58145 ?auto_58155 ) ) ( not ( = ?auto_58132 ?auto_58155 ) ) ( HOIST-AT ?auto_58139 ?auto_58155 ) ( not ( = ?auto_58147 ?auto_58139 ) ) ( not ( = ?auto_58150 ?auto_58139 ) ) ( not ( = ?auto_58152 ?auto_58139 ) ) ( not ( = ?auto_58138 ?auto_58139 ) ) ( not ( = ?auto_58154 ?auto_58139 ) ) ( not ( = ?auto_58153 ?auto_58139 ) ) ( AVAILABLE ?auto_58139 ) ( SURFACE-AT ?auto_58137 ?auto_58155 ) ( ON ?auto_58137 ?auto_58136 ) ( CLEAR ?auto_58137 ) ( not ( = ?auto_58130 ?auto_58136 ) ) ( not ( = ?auto_58131 ?auto_58136 ) ) ( not ( = ?auto_58156 ?auto_58136 ) ) ( not ( = ?auto_58143 ?auto_58136 ) ) ( not ( = ?auto_58134 ?auto_58136 ) ) ( not ( = ?auto_58144 ?auto_58136 ) ) ( not ( = ?auto_58146 ?auto_58136 ) ) ( not ( = ?auto_58133 ?auto_58136 ) ) ( not ( = ?auto_58142 ?auto_58136 ) ) ( not ( = ?auto_58160 ?auto_58136 ) ) ( not ( = ?auto_58141 ?auto_58136 ) ) ( not ( = ?auto_58137 ?auto_58136 ) ) ( not ( = ?auto_58140 ?auto_58136 ) ) ( not ( = ?auto_58135 ?auto_58136 ) ) ( SURFACE-AT ?auto_58151 ?auto_58149 ) ( CLEAR ?auto_58151 ) ( IS-CRATE ?auto_58135 ) ( not ( = ?auto_58130 ?auto_58151 ) ) ( not ( = ?auto_58131 ?auto_58151 ) ) ( not ( = ?auto_58156 ?auto_58151 ) ) ( not ( = ?auto_58143 ?auto_58151 ) ) ( not ( = ?auto_58134 ?auto_58151 ) ) ( not ( = ?auto_58144 ?auto_58151 ) ) ( not ( = ?auto_58146 ?auto_58151 ) ) ( not ( = ?auto_58133 ?auto_58151 ) ) ( not ( = ?auto_58142 ?auto_58151 ) ) ( not ( = ?auto_58160 ?auto_58151 ) ) ( not ( = ?auto_58141 ?auto_58151 ) ) ( not ( = ?auto_58137 ?auto_58151 ) ) ( not ( = ?auto_58140 ?auto_58151 ) ) ( not ( = ?auto_58135 ?auto_58151 ) ) ( not ( = ?auto_58136 ?auto_58151 ) ) ( AVAILABLE ?auto_58147 ) ( IN ?auto_58135 ?auto_58148 ) ( TRUCK-AT ?auto_58148 ?auto_58155 ) )
    :subtasks
    ( ( !DRIVE ?auto_58148 ?auto_58155 ?auto_58149 )
      ( MAKE-ON ?auto_58130 ?auto_58131 )
      ( MAKE-ON-VERIFY ?auto_58130 ?auto_58131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58161 - SURFACE
      ?auto_58162 - SURFACE
    )
    :vars
    (
      ?auto_58179 - HOIST
      ?auto_58173 - PLACE
      ?auto_58168 - PLACE
      ?auto_58174 - HOIST
      ?auto_58166 - SURFACE
      ?auto_58187 - SURFACE
      ?auto_58167 - PLACE
      ?auto_58176 - HOIST
      ?auto_58183 - SURFACE
      ?auto_58163 - SURFACE
      ?auto_58169 - PLACE
      ?auto_58180 - HOIST
      ?auto_58164 - SURFACE
      ?auto_58184 - SURFACE
      ?auto_58165 - SURFACE
      ?auto_58170 - SURFACE
      ?auto_58189 - PLACE
      ?auto_58178 - HOIST
      ?auto_58188 - SURFACE
      ?auto_58181 - SURFACE
      ?auto_58191 - PLACE
      ?auto_58177 - HOIST
      ?auto_58190 - SURFACE
      ?auto_58185 - SURFACE
      ?auto_58171 - PLACE
      ?auto_58182 - HOIST
      ?auto_58186 - SURFACE
      ?auto_58175 - SURFACE
      ?auto_58172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58179 ?auto_58173 ) ( IS-CRATE ?auto_58161 ) ( not ( = ?auto_58161 ?auto_58162 ) ) ( not ( = ?auto_58168 ?auto_58173 ) ) ( HOIST-AT ?auto_58174 ?auto_58168 ) ( not ( = ?auto_58179 ?auto_58174 ) ) ( SURFACE-AT ?auto_58161 ?auto_58168 ) ( ON ?auto_58161 ?auto_58166 ) ( CLEAR ?auto_58161 ) ( not ( = ?auto_58161 ?auto_58166 ) ) ( not ( = ?auto_58162 ?auto_58166 ) ) ( IS-CRATE ?auto_58162 ) ( not ( = ?auto_58161 ?auto_58187 ) ) ( not ( = ?auto_58162 ?auto_58187 ) ) ( not ( = ?auto_58166 ?auto_58187 ) ) ( not ( = ?auto_58167 ?auto_58173 ) ) ( not ( = ?auto_58168 ?auto_58167 ) ) ( HOIST-AT ?auto_58176 ?auto_58167 ) ( not ( = ?auto_58179 ?auto_58176 ) ) ( not ( = ?auto_58174 ?auto_58176 ) ) ( AVAILABLE ?auto_58176 ) ( SURFACE-AT ?auto_58162 ?auto_58167 ) ( ON ?auto_58162 ?auto_58183 ) ( CLEAR ?auto_58162 ) ( not ( = ?auto_58161 ?auto_58183 ) ) ( not ( = ?auto_58162 ?auto_58183 ) ) ( not ( = ?auto_58166 ?auto_58183 ) ) ( not ( = ?auto_58187 ?auto_58183 ) ) ( IS-CRATE ?auto_58187 ) ( not ( = ?auto_58161 ?auto_58163 ) ) ( not ( = ?auto_58162 ?auto_58163 ) ) ( not ( = ?auto_58166 ?auto_58163 ) ) ( not ( = ?auto_58187 ?auto_58163 ) ) ( not ( = ?auto_58183 ?auto_58163 ) ) ( not ( = ?auto_58169 ?auto_58173 ) ) ( not ( = ?auto_58168 ?auto_58169 ) ) ( not ( = ?auto_58167 ?auto_58169 ) ) ( HOIST-AT ?auto_58180 ?auto_58169 ) ( not ( = ?auto_58179 ?auto_58180 ) ) ( not ( = ?auto_58174 ?auto_58180 ) ) ( not ( = ?auto_58176 ?auto_58180 ) ) ( AVAILABLE ?auto_58180 ) ( SURFACE-AT ?auto_58187 ?auto_58169 ) ( ON ?auto_58187 ?auto_58164 ) ( CLEAR ?auto_58187 ) ( not ( = ?auto_58161 ?auto_58164 ) ) ( not ( = ?auto_58162 ?auto_58164 ) ) ( not ( = ?auto_58166 ?auto_58164 ) ) ( not ( = ?auto_58187 ?auto_58164 ) ) ( not ( = ?auto_58183 ?auto_58164 ) ) ( not ( = ?auto_58163 ?auto_58164 ) ) ( IS-CRATE ?auto_58163 ) ( not ( = ?auto_58161 ?auto_58184 ) ) ( not ( = ?auto_58162 ?auto_58184 ) ) ( not ( = ?auto_58166 ?auto_58184 ) ) ( not ( = ?auto_58187 ?auto_58184 ) ) ( not ( = ?auto_58183 ?auto_58184 ) ) ( not ( = ?auto_58163 ?auto_58184 ) ) ( not ( = ?auto_58164 ?auto_58184 ) ) ( AVAILABLE ?auto_58174 ) ( SURFACE-AT ?auto_58163 ?auto_58168 ) ( ON ?auto_58163 ?auto_58165 ) ( CLEAR ?auto_58163 ) ( not ( = ?auto_58161 ?auto_58165 ) ) ( not ( = ?auto_58162 ?auto_58165 ) ) ( not ( = ?auto_58166 ?auto_58165 ) ) ( not ( = ?auto_58187 ?auto_58165 ) ) ( not ( = ?auto_58183 ?auto_58165 ) ) ( not ( = ?auto_58163 ?auto_58165 ) ) ( not ( = ?auto_58164 ?auto_58165 ) ) ( not ( = ?auto_58184 ?auto_58165 ) ) ( IS-CRATE ?auto_58184 ) ( not ( = ?auto_58161 ?auto_58170 ) ) ( not ( = ?auto_58162 ?auto_58170 ) ) ( not ( = ?auto_58166 ?auto_58170 ) ) ( not ( = ?auto_58187 ?auto_58170 ) ) ( not ( = ?auto_58183 ?auto_58170 ) ) ( not ( = ?auto_58163 ?auto_58170 ) ) ( not ( = ?auto_58164 ?auto_58170 ) ) ( not ( = ?auto_58184 ?auto_58170 ) ) ( not ( = ?auto_58165 ?auto_58170 ) ) ( not ( = ?auto_58189 ?auto_58173 ) ) ( not ( = ?auto_58168 ?auto_58189 ) ) ( not ( = ?auto_58167 ?auto_58189 ) ) ( not ( = ?auto_58169 ?auto_58189 ) ) ( HOIST-AT ?auto_58178 ?auto_58189 ) ( not ( = ?auto_58179 ?auto_58178 ) ) ( not ( = ?auto_58174 ?auto_58178 ) ) ( not ( = ?auto_58176 ?auto_58178 ) ) ( not ( = ?auto_58180 ?auto_58178 ) ) ( AVAILABLE ?auto_58178 ) ( SURFACE-AT ?auto_58184 ?auto_58189 ) ( ON ?auto_58184 ?auto_58188 ) ( CLEAR ?auto_58184 ) ( not ( = ?auto_58161 ?auto_58188 ) ) ( not ( = ?auto_58162 ?auto_58188 ) ) ( not ( = ?auto_58166 ?auto_58188 ) ) ( not ( = ?auto_58187 ?auto_58188 ) ) ( not ( = ?auto_58183 ?auto_58188 ) ) ( not ( = ?auto_58163 ?auto_58188 ) ) ( not ( = ?auto_58164 ?auto_58188 ) ) ( not ( = ?auto_58184 ?auto_58188 ) ) ( not ( = ?auto_58165 ?auto_58188 ) ) ( not ( = ?auto_58170 ?auto_58188 ) ) ( IS-CRATE ?auto_58170 ) ( not ( = ?auto_58161 ?auto_58181 ) ) ( not ( = ?auto_58162 ?auto_58181 ) ) ( not ( = ?auto_58166 ?auto_58181 ) ) ( not ( = ?auto_58187 ?auto_58181 ) ) ( not ( = ?auto_58183 ?auto_58181 ) ) ( not ( = ?auto_58163 ?auto_58181 ) ) ( not ( = ?auto_58164 ?auto_58181 ) ) ( not ( = ?auto_58184 ?auto_58181 ) ) ( not ( = ?auto_58165 ?auto_58181 ) ) ( not ( = ?auto_58170 ?auto_58181 ) ) ( not ( = ?auto_58188 ?auto_58181 ) ) ( not ( = ?auto_58191 ?auto_58173 ) ) ( not ( = ?auto_58168 ?auto_58191 ) ) ( not ( = ?auto_58167 ?auto_58191 ) ) ( not ( = ?auto_58169 ?auto_58191 ) ) ( not ( = ?auto_58189 ?auto_58191 ) ) ( HOIST-AT ?auto_58177 ?auto_58191 ) ( not ( = ?auto_58179 ?auto_58177 ) ) ( not ( = ?auto_58174 ?auto_58177 ) ) ( not ( = ?auto_58176 ?auto_58177 ) ) ( not ( = ?auto_58180 ?auto_58177 ) ) ( not ( = ?auto_58178 ?auto_58177 ) ) ( AVAILABLE ?auto_58177 ) ( SURFACE-AT ?auto_58170 ?auto_58191 ) ( ON ?auto_58170 ?auto_58190 ) ( CLEAR ?auto_58170 ) ( not ( = ?auto_58161 ?auto_58190 ) ) ( not ( = ?auto_58162 ?auto_58190 ) ) ( not ( = ?auto_58166 ?auto_58190 ) ) ( not ( = ?auto_58187 ?auto_58190 ) ) ( not ( = ?auto_58183 ?auto_58190 ) ) ( not ( = ?auto_58163 ?auto_58190 ) ) ( not ( = ?auto_58164 ?auto_58190 ) ) ( not ( = ?auto_58184 ?auto_58190 ) ) ( not ( = ?auto_58165 ?auto_58190 ) ) ( not ( = ?auto_58170 ?auto_58190 ) ) ( not ( = ?auto_58188 ?auto_58190 ) ) ( not ( = ?auto_58181 ?auto_58190 ) ) ( IS-CRATE ?auto_58181 ) ( not ( = ?auto_58161 ?auto_58185 ) ) ( not ( = ?auto_58162 ?auto_58185 ) ) ( not ( = ?auto_58166 ?auto_58185 ) ) ( not ( = ?auto_58187 ?auto_58185 ) ) ( not ( = ?auto_58183 ?auto_58185 ) ) ( not ( = ?auto_58163 ?auto_58185 ) ) ( not ( = ?auto_58164 ?auto_58185 ) ) ( not ( = ?auto_58184 ?auto_58185 ) ) ( not ( = ?auto_58165 ?auto_58185 ) ) ( not ( = ?auto_58170 ?auto_58185 ) ) ( not ( = ?auto_58188 ?auto_58185 ) ) ( not ( = ?auto_58181 ?auto_58185 ) ) ( not ( = ?auto_58190 ?auto_58185 ) ) ( not ( = ?auto_58171 ?auto_58173 ) ) ( not ( = ?auto_58168 ?auto_58171 ) ) ( not ( = ?auto_58167 ?auto_58171 ) ) ( not ( = ?auto_58169 ?auto_58171 ) ) ( not ( = ?auto_58189 ?auto_58171 ) ) ( not ( = ?auto_58191 ?auto_58171 ) ) ( HOIST-AT ?auto_58182 ?auto_58171 ) ( not ( = ?auto_58179 ?auto_58182 ) ) ( not ( = ?auto_58174 ?auto_58182 ) ) ( not ( = ?auto_58176 ?auto_58182 ) ) ( not ( = ?auto_58180 ?auto_58182 ) ) ( not ( = ?auto_58178 ?auto_58182 ) ) ( not ( = ?auto_58177 ?auto_58182 ) ) ( SURFACE-AT ?auto_58181 ?auto_58171 ) ( ON ?auto_58181 ?auto_58186 ) ( CLEAR ?auto_58181 ) ( not ( = ?auto_58161 ?auto_58186 ) ) ( not ( = ?auto_58162 ?auto_58186 ) ) ( not ( = ?auto_58166 ?auto_58186 ) ) ( not ( = ?auto_58187 ?auto_58186 ) ) ( not ( = ?auto_58183 ?auto_58186 ) ) ( not ( = ?auto_58163 ?auto_58186 ) ) ( not ( = ?auto_58164 ?auto_58186 ) ) ( not ( = ?auto_58184 ?auto_58186 ) ) ( not ( = ?auto_58165 ?auto_58186 ) ) ( not ( = ?auto_58170 ?auto_58186 ) ) ( not ( = ?auto_58188 ?auto_58186 ) ) ( not ( = ?auto_58181 ?auto_58186 ) ) ( not ( = ?auto_58190 ?auto_58186 ) ) ( not ( = ?auto_58185 ?auto_58186 ) ) ( SURFACE-AT ?auto_58175 ?auto_58173 ) ( CLEAR ?auto_58175 ) ( IS-CRATE ?auto_58185 ) ( not ( = ?auto_58161 ?auto_58175 ) ) ( not ( = ?auto_58162 ?auto_58175 ) ) ( not ( = ?auto_58166 ?auto_58175 ) ) ( not ( = ?auto_58187 ?auto_58175 ) ) ( not ( = ?auto_58183 ?auto_58175 ) ) ( not ( = ?auto_58163 ?auto_58175 ) ) ( not ( = ?auto_58164 ?auto_58175 ) ) ( not ( = ?auto_58184 ?auto_58175 ) ) ( not ( = ?auto_58165 ?auto_58175 ) ) ( not ( = ?auto_58170 ?auto_58175 ) ) ( not ( = ?auto_58188 ?auto_58175 ) ) ( not ( = ?auto_58181 ?auto_58175 ) ) ( not ( = ?auto_58190 ?auto_58175 ) ) ( not ( = ?auto_58185 ?auto_58175 ) ) ( not ( = ?auto_58186 ?auto_58175 ) ) ( AVAILABLE ?auto_58179 ) ( TRUCK-AT ?auto_58172 ?auto_58171 ) ( LIFTING ?auto_58182 ?auto_58185 ) )
    :subtasks
    ( ( !LOAD ?auto_58182 ?auto_58185 ?auto_58172 ?auto_58171 )
      ( MAKE-ON ?auto_58161 ?auto_58162 )
      ( MAKE-ON-VERIFY ?auto_58161 ?auto_58162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58192 - SURFACE
      ?auto_58193 - SURFACE
    )
    :vars
    (
      ?auto_58204 - HOIST
      ?auto_58214 - PLACE
      ?auto_58198 - PLACE
      ?auto_58215 - HOIST
      ?auto_58222 - SURFACE
      ?auto_58195 - SURFACE
      ?auto_58221 - PLACE
      ?auto_58217 - HOIST
      ?auto_58208 - SURFACE
      ?auto_58219 - SURFACE
      ?auto_58196 - PLACE
      ?auto_58205 - HOIST
      ?auto_58197 - SURFACE
      ?auto_58209 - SURFACE
      ?auto_58194 - SURFACE
      ?auto_58218 - SURFACE
      ?auto_58200 - PLACE
      ?auto_58211 - HOIST
      ?auto_58199 - SURFACE
      ?auto_58206 - SURFACE
      ?auto_58202 - PLACE
      ?auto_58220 - HOIST
      ?auto_58201 - SURFACE
      ?auto_58210 - SURFACE
      ?auto_58212 - PLACE
      ?auto_58207 - HOIST
      ?auto_58203 - SURFACE
      ?auto_58216 - SURFACE
      ?auto_58213 - TRUCK
      ?auto_58223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58204 ?auto_58214 ) ( IS-CRATE ?auto_58192 ) ( not ( = ?auto_58192 ?auto_58193 ) ) ( not ( = ?auto_58198 ?auto_58214 ) ) ( HOIST-AT ?auto_58215 ?auto_58198 ) ( not ( = ?auto_58204 ?auto_58215 ) ) ( SURFACE-AT ?auto_58192 ?auto_58198 ) ( ON ?auto_58192 ?auto_58222 ) ( CLEAR ?auto_58192 ) ( not ( = ?auto_58192 ?auto_58222 ) ) ( not ( = ?auto_58193 ?auto_58222 ) ) ( IS-CRATE ?auto_58193 ) ( not ( = ?auto_58192 ?auto_58195 ) ) ( not ( = ?auto_58193 ?auto_58195 ) ) ( not ( = ?auto_58222 ?auto_58195 ) ) ( not ( = ?auto_58221 ?auto_58214 ) ) ( not ( = ?auto_58198 ?auto_58221 ) ) ( HOIST-AT ?auto_58217 ?auto_58221 ) ( not ( = ?auto_58204 ?auto_58217 ) ) ( not ( = ?auto_58215 ?auto_58217 ) ) ( AVAILABLE ?auto_58217 ) ( SURFACE-AT ?auto_58193 ?auto_58221 ) ( ON ?auto_58193 ?auto_58208 ) ( CLEAR ?auto_58193 ) ( not ( = ?auto_58192 ?auto_58208 ) ) ( not ( = ?auto_58193 ?auto_58208 ) ) ( not ( = ?auto_58222 ?auto_58208 ) ) ( not ( = ?auto_58195 ?auto_58208 ) ) ( IS-CRATE ?auto_58195 ) ( not ( = ?auto_58192 ?auto_58219 ) ) ( not ( = ?auto_58193 ?auto_58219 ) ) ( not ( = ?auto_58222 ?auto_58219 ) ) ( not ( = ?auto_58195 ?auto_58219 ) ) ( not ( = ?auto_58208 ?auto_58219 ) ) ( not ( = ?auto_58196 ?auto_58214 ) ) ( not ( = ?auto_58198 ?auto_58196 ) ) ( not ( = ?auto_58221 ?auto_58196 ) ) ( HOIST-AT ?auto_58205 ?auto_58196 ) ( not ( = ?auto_58204 ?auto_58205 ) ) ( not ( = ?auto_58215 ?auto_58205 ) ) ( not ( = ?auto_58217 ?auto_58205 ) ) ( AVAILABLE ?auto_58205 ) ( SURFACE-AT ?auto_58195 ?auto_58196 ) ( ON ?auto_58195 ?auto_58197 ) ( CLEAR ?auto_58195 ) ( not ( = ?auto_58192 ?auto_58197 ) ) ( not ( = ?auto_58193 ?auto_58197 ) ) ( not ( = ?auto_58222 ?auto_58197 ) ) ( not ( = ?auto_58195 ?auto_58197 ) ) ( not ( = ?auto_58208 ?auto_58197 ) ) ( not ( = ?auto_58219 ?auto_58197 ) ) ( IS-CRATE ?auto_58219 ) ( not ( = ?auto_58192 ?auto_58209 ) ) ( not ( = ?auto_58193 ?auto_58209 ) ) ( not ( = ?auto_58222 ?auto_58209 ) ) ( not ( = ?auto_58195 ?auto_58209 ) ) ( not ( = ?auto_58208 ?auto_58209 ) ) ( not ( = ?auto_58219 ?auto_58209 ) ) ( not ( = ?auto_58197 ?auto_58209 ) ) ( AVAILABLE ?auto_58215 ) ( SURFACE-AT ?auto_58219 ?auto_58198 ) ( ON ?auto_58219 ?auto_58194 ) ( CLEAR ?auto_58219 ) ( not ( = ?auto_58192 ?auto_58194 ) ) ( not ( = ?auto_58193 ?auto_58194 ) ) ( not ( = ?auto_58222 ?auto_58194 ) ) ( not ( = ?auto_58195 ?auto_58194 ) ) ( not ( = ?auto_58208 ?auto_58194 ) ) ( not ( = ?auto_58219 ?auto_58194 ) ) ( not ( = ?auto_58197 ?auto_58194 ) ) ( not ( = ?auto_58209 ?auto_58194 ) ) ( IS-CRATE ?auto_58209 ) ( not ( = ?auto_58192 ?auto_58218 ) ) ( not ( = ?auto_58193 ?auto_58218 ) ) ( not ( = ?auto_58222 ?auto_58218 ) ) ( not ( = ?auto_58195 ?auto_58218 ) ) ( not ( = ?auto_58208 ?auto_58218 ) ) ( not ( = ?auto_58219 ?auto_58218 ) ) ( not ( = ?auto_58197 ?auto_58218 ) ) ( not ( = ?auto_58209 ?auto_58218 ) ) ( not ( = ?auto_58194 ?auto_58218 ) ) ( not ( = ?auto_58200 ?auto_58214 ) ) ( not ( = ?auto_58198 ?auto_58200 ) ) ( not ( = ?auto_58221 ?auto_58200 ) ) ( not ( = ?auto_58196 ?auto_58200 ) ) ( HOIST-AT ?auto_58211 ?auto_58200 ) ( not ( = ?auto_58204 ?auto_58211 ) ) ( not ( = ?auto_58215 ?auto_58211 ) ) ( not ( = ?auto_58217 ?auto_58211 ) ) ( not ( = ?auto_58205 ?auto_58211 ) ) ( AVAILABLE ?auto_58211 ) ( SURFACE-AT ?auto_58209 ?auto_58200 ) ( ON ?auto_58209 ?auto_58199 ) ( CLEAR ?auto_58209 ) ( not ( = ?auto_58192 ?auto_58199 ) ) ( not ( = ?auto_58193 ?auto_58199 ) ) ( not ( = ?auto_58222 ?auto_58199 ) ) ( not ( = ?auto_58195 ?auto_58199 ) ) ( not ( = ?auto_58208 ?auto_58199 ) ) ( not ( = ?auto_58219 ?auto_58199 ) ) ( not ( = ?auto_58197 ?auto_58199 ) ) ( not ( = ?auto_58209 ?auto_58199 ) ) ( not ( = ?auto_58194 ?auto_58199 ) ) ( not ( = ?auto_58218 ?auto_58199 ) ) ( IS-CRATE ?auto_58218 ) ( not ( = ?auto_58192 ?auto_58206 ) ) ( not ( = ?auto_58193 ?auto_58206 ) ) ( not ( = ?auto_58222 ?auto_58206 ) ) ( not ( = ?auto_58195 ?auto_58206 ) ) ( not ( = ?auto_58208 ?auto_58206 ) ) ( not ( = ?auto_58219 ?auto_58206 ) ) ( not ( = ?auto_58197 ?auto_58206 ) ) ( not ( = ?auto_58209 ?auto_58206 ) ) ( not ( = ?auto_58194 ?auto_58206 ) ) ( not ( = ?auto_58218 ?auto_58206 ) ) ( not ( = ?auto_58199 ?auto_58206 ) ) ( not ( = ?auto_58202 ?auto_58214 ) ) ( not ( = ?auto_58198 ?auto_58202 ) ) ( not ( = ?auto_58221 ?auto_58202 ) ) ( not ( = ?auto_58196 ?auto_58202 ) ) ( not ( = ?auto_58200 ?auto_58202 ) ) ( HOIST-AT ?auto_58220 ?auto_58202 ) ( not ( = ?auto_58204 ?auto_58220 ) ) ( not ( = ?auto_58215 ?auto_58220 ) ) ( not ( = ?auto_58217 ?auto_58220 ) ) ( not ( = ?auto_58205 ?auto_58220 ) ) ( not ( = ?auto_58211 ?auto_58220 ) ) ( AVAILABLE ?auto_58220 ) ( SURFACE-AT ?auto_58218 ?auto_58202 ) ( ON ?auto_58218 ?auto_58201 ) ( CLEAR ?auto_58218 ) ( not ( = ?auto_58192 ?auto_58201 ) ) ( not ( = ?auto_58193 ?auto_58201 ) ) ( not ( = ?auto_58222 ?auto_58201 ) ) ( not ( = ?auto_58195 ?auto_58201 ) ) ( not ( = ?auto_58208 ?auto_58201 ) ) ( not ( = ?auto_58219 ?auto_58201 ) ) ( not ( = ?auto_58197 ?auto_58201 ) ) ( not ( = ?auto_58209 ?auto_58201 ) ) ( not ( = ?auto_58194 ?auto_58201 ) ) ( not ( = ?auto_58218 ?auto_58201 ) ) ( not ( = ?auto_58199 ?auto_58201 ) ) ( not ( = ?auto_58206 ?auto_58201 ) ) ( IS-CRATE ?auto_58206 ) ( not ( = ?auto_58192 ?auto_58210 ) ) ( not ( = ?auto_58193 ?auto_58210 ) ) ( not ( = ?auto_58222 ?auto_58210 ) ) ( not ( = ?auto_58195 ?auto_58210 ) ) ( not ( = ?auto_58208 ?auto_58210 ) ) ( not ( = ?auto_58219 ?auto_58210 ) ) ( not ( = ?auto_58197 ?auto_58210 ) ) ( not ( = ?auto_58209 ?auto_58210 ) ) ( not ( = ?auto_58194 ?auto_58210 ) ) ( not ( = ?auto_58218 ?auto_58210 ) ) ( not ( = ?auto_58199 ?auto_58210 ) ) ( not ( = ?auto_58206 ?auto_58210 ) ) ( not ( = ?auto_58201 ?auto_58210 ) ) ( not ( = ?auto_58212 ?auto_58214 ) ) ( not ( = ?auto_58198 ?auto_58212 ) ) ( not ( = ?auto_58221 ?auto_58212 ) ) ( not ( = ?auto_58196 ?auto_58212 ) ) ( not ( = ?auto_58200 ?auto_58212 ) ) ( not ( = ?auto_58202 ?auto_58212 ) ) ( HOIST-AT ?auto_58207 ?auto_58212 ) ( not ( = ?auto_58204 ?auto_58207 ) ) ( not ( = ?auto_58215 ?auto_58207 ) ) ( not ( = ?auto_58217 ?auto_58207 ) ) ( not ( = ?auto_58205 ?auto_58207 ) ) ( not ( = ?auto_58211 ?auto_58207 ) ) ( not ( = ?auto_58220 ?auto_58207 ) ) ( SURFACE-AT ?auto_58206 ?auto_58212 ) ( ON ?auto_58206 ?auto_58203 ) ( CLEAR ?auto_58206 ) ( not ( = ?auto_58192 ?auto_58203 ) ) ( not ( = ?auto_58193 ?auto_58203 ) ) ( not ( = ?auto_58222 ?auto_58203 ) ) ( not ( = ?auto_58195 ?auto_58203 ) ) ( not ( = ?auto_58208 ?auto_58203 ) ) ( not ( = ?auto_58219 ?auto_58203 ) ) ( not ( = ?auto_58197 ?auto_58203 ) ) ( not ( = ?auto_58209 ?auto_58203 ) ) ( not ( = ?auto_58194 ?auto_58203 ) ) ( not ( = ?auto_58218 ?auto_58203 ) ) ( not ( = ?auto_58199 ?auto_58203 ) ) ( not ( = ?auto_58206 ?auto_58203 ) ) ( not ( = ?auto_58201 ?auto_58203 ) ) ( not ( = ?auto_58210 ?auto_58203 ) ) ( SURFACE-AT ?auto_58216 ?auto_58214 ) ( CLEAR ?auto_58216 ) ( IS-CRATE ?auto_58210 ) ( not ( = ?auto_58192 ?auto_58216 ) ) ( not ( = ?auto_58193 ?auto_58216 ) ) ( not ( = ?auto_58222 ?auto_58216 ) ) ( not ( = ?auto_58195 ?auto_58216 ) ) ( not ( = ?auto_58208 ?auto_58216 ) ) ( not ( = ?auto_58219 ?auto_58216 ) ) ( not ( = ?auto_58197 ?auto_58216 ) ) ( not ( = ?auto_58209 ?auto_58216 ) ) ( not ( = ?auto_58194 ?auto_58216 ) ) ( not ( = ?auto_58218 ?auto_58216 ) ) ( not ( = ?auto_58199 ?auto_58216 ) ) ( not ( = ?auto_58206 ?auto_58216 ) ) ( not ( = ?auto_58201 ?auto_58216 ) ) ( not ( = ?auto_58210 ?auto_58216 ) ) ( not ( = ?auto_58203 ?auto_58216 ) ) ( AVAILABLE ?auto_58204 ) ( TRUCK-AT ?auto_58213 ?auto_58212 ) ( AVAILABLE ?auto_58207 ) ( SURFACE-AT ?auto_58210 ?auto_58212 ) ( ON ?auto_58210 ?auto_58223 ) ( CLEAR ?auto_58210 ) ( not ( = ?auto_58192 ?auto_58223 ) ) ( not ( = ?auto_58193 ?auto_58223 ) ) ( not ( = ?auto_58222 ?auto_58223 ) ) ( not ( = ?auto_58195 ?auto_58223 ) ) ( not ( = ?auto_58208 ?auto_58223 ) ) ( not ( = ?auto_58219 ?auto_58223 ) ) ( not ( = ?auto_58197 ?auto_58223 ) ) ( not ( = ?auto_58209 ?auto_58223 ) ) ( not ( = ?auto_58194 ?auto_58223 ) ) ( not ( = ?auto_58218 ?auto_58223 ) ) ( not ( = ?auto_58199 ?auto_58223 ) ) ( not ( = ?auto_58206 ?auto_58223 ) ) ( not ( = ?auto_58201 ?auto_58223 ) ) ( not ( = ?auto_58210 ?auto_58223 ) ) ( not ( = ?auto_58203 ?auto_58223 ) ) ( not ( = ?auto_58216 ?auto_58223 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58207 ?auto_58210 ?auto_58223 ?auto_58212 )
      ( MAKE-ON ?auto_58192 ?auto_58193 )
      ( MAKE-ON-VERIFY ?auto_58192 ?auto_58193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58224 - SURFACE
      ?auto_58225 - SURFACE
    )
    :vars
    (
      ?auto_58233 - HOIST
      ?auto_58253 - PLACE
      ?auto_58231 - PLACE
      ?auto_58252 - HOIST
      ?auto_58241 - SURFACE
      ?auto_58255 - SURFACE
      ?auto_58240 - PLACE
      ?auto_58245 - HOIST
      ?auto_58242 - SURFACE
      ?auto_58238 - SURFACE
      ?auto_58227 - PLACE
      ?auto_58229 - HOIST
      ?auto_58230 - SURFACE
      ?auto_58250 - SURFACE
      ?auto_58226 - SURFACE
      ?auto_58237 - SURFACE
      ?auto_58243 - PLACE
      ?auto_58247 - HOIST
      ?auto_58232 - SURFACE
      ?auto_58235 - SURFACE
      ?auto_58236 - PLACE
      ?auto_58239 - HOIST
      ?auto_58234 - SURFACE
      ?auto_58246 - SURFACE
      ?auto_58248 - PLACE
      ?auto_58228 - HOIST
      ?auto_58249 - SURFACE
      ?auto_58251 - SURFACE
      ?auto_58244 - SURFACE
      ?auto_58254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58233 ?auto_58253 ) ( IS-CRATE ?auto_58224 ) ( not ( = ?auto_58224 ?auto_58225 ) ) ( not ( = ?auto_58231 ?auto_58253 ) ) ( HOIST-AT ?auto_58252 ?auto_58231 ) ( not ( = ?auto_58233 ?auto_58252 ) ) ( SURFACE-AT ?auto_58224 ?auto_58231 ) ( ON ?auto_58224 ?auto_58241 ) ( CLEAR ?auto_58224 ) ( not ( = ?auto_58224 ?auto_58241 ) ) ( not ( = ?auto_58225 ?auto_58241 ) ) ( IS-CRATE ?auto_58225 ) ( not ( = ?auto_58224 ?auto_58255 ) ) ( not ( = ?auto_58225 ?auto_58255 ) ) ( not ( = ?auto_58241 ?auto_58255 ) ) ( not ( = ?auto_58240 ?auto_58253 ) ) ( not ( = ?auto_58231 ?auto_58240 ) ) ( HOIST-AT ?auto_58245 ?auto_58240 ) ( not ( = ?auto_58233 ?auto_58245 ) ) ( not ( = ?auto_58252 ?auto_58245 ) ) ( AVAILABLE ?auto_58245 ) ( SURFACE-AT ?auto_58225 ?auto_58240 ) ( ON ?auto_58225 ?auto_58242 ) ( CLEAR ?auto_58225 ) ( not ( = ?auto_58224 ?auto_58242 ) ) ( not ( = ?auto_58225 ?auto_58242 ) ) ( not ( = ?auto_58241 ?auto_58242 ) ) ( not ( = ?auto_58255 ?auto_58242 ) ) ( IS-CRATE ?auto_58255 ) ( not ( = ?auto_58224 ?auto_58238 ) ) ( not ( = ?auto_58225 ?auto_58238 ) ) ( not ( = ?auto_58241 ?auto_58238 ) ) ( not ( = ?auto_58255 ?auto_58238 ) ) ( not ( = ?auto_58242 ?auto_58238 ) ) ( not ( = ?auto_58227 ?auto_58253 ) ) ( not ( = ?auto_58231 ?auto_58227 ) ) ( not ( = ?auto_58240 ?auto_58227 ) ) ( HOIST-AT ?auto_58229 ?auto_58227 ) ( not ( = ?auto_58233 ?auto_58229 ) ) ( not ( = ?auto_58252 ?auto_58229 ) ) ( not ( = ?auto_58245 ?auto_58229 ) ) ( AVAILABLE ?auto_58229 ) ( SURFACE-AT ?auto_58255 ?auto_58227 ) ( ON ?auto_58255 ?auto_58230 ) ( CLEAR ?auto_58255 ) ( not ( = ?auto_58224 ?auto_58230 ) ) ( not ( = ?auto_58225 ?auto_58230 ) ) ( not ( = ?auto_58241 ?auto_58230 ) ) ( not ( = ?auto_58255 ?auto_58230 ) ) ( not ( = ?auto_58242 ?auto_58230 ) ) ( not ( = ?auto_58238 ?auto_58230 ) ) ( IS-CRATE ?auto_58238 ) ( not ( = ?auto_58224 ?auto_58250 ) ) ( not ( = ?auto_58225 ?auto_58250 ) ) ( not ( = ?auto_58241 ?auto_58250 ) ) ( not ( = ?auto_58255 ?auto_58250 ) ) ( not ( = ?auto_58242 ?auto_58250 ) ) ( not ( = ?auto_58238 ?auto_58250 ) ) ( not ( = ?auto_58230 ?auto_58250 ) ) ( AVAILABLE ?auto_58252 ) ( SURFACE-AT ?auto_58238 ?auto_58231 ) ( ON ?auto_58238 ?auto_58226 ) ( CLEAR ?auto_58238 ) ( not ( = ?auto_58224 ?auto_58226 ) ) ( not ( = ?auto_58225 ?auto_58226 ) ) ( not ( = ?auto_58241 ?auto_58226 ) ) ( not ( = ?auto_58255 ?auto_58226 ) ) ( not ( = ?auto_58242 ?auto_58226 ) ) ( not ( = ?auto_58238 ?auto_58226 ) ) ( not ( = ?auto_58230 ?auto_58226 ) ) ( not ( = ?auto_58250 ?auto_58226 ) ) ( IS-CRATE ?auto_58250 ) ( not ( = ?auto_58224 ?auto_58237 ) ) ( not ( = ?auto_58225 ?auto_58237 ) ) ( not ( = ?auto_58241 ?auto_58237 ) ) ( not ( = ?auto_58255 ?auto_58237 ) ) ( not ( = ?auto_58242 ?auto_58237 ) ) ( not ( = ?auto_58238 ?auto_58237 ) ) ( not ( = ?auto_58230 ?auto_58237 ) ) ( not ( = ?auto_58250 ?auto_58237 ) ) ( not ( = ?auto_58226 ?auto_58237 ) ) ( not ( = ?auto_58243 ?auto_58253 ) ) ( not ( = ?auto_58231 ?auto_58243 ) ) ( not ( = ?auto_58240 ?auto_58243 ) ) ( not ( = ?auto_58227 ?auto_58243 ) ) ( HOIST-AT ?auto_58247 ?auto_58243 ) ( not ( = ?auto_58233 ?auto_58247 ) ) ( not ( = ?auto_58252 ?auto_58247 ) ) ( not ( = ?auto_58245 ?auto_58247 ) ) ( not ( = ?auto_58229 ?auto_58247 ) ) ( AVAILABLE ?auto_58247 ) ( SURFACE-AT ?auto_58250 ?auto_58243 ) ( ON ?auto_58250 ?auto_58232 ) ( CLEAR ?auto_58250 ) ( not ( = ?auto_58224 ?auto_58232 ) ) ( not ( = ?auto_58225 ?auto_58232 ) ) ( not ( = ?auto_58241 ?auto_58232 ) ) ( not ( = ?auto_58255 ?auto_58232 ) ) ( not ( = ?auto_58242 ?auto_58232 ) ) ( not ( = ?auto_58238 ?auto_58232 ) ) ( not ( = ?auto_58230 ?auto_58232 ) ) ( not ( = ?auto_58250 ?auto_58232 ) ) ( not ( = ?auto_58226 ?auto_58232 ) ) ( not ( = ?auto_58237 ?auto_58232 ) ) ( IS-CRATE ?auto_58237 ) ( not ( = ?auto_58224 ?auto_58235 ) ) ( not ( = ?auto_58225 ?auto_58235 ) ) ( not ( = ?auto_58241 ?auto_58235 ) ) ( not ( = ?auto_58255 ?auto_58235 ) ) ( not ( = ?auto_58242 ?auto_58235 ) ) ( not ( = ?auto_58238 ?auto_58235 ) ) ( not ( = ?auto_58230 ?auto_58235 ) ) ( not ( = ?auto_58250 ?auto_58235 ) ) ( not ( = ?auto_58226 ?auto_58235 ) ) ( not ( = ?auto_58237 ?auto_58235 ) ) ( not ( = ?auto_58232 ?auto_58235 ) ) ( not ( = ?auto_58236 ?auto_58253 ) ) ( not ( = ?auto_58231 ?auto_58236 ) ) ( not ( = ?auto_58240 ?auto_58236 ) ) ( not ( = ?auto_58227 ?auto_58236 ) ) ( not ( = ?auto_58243 ?auto_58236 ) ) ( HOIST-AT ?auto_58239 ?auto_58236 ) ( not ( = ?auto_58233 ?auto_58239 ) ) ( not ( = ?auto_58252 ?auto_58239 ) ) ( not ( = ?auto_58245 ?auto_58239 ) ) ( not ( = ?auto_58229 ?auto_58239 ) ) ( not ( = ?auto_58247 ?auto_58239 ) ) ( AVAILABLE ?auto_58239 ) ( SURFACE-AT ?auto_58237 ?auto_58236 ) ( ON ?auto_58237 ?auto_58234 ) ( CLEAR ?auto_58237 ) ( not ( = ?auto_58224 ?auto_58234 ) ) ( not ( = ?auto_58225 ?auto_58234 ) ) ( not ( = ?auto_58241 ?auto_58234 ) ) ( not ( = ?auto_58255 ?auto_58234 ) ) ( not ( = ?auto_58242 ?auto_58234 ) ) ( not ( = ?auto_58238 ?auto_58234 ) ) ( not ( = ?auto_58230 ?auto_58234 ) ) ( not ( = ?auto_58250 ?auto_58234 ) ) ( not ( = ?auto_58226 ?auto_58234 ) ) ( not ( = ?auto_58237 ?auto_58234 ) ) ( not ( = ?auto_58232 ?auto_58234 ) ) ( not ( = ?auto_58235 ?auto_58234 ) ) ( IS-CRATE ?auto_58235 ) ( not ( = ?auto_58224 ?auto_58246 ) ) ( not ( = ?auto_58225 ?auto_58246 ) ) ( not ( = ?auto_58241 ?auto_58246 ) ) ( not ( = ?auto_58255 ?auto_58246 ) ) ( not ( = ?auto_58242 ?auto_58246 ) ) ( not ( = ?auto_58238 ?auto_58246 ) ) ( not ( = ?auto_58230 ?auto_58246 ) ) ( not ( = ?auto_58250 ?auto_58246 ) ) ( not ( = ?auto_58226 ?auto_58246 ) ) ( not ( = ?auto_58237 ?auto_58246 ) ) ( not ( = ?auto_58232 ?auto_58246 ) ) ( not ( = ?auto_58235 ?auto_58246 ) ) ( not ( = ?auto_58234 ?auto_58246 ) ) ( not ( = ?auto_58248 ?auto_58253 ) ) ( not ( = ?auto_58231 ?auto_58248 ) ) ( not ( = ?auto_58240 ?auto_58248 ) ) ( not ( = ?auto_58227 ?auto_58248 ) ) ( not ( = ?auto_58243 ?auto_58248 ) ) ( not ( = ?auto_58236 ?auto_58248 ) ) ( HOIST-AT ?auto_58228 ?auto_58248 ) ( not ( = ?auto_58233 ?auto_58228 ) ) ( not ( = ?auto_58252 ?auto_58228 ) ) ( not ( = ?auto_58245 ?auto_58228 ) ) ( not ( = ?auto_58229 ?auto_58228 ) ) ( not ( = ?auto_58247 ?auto_58228 ) ) ( not ( = ?auto_58239 ?auto_58228 ) ) ( SURFACE-AT ?auto_58235 ?auto_58248 ) ( ON ?auto_58235 ?auto_58249 ) ( CLEAR ?auto_58235 ) ( not ( = ?auto_58224 ?auto_58249 ) ) ( not ( = ?auto_58225 ?auto_58249 ) ) ( not ( = ?auto_58241 ?auto_58249 ) ) ( not ( = ?auto_58255 ?auto_58249 ) ) ( not ( = ?auto_58242 ?auto_58249 ) ) ( not ( = ?auto_58238 ?auto_58249 ) ) ( not ( = ?auto_58230 ?auto_58249 ) ) ( not ( = ?auto_58250 ?auto_58249 ) ) ( not ( = ?auto_58226 ?auto_58249 ) ) ( not ( = ?auto_58237 ?auto_58249 ) ) ( not ( = ?auto_58232 ?auto_58249 ) ) ( not ( = ?auto_58235 ?auto_58249 ) ) ( not ( = ?auto_58234 ?auto_58249 ) ) ( not ( = ?auto_58246 ?auto_58249 ) ) ( SURFACE-AT ?auto_58251 ?auto_58253 ) ( CLEAR ?auto_58251 ) ( IS-CRATE ?auto_58246 ) ( not ( = ?auto_58224 ?auto_58251 ) ) ( not ( = ?auto_58225 ?auto_58251 ) ) ( not ( = ?auto_58241 ?auto_58251 ) ) ( not ( = ?auto_58255 ?auto_58251 ) ) ( not ( = ?auto_58242 ?auto_58251 ) ) ( not ( = ?auto_58238 ?auto_58251 ) ) ( not ( = ?auto_58230 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58226 ?auto_58251 ) ) ( not ( = ?auto_58237 ?auto_58251 ) ) ( not ( = ?auto_58232 ?auto_58251 ) ) ( not ( = ?auto_58235 ?auto_58251 ) ) ( not ( = ?auto_58234 ?auto_58251 ) ) ( not ( = ?auto_58246 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( AVAILABLE ?auto_58233 ) ( AVAILABLE ?auto_58228 ) ( SURFACE-AT ?auto_58246 ?auto_58248 ) ( ON ?auto_58246 ?auto_58244 ) ( CLEAR ?auto_58246 ) ( not ( = ?auto_58224 ?auto_58244 ) ) ( not ( = ?auto_58225 ?auto_58244 ) ) ( not ( = ?auto_58241 ?auto_58244 ) ) ( not ( = ?auto_58255 ?auto_58244 ) ) ( not ( = ?auto_58242 ?auto_58244 ) ) ( not ( = ?auto_58238 ?auto_58244 ) ) ( not ( = ?auto_58230 ?auto_58244 ) ) ( not ( = ?auto_58250 ?auto_58244 ) ) ( not ( = ?auto_58226 ?auto_58244 ) ) ( not ( = ?auto_58237 ?auto_58244 ) ) ( not ( = ?auto_58232 ?auto_58244 ) ) ( not ( = ?auto_58235 ?auto_58244 ) ) ( not ( = ?auto_58234 ?auto_58244 ) ) ( not ( = ?auto_58246 ?auto_58244 ) ) ( not ( = ?auto_58249 ?auto_58244 ) ) ( not ( = ?auto_58251 ?auto_58244 ) ) ( TRUCK-AT ?auto_58254 ?auto_58253 ) )
    :subtasks
    ( ( !DRIVE ?auto_58254 ?auto_58253 ?auto_58248 )
      ( MAKE-ON ?auto_58224 ?auto_58225 )
      ( MAKE-ON-VERIFY ?auto_58224 ?auto_58225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58258 - SURFACE
      ?auto_58259 - SURFACE
    )
    :vars
    (
      ?auto_58260 - HOIST
      ?auto_58261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58260 ?auto_58261 ) ( SURFACE-AT ?auto_58259 ?auto_58261 ) ( CLEAR ?auto_58259 ) ( LIFTING ?auto_58260 ?auto_58258 ) ( IS-CRATE ?auto_58258 ) ( not ( = ?auto_58258 ?auto_58259 ) ) )
    :subtasks
    ( ( !DROP ?auto_58260 ?auto_58258 ?auto_58259 ?auto_58261 )
      ( MAKE-ON-VERIFY ?auto_58258 ?auto_58259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58262 - SURFACE
      ?auto_58263 - SURFACE
    )
    :vars
    (
      ?auto_58265 - HOIST
      ?auto_58264 - PLACE
      ?auto_58266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58265 ?auto_58264 ) ( SURFACE-AT ?auto_58263 ?auto_58264 ) ( CLEAR ?auto_58263 ) ( IS-CRATE ?auto_58262 ) ( not ( = ?auto_58262 ?auto_58263 ) ) ( TRUCK-AT ?auto_58266 ?auto_58264 ) ( AVAILABLE ?auto_58265 ) ( IN ?auto_58262 ?auto_58266 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58265 ?auto_58262 ?auto_58266 ?auto_58264 )
      ( MAKE-ON ?auto_58262 ?auto_58263 )
      ( MAKE-ON-VERIFY ?auto_58262 ?auto_58263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58267 - SURFACE
      ?auto_58268 - SURFACE
    )
    :vars
    (
      ?auto_58271 - HOIST
      ?auto_58270 - PLACE
      ?auto_58269 - TRUCK
      ?auto_58272 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58271 ?auto_58270 ) ( SURFACE-AT ?auto_58268 ?auto_58270 ) ( CLEAR ?auto_58268 ) ( IS-CRATE ?auto_58267 ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( AVAILABLE ?auto_58271 ) ( IN ?auto_58267 ?auto_58269 ) ( TRUCK-AT ?auto_58269 ?auto_58272 ) ( not ( = ?auto_58272 ?auto_58270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58269 ?auto_58272 ?auto_58270 )
      ( MAKE-ON ?auto_58267 ?auto_58268 )
      ( MAKE-ON-VERIFY ?auto_58267 ?auto_58268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58273 - SURFACE
      ?auto_58274 - SURFACE
    )
    :vars
    (
      ?auto_58276 - HOIST
      ?auto_58278 - PLACE
      ?auto_58277 - TRUCK
      ?auto_58275 - PLACE
      ?auto_58279 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58276 ?auto_58278 ) ( SURFACE-AT ?auto_58274 ?auto_58278 ) ( CLEAR ?auto_58274 ) ( IS-CRATE ?auto_58273 ) ( not ( = ?auto_58273 ?auto_58274 ) ) ( AVAILABLE ?auto_58276 ) ( TRUCK-AT ?auto_58277 ?auto_58275 ) ( not ( = ?auto_58275 ?auto_58278 ) ) ( HOIST-AT ?auto_58279 ?auto_58275 ) ( LIFTING ?auto_58279 ?auto_58273 ) ( not ( = ?auto_58276 ?auto_58279 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58279 ?auto_58273 ?auto_58277 ?auto_58275 )
      ( MAKE-ON ?auto_58273 ?auto_58274 )
      ( MAKE-ON-VERIFY ?auto_58273 ?auto_58274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58280 - SURFACE
      ?auto_58281 - SURFACE
    )
    :vars
    (
      ?auto_58284 - HOIST
      ?auto_58283 - PLACE
      ?auto_58286 - TRUCK
      ?auto_58285 - PLACE
      ?auto_58282 - HOIST
      ?auto_58287 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58284 ?auto_58283 ) ( SURFACE-AT ?auto_58281 ?auto_58283 ) ( CLEAR ?auto_58281 ) ( IS-CRATE ?auto_58280 ) ( not ( = ?auto_58280 ?auto_58281 ) ) ( AVAILABLE ?auto_58284 ) ( TRUCK-AT ?auto_58286 ?auto_58285 ) ( not ( = ?auto_58285 ?auto_58283 ) ) ( HOIST-AT ?auto_58282 ?auto_58285 ) ( not ( = ?auto_58284 ?auto_58282 ) ) ( AVAILABLE ?auto_58282 ) ( SURFACE-AT ?auto_58280 ?auto_58285 ) ( ON ?auto_58280 ?auto_58287 ) ( CLEAR ?auto_58280 ) ( not ( = ?auto_58280 ?auto_58287 ) ) ( not ( = ?auto_58281 ?auto_58287 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58282 ?auto_58280 ?auto_58287 ?auto_58285 )
      ( MAKE-ON ?auto_58280 ?auto_58281 )
      ( MAKE-ON-VERIFY ?auto_58280 ?auto_58281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58288 - SURFACE
      ?auto_58289 - SURFACE
    )
    :vars
    (
      ?auto_58295 - HOIST
      ?auto_58292 - PLACE
      ?auto_58290 - PLACE
      ?auto_58293 - HOIST
      ?auto_58294 - SURFACE
      ?auto_58291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58295 ?auto_58292 ) ( SURFACE-AT ?auto_58289 ?auto_58292 ) ( CLEAR ?auto_58289 ) ( IS-CRATE ?auto_58288 ) ( not ( = ?auto_58288 ?auto_58289 ) ) ( AVAILABLE ?auto_58295 ) ( not ( = ?auto_58290 ?auto_58292 ) ) ( HOIST-AT ?auto_58293 ?auto_58290 ) ( not ( = ?auto_58295 ?auto_58293 ) ) ( AVAILABLE ?auto_58293 ) ( SURFACE-AT ?auto_58288 ?auto_58290 ) ( ON ?auto_58288 ?auto_58294 ) ( CLEAR ?auto_58288 ) ( not ( = ?auto_58288 ?auto_58294 ) ) ( not ( = ?auto_58289 ?auto_58294 ) ) ( TRUCK-AT ?auto_58291 ?auto_58292 ) )
    :subtasks
    ( ( !DRIVE ?auto_58291 ?auto_58292 ?auto_58290 )
      ( MAKE-ON ?auto_58288 ?auto_58289 )
      ( MAKE-ON-VERIFY ?auto_58288 ?auto_58289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58296 - SURFACE
      ?auto_58297 - SURFACE
    )
    :vars
    (
      ?auto_58300 - HOIST
      ?auto_58301 - PLACE
      ?auto_58299 - PLACE
      ?auto_58302 - HOIST
      ?auto_58303 - SURFACE
      ?auto_58298 - TRUCK
      ?auto_58304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58300 ?auto_58301 ) ( IS-CRATE ?auto_58296 ) ( not ( = ?auto_58296 ?auto_58297 ) ) ( not ( = ?auto_58299 ?auto_58301 ) ) ( HOIST-AT ?auto_58302 ?auto_58299 ) ( not ( = ?auto_58300 ?auto_58302 ) ) ( AVAILABLE ?auto_58302 ) ( SURFACE-AT ?auto_58296 ?auto_58299 ) ( ON ?auto_58296 ?auto_58303 ) ( CLEAR ?auto_58296 ) ( not ( = ?auto_58296 ?auto_58303 ) ) ( not ( = ?auto_58297 ?auto_58303 ) ) ( TRUCK-AT ?auto_58298 ?auto_58301 ) ( SURFACE-AT ?auto_58304 ?auto_58301 ) ( CLEAR ?auto_58304 ) ( LIFTING ?auto_58300 ?auto_58297 ) ( IS-CRATE ?auto_58297 ) ( not ( = ?auto_58296 ?auto_58304 ) ) ( not ( = ?auto_58297 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58304 ) ) )
    :subtasks
    ( ( !DROP ?auto_58300 ?auto_58297 ?auto_58304 ?auto_58301 )
      ( MAKE-ON ?auto_58296 ?auto_58297 )
      ( MAKE-ON-VERIFY ?auto_58296 ?auto_58297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58305 - SURFACE
      ?auto_58306 - SURFACE
    )
    :vars
    (
      ?auto_58312 - HOIST
      ?auto_58308 - PLACE
      ?auto_58313 - PLACE
      ?auto_58309 - HOIST
      ?auto_58310 - SURFACE
      ?auto_58307 - TRUCK
      ?auto_58311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58312 ?auto_58308 ) ( IS-CRATE ?auto_58305 ) ( not ( = ?auto_58305 ?auto_58306 ) ) ( not ( = ?auto_58313 ?auto_58308 ) ) ( HOIST-AT ?auto_58309 ?auto_58313 ) ( not ( = ?auto_58312 ?auto_58309 ) ) ( AVAILABLE ?auto_58309 ) ( SURFACE-AT ?auto_58305 ?auto_58313 ) ( ON ?auto_58305 ?auto_58310 ) ( CLEAR ?auto_58305 ) ( not ( = ?auto_58305 ?auto_58310 ) ) ( not ( = ?auto_58306 ?auto_58310 ) ) ( TRUCK-AT ?auto_58307 ?auto_58308 ) ( SURFACE-AT ?auto_58311 ?auto_58308 ) ( CLEAR ?auto_58311 ) ( IS-CRATE ?auto_58306 ) ( not ( = ?auto_58305 ?auto_58311 ) ) ( not ( = ?auto_58306 ?auto_58311 ) ) ( not ( = ?auto_58310 ?auto_58311 ) ) ( AVAILABLE ?auto_58312 ) ( IN ?auto_58306 ?auto_58307 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58312 ?auto_58306 ?auto_58307 ?auto_58308 )
      ( MAKE-ON ?auto_58305 ?auto_58306 )
      ( MAKE-ON-VERIFY ?auto_58305 ?auto_58306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58314 - SURFACE
      ?auto_58315 - SURFACE
    )
    :vars
    (
      ?auto_58320 - HOIST
      ?auto_58322 - PLACE
      ?auto_58319 - PLACE
      ?auto_58321 - HOIST
      ?auto_58317 - SURFACE
      ?auto_58318 - SURFACE
      ?auto_58316 - TRUCK
      ?auto_58323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58320 ?auto_58322 ) ( IS-CRATE ?auto_58314 ) ( not ( = ?auto_58314 ?auto_58315 ) ) ( not ( = ?auto_58319 ?auto_58322 ) ) ( HOIST-AT ?auto_58321 ?auto_58319 ) ( not ( = ?auto_58320 ?auto_58321 ) ) ( AVAILABLE ?auto_58321 ) ( SURFACE-AT ?auto_58314 ?auto_58319 ) ( ON ?auto_58314 ?auto_58317 ) ( CLEAR ?auto_58314 ) ( not ( = ?auto_58314 ?auto_58317 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( SURFACE-AT ?auto_58318 ?auto_58322 ) ( CLEAR ?auto_58318 ) ( IS-CRATE ?auto_58315 ) ( not ( = ?auto_58314 ?auto_58318 ) ) ( not ( = ?auto_58315 ?auto_58318 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) ( AVAILABLE ?auto_58320 ) ( IN ?auto_58315 ?auto_58316 ) ( TRUCK-AT ?auto_58316 ?auto_58323 ) ( not ( = ?auto_58323 ?auto_58322 ) ) ( not ( = ?auto_58319 ?auto_58323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58316 ?auto_58323 ?auto_58322 )
      ( MAKE-ON ?auto_58314 ?auto_58315 )
      ( MAKE-ON-VERIFY ?auto_58314 ?auto_58315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58324 - SURFACE
      ?auto_58325 - SURFACE
    )
    :vars
    (
      ?auto_58331 - HOIST
      ?auto_58326 - PLACE
      ?auto_58329 - PLACE
      ?auto_58327 - HOIST
      ?auto_58330 - SURFACE
      ?auto_58328 - SURFACE
      ?auto_58333 - TRUCK
      ?auto_58332 - PLACE
      ?auto_58334 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58331 ?auto_58326 ) ( IS-CRATE ?auto_58324 ) ( not ( = ?auto_58324 ?auto_58325 ) ) ( not ( = ?auto_58329 ?auto_58326 ) ) ( HOIST-AT ?auto_58327 ?auto_58329 ) ( not ( = ?auto_58331 ?auto_58327 ) ) ( AVAILABLE ?auto_58327 ) ( SURFACE-AT ?auto_58324 ?auto_58329 ) ( ON ?auto_58324 ?auto_58330 ) ( CLEAR ?auto_58324 ) ( not ( = ?auto_58324 ?auto_58330 ) ) ( not ( = ?auto_58325 ?auto_58330 ) ) ( SURFACE-AT ?auto_58328 ?auto_58326 ) ( CLEAR ?auto_58328 ) ( IS-CRATE ?auto_58325 ) ( not ( = ?auto_58324 ?auto_58328 ) ) ( not ( = ?auto_58325 ?auto_58328 ) ) ( not ( = ?auto_58330 ?auto_58328 ) ) ( AVAILABLE ?auto_58331 ) ( TRUCK-AT ?auto_58333 ?auto_58332 ) ( not ( = ?auto_58332 ?auto_58326 ) ) ( not ( = ?auto_58329 ?auto_58332 ) ) ( HOIST-AT ?auto_58334 ?auto_58332 ) ( LIFTING ?auto_58334 ?auto_58325 ) ( not ( = ?auto_58331 ?auto_58334 ) ) ( not ( = ?auto_58327 ?auto_58334 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58334 ?auto_58325 ?auto_58333 ?auto_58332 )
      ( MAKE-ON ?auto_58324 ?auto_58325 )
      ( MAKE-ON-VERIFY ?auto_58324 ?auto_58325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58335 - SURFACE
      ?auto_58336 - SURFACE
    )
    :vars
    (
      ?auto_58340 - HOIST
      ?auto_58342 - PLACE
      ?auto_58337 - PLACE
      ?auto_58344 - HOIST
      ?auto_58343 - SURFACE
      ?auto_58338 - SURFACE
      ?auto_58339 - TRUCK
      ?auto_58345 - PLACE
      ?auto_58341 - HOIST
      ?auto_58346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58340 ?auto_58342 ) ( IS-CRATE ?auto_58335 ) ( not ( = ?auto_58335 ?auto_58336 ) ) ( not ( = ?auto_58337 ?auto_58342 ) ) ( HOIST-AT ?auto_58344 ?auto_58337 ) ( not ( = ?auto_58340 ?auto_58344 ) ) ( AVAILABLE ?auto_58344 ) ( SURFACE-AT ?auto_58335 ?auto_58337 ) ( ON ?auto_58335 ?auto_58343 ) ( CLEAR ?auto_58335 ) ( not ( = ?auto_58335 ?auto_58343 ) ) ( not ( = ?auto_58336 ?auto_58343 ) ) ( SURFACE-AT ?auto_58338 ?auto_58342 ) ( CLEAR ?auto_58338 ) ( IS-CRATE ?auto_58336 ) ( not ( = ?auto_58335 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) ( not ( = ?auto_58343 ?auto_58338 ) ) ( AVAILABLE ?auto_58340 ) ( TRUCK-AT ?auto_58339 ?auto_58345 ) ( not ( = ?auto_58345 ?auto_58342 ) ) ( not ( = ?auto_58337 ?auto_58345 ) ) ( HOIST-AT ?auto_58341 ?auto_58345 ) ( not ( = ?auto_58340 ?auto_58341 ) ) ( not ( = ?auto_58344 ?auto_58341 ) ) ( AVAILABLE ?auto_58341 ) ( SURFACE-AT ?auto_58336 ?auto_58345 ) ( ON ?auto_58336 ?auto_58346 ) ( CLEAR ?auto_58336 ) ( not ( = ?auto_58335 ?auto_58346 ) ) ( not ( = ?auto_58336 ?auto_58346 ) ) ( not ( = ?auto_58343 ?auto_58346 ) ) ( not ( = ?auto_58338 ?auto_58346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58341 ?auto_58336 ?auto_58346 ?auto_58345 )
      ( MAKE-ON ?auto_58335 ?auto_58336 )
      ( MAKE-ON-VERIFY ?auto_58335 ?auto_58336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58347 - SURFACE
      ?auto_58348 - SURFACE
    )
    :vars
    (
      ?auto_58356 - HOIST
      ?auto_58357 - PLACE
      ?auto_58353 - PLACE
      ?auto_58350 - HOIST
      ?auto_58349 - SURFACE
      ?auto_58351 - SURFACE
      ?auto_58354 - PLACE
      ?auto_58358 - HOIST
      ?auto_58355 - SURFACE
      ?auto_58352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58356 ?auto_58357 ) ( IS-CRATE ?auto_58347 ) ( not ( = ?auto_58347 ?auto_58348 ) ) ( not ( = ?auto_58353 ?auto_58357 ) ) ( HOIST-AT ?auto_58350 ?auto_58353 ) ( not ( = ?auto_58356 ?auto_58350 ) ) ( AVAILABLE ?auto_58350 ) ( SURFACE-AT ?auto_58347 ?auto_58353 ) ( ON ?auto_58347 ?auto_58349 ) ( CLEAR ?auto_58347 ) ( not ( = ?auto_58347 ?auto_58349 ) ) ( not ( = ?auto_58348 ?auto_58349 ) ) ( SURFACE-AT ?auto_58351 ?auto_58357 ) ( CLEAR ?auto_58351 ) ( IS-CRATE ?auto_58348 ) ( not ( = ?auto_58347 ?auto_58351 ) ) ( not ( = ?auto_58348 ?auto_58351 ) ) ( not ( = ?auto_58349 ?auto_58351 ) ) ( AVAILABLE ?auto_58356 ) ( not ( = ?auto_58354 ?auto_58357 ) ) ( not ( = ?auto_58353 ?auto_58354 ) ) ( HOIST-AT ?auto_58358 ?auto_58354 ) ( not ( = ?auto_58356 ?auto_58358 ) ) ( not ( = ?auto_58350 ?auto_58358 ) ) ( AVAILABLE ?auto_58358 ) ( SURFACE-AT ?auto_58348 ?auto_58354 ) ( ON ?auto_58348 ?auto_58355 ) ( CLEAR ?auto_58348 ) ( not ( = ?auto_58347 ?auto_58355 ) ) ( not ( = ?auto_58348 ?auto_58355 ) ) ( not ( = ?auto_58349 ?auto_58355 ) ) ( not ( = ?auto_58351 ?auto_58355 ) ) ( TRUCK-AT ?auto_58352 ?auto_58357 ) )
    :subtasks
    ( ( !DRIVE ?auto_58352 ?auto_58357 ?auto_58354 )
      ( MAKE-ON ?auto_58347 ?auto_58348 )
      ( MAKE-ON-VERIFY ?auto_58347 ?auto_58348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58359 - SURFACE
      ?auto_58360 - SURFACE
    )
    :vars
    (
      ?auto_58368 - HOIST
      ?auto_58370 - PLACE
      ?auto_58362 - PLACE
      ?auto_58361 - HOIST
      ?auto_58365 - SURFACE
      ?auto_58366 - SURFACE
      ?auto_58363 - PLACE
      ?auto_58364 - HOIST
      ?auto_58369 - SURFACE
      ?auto_58367 - TRUCK
      ?auto_58371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58368 ?auto_58370 ) ( IS-CRATE ?auto_58359 ) ( not ( = ?auto_58359 ?auto_58360 ) ) ( not ( = ?auto_58362 ?auto_58370 ) ) ( HOIST-AT ?auto_58361 ?auto_58362 ) ( not ( = ?auto_58368 ?auto_58361 ) ) ( AVAILABLE ?auto_58361 ) ( SURFACE-AT ?auto_58359 ?auto_58362 ) ( ON ?auto_58359 ?auto_58365 ) ( CLEAR ?auto_58359 ) ( not ( = ?auto_58359 ?auto_58365 ) ) ( not ( = ?auto_58360 ?auto_58365 ) ) ( IS-CRATE ?auto_58360 ) ( not ( = ?auto_58359 ?auto_58366 ) ) ( not ( = ?auto_58360 ?auto_58366 ) ) ( not ( = ?auto_58365 ?auto_58366 ) ) ( not ( = ?auto_58363 ?auto_58370 ) ) ( not ( = ?auto_58362 ?auto_58363 ) ) ( HOIST-AT ?auto_58364 ?auto_58363 ) ( not ( = ?auto_58368 ?auto_58364 ) ) ( not ( = ?auto_58361 ?auto_58364 ) ) ( AVAILABLE ?auto_58364 ) ( SURFACE-AT ?auto_58360 ?auto_58363 ) ( ON ?auto_58360 ?auto_58369 ) ( CLEAR ?auto_58360 ) ( not ( = ?auto_58359 ?auto_58369 ) ) ( not ( = ?auto_58360 ?auto_58369 ) ) ( not ( = ?auto_58365 ?auto_58369 ) ) ( not ( = ?auto_58366 ?auto_58369 ) ) ( TRUCK-AT ?auto_58367 ?auto_58370 ) ( SURFACE-AT ?auto_58371 ?auto_58370 ) ( CLEAR ?auto_58371 ) ( LIFTING ?auto_58368 ?auto_58366 ) ( IS-CRATE ?auto_58366 ) ( not ( = ?auto_58359 ?auto_58371 ) ) ( not ( = ?auto_58360 ?auto_58371 ) ) ( not ( = ?auto_58365 ?auto_58371 ) ) ( not ( = ?auto_58366 ?auto_58371 ) ) ( not ( = ?auto_58369 ?auto_58371 ) ) )
    :subtasks
    ( ( !DROP ?auto_58368 ?auto_58366 ?auto_58371 ?auto_58370 )
      ( MAKE-ON ?auto_58359 ?auto_58360 )
      ( MAKE-ON-VERIFY ?auto_58359 ?auto_58360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58372 - SURFACE
      ?auto_58373 - SURFACE
    )
    :vars
    (
      ?auto_58379 - HOIST
      ?auto_58378 - PLACE
      ?auto_58382 - PLACE
      ?auto_58374 - HOIST
      ?auto_58384 - SURFACE
      ?auto_58381 - SURFACE
      ?auto_58380 - PLACE
      ?auto_58383 - HOIST
      ?auto_58375 - SURFACE
      ?auto_58377 - TRUCK
      ?auto_58376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58379 ?auto_58378 ) ( IS-CRATE ?auto_58372 ) ( not ( = ?auto_58372 ?auto_58373 ) ) ( not ( = ?auto_58382 ?auto_58378 ) ) ( HOIST-AT ?auto_58374 ?auto_58382 ) ( not ( = ?auto_58379 ?auto_58374 ) ) ( AVAILABLE ?auto_58374 ) ( SURFACE-AT ?auto_58372 ?auto_58382 ) ( ON ?auto_58372 ?auto_58384 ) ( CLEAR ?auto_58372 ) ( not ( = ?auto_58372 ?auto_58384 ) ) ( not ( = ?auto_58373 ?auto_58384 ) ) ( IS-CRATE ?auto_58373 ) ( not ( = ?auto_58372 ?auto_58381 ) ) ( not ( = ?auto_58373 ?auto_58381 ) ) ( not ( = ?auto_58384 ?auto_58381 ) ) ( not ( = ?auto_58380 ?auto_58378 ) ) ( not ( = ?auto_58382 ?auto_58380 ) ) ( HOIST-AT ?auto_58383 ?auto_58380 ) ( not ( = ?auto_58379 ?auto_58383 ) ) ( not ( = ?auto_58374 ?auto_58383 ) ) ( AVAILABLE ?auto_58383 ) ( SURFACE-AT ?auto_58373 ?auto_58380 ) ( ON ?auto_58373 ?auto_58375 ) ( CLEAR ?auto_58373 ) ( not ( = ?auto_58372 ?auto_58375 ) ) ( not ( = ?auto_58373 ?auto_58375 ) ) ( not ( = ?auto_58384 ?auto_58375 ) ) ( not ( = ?auto_58381 ?auto_58375 ) ) ( TRUCK-AT ?auto_58377 ?auto_58378 ) ( SURFACE-AT ?auto_58376 ?auto_58378 ) ( CLEAR ?auto_58376 ) ( IS-CRATE ?auto_58381 ) ( not ( = ?auto_58372 ?auto_58376 ) ) ( not ( = ?auto_58373 ?auto_58376 ) ) ( not ( = ?auto_58384 ?auto_58376 ) ) ( not ( = ?auto_58381 ?auto_58376 ) ) ( not ( = ?auto_58375 ?auto_58376 ) ) ( AVAILABLE ?auto_58379 ) ( IN ?auto_58381 ?auto_58377 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58379 ?auto_58381 ?auto_58377 ?auto_58378 )
      ( MAKE-ON ?auto_58372 ?auto_58373 )
      ( MAKE-ON-VERIFY ?auto_58372 ?auto_58373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58385 - SURFACE
      ?auto_58386 - SURFACE
    )
    :vars
    (
      ?auto_58395 - HOIST
      ?auto_58391 - PLACE
      ?auto_58387 - PLACE
      ?auto_58397 - HOIST
      ?auto_58392 - SURFACE
      ?auto_58394 - SURFACE
      ?auto_58390 - PLACE
      ?auto_58393 - HOIST
      ?auto_58388 - SURFACE
      ?auto_58396 - SURFACE
      ?auto_58389 - TRUCK
      ?auto_58398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58395 ?auto_58391 ) ( IS-CRATE ?auto_58385 ) ( not ( = ?auto_58385 ?auto_58386 ) ) ( not ( = ?auto_58387 ?auto_58391 ) ) ( HOIST-AT ?auto_58397 ?auto_58387 ) ( not ( = ?auto_58395 ?auto_58397 ) ) ( AVAILABLE ?auto_58397 ) ( SURFACE-AT ?auto_58385 ?auto_58387 ) ( ON ?auto_58385 ?auto_58392 ) ( CLEAR ?auto_58385 ) ( not ( = ?auto_58385 ?auto_58392 ) ) ( not ( = ?auto_58386 ?auto_58392 ) ) ( IS-CRATE ?auto_58386 ) ( not ( = ?auto_58385 ?auto_58394 ) ) ( not ( = ?auto_58386 ?auto_58394 ) ) ( not ( = ?auto_58392 ?auto_58394 ) ) ( not ( = ?auto_58390 ?auto_58391 ) ) ( not ( = ?auto_58387 ?auto_58390 ) ) ( HOIST-AT ?auto_58393 ?auto_58390 ) ( not ( = ?auto_58395 ?auto_58393 ) ) ( not ( = ?auto_58397 ?auto_58393 ) ) ( AVAILABLE ?auto_58393 ) ( SURFACE-AT ?auto_58386 ?auto_58390 ) ( ON ?auto_58386 ?auto_58388 ) ( CLEAR ?auto_58386 ) ( not ( = ?auto_58385 ?auto_58388 ) ) ( not ( = ?auto_58386 ?auto_58388 ) ) ( not ( = ?auto_58392 ?auto_58388 ) ) ( not ( = ?auto_58394 ?auto_58388 ) ) ( SURFACE-AT ?auto_58396 ?auto_58391 ) ( CLEAR ?auto_58396 ) ( IS-CRATE ?auto_58394 ) ( not ( = ?auto_58385 ?auto_58396 ) ) ( not ( = ?auto_58386 ?auto_58396 ) ) ( not ( = ?auto_58392 ?auto_58396 ) ) ( not ( = ?auto_58394 ?auto_58396 ) ) ( not ( = ?auto_58388 ?auto_58396 ) ) ( AVAILABLE ?auto_58395 ) ( IN ?auto_58394 ?auto_58389 ) ( TRUCK-AT ?auto_58389 ?auto_58398 ) ( not ( = ?auto_58398 ?auto_58391 ) ) ( not ( = ?auto_58387 ?auto_58398 ) ) ( not ( = ?auto_58390 ?auto_58398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58389 ?auto_58398 ?auto_58391 )
      ( MAKE-ON ?auto_58385 ?auto_58386 )
      ( MAKE-ON-VERIFY ?auto_58385 ?auto_58386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58399 - SURFACE
      ?auto_58400 - SURFACE
    )
    :vars
    (
      ?auto_58407 - HOIST
      ?auto_58408 - PLACE
      ?auto_58405 - PLACE
      ?auto_58403 - HOIST
      ?auto_58409 - SURFACE
      ?auto_58410 - SURFACE
      ?auto_58401 - PLACE
      ?auto_58406 - HOIST
      ?auto_58402 - SURFACE
      ?auto_58411 - SURFACE
      ?auto_58412 - TRUCK
      ?auto_58404 - PLACE
      ?auto_58413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58407 ?auto_58408 ) ( IS-CRATE ?auto_58399 ) ( not ( = ?auto_58399 ?auto_58400 ) ) ( not ( = ?auto_58405 ?auto_58408 ) ) ( HOIST-AT ?auto_58403 ?auto_58405 ) ( not ( = ?auto_58407 ?auto_58403 ) ) ( AVAILABLE ?auto_58403 ) ( SURFACE-AT ?auto_58399 ?auto_58405 ) ( ON ?auto_58399 ?auto_58409 ) ( CLEAR ?auto_58399 ) ( not ( = ?auto_58399 ?auto_58409 ) ) ( not ( = ?auto_58400 ?auto_58409 ) ) ( IS-CRATE ?auto_58400 ) ( not ( = ?auto_58399 ?auto_58410 ) ) ( not ( = ?auto_58400 ?auto_58410 ) ) ( not ( = ?auto_58409 ?auto_58410 ) ) ( not ( = ?auto_58401 ?auto_58408 ) ) ( not ( = ?auto_58405 ?auto_58401 ) ) ( HOIST-AT ?auto_58406 ?auto_58401 ) ( not ( = ?auto_58407 ?auto_58406 ) ) ( not ( = ?auto_58403 ?auto_58406 ) ) ( AVAILABLE ?auto_58406 ) ( SURFACE-AT ?auto_58400 ?auto_58401 ) ( ON ?auto_58400 ?auto_58402 ) ( CLEAR ?auto_58400 ) ( not ( = ?auto_58399 ?auto_58402 ) ) ( not ( = ?auto_58400 ?auto_58402 ) ) ( not ( = ?auto_58409 ?auto_58402 ) ) ( not ( = ?auto_58410 ?auto_58402 ) ) ( SURFACE-AT ?auto_58411 ?auto_58408 ) ( CLEAR ?auto_58411 ) ( IS-CRATE ?auto_58410 ) ( not ( = ?auto_58399 ?auto_58411 ) ) ( not ( = ?auto_58400 ?auto_58411 ) ) ( not ( = ?auto_58409 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( not ( = ?auto_58402 ?auto_58411 ) ) ( AVAILABLE ?auto_58407 ) ( TRUCK-AT ?auto_58412 ?auto_58404 ) ( not ( = ?auto_58404 ?auto_58408 ) ) ( not ( = ?auto_58405 ?auto_58404 ) ) ( not ( = ?auto_58401 ?auto_58404 ) ) ( HOIST-AT ?auto_58413 ?auto_58404 ) ( LIFTING ?auto_58413 ?auto_58410 ) ( not ( = ?auto_58407 ?auto_58413 ) ) ( not ( = ?auto_58403 ?auto_58413 ) ) ( not ( = ?auto_58406 ?auto_58413 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58413 ?auto_58410 ?auto_58412 ?auto_58404 )
      ( MAKE-ON ?auto_58399 ?auto_58400 )
      ( MAKE-ON-VERIFY ?auto_58399 ?auto_58400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58414 - SURFACE
      ?auto_58415 - SURFACE
    )
    :vars
    (
      ?auto_58419 - HOIST
      ?auto_58422 - PLACE
      ?auto_58425 - PLACE
      ?auto_58424 - HOIST
      ?auto_58420 - SURFACE
      ?auto_58423 - SURFACE
      ?auto_58416 - PLACE
      ?auto_58421 - HOIST
      ?auto_58428 - SURFACE
      ?auto_58426 - SURFACE
      ?auto_58418 - TRUCK
      ?auto_58427 - PLACE
      ?auto_58417 - HOIST
      ?auto_58429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58419 ?auto_58422 ) ( IS-CRATE ?auto_58414 ) ( not ( = ?auto_58414 ?auto_58415 ) ) ( not ( = ?auto_58425 ?auto_58422 ) ) ( HOIST-AT ?auto_58424 ?auto_58425 ) ( not ( = ?auto_58419 ?auto_58424 ) ) ( AVAILABLE ?auto_58424 ) ( SURFACE-AT ?auto_58414 ?auto_58425 ) ( ON ?auto_58414 ?auto_58420 ) ( CLEAR ?auto_58414 ) ( not ( = ?auto_58414 ?auto_58420 ) ) ( not ( = ?auto_58415 ?auto_58420 ) ) ( IS-CRATE ?auto_58415 ) ( not ( = ?auto_58414 ?auto_58423 ) ) ( not ( = ?auto_58415 ?auto_58423 ) ) ( not ( = ?auto_58420 ?auto_58423 ) ) ( not ( = ?auto_58416 ?auto_58422 ) ) ( not ( = ?auto_58425 ?auto_58416 ) ) ( HOIST-AT ?auto_58421 ?auto_58416 ) ( not ( = ?auto_58419 ?auto_58421 ) ) ( not ( = ?auto_58424 ?auto_58421 ) ) ( AVAILABLE ?auto_58421 ) ( SURFACE-AT ?auto_58415 ?auto_58416 ) ( ON ?auto_58415 ?auto_58428 ) ( CLEAR ?auto_58415 ) ( not ( = ?auto_58414 ?auto_58428 ) ) ( not ( = ?auto_58415 ?auto_58428 ) ) ( not ( = ?auto_58420 ?auto_58428 ) ) ( not ( = ?auto_58423 ?auto_58428 ) ) ( SURFACE-AT ?auto_58426 ?auto_58422 ) ( CLEAR ?auto_58426 ) ( IS-CRATE ?auto_58423 ) ( not ( = ?auto_58414 ?auto_58426 ) ) ( not ( = ?auto_58415 ?auto_58426 ) ) ( not ( = ?auto_58420 ?auto_58426 ) ) ( not ( = ?auto_58423 ?auto_58426 ) ) ( not ( = ?auto_58428 ?auto_58426 ) ) ( AVAILABLE ?auto_58419 ) ( TRUCK-AT ?auto_58418 ?auto_58427 ) ( not ( = ?auto_58427 ?auto_58422 ) ) ( not ( = ?auto_58425 ?auto_58427 ) ) ( not ( = ?auto_58416 ?auto_58427 ) ) ( HOIST-AT ?auto_58417 ?auto_58427 ) ( not ( = ?auto_58419 ?auto_58417 ) ) ( not ( = ?auto_58424 ?auto_58417 ) ) ( not ( = ?auto_58421 ?auto_58417 ) ) ( AVAILABLE ?auto_58417 ) ( SURFACE-AT ?auto_58423 ?auto_58427 ) ( ON ?auto_58423 ?auto_58429 ) ( CLEAR ?auto_58423 ) ( not ( = ?auto_58414 ?auto_58429 ) ) ( not ( = ?auto_58415 ?auto_58429 ) ) ( not ( = ?auto_58420 ?auto_58429 ) ) ( not ( = ?auto_58423 ?auto_58429 ) ) ( not ( = ?auto_58428 ?auto_58429 ) ) ( not ( = ?auto_58426 ?auto_58429 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58417 ?auto_58423 ?auto_58429 ?auto_58427 )
      ( MAKE-ON ?auto_58414 ?auto_58415 )
      ( MAKE-ON-VERIFY ?auto_58414 ?auto_58415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58430 - SURFACE
      ?auto_58431 - SURFACE
    )
    :vars
    (
      ?auto_58432 - HOIST
      ?auto_58436 - PLACE
      ?auto_58443 - PLACE
      ?auto_58444 - HOIST
      ?auto_58438 - SURFACE
      ?auto_58435 - SURFACE
      ?auto_58445 - PLACE
      ?auto_58440 - HOIST
      ?auto_58437 - SURFACE
      ?auto_58439 - SURFACE
      ?auto_58434 - PLACE
      ?auto_58433 - HOIST
      ?auto_58441 - SURFACE
      ?auto_58442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58432 ?auto_58436 ) ( IS-CRATE ?auto_58430 ) ( not ( = ?auto_58430 ?auto_58431 ) ) ( not ( = ?auto_58443 ?auto_58436 ) ) ( HOIST-AT ?auto_58444 ?auto_58443 ) ( not ( = ?auto_58432 ?auto_58444 ) ) ( AVAILABLE ?auto_58444 ) ( SURFACE-AT ?auto_58430 ?auto_58443 ) ( ON ?auto_58430 ?auto_58438 ) ( CLEAR ?auto_58430 ) ( not ( = ?auto_58430 ?auto_58438 ) ) ( not ( = ?auto_58431 ?auto_58438 ) ) ( IS-CRATE ?auto_58431 ) ( not ( = ?auto_58430 ?auto_58435 ) ) ( not ( = ?auto_58431 ?auto_58435 ) ) ( not ( = ?auto_58438 ?auto_58435 ) ) ( not ( = ?auto_58445 ?auto_58436 ) ) ( not ( = ?auto_58443 ?auto_58445 ) ) ( HOIST-AT ?auto_58440 ?auto_58445 ) ( not ( = ?auto_58432 ?auto_58440 ) ) ( not ( = ?auto_58444 ?auto_58440 ) ) ( AVAILABLE ?auto_58440 ) ( SURFACE-AT ?auto_58431 ?auto_58445 ) ( ON ?auto_58431 ?auto_58437 ) ( CLEAR ?auto_58431 ) ( not ( = ?auto_58430 ?auto_58437 ) ) ( not ( = ?auto_58431 ?auto_58437 ) ) ( not ( = ?auto_58438 ?auto_58437 ) ) ( not ( = ?auto_58435 ?auto_58437 ) ) ( SURFACE-AT ?auto_58439 ?auto_58436 ) ( CLEAR ?auto_58439 ) ( IS-CRATE ?auto_58435 ) ( not ( = ?auto_58430 ?auto_58439 ) ) ( not ( = ?auto_58431 ?auto_58439 ) ) ( not ( = ?auto_58438 ?auto_58439 ) ) ( not ( = ?auto_58435 ?auto_58439 ) ) ( not ( = ?auto_58437 ?auto_58439 ) ) ( AVAILABLE ?auto_58432 ) ( not ( = ?auto_58434 ?auto_58436 ) ) ( not ( = ?auto_58443 ?auto_58434 ) ) ( not ( = ?auto_58445 ?auto_58434 ) ) ( HOIST-AT ?auto_58433 ?auto_58434 ) ( not ( = ?auto_58432 ?auto_58433 ) ) ( not ( = ?auto_58444 ?auto_58433 ) ) ( not ( = ?auto_58440 ?auto_58433 ) ) ( AVAILABLE ?auto_58433 ) ( SURFACE-AT ?auto_58435 ?auto_58434 ) ( ON ?auto_58435 ?auto_58441 ) ( CLEAR ?auto_58435 ) ( not ( = ?auto_58430 ?auto_58441 ) ) ( not ( = ?auto_58431 ?auto_58441 ) ) ( not ( = ?auto_58438 ?auto_58441 ) ) ( not ( = ?auto_58435 ?auto_58441 ) ) ( not ( = ?auto_58437 ?auto_58441 ) ) ( not ( = ?auto_58439 ?auto_58441 ) ) ( TRUCK-AT ?auto_58442 ?auto_58436 ) )
    :subtasks
    ( ( !DRIVE ?auto_58442 ?auto_58436 ?auto_58434 )
      ( MAKE-ON ?auto_58430 ?auto_58431 )
      ( MAKE-ON-VERIFY ?auto_58430 ?auto_58431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58446 - SURFACE
      ?auto_58447 - SURFACE
    )
    :vars
    (
      ?auto_58461 - HOIST
      ?auto_58457 - PLACE
      ?auto_58450 - PLACE
      ?auto_58456 - HOIST
      ?auto_58452 - SURFACE
      ?auto_58454 - SURFACE
      ?auto_58455 - PLACE
      ?auto_58449 - HOIST
      ?auto_58459 - SURFACE
      ?auto_58451 - SURFACE
      ?auto_58453 - PLACE
      ?auto_58448 - HOIST
      ?auto_58458 - SURFACE
      ?auto_58460 - TRUCK
      ?auto_58462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58461 ?auto_58457 ) ( IS-CRATE ?auto_58446 ) ( not ( = ?auto_58446 ?auto_58447 ) ) ( not ( = ?auto_58450 ?auto_58457 ) ) ( HOIST-AT ?auto_58456 ?auto_58450 ) ( not ( = ?auto_58461 ?auto_58456 ) ) ( AVAILABLE ?auto_58456 ) ( SURFACE-AT ?auto_58446 ?auto_58450 ) ( ON ?auto_58446 ?auto_58452 ) ( CLEAR ?auto_58446 ) ( not ( = ?auto_58446 ?auto_58452 ) ) ( not ( = ?auto_58447 ?auto_58452 ) ) ( IS-CRATE ?auto_58447 ) ( not ( = ?auto_58446 ?auto_58454 ) ) ( not ( = ?auto_58447 ?auto_58454 ) ) ( not ( = ?auto_58452 ?auto_58454 ) ) ( not ( = ?auto_58455 ?auto_58457 ) ) ( not ( = ?auto_58450 ?auto_58455 ) ) ( HOIST-AT ?auto_58449 ?auto_58455 ) ( not ( = ?auto_58461 ?auto_58449 ) ) ( not ( = ?auto_58456 ?auto_58449 ) ) ( AVAILABLE ?auto_58449 ) ( SURFACE-AT ?auto_58447 ?auto_58455 ) ( ON ?auto_58447 ?auto_58459 ) ( CLEAR ?auto_58447 ) ( not ( = ?auto_58446 ?auto_58459 ) ) ( not ( = ?auto_58447 ?auto_58459 ) ) ( not ( = ?auto_58452 ?auto_58459 ) ) ( not ( = ?auto_58454 ?auto_58459 ) ) ( IS-CRATE ?auto_58454 ) ( not ( = ?auto_58446 ?auto_58451 ) ) ( not ( = ?auto_58447 ?auto_58451 ) ) ( not ( = ?auto_58452 ?auto_58451 ) ) ( not ( = ?auto_58454 ?auto_58451 ) ) ( not ( = ?auto_58459 ?auto_58451 ) ) ( not ( = ?auto_58453 ?auto_58457 ) ) ( not ( = ?auto_58450 ?auto_58453 ) ) ( not ( = ?auto_58455 ?auto_58453 ) ) ( HOIST-AT ?auto_58448 ?auto_58453 ) ( not ( = ?auto_58461 ?auto_58448 ) ) ( not ( = ?auto_58456 ?auto_58448 ) ) ( not ( = ?auto_58449 ?auto_58448 ) ) ( AVAILABLE ?auto_58448 ) ( SURFACE-AT ?auto_58454 ?auto_58453 ) ( ON ?auto_58454 ?auto_58458 ) ( CLEAR ?auto_58454 ) ( not ( = ?auto_58446 ?auto_58458 ) ) ( not ( = ?auto_58447 ?auto_58458 ) ) ( not ( = ?auto_58452 ?auto_58458 ) ) ( not ( = ?auto_58454 ?auto_58458 ) ) ( not ( = ?auto_58459 ?auto_58458 ) ) ( not ( = ?auto_58451 ?auto_58458 ) ) ( TRUCK-AT ?auto_58460 ?auto_58457 ) ( SURFACE-AT ?auto_58462 ?auto_58457 ) ( CLEAR ?auto_58462 ) ( LIFTING ?auto_58461 ?auto_58451 ) ( IS-CRATE ?auto_58451 ) ( not ( = ?auto_58446 ?auto_58462 ) ) ( not ( = ?auto_58447 ?auto_58462 ) ) ( not ( = ?auto_58452 ?auto_58462 ) ) ( not ( = ?auto_58454 ?auto_58462 ) ) ( not ( = ?auto_58459 ?auto_58462 ) ) ( not ( = ?auto_58451 ?auto_58462 ) ) ( not ( = ?auto_58458 ?auto_58462 ) ) )
    :subtasks
    ( ( !DROP ?auto_58461 ?auto_58451 ?auto_58462 ?auto_58457 )
      ( MAKE-ON ?auto_58446 ?auto_58447 )
      ( MAKE-ON-VERIFY ?auto_58446 ?auto_58447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58463 - SURFACE
      ?auto_58464 - SURFACE
    )
    :vars
    (
      ?auto_58466 - HOIST
      ?auto_58478 - PLACE
      ?auto_58476 - PLACE
      ?auto_58471 - HOIST
      ?auto_58479 - SURFACE
      ?auto_58473 - SURFACE
      ?auto_58468 - PLACE
      ?auto_58465 - HOIST
      ?auto_58470 - SURFACE
      ?auto_58469 - SURFACE
      ?auto_58467 - PLACE
      ?auto_58477 - HOIST
      ?auto_58472 - SURFACE
      ?auto_58475 - TRUCK
      ?auto_58474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58466 ?auto_58478 ) ( IS-CRATE ?auto_58463 ) ( not ( = ?auto_58463 ?auto_58464 ) ) ( not ( = ?auto_58476 ?auto_58478 ) ) ( HOIST-AT ?auto_58471 ?auto_58476 ) ( not ( = ?auto_58466 ?auto_58471 ) ) ( AVAILABLE ?auto_58471 ) ( SURFACE-AT ?auto_58463 ?auto_58476 ) ( ON ?auto_58463 ?auto_58479 ) ( CLEAR ?auto_58463 ) ( not ( = ?auto_58463 ?auto_58479 ) ) ( not ( = ?auto_58464 ?auto_58479 ) ) ( IS-CRATE ?auto_58464 ) ( not ( = ?auto_58463 ?auto_58473 ) ) ( not ( = ?auto_58464 ?auto_58473 ) ) ( not ( = ?auto_58479 ?auto_58473 ) ) ( not ( = ?auto_58468 ?auto_58478 ) ) ( not ( = ?auto_58476 ?auto_58468 ) ) ( HOIST-AT ?auto_58465 ?auto_58468 ) ( not ( = ?auto_58466 ?auto_58465 ) ) ( not ( = ?auto_58471 ?auto_58465 ) ) ( AVAILABLE ?auto_58465 ) ( SURFACE-AT ?auto_58464 ?auto_58468 ) ( ON ?auto_58464 ?auto_58470 ) ( CLEAR ?auto_58464 ) ( not ( = ?auto_58463 ?auto_58470 ) ) ( not ( = ?auto_58464 ?auto_58470 ) ) ( not ( = ?auto_58479 ?auto_58470 ) ) ( not ( = ?auto_58473 ?auto_58470 ) ) ( IS-CRATE ?auto_58473 ) ( not ( = ?auto_58463 ?auto_58469 ) ) ( not ( = ?auto_58464 ?auto_58469 ) ) ( not ( = ?auto_58479 ?auto_58469 ) ) ( not ( = ?auto_58473 ?auto_58469 ) ) ( not ( = ?auto_58470 ?auto_58469 ) ) ( not ( = ?auto_58467 ?auto_58478 ) ) ( not ( = ?auto_58476 ?auto_58467 ) ) ( not ( = ?auto_58468 ?auto_58467 ) ) ( HOIST-AT ?auto_58477 ?auto_58467 ) ( not ( = ?auto_58466 ?auto_58477 ) ) ( not ( = ?auto_58471 ?auto_58477 ) ) ( not ( = ?auto_58465 ?auto_58477 ) ) ( AVAILABLE ?auto_58477 ) ( SURFACE-AT ?auto_58473 ?auto_58467 ) ( ON ?auto_58473 ?auto_58472 ) ( CLEAR ?auto_58473 ) ( not ( = ?auto_58463 ?auto_58472 ) ) ( not ( = ?auto_58464 ?auto_58472 ) ) ( not ( = ?auto_58479 ?auto_58472 ) ) ( not ( = ?auto_58473 ?auto_58472 ) ) ( not ( = ?auto_58470 ?auto_58472 ) ) ( not ( = ?auto_58469 ?auto_58472 ) ) ( TRUCK-AT ?auto_58475 ?auto_58478 ) ( SURFACE-AT ?auto_58474 ?auto_58478 ) ( CLEAR ?auto_58474 ) ( IS-CRATE ?auto_58469 ) ( not ( = ?auto_58463 ?auto_58474 ) ) ( not ( = ?auto_58464 ?auto_58474 ) ) ( not ( = ?auto_58479 ?auto_58474 ) ) ( not ( = ?auto_58473 ?auto_58474 ) ) ( not ( = ?auto_58470 ?auto_58474 ) ) ( not ( = ?auto_58469 ?auto_58474 ) ) ( not ( = ?auto_58472 ?auto_58474 ) ) ( AVAILABLE ?auto_58466 ) ( IN ?auto_58469 ?auto_58475 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58466 ?auto_58469 ?auto_58475 ?auto_58478 )
      ( MAKE-ON ?auto_58463 ?auto_58464 )
      ( MAKE-ON-VERIFY ?auto_58463 ?auto_58464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58480 - SURFACE
      ?auto_58481 - SURFACE
    )
    :vars
    (
      ?auto_58487 - HOIST
      ?auto_58489 - PLACE
      ?auto_58491 - PLACE
      ?auto_58485 - HOIST
      ?auto_58492 - SURFACE
      ?auto_58488 - SURFACE
      ?auto_58494 - PLACE
      ?auto_58493 - HOIST
      ?auto_58496 - SURFACE
      ?auto_58483 - SURFACE
      ?auto_58495 - PLACE
      ?auto_58482 - HOIST
      ?auto_58484 - SURFACE
      ?auto_58490 - SURFACE
      ?auto_58486 - TRUCK
      ?auto_58497 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58487 ?auto_58489 ) ( IS-CRATE ?auto_58480 ) ( not ( = ?auto_58480 ?auto_58481 ) ) ( not ( = ?auto_58491 ?auto_58489 ) ) ( HOIST-AT ?auto_58485 ?auto_58491 ) ( not ( = ?auto_58487 ?auto_58485 ) ) ( AVAILABLE ?auto_58485 ) ( SURFACE-AT ?auto_58480 ?auto_58491 ) ( ON ?auto_58480 ?auto_58492 ) ( CLEAR ?auto_58480 ) ( not ( = ?auto_58480 ?auto_58492 ) ) ( not ( = ?auto_58481 ?auto_58492 ) ) ( IS-CRATE ?auto_58481 ) ( not ( = ?auto_58480 ?auto_58488 ) ) ( not ( = ?auto_58481 ?auto_58488 ) ) ( not ( = ?auto_58492 ?auto_58488 ) ) ( not ( = ?auto_58494 ?auto_58489 ) ) ( not ( = ?auto_58491 ?auto_58494 ) ) ( HOIST-AT ?auto_58493 ?auto_58494 ) ( not ( = ?auto_58487 ?auto_58493 ) ) ( not ( = ?auto_58485 ?auto_58493 ) ) ( AVAILABLE ?auto_58493 ) ( SURFACE-AT ?auto_58481 ?auto_58494 ) ( ON ?auto_58481 ?auto_58496 ) ( CLEAR ?auto_58481 ) ( not ( = ?auto_58480 ?auto_58496 ) ) ( not ( = ?auto_58481 ?auto_58496 ) ) ( not ( = ?auto_58492 ?auto_58496 ) ) ( not ( = ?auto_58488 ?auto_58496 ) ) ( IS-CRATE ?auto_58488 ) ( not ( = ?auto_58480 ?auto_58483 ) ) ( not ( = ?auto_58481 ?auto_58483 ) ) ( not ( = ?auto_58492 ?auto_58483 ) ) ( not ( = ?auto_58488 ?auto_58483 ) ) ( not ( = ?auto_58496 ?auto_58483 ) ) ( not ( = ?auto_58495 ?auto_58489 ) ) ( not ( = ?auto_58491 ?auto_58495 ) ) ( not ( = ?auto_58494 ?auto_58495 ) ) ( HOIST-AT ?auto_58482 ?auto_58495 ) ( not ( = ?auto_58487 ?auto_58482 ) ) ( not ( = ?auto_58485 ?auto_58482 ) ) ( not ( = ?auto_58493 ?auto_58482 ) ) ( AVAILABLE ?auto_58482 ) ( SURFACE-AT ?auto_58488 ?auto_58495 ) ( ON ?auto_58488 ?auto_58484 ) ( CLEAR ?auto_58488 ) ( not ( = ?auto_58480 ?auto_58484 ) ) ( not ( = ?auto_58481 ?auto_58484 ) ) ( not ( = ?auto_58492 ?auto_58484 ) ) ( not ( = ?auto_58488 ?auto_58484 ) ) ( not ( = ?auto_58496 ?auto_58484 ) ) ( not ( = ?auto_58483 ?auto_58484 ) ) ( SURFACE-AT ?auto_58490 ?auto_58489 ) ( CLEAR ?auto_58490 ) ( IS-CRATE ?auto_58483 ) ( not ( = ?auto_58480 ?auto_58490 ) ) ( not ( = ?auto_58481 ?auto_58490 ) ) ( not ( = ?auto_58492 ?auto_58490 ) ) ( not ( = ?auto_58488 ?auto_58490 ) ) ( not ( = ?auto_58496 ?auto_58490 ) ) ( not ( = ?auto_58483 ?auto_58490 ) ) ( not ( = ?auto_58484 ?auto_58490 ) ) ( AVAILABLE ?auto_58487 ) ( IN ?auto_58483 ?auto_58486 ) ( TRUCK-AT ?auto_58486 ?auto_58497 ) ( not ( = ?auto_58497 ?auto_58489 ) ) ( not ( = ?auto_58491 ?auto_58497 ) ) ( not ( = ?auto_58494 ?auto_58497 ) ) ( not ( = ?auto_58495 ?auto_58497 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58486 ?auto_58497 ?auto_58489 )
      ( MAKE-ON ?auto_58480 ?auto_58481 )
      ( MAKE-ON-VERIFY ?auto_58480 ?auto_58481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58498 - SURFACE
      ?auto_58499 - SURFACE
    )
    :vars
    (
      ?auto_58504 - HOIST
      ?auto_58501 - PLACE
      ?auto_58513 - PLACE
      ?auto_58508 - HOIST
      ?auto_58507 - SURFACE
      ?auto_58509 - SURFACE
      ?auto_58503 - PLACE
      ?auto_58515 - HOIST
      ?auto_58500 - SURFACE
      ?auto_58506 - SURFACE
      ?auto_58502 - PLACE
      ?auto_58511 - HOIST
      ?auto_58505 - SURFACE
      ?auto_58510 - SURFACE
      ?auto_58514 - TRUCK
      ?auto_58512 - PLACE
      ?auto_58516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58504 ?auto_58501 ) ( IS-CRATE ?auto_58498 ) ( not ( = ?auto_58498 ?auto_58499 ) ) ( not ( = ?auto_58513 ?auto_58501 ) ) ( HOIST-AT ?auto_58508 ?auto_58513 ) ( not ( = ?auto_58504 ?auto_58508 ) ) ( AVAILABLE ?auto_58508 ) ( SURFACE-AT ?auto_58498 ?auto_58513 ) ( ON ?auto_58498 ?auto_58507 ) ( CLEAR ?auto_58498 ) ( not ( = ?auto_58498 ?auto_58507 ) ) ( not ( = ?auto_58499 ?auto_58507 ) ) ( IS-CRATE ?auto_58499 ) ( not ( = ?auto_58498 ?auto_58509 ) ) ( not ( = ?auto_58499 ?auto_58509 ) ) ( not ( = ?auto_58507 ?auto_58509 ) ) ( not ( = ?auto_58503 ?auto_58501 ) ) ( not ( = ?auto_58513 ?auto_58503 ) ) ( HOIST-AT ?auto_58515 ?auto_58503 ) ( not ( = ?auto_58504 ?auto_58515 ) ) ( not ( = ?auto_58508 ?auto_58515 ) ) ( AVAILABLE ?auto_58515 ) ( SURFACE-AT ?auto_58499 ?auto_58503 ) ( ON ?auto_58499 ?auto_58500 ) ( CLEAR ?auto_58499 ) ( not ( = ?auto_58498 ?auto_58500 ) ) ( not ( = ?auto_58499 ?auto_58500 ) ) ( not ( = ?auto_58507 ?auto_58500 ) ) ( not ( = ?auto_58509 ?auto_58500 ) ) ( IS-CRATE ?auto_58509 ) ( not ( = ?auto_58498 ?auto_58506 ) ) ( not ( = ?auto_58499 ?auto_58506 ) ) ( not ( = ?auto_58507 ?auto_58506 ) ) ( not ( = ?auto_58509 ?auto_58506 ) ) ( not ( = ?auto_58500 ?auto_58506 ) ) ( not ( = ?auto_58502 ?auto_58501 ) ) ( not ( = ?auto_58513 ?auto_58502 ) ) ( not ( = ?auto_58503 ?auto_58502 ) ) ( HOIST-AT ?auto_58511 ?auto_58502 ) ( not ( = ?auto_58504 ?auto_58511 ) ) ( not ( = ?auto_58508 ?auto_58511 ) ) ( not ( = ?auto_58515 ?auto_58511 ) ) ( AVAILABLE ?auto_58511 ) ( SURFACE-AT ?auto_58509 ?auto_58502 ) ( ON ?auto_58509 ?auto_58505 ) ( CLEAR ?auto_58509 ) ( not ( = ?auto_58498 ?auto_58505 ) ) ( not ( = ?auto_58499 ?auto_58505 ) ) ( not ( = ?auto_58507 ?auto_58505 ) ) ( not ( = ?auto_58509 ?auto_58505 ) ) ( not ( = ?auto_58500 ?auto_58505 ) ) ( not ( = ?auto_58506 ?auto_58505 ) ) ( SURFACE-AT ?auto_58510 ?auto_58501 ) ( CLEAR ?auto_58510 ) ( IS-CRATE ?auto_58506 ) ( not ( = ?auto_58498 ?auto_58510 ) ) ( not ( = ?auto_58499 ?auto_58510 ) ) ( not ( = ?auto_58507 ?auto_58510 ) ) ( not ( = ?auto_58509 ?auto_58510 ) ) ( not ( = ?auto_58500 ?auto_58510 ) ) ( not ( = ?auto_58506 ?auto_58510 ) ) ( not ( = ?auto_58505 ?auto_58510 ) ) ( AVAILABLE ?auto_58504 ) ( TRUCK-AT ?auto_58514 ?auto_58512 ) ( not ( = ?auto_58512 ?auto_58501 ) ) ( not ( = ?auto_58513 ?auto_58512 ) ) ( not ( = ?auto_58503 ?auto_58512 ) ) ( not ( = ?auto_58502 ?auto_58512 ) ) ( HOIST-AT ?auto_58516 ?auto_58512 ) ( LIFTING ?auto_58516 ?auto_58506 ) ( not ( = ?auto_58504 ?auto_58516 ) ) ( not ( = ?auto_58508 ?auto_58516 ) ) ( not ( = ?auto_58515 ?auto_58516 ) ) ( not ( = ?auto_58511 ?auto_58516 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58516 ?auto_58506 ?auto_58514 ?auto_58512 )
      ( MAKE-ON ?auto_58498 ?auto_58499 )
      ( MAKE-ON-VERIFY ?auto_58498 ?auto_58499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58517 - SURFACE
      ?auto_58518 - SURFACE
    )
    :vars
    (
      ?auto_58523 - HOIST
      ?auto_58533 - PLACE
      ?auto_58530 - PLACE
      ?auto_58529 - HOIST
      ?auto_58532 - SURFACE
      ?auto_58521 - SURFACE
      ?auto_58525 - PLACE
      ?auto_58528 - HOIST
      ?auto_58535 - SURFACE
      ?auto_58534 - SURFACE
      ?auto_58531 - PLACE
      ?auto_58520 - HOIST
      ?auto_58522 - SURFACE
      ?auto_58524 - SURFACE
      ?auto_58519 - TRUCK
      ?auto_58527 - PLACE
      ?auto_58526 - HOIST
      ?auto_58536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58523 ?auto_58533 ) ( IS-CRATE ?auto_58517 ) ( not ( = ?auto_58517 ?auto_58518 ) ) ( not ( = ?auto_58530 ?auto_58533 ) ) ( HOIST-AT ?auto_58529 ?auto_58530 ) ( not ( = ?auto_58523 ?auto_58529 ) ) ( AVAILABLE ?auto_58529 ) ( SURFACE-AT ?auto_58517 ?auto_58530 ) ( ON ?auto_58517 ?auto_58532 ) ( CLEAR ?auto_58517 ) ( not ( = ?auto_58517 ?auto_58532 ) ) ( not ( = ?auto_58518 ?auto_58532 ) ) ( IS-CRATE ?auto_58518 ) ( not ( = ?auto_58517 ?auto_58521 ) ) ( not ( = ?auto_58518 ?auto_58521 ) ) ( not ( = ?auto_58532 ?auto_58521 ) ) ( not ( = ?auto_58525 ?auto_58533 ) ) ( not ( = ?auto_58530 ?auto_58525 ) ) ( HOIST-AT ?auto_58528 ?auto_58525 ) ( not ( = ?auto_58523 ?auto_58528 ) ) ( not ( = ?auto_58529 ?auto_58528 ) ) ( AVAILABLE ?auto_58528 ) ( SURFACE-AT ?auto_58518 ?auto_58525 ) ( ON ?auto_58518 ?auto_58535 ) ( CLEAR ?auto_58518 ) ( not ( = ?auto_58517 ?auto_58535 ) ) ( not ( = ?auto_58518 ?auto_58535 ) ) ( not ( = ?auto_58532 ?auto_58535 ) ) ( not ( = ?auto_58521 ?auto_58535 ) ) ( IS-CRATE ?auto_58521 ) ( not ( = ?auto_58517 ?auto_58534 ) ) ( not ( = ?auto_58518 ?auto_58534 ) ) ( not ( = ?auto_58532 ?auto_58534 ) ) ( not ( = ?auto_58521 ?auto_58534 ) ) ( not ( = ?auto_58535 ?auto_58534 ) ) ( not ( = ?auto_58531 ?auto_58533 ) ) ( not ( = ?auto_58530 ?auto_58531 ) ) ( not ( = ?auto_58525 ?auto_58531 ) ) ( HOIST-AT ?auto_58520 ?auto_58531 ) ( not ( = ?auto_58523 ?auto_58520 ) ) ( not ( = ?auto_58529 ?auto_58520 ) ) ( not ( = ?auto_58528 ?auto_58520 ) ) ( AVAILABLE ?auto_58520 ) ( SURFACE-AT ?auto_58521 ?auto_58531 ) ( ON ?auto_58521 ?auto_58522 ) ( CLEAR ?auto_58521 ) ( not ( = ?auto_58517 ?auto_58522 ) ) ( not ( = ?auto_58518 ?auto_58522 ) ) ( not ( = ?auto_58532 ?auto_58522 ) ) ( not ( = ?auto_58521 ?auto_58522 ) ) ( not ( = ?auto_58535 ?auto_58522 ) ) ( not ( = ?auto_58534 ?auto_58522 ) ) ( SURFACE-AT ?auto_58524 ?auto_58533 ) ( CLEAR ?auto_58524 ) ( IS-CRATE ?auto_58534 ) ( not ( = ?auto_58517 ?auto_58524 ) ) ( not ( = ?auto_58518 ?auto_58524 ) ) ( not ( = ?auto_58532 ?auto_58524 ) ) ( not ( = ?auto_58521 ?auto_58524 ) ) ( not ( = ?auto_58535 ?auto_58524 ) ) ( not ( = ?auto_58534 ?auto_58524 ) ) ( not ( = ?auto_58522 ?auto_58524 ) ) ( AVAILABLE ?auto_58523 ) ( TRUCK-AT ?auto_58519 ?auto_58527 ) ( not ( = ?auto_58527 ?auto_58533 ) ) ( not ( = ?auto_58530 ?auto_58527 ) ) ( not ( = ?auto_58525 ?auto_58527 ) ) ( not ( = ?auto_58531 ?auto_58527 ) ) ( HOIST-AT ?auto_58526 ?auto_58527 ) ( not ( = ?auto_58523 ?auto_58526 ) ) ( not ( = ?auto_58529 ?auto_58526 ) ) ( not ( = ?auto_58528 ?auto_58526 ) ) ( not ( = ?auto_58520 ?auto_58526 ) ) ( AVAILABLE ?auto_58526 ) ( SURFACE-AT ?auto_58534 ?auto_58527 ) ( ON ?auto_58534 ?auto_58536 ) ( CLEAR ?auto_58534 ) ( not ( = ?auto_58517 ?auto_58536 ) ) ( not ( = ?auto_58518 ?auto_58536 ) ) ( not ( = ?auto_58532 ?auto_58536 ) ) ( not ( = ?auto_58521 ?auto_58536 ) ) ( not ( = ?auto_58535 ?auto_58536 ) ) ( not ( = ?auto_58534 ?auto_58536 ) ) ( not ( = ?auto_58522 ?auto_58536 ) ) ( not ( = ?auto_58524 ?auto_58536 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58526 ?auto_58534 ?auto_58536 ?auto_58527 )
      ( MAKE-ON ?auto_58517 ?auto_58518 )
      ( MAKE-ON-VERIFY ?auto_58517 ?auto_58518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58537 - SURFACE
      ?auto_58538 - SURFACE
    )
    :vars
    (
      ?auto_58552 - HOIST
      ?auto_58548 - PLACE
      ?auto_58550 - PLACE
      ?auto_58543 - HOIST
      ?auto_58546 - SURFACE
      ?auto_58547 - SURFACE
      ?auto_58549 - PLACE
      ?auto_58555 - HOIST
      ?auto_58554 - SURFACE
      ?auto_58553 - SURFACE
      ?auto_58544 - PLACE
      ?auto_58545 - HOIST
      ?auto_58551 - SURFACE
      ?auto_58541 - SURFACE
      ?auto_58556 - PLACE
      ?auto_58540 - HOIST
      ?auto_58539 - SURFACE
      ?auto_58542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58552 ?auto_58548 ) ( IS-CRATE ?auto_58537 ) ( not ( = ?auto_58537 ?auto_58538 ) ) ( not ( = ?auto_58550 ?auto_58548 ) ) ( HOIST-AT ?auto_58543 ?auto_58550 ) ( not ( = ?auto_58552 ?auto_58543 ) ) ( AVAILABLE ?auto_58543 ) ( SURFACE-AT ?auto_58537 ?auto_58550 ) ( ON ?auto_58537 ?auto_58546 ) ( CLEAR ?auto_58537 ) ( not ( = ?auto_58537 ?auto_58546 ) ) ( not ( = ?auto_58538 ?auto_58546 ) ) ( IS-CRATE ?auto_58538 ) ( not ( = ?auto_58537 ?auto_58547 ) ) ( not ( = ?auto_58538 ?auto_58547 ) ) ( not ( = ?auto_58546 ?auto_58547 ) ) ( not ( = ?auto_58549 ?auto_58548 ) ) ( not ( = ?auto_58550 ?auto_58549 ) ) ( HOIST-AT ?auto_58555 ?auto_58549 ) ( not ( = ?auto_58552 ?auto_58555 ) ) ( not ( = ?auto_58543 ?auto_58555 ) ) ( AVAILABLE ?auto_58555 ) ( SURFACE-AT ?auto_58538 ?auto_58549 ) ( ON ?auto_58538 ?auto_58554 ) ( CLEAR ?auto_58538 ) ( not ( = ?auto_58537 ?auto_58554 ) ) ( not ( = ?auto_58538 ?auto_58554 ) ) ( not ( = ?auto_58546 ?auto_58554 ) ) ( not ( = ?auto_58547 ?auto_58554 ) ) ( IS-CRATE ?auto_58547 ) ( not ( = ?auto_58537 ?auto_58553 ) ) ( not ( = ?auto_58538 ?auto_58553 ) ) ( not ( = ?auto_58546 ?auto_58553 ) ) ( not ( = ?auto_58547 ?auto_58553 ) ) ( not ( = ?auto_58554 ?auto_58553 ) ) ( not ( = ?auto_58544 ?auto_58548 ) ) ( not ( = ?auto_58550 ?auto_58544 ) ) ( not ( = ?auto_58549 ?auto_58544 ) ) ( HOIST-AT ?auto_58545 ?auto_58544 ) ( not ( = ?auto_58552 ?auto_58545 ) ) ( not ( = ?auto_58543 ?auto_58545 ) ) ( not ( = ?auto_58555 ?auto_58545 ) ) ( AVAILABLE ?auto_58545 ) ( SURFACE-AT ?auto_58547 ?auto_58544 ) ( ON ?auto_58547 ?auto_58551 ) ( CLEAR ?auto_58547 ) ( not ( = ?auto_58537 ?auto_58551 ) ) ( not ( = ?auto_58538 ?auto_58551 ) ) ( not ( = ?auto_58546 ?auto_58551 ) ) ( not ( = ?auto_58547 ?auto_58551 ) ) ( not ( = ?auto_58554 ?auto_58551 ) ) ( not ( = ?auto_58553 ?auto_58551 ) ) ( SURFACE-AT ?auto_58541 ?auto_58548 ) ( CLEAR ?auto_58541 ) ( IS-CRATE ?auto_58553 ) ( not ( = ?auto_58537 ?auto_58541 ) ) ( not ( = ?auto_58538 ?auto_58541 ) ) ( not ( = ?auto_58546 ?auto_58541 ) ) ( not ( = ?auto_58547 ?auto_58541 ) ) ( not ( = ?auto_58554 ?auto_58541 ) ) ( not ( = ?auto_58553 ?auto_58541 ) ) ( not ( = ?auto_58551 ?auto_58541 ) ) ( AVAILABLE ?auto_58552 ) ( not ( = ?auto_58556 ?auto_58548 ) ) ( not ( = ?auto_58550 ?auto_58556 ) ) ( not ( = ?auto_58549 ?auto_58556 ) ) ( not ( = ?auto_58544 ?auto_58556 ) ) ( HOIST-AT ?auto_58540 ?auto_58556 ) ( not ( = ?auto_58552 ?auto_58540 ) ) ( not ( = ?auto_58543 ?auto_58540 ) ) ( not ( = ?auto_58555 ?auto_58540 ) ) ( not ( = ?auto_58545 ?auto_58540 ) ) ( AVAILABLE ?auto_58540 ) ( SURFACE-AT ?auto_58553 ?auto_58556 ) ( ON ?auto_58553 ?auto_58539 ) ( CLEAR ?auto_58553 ) ( not ( = ?auto_58537 ?auto_58539 ) ) ( not ( = ?auto_58538 ?auto_58539 ) ) ( not ( = ?auto_58546 ?auto_58539 ) ) ( not ( = ?auto_58547 ?auto_58539 ) ) ( not ( = ?auto_58554 ?auto_58539 ) ) ( not ( = ?auto_58553 ?auto_58539 ) ) ( not ( = ?auto_58551 ?auto_58539 ) ) ( not ( = ?auto_58541 ?auto_58539 ) ) ( TRUCK-AT ?auto_58542 ?auto_58548 ) )
    :subtasks
    ( ( !DRIVE ?auto_58542 ?auto_58548 ?auto_58556 )
      ( MAKE-ON ?auto_58537 ?auto_58538 )
      ( MAKE-ON-VERIFY ?auto_58537 ?auto_58538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58557 - SURFACE
      ?auto_58558 - SURFACE
    )
    :vars
    (
      ?auto_58572 - HOIST
      ?auto_58564 - PLACE
      ?auto_58562 - PLACE
      ?auto_58560 - HOIST
      ?auto_58561 - SURFACE
      ?auto_58569 - SURFACE
      ?auto_58563 - PLACE
      ?auto_58573 - HOIST
      ?auto_58575 - SURFACE
      ?auto_58565 - SURFACE
      ?auto_58559 - PLACE
      ?auto_58568 - HOIST
      ?auto_58576 - SURFACE
      ?auto_58571 - SURFACE
      ?auto_58574 - PLACE
      ?auto_58567 - HOIST
      ?auto_58566 - SURFACE
      ?auto_58570 - TRUCK
      ?auto_58577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58572 ?auto_58564 ) ( IS-CRATE ?auto_58557 ) ( not ( = ?auto_58557 ?auto_58558 ) ) ( not ( = ?auto_58562 ?auto_58564 ) ) ( HOIST-AT ?auto_58560 ?auto_58562 ) ( not ( = ?auto_58572 ?auto_58560 ) ) ( AVAILABLE ?auto_58560 ) ( SURFACE-AT ?auto_58557 ?auto_58562 ) ( ON ?auto_58557 ?auto_58561 ) ( CLEAR ?auto_58557 ) ( not ( = ?auto_58557 ?auto_58561 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( IS-CRATE ?auto_58558 ) ( not ( = ?auto_58557 ?auto_58569 ) ) ( not ( = ?auto_58558 ?auto_58569 ) ) ( not ( = ?auto_58561 ?auto_58569 ) ) ( not ( = ?auto_58563 ?auto_58564 ) ) ( not ( = ?auto_58562 ?auto_58563 ) ) ( HOIST-AT ?auto_58573 ?auto_58563 ) ( not ( = ?auto_58572 ?auto_58573 ) ) ( not ( = ?auto_58560 ?auto_58573 ) ) ( AVAILABLE ?auto_58573 ) ( SURFACE-AT ?auto_58558 ?auto_58563 ) ( ON ?auto_58558 ?auto_58575 ) ( CLEAR ?auto_58558 ) ( not ( = ?auto_58557 ?auto_58575 ) ) ( not ( = ?auto_58558 ?auto_58575 ) ) ( not ( = ?auto_58561 ?auto_58575 ) ) ( not ( = ?auto_58569 ?auto_58575 ) ) ( IS-CRATE ?auto_58569 ) ( not ( = ?auto_58557 ?auto_58565 ) ) ( not ( = ?auto_58558 ?auto_58565 ) ) ( not ( = ?auto_58561 ?auto_58565 ) ) ( not ( = ?auto_58569 ?auto_58565 ) ) ( not ( = ?auto_58575 ?auto_58565 ) ) ( not ( = ?auto_58559 ?auto_58564 ) ) ( not ( = ?auto_58562 ?auto_58559 ) ) ( not ( = ?auto_58563 ?auto_58559 ) ) ( HOIST-AT ?auto_58568 ?auto_58559 ) ( not ( = ?auto_58572 ?auto_58568 ) ) ( not ( = ?auto_58560 ?auto_58568 ) ) ( not ( = ?auto_58573 ?auto_58568 ) ) ( AVAILABLE ?auto_58568 ) ( SURFACE-AT ?auto_58569 ?auto_58559 ) ( ON ?auto_58569 ?auto_58576 ) ( CLEAR ?auto_58569 ) ( not ( = ?auto_58557 ?auto_58576 ) ) ( not ( = ?auto_58558 ?auto_58576 ) ) ( not ( = ?auto_58561 ?auto_58576 ) ) ( not ( = ?auto_58569 ?auto_58576 ) ) ( not ( = ?auto_58575 ?auto_58576 ) ) ( not ( = ?auto_58565 ?auto_58576 ) ) ( IS-CRATE ?auto_58565 ) ( not ( = ?auto_58557 ?auto_58571 ) ) ( not ( = ?auto_58558 ?auto_58571 ) ) ( not ( = ?auto_58561 ?auto_58571 ) ) ( not ( = ?auto_58569 ?auto_58571 ) ) ( not ( = ?auto_58575 ?auto_58571 ) ) ( not ( = ?auto_58565 ?auto_58571 ) ) ( not ( = ?auto_58576 ?auto_58571 ) ) ( not ( = ?auto_58574 ?auto_58564 ) ) ( not ( = ?auto_58562 ?auto_58574 ) ) ( not ( = ?auto_58563 ?auto_58574 ) ) ( not ( = ?auto_58559 ?auto_58574 ) ) ( HOIST-AT ?auto_58567 ?auto_58574 ) ( not ( = ?auto_58572 ?auto_58567 ) ) ( not ( = ?auto_58560 ?auto_58567 ) ) ( not ( = ?auto_58573 ?auto_58567 ) ) ( not ( = ?auto_58568 ?auto_58567 ) ) ( AVAILABLE ?auto_58567 ) ( SURFACE-AT ?auto_58565 ?auto_58574 ) ( ON ?auto_58565 ?auto_58566 ) ( CLEAR ?auto_58565 ) ( not ( = ?auto_58557 ?auto_58566 ) ) ( not ( = ?auto_58558 ?auto_58566 ) ) ( not ( = ?auto_58561 ?auto_58566 ) ) ( not ( = ?auto_58569 ?auto_58566 ) ) ( not ( = ?auto_58575 ?auto_58566 ) ) ( not ( = ?auto_58565 ?auto_58566 ) ) ( not ( = ?auto_58576 ?auto_58566 ) ) ( not ( = ?auto_58571 ?auto_58566 ) ) ( TRUCK-AT ?auto_58570 ?auto_58564 ) ( SURFACE-AT ?auto_58577 ?auto_58564 ) ( CLEAR ?auto_58577 ) ( LIFTING ?auto_58572 ?auto_58571 ) ( IS-CRATE ?auto_58571 ) ( not ( = ?auto_58557 ?auto_58577 ) ) ( not ( = ?auto_58558 ?auto_58577 ) ) ( not ( = ?auto_58561 ?auto_58577 ) ) ( not ( = ?auto_58569 ?auto_58577 ) ) ( not ( = ?auto_58575 ?auto_58577 ) ) ( not ( = ?auto_58565 ?auto_58577 ) ) ( not ( = ?auto_58576 ?auto_58577 ) ) ( not ( = ?auto_58571 ?auto_58577 ) ) ( not ( = ?auto_58566 ?auto_58577 ) ) )
    :subtasks
    ( ( !DROP ?auto_58572 ?auto_58571 ?auto_58577 ?auto_58564 )
      ( MAKE-ON ?auto_58557 ?auto_58558 )
      ( MAKE-ON-VERIFY ?auto_58557 ?auto_58558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58578 - SURFACE
      ?auto_58579 - SURFACE
    )
    :vars
    (
      ?auto_58584 - HOIST
      ?auto_58582 - PLACE
      ?auto_58595 - PLACE
      ?auto_58593 - HOIST
      ?auto_58594 - SURFACE
      ?auto_58583 - SURFACE
      ?auto_58596 - PLACE
      ?auto_58580 - HOIST
      ?auto_58589 - SURFACE
      ?auto_58592 - SURFACE
      ?auto_58591 - PLACE
      ?auto_58581 - HOIST
      ?auto_58590 - SURFACE
      ?auto_58598 - SURFACE
      ?auto_58597 - PLACE
      ?auto_58587 - HOIST
      ?auto_58585 - SURFACE
      ?auto_58586 - TRUCK
      ?auto_58588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58584 ?auto_58582 ) ( IS-CRATE ?auto_58578 ) ( not ( = ?auto_58578 ?auto_58579 ) ) ( not ( = ?auto_58595 ?auto_58582 ) ) ( HOIST-AT ?auto_58593 ?auto_58595 ) ( not ( = ?auto_58584 ?auto_58593 ) ) ( AVAILABLE ?auto_58593 ) ( SURFACE-AT ?auto_58578 ?auto_58595 ) ( ON ?auto_58578 ?auto_58594 ) ( CLEAR ?auto_58578 ) ( not ( = ?auto_58578 ?auto_58594 ) ) ( not ( = ?auto_58579 ?auto_58594 ) ) ( IS-CRATE ?auto_58579 ) ( not ( = ?auto_58578 ?auto_58583 ) ) ( not ( = ?auto_58579 ?auto_58583 ) ) ( not ( = ?auto_58594 ?auto_58583 ) ) ( not ( = ?auto_58596 ?auto_58582 ) ) ( not ( = ?auto_58595 ?auto_58596 ) ) ( HOIST-AT ?auto_58580 ?auto_58596 ) ( not ( = ?auto_58584 ?auto_58580 ) ) ( not ( = ?auto_58593 ?auto_58580 ) ) ( AVAILABLE ?auto_58580 ) ( SURFACE-AT ?auto_58579 ?auto_58596 ) ( ON ?auto_58579 ?auto_58589 ) ( CLEAR ?auto_58579 ) ( not ( = ?auto_58578 ?auto_58589 ) ) ( not ( = ?auto_58579 ?auto_58589 ) ) ( not ( = ?auto_58594 ?auto_58589 ) ) ( not ( = ?auto_58583 ?auto_58589 ) ) ( IS-CRATE ?auto_58583 ) ( not ( = ?auto_58578 ?auto_58592 ) ) ( not ( = ?auto_58579 ?auto_58592 ) ) ( not ( = ?auto_58594 ?auto_58592 ) ) ( not ( = ?auto_58583 ?auto_58592 ) ) ( not ( = ?auto_58589 ?auto_58592 ) ) ( not ( = ?auto_58591 ?auto_58582 ) ) ( not ( = ?auto_58595 ?auto_58591 ) ) ( not ( = ?auto_58596 ?auto_58591 ) ) ( HOIST-AT ?auto_58581 ?auto_58591 ) ( not ( = ?auto_58584 ?auto_58581 ) ) ( not ( = ?auto_58593 ?auto_58581 ) ) ( not ( = ?auto_58580 ?auto_58581 ) ) ( AVAILABLE ?auto_58581 ) ( SURFACE-AT ?auto_58583 ?auto_58591 ) ( ON ?auto_58583 ?auto_58590 ) ( CLEAR ?auto_58583 ) ( not ( = ?auto_58578 ?auto_58590 ) ) ( not ( = ?auto_58579 ?auto_58590 ) ) ( not ( = ?auto_58594 ?auto_58590 ) ) ( not ( = ?auto_58583 ?auto_58590 ) ) ( not ( = ?auto_58589 ?auto_58590 ) ) ( not ( = ?auto_58592 ?auto_58590 ) ) ( IS-CRATE ?auto_58592 ) ( not ( = ?auto_58578 ?auto_58598 ) ) ( not ( = ?auto_58579 ?auto_58598 ) ) ( not ( = ?auto_58594 ?auto_58598 ) ) ( not ( = ?auto_58583 ?auto_58598 ) ) ( not ( = ?auto_58589 ?auto_58598 ) ) ( not ( = ?auto_58592 ?auto_58598 ) ) ( not ( = ?auto_58590 ?auto_58598 ) ) ( not ( = ?auto_58597 ?auto_58582 ) ) ( not ( = ?auto_58595 ?auto_58597 ) ) ( not ( = ?auto_58596 ?auto_58597 ) ) ( not ( = ?auto_58591 ?auto_58597 ) ) ( HOIST-AT ?auto_58587 ?auto_58597 ) ( not ( = ?auto_58584 ?auto_58587 ) ) ( not ( = ?auto_58593 ?auto_58587 ) ) ( not ( = ?auto_58580 ?auto_58587 ) ) ( not ( = ?auto_58581 ?auto_58587 ) ) ( AVAILABLE ?auto_58587 ) ( SURFACE-AT ?auto_58592 ?auto_58597 ) ( ON ?auto_58592 ?auto_58585 ) ( CLEAR ?auto_58592 ) ( not ( = ?auto_58578 ?auto_58585 ) ) ( not ( = ?auto_58579 ?auto_58585 ) ) ( not ( = ?auto_58594 ?auto_58585 ) ) ( not ( = ?auto_58583 ?auto_58585 ) ) ( not ( = ?auto_58589 ?auto_58585 ) ) ( not ( = ?auto_58592 ?auto_58585 ) ) ( not ( = ?auto_58590 ?auto_58585 ) ) ( not ( = ?auto_58598 ?auto_58585 ) ) ( TRUCK-AT ?auto_58586 ?auto_58582 ) ( SURFACE-AT ?auto_58588 ?auto_58582 ) ( CLEAR ?auto_58588 ) ( IS-CRATE ?auto_58598 ) ( not ( = ?auto_58578 ?auto_58588 ) ) ( not ( = ?auto_58579 ?auto_58588 ) ) ( not ( = ?auto_58594 ?auto_58588 ) ) ( not ( = ?auto_58583 ?auto_58588 ) ) ( not ( = ?auto_58589 ?auto_58588 ) ) ( not ( = ?auto_58592 ?auto_58588 ) ) ( not ( = ?auto_58590 ?auto_58588 ) ) ( not ( = ?auto_58598 ?auto_58588 ) ) ( not ( = ?auto_58585 ?auto_58588 ) ) ( AVAILABLE ?auto_58584 ) ( IN ?auto_58598 ?auto_58586 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58584 ?auto_58598 ?auto_58586 ?auto_58582 )
      ( MAKE-ON ?auto_58578 ?auto_58579 )
      ( MAKE-ON-VERIFY ?auto_58578 ?auto_58579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58599 - SURFACE
      ?auto_58600 - SURFACE
    )
    :vars
    (
      ?auto_58618 - HOIST
      ?auto_58619 - PLACE
      ?auto_58610 - PLACE
      ?auto_58616 - HOIST
      ?auto_58606 - SURFACE
      ?auto_58605 - SURFACE
      ?auto_58607 - PLACE
      ?auto_58601 - HOIST
      ?auto_58615 - SURFACE
      ?auto_58611 - SURFACE
      ?auto_58614 - PLACE
      ?auto_58617 - HOIST
      ?auto_58604 - SURFACE
      ?auto_58609 - SURFACE
      ?auto_58608 - PLACE
      ?auto_58612 - HOIST
      ?auto_58603 - SURFACE
      ?auto_58613 - SURFACE
      ?auto_58602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58618 ?auto_58619 ) ( IS-CRATE ?auto_58599 ) ( not ( = ?auto_58599 ?auto_58600 ) ) ( not ( = ?auto_58610 ?auto_58619 ) ) ( HOIST-AT ?auto_58616 ?auto_58610 ) ( not ( = ?auto_58618 ?auto_58616 ) ) ( AVAILABLE ?auto_58616 ) ( SURFACE-AT ?auto_58599 ?auto_58610 ) ( ON ?auto_58599 ?auto_58606 ) ( CLEAR ?auto_58599 ) ( not ( = ?auto_58599 ?auto_58606 ) ) ( not ( = ?auto_58600 ?auto_58606 ) ) ( IS-CRATE ?auto_58600 ) ( not ( = ?auto_58599 ?auto_58605 ) ) ( not ( = ?auto_58600 ?auto_58605 ) ) ( not ( = ?auto_58606 ?auto_58605 ) ) ( not ( = ?auto_58607 ?auto_58619 ) ) ( not ( = ?auto_58610 ?auto_58607 ) ) ( HOIST-AT ?auto_58601 ?auto_58607 ) ( not ( = ?auto_58618 ?auto_58601 ) ) ( not ( = ?auto_58616 ?auto_58601 ) ) ( AVAILABLE ?auto_58601 ) ( SURFACE-AT ?auto_58600 ?auto_58607 ) ( ON ?auto_58600 ?auto_58615 ) ( CLEAR ?auto_58600 ) ( not ( = ?auto_58599 ?auto_58615 ) ) ( not ( = ?auto_58600 ?auto_58615 ) ) ( not ( = ?auto_58606 ?auto_58615 ) ) ( not ( = ?auto_58605 ?auto_58615 ) ) ( IS-CRATE ?auto_58605 ) ( not ( = ?auto_58599 ?auto_58611 ) ) ( not ( = ?auto_58600 ?auto_58611 ) ) ( not ( = ?auto_58606 ?auto_58611 ) ) ( not ( = ?auto_58605 ?auto_58611 ) ) ( not ( = ?auto_58615 ?auto_58611 ) ) ( not ( = ?auto_58614 ?auto_58619 ) ) ( not ( = ?auto_58610 ?auto_58614 ) ) ( not ( = ?auto_58607 ?auto_58614 ) ) ( HOIST-AT ?auto_58617 ?auto_58614 ) ( not ( = ?auto_58618 ?auto_58617 ) ) ( not ( = ?auto_58616 ?auto_58617 ) ) ( not ( = ?auto_58601 ?auto_58617 ) ) ( AVAILABLE ?auto_58617 ) ( SURFACE-AT ?auto_58605 ?auto_58614 ) ( ON ?auto_58605 ?auto_58604 ) ( CLEAR ?auto_58605 ) ( not ( = ?auto_58599 ?auto_58604 ) ) ( not ( = ?auto_58600 ?auto_58604 ) ) ( not ( = ?auto_58606 ?auto_58604 ) ) ( not ( = ?auto_58605 ?auto_58604 ) ) ( not ( = ?auto_58615 ?auto_58604 ) ) ( not ( = ?auto_58611 ?auto_58604 ) ) ( IS-CRATE ?auto_58611 ) ( not ( = ?auto_58599 ?auto_58609 ) ) ( not ( = ?auto_58600 ?auto_58609 ) ) ( not ( = ?auto_58606 ?auto_58609 ) ) ( not ( = ?auto_58605 ?auto_58609 ) ) ( not ( = ?auto_58615 ?auto_58609 ) ) ( not ( = ?auto_58611 ?auto_58609 ) ) ( not ( = ?auto_58604 ?auto_58609 ) ) ( not ( = ?auto_58608 ?auto_58619 ) ) ( not ( = ?auto_58610 ?auto_58608 ) ) ( not ( = ?auto_58607 ?auto_58608 ) ) ( not ( = ?auto_58614 ?auto_58608 ) ) ( HOIST-AT ?auto_58612 ?auto_58608 ) ( not ( = ?auto_58618 ?auto_58612 ) ) ( not ( = ?auto_58616 ?auto_58612 ) ) ( not ( = ?auto_58601 ?auto_58612 ) ) ( not ( = ?auto_58617 ?auto_58612 ) ) ( AVAILABLE ?auto_58612 ) ( SURFACE-AT ?auto_58611 ?auto_58608 ) ( ON ?auto_58611 ?auto_58603 ) ( CLEAR ?auto_58611 ) ( not ( = ?auto_58599 ?auto_58603 ) ) ( not ( = ?auto_58600 ?auto_58603 ) ) ( not ( = ?auto_58606 ?auto_58603 ) ) ( not ( = ?auto_58605 ?auto_58603 ) ) ( not ( = ?auto_58615 ?auto_58603 ) ) ( not ( = ?auto_58611 ?auto_58603 ) ) ( not ( = ?auto_58604 ?auto_58603 ) ) ( not ( = ?auto_58609 ?auto_58603 ) ) ( SURFACE-AT ?auto_58613 ?auto_58619 ) ( CLEAR ?auto_58613 ) ( IS-CRATE ?auto_58609 ) ( not ( = ?auto_58599 ?auto_58613 ) ) ( not ( = ?auto_58600 ?auto_58613 ) ) ( not ( = ?auto_58606 ?auto_58613 ) ) ( not ( = ?auto_58605 ?auto_58613 ) ) ( not ( = ?auto_58615 ?auto_58613 ) ) ( not ( = ?auto_58611 ?auto_58613 ) ) ( not ( = ?auto_58604 ?auto_58613 ) ) ( not ( = ?auto_58609 ?auto_58613 ) ) ( not ( = ?auto_58603 ?auto_58613 ) ) ( AVAILABLE ?auto_58618 ) ( IN ?auto_58609 ?auto_58602 ) ( TRUCK-AT ?auto_58602 ?auto_58607 ) )
    :subtasks
    ( ( !DRIVE ?auto_58602 ?auto_58607 ?auto_58619 )
      ( MAKE-ON ?auto_58599 ?auto_58600 )
      ( MAKE-ON-VERIFY ?auto_58599 ?auto_58600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58620 - SURFACE
      ?auto_58621 - SURFACE
    )
    :vars
    (
      ?auto_58622 - HOIST
      ?auto_58624 - PLACE
      ?auto_58630 - PLACE
      ?auto_58637 - HOIST
      ?auto_58635 - SURFACE
      ?auto_58633 - SURFACE
      ?auto_58632 - PLACE
      ?auto_58638 - HOIST
      ?auto_58631 - SURFACE
      ?auto_58639 - SURFACE
      ?auto_58625 - PLACE
      ?auto_58636 - HOIST
      ?auto_58634 - SURFACE
      ?auto_58626 - SURFACE
      ?auto_58628 - PLACE
      ?auto_58623 - HOIST
      ?auto_58627 - SURFACE
      ?auto_58629 - SURFACE
      ?auto_58640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58622 ?auto_58624 ) ( IS-CRATE ?auto_58620 ) ( not ( = ?auto_58620 ?auto_58621 ) ) ( not ( = ?auto_58630 ?auto_58624 ) ) ( HOIST-AT ?auto_58637 ?auto_58630 ) ( not ( = ?auto_58622 ?auto_58637 ) ) ( AVAILABLE ?auto_58637 ) ( SURFACE-AT ?auto_58620 ?auto_58630 ) ( ON ?auto_58620 ?auto_58635 ) ( CLEAR ?auto_58620 ) ( not ( = ?auto_58620 ?auto_58635 ) ) ( not ( = ?auto_58621 ?auto_58635 ) ) ( IS-CRATE ?auto_58621 ) ( not ( = ?auto_58620 ?auto_58633 ) ) ( not ( = ?auto_58621 ?auto_58633 ) ) ( not ( = ?auto_58635 ?auto_58633 ) ) ( not ( = ?auto_58632 ?auto_58624 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( HOIST-AT ?auto_58638 ?auto_58632 ) ( not ( = ?auto_58622 ?auto_58638 ) ) ( not ( = ?auto_58637 ?auto_58638 ) ) ( SURFACE-AT ?auto_58621 ?auto_58632 ) ( ON ?auto_58621 ?auto_58631 ) ( CLEAR ?auto_58621 ) ( not ( = ?auto_58620 ?auto_58631 ) ) ( not ( = ?auto_58621 ?auto_58631 ) ) ( not ( = ?auto_58635 ?auto_58631 ) ) ( not ( = ?auto_58633 ?auto_58631 ) ) ( IS-CRATE ?auto_58633 ) ( not ( = ?auto_58620 ?auto_58639 ) ) ( not ( = ?auto_58621 ?auto_58639 ) ) ( not ( = ?auto_58635 ?auto_58639 ) ) ( not ( = ?auto_58633 ?auto_58639 ) ) ( not ( = ?auto_58631 ?auto_58639 ) ) ( not ( = ?auto_58625 ?auto_58624 ) ) ( not ( = ?auto_58630 ?auto_58625 ) ) ( not ( = ?auto_58632 ?auto_58625 ) ) ( HOIST-AT ?auto_58636 ?auto_58625 ) ( not ( = ?auto_58622 ?auto_58636 ) ) ( not ( = ?auto_58637 ?auto_58636 ) ) ( not ( = ?auto_58638 ?auto_58636 ) ) ( AVAILABLE ?auto_58636 ) ( SURFACE-AT ?auto_58633 ?auto_58625 ) ( ON ?auto_58633 ?auto_58634 ) ( CLEAR ?auto_58633 ) ( not ( = ?auto_58620 ?auto_58634 ) ) ( not ( = ?auto_58621 ?auto_58634 ) ) ( not ( = ?auto_58635 ?auto_58634 ) ) ( not ( = ?auto_58633 ?auto_58634 ) ) ( not ( = ?auto_58631 ?auto_58634 ) ) ( not ( = ?auto_58639 ?auto_58634 ) ) ( IS-CRATE ?auto_58639 ) ( not ( = ?auto_58620 ?auto_58626 ) ) ( not ( = ?auto_58621 ?auto_58626 ) ) ( not ( = ?auto_58635 ?auto_58626 ) ) ( not ( = ?auto_58633 ?auto_58626 ) ) ( not ( = ?auto_58631 ?auto_58626 ) ) ( not ( = ?auto_58639 ?auto_58626 ) ) ( not ( = ?auto_58634 ?auto_58626 ) ) ( not ( = ?auto_58628 ?auto_58624 ) ) ( not ( = ?auto_58630 ?auto_58628 ) ) ( not ( = ?auto_58632 ?auto_58628 ) ) ( not ( = ?auto_58625 ?auto_58628 ) ) ( HOIST-AT ?auto_58623 ?auto_58628 ) ( not ( = ?auto_58622 ?auto_58623 ) ) ( not ( = ?auto_58637 ?auto_58623 ) ) ( not ( = ?auto_58638 ?auto_58623 ) ) ( not ( = ?auto_58636 ?auto_58623 ) ) ( AVAILABLE ?auto_58623 ) ( SURFACE-AT ?auto_58639 ?auto_58628 ) ( ON ?auto_58639 ?auto_58627 ) ( CLEAR ?auto_58639 ) ( not ( = ?auto_58620 ?auto_58627 ) ) ( not ( = ?auto_58621 ?auto_58627 ) ) ( not ( = ?auto_58635 ?auto_58627 ) ) ( not ( = ?auto_58633 ?auto_58627 ) ) ( not ( = ?auto_58631 ?auto_58627 ) ) ( not ( = ?auto_58639 ?auto_58627 ) ) ( not ( = ?auto_58634 ?auto_58627 ) ) ( not ( = ?auto_58626 ?auto_58627 ) ) ( SURFACE-AT ?auto_58629 ?auto_58624 ) ( CLEAR ?auto_58629 ) ( IS-CRATE ?auto_58626 ) ( not ( = ?auto_58620 ?auto_58629 ) ) ( not ( = ?auto_58621 ?auto_58629 ) ) ( not ( = ?auto_58635 ?auto_58629 ) ) ( not ( = ?auto_58633 ?auto_58629 ) ) ( not ( = ?auto_58631 ?auto_58629 ) ) ( not ( = ?auto_58639 ?auto_58629 ) ) ( not ( = ?auto_58634 ?auto_58629 ) ) ( not ( = ?auto_58626 ?auto_58629 ) ) ( not ( = ?auto_58627 ?auto_58629 ) ) ( AVAILABLE ?auto_58622 ) ( TRUCK-AT ?auto_58640 ?auto_58632 ) ( LIFTING ?auto_58638 ?auto_58626 ) )
    :subtasks
    ( ( !LOAD ?auto_58638 ?auto_58626 ?auto_58640 ?auto_58632 )
      ( MAKE-ON ?auto_58620 ?auto_58621 )
      ( MAKE-ON-VERIFY ?auto_58620 ?auto_58621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58641 - SURFACE
      ?auto_58642 - SURFACE
    )
    :vars
    (
      ?auto_58658 - HOIST
      ?auto_58650 - PLACE
      ?auto_58648 - PLACE
      ?auto_58643 - HOIST
      ?auto_58645 - SURFACE
      ?auto_58653 - SURFACE
      ?auto_58657 - PLACE
      ?auto_58647 - HOIST
      ?auto_58649 - SURFACE
      ?auto_58661 - SURFACE
      ?auto_58652 - PLACE
      ?auto_58656 - HOIST
      ?auto_58651 - SURFACE
      ?auto_58659 - SURFACE
      ?auto_58644 - PLACE
      ?auto_58654 - HOIST
      ?auto_58655 - SURFACE
      ?auto_58646 - SURFACE
      ?auto_58660 - TRUCK
      ?auto_58662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58658 ?auto_58650 ) ( IS-CRATE ?auto_58641 ) ( not ( = ?auto_58641 ?auto_58642 ) ) ( not ( = ?auto_58648 ?auto_58650 ) ) ( HOIST-AT ?auto_58643 ?auto_58648 ) ( not ( = ?auto_58658 ?auto_58643 ) ) ( AVAILABLE ?auto_58643 ) ( SURFACE-AT ?auto_58641 ?auto_58648 ) ( ON ?auto_58641 ?auto_58645 ) ( CLEAR ?auto_58641 ) ( not ( = ?auto_58641 ?auto_58645 ) ) ( not ( = ?auto_58642 ?auto_58645 ) ) ( IS-CRATE ?auto_58642 ) ( not ( = ?auto_58641 ?auto_58653 ) ) ( not ( = ?auto_58642 ?auto_58653 ) ) ( not ( = ?auto_58645 ?auto_58653 ) ) ( not ( = ?auto_58657 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58657 ) ) ( HOIST-AT ?auto_58647 ?auto_58657 ) ( not ( = ?auto_58658 ?auto_58647 ) ) ( not ( = ?auto_58643 ?auto_58647 ) ) ( SURFACE-AT ?auto_58642 ?auto_58657 ) ( ON ?auto_58642 ?auto_58649 ) ( CLEAR ?auto_58642 ) ( not ( = ?auto_58641 ?auto_58649 ) ) ( not ( = ?auto_58642 ?auto_58649 ) ) ( not ( = ?auto_58645 ?auto_58649 ) ) ( not ( = ?auto_58653 ?auto_58649 ) ) ( IS-CRATE ?auto_58653 ) ( not ( = ?auto_58641 ?auto_58661 ) ) ( not ( = ?auto_58642 ?auto_58661 ) ) ( not ( = ?auto_58645 ?auto_58661 ) ) ( not ( = ?auto_58653 ?auto_58661 ) ) ( not ( = ?auto_58649 ?auto_58661 ) ) ( not ( = ?auto_58652 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58652 ) ) ( not ( = ?auto_58657 ?auto_58652 ) ) ( HOIST-AT ?auto_58656 ?auto_58652 ) ( not ( = ?auto_58658 ?auto_58656 ) ) ( not ( = ?auto_58643 ?auto_58656 ) ) ( not ( = ?auto_58647 ?auto_58656 ) ) ( AVAILABLE ?auto_58656 ) ( SURFACE-AT ?auto_58653 ?auto_58652 ) ( ON ?auto_58653 ?auto_58651 ) ( CLEAR ?auto_58653 ) ( not ( = ?auto_58641 ?auto_58651 ) ) ( not ( = ?auto_58642 ?auto_58651 ) ) ( not ( = ?auto_58645 ?auto_58651 ) ) ( not ( = ?auto_58653 ?auto_58651 ) ) ( not ( = ?auto_58649 ?auto_58651 ) ) ( not ( = ?auto_58661 ?auto_58651 ) ) ( IS-CRATE ?auto_58661 ) ( not ( = ?auto_58641 ?auto_58659 ) ) ( not ( = ?auto_58642 ?auto_58659 ) ) ( not ( = ?auto_58645 ?auto_58659 ) ) ( not ( = ?auto_58653 ?auto_58659 ) ) ( not ( = ?auto_58649 ?auto_58659 ) ) ( not ( = ?auto_58661 ?auto_58659 ) ) ( not ( = ?auto_58651 ?auto_58659 ) ) ( not ( = ?auto_58644 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58644 ) ) ( not ( = ?auto_58657 ?auto_58644 ) ) ( not ( = ?auto_58652 ?auto_58644 ) ) ( HOIST-AT ?auto_58654 ?auto_58644 ) ( not ( = ?auto_58658 ?auto_58654 ) ) ( not ( = ?auto_58643 ?auto_58654 ) ) ( not ( = ?auto_58647 ?auto_58654 ) ) ( not ( = ?auto_58656 ?auto_58654 ) ) ( AVAILABLE ?auto_58654 ) ( SURFACE-AT ?auto_58661 ?auto_58644 ) ( ON ?auto_58661 ?auto_58655 ) ( CLEAR ?auto_58661 ) ( not ( = ?auto_58641 ?auto_58655 ) ) ( not ( = ?auto_58642 ?auto_58655 ) ) ( not ( = ?auto_58645 ?auto_58655 ) ) ( not ( = ?auto_58653 ?auto_58655 ) ) ( not ( = ?auto_58649 ?auto_58655 ) ) ( not ( = ?auto_58661 ?auto_58655 ) ) ( not ( = ?auto_58651 ?auto_58655 ) ) ( not ( = ?auto_58659 ?auto_58655 ) ) ( SURFACE-AT ?auto_58646 ?auto_58650 ) ( CLEAR ?auto_58646 ) ( IS-CRATE ?auto_58659 ) ( not ( = ?auto_58641 ?auto_58646 ) ) ( not ( = ?auto_58642 ?auto_58646 ) ) ( not ( = ?auto_58645 ?auto_58646 ) ) ( not ( = ?auto_58653 ?auto_58646 ) ) ( not ( = ?auto_58649 ?auto_58646 ) ) ( not ( = ?auto_58661 ?auto_58646 ) ) ( not ( = ?auto_58651 ?auto_58646 ) ) ( not ( = ?auto_58659 ?auto_58646 ) ) ( not ( = ?auto_58655 ?auto_58646 ) ) ( AVAILABLE ?auto_58658 ) ( TRUCK-AT ?auto_58660 ?auto_58657 ) ( AVAILABLE ?auto_58647 ) ( SURFACE-AT ?auto_58659 ?auto_58657 ) ( ON ?auto_58659 ?auto_58662 ) ( CLEAR ?auto_58659 ) ( not ( = ?auto_58641 ?auto_58662 ) ) ( not ( = ?auto_58642 ?auto_58662 ) ) ( not ( = ?auto_58645 ?auto_58662 ) ) ( not ( = ?auto_58653 ?auto_58662 ) ) ( not ( = ?auto_58649 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58651 ?auto_58662 ) ) ( not ( = ?auto_58659 ?auto_58662 ) ) ( not ( = ?auto_58655 ?auto_58662 ) ) ( not ( = ?auto_58646 ?auto_58662 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58647 ?auto_58659 ?auto_58662 ?auto_58657 )
      ( MAKE-ON ?auto_58641 ?auto_58642 )
      ( MAKE-ON-VERIFY ?auto_58641 ?auto_58642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58663 - SURFACE
      ?auto_58664 - SURFACE
    )
    :vars
    (
      ?auto_58675 - HOIST
      ?auto_58674 - PLACE
      ?auto_58684 - PLACE
      ?auto_58673 - HOIST
      ?auto_58670 - SURFACE
      ?auto_58669 - SURFACE
      ?auto_58677 - PLACE
      ?auto_58667 - HOIST
      ?auto_58668 - SURFACE
      ?auto_58678 - SURFACE
      ?auto_58676 - PLACE
      ?auto_58681 - HOIST
      ?auto_58672 - SURFACE
      ?auto_58680 - SURFACE
      ?auto_58665 - PLACE
      ?auto_58666 - HOIST
      ?auto_58682 - SURFACE
      ?auto_58683 - SURFACE
      ?auto_58671 - SURFACE
      ?auto_58679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58675 ?auto_58674 ) ( IS-CRATE ?auto_58663 ) ( not ( = ?auto_58663 ?auto_58664 ) ) ( not ( = ?auto_58684 ?auto_58674 ) ) ( HOIST-AT ?auto_58673 ?auto_58684 ) ( not ( = ?auto_58675 ?auto_58673 ) ) ( AVAILABLE ?auto_58673 ) ( SURFACE-AT ?auto_58663 ?auto_58684 ) ( ON ?auto_58663 ?auto_58670 ) ( CLEAR ?auto_58663 ) ( not ( = ?auto_58663 ?auto_58670 ) ) ( not ( = ?auto_58664 ?auto_58670 ) ) ( IS-CRATE ?auto_58664 ) ( not ( = ?auto_58663 ?auto_58669 ) ) ( not ( = ?auto_58664 ?auto_58669 ) ) ( not ( = ?auto_58670 ?auto_58669 ) ) ( not ( = ?auto_58677 ?auto_58674 ) ) ( not ( = ?auto_58684 ?auto_58677 ) ) ( HOIST-AT ?auto_58667 ?auto_58677 ) ( not ( = ?auto_58675 ?auto_58667 ) ) ( not ( = ?auto_58673 ?auto_58667 ) ) ( SURFACE-AT ?auto_58664 ?auto_58677 ) ( ON ?auto_58664 ?auto_58668 ) ( CLEAR ?auto_58664 ) ( not ( = ?auto_58663 ?auto_58668 ) ) ( not ( = ?auto_58664 ?auto_58668 ) ) ( not ( = ?auto_58670 ?auto_58668 ) ) ( not ( = ?auto_58669 ?auto_58668 ) ) ( IS-CRATE ?auto_58669 ) ( not ( = ?auto_58663 ?auto_58678 ) ) ( not ( = ?auto_58664 ?auto_58678 ) ) ( not ( = ?auto_58670 ?auto_58678 ) ) ( not ( = ?auto_58669 ?auto_58678 ) ) ( not ( = ?auto_58668 ?auto_58678 ) ) ( not ( = ?auto_58676 ?auto_58674 ) ) ( not ( = ?auto_58684 ?auto_58676 ) ) ( not ( = ?auto_58677 ?auto_58676 ) ) ( HOIST-AT ?auto_58681 ?auto_58676 ) ( not ( = ?auto_58675 ?auto_58681 ) ) ( not ( = ?auto_58673 ?auto_58681 ) ) ( not ( = ?auto_58667 ?auto_58681 ) ) ( AVAILABLE ?auto_58681 ) ( SURFACE-AT ?auto_58669 ?auto_58676 ) ( ON ?auto_58669 ?auto_58672 ) ( CLEAR ?auto_58669 ) ( not ( = ?auto_58663 ?auto_58672 ) ) ( not ( = ?auto_58664 ?auto_58672 ) ) ( not ( = ?auto_58670 ?auto_58672 ) ) ( not ( = ?auto_58669 ?auto_58672 ) ) ( not ( = ?auto_58668 ?auto_58672 ) ) ( not ( = ?auto_58678 ?auto_58672 ) ) ( IS-CRATE ?auto_58678 ) ( not ( = ?auto_58663 ?auto_58680 ) ) ( not ( = ?auto_58664 ?auto_58680 ) ) ( not ( = ?auto_58670 ?auto_58680 ) ) ( not ( = ?auto_58669 ?auto_58680 ) ) ( not ( = ?auto_58668 ?auto_58680 ) ) ( not ( = ?auto_58678 ?auto_58680 ) ) ( not ( = ?auto_58672 ?auto_58680 ) ) ( not ( = ?auto_58665 ?auto_58674 ) ) ( not ( = ?auto_58684 ?auto_58665 ) ) ( not ( = ?auto_58677 ?auto_58665 ) ) ( not ( = ?auto_58676 ?auto_58665 ) ) ( HOIST-AT ?auto_58666 ?auto_58665 ) ( not ( = ?auto_58675 ?auto_58666 ) ) ( not ( = ?auto_58673 ?auto_58666 ) ) ( not ( = ?auto_58667 ?auto_58666 ) ) ( not ( = ?auto_58681 ?auto_58666 ) ) ( AVAILABLE ?auto_58666 ) ( SURFACE-AT ?auto_58678 ?auto_58665 ) ( ON ?auto_58678 ?auto_58682 ) ( CLEAR ?auto_58678 ) ( not ( = ?auto_58663 ?auto_58682 ) ) ( not ( = ?auto_58664 ?auto_58682 ) ) ( not ( = ?auto_58670 ?auto_58682 ) ) ( not ( = ?auto_58669 ?auto_58682 ) ) ( not ( = ?auto_58668 ?auto_58682 ) ) ( not ( = ?auto_58678 ?auto_58682 ) ) ( not ( = ?auto_58672 ?auto_58682 ) ) ( not ( = ?auto_58680 ?auto_58682 ) ) ( SURFACE-AT ?auto_58683 ?auto_58674 ) ( CLEAR ?auto_58683 ) ( IS-CRATE ?auto_58680 ) ( not ( = ?auto_58663 ?auto_58683 ) ) ( not ( = ?auto_58664 ?auto_58683 ) ) ( not ( = ?auto_58670 ?auto_58683 ) ) ( not ( = ?auto_58669 ?auto_58683 ) ) ( not ( = ?auto_58668 ?auto_58683 ) ) ( not ( = ?auto_58678 ?auto_58683 ) ) ( not ( = ?auto_58672 ?auto_58683 ) ) ( not ( = ?auto_58680 ?auto_58683 ) ) ( not ( = ?auto_58682 ?auto_58683 ) ) ( AVAILABLE ?auto_58675 ) ( AVAILABLE ?auto_58667 ) ( SURFACE-AT ?auto_58680 ?auto_58677 ) ( ON ?auto_58680 ?auto_58671 ) ( CLEAR ?auto_58680 ) ( not ( = ?auto_58663 ?auto_58671 ) ) ( not ( = ?auto_58664 ?auto_58671 ) ) ( not ( = ?auto_58670 ?auto_58671 ) ) ( not ( = ?auto_58669 ?auto_58671 ) ) ( not ( = ?auto_58668 ?auto_58671 ) ) ( not ( = ?auto_58678 ?auto_58671 ) ) ( not ( = ?auto_58672 ?auto_58671 ) ) ( not ( = ?auto_58680 ?auto_58671 ) ) ( not ( = ?auto_58682 ?auto_58671 ) ) ( not ( = ?auto_58683 ?auto_58671 ) ) ( TRUCK-AT ?auto_58679 ?auto_58674 ) )
    :subtasks
    ( ( !DRIVE ?auto_58679 ?auto_58674 ?auto_58677 )
      ( MAKE-ON ?auto_58663 ?auto_58664 )
      ( MAKE-ON-VERIFY ?auto_58663 ?auto_58664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58685 - SURFACE
      ?auto_58686 - SURFACE
    )
    :vars
    (
      ?auto_58704 - HOIST
      ?auto_58700 - PLACE
      ?auto_58693 - PLACE
      ?auto_58699 - HOIST
      ?auto_58705 - SURFACE
      ?auto_58690 - SURFACE
      ?auto_58702 - PLACE
      ?auto_58701 - HOIST
      ?auto_58691 - SURFACE
      ?auto_58703 - SURFACE
      ?auto_58694 - PLACE
      ?auto_58692 - HOIST
      ?auto_58689 - SURFACE
      ?auto_58697 - SURFACE
      ?auto_58695 - PLACE
      ?auto_58698 - HOIST
      ?auto_58706 - SURFACE
      ?auto_58687 - SURFACE
      ?auto_58688 - SURFACE
      ?auto_58696 - TRUCK
      ?auto_58707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58704 ?auto_58700 ) ( IS-CRATE ?auto_58685 ) ( not ( = ?auto_58685 ?auto_58686 ) ) ( not ( = ?auto_58693 ?auto_58700 ) ) ( HOIST-AT ?auto_58699 ?auto_58693 ) ( not ( = ?auto_58704 ?auto_58699 ) ) ( AVAILABLE ?auto_58699 ) ( SURFACE-AT ?auto_58685 ?auto_58693 ) ( ON ?auto_58685 ?auto_58705 ) ( CLEAR ?auto_58685 ) ( not ( = ?auto_58685 ?auto_58705 ) ) ( not ( = ?auto_58686 ?auto_58705 ) ) ( IS-CRATE ?auto_58686 ) ( not ( = ?auto_58685 ?auto_58690 ) ) ( not ( = ?auto_58686 ?auto_58690 ) ) ( not ( = ?auto_58705 ?auto_58690 ) ) ( not ( = ?auto_58702 ?auto_58700 ) ) ( not ( = ?auto_58693 ?auto_58702 ) ) ( HOIST-AT ?auto_58701 ?auto_58702 ) ( not ( = ?auto_58704 ?auto_58701 ) ) ( not ( = ?auto_58699 ?auto_58701 ) ) ( SURFACE-AT ?auto_58686 ?auto_58702 ) ( ON ?auto_58686 ?auto_58691 ) ( CLEAR ?auto_58686 ) ( not ( = ?auto_58685 ?auto_58691 ) ) ( not ( = ?auto_58686 ?auto_58691 ) ) ( not ( = ?auto_58705 ?auto_58691 ) ) ( not ( = ?auto_58690 ?auto_58691 ) ) ( IS-CRATE ?auto_58690 ) ( not ( = ?auto_58685 ?auto_58703 ) ) ( not ( = ?auto_58686 ?auto_58703 ) ) ( not ( = ?auto_58705 ?auto_58703 ) ) ( not ( = ?auto_58690 ?auto_58703 ) ) ( not ( = ?auto_58691 ?auto_58703 ) ) ( not ( = ?auto_58694 ?auto_58700 ) ) ( not ( = ?auto_58693 ?auto_58694 ) ) ( not ( = ?auto_58702 ?auto_58694 ) ) ( HOIST-AT ?auto_58692 ?auto_58694 ) ( not ( = ?auto_58704 ?auto_58692 ) ) ( not ( = ?auto_58699 ?auto_58692 ) ) ( not ( = ?auto_58701 ?auto_58692 ) ) ( AVAILABLE ?auto_58692 ) ( SURFACE-AT ?auto_58690 ?auto_58694 ) ( ON ?auto_58690 ?auto_58689 ) ( CLEAR ?auto_58690 ) ( not ( = ?auto_58685 ?auto_58689 ) ) ( not ( = ?auto_58686 ?auto_58689 ) ) ( not ( = ?auto_58705 ?auto_58689 ) ) ( not ( = ?auto_58690 ?auto_58689 ) ) ( not ( = ?auto_58691 ?auto_58689 ) ) ( not ( = ?auto_58703 ?auto_58689 ) ) ( IS-CRATE ?auto_58703 ) ( not ( = ?auto_58685 ?auto_58697 ) ) ( not ( = ?auto_58686 ?auto_58697 ) ) ( not ( = ?auto_58705 ?auto_58697 ) ) ( not ( = ?auto_58690 ?auto_58697 ) ) ( not ( = ?auto_58691 ?auto_58697 ) ) ( not ( = ?auto_58703 ?auto_58697 ) ) ( not ( = ?auto_58689 ?auto_58697 ) ) ( not ( = ?auto_58695 ?auto_58700 ) ) ( not ( = ?auto_58693 ?auto_58695 ) ) ( not ( = ?auto_58702 ?auto_58695 ) ) ( not ( = ?auto_58694 ?auto_58695 ) ) ( HOIST-AT ?auto_58698 ?auto_58695 ) ( not ( = ?auto_58704 ?auto_58698 ) ) ( not ( = ?auto_58699 ?auto_58698 ) ) ( not ( = ?auto_58701 ?auto_58698 ) ) ( not ( = ?auto_58692 ?auto_58698 ) ) ( AVAILABLE ?auto_58698 ) ( SURFACE-AT ?auto_58703 ?auto_58695 ) ( ON ?auto_58703 ?auto_58706 ) ( CLEAR ?auto_58703 ) ( not ( = ?auto_58685 ?auto_58706 ) ) ( not ( = ?auto_58686 ?auto_58706 ) ) ( not ( = ?auto_58705 ?auto_58706 ) ) ( not ( = ?auto_58690 ?auto_58706 ) ) ( not ( = ?auto_58691 ?auto_58706 ) ) ( not ( = ?auto_58703 ?auto_58706 ) ) ( not ( = ?auto_58689 ?auto_58706 ) ) ( not ( = ?auto_58697 ?auto_58706 ) ) ( IS-CRATE ?auto_58697 ) ( not ( = ?auto_58685 ?auto_58687 ) ) ( not ( = ?auto_58686 ?auto_58687 ) ) ( not ( = ?auto_58705 ?auto_58687 ) ) ( not ( = ?auto_58690 ?auto_58687 ) ) ( not ( = ?auto_58691 ?auto_58687 ) ) ( not ( = ?auto_58703 ?auto_58687 ) ) ( not ( = ?auto_58689 ?auto_58687 ) ) ( not ( = ?auto_58697 ?auto_58687 ) ) ( not ( = ?auto_58706 ?auto_58687 ) ) ( AVAILABLE ?auto_58701 ) ( SURFACE-AT ?auto_58697 ?auto_58702 ) ( ON ?auto_58697 ?auto_58688 ) ( CLEAR ?auto_58697 ) ( not ( = ?auto_58685 ?auto_58688 ) ) ( not ( = ?auto_58686 ?auto_58688 ) ) ( not ( = ?auto_58705 ?auto_58688 ) ) ( not ( = ?auto_58690 ?auto_58688 ) ) ( not ( = ?auto_58691 ?auto_58688 ) ) ( not ( = ?auto_58703 ?auto_58688 ) ) ( not ( = ?auto_58689 ?auto_58688 ) ) ( not ( = ?auto_58697 ?auto_58688 ) ) ( not ( = ?auto_58706 ?auto_58688 ) ) ( not ( = ?auto_58687 ?auto_58688 ) ) ( TRUCK-AT ?auto_58696 ?auto_58700 ) ( SURFACE-AT ?auto_58707 ?auto_58700 ) ( CLEAR ?auto_58707 ) ( LIFTING ?auto_58704 ?auto_58687 ) ( IS-CRATE ?auto_58687 ) ( not ( = ?auto_58685 ?auto_58707 ) ) ( not ( = ?auto_58686 ?auto_58707 ) ) ( not ( = ?auto_58705 ?auto_58707 ) ) ( not ( = ?auto_58690 ?auto_58707 ) ) ( not ( = ?auto_58691 ?auto_58707 ) ) ( not ( = ?auto_58703 ?auto_58707 ) ) ( not ( = ?auto_58689 ?auto_58707 ) ) ( not ( = ?auto_58697 ?auto_58707 ) ) ( not ( = ?auto_58706 ?auto_58707 ) ) ( not ( = ?auto_58687 ?auto_58707 ) ) ( not ( = ?auto_58688 ?auto_58707 ) ) )
    :subtasks
    ( ( !DROP ?auto_58704 ?auto_58687 ?auto_58707 ?auto_58700 )
      ( MAKE-ON ?auto_58685 ?auto_58686 )
      ( MAKE-ON-VERIFY ?auto_58685 ?auto_58686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58708 - SURFACE
      ?auto_58709 - SURFACE
    )
    :vars
    (
      ?auto_58723 - HOIST
      ?auto_58719 - PLACE
      ?auto_58715 - PLACE
      ?auto_58712 - HOIST
      ?auto_58724 - SURFACE
      ?auto_58727 - SURFACE
      ?auto_58716 - PLACE
      ?auto_58714 - HOIST
      ?auto_58718 - SURFACE
      ?auto_58728 - SURFACE
      ?auto_58722 - PLACE
      ?auto_58713 - HOIST
      ?auto_58725 - SURFACE
      ?auto_58720 - SURFACE
      ?auto_58726 - PLACE
      ?auto_58729 - HOIST
      ?auto_58711 - SURFACE
      ?auto_58717 - SURFACE
      ?auto_58730 - SURFACE
      ?auto_58721 - TRUCK
      ?auto_58710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58723 ?auto_58719 ) ( IS-CRATE ?auto_58708 ) ( not ( = ?auto_58708 ?auto_58709 ) ) ( not ( = ?auto_58715 ?auto_58719 ) ) ( HOIST-AT ?auto_58712 ?auto_58715 ) ( not ( = ?auto_58723 ?auto_58712 ) ) ( AVAILABLE ?auto_58712 ) ( SURFACE-AT ?auto_58708 ?auto_58715 ) ( ON ?auto_58708 ?auto_58724 ) ( CLEAR ?auto_58708 ) ( not ( = ?auto_58708 ?auto_58724 ) ) ( not ( = ?auto_58709 ?auto_58724 ) ) ( IS-CRATE ?auto_58709 ) ( not ( = ?auto_58708 ?auto_58727 ) ) ( not ( = ?auto_58709 ?auto_58727 ) ) ( not ( = ?auto_58724 ?auto_58727 ) ) ( not ( = ?auto_58716 ?auto_58719 ) ) ( not ( = ?auto_58715 ?auto_58716 ) ) ( HOIST-AT ?auto_58714 ?auto_58716 ) ( not ( = ?auto_58723 ?auto_58714 ) ) ( not ( = ?auto_58712 ?auto_58714 ) ) ( SURFACE-AT ?auto_58709 ?auto_58716 ) ( ON ?auto_58709 ?auto_58718 ) ( CLEAR ?auto_58709 ) ( not ( = ?auto_58708 ?auto_58718 ) ) ( not ( = ?auto_58709 ?auto_58718 ) ) ( not ( = ?auto_58724 ?auto_58718 ) ) ( not ( = ?auto_58727 ?auto_58718 ) ) ( IS-CRATE ?auto_58727 ) ( not ( = ?auto_58708 ?auto_58728 ) ) ( not ( = ?auto_58709 ?auto_58728 ) ) ( not ( = ?auto_58724 ?auto_58728 ) ) ( not ( = ?auto_58727 ?auto_58728 ) ) ( not ( = ?auto_58718 ?auto_58728 ) ) ( not ( = ?auto_58722 ?auto_58719 ) ) ( not ( = ?auto_58715 ?auto_58722 ) ) ( not ( = ?auto_58716 ?auto_58722 ) ) ( HOIST-AT ?auto_58713 ?auto_58722 ) ( not ( = ?auto_58723 ?auto_58713 ) ) ( not ( = ?auto_58712 ?auto_58713 ) ) ( not ( = ?auto_58714 ?auto_58713 ) ) ( AVAILABLE ?auto_58713 ) ( SURFACE-AT ?auto_58727 ?auto_58722 ) ( ON ?auto_58727 ?auto_58725 ) ( CLEAR ?auto_58727 ) ( not ( = ?auto_58708 ?auto_58725 ) ) ( not ( = ?auto_58709 ?auto_58725 ) ) ( not ( = ?auto_58724 ?auto_58725 ) ) ( not ( = ?auto_58727 ?auto_58725 ) ) ( not ( = ?auto_58718 ?auto_58725 ) ) ( not ( = ?auto_58728 ?auto_58725 ) ) ( IS-CRATE ?auto_58728 ) ( not ( = ?auto_58708 ?auto_58720 ) ) ( not ( = ?auto_58709 ?auto_58720 ) ) ( not ( = ?auto_58724 ?auto_58720 ) ) ( not ( = ?auto_58727 ?auto_58720 ) ) ( not ( = ?auto_58718 ?auto_58720 ) ) ( not ( = ?auto_58728 ?auto_58720 ) ) ( not ( = ?auto_58725 ?auto_58720 ) ) ( not ( = ?auto_58726 ?auto_58719 ) ) ( not ( = ?auto_58715 ?auto_58726 ) ) ( not ( = ?auto_58716 ?auto_58726 ) ) ( not ( = ?auto_58722 ?auto_58726 ) ) ( HOIST-AT ?auto_58729 ?auto_58726 ) ( not ( = ?auto_58723 ?auto_58729 ) ) ( not ( = ?auto_58712 ?auto_58729 ) ) ( not ( = ?auto_58714 ?auto_58729 ) ) ( not ( = ?auto_58713 ?auto_58729 ) ) ( AVAILABLE ?auto_58729 ) ( SURFACE-AT ?auto_58728 ?auto_58726 ) ( ON ?auto_58728 ?auto_58711 ) ( CLEAR ?auto_58728 ) ( not ( = ?auto_58708 ?auto_58711 ) ) ( not ( = ?auto_58709 ?auto_58711 ) ) ( not ( = ?auto_58724 ?auto_58711 ) ) ( not ( = ?auto_58727 ?auto_58711 ) ) ( not ( = ?auto_58718 ?auto_58711 ) ) ( not ( = ?auto_58728 ?auto_58711 ) ) ( not ( = ?auto_58725 ?auto_58711 ) ) ( not ( = ?auto_58720 ?auto_58711 ) ) ( IS-CRATE ?auto_58720 ) ( not ( = ?auto_58708 ?auto_58717 ) ) ( not ( = ?auto_58709 ?auto_58717 ) ) ( not ( = ?auto_58724 ?auto_58717 ) ) ( not ( = ?auto_58727 ?auto_58717 ) ) ( not ( = ?auto_58718 ?auto_58717 ) ) ( not ( = ?auto_58728 ?auto_58717 ) ) ( not ( = ?auto_58725 ?auto_58717 ) ) ( not ( = ?auto_58720 ?auto_58717 ) ) ( not ( = ?auto_58711 ?auto_58717 ) ) ( AVAILABLE ?auto_58714 ) ( SURFACE-AT ?auto_58720 ?auto_58716 ) ( ON ?auto_58720 ?auto_58730 ) ( CLEAR ?auto_58720 ) ( not ( = ?auto_58708 ?auto_58730 ) ) ( not ( = ?auto_58709 ?auto_58730 ) ) ( not ( = ?auto_58724 ?auto_58730 ) ) ( not ( = ?auto_58727 ?auto_58730 ) ) ( not ( = ?auto_58718 ?auto_58730 ) ) ( not ( = ?auto_58728 ?auto_58730 ) ) ( not ( = ?auto_58725 ?auto_58730 ) ) ( not ( = ?auto_58720 ?auto_58730 ) ) ( not ( = ?auto_58711 ?auto_58730 ) ) ( not ( = ?auto_58717 ?auto_58730 ) ) ( TRUCK-AT ?auto_58721 ?auto_58719 ) ( SURFACE-AT ?auto_58710 ?auto_58719 ) ( CLEAR ?auto_58710 ) ( IS-CRATE ?auto_58717 ) ( not ( = ?auto_58708 ?auto_58710 ) ) ( not ( = ?auto_58709 ?auto_58710 ) ) ( not ( = ?auto_58724 ?auto_58710 ) ) ( not ( = ?auto_58727 ?auto_58710 ) ) ( not ( = ?auto_58718 ?auto_58710 ) ) ( not ( = ?auto_58728 ?auto_58710 ) ) ( not ( = ?auto_58725 ?auto_58710 ) ) ( not ( = ?auto_58720 ?auto_58710 ) ) ( not ( = ?auto_58711 ?auto_58710 ) ) ( not ( = ?auto_58717 ?auto_58710 ) ) ( not ( = ?auto_58730 ?auto_58710 ) ) ( AVAILABLE ?auto_58723 ) ( IN ?auto_58717 ?auto_58721 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58723 ?auto_58717 ?auto_58721 ?auto_58719 )
      ( MAKE-ON ?auto_58708 ?auto_58709 )
      ( MAKE-ON-VERIFY ?auto_58708 ?auto_58709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58731 - SURFACE
      ?auto_58732 - SURFACE
    )
    :vars
    (
      ?auto_58740 - HOIST
      ?auto_58750 - PLACE
      ?auto_58749 - PLACE
      ?auto_58745 - HOIST
      ?auto_58736 - SURFACE
      ?auto_58742 - SURFACE
      ?auto_58753 - PLACE
      ?auto_58748 - HOIST
      ?auto_58733 - SURFACE
      ?auto_58743 - SURFACE
      ?auto_58737 - PLACE
      ?auto_58735 - HOIST
      ?auto_58734 - SURFACE
      ?auto_58746 - SURFACE
      ?auto_58751 - PLACE
      ?auto_58744 - HOIST
      ?auto_58752 - SURFACE
      ?auto_58739 - SURFACE
      ?auto_58741 - SURFACE
      ?auto_58747 - SURFACE
      ?auto_58738 - TRUCK
      ?auto_58754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58740 ?auto_58750 ) ( IS-CRATE ?auto_58731 ) ( not ( = ?auto_58731 ?auto_58732 ) ) ( not ( = ?auto_58749 ?auto_58750 ) ) ( HOIST-AT ?auto_58745 ?auto_58749 ) ( not ( = ?auto_58740 ?auto_58745 ) ) ( AVAILABLE ?auto_58745 ) ( SURFACE-AT ?auto_58731 ?auto_58749 ) ( ON ?auto_58731 ?auto_58736 ) ( CLEAR ?auto_58731 ) ( not ( = ?auto_58731 ?auto_58736 ) ) ( not ( = ?auto_58732 ?auto_58736 ) ) ( IS-CRATE ?auto_58732 ) ( not ( = ?auto_58731 ?auto_58742 ) ) ( not ( = ?auto_58732 ?auto_58742 ) ) ( not ( = ?auto_58736 ?auto_58742 ) ) ( not ( = ?auto_58753 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58753 ) ) ( HOIST-AT ?auto_58748 ?auto_58753 ) ( not ( = ?auto_58740 ?auto_58748 ) ) ( not ( = ?auto_58745 ?auto_58748 ) ) ( SURFACE-AT ?auto_58732 ?auto_58753 ) ( ON ?auto_58732 ?auto_58733 ) ( CLEAR ?auto_58732 ) ( not ( = ?auto_58731 ?auto_58733 ) ) ( not ( = ?auto_58732 ?auto_58733 ) ) ( not ( = ?auto_58736 ?auto_58733 ) ) ( not ( = ?auto_58742 ?auto_58733 ) ) ( IS-CRATE ?auto_58742 ) ( not ( = ?auto_58731 ?auto_58743 ) ) ( not ( = ?auto_58732 ?auto_58743 ) ) ( not ( = ?auto_58736 ?auto_58743 ) ) ( not ( = ?auto_58742 ?auto_58743 ) ) ( not ( = ?auto_58733 ?auto_58743 ) ) ( not ( = ?auto_58737 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58737 ) ) ( not ( = ?auto_58753 ?auto_58737 ) ) ( HOIST-AT ?auto_58735 ?auto_58737 ) ( not ( = ?auto_58740 ?auto_58735 ) ) ( not ( = ?auto_58745 ?auto_58735 ) ) ( not ( = ?auto_58748 ?auto_58735 ) ) ( AVAILABLE ?auto_58735 ) ( SURFACE-AT ?auto_58742 ?auto_58737 ) ( ON ?auto_58742 ?auto_58734 ) ( CLEAR ?auto_58742 ) ( not ( = ?auto_58731 ?auto_58734 ) ) ( not ( = ?auto_58732 ?auto_58734 ) ) ( not ( = ?auto_58736 ?auto_58734 ) ) ( not ( = ?auto_58742 ?auto_58734 ) ) ( not ( = ?auto_58733 ?auto_58734 ) ) ( not ( = ?auto_58743 ?auto_58734 ) ) ( IS-CRATE ?auto_58743 ) ( not ( = ?auto_58731 ?auto_58746 ) ) ( not ( = ?auto_58732 ?auto_58746 ) ) ( not ( = ?auto_58736 ?auto_58746 ) ) ( not ( = ?auto_58742 ?auto_58746 ) ) ( not ( = ?auto_58733 ?auto_58746 ) ) ( not ( = ?auto_58743 ?auto_58746 ) ) ( not ( = ?auto_58734 ?auto_58746 ) ) ( not ( = ?auto_58751 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58751 ) ) ( not ( = ?auto_58753 ?auto_58751 ) ) ( not ( = ?auto_58737 ?auto_58751 ) ) ( HOIST-AT ?auto_58744 ?auto_58751 ) ( not ( = ?auto_58740 ?auto_58744 ) ) ( not ( = ?auto_58745 ?auto_58744 ) ) ( not ( = ?auto_58748 ?auto_58744 ) ) ( not ( = ?auto_58735 ?auto_58744 ) ) ( AVAILABLE ?auto_58744 ) ( SURFACE-AT ?auto_58743 ?auto_58751 ) ( ON ?auto_58743 ?auto_58752 ) ( CLEAR ?auto_58743 ) ( not ( = ?auto_58731 ?auto_58752 ) ) ( not ( = ?auto_58732 ?auto_58752 ) ) ( not ( = ?auto_58736 ?auto_58752 ) ) ( not ( = ?auto_58742 ?auto_58752 ) ) ( not ( = ?auto_58733 ?auto_58752 ) ) ( not ( = ?auto_58743 ?auto_58752 ) ) ( not ( = ?auto_58734 ?auto_58752 ) ) ( not ( = ?auto_58746 ?auto_58752 ) ) ( IS-CRATE ?auto_58746 ) ( not ( = ?auto_58731 ?auto_58739 ) ) ( not ( = ?auto_58732 ?auto_58739 ) ) ( not ( = ?auto_58736 ?auto_58739 ) ) ( not ( = ?auto_58742 ?auto_58739 ) ) ( not ( = ?auto_58733 ?auto_58739 ) ) ( not ( = ?auto_58743 ?auto_58739 ) ) ( not ( = ?auto_58734 ?auto_58739 ) ) ( not ( = ?auto_58746 ?auto_58739 ) ) ( not ( = ?auto_58752 ?auto_58739 ) ) ( AVAILABLE ?auto_58748 ) ( SURFACE-AT ?auto_58746 ?auto_58753 ) ( ON ?auto_58746 ?auto_58741 ) ( CLEAR ?auto_58746 ) ( not ( = ?auto_58731 ?auto_58741 ) ) ( not ( = ?auto_58732 ?auto_58741 ) ) ( not ( = ?auto_58736 ?auto_58741 ) ) ( not ( = ?auto_58742 ?auto_58741 ) ) ( not ( = ?auto_58733 ?auto_58741 ) ) ( not ( = ?auto_58743 ?auto_58741 ) ) ( not ( = ?auto_58734 ?auto_58741 ) ) ( not ( = ?auto_58746 ?auto_58741 ) ) ( not ( = ?auto_58752 ?auto_58741 ) ) ( not ( = ?auto_58739 ?auto_58741 ) ) ( SURFACE-AT ?auto_58747 ?auto_58750 ) ( CLEAR ?auto_58747 ) ( IS-CRATE ?auto_58739 ) ( not ( = ?auto_58731 ?auto_58747 ) ) ( not ( = ?auto_58732 ?auto_58747 ) ) ( not ( = ?auto_58736 ?auto_58747 ) ) ( not ( = ?auto_58742 ?auto_58747 ) ) ( not ( = ?auto_58733 ?auto_58747 ) ) ( not ( = ?auto_58743 ?auto_58747 ) ) ( not ( = ?auto_58734 ?auto_58747 ) ) ( not ( = ?auto_58746 ?auto_58747 ) ) ( not ( = ?auto_58752 ?auto_58747 ) ) ( not ( = ?auto_58739 ?auto_58747 ) ) ( not ( = ?auto_58741 ?auto_58747 ) ) ( AVAILABLE ?auto_58740 ) ( IN ?auto_58739 ?auto_58738 ) ( TRUCK-AT ?auto_58738 ?auto_58754 ) ( not ( = ?auto_58754 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58754 ) ) ( not ( = ?auto_58753 ?auto_58754 ) ) ( not ( = ?auto_58737 ?auto_58754 ) ) ( not ( = ?auto_58751 ?auto_58754 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58738 ?auto_58754 ?auto_58750 )
      ( MAKE-ON ?auto_58731 ?auto_58732 )
      ( MAKE-ON-VERIFY ?auto_58731 ?auto_58732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58755 - SURFACE
      ?auto_58756 - SURFACE
    )
    :vars
    (
      ?auto_58761 - HOIST
      ?auto_58777 - PLACE
      ?auto_58776 - PLACE
      ?auto_58771 - HOIST
      ?auto_58760 - SURFACE
      ?auto_58769 - SURFACE
      ?auto_58768 - PLACE
      ?auto_58762 - HOIST
      ?auto_58775 - SURFACE
      ?auto_58766 - SURFACE
      ?auto_58765 - PLACE
      ?auto_58772 - HOIST
      ?auto_58758 - SURFACE
      ?auto_58764 - SURFACE
      ?auto_58778 - PLACE
      ?auto_58770 - HOIST
      ?auto_58767 - SURFACE
      ?auto_58763 - SURFACE
      ?auto_58774 - SURFACE
      ?auto_58757 - SURFACE
      ?auto_58759 - TRUCK
      ?auto_58773 - PLACE
      ?auto_58779 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58761 ?auto_58777 ) ( IS-CRATE ?auto_58755 ) ( not ( = ?auto_58755 ?auto_58756 ) ) ( not ( = ?auto_58776 ?auto_58777 ) ) ( HOIST-AT ?auto_58771 ?auto_58776 ) ( not ( = ?auto_58761 ?auto_58771 ) ) ( AVAILABLE ?auto_58771 ) ( SURFACE-AT ?auto_58755 ?auto_58776 ) ( ON ?auto_58755 ?auto_58760 ) ( CLEAR ?auto_58755 ) ( not ( = ?auto_58755 ?auto_58760 ) ) ( not ( = ?auto_58756 ?auto_58760 ) ) ( IS-CRATE ?auto_58756 ) ( not ( = ?auto_58755 ?auto_58769 ) ) ( not ( = ?auto_58756 ?auto_58769 ) ) ( not ( = ?auto_58760 ?auto_58769 ) ) ( not ( = ?auto_58768 ?auto_58777 ) ) ( not ( = ?auto_58776 ?auto_58768 ) ) ( HOIST-AT ?auto_58762 ?auto_58768 ) ( not ( = ?auto_58761 ?auto_58762 ) ) ( not ( = ?auto_58771 ?auto_58762 ) ) ( SURFACE-AT ?auto_58756 ?auto_58768 ) ( ON ?auto_58756 ?auto_58775 ) ( CLEAR ?auto_58756 ) ( not ( = ?auto_58755 ?auto_58775 ) ) ( not ( = ?auto_58756 ?auto_58775 ) ) ( not ( = ?auto_58760 ?auto_58775 ) ) ( not ( = ?auto_58769 ?auto_58775 ) ) ( IS-CRATE ?auto_58769 ) ( not ( = ?auto_58755 ?auto_58766 ) ) ( not ( = ?auto_58756 ?auto_58766 ) ) ( not ( = ?auto_58760 ?auto_58766 ) ) ( not ( = ?auto_58769 ?auto_58766 ) ) ( not ( = ?auto_58775 ?auto_58766 ) ) ( not ( = ?auto_58765 ?auto_58777 ) ) ( not ( = ?auto_58776 ?auto_58765 ) ) ( not ( = ?auto_58768 ?auto_58765 ) ) ( HOIST-AT ?auto_58772 ?auto_58765 ) ( not ( = ?auto_58761 ?auto_58772 ) ) ( not ( = ?auto_58771 ?auto_58772 ) ) ( not ( = ?auto_58762 ?auto_58772 ) ) ( AVAILABLE ?auto_58772 ) ( SURFACE-AT ?auto_58769 ?auto_58765 ) ( ON ?auto_58769 ?auto_58758 ) ( CLEAR ?auto_58769 ) ( not ( = ?auto_58755 ?auto_58758 ) ) ( not ( = ?auto_58756 ?auto_58758 ) ) ( not ( = ?auto_58760 ?auto_58758 ) ) ( not ( = ?auto_58769 ?auto_58758 ) ) ( not ( = ?auto_58775 ?auto_58758 ) ) ( not ( = ?auto_58766 ?auto_58758 ) ) ( IS-CRATE ?auto_58766 ) ( not ( = ?auto_58755 ?auto_58764 ) ) ( not ( = ?auto_58756 ?auto_58764 ) ) ( not ( = ?auto_58760 ?auto_58764 ) ) ( not ( = ?auto_58769 ?auto_58764 ) ) ( not ( = ?auto_58775 ?auto_58764 ) ) ( not ( = ?auto_58766 ?auto_58764 ) ) ( not ( = ?auto_58758 ?auto_58764 ) ) ( not ( = ?auto_58778 ?auto_58777 ) ) ( not ( = ?auto_58776 ?auto_58778 ) ) ( not ( = ?auto_58768 ?auto_58778 ) ) ( not ( = ?auto_58765 ?auto_58778 ) ) ( HOIST-AT ?auto_58770 ?auto_58778 ) ( not ( = ?auto_58761 ?auto_58770 ) ) ( not ( = ?auto_58771 ?auto_58770 ) ) ( not ( = ?auto_58762 ?auto_58770 ) ) ( not ( = ?auto_58772 ?auto_58770 ) ) ( AVAILABLE ?auto_58770 ) ( SURFACE-AT ?auto_58766 ?auto_58778 ) ( ON ?auto_58766 ?auto_58767 ) ( CLEAR ?auto_58766 ) ( not ( = ?auto_58755 ?auto_58767 ) ) ( not ( = ?auto_58756 ?auto_58767 ) ) ( not ( = ?auto_58760 ?auto_58767 ) ) ( not ( = ?auto_58769 ?auto_58767 ) ) ( not ( = ?auto_58775 ?auto_58767 ) ) ( not ( = ?auto_58766 ?auto_58767 ) ) ( not ( = ?auto_58758 ?auto_58767 ) ) ( not ( = ?auto_58764 ?auto_58767 ) ) ( IS-CRATE ?auto_58764 ) ( not ( = ?auto_58755 ?auto_58763 ) ) ( not ( = ?auto_58756 ?auto_58763 ) ) ( not ( = ?auto_58760 ?auto_58763 ) ) ( not ( = ?auto_58769 ?auto_58763 ) ) ( not ( = ?auto_58775 ?auto_58763 ) ) ( not ( = ?auto_58766 ?auto_58763 ) ) ( not ( = ?auto_58758 ?auto_58763 ) ) ( not ( = ?auto_58764 ?auto_58763 ) ) ( not ( = ?auto_58767 ?auto_58763 ) ) ( AVAILABLE ?auto_58762 ) ( SURFACE-AT ?auto_58764 ?auto_58768 ) ( ON ?auto_58764 ?auto_58774 ) ( CLEAR ?auto_58764 ) ( not ( = ?auto_58755 ?auto_58774 ) ) ( not ( = ?auto_58756 ?auto_58774 ) ) ( not ( = ?auto_58760 ?auto_58774 ) ) ( not ( = ?auto_58769 ?auto_58774 ) ) ( not ( = ?auto_58775 ?auto_58774 ) ) ( not ( = ?auto_58766 ?auto_58774 ) ) ( not ( = ?auto_58758 ?auto_58774 ) ) ( not ( = ?auto_58764 ?auto_58774 ) ) ( not ( = ?auto_58767 ?auto_58774 ) ) ( not ( = ?auto_58763 ?auto_58774 ) ) ( SURFACE-AT ?auto_58757 ?auto_58777 ) ( CLEAR ?auto_58757 ) ( IS-CRATE ?auto_58763 ) ( not ( = ?auto_58755 ?auto_58757 ) ) ( not ( = ?auto_58756 ?auto_58757 ) ) ( not ( = ?auto_58760 ?auto_58757 ) ) ( not ( = ?auto_58769 ?auto_58757 ) ) ( not ( = ?auto_58775 ?auto_58757 ) ) ( not ( = ?auto_58766 ?auto_58757 ) ) ( not ( = ?auto_58758 ?auto_58757 ) ) ( not ( = ?auto_58764 ?auto_58757 ) ) ( not ( = ?auto_58767 ?auto_58757 ) ) ( not ( = ?auto_58763 ?auto_58757 ) ) ( not ( = ?auto_58774 ?auto_58757 ) ) ( AVAILABLE ?auto_58761 ) ( TRUCK-AT ?auto_58759 ?auto_58773 ) ( not ( = ?auto_58773 ?auto_58777 ) ) ( not ( = ?auto_58776 ?auto_58773 ) ) ( not ( = ?auto_58768 ?auto_58773 ) ) ( not ( = ?auto_58765 ?auto_58773 ) ) ( not ( = ?auto_58778 ?auto_58773 ) ) ( HOIST-AT ?auto_58779 ?auto_58773 ) ( LIFTING ?auto_58779 ?auto_58763 ) ( not ( = ?auto_58761 ?auto_58779 ) ) ( not ( = ?auto_58771 ?auto_58779 ) ) ( not ( = ?auto_58762 ?auto_58779 ) ) ( not ( = ?auto_58772 ?auto_58779 ) ) ( not ( = ?auto_58770 ?auto_58779 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58779 ?auto_58763 ?auto_58759 ?auto_58773 )
      ( MAKE-ON ?auto_58755 ?auto_58756 )
      ( MAKE-ON-VERIFY ?auto_58755 ?auto_58756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58780 - SURFACE
      ?auto_58781 - SURFACE
    )
    :vars
    (
      ?auto_58791 - HOIST
      ?auto_58797 - PLACE
      ?auto_58786 - PLACE
      ?auto_58790 - HOIST
      ?auto_58803 - SURFACE
      ?auto_58794 - SURFACE
      ?auto_58796 - PLACE
      ?auto_58800 - HOIST
      ?auto_58785 - SURFACE
      ?auto_58787 - SURFACE
      ?auto_58799 - PLACE
      ?auto_58783 - HOIST
      ?auto_58804 - SURFACE
      ?auto_58801 - SURFACE
      ?auto_58793 - PLACE
      ?auto_58782 - HOIST
      ?auto_58795 - SURFACE
      ?auto_58784 - SURFACE
      ?auto_58792 - SURFACE
      ?auto_58789 - SURFACE
      ?auto_58802 - TRUCK
      ?auto_58788 - PLACE
      ?auto_58798 - HOIST
      ?auto_58805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58791 ?auto_58797 ) ( IS-CRATE ?auto_58780 ) ( not ( = ?auto_58780 ?auto_58781 ) ) ( not ( = ?auto_58786 ?auto_58797 ) ) ( HOIST-AT ?auto_58790 ?auto_58786 ) ( not ( = ?auto_58791 ?auto_58790 ) ) ( AVAILABLE ?auto_58790 ) ( SURFACE-AT ?auto_58780 ?auto_58786 ) ( ON ?auto_58780 ?auto_58803 ) ( CLEAR ?auto_58780 ) ( not ( = ?auto_58780 ?auto_58803 ) ) ( not ( = ?auto_58781 ?auto_58803 ) ) ( IS-CRATE ?auto_58781 ) ( not ( = ?auto_58780 ?auto_58794 ) ) ( not ( = ?auto_58781 ?auto_58794 ) ) ( not ( = ?auto_58803 ?auto_58794 ) ) ( not ( = ?auto_58796 ?auto_58797 ) ) ( not ( = ?auto_58786 ?auto_58796 ) ) ( HOIST-AT ?auto_58800 ?auto_58796 ) ( not ( = ?auto_58791 ?auto_58800 ) ) ( not ( = ?auto_58790 ?auto_58800 ) ) ( SURFACE-AT ?auto_58781 ?auto_58796 ) ( ON ?auto_58781 ?auto_58785 ) ( CLEAR ?auto_58781 ) ( not ( = ?auto_58780 ?auto_58785 ) ) ( not ( = ?auto_58781 ?auto_58785 ) ) ( not ( = ?auto_58803 ?auto_58785 ) ) ( not ( = ?auto_58794 ?auto_58785 ) ) ( IS-CRATE ?auto_58794 ) ( not ( = ?auto_58780 ?auto_58787 ) ) ( not ( = ?auto_58781 ?auto_58787 ) ) ( not ( = ?auto_58803 ?auto_58787 ) ) ( not ( = ?auto_58794 ?auto_58787 ) ) ( not ( = ?auto_58785 ?auto_58787 ) ) ( not ( = ?auto_58799 ?auto_58797 ) ) ( not ( = ?auto_58786 ?auto_58799 ) ) ( not ( = ?auto_58796 ?auto_58799 ) ) ( HOIST-AT ?auto_58783 ?auto_58799 ) ( not ( = ?auto_58791 ?auto_58783 ) ) ( not ( = ?auto_58790 ?auto_58783 ) ) ( not ( = ?auto_58800 ?auto_58783 ) ) ( AVAILABLE ?auto_58783 ) ( SURFACE-AT ?auto_58794 ?auto_58799 ) ( ON ?auto_58794 ?auto_58804 ) ( CLEAR ?auto_58794 ) ( not ( = ?auto_58780 ?auto_58804 ) ) ( not ( = ?auto_58781 ?auto_58804 ) ) ( not ( = ?auto_58803 ?auto_58804 ) ) ( not ( = ?auto_58794 ?auto_58804 ) ) ( not ( = ?auto_58785 ?auto_58804 ) ) ( not ( = ?auto_58787 ?auto_58804 ) ) ( IS-CRATE ?auto_58787 ) ( not ( = ?auto_58780 ?auto_58801 ) ) ( not ( = ?auto_58781 ?auto_58801 ) ) ( not ( = ?auto_58803 ?auto_58801 ) ) ( not ( = ?auto_58794 ?auto_58801 ) ) ( not ( = ?auto_58785 ?auto_58801 ) ) ( not ( = ?auto_58787 ?auto_58801 ) ) ( not ( = ?auto_58804 ?auto_58801 ) ) ( not ( = ?auto_58793 ?auto_58797 ) ) ( not ( = ?auto_58786 ?auto_58793 ) ) ( not ( = ?auto_58796 ?auto_58793 ) ) ( not ( = ?auto_58799 ?auto_58793 ) ) ( HOIST-AT ?auto_58782 ?auto_58793 ) ( not ( = ?auto_58791 ?auto_58782 ) ) ( not ( = ?auto_58790 ?auto_58782 ) ) ( not ( = ?auto_58800 ?auto_58782 ) ) ( not ( = ?auto_58783 ?auto_58782 ) ) ( AVAILABLE ?auto_58782 ) ( SURFACE-AT ?auto_58787 ?auto_58793 ) ( ON ?auto_58787 ?auto_58795 ) ( CLEAR ?auto_58787 ) ( not ( = ?auto_58780 ?auto_58795 ) ) ( not ( = ?auto_58781 ?auto_58795 ) ) ( not ( = ?auto_58803 ?auto_58795 ) ) ( not ( = ?auto_58794 ?auto_58795 ) ) ( not ( = ?auto_58785 ?auto_58795 ) ) ( not ( = ?auto_58787 ?auto_58795 ) ) ( not ( = ?auto_58804 ?auto_58795 ) ) ( not ( = ?auto_58801 ?auto_58795 ) ) ( IS-CRATE ?auto_58801 ) ( not ( = ?auto_58780 ?auto_58784 ) ) ( not ( = ?auto_58781 ?auto_58784 ) ) ( not ( = ?auto_58803 ?auto_58784 ) ) ( not ( = ?auto_58794 ?auto_58784 ) ) ( not ( = ?auto_58785 ?auto_58784 ) ) ( not ( = ?auto_58787 ?auto_58784 ) ) ( not ( = ?auto_58804 ?auto_58784 ) ) ( not ( = ?auto_58801 ?auto_58784 ) ) ( not ( = ?auto_58795 ?auto_58784 ) ) ( AVAILABLE ?auto_58800 ) ( SURFACE-AT ?auto_58801 ?auto_58796 ) ( ON ?auto_58801 ?auto_58792 ) ( CLEAR ?auto_58801 ) ( not ( = ?auto_58780 ?auto_58792 ) ) ( not ( = ?auto_58781 ?auto_58792 ) ) ( not ( = ?auto_58803 ?auto_58792 ) ) ( not ( = ?auto_58794 ?auto_58792 ) ) ( not ( = ?auto_58785 ?auto_58792 ) ) ( not ( = ?auto_58787 ?auto_58792 ) ) ( not ( = ?auto_58804 ?auto_58792 ) ) ( not ( = ?auto_58801 ?auto_58792 ) ) ( not ( = ?auto_58795 ?auto_58792 ) ) ( not ( = ?auto_58784 ?auto_58792 ) ) ( SURFACE-AT ?auto_58789 ?auto_58797 ) ( CLEAR ?auto_58789 ) ( IS-CRATE ?auto_58784 ) ( not ( = ?auto_58780 ?auto_58789 ) ) ( not ( = ?auto_58781 ?auto_58789 ) ) ( not ( = ?auto_58803 ?auto_58789 ) ) ( not ( = ?auto_58794 ?auto_58789 ) ) ( not ( = ?auto_58785 ?auto_58789 ) ) ( not ( = ?auto_58787 ?auto_58789 ) ) ( not ( = ?auto_58804 ?auto_58789 ) ) ( not ( = ?auto_58801 ?auto_58789 ) ) ( not ( = ?auto_58795 ?auto_58789 ) ) ( not ( = ?auto_58784 ?auto_58789 ) ) ( not ( = ?auto_58792 ?auto_58789 ) ) ( AVAILABLE ?auto_58791 ) ( TRUCK-AT ?auto_58802 ?auto_58788 ) ( not ( = ?auto_58788 ?auto_58797 ) ) ( not ( = ?auto_58786 ?auto_58788 ) ) ( not ( = ?auto_58796 ?auto_58788 ) ) ( not ( = ?auto_58799 ?auto_58788 ) ) ( not ( = ?auto_58793 ?auto_58788 ) ) ( HOIST-AT ?auto_58798 ?auto_58788 ) ( not ( = ?auto_58791 ?auto_58798 ) ) ( not ( = ?auto_58790 ?auto_58798 ) ) ( not ( = ?auto_58800 ?auto_58798 ) ) ( not ( = ?auto_58783 ?auto_58798 ) ) ( not ( = ?auto_58782 ?auto_58798 ) ) ( AVAILABLE ?auto_58798 ) ( SURFACE-AT ?auto_58784 ?auto_58788 ) ( ON ?auto_58784 ?auto_58805 ) ( CLEAR ?auto_58784 ) ( not ( = ?auto_58780 ?auto_58805 ) ) ( not ( = ?auto_58781 ?auto_58805 ) ) ( not ( = ?auto_58803 ?auto_58805 ) ) ( not ( = ?auto_58794 ?auto_58805 ) ) ( not ( = ?auto_58785 ?auto_58805 ) ) ( not ( = ?auto_58787 ?auto_58805 ) ) ( not ( = ?auto_58804 ?auto_58805 ) ) ( not ( = ?auto_58801 ?auto_58805 ) ) ( not ( = ?auto_58795 ?auto_58805 ) ) ( not ( = ?auto_58784 ?auto_58805 ) ) ( not ( = ?auto_58792 ?auto_58805 ) ) ( not ( = ?auto_58789 ?auto_58805 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58798 ?auto_58784 ?auto_58805 ?auto_58788 )
      ( MAKE-ON ?auto_58780 ?auto_58781 )
      ( MAKE-ON-VERIFY ?auto_58780 ?auto_58781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58806 - SURFACE
      ?auto_58807 - SURFACE
    )
    :vars
    (
      ?auto_58826 - HOIST
      ?auto_58817 - PLACE
      ?auto_58830 - PLACE
      ?auto_58813 - HOIST
      ?auto_58815 - SURFACE
      ?auto_58825 - SURFACE
      ?auto_58809 - PLACE
      ?auto_58814 - HOIST
      ?auto_58831 - SURFACE
      ?auto_58812 - SURFACE
      ?auto_58808 - PLACE
      ?auto_58819 - HOIST
      ?auto_58816 - SURFACE
      ?auto_58811 - SURFACE
      ?auto_58824 - PLACE
      ?auto_58818 - HOIST
      ?auto_58820 - SURFACE
      ?auto_58829 - SURFACE
      ?auto_58827 - SURFACE
      ?auto_58821 - SURFACE
      ?auto_58822 - PLACE
      ?auto_58828 - HOIST
      ?auto_58823 - SURFACE
      ?auto_58810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58826 ?auto_58817 ) ( IS-CRATE ?auto_58806 ) ( not ( = ?auto_58806 ?auto_58807 ) ) ( not ( = ?auto_58830 ?auto_58817 ) ) ( HOIST-AT ?auto_58813 ?auto_58830 ) ( not ( = ?auto_58826 ?auto_58813 ) ) ( AVAILABLE ?auto_58813 ) ( SURFACE-AT ?auto_58806 ?auto_58830 ) ( ON ?auto_58806 ?auto_58815 ) ( CLEAR ?auto_58806 ) ( not ( = ?auto_58806 ?auto_58815 ) ) ( not ( = ?auto_58807 ?auto_58815 ) ) ( IS-CRATE ?auto_58807 ) ( not ( = ?auto_58806 ?auto_58825 ) ) ( not ( = ?auto_58807 ?auto_58825 ) ) ( not ( = ?auto_58815 ?auto_58825 ) ) ( not ( = ?auto_58809 ?auto_58817 ) ) ( not ( = ?auto_58830 ?auto_58809 ) ) ( HOIST-AT ?auto_58814 ?auto_58809 ) ( not ( = ?auto_58826 ?auto_58814 ) ) ( not ( = ?auto_58813 ?auto_58814 ) ) ( SURFACE-AT ?auto_58807 ?auto_58809 ) ( ON ?auto_58807 ?auto_58831 ) ( CLEAR ?auto_58807 ) ( not ( = ?auto_58806 ?auto_58831 ) ) ( not ( = ?auto_58807 ?auto_58831 ) ) ( not ( = ?auto_58815 ?auto_58831 ) ) ( not ( = ?auto_58825 ?auto_58831 ) ) ( IS-CRATE ?auto_58825 ) ( not ( = ?auto_58806 ?auto_58812 ) ) ( not ( = ?auto_58807 ?auto_58812 ) ) ( not ( = ?auto_58815 ?auto_58812 ) ) ( not ( = ?auto_58825 ?auto_58812 ) ) ( not ( = ?auto_58831 ?auto_58812 ) ) ( not ( = ?auto_58808 ?auto_58817 ) ) ( not ( = ?auto_58830 ?auto_58808 ) ) ( not ( = ?auto_58809 ?auto_58808 ) ) ( HOIST-AT ?auto_58819 ?auto_58808 ) ( not ( = ?auto_58826 ?auto_58819 ) ) ( not ( = ?auto_58813 ?auto_58819 ) ) ( not ( = ?auto_58814 ?auto_58819 ) ) ( AVAILABLE ?auto_58819 ) ( SURFACE-AT ?auto_58825 ?auto_58808 ) ( ON ?auto_58825 ?auto_58816 ) ( CLEAR ?auto_58825 ) ( not ( = ?auto_58806 ?auto_58816 ) ) ( not ( = ?auto_58807 ?auto_58816 ) ) ( not ( = ?auto_58815 ?auto_58816 ) ) ( not ( = ?auto_58825 ?auto_58816 ) ) ( not ( = ?auto_58831 ?auto_58816 ) ) ( not ( = ?auto_58812 ?auto_58816 ) ) ( IS-CRATE ?auto_58812 ) ( not ( = ?auto_58806 ?auto_58811 ) ) ( not ( = ?auto_58807 ?auto_58811 ) ) ( not ( = ?auto_58815 ?auto_58811 ) ) ( not ( = ?auto_58825 ?auto_58811 ) ) ( not ( = ?auto_58831 ?auto_58811 ) ) ( not ( = ?auto_58812 ?auto_58811 ) ) ( not ( = ?auto_58816 ?auto_58811 ) ) ( not ( = ?auto_58824 ?auto_58817 ) ) ( not ( = ?auto_58830 ?auto_58824 ) ) ( not ( = ?auto_58809 ?auto_58824 ) ) ( not ( = ?auto_58808 ?auto_58824 ) ) ( HOIST-AT ?auto_58818 ?auto_58824 ) ( not ( = ?auto_58826 ?auto_58818 ) ) ( not ( = ?auto_58813 ?auto_58818 ) ) ( not ( = ?auto_58814 ?auto_58818 ) ) ( not ( = ?auto_58819 ?auto_58818 ) ) ( AVAILABLE ?auto_58818 ) ( SURFACE-AT ?auto_58812 ?auto_58824 ) ( ON ?auto_58812 ?auto_58820 ) ( CLEAR ?auto_58812 ) ( not ( = ?auto_58806 ?auto_58820 ) ) ( not ( = ?auto_58807 ?auto_58820 ) ) ( not ( = ?auto_58815 ?auto_58820 ) ) ( not ( = ?auto_58825 ?auto_58820 ) ) ( not ( = ?auto_58831 ?auto_58820 ) ) ( not ( = ?auto_58812 ?auto_58820 ) ) ( not ( = ?auto_58816 ?auto_58820 ) ) ( not ( = ?auto_58811 ?auto_58820 ) ) ( IS-CRATE ?auto_58811 ) ( not ( = ?auto_58806 ?auto_58829 ) ) ( not ( = ?auto_58807 ?auto_58829 ) ) ( not ( = ?auto_58815 ?auto_58829 ) ) ( not ( = ?auto_58825 ?auto_58829 ) ) ( not ( = ?auto_58831 ?auto_58829 ) ) ( not ( = ?auto_58812 ?auto_58829 ) ) ( not ( = ?auto_58816 ?auto_58829 ) ) ( not ( = ?auto_58811 ?auto_58829 ) ) ( not ( = ?auto_58820 ?auto_58829 ) ) ( AVAILABLE ?auto_58814 ) ( SURFACE-AT ?auto_58811 ?auto_58809 ) ( ON ?auto_58811 ?auto_58827 ) ( CLEAR ?auto_58811 ) ( not ( = ?auto_58806 ?auto_58827 ) ) ( not ( = ?auto_58807 ?auto_58827 ) ) ( not ( = ?auto_58815 ?auto_58827 ) ) ( not ( = ?auto_58825 ?auto_58827 ) ) ( not ( = ?auto_58831 ?auto_58827 ) ) ( not ( = ?auto_58812 ?auto_58827 ) ) ( not ( = ?auto_58816 ?auto_58827 ) ) ( not ( = ?auto_58811 ?auto_58827 ) ) ( not ( = ?auto_58820 ?auto_58827 ) ) ( not ( = ?auto_58829 ?auto_58827 ) ) ( SURFACE-AT ?auto_58821 ?auto_58817 ) ( CLEAR ?auto_58821 ) ( IS-CRATE ?auto_58829 ) ( not ( = ?auto_58806 ?auto_58821 ) ) ( not ( = ?auto_58807 ?auto_58821 ) ) ( not ( = ?auto_58815 ?auto_58821 ) ) ( not ( = ?auto_58825 ?auto_58821 ) ) ( not ( = ?auto_58831 ?auto_58821 ) ) ( not ( = ?auto_58812 ?auto_58821 ) ) ( not ( = ?auto_58816 ?auto_58821 ) ) ( not ( = ?auto_58811 ?auto_58821 ) ) ( not ( = ?auto_58820 ?auto_58821 ) ) ( not ( = ?auto_58829 ?auto_58821 ) ) ( not ( = ?auto_58827 ?auto_58821 ) ) ( AVAILABLE ?auto_58826 ) ( not ( = ?auto_58822 ?auto_58817 ) ) ( not ( = ?auto_58830 ?auto_58822 ) ) ( not ( = ?auto_58809 ?auto_58822 ) ) ( not ( = ?auto_58808 ?auto_58822 ) ) ( not ( = ?auto_58824 ?auto_58822 ) ) ( HOIST-AT ?auto_58828 ?auto_58822 ) ( not ( = ?auto_58826 ?auto_58828 ) ) ( not ( = ?auto_58813 ?auto_58828 ) ) ( not ( = ?auto_58814 ?auto_58828 ) ) ( not ( = ?auto_58819 ?auto_58828 ) ) ( not ( = ?auto_58818 ?auto_58828 ) ) ( AVAILABLE ?auto_58828 ) ( SURFACE-AT ?auto_58829 ?auto_58822 ) ( ON ?auto_58829 ?auto_58823 ) ( CLEAR ?auto_58829 ) ( not ( = ?auto_58806 ?auto_58823 ) ) ( not ( = ?auto_58807 ?auto_58823 ) ) ( not ( = ?auto_58815 ?auto_58823 ) ) ( not ( = ?auto_58825 ?auto_58823 ) ) ( not ( = ?auto_58831 ?auto_58823 ) ) ( not ( = ?auto_58812 ?auto_58823 ) ) ( not ( = ?auto_58816 ?auto_58823 ) ) ( not ( = ?auto_58811 ?auto_58823 ) ) ( not ( = ?auto_58820 ?auto_58823 ) ) ( not ( = ?auto_58829 ?auto_58823 ) ) ( not ( = ?auto_58827 ?auto_58823 ) ) ( not ( = ?auto_58821 ?auto_58823 ) ) ( TRUCK-AT ?auto_58810 ?auto_58817 ) )
    :subtasks
    ( ( !DRIVE ?auto_58810 ?auto_58817 ?auto_58822 )
      ( MAKE-ON ?auto_58806 ?auto_58807 )
      ( MAKE-ON-VERIFY ?auto_58806 ?auto_58807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58832 - SURFACE
      ?auto_58833 - SURFACE
    )
    :vars
    (
      ?auto_58843 - HOIST
      ?auto_58849 - PLACE
      ?auto_58853 - PLACE
      ?auto_58838 - HOIST
      ?auto_58848 - SURFACE
      ?auto_58840 - SURFACE
      ?auto_58835 - PLACE
      ?auto_58855 - HOIST
      ?auto_58837 - SURFACE
      ?auto_58847 - SURFACE
      ?auto_58850 - PLACE
      ?auto_58857 - HOIST
      ?auto_58856 - SURFACE
      ?auto_58846 - SURFACE
      ?auto_58839 - PLACE
      ?auto_58845 - HOIST
      ?auto_58851 - SURFACE
      ?auto_58842 - SURFACE
      ?auto_58844 - SURFACE
      ?auto_58834 - SURFACE
      ?auto_58836 - PLACE
      ?auto_58841 - HOIST
      ?auto_58854 - SURFACE
      ?auto_58852 - TRUCK
      ?auto_58858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58843 ?auto_58849 ) ( IS-CRATE ?auto_58832 ) ( not ( = ?auto_58832 ?auto_58833 ) ) ( not ( = ?auto_58853 ?auto_58849 ) ) ( HOIST-AT ?auto_58838 ?auto_58853 ) ( not ( = ?auto_58843 ?auto_58838 ) ) ( AVAILABLE ?auto_58838 ) ( SURFACE-AT ?auto_58832 ?auto_58853 ) ( ON ?auto_58832 ?auto_58848 ) ( CLEAR ?auto_58832 ) ( not ( = ?auto_58832 ?auto_58848 ) ) ( not ( = ?auto_58833 ?auto_58848 ) ) ( IS-CRATE ?auto_58833 ) ( not ( = ?auto_58832 ?auto_58840 ) ) ( not ( = ?auto_58833 ?auto_58840 ) ) ( not ( = ?auto_58848 ?auto_58840 ) ) ( not ( = ?auto_58835 ?auto_58849 ) ) ( not ( = ?auto_58853 ?auto_58835 ) ) ( HOIST-AT ?auto_58855 ?auto_58835 ) ( not ( = ?auto_58843 ?auto_58855 ) ) ( not ( = ?auto_58838 ?auto_58855 ) ) ( SURFACE-AT ?auto_58833 ?auto_58835 ) ( ON ?auto_58833 ?auto_58837 ) ( CLEAR ?auto_58833 ) ( not ( = ?auto_58832 ?auto_58837 ) ) ( not ( = ?auto_58833 ?auto_58837 ) ) ( not ( = ?auto_58848 ?auto_58837 ) ) ( not ( = ?auto_58840 ?auto_58837 ) ) ( IS-CRATE ?auto_58840 ) ( not ( = ?auto_58832 ?auto_58847 ) ) ( not ( = ?auto_58833 ?auto_58847 ) ) ( not ( = ?auto_58848 ?auto_58847 ) ) ( not ( = ?auto_58840 ?auto_58847 ) ) ( not ( = ?auto_58837 ?auto_58847 ) ) ( not ( = ?auto_58850 ?auto_58849 ) ) ( not ( = ?auto_58853 ?auto_58850 ) ) ( not ( = ?auto_58835 ?auto_58850 ) ) ( HOIST-AT ?auto_58857 ?auto_58850 ) ( not ( = ?auto_58843 ?auto_58857 ) ) ( not ( = ?auto_58838 ?auto_58857 ) ) ( not ( = ?auto_58855 ?auto_58857 ) ) ( AVAILABLE ?auto_58857 ) ( SURFACE-AT ?auto_58840 ?auto_58850 ) ( ON ?auto_58840 ?auto_58856 ) ( CLEAR ?auto_58840 ) ( not ( = ?auto_58832 ?auto_58856 ) ) ( not ( = ?auto_58833 ?auto_58856 ) ) ( not ( = ?auto_58848 ?auto_58856 ) ) ( not ( = ?auto_58840 ?auto_58856 ) ) ( not ( = ?auto_58837 ?auto_58856 ) ) ( not ( = ?auto_58847 ?auto_58856 ) ) ( IS-CRATE ?auto_58847 ) ( not ( = ?auto_58832 ?auto_58846 ) ) ( not ( = ?auto_58833 ?auto_58846 ) ) ( not ( = ?auto_58848 ?auto_58846 ) ) ( not ( = ?auto_58840 ?auto_58846 ) ) ( not ( = ?auto_58837 ?auto_58846 ) ) ( not ( = ?auto_58847 ?auto_58846 ) ) ( not ( = ?auto_58856 ?auto_58846 ) ) ( not ( = ?auto_58839 ?auto_58849 ) ) ( not ( = ?auto_58853 ?auto_58839 ) ) ( not ( = ?auto_58835 ?auto_58839 ) ) ( not ( = ?auto_58850 ?auto_58839 ) ) ( HOIST-AT ?auto_58845 ?auto_58839 ) ( not ( = ?auto_58843 ?auto_58845 ) ) ( not ( = ?auto_58838 ?auto_58845 ) ) ( not ( = ?auto_58855 ?auto_58845 ) ) ( not ( = ?auto_58857 ?auto_58845 ) ) ( AVAILABLE ?auto_58845 ) ( SURFACE-AT ?auto_58847 ?auto_58839 ) ( ON ?auto_58847 ?auto_58851 ) ( CLEAR ?auto_58847 ) ( not ( = ?auto_58832 ?auto_58851 ) ) ( not ( = ?auto_58833 ?auto_58851 ) ) ( not ( = ?auto_58848 ?auto_58851 ) ) ( not ( = ?auto_58840 ?auto_58851 ) ) ( not ( = ?auto_58837 ?auto_58851 ) ) ( not ( = ?auto_58847 ?auto_58851 ) ) ( not ( = ?auto_58856 ?auto_58851 ) ) ( not ( = ?auto_58846 ?auto_58851 ) ) ( IS-CRATE ?auto_58846 ) ( not ( = ?auto_58832 ?auto_58842 ) ) ( not ( = ?auto_58833 ?auto_58842 ) ) ( not ( = ?auto_58848 ?auto_58842 ) ) ( not ( = ?auto_58840 ?auto_58842 ) ) ( not ( = ?auto_58837 ?auto_58842 ) ) ( not ( = ?auto_58847 ?auto_58842 ) ) ( not ( = ?auto_58856 ?auto_58842 ) ) ( not ( = ?auto_58846 ?auto_58842 ) ) ( not ( = ?auto_58851 ?auto_58842 ) ) ( AVAILABLE ?auto_58855 ) ( SURFACE-AT ?auto_58846 ?auto_58835 ) ( ON ?auto_58846 ?auto_58844 ) ( CLEAR ?auto_58846 ) ( not ( = ?auto_58832 ?auto_58844 ) ) ( not ( = ?auto_58833 ?auto_58844 ) ) ( not ( = ?auto_58848 ?auto_58844 ) ) ( not ( = ?auto_58840 ?auto_58844 ) ) ( not ( = ?auto_58837 ?auto_58844 ) ) ( not ( = ?auto_58847 ?auto_58844 ) ) ( not ( = ?auto_58856 ?auto_58844 ) ) ( not ( = ?auto_58846 ?auto_58844 ) ) ( not ( = ?auto_58851 ?auto_58844 ) ) ( not ( = ?auto_58842 ?auto_58844 ) ) ( IS-CRATE ?auto_58842 ) ( not ( = ?auto_58832 ?auto_58834 ) ) ( not ( = ?auto_58833 ?auto_58834 ) ) ( not ( = ?auto_58848 ?auto_58834 ) ) ( not ( = ?auto_58840 ?auto_58834 ) ) ( not ( = ?auto_58837 ?auto_58834 ) ) ( not ( = ?auto_58847 ?auto_58834 ) ) ( not ( = ?auto_58856 ?auto_58834 ) ) ( not ( = ?auto_58846 ?auto_58834 ) ) ( not ( = ?auto_58851 ?auto_58834 ) ) ( not ( = ?auto_58842 ?auto_58834 ) ) ( not ( = ?auto_58844 ?auto_58834 ) ) ( not ( = ?auto_58836 ?auto_58849 ) ) ( not ( = ?auto_58853 ?auto_58836 ) ) ( not ( = ?auto_58835 ?auto_58836 ) ) ( not ( = ?auto_58850 ?auto_58836 ) ) ( not ( = ?auto_58839 ?auto_58836 ) ) ( HOIST-AT ?auto_58841 ?auto_58836 ) ( not ( = ?auto_58843 ?auto_58841 ) ) ( not ( = ?auto_58838 ?auto_58841 ) ) ( not ( = ?auto_58855 ?auto_58841 ) ) ( not ( = ?auto_58857 ?auto_58841 ) ) ( not ( = ?auto_58845 ?auto_58841 ) ) ( AVAILABLE ?auto_58841 ) ( SURFACE-AT ?auto_58842 ?auto_58836 ) ( ON ?auto_58842 ?auto_58854 ) ( CLEAR ?auto_58842 ) ( not ( = ?auto_58832 ?auto_58854 ) ) ( not ( = ?auto_58833 ?auto_58854 ) ) ( not ( = ?auto_58848 ?auto_58854 ) ) ( not ( = ?auto_58840 ?auto_58854 ) ) ( not ( = ?auto_58837 ?auto_58854 ) ) ( not ( = ?auto_58847 ?auto_58854 ) ) ( not ( = ?auto_58856 ?auto_58854 ) ) ( not ( = ?auto_58846 ?auto_58854 ) ) ( not ( = ?auto_58851 ?auto_58854 ) ) ( not ( = ?auto_58842 ?auto_58854 ) ) ( not ( = ?auto_58844 ?auto_58854 ) ) ( not ( = ?auto_58834 ?auto_58854 ) ) ( TRUCK-AT ?auto_58852 ?auto_58849 ) ( SURFACE-AT ?auto_58858 ?auto_58849 ) ( CLEAR ?auto_58858 ) ( LIFTING ?auto_58843 ?auto_58834 ) ( IS-CRATE ?auto_58834 ) ( not ( = ?auto_58832 ?auto_58858 ) ) ( not ( = ?auto_58833 ?auto_58858 ) ) ( not ( = ?auto_58848 ?auto_58858 ) ) ( not ( = ?auto_58840 ?auto_58858 ) ) ( not ( = ?auto_58837 ?auto_58858 ) ) ( not ( = ?auto_58847 ?auto_58858 ) ) ( not ( = ?auto_58856 ?auto_58858 ) ) ( not ( = ?auto_58846 ?auto_58858 ) ) ( not ( = ?auto_58851 ?auto_58858 ) ) ( not ( = ?auto_58842 ?auto_58858 ) ) ( not ( = ?auto_58844 ?auto_58858 ) ) ( not ( = ?auto_58834 ?auto_58858 ) ) ( not ( = ?auto_58854 ?auto_58858 ) ) )
    :subtasks
    ( ( !DROP ?auto_58843 ?auto_58834 ?auto_58858 ?auto_58849 )
      ( MAKE-ON ?auto_58832 ?auto_58833 )
      ( MAKE-ON-VERIFY ?auto_58832 ?auto_58833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58859 - SURFACE
      ?auto_58860 - SURFACE
    )
    :vars
    (
      ?auto_58884 - HOIST
      ?auto_58869 - PLACE
      ?auto_58861 - PLACE
      ?auto_58876 - HOIST
      ?auto_58875 - SURFACE
      ?auto_58870 - SURFACE
      ?auto_58877 - PLACE
      ?auto_58867 - HOIST
      ?auto_58874 - SURFACE
      ?auto_58882 - SURFACE
      ?auto_58864 - PLACE
      ?auto_58871 - HOIST
      ?auto_58868 - SURFACE
      ?auto_58880 - SURFACE
      ?auto_58872 - PLACE
      ?auto_58881 - HOIST
      ?auto_58863 - SURFACE
      ?auto_58878 - SURFACE
      ?auto_58873 - SURFACE
      ?auto_58879 - SURFACE
      ?auto_58885 - PLACE
      ?auto_58883 - HOIST
      ?auto_58865 - SURFACE
      ?auto_58862 - TRUCK
      ?auto_58866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58884 ?auto_58869 ) ( IS-CRATE ?auto_58859 ) ( not ( = ?auto_58859 ?auto_58860 ) ) ( not ( = ?auto_58861 ?auto_58869 ) ) ( HOIST-AT ?auto_58876 ?auto_58861 ) ( not ( = ?auto_58884 ?auto_58876 ) ) ( AVAILABLE ?auto_58876 ) ( SURFACE-AT ?auto_58859 ?auto_58861 ) ( ON ?auto_58859 ?auto_58875 ) ( CLEAR ?auto_58859 ) ( not ( = ?auto_58859 ?auto_58875 ) ) ( not ( = ?auto_58860 ?auto_58875 ) ) ( IS-CRATE ?auto_58860 ) ( not ( = ?auto_58859 ?auto_58870 ) ) ( not ( = ?auto_58860 ?auto_58870 ) ) ( not ( = ?auto_58875 ?auto_58870 ) ) ( not ( = ?auto_58877 ?auto_58869 ) ) ( not ( = ?auto_58861 ?auto_58877 ) ) ( HOIST-AT ?auto_58867 ?auto_58877 ) ( not ( = ?auto_58884 ?auto_58867 ) ) ( not ( = ?auto_58876 ?auto_58867 ) ) ( SURFACE-AT ?auto_58860 ?auto_58877 ) ( ON ?auto_58860 ?auto_58874 ) ( CLEAR ?auto_58860 ) ( not ( = ?auto_58859 ?auto_58874 ) ) ( not ( = ?auto_58860 ?auto_58874 ) ) ( not ( = ?auto_58875 ?auto_58874 ) ) ( not ( = ?auto_58870 ?auto_58874 ) ) ( IS-CRATE ?auto_58870 ) ( not ( = ?auto_58859 ?auto_58882 ) ) ( not ( = ?auto_58860 ?auto_58882 ) ) ( not ( = ?auto_58875 ?auto_58882 ) ) ( not ( = ?auto_58870 ?auto_58882 ) ) ( not ( = ?auto_58874 ?auto_58882 ) ) ( not ( = ?auto_58864 ?auto_58869 ) ) ( not ( = ?auto_58861 ?auto_58864 ) ) ( not ( = ?auto_58877 ?auto_58864 ) ) ( HOIST-AT ?auto_58871 ?auto_58864 ) ( not ( = ?auto_58884 ?auto_58871 ) ) ( not ( = ?auto_58876 ?auto_58871 ) ) ( not ( = ?auto_58867 ?auto_58871 ) ) ( AVAILABLE ?auto_58871 ) ( SURFACE-AT ?auto_58870 ?auto_58864 ) ( ON ?auto_58870 ?auto_58868 ) ( CLEAR ?auto_58870 ) ( not ( = ?auto_58859 ?auto_58868 ) ) ( not ( = ?auto_58860 ?auto_58868 ) ) ( not ( = ?auto_58875 ?auto_58868 ) ) ( not ( = ?auto_58870 ?auto_58868 ) ) ( not ( = ?auto_58874 ?auto_58868 ) ) ( not ( = ?auto_58882 ?auto_58868 ) ) ( IS-CRATE ?auto_58882 ) ( not ( = ?auto_58859 ?auto_58880 ) ) ( not ( = ?auto_58860 ?auto_58880 ) ) ( not ( = ?auto_58875 ?auto_58880 ) ) ( not ( = ?auto_58870 ?auto_58880 ) ) ( not ( = ?auto_58874 ?auto_58880 ) ) ( not ( = ?auto_58882 ?auto_58880 ) ) ( not ( = ?auto_58868 ?auto_58880 ) ) ( not ( = ?auto_58872 ?auto_58869 ) ) ( not ( = ?auto_58861 ?auto_58872 ) ) ( not ( = ?auto_58877 ?auto_58872 ) ) ( not ( = ?auto_58864 ?auto_58872 ) ) ( HOIST-AT ?auto_58881 ?auto_58872 ) ( not ( = ?auto_58884 ?auto_58881 ) ) ( not ( = ?auto_58876 ?auto_58881 ) ) ( not ( = ?auto_58867 ?auto_58881 ) ) ( not ( = ?auto_58871 ?auto_58881 ) ) ( AVAILABLE ?auto_58881 ) ( SURFACE-AT ?auto_58882 ?auto_58872 ) ( ON ?auto_58882 ?auto_58863 ) ( CLEAR ?auto_58882 ) ( not ( = ?auto_58859 ?auto_58863 ) ) ( not ( = ?auto_58860 ?auto_58863 ) ) ( not ( = ?auto_58875 ?auto_58863 ) ) ( not ( = ?auto_58870 ?auto_58863 ) ) ( not ( = ?auto_58874 ?auto_58863 ) ) ( not ( = ?auto_58882 ?auto_58863 ) ) ( not ( = ?auto_58868 ?auto_58863 ) ) ( not ( = ?auto_58880 ?auto_58863 ) ) ( IS-CRATE ?auto_58880 ) ( not ( = ?auto_58859 ?auto_58878 ) ) ( not ( = ?auto_58860 ?auto_58878 ) ) ( not ( = ?auto_58875 ?auto_58878 ) ) ( not ( = ?auto_58870 ?auto_58878 ) ) ( not ( = ?auto_58874 ?auto_58878 ) ) ( not ( = ?auto_58882 ?auto_58878 ) ) ( not ( = ?auto_58868 ?auto_58878 ) ) ( not ( = ?auto_58880 ?auto_58878 ) ) ( not ( = ?auto_58863 ?auto_58878 ) ) ( AVAILABLE ?auto_58867 ) ( SURFACE-AT ?auto_58880 ?auto_58877 ) ( ON ?auto_58880 ?auto_58873 ) ( CLEAR ?auto_58880 ) ( not ( = ?auto_58859 ?auto_58873 ) ) ( not ( = ?auto_58860 ?auto_58873 ) ) ( not ( = ?auto_58875 ?auto_58873 ) ) ( not ( = ?auto_58870 ?auto_58873 ) ) ( not ( = ?auto_58874 ?auto_58873 ) ) ( not ( = ?auto_58882 ?auto_58873 ) ) ( not ( = ?auto_58868 ?auto_58873 ) ) ( not ( = ?auto_58880 ?auto_58873 ) ) ( not ( = ?auto_58863 ?auto_58873 ) ) ( not ( = ?auto_58878 ?auto_58873 ) ) ( IS-CRATE ?auto_58878 ) ( not ( = ?auto_58859 ?auto_58879 ) ) ( not ( = ?auto_58860 ?auto_58879 ) ) ( not ( = ?auto_58875 ?auto_58879 ) ) ( not ( = ?auto_58870 ?auto_58879 ) ) ( not ( = ?auto_58874 ?auto_58879 ) ) ( not ( = ?auto_58882 ?auto_58879 ) ) ( not ( = ?auto_58868 ?auto_58879 ) ) ( not ( = ?auto_58880 ?auto_58879 ) ) ( not ( = ?auto_58863 ?auto_58879 ) ) ( not ( = ?auto_58878 ?auto_58879 ) ) ( not ( = ?auto_58873 ?auto_58879 ) ) ( not ( = ?auto_58885 ?auto_58869 ) ) ( not ( = ?auto_58861 ?auto_58885 ) ) ( not ( = ?auto_58877 ?auto_58885 ) ) ( not ( = ?auto_58864 ?auto_58885 ) ) ( not ( = ?auto_58872 ?auto_58885 ) ) ( HOIST-AT ?auto_58883 ?auto_58885 ) ( not ( = ?auto_58884 ?auto_58883 ) ) ( not ( = ?auto_58876 ?auto_58883 ) ) ( not ( = ?auto_58867 ?auto_58883 ) ) ( not ( = ?auto_58871 ?auto_58883 ) ) ( not ( = ?auto_58881 ?auto_58883 ) ) ( AVAILABLE ?auto_58883 ) ( SURFACE-AT ?auto_58878 ?auto_58885 ) ( ON ?auto_58878 ?auto_58865 ) ( CLEAR ?auto_58878 ) ( not ( = ?auto_58859 ?auto_58865 ) ) ( not ( = ?auto_58860 ?auto_58865 ) ) ( not ( = ?auto_58875 ?auto_58865 ) ) ( not ( = ?auto_58870 ?auto_58865 ) ) ( not ( = ?auto_58874 ?auto_58865 ) ) ( not ( = ?auto_58882 ?auto_58865 ) ) ( not ( = ?auto_58868 ?auto_58865 ) ) ( not ( = ?auto_58880 ?auto_58865 ) ) ( not ( = ?auto_58863 ?auto_58865 ) ) ( not ( = ?auto_58878 ?auto_58865 ) ) ( not ( = ?auto_58873 ?auto_58865 ) ) ( not ( = ?auto_58879 ?auto_58865 ) ) ( TRUCK-AT ?auto_58862 ?auto_58869 ) ( SURFACE-AT ?auto_58866 ?auto_58869 ) ( CLEAR ?auto_58866 ) ( IS-CRATE ?auto_58879 ) ( not ( = ?auto_58859 ?auto_58866 ) ) ( not ( = ?auto_58860 ?auto_58866 ) ) ( not ( = ?auto_58875 ?auto_58866 ) ) ( not ( = ?auto_58870 ?auto_58866 ) ) ( not ( = ?auto_58874 ?auto_58866 ) ) ( not ( = ?auto_58882 ?auto_58866 ) ) ( not ( = ?auto_58868 ?auto_58866 ) ) ( not ( = ?auto_58880 ?auto_58866 ) ) ( not ( = ?auto_58863 ?auto_58866 ) ) ( not ( = ?auto_58878 ?auto_58866 ) ) ( not ( = ?auto_58873 ?auto_58866 ) ) ( not ( = ?auto_58879 ?auto_58866 ) ) ( not ( = ?auto_58865 ?auto_58866 ) ) ( AVAILABLE ?auto_58884 ) ( IN ?auto_58879 ?auto_58862 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58884 ?auto_58879 ?auto_58862 ?auto_58869 )
      ( MAKE-ON ?auto_58859 ?auto_58860 )
      ( MAKE-ON-VERIFY ?auto_58859 ?auto_58860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58886 - SURFACE
      ?auto_58887 - SURFACE
    )
    :vars
    (
      ?auto_58910 - HOIST
      ?auto_58905 - PLACE
      ?auto_58907 - PLACE
      ?auto_58903 - HOIST
      ?auto_58908 - SURFACE
      ?auto_58893 - SURFACE
      ?auto_58909 - PLACE
      ?auto_58912 - HOIST
      ?auto_58889 - SURFACE
      ?auto_58901 - SURFACE
      ?auto_58906 - PLACE
      ?auto_58890 - HOIST
      ?auto_58896 - SURFACE
      ?auto_58899 - SURFACE
      ?auto_58891 - PLACE
      ?auto_58900 - HOIST
      ?auto_58911 - SURFACE
      ?auto_58897 - SURFACE
      ?auto_58894 - SURFACE
      ?auto_58898 - SURFACE
      ?auto_58888 - PLACE
      ?auto_58902 - HOIST
      ?auto_58904 - SURFACE
      ?auto_58895 - SURFACE
      ?auto_58892 - TRUCK
      ?auto_58913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58910 ?auto_58905 ) ( IS-CRATE ?auto_58886 ) ( not ( = ?auto_58886 ?auto_58887 ) ) ( not ( = ?auto_58907 ?auto_58905 ) ) ( HOIST-AT ?auto_58903 ?auto_58907 ) ( not ( = ?auto_58910 ?auto_58903 ) ) ( AVAILABLE ?auto_58903 ) ( SURFACE-AT ?auto_58886 ?auto_58907 ) ( ON ?auto_58886 ?auto_58908 ) ( CLEAR ?auto_58886 ) ( not ( = ?auto_58886 ?auto_58908 ) ) ( not ( = ?auto_58887 ?auto_58908 ) ) ( IS-CRATE ?auto_58887 ) ( not ( = ?auto_58886 ?auto_58893 ) ) ( not ( = ?auto_58887 ?auto_58893 ) ) ( not ( = ?auto_58908 ?auto_58893 ) ) ( not ( = ?auto_58909 ?auto_58905 ) ) ( not ( = ?auto_58907 ?auto_58909 ) ) ( HOIST-AT ?auto_58912 ?auto_58909 ) ( not ( = ?auto_58910 ?auto_58912 ) ) ( not ( = ?auto_58903 ?auto_58912 ) ) ( SURFACE-AT ?auto_58887 ?auto_58909 ) ( ON ?auto_58887 ?auto_58889 ) ( CLEAR ?auto_58887 ) ( not ( = ?auto_58886 ?auto_58889 ) ) ( not ( = ?auto_58887 ?auto_58889 ) ) ( not ( = ?auto_58908 ?auto_58889 ) ) ( not ( = ?auto_58893 ?auto_58889 ) ) ( IS-CRATE ?auto_58893 ) ( not ( = ?auto_58886 ?auto_58901 ) ) ( not ( = ?auto_58887 ?auto_58901 ) ) ( not ( = ?auto_58908 ?auto_58901 ) ) ( not ( = ?auto_58893 ?auto_58901 ) ) ( not ( = ?auto_58889 ?auto_58901 ) ) ( not ( = ?auto_58906 ?auto_58905 ) ) ( not ( = ?auto_58907 ?auto_58906 ) ) ( not ( = ?auto_58909 ?auto_58906 ) ) ( HOIST-AT ?auto_58890 ?auto_58906 ) ( not ( = ?auto_58910 ?auto_58890 ) ) ( not ( = ?auto_58903 ?auto_58890 ) ) ( not ( = ?auto_58912 ?auto_58890 ) ) ( AVAILABLE ?auto_58890 ) ( SURFACE-AT ?auto_58893 ?auto_58906 ) ( ON ?auto_58893 ?auto_58896 ) ( CLEAR ?auto_58893 ) ( not ( = ?auto_58886 ?auto_58896 ) ) ( not ( = ?auto_58887 ?auto_58896 ) ) ( not ( = ?auto_58908 ?auto_58896 ) ) ( not ( = ?auto_58893 ?auto_58896 ) ) ( not ( = ?auto_58889 ?auto_58896 ) ) ( not ( = ?auto_58901 ?auto_58896 ) ) ( IS-CRATE ?auto_58901 ) ( not ( = ?auto_58886 ?auto_58899 ) ) ( not ( = ?auto_58887 ?auto_58899 ) ) ( not ( = ?auto_58908 ?auto_58899 ) ) ( not ( = ?auto_58893 ?auto_58899 ) ) ( not ( = ?auto_58889 ?auto_58899 ) ) ( not ( = ?auto_58901 ?auto_58899 ) ) ( not ( = ?auto_58896 ?auto_58899 ) ) ( not ( = ?auto_58891 ?auto_58905 ) ) ( not ( = ?auto_58907 ?auto_58891 ) ) ( not ( = ?auto_58909 ?auto_58891 ) ) ( not ( = ?auto_58906 ?auto_58891 ) ) ( HOIST-AT ?auto_58900 ?auto_58891 ) ( not ( = ?auto_58910 ?auto_58900 ) ) ( not ( = ?auto_58903 ?auto_58900 ) ) ( not ( = ?auto_58912 ?auto_58900 ) ) ( not ( = ?auto_58890 ?auto_58900 ) ) ( AVAILABLE ?auto_58900 ) ( SURFACE-AT ?auto_58901 ?auto_58891 ) ( ON ?auto_58901 ?auto_58911 ) ( CLEAR ?auto_58901 ) ( not ( = ?auto_58886 ?auto_58911 ) ) ( not ( = ?auto_58887 ?auto_58911 ) ) ( not ( = ?auto_58908 ?auto_58911 ) ) ( not ( = ?auto_58893 ?auto_58911 ) ) ( not ( = ?auto_58889 ?auto_58911 ) ) ( not ( = ?auto_58901 ?auto_58911 ) ) ( not ( = ?auto_58896 ?auto_58911 ) ) ( not ( = ?auto_58899 ?auto_58911 ) ) ( IS-CRATE ?auto_58899 ) ( not ( = ?auto_58886 ?auto_58897 ) ) ( not ( = ?auto_58887 ?auto_58897 ) ) ( not ( = ?auto_58908 ?auto_58897 ) ) ( not ( = ?auto_58893 ?auto_58897 ) ) ( not ( = ?auto_58889 ?auto_58897 ) ) ( not ( = ?auto_58901 ?auto_58897 ) ) ( not ( = ?auto_58896 ?auto_58897 ) ) ( not ( = ?auto_58899 ?auto_58897 ) ) ( not ( = ?auto_58911 ?auto_58897 ) ) ( AVAILABLE ?auto_58912 ) ( SURFACE-AT ?auto_58899 ?auto_58909 ) ( ON ?auto_58899 ?auto_58894 ) ( CLEAR ?auto_58899 ) ( not ( = ?auto_58886 ?auto_58894 ) ) ( not ( = ?auto_58887 ?auto_58894 ) ) ( not ( = ?auto_58908 ?auto_58894 ) ) ( not ( = ?auto_58893 ?auto_58894 ) ) ( not ( = ?auto_58889 ?auto_58894 ) ) ( not ( = ?auto_58901 ?auto_58894 ) ) ( not ( = ?auto_58896 ?auto_58894 ) ) ( not ( = ?auto_58899 ?auto_58894 ) ) ( not ( = ?auto_58911 ?auto_58894 ) ) ( not ( = ?auto_58897 ?auto_58894 ) ) ( IS-CRATE ?auto_58897 ) ( not ( = ?auto_58886 ?auto_58898 ) ) ( not ( = ?auto_58887 ?auto_58898 ) ) ( not ( = ?auto_58908 ?auto_58898 ) ) ( not ( = ?auto_58893 ?auto_58898 ) ) ( not ( = ?auto_58889 ?auto_58898 ) ) ( not ( = ?auto_58901 ?auto_58898 ) ) ( not ( = ?auto_58896 ?auto_58898 ) ) ( not ( = ?auto_58899 ?auto_58898 ) ) ( not ( = ?auto_58911 ?auto_58898 ) ) ( not ( = ?auto_58897 ?auto_58898 ) ) ( not ( = ?auto_58894 ?auto_58898 ) ) ( not ( = ?auto_58888 ?auto_58905 ) ) ( not ( = ?auto_58907 ?auto_58888 ) ) ( not ( = ?auto_58909 ?auto_58888 ) ) ( not ( = ?auto_58906 ?auto_58888 ) ) ( not ( = ?auto_58891 ?auto_58888 ) ) ( HOIST-AT ?auto_58902 ?auto_58888 ) ( not ( = ?auto_58910 ?auto_58902 ) ) ( not ( = ?auto_58903 ?auto_58902 ) ) ( not ( = ?auto_58912 ?auto_58902 ) ) ( not ( = ?auto_58890 ?auto_58902 ) ) ( not ( = ?auto_58900 ?auto_58902 ) ) ( AVAILABLE ?auto_58902 ) ( SURFACE-AT ?auto_58897 ?auto_58888 ) ( ON ?auto_58897 ?auto_58904 ) ( CLEAR ?auto_58897 ) ( not ( = ?auto_58886 ?auto_58904 ) ) ( not ( = ?auto_58887 ?auto_58904 ) ) ( not ( = ?auto_58908 ?auto_58904 ) ) ( not ( = ?auto_58893 ?auto_58904 ) ) ( not ( = ?auto_58889 ?auto_58904 ) ) ( not ( = ?auto_58901 ?auto_58904 ) ) ( not ( = ?auto_58896 ?auto_58904 ) ) ( not ( = ?auto_58899 ?auto_58904 ) ) ( not ( = ?auto_58911 ?auto_58904 ) ) ( not ( = ?auto_58897 ?auto_58904 ) ) ( not ( = ?auto_58894 ?auto_58904 ) ) ( not ( = ?auto_58898 ?auto_58904 ) ) ( SURFACE-AT ?auto_58895 ?auto_58905 ) ( CLEAR ?auto_58895 ) ( IS-CRATE ?auto_58898 ) ( not ( = ?auto_58886 ?auto_58895 ) ) ( not ( = ?auto_58887 ?auto_58895 ) ) ( not ( = ?auto_58908 ?auto_58895 ) ) ( not ( = ?auto_58893 ?auto_58895 ) ) ( not ( = ?auto_58889 ?auto_58895 ) ) ( not ( = ?auto_58901 ?auto_58895 ) ) ( not ( = ?auto_58896 ?auto_58895 ) ) ( not ( = ?auto_58899 ?auto_58895 ) ) ( not ( = ?auto_58911 ?auto_58895 ) ) ( not ( = ?auto_58897 ?auto_58895 ) ) ( not ( = ?auto_58894 ?auto_58895 ) ) ( not ( = ?auto_58898 ?auto_58895 ) ) ( not ( = ?auto_58904 ?auto_58895 ) ) ( AVAILABLE ?auto_58910 ) ( IN ?auto_58898 ?auto_58892 ) ( TRUCK-AT ?auto_58892 ?auto_58913 ) ( not ( = ?auto_58913 ?auto_58905 ) ) ( not ( = ?auto_58907 ?auto_58913 ) ) ( not ( = ?auto_58909 ?auto_58913 ) ) ( not ( = ?auto_58906 ?auto_58913 ) ) ( not ( = ?auto_58891 ?auto_58913 ) ) ( not ( = ?auto_58888 ?auto_58913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58892 ?auto_58913 ?auto_58905 )
      ( MAKE-ON ?auto_58886 ?auto_58887 )
      ( MAKE-ON-VERIFY ?auto_58886 ?auto_58887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58914 - SURFACE
      ?auto_58915 - SURFACE
    )
    :vars
    (
      ?auto_58932 - HOIST
      ?auto_58927 - PLACE
      ?auto_58929 - PLACE
      ?auto_58933 - HOIST
      ?auto_58930 - SURFACE
      ?auto_58938 - SURFACE
      ?auto_58931 - PLACE
      ?auto_58924 - HOIST
      ?auto_58920 - SURFACE
      ?auto_58918 - SURFACE
      ?auto_58928 - PLACE
      ?auto_58921 - HOIST
      ?auto_58936 - SURFACE
      ?auto_58937 - SURFACE
      ?auto_58917 - PLACE
      ?auto_58916 - HOIST
      ?auto_58925 - SURFACE
      ?auto_58919 - SURFACE
      ?auto_58941 - SURFACE
      ?auto_58922 - SURFACE
      ?auto_58934 - PLACE
      ?auto_58940 - HOIST
      ?auto_58926 - SURFACE
      ?auto_58935 - SURFACE
      ?auto_58923 - TRUCK
      ?auto_58939 - PLACE
      ?auto_58942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58932 ?auto_58927 ) ( IS-CRATE ?auto_58914 ) ( not ( = ?auto_58914 ?auto_58915 ) ) ( not ( = ?auto_58929 ?auto_58927 ) ) ( HOIST-AT ?auto_58933 ?auto_58929 ) ( not ( = ?auto_58932 ?auto_58933 ) ) ( AVAILABLE ?auto_58933 ) ( SURFACE-AT ?auto_58914 ?auto_58929 ) ( ON ?auto_58914 ?auto_58930 ) ( CLEAR ?auto_58914 ) ( not ( = ?auto_58914 ?auto_58930 ) ) ( not ( = ?auto_58915 ?auto_58930 ) ) ( IS-CRATE ?auto_58915 ) ( not ( = ?auto_58914 ?auto_58938 ) ) ( not ( = ?auto_58915 ?auto_58938 ) ) ( not ( = ?auto_58930 ?auto_58938 ) ) ( not ( = ?auto_58931 ?auto_58927 ) ) ( not ( = ?auto_58929 ?auto_58931 ) ) ( HOIST-AT ?auto_58924 ?auto_58931 ) ( not ( = ?auto_58932 ?auto_58924 ) ) ( not ( = ?auto_58933 ?auto_58924 ) ) ( SURFACE-AT ?auto_58915 ?auto_58931 ) ( ON ?auto_58915 ?auto_58920 ) ( CLEAR ?auto_58915 ) ( not ( = ?auto_58914 ?auto_58920 ) ) ( not ( = ?auto_58915 ?auto_58920 ) ) ( not ( = ?auto_58930 ?auto_58920 ) ) ( not ( = ?auto_58938 ?auto_58920 ) ) ( IS-CRATE ?auto_58938 ) ( not ( = ?auto_58914 ?auto_58918 ) ) ( not ( = ?auto_58915 ?auto_58918 ) ) ( not ( = ?auto_58930 ?auto_58918 ) ) ( not ( = ?auto_58938 ?auto_58918 ) ) ( not ( = ?auto_58920 ?auto_58918 ) ) ( not ( = ?auto_58928 ?auto_58927 ) ) ( not ( = ?auto_58929 ?auto_58928 ) ) ( not ( = ?auto_58931 ?auto_58928 ) ) ( HOIST-AT ?auto_58921 ?auto_58928 ) ( not ( = ?auto_58932 ?auto_58921 ) ) ( not ( = ?auto_58933 ?auto_58921 ) ) ( not ( = ?auto_58924 ?auto_58921 ) ) ( AVAILABLE ?auto_58921 ) ( SURFACE-AT ?auto_58938 ?auto_58928 ) ( ON ?auto_58938 ?auto_58936 ) ( CLEAR ?auto_58938 ) ( not ( = ?auto_58914 ?auto_58936 ) ) ( not ( = ?auto_58915 ?auto_58936 ) ) ( not ( = ?auto_58930 ?auto_58936 ) ) ( not ( = ?auto_58938 ?auto_58936 ) ) ( not ( = ?auto_58920 ?auto_58936 ) ) ( not ( = ?auto_58918 ?auto_58936 ) ) ( IS-CRATE ?auto_58918 ) ( not ( = ?auto_58914 ?auto_58937 ) ) ( not ( = ?auto_58915 ?auto_58937 ) ) ( not ( = ?auto_58930 ?auto_58937 ) ) ( not ( = ?auto_58938 ?auto_58937 ) ) ( not ( = ?auto_58920 ?auto_58937 ) ) ( not ( = ?auto_58918 ?auto_58937 ) ) ( not ( = ?auto_58936 ?auto_58937 ) ) ( not ( = ?auto_58917 ?auto_58927 ) ) ( not ( = ?auto_58929 ?auto_58917 ) ) ( not ( = ?auto_58931 ?auto_58917 ) ) ( not ( = ?auto_58928 ?auto_58917 ) ) ( HOIST-AT ?auto_58916 ?auto_58917 ) ( not ( = ?auto_58932 ?auto_58916 ) ) ( not ( = ?auto_58933 ?auto_58916 ) ) ( not ( = ?auto_58924 ?auto_58916 ) ) ( not ( = ?auto_58921 ?auto_58916 ) ) ( AVAILABLE ?auto_58916 ) ( SURFACE-AT ?auto_58918 ?auto_58917 ) ( ON ?auto_58918 ?auto_58925 ) ( CLEAR ?auto_58918 ) ( not ( = ?auto_58914 ?auto_58925 ) ) ( not ( = ?auto_58915 ?auto_58925 ) ) ( not ( = ?auto_58930 ?auto_58925 ) ) ( not ( = ?auto_58938 ?auto_58925 ) ) ( not ( = ?auto_58920 ?auto_58925 ) ) ( not ( = ?auto_58918 ?auto_58925 ) ) ( not ( = ?auto_58936 ?auto_58925 ) ) ( not ( = ?auto_58937 ?auto_58925 ) ) ( IS-CRATE ?auto_58937 ) ( not ( = ?auto_58914 ?auto_58919 ) ) ( not ( = ?auto_58915 ?auto_58919 ) ) ( not ( = ?auto_58930 ?auto_58919 ) ) ( not ( = ?auto_58938 ?auto_58919 ) ) ( not ( = ?auto_58920 ?auto_58919 ) ) ( not ( = ?auto_58918 ?auto_58919 ) ) ( not ( = ?auto_58936 ?auto_58919 ) ) ( not ( = ?auto_58937 ?auto_58919 ) ) ( not ( = ?auto_58925 ?auto_58919 ) ) ( AVAILABLE ?auto_58924 ) ( SURFACE-AT ?auto_58937 ?auto_58931 ) ( ON ?auto_58937 ?auto_58941 ) ( CLEAR ?auto_58937 ) ( not ( = ?auto_58914 ?auto_58941 ) ) ( not ( = ?auto_58915 ?auto_58941 ) ) ( not ( = ?auto_58930 ?auto_58941 ) ) ( not ( = ?auto_58938 ?auto_58941 ) ) ( not ( = ?auto_58920 ?auto_58941 ) ) ( not ( = ?auto_58918 ?auto_58941 ) ) ( not ( = ?auto_58936 ?auto_58941 ) ) ( not ( = ?auto_58937 ?auto_58941 ) ) ( not ( = ?auto_58925 ?auto_58941 ) ) ( not ( = ?auto_58919 ?auto_58941 ) ) ( IS-CRATE ?auto_58919 ) ( not ( = ?auto_58914 ?auto_58922 ) ) ( not ( = ?auto_58915 ?auto_58922 ) ) ( not ( = ?auto_58930 ?auto_58922 ) ) ( not ( = ?auto_58938 ?auto_58922 ) ) ( not ( = ?auto_58920 ?auto_58922 ) ) ( not ( = ?auto_58918 ?auto_58922 ) ) ( not ( = ?auto_58936 ?auto_58922 ) ) ( not ( = ?auto_58937 ?auto_58922 ) ) ( not ( = ?auto_58925 ?auto_58922 ) ) ( not ( = ?auto_58919 ?auto_58922 ) ) ( not ( = ?auto_58941 ?auto_58922 ) ) ( not ( = ?auto_58934 ?auto_58927 ) ) ( not ( = ?auto_58929 ?auto_58934 ) ) ( not ( = ?auto_58931 ?auto_58934 ) ) ( not ( = ?auto_58928 ?auto_58934 ) ) ( not ( = ?auto_58917 ?auto_58934 ) ) ( HOIST-AT ?auto_58940 ?auto_58934 ) ( not ( = ?auto_58932 ?auto_58940 ) ) ( not ( = ?auto_58933 ?auto_58940 ) ) ( not ( = ?auto_58924 ?auto_58940 ) ) ( not ( = ?auto_58921 ?auto_58940 ) ) ( not ( = ?auto_58916 ?auto_58940 ) ) ( AVAILABLE ?auto_58940 ) ( SURFACE-AT ?auto_58919 ?auto_58934 ) ( ON ?auto_58919 ?auto_58926 ) ( CLEAR ?auto_58919 ) ( not ( = ?auto_58914 ?auto_58926 ) ) ( not ( = ?auto_58915 ?auto_58926 ) ) ( not ( = ?auto_58930 ?auto_58926 ) ) ( not ( = ?auto_58938 ?auto_58926 ) ) ( not ( = ?auto_58920 ?auto_58926 ) ) ( not ( = ?auto_58918 ?auto_58926 ) ) ( not ( = ?auto_58936 ?auto_58926 ) ) ( not ( = ?auto_58937 ?auto_58926 ) ) ( not ( = ?auto_58925 ?auto_58926 ) ) ( not ( = ?auto_58919 ?auto_58926 ) ) ( not ( = ?auto_58941 ?auto_58926 ) ) ( not ( = ?auto_58922 ?auto_58926 ) ) ( SURFACE-AT ?auto_58935 ?auto_58927 ) ( CLEAR ?auto_58935 ) ( IS-CRATE ?auto_58922 ) ( not ( = ?auto_58914 ?auto_58935 ) ) ( not ( = ?auto_58915 ?auto_58935 ) ) ( not ( = ?auto_58930 ?auto_58935 ) ) ( not ( = ?auto_58938 ?auto_58935 ) ) ( not ( = ?auto_58920 ?auto_58935 ) ) ( not ( = ?auto_58918 ?auto_58935 ) ) ( not ( = ?auto_58936 ?auto_58935 ) ) ( not ( = ?auto_58937 ?auto_58935 ) ) ( not ( = ?auto_58925 ?auto_58935 ) ) ( not ( = ?auto_58919 ?auto_58935 ) ) ( not ( = ?auto_58941 ?auto_58935 ) ) ( not ( = ?auto_58922 ?auto_58935 ) ) ( not ( = ?auto_58926 ?auto_58935 ) ) ( AVAILABLE ?auto_58932 ) ( TRUCK-AT ?auto_58923 ?auto_58939 ) ( not ( = ?auto_58939 ?auto_58927 ) ) ( not ( = ?auto_58929 ?auto_58939 ) ) ( not ( = ?auto_58931 ?auto_58939 ) ) ( not ( = ?auto_58928 ?auto_58939 ) ) ( not ( = ?auto_58917 ?auto_58939 ) ) ( not ( = ?auto_58934 ?auto_58939 ) ) ( HOIST-AT ?auto_58942 ?auto_58939 ) ( LIFTING ?auto_58942 ?auto_58922 ) ( not ( = ?auto_58932 ?auto_58942 ) ) ( not ( = ?auto_58933 ?auto_58942 ) ) ( not ( = ?auto_58924 ?auto_58942 ) ) ( not ( = ?auto_58921 ?auto_58942 ) ) ( not ( = ?auto_58916 ?auto_58942 ) ) ( not ( = ?auto_58940 ?auto_58942 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58942 ?auto_58922 ?auto_58923 ?auto_58939 )
      ( MAKE-ON ?auto_58914 ?auto_58915 )
      ( MAKE-ON-VERIFY ?auto_58914 ?auto_58915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58943 - SURFACE
      ?auto_58944 - SURFACE
    )
    :vars
    (
      ?auto_58959 - HOIST
      ?auto_58970 - PLACE
      ?auto_58971 - PLACE
      ?auto_58946 - HOIST
      ?auto_58957 - SURFACE
      ?auto_58952 - SURFACE
      ?auto_58954 - PLACE
      ?auto_58968 - HOIST
      ?auto_58969 - SURFACE
      ?auto_58958 - SURFACE
      ?auto_58965 - PLACE
      ?auto_58955 - HOIST
      ?auto_58950 - SURFACE
      ?auto_58962 - SURFACE
      ?auto_58963 - PLACE
      ?auto_58945 - HOIST
      ?auto_58964 - SURFACE
      ?auto_58966 - SURFACE
      ?auto_58961 - SURFACE
      ?auto_58967 - SURFACE
      ?auto_58953 - PLACE
      ?auto_58949 - HOIST
      ?auto_58956 - SURFACE
      ?auto_58951 - SURFACE
      ?auto_58948 - TRUCK
      ?auto_58947 - PLACE
      ?auto_58960 - HOIST
      ?auto_58972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58959 ?auto_58970 ) ( IS-CRATE ?auto_58943 ) ( not ( = ?auto_58943 ?auto_58944 ) ) ( not ( = ?auto_58971 ?auto_58970 ) ) ( HOIST-AT ?auto_58946 ?auto_58971 ) ( not ( = ?auto_58959 ?auto_58946 ) ) ( AVAILABLE ?auto_58946 ) ( SURFACE-AT ?auto_58943 ?auto_58971 ) ( ON ?auto_58943 ?auto_58957 ) ( CLEAR ?auto_58943 ) ( not ( = ?auto_58943 ?auto_58957 ) ) ( not ( = ?auto_58944 ?auto_58957 ) ) ( IS-CRATE ?auto_58944 ) ( not ( = ?auto_58943 ?auto_58952 ) ) ( not ( = ?auto_58944 ?auto_58952 ) ) ( not ( = ?auto_58957 ?auto_58952 ) ) ( not ( = ?auto_58954 ?auto_58970 ) ) ( not ( = ?auto_58971 ?auto_58954 ) ) ( HOIST-AT ?auto_58968 ?auto_58954 ) ( not ( = ?auto_58959 ?auto_58968 ) ) ( not ( = ?auto_58946 ?auto_58968 ) ) ( SURFACE-AT ?auto_58944 ?auto_58954 ) ( ON ?auto_58944 ?auto_58969 ) ( CLEAR ?auto_58944 ) ( not ( = ?auto_58943 ?auto_58969 ) ) ( not ( = ?auto_58944 ?auto_58969 ) ) ( not ( = ?auto_58957 ?auto_58969 ) ) ( not ( = ?auto_58952 ?auto_58969 ) ) ( IS-CRATE ?auto_58952 ) ( not ( = ?auto_58943 ?auto_58958 ) ) ( not ( = ?auto_58944 ?auto_58958 ) ) ( not ( = ?auto_58957 ?auto_58958 ) ) ( not ( = ?auto_58952 ?auto_58958 ) ) ( not ( = ?auto_58969 ?auto_58958 ) ) ( not ( = ?auto_58965 ?auto_58970 ) ) ( not ( = ?auto_58971 ?auto_58965 ) ) ( not ( = ?auto_58954 ?auto_58965 ) ) ( HOIST-AT ?auto_58955 ?auto_58965 ) ( not ( = ?auto_58959 ?auto_58955 ) ) ( not ( = ?auto_58946 ?auto_58955 ) ) ( not ( = ?auto_58968 ?auto_58955 ) ) ( AVAILABLE ?auto_58955 ) ( SURFACE-AT ?auto_58952 ?auto_58965 ) ( ON ?auto_58952 ?auto_58950 ) ( CLEAR ?auto_58952 ) ( not ( = ?auto_58943 ?auto_58950 ) ) ( not ( = ?auto_58944 ?auto_58950 ) ) ( not ( = ?auto_58957 ?auto_58950 ) ) ( not ( = ?auto_58952 ?auto_58950 ) ) ( not ( = ?auto_58969 ?auto_58950 ) ) ( not ( = ?auto_58958 ?auto_58950 ) ) ( IS-CRATE ?auto_58958 ) ( not ( = ?auto_58943 ?auto_58962 ) ) ( not ( = ?auto_58944 ?auto_58962 ) ) ( not ( = ?auto_58957 ?auto_58962 ) ) ( not ( = ?auto_58952 ?auto_58962 ) ) ( not ( = ?auto_58969 ?auto_58962 ) ) ( not ( = ?auto_58958 ?auto_58962 ) ) ( not ( = ?auto_58950 ?auto_58962 ) ) ( not ( = ?auto_58963 ?auto_58970 ) ) ( not ( = ?auto_58971 ?auto_58963 ) ) ( not ( = ?auto_58954 ?auto_58963 ) ) ( not ( = ?auto_58965 ?auto_58963 ) ) ( HOIST-AT ?auto_58945 ?auto_58963 ) ( not ( = ?auto_58959 ?auto_58945 ) ) ( not ( = ?auto_58946 ?auto_58945 ) ) ( not ( = ?auto_58968 ?auto_58945 ) ) ( not ( = ?auto_58955 ?auto_58945 ) ) ( AVAILABLE ?auto_58945 ) ( SURFACE-AT ?auto_58958 ?auto_58963 ) ( ON ?auto_58958 ?auto_58964 ) ( CLEAR ?auto_58958 ) ( not ( = ?auto_58943 ?auto_58964 ) ) ( not ( = ?auto_58944 ?auto_58964 ) ) ( not ( = ?auto_58957 ?auto_58964 ) ) ( not ( = ?auto_58952 ?auto_58964 ) ) ( not ( = ?auto_58969 ?auto_58964 ) ) ( not ( = ?auto_58958 ?auto_58964 ) ) ( not ( = ?auto_58950 ?auto_58964 ) ) ( not ( = ?auto_58962 ?auto_58964 ) ) ( IS-CRATE ?auto_58962 ) ( not ( = ?auto_58943 ?auto_58966 ) ) ( not ( = ?auto_58944 ?auto_58966 ) ) ( not ( = ?auto_58957 ?auto_58966 ) ) ( not ( = ?auto_58952 ?auto_58966 ) ) ( not ( = ?auto_58969 ?auto_58966 ) ) ( not ( = ?auto_58958 ?auto_58966 ) ) ( not ( = ?auto_58950 ?auto_58966 ) ) ( not ( = ?auto_58962 ?auto_58966 ) ) ( not ( = ?auto_58964 ?auto_58966 ) ) ( AVAILABLE ?auto_58968 ) ( SURFACE-AT ?auto_58962 ?auto_58954 ) ( ON ?auto_58962 ?auto_58961 ) ( CLEAR ?auto_58962 ) ( not ( = ?auto_58943 ?auto_58961 ) ) ( not ( = ?auto_58944 ?auto_58961 ) ) ( not ( = ?auto_58957 ?auto_58961 ) ) ( not ( = ?auto_58952 ?auto_58961 ) ) ( not ( = ?auto_58969 ?auto_58961 ) ) ( not ( = ?auto_58958 ?auto_58961 ) ) ( not ( = ?auto_58950 ?auto_58961 ) ) ( not ( = ?auto_58962 ?auto_58961 ) ) ( not ( = ?auto_58964 ?auto_58961 ) ) ( not ( = ?auto_58966 ?auto_58961 ) ) ( IS-CRATE ?auto_58966 ) ( not ( = ?auto_58943 ?auto_58967 ) ) ( not ( = ?auto_58944 ?auto_58967 ) ) ( not ( = ?auto_58957 ?auto_58967 ) ) ( not ( = ?auto_58952 ?auto_58967 ) ) ( not ( = ?auto_58969 ?auto_58967 ) ) ( not ( = ?auto_58958 ?auto_58967 ) ) ( not ( = ?auto_58950 ?auto_58967 ) ) ( not ( = ?auto_58962 ?auto_58967 ) ) ( not ( = ?auto_58964 ?auto_58967 ) ) ( not ( = ?auto_58966 ?auto_58967 ) ) ( not ( = ?auto_58961 ?auto_58967 ) ) ( not ( = ?auto_58953 ?auto_58970 ) ) ( not ( = ?auto_58971 ?auto_58953 ) ) ( not ( = ?auto_58954 ?auto_58953 ) ) ( not ( = ?auto_58965 ?auto_58953 ) ) ( not ( = ?auto_58963 ?auto_58953 ) ) ( HOIST-AT ?auto_58949 ?auto_58953 ) ( not ( = ?auto_58959 ?auto_58949 ) ) ( not ( = ?auto_58946 ?auto_58949 ) ) ( not ( = ?auto_58968 ?auto_58949 ) ) ( not ( = ?auto_58955 ?auto_58949 ) ) ( not ( = ?auto_58945 ?auto_58949 ) ) ( AVAILABLE ?auto_58949 ) ( SURFACE-AT ?auto_58966 ?auto_58953 ) ( ON ?auto_58966 ?auto_58956 ) ( CLEAR ?auto_58966 ) ( not ( = ?auto_58943 ?auto_58956 ) ) ( not ( = ?auto_58944 ?auto_58956 ) ) ( not ( = ?auto_58957 ?auto_58956 ) ) ( not ( = ?auto_58952 ?auto_58956 ) ) ( not ( = ?auto_58969 ?auto_58956 ) ) ( not ( = ?auto_58958 ?auto_58956 ) ) ( not ( = ?auto_58950 ?auto_58956 ) ) ( not ( = ?auto_58962 ?auto_58956 ) ) ( not ( = ?auto_58964 ?auto_58956 ) ) ( not ( = ?auto_58966 ?auto_58956 ) ) ( not ( = ?auto_58961 ?auto_58956 ) ) ( not ( = ?auto_58967 ?auto_58956 ) ) ( SURFACE-AT ?auto_58951 ?auto_58970 ) ( CLEAR ?auto_58951 ) ( IS-CRATE ?auto_58967 ) ( not ( = ?auto_58943 ?auto_58951 ) ) ( not ( = ?auto_58944 ?auto_58951 ) ) ( not ( = ?auto_58957 ?auto_58951 ) ) ( not ( = ?auto_58952 ?auto_58951 ) ) ( not ( = ?auto_58969 ?auto_58951 ) ) ( not ( = ?auto_58958 ?auto_58951 ) ) ( not ( = ?auto_58950 ?auto_58951 ) ) ( not ( = ?auto_58962 ?auto_58951 ) ) ( not ( = ?auto_58964 ?auto_58951 ) ) ( not ( = ?auto_58966 ?auto_58951 ) ) ( not ( = ?auto_58961 ?auto_58951 ) ) ( not ( = ?auto_58967 ?auto_58951 ) ) ( not ( = ?auto_58956 ?auto_58951 ) ) ( AVAILABLE ?auto_58959 ) ( TRUCK-AT ?auto_58948 ?auto_58947 ) ( not ( = ?auto_58947 ?auto_58970 ) ) ( not ( = ?auto_58971 ?auto_58947 ) ) ( not ( = ?auto_58954 ?auto_58947 ) ) ( not ( = ?auto_58965 ?auto_58947 ) ) ( not ( = ?auto_58963 ?auto_58947 ) ) ( not ( = ?auto_58953 ?auto_58947 ) ) ( HOIST-AT ?auto_58960 ?auto_58947 ) ( not ( = ?auto_58959 ?auto_58960 ) ) ( not ( = ?auto_58946 ?auto_58960 ) ) ( not ( = ?auto_58968 ?auto_58960 ) ) ( not ( = ?auto_58955 ?auto_58960 ) ) ( not ( = ?auto_58945 ?auto_58960 ) ) ( not ( = ?auto_58949 ?auto_58960 ) ) ( AVAILABLE ?auto_58960 ) ( SURFACE-AT ?auto_58967 ?auto_58947 ) ( ON ?auto_58967 ?auto_58972 ) ( CLEAR ?auto_58967 ) ( not ( = ?auto_58943 ?auto_58972 ) ) ( not ( = ?auto_58944 ?auto_58972 ) ) ( not ( = ?auto_58957 ?auto_58972 ) ) ( not ( = ?auto_58952 ?auto_58972 ) ) ( not ( = ?auto_58969 ?auto_58972 ) ) ( not ( = ?auto_58958 ?auto_58972 ) ) ( not ( = ?auto_58950 ?auto_58972 ) ) ( not ( = ?auto_58962 ?auto_58972 ) ) ( not ( = ?auto_58964 ?auto_58972 ) ) ( not ( = ?auto_58966 ?auto_58972 ) ) ( not ( = ?auto_58961 ?auto_58972 ) ) ( not ( = ?auto_58967 ?auto_58972 ) ) ( not ( = ?auto_58956 ?auto_58972 ) ) ( not ( = ?auto_58951 ?auto_58972 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58960 ?auto_58967 ?auto_58972 ?auto_58947 )
      ( MAKE-ON ?auto_58943 ?auto_58944 )
      ( MAKE-ON-VERIFY ?auto_58943 ?auto_58944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58973 - SURFACE
      ?auto_58974 - SURFACE
    )
    :vars
    (
      ?auto_58980 - HOIST
      ?auto_58975 - PLACE
      ?auto_58983 - PLACE
      ?auto_58979 - HOIST
      ?auto_58999 - SURFACE
      ?auto_59001 - SURFACE
      ?auto_58998 - PLACE
      ?auto_58984 - HOIST
      ?auto_58976 - SURFACE
      ?auto_58978 - SURFACE
      ?auto_58989 - PLACE
      ?auto_58982 - HOIST
      ?auto_59002 - SURFACE
      ?auto_58986 - SURFACE
      ?auto_58987 - PLACE
      ?auto_58993 - HOIST
      ?auto_58988 - SURFACE
      ?auto_58990 - SURFACE
      ?auto_58985 - SURFACE
      ?auto_58994 - SURFACE
      ?auto_58992 - PLACE
      ?auto_58977 - HOIST
      ?auto_58981 - SURFACE
      ?auto_58996 - SURFACE
      ?auto_58997 - PLACE
      ?auto_58995 - HOIST
      ?auto_58991 - SURFACE
      ?auto_59000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58980 ?auto_58975 ) ( IS-CRATE ?auto_58973 ) ( not ( = ?auto_58973 ?auto_58974 ) ) ( not ( = ?auto_58983 ?auto_58975 ) ) ( HOIST-AT ?auto_58979 ?auto_58983 ) ( not ( = ?auto_58980 ?auto_58979 ) ) ( AVAILABLE ?auto_58979 ) ( SURFACE-AT ?auto_58973 ?auto_58983 ) ( ON ?auto_58973 ?auto_58999 ) ( CLEAR ?auto_58973 ) ( not ( = ?auto_58973 ?auto_58999 ) ) ( not ( = ?auto_58974 ?auto_58999 ) ) ( IS-CRATE ?auto_58974 ) ( not ( = ?auto_58973 ?auto_59001 ) ) ( not ( = ?auto_58974 ?auto_59001 ) ) ( not ( = ?auto_58999 ?auto_59001 ) ) ( not ( = ?auto_58998 ?auto_58975 ) ) ( not ( = ?auto_58983 ?auto_58998 ) ) ( HOIST-AT ?auto_58984 ?auto_58998 ) ( not ( = ?auto_58980 ?auto_58984 ) ) ( not ( = ?auto_58979 ?auto_58984 ) ) ( SURFACE-AT ?auto_58974 ?auto_58998 ) ( ON ?auto_58974 ?auto_58976 ) ( CLEAR ?auto_58974 ) ( not ( = ?auto_58973 ?auto_58976 ) ) ( not ( = ?auto_58974 ?auto_58976 ) ) ( not ( = ?auto_58999 ?auto_58976 ) ) ( not ( = ?auto_59001 ?auto_58976 ) ) ( IS-CRATE ?auto_59001 ) ( not ( = ?auto_58973 ?auto_58978 ) ) ( not ( = ?auto_58974 ?auto_58978 ) ) ( not ( = ?auto_58999 ?auto_58978 ) ) ( not ( = ?auto_59001 ?auto_58978 ) ) ( not ( = ?auto_58976 ?auto_58978 ) ) ( not ( = ?auto_58989 ?auto_58975 ) ) ( not ( = ?auto_58983 ?auto_58989 ) ) ( not ( = ?auto_58998 ?auto_58989 ) ) ( HOIST-AT ?auto_58982 ?auto_58989 ) ( not ( = ?auto_58980 ?auto_58982 ) ) ( not ( = ?auto_58979 ?auto_58982 ) ) ( not ( = ?auto_58984 ?auto_58982 ) ) ( AVAILABLE ?auto_58982 ) ( SURFACE-AT ?auto_59001 ?auto_58989 ) ( ON ?auto_59001 ?auto_59002 ) ( CLEAR ?auto_59001 ) ( not ( = ?auto_58973 ?auto_59002 ) ) ( not ( = ?auto_58974 ?auto_59002 ) ) ( not ( = ?auto_58999 ?auto_59002 ) ) ( not ( = ?auto_59001 ?auto_59002 ) ) ( not ( = ?auto_58976 ?auto_59002 ) ) ( not ( = ?auto_58978 ?auto_59002 ) ) ( IS-CRATE ?auto_58978 ) ( not ( = ?auto_58973 ?auto_58986 ) ) ( not ( = ?auto_58974 ?auto_58986 ) ) ( not ( = ?auto_58999 ?auto_58986 ) ) ( not ( = ?auto_59001 ?auto_58986 ) ) ( not ( = ?auto_58976 ?auto_58986 ) ) ( not ( = ?auto_58978 ?auto_58986 ) ) ( not ( = ?auto_59002 ?auto_58986 ) ) ( not ( = ?auto_58987 ?auto_58975 ) ) ( not ( = ?auto_58983 ?auto_58987 ) ) ( not ( = ?auto_58998 ?auto_58987 ) ) ( not ( = ?auto_58989 ?auto_58987 ) ) ( HOIST-AT ?auto_58993 ?auto_58987 ) ( not ( = ?auto_58980 ?auto_58993 ) ) ( not ( = ?auto_58979 ?auto_58993 ) ) ( not ( = ?auto_58984 ?auto_58993 ) ) ( not ( = ?auto_58982 ?auto_58993 ) ) ( AVAILABLE ?auto_58993 ) ( SURFACE-AT ?auto_58978 ?auto_58987 ) ( ON ?auto_58978 ?auto_58988 ) ( CLEAR ?auto_58978 ) ( not ( = ?auto_58973 ?auto_58988 ) ) ( not ( = ?auto_58974 ?auto_58988 ) ) ( not ( = ?auto_58999 ?auto_58988 ) ) ( not ( = ?auto_59001 ?auto_58988 ) ) ( not ( = ?auto_58976 ?auto_58988 ) ) ( not ( = ?auto_58978 ?auto_58988 ) ) ( not ( = ?auto_59002 ?auto_58988 ) ) ( not ( = ?auto_58986 ?auto_58988 ) ) ( IS-CRATE ?auto_58986 ) ( not ( = ?auto_58973 ?auto_58990 ) ) ( not ( = ?auto_58974 ?auto_58990 ) ) ( not ( = ?auto_58999 ?auto_58990 ) ) ( not ( = ?auto_59001 ?auto_58990 ) ) ( not ( = ?auto_58976 ?auto_58990 ) ) ( not ( = ?auto_58978 ?auto_58990 ) ) ( not ( = ?auto_59002 ?auto_58990 ) ) ( not ( = ?auto_58986 ?auto_58990 ) ) ( not ( = ?auto_58988 ?auto_58990 ) ) ( AVAILABLE ?auto_58984 ) ( SURFACE-AT ?auto_58986 ?auto_58998 ) ( ON ?auto_58986 ?auto_58985 ) ( CLEAR ?auto_58986 ) ( not ( = ?auto_58973 ?auto_58985 ) ) ( not ( = ?auto_58974 ?auto_58985 ) ) ( not ( = ?auto_58999 ?auto_58985 ) ) ( not ( = ?auto_59001 ?auto_58985 ) ) ( not ( = ?auto_58976 ?auto_58985 ) ) ( not ( = ?auto_58978 ?auto_58985 ) ) ( not ( = ?auto_59002 ?auto_58985 ) ) ( not ( = ?auto_58986 ?auto_58985 ) ) ( not ( = ?auto_58988 ?auto_58985 ) ) ( not ( = ?auto_58990 ?auto_58985 ) ) ( IS-CRATE ?auto_58990 ) ( not ( = ?auto_58973 ?auto_58994 ) ) ( not ( = ?auto_58974 ?auto_58994 ) ) ( not ( = ?auto_58999 ?auto_58994 ) ) ( not ( = ?auto_59001 ?auto_58994 ) ) ( not ( = ?auto_58976 ?auto_58994 ) ) ( not ( = ?auto_58978 ?auto_58994 ) ) ( not ( = ?auto_59002 ?auto_58994 ) ) ( not ( = ?auto_58986 ?auto_58994 ) ) ( not ( = ?auto_58988 ?auto_58994 ) ) ( not ( = ?auto_58990 ?auto_58994 ) ) ( not ( = ?auto_58985 ?auto_58994 ) ) ( not ( = ?auto_58992 ?auto_58975 ) ) ( not ( = ?auto_58983 ?auto_58992 ) ) ( not ( = ?auto_58998 ?auto_58992 ) ) ( not ( = ?auto_58989 ?auto_58992 ) ) ( not ( = ?auto_58987 ?auto_58992 ) ) ( HOIST-AT ?auto_58977 ?auto_58992 ) ( not ( = ?auto_58980 ?auto_58977 ) ) ( not ( = ?auto_58979 ?auto_58977 ) ) ( not ( = ?auto_58984 ?auto_58977 ) ) ( not ( = ?auto_58982 ?auto_58977 ) ) ( not ( = ?auto_58993 ?auto_58977 ) ) ( AVAILABLE ?auto_58977 ) ( SURFACE-AT ?auto_58990 ?auto_58992 ) ( ON ?auto_58990 ?auto_58981 ) ( CLEAR ?auto_58990 ) ( not ( = ?auto_58973 ?auto_58981 ) ) ( not ( = ?auto_58974 ?auto_58981 ) ) ( not ( = ?auto_58999 ?auto_58981 ) ) ( not ( = ?auto_59001 ?auto_58981 ) ) ( not ( = ?auto_58976 ?auto_58981 ) ) ( not ( = ?auto_58978 ?auto_58981 ) ) ( not ( = ?auto_59002 ?auto_58981 ) ) ( not ( = ?auto_58986 ?auto_58981 ) ) ( not ( = ?auto_58988 ?auto_58981 ) ) ( not ( = ?auto_58990 ?auto_58981 ) ) ( not ( = ?auto_58985 ?auto_58981 ) ) ( not ( = ?auto_58994 ?auto_58981 ) ) ( SURFACE-AT ?auto_58996 ?auto_58975 ) ( CLEAR ?auto_58996 ) ( IS-CRATE ?auto_58994 ) ( not ( = ?auto_58973 ?auto_58996 ) ) ( not ( = ?auto_58974 ?auto_58996 ) ) ( not ( = ?auto_58999 ?auto_58996 ) ) ( not ( = ?auto_59001 ?auto_58996 ) ) ( not ( = ?auto_58976 ?auto_58996 ) ) ( not ( = ?auto_58978 ?auto_58996 ) ) ( not ( = ?auto_59002 ?auto_58996 ) ) ( not ( = ?auto_58986 ?auto_58996 ) ) ( not ( = ?auto_58988 ?auto_58996 ) ) ( not ( = ?auto_58990 ?auto_58996 ) ) ( not ( = ?auto_58985 ?auto_58996 ) ) ( not ( = ?auto_58994 ?auto_58996 ) ) ( not ( = ?auto_58981 ?auto_58996 ) ) ( AVAILABLE ?auto_58980 ) ( not ( = ?auto_58997 ?auto_58975 ) ) ( not ( = ?auto_58983 ?auto_58997 ) ) ( not ( = ?auto_58998 ?auto_58997 ) ) ( not ( = ?auto_58989 ?auto_58997 ) ) ( not ( = ?auto_58987 ?auto_58997 ) ) ( not ( = ?auto_58992 ?auto_58997 ) ) ( HOIST-AT ?auto_58995 ?auto_58997 ) ( not ( = ?auto_58980 ?auto_58995 ) ) ( not ( = ?auto_58979 ?auto_58995 ) ) ( not ( = ?auto_58984 ?auto_58995 ) ) ( not ( = ?auto_58982 ?auto_58995 ) ) ( not ( = ?auto_58993 ?auto_58995 ) ) ( not ( = ?auto_58977 ?auto_58995 ) ) ( AVAILABLE ?auto_58995 ) ( SURFACE-AT ?auto_58994 ?auto_58997 ) ( ON ?auto_58994 ?auto_58991 ) ( CLEAR ?auto_58994 ) ( not ( = ?auto_58973 ?auto_58991 ) ) ( not ( = ?auto_58974 ?auto_58991 ) ) ( not ( = ?auto_58999 ?auto_58991 ) ) ( not ( = ?auto_59001 ?auto_58991 ) ) ( not ( = ?auto_58976 ?auto_58991 ) ) ( not ( = ?auto_58978 ?auto_58991 ) ) ( not ( = ?auto_59002 ?auto_58991 ) ) ( not ( = ?auto_58986 ?auto_58991 ) ) ( not ( = ?auto_58988 ?auto_58991 ) ) ( not ( = ?auto_58990 ?auto_58991 ) ) ( not ( = ?auto_58985 ?auto_58991 ) ) ( not ( = ?auto_58994 ?auto_58991 ) ) ( not ( = ?auto_58981 ?auto_58991 ) ) ( not ( = ?auto_58996 ?auto_58991 ) ) ( TRUCK-AT ?auto_59000 ?auto_58975 ) )
    :subtasks
    ( ( !DRIVE ?auto_59000 ?auto_58975 ?auto_58997 )
      ( MAKE-ON ?auto_58973 ?auto_58974 )
      ( MAKE-ON-VERIFY ?auto_58973 ?auto_58974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59003 - SURFACE
      ?auto_59004 - SURFACE
    )
    :vars
    (
      ?auto_59022 - HOIST
      ?auto_59005 - PLACE
      ?auto_59027 - PLACE
      ?auto_59013 - HOIST
      ?auto_59014 - SURFACE
      ?auto_59019 - SURFACE
      ?auto_59007 - PLACE
      ?auto_59012 - HOIST
      ?auto_59029 - SURFACE
      ?auto_59025 - SURFACE
      ?auto_59008 - PLACE
      ?auto_59015 - HOIST
      ?auto_59020 - SURFACE
      ?auto_59028 - SURFACE
      ?auto_59016 - PLACE
      ?auto_59031 - HOIST
      ?auto_59021 - SURFACE
      ?auto_59026 - SURFACE
      ?auto_59017 - SURFACE
      ?auto_59032 - SURFACE
      ?auto_59030 - PLACE
      ?auto_59023 - HOIST
      ?auto_59024 - SURFACE
      ?auto_59010 - SURFACE
      ?auto_59011 - PLACE
      ?auto_59009 - HOIST
      ?auto_59006 - SURFACE
      ?auto_59018 - TRUCK
      ?auto_59033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59022 ?auto_59005 ) ( IS-CRATE ?auto_59003 ) ( not ( = ?auto_59003 ?auto_59004 ) ) ( not ( = ?auto_59027 ?auto_59005 ) ) ( HOIST-AT ?auto_59013 ?auto_59027 ) ( not ( = ?auto_59022 ?auto_59013 ) ) ( AVAILABLE ?auto_59013 ) ( SURFACE-AT ?auto_59003 ?auto_59027 ) ( ON ?auto_59003 ?auto_59014 ) ( CLEAR ?auto_59003 ) ( not ( = ?auto_59003 ?auto_59014 ) ) ( not ( = ?auto_59004 ?auto_59014 ) ) ( IS-CRATE ?auto_59004 ) ( not ( = ?auto_59003 ?auto_59019 ) ) ( not ( = ?auto_59004 ?auto_59019 ) ) ( not ( = ?auto_59014 ?auto_59019 ) ) ( not ( = ?auto_59007 ?auto_59005 ) ) ( not ( = ?auto_59027 ?auto_59007 ) ) ( HOIST-AT ?auto_59012 ?auto_59007 ) ( not ( = ?auto_59022 ?auto_59012 ) ) ( not ( = ?auto_59013 ?auto_59012 ) ) ( SURFACE-AT ?auto_59004 ?auto_59007 ) ( ON ?auto_59004 ?auto_59029 ) ( CLEAR ?auto_59004 ) ( not ( = ?auto_59003 ?auto_59029 ) ) ( not ( = ?auto_59004 ?auto_59029 ) ) ( not ( = ?auto_59014 ?auto_59029 ) ) ( not ( = ?auto_59019 ?auto_59029 ) ) ( IS-CRATE ?auto_59019 ) ( not ( = ?auto_59003 ?auto_59025 ) ) ( not ( = ?auto_59004 ?auto_59025 ) ) ( not ( = ?auto_59014 ?auto_59025 ) ) ( not ( = ?auto_59019 ?auto_59025 ) ) ( not ( = ?auto_59029 ?auto_59025 ) ) ( not ( = ?auto_59008 ?auto_59005 ) ) ( not ( = ?auto_59027 ?auto_59008 ) ) ( not ( = ?auto_59007 ?auto_59008 ) ) ( HOIST-AT ?auto_59015 ?auto_59008 ) ( not ( = ?auto_59022 ?auto_59015 ) ) ( not ( = ?auto_59013 ?auto_59015 ) ) ( not ( = ?auto_59012 ?auto_59015 ) ) ( AVAILABLE ?auto_59015 ) ( SURFACE-AT ?auto_59019 ?auto_59008 ) ( ON ?auto_59019 ?auto_59020 ) ( CLEAR ?auto_59019 ) ( not ( = ?auto_59003 ?auto_59020 ) ) ( not ( = ?auto_59004 ?auto_59020 ) ) ( not ( = ?auto_59014 ?auto_59020 ) ) ( not ( = ?auto_59019 ?auto_59020 ) ) ( not ( = ?auto_59029 ?auto_59020 ) ) ( not ( = ?auto_59025 ?auto_59020 ) ) ( IS-CRATE ?auto_59025 ) ( not ( = ?auto_59003 ?auto_59028 ) ) ( not ( = ?auto_59004 ?auto_59028 ) ) ( not ( = ?auto_59014 ?auto_59028 ) ) ( not ( = ?auto_59019 ?auto_59028 ) ) ( not ( = ?auto_59029 ?auto_59028 ) ) ( not ( = ?auto_59025 ?auto_59028 ) ) ( not ( = ?auto_59020 ?auto_59028 ) ) ( not ( = ?auto_59016 ?auto_59005 ) ) ( not ( = ?auto_59027 ?auto_59016 ) ) ( not ( = ?auto_59007 ?auto_59016 ) ) ( not ( = ?auto_59008 ?auto_59016 ) ) ( HOIST-AT ?auto_59031 ?auto_59016 ) ( not ( = ?auto_59022 ?auto_59031 ) ) ( not ( = ?auto_59013 ?auto_59031 ) ) ( not ( = ?auto_59012 ?auto_59031 ) ) ( not ( = ?auto_59015 ?auto_59031 ) ) ( AVAILABLE ?auto_59031 ) ( SURFACE-AT ?auto_59025 ?auto_59016 ) ( ON ?auto_59025 ?auto_59021 ) ( CLEAR ?auto_59025 ) ( not ( = ?auto_59003 ?auto_59021 ) ) ( not ( = ?auto_59004 ?auto_59021 ) ) ( not ( = ?auto_59014 ?auto_59021 ) ) ( not ( = ?auto_59019 ?auto_59021 ) ) ( not ( = ?auto_59029 ?auto_59021 ) ) ( not ( = ?auto_59025 ?auto_59021 ) ) ( not ( = ?auto_59020 ?auto_59021 ) ) ( not ( = ?auto_59028 ?auto_59021 ) ) ( IS-CRATE ?auto_59028 ) ( not ( = ?auto_59003 ?auto_59026 ) ) ( not ( = ?auto_59004 ?auto_59026 ) ) ( not ( = ?auto_59014 ?auto_59026 ) ) ( not ( = ?auto_59019 ?auto_59026 ) ) ( not ( = ?auto_59029 ?auto_59026 ) ) ( not ( = ?auto_59025 ?auto_59026 ) ) ( not ( = ?auto_59020 ?auto_59026 ) ) ( not ( = ?auto_59028 ?auto_59026 ) ) ( not ( = ?auto_59021 ?auto_59026 ) ) ( AVAILABLE ?auto_59012 ) ( SURFACE-AT ?auto_59028 ?auto_59007 ) ( ON ?auto_59028 ?auto_59017 ) ( CLEAR ?auto_59028 ) ( not ( = ?auto_59003 ?auto_59017 ) ) ( not ( = ?auto_59004 ?auto_59017 ) ) ( not ( = ?auto_59014 ?auto_59017 ) ) ( not ( = ?auto_59019 ?auto_59017 ) ) ( not ( = ?auto_59029 ?auto_59017 ) ) ( not ( = ?auto_59025 ?auto_59017 ) ) ( not ( = ?auto_59020 ?auto_59017 ) ) ( not ( = ?auto_59028 ?auto_59017 ) ) ( not ( = ?auto_59021 ?auto_59017 ) ) ( not ( = ?auto_59026 ?auto_59017 ) ) ( IS-CRATE ?auto_59026 ) ( not ( = ?auto_59003 ?auto_59032 ) ) ( not ( = ?auto_59004 ?auto_59032 ) ) ( not ( = ?auto_59014 ?auto_59032 ) ) ( not ( = ?auto_59019 ?auto_59032 ) ) ( not ( = ?auto_59029 ?auto_59032 ) ) ( not ( = ?auto_59025 ?auto_59032 ) ) ( not ( = ?auto_59020 ?auto_59032 ) ) ( not ( = ?auto_59028 ?auto_59032 ) ) ( not ( = ?auto_59021 ?auto_59032 ) ) ( not ( = ?auto_59026 ?auto_59032 ) ) ( not ( = ?auto_59017 ?auto_59032 ) ) ( not ( = ?auto_59030 ?auto_59005 ) ) ( not ( = ?auto_59027 ?auto_59030 ) ) ( not ( = ?auto_59007 ?auto_59030 ) ) ( not ( = ?auto_59008 ?auto_59030 ) ) ( not ( = ?auto_59016 ?auto_59030 ) ) ( HOIST-AT ?auto_59023 ?auto_59030 ) ( not ( = ?auto_59022 ?auto_59023 ) ) ( not ( = ?auto_59013 ?auto_59023 ) ) ( not ( = ?auto_59012 ?auto_59023 ) ) ( not ( = ?auto_59015 ?auto_59023 ) ) ( not ( = ?auto_59031 ?auto_59023 ) ) ( AVAILABLE ?auto_59023 ) ( SURFACE-AT ?auto_59026 ?auto_59030 ) ( ON ?auto_59026 ?auto_59024 ) ( CLEAR ?auto_59026 ) ( not ( = ?auto_59003 ?auto_59024 ) ) ( not ( = ?auto_59004 ?auto_59024 ) ) ( not ( = ?auto_59014 ?auto_59024 ) ) ( not ( = ?auto_59019 ?auto_59024 ) ) ( not ( = ?auto_59029 ?auto_59024 ) ) ( not ( = ?auto_59025 ?auto_59024 ) ) ( not ( = ?auto_59020 ?auto_59024 ) ) ( not ( = ?auto_59028 ?auto_59024 ) ) ( not ( = ?auto_59021 ?auto_59024 ) ) ( not ( = ?auto_59026 ?auto_59024 ) ) ( not ( = ?auto_59017 ?auto_59024 ) ) ( not ( = ?auto_59032 ?auto_59024 ) ) ( IS-CRATE ?auto_59032 ) ( not ( = ?auto_59003 ?auto_59010 ) ) ( not ( = ?auto_59004 ?auto_59010 ) ) ( not ( = ?auto_59014 ?auto_59010 ) ) ( not ( = ?auto_59019 ?auto_59010 ) ) ( not ( = ?auto_59029 ?auto_59010 ) ) ( not ( = ?auto_59025 ?auto_59010 ) ) ( not ( = ?auto_59020 ?auto_59010 ) ) ( not ( = ?auto_59028 ?auto_59010 ) ) ( not ( = ?auto_59021 ?auto_59010 ) ) ( not ( = ?auto_59026 ?auto_59010 ) ) ( not ( = ?auto_59017 ?auto_59010 ) ) ( not ( = ?auto_59032 ?auto_59010 ) ) ( not ( = ?auto_59024 ?auto_59010 ) ) ( not ( = ?auto_59011 ?auto_59005 ) ) ( not ( = ?auto_59027 ?auto_59011 ) ) ( not ( = ?auto_59007 ?auto_59011 ) ) ( not ( = ?auto_59008 ?auto_59011 ) ) ( not ( = ?auto_59016 ?auto_59011 ) ) ( not ( = ?auto_59030 ?auto_59011 ) ) ( HOIST-AT ?auto_59009 ?auto_59011 ) ( not ( = ?auto_59022 ?auto_59009 ) ) ( not ( = ?auto_59013 ?auto_59009 ) ) ( not ( = ?auto_59012 ?auto_59009 ) ) ( not ( = ?auto_59015 ?auto_59009 ) ) ( not ( = ?auto_59031 ?auto_59009 ) ) ( not ( = ?auto_59023 ?auto_59009 ) ) ( AVAILABLE ?auto_59009 ) ( SURFACE-AT ?auto_59032 ?auto_59011 ) ( ON ?auto_59032 ?auto_59006 ) ( CLEAR ?auto_59032 ) ( not ( = ?auto_59003 ?auto_59006 ) ) ( not ( = ?auto_59004 ?auto_59006 ) ) ( not ( = ?auto_59014 ?auto_59006 ) ) ( not ( = ?auto_59019 ?auto_59006 ) ) ( not ( = ?auto_59029 ?auto_59006 ) ) ( not ( = ?auto_59025 ?auto_59006 ) ) ( not ( = ?auto_59020 ?auto_59006 ) ) ( not ( = ?auto_59028 ?auto_59006 ) ) ( not ( = ?auto_59021 ?auto_59006 ) ) ( not ( = ?auto_59026 ?auto_59006 ) ) ( not ( = ?auto_59017 ?auto_59006 ) ) ( not ( = ?auto_59032 ?auto_59006 ) ) ( not ( = ?auto_59024 ?auto_59006 ) ) ( not ( = ?auto_59010 ?auto_59006 ) ) ( TRUCK-AT ?auto_59018 ?auto_59005 ) ( SURFACE-AT ?auto_59033 ?auto_59005 ) ( CLEAR ?auto_59033 ) ( LIFTING ?auto_59022 ?auto_59010 ) ( IS-CRATE ?auto_59010 ) ( not ( = ?auto_59003 ?auto_59033 ) ) ( not ( = ?auto_59004 ?auto_59033 ) ) ( not ( = ?auto_59014 ?auto_59033 ) ) ( not ( = ?auto_59019 ?auto_59033 ) ) ( not ( = ?auto_59029 ?auto_59033 ) ) ( not ( = ?auto_59025 ?auto_59033 ) ) ( not ( = ?auto_59020 ?auto_59033 ) ) ( not ( = ?auto_59028 ?auto_59033 ) ) ( not ( = ?auto_59021 ?auto_59033 ) ) ( not ( = ?auto_59026 ?auto_59033 ) ) ( not ( = ?auto_59017 ?auto_59033 ) ) ( not ( = ?auto_59032 ?auto_59033 ) ) ( not ( = ?auto_59024 ?auto_59033 ) ) ( not ( = ?auto_59010 ?auto_59033 ) ) ( not ( = ?auto_59006 ?auto_59033 ) ) )
    :subtasks
    ( ( !DROP ?auto_59022 ?auto_59010 ?auto_59033 ?auto_59005 )
      ( MAKE-ON ?auto_59003 ?auto_59004 )
      ( MAKE-ON-VERIFY ?auto_59003 ?auto_59004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59034 - SURFACE
      ?auto_59035 - SURFACE
    )
    :vars
    (
      ?auto_59055 - HOIST
      ?auto_59036 - PLACE
      ?auto_59060 - PLACE
      ?auto_59038 - HOIST
      ?auto_59047 - SURFACE
      ?auto_59062 - SURFACE
      ?auto_59044 - PLACE
      ?auto_59042 - HOIST
      ?auto_59049 - SURFACE
      ?auto_59058 - SURFACE
      ?auto_59040 - PLACE
      ?auto_59046 - HOIST
      ?auto_59061 - SURFACE
      ?auto_59053 - SURFACE
      ?auto_59039 - PLACE
      ?auto_59051 - HOIST
      ?auto_59054 - SURFACE
      ?auto_59059 - SURFACE
      ?auto_59041 - SURFACE
      ?auto_59052 - SURFACE
      ?auto_59050 - PLACE
      ?auto_59056 - HOIST
      ?auto_59057 - SURFACE
      ?auto_59043 - SURFACE
      ?auto_59063 - PLACE
      ?auto_59048 - HOIST
      ?auto_59045 - SURFACE
      ?auto_59037 - TRUCK
      ?auto_59064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59055 ?auto_59036 ) ( IS-CRATE ?auto_59034 ) ( not ( = ?auto_59034 ?auto_59035 ) ) ( not ( = ?auto_59060 ?auto_59036 ) ) ( HOIST-AT ?auto_59038 ?auto_59060 ) ( not ( = ?auto_59055 ?auto_59038 ) ) ( AVAILABLE ?auto_59038 ) ( SURFACE-AT ?auto_59034 ?auto_59060 ) ( ON ?auto_59034 ?auto_59047 ) ( CLEAR ?auto_59034 ) ( not ( = ?auto_59034 ?auto_59047 ) ) ( not ( = ?auto_59035 ?auto_59047 ) ) ( IS-CRATE ?auto_59035 ) ( not ( = ?auto_59034 ?auto_59062 ) ) ( not ( = ?auto_59035 ?auto_59062 ) ) ( not ( = ?auto_59047 ?auto_59062 ) ) ( not ( = ?auto_59044 ?auto_59036 ) ) ( not ( = ?auto_59060 ?auto_59044 ) ) ( HOIST-AT ?auto_59042 ?auto_59044 ) ( not ( = ?auto_59055 ?auto_59042 ) ) ( not ( = ?auto_59038 ?auto_59042 ) ) ( SURFACE-AT ?auto_59035 ?auto_59044 ) ( ON ?auto_59035 ?auto_59049 ) ( CLEAR ?auto_59035 ) ( not ( = ?auto_59034 ?auto_59049 ) ) ( not ( = ?auto_59035 ?auto_59049 ) ) ( not ( = ?auto_59047 ?auto_59049 ) ) ( not ( = ?auto_59062 ?auto_59049 ) ) ( IS-CRATE ?auto_59062 ) ( not ( = ?auto_59034 ?auto_59058 ) ) ( not ( = ?auto_59035 ?auto_59058 ) ) ( not ( = ?auto_59047 ?auto_59058 ) ) ( not ( = ?auto_59062 ?auto_59058 ) ) ( not ( = ?auto_59049 ?auto_59058 ) ) ( not ( = ?auto_59040 ?auto_59036 ) ) ( not ( = ?auto_59060 ?auto_59040 ) ) ( not ( = ?auto_59044 ?auto_59040 ) ) ( HOIST-AT ?auto_59046 ?auto_59040 ) ( not ( = ?auto_59055 ?auto_59046 ) ) ( not ( = ?auto_59038 ?auto_59046 ) ) ( not ( = ?auto_59042 ?auto_59046 ) ) ( AVAILABLE ?auto_59046 ) ( SURFACE-AT ?auto_59062 ?auto_59040 ) ( ON ?auto_59062 ?auto_59061 ) ( CLEAR ?auto_59062 ) ( not ( = ?auto_59034 ?auto_59061 ) ) ( not ( = ?auto_59035 ?auto_59061 ) ) ( not ( = ?auto_59047 ?auto_59061 ) ) ( not ( = ?auto_59062 ?auto_59061 ) ) ( not ( = ?auto_59049 ?auto_59061 ) ) ( not ( = ?auto_59058 ?auto_59061 ) ) ( IS-CRATE ?auto_59058 ) ( not ( = ?auto_59034 ?auto_59053 ) ) ( not ( = ?auto_59035 ?auto_59053 ) ) ( not ( = ?auto_59047 ?auto_59053 ) ) ( not ( = ?auto_59062 ?auto_59053 ) ) ( not ( = ?auto_59049 ?auto_59053 ) ) ( not ( = ?auto_59058 ?auto_59053 ) ) ( not ( = ?auto_59061 ?auto_59053 ) ) ( not ( = ?auto_59039 ?auto_59036 ) ) ( not ( = ?auto_59060 ?auto_59039 ) ) ( not ( = ?auto_59044 ?auto_59039 ) ) ( not ( = ?auto_59040 ?auto_59039 ) ) ( HOIST-AT ?auto_59051 ?auto_59039 ) ( not ( = ?auto_59055 ?auto_59051 ) ) ( not ( = ?auto_59038 ?auto_59051 ) ) ( not ( = ?auto_59042 ?auto_59051 ) ) ( not ( = ?auto_59046 ?auto_59051 ) ) ( AVAILABLE ?auto_59051 ) ( SURFACE-AT ?auto_59058 ?auto_59039 ) ( ON ?auto_59058 ?auto_59054 ) ( CLEAR ?auto_59058 ) ( not ( = ?auto_59034 ?auto_59054 ) ) ( not ( = ?auto_59035 ?auto_59054 ) ) ( not ( = ?auto_59047 ?auto_59054 ) ) ( not ( = ?auto_59062 ?auto_59054 ) ) ( not ( = ?auto_59049 ?auto_59054 ) ) ( not ( = ?auto_59058 ?auto_59054 ) ) ( not ( = ?auto_59061 ?auto_59054 ) ) ( not ( = ?auto_59053 ?auto_59054 ) ) ( IS-CRATE ?auto_59053 ) ( not ( = ?auto_59034 ?auto_59059 ) ) ( not ( = ?auto_59035 ?auto_59059 ) ) ( not ( = ?auto_59047 ?auto_59059 ) ) ( not ( = ?auto_59062 ?auto_59059 ) ) ( not ( = ?auto_59049 ?auto_59059 ) ) ( not ( = ?auto_59058 ?auto_59059 ) ) ( not ( = ?auto_59061 ?auto_59059 ) ) ( not ( = ?auto_59053 ?auto_59059 ) ) ( not ( = ?auto_59054 ?auto_59059 ) ) ( AVAILABLE ?auto_59042 ) ( SURFACE-AT ?auto_59053 ?auto_59044 ) ( ON ?auto_59053 ?auto_59041 ) ( CLEAR ?auto_59053 ) ( not ( = ?auto_59034 ?auto_59041 ) ) ( not ( = ?auto_59035 ?auto_59041 ) ) ( not ( = ?auto_59047 ?auto_59041 ) ) ( not ( = ?auto_59062 ?auto_59041 ) ) ( not ( = ?auto_59049 ?auto_59041 ) ) ( not ( = ?auto_59058 ?auto_59041 ) ) ( not ( = ?auto_59061 ?auto_59041 ) ) ( not ( = ?auto_59053 ?auto_59041 ) ) ( not ( = ?auto_59054 ?auto_59041 ) ) ( not ( = ?auto_59059 ?auto_59041 ) ) ( IS-CRATE ?auto_59059 ) ( not ( = ?auto_59034 ?auto_59052 ) ) ( not ( = ?auto_59035 ?auto_59052 ) ) ( not ( = ?auto_59047 ?auto_59052 ) ) ( not ( = ?auto_59062 ?auto_59052 ) ) ( not ( = ?auto_59049 ?auto_59052 ) ) ( not ( = ?auto_59058 ?auto_59052 ) ) ( not ( = ?auto_59061 ?auto_59052 ) ) ( not ( = ?auto_59053 ?auto_59052 ) ) ( not ( = ?auto_59054 ?auto_59052 ) ) ( not ( = ?auto_59059 ?auto_59052 ) ) ( not ( = ?auto_59041 ?auto_59052 ) ) ( not ( = ?auto_59050 ?auto_59036 ) ) ( not ( = ?auto_59060 ?auto_59050 ) ) ( not ( = ?auto_59044 ?auto_59050 ) ) ( not ( = ?auto_59040 ?auto_59050 ) ) ( not ( = ?auto_59039 ?auto_59050 ) ) ( HOIST-AT ?auto_59056 ?auto_59050 ) ( not ( = ?auto_59055 ?auto_59056 ) ) ( not ( = ?auto_59038 ?auto_59056 ) ) ( not ( = ?auto_59042 ?auto_59056 ) ) ( not ( = ?auto_59046 ?auto_59056 ) ) ( not ( = ?auto_59051 ?auto_59056 ) ) ( AVAILABLE ?auto_59056 ) ( SURFACE-AT ?auto_59059 ?auto_59050 ) ( ON ?auto_59059 ?auto_59057 ) ( CLEAR ?auto_59059 ) ( not ( = ?auto_59034 ?auto_59057 ) ) ( not ( = ?auto_59035 ?auto_59057 ) ) ( not ( = ?auto_59047 ?auto_59057 ) ) ( not ( = ?auto_59062 ?auto_59057 ) ) ( not ( = ?auto_59049 ?auto_59057 ) ) ( not ( = ?auto_59058 ?auto_59057 ) ) ( not ( = ?auto_59061 ?auto_59057 ) ) ( not ( = ?auto_59053 ?auto_59057 ) ) ( not ( = ?auto_59054 ?auto_59057 ) ) ( not ( = ?auto_59059 ?auto_59057 ) ) ( not ( = ?auto_59041 ?auto_59057 ) ) ( not ( = ?auto_59052 ?auto_59057 ) ) ( IS-CRATE ?auto_59052 ) ( not ( = ?auto_59034 ?auto_59043 ) ) ( not ( = ?auto_59035 ?auto_59043 ) ) ( not ( = ?auto_59047 ?auto_59043 ) ) ( not ( = ?auto_59062 ?auto_59043 ) ) ( not ( = ?auto_59049 ?auto_59043 ) ) ( not ( = ?auto_59058 ?auto_59043 ) ) ( not ( = ?auto_59061 ?auto_59043 ) ) ( not ( = ?auto_59053 ?auto_59043 ) ) ( not ( = ?auto_59054 ?auto_59043 ) ) ( not ( = ?auto_59059 ?auto_59043 ) ) ( not ( = ?auto_59041 ?auto_59043 ) ) ( not ( = ?auto_59052 ?auto_59043 ) ) ( not ( = ?auto_59057 ?auto_59043 ) ) ( not ( = ?auto_59063 ?auto_59036 ) ) ( not ( = ?auto_59060 ?auto_59063 ) ) ( not ( = ?auto_59044 ?auto_59063 ) ) ( not ( = ?auto_59040 ?auto_59063 ) ) ( not ( = ?auto_59039 ?auto_59063 ) ) ( not ( = ?auto_59050 ?auto_59063 ) ) ( HOIST-AT ?auto_59048 ?auto_59063 ) ( not ( = ?auto_59055 ?auto_59048 ) ) ( not ( = ?auto_59038 ?auto_59048 ) ) ( not ( = ?auto_59042 ?auto_59048 ) ) ( not ( = ?auto_59046 ?auto_59048 ) ) ( not ( = ?auto_59051 ?auto_59048 ) ) ( not ( = ?auto_59056 ?auto_59048 ) ) ( AVAILABLE ?auto_59048 ) ( SURFACE-AT ?auto_59052 ?auto_59063 ) ( ON ?auto_59052 ?auto_59045 ) ( CLEAR ?auto_59052 ) ( not ( = ?auto_59034 ?auto_59045 ) ) ( not ( = ?auto_59035 ?auto_59045 ) ) ( not ( = ?auto_59047 ?auto_59045 ) ) ( not ( = ?auto_59062 ?auto_59045 ) ) ( not ( = ?auto_59049 ?auto_59045 ) ) ( not ( = ?auto_59058 ?auto_59045 ) ) ( not ( = ?auto_59061 ?auto_59045 ) ) ( not ( = ?auto_59053 ?auto_59045 ) ) ( not ( = ?auto_59054 ?auto_59045 ) ) ( not ( = ?auto_59059 ?auto_59045 ) ) ( not ( = ?auto_59041 ?auto_59045 ) ) ( not ( = ?auto_59052 ?auto_59045 ) ) ( not ( = ?auto_59057 ?auto_59045 ) ) ( not ( = ?auto_59043 ?auto_59045 ) ) ( TRUCK-AT ?auto_59037 ?auto_59036 ) ( SURFACE-AT ?auto_59064 ?auto_59036 ) ( CLEAR ?auto_59064 ) ( IS-CRATE ?auto_59043 ) ( not ( = ?auto_59034 ?auto_59064 ) ) ( not ( = ?auto_59035 ?auto_59064 ) ) ( not ( = ?auto_59047 ?auto_59064 ) ) ( not ( = ?auto_59062 ?auto_59064 ) ) ( not ( = ?auto_59049 ?auto_59064 ) ) ( not ( = ?auto_59058 ?auto_59064 ) ) ( not ( = ?auto_59061 ?auto_59064 ) ) ( not ( = ?auto_59053 ?auto_59064 ) ) ( not ( = ?auto_59054 ?auto_59064 ) ) ( not ( = ?auto_59059 ?auto_59064 ) ) ( not ( = ?auto_59041 ?auto_59064 ) ) ( not ( = ?auto_59052 ?auto_59064 ) ) ( not ( = ?auto_59057 ?auto_59064 ) ) ( not ( = ?auto_59043 ?auto_59064 ) ) ( not ( = ?auto_59045 ?auto_59064 ) ) ( AVAILABLE ?auto_59055 ) ( IN ?auto_59043 ?auto_59037 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59055 ?auto_59043 ?auto_59037 ?auto_59036 )
      ( MAKE-ON ?auto_59034 ?auto_59035 )
      ( MAKE-ON-VERIFY ?auto_59034 ?auto_59035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59065 - SURFACE
      ?auto_59066 - SURFACE
    )
    :vars
    (
      ?auto_59088 - HOIST
      ?auto_59068 - PLACE
      ?auto_59075 - PLACE
      ?auto_59071 - HOIST
      ?auto_59072 - SURFACE
      ?auto_59077 - SURFACE
      ?auto_59082 - PLACE
      ?auto_59081 - HOIST
      ?auto_59093 - SURFACE
      ?auto_59091 - SURFACE
      ?auto_59095 - PLACE
      ?auto_59079 - HOIST
      ?auto_59070 - SURFACE
      ?auto_59086 - SURFACE
      ?auto_59078 - PLACE
      ?auto_59092 - HOIST
      ?auto_59087 - SURFACE
      ?auto_59084 - SURFACE
      ?auto_59080 - SURFACE
      ?auto_59085 - SURFACE
      ?auto_59094 - PLACE
      ?auto_59089 - HOIST
      ?auto_59090 - SURFACE
      ?auto_59073 - SURFACE
      ?auto_59076 - PLACE
      ?auto_59069 - HOIST
      ?auto_59067 - SURFACE
      ?auto_59083 - SURFACE
      ?auto_59074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59088 ?auto_59068 ) ( IS-CRATE ?auto_59065 ) ( not ( = ?auto_59065 ?auto_59066 ) ) ( not ( = ?auto_59075 ?auto_59068 ) ) ( HOIST-AT ?auto_59071 ?auto_59075 ) ( not ( = ?auto_59088 ?auto_59071 ) ) ( AVAILABLE ?auto_59071 ) ( SURFACE-AT ?auto_59065 ?auto_59075 ) ( ON ?auto_59065 ?auto_59072 ) ( CLEAR ?auto_59065 ) ( not ( = ?auto_59065 ?auto_59072 ) ) ( not ( = ?auto_59066 ?auto_59072 ) ) ( IS-CRATE ?auto_59066 ) ( not ( = ?auto_59065 ?auto_59077 ) ) ( not ( = ?auto_59066 ?auto_59077 ) ) ( not ( = ?auto_59072 ?auto_59077 ) ) ( not ( = ?auto_59082 ?auto_59068 ) ) ( not ( = ?auto_59075 ?auto_59082 ) ) ( HOIST-AT ?auto_59081 ?auto_59082 ) ( not ( = ?auto_59088 ?auto_59081 ) ) ( not ( = ?auto_59071 ?auto_59081 ) ) ( SURFACE-AT ?auto_59066 ?auto_59082 ) ( ON ?auto_59066 ?auto_59093 ) ( CLEAR ?auto_59066 ) ( not ( = ?auto_59065 ?auto_59093 ) ) ( not ( = ?auto_59066 ?auto_59093 ) ) ( not ( = ?auto_59072 ?auto_59093 ) ) ( not ( = ?auto_59077 ?auto_59093 ) ) ( IS-CRATE ?auto_59077 ) ( not ( = ?auto_59065 ?auto_59091 ) ) ( not ( = ?auto_59066 ?auto_59091 ) ) ( not ( = ?auto_59072 ?auto_59091 ) ) ( not ( = ?auto_59077 ?auto_59091 ) ) ( not ( = ?auto_59093 ?auto_59091 ) ) ( not ( = ?auto_59095 ?auto_59068 ) ) ( not ( = ?auto_59075 ?auto_59095 ) ) ( not ( = ?auto_59082 ?auto_59095 ) ) ( HOIST-AT ?auto_59079 ?auto_59095 ) ( not ( = ?auto_59088 ?auto_59079 ) ) ( not ( = ?auto_59071 ?auto_59079 ) ) ( not ( = ?auto_59081 ?auto_59079 ) ) ( AVAILABLE ?auto_59079 ) ( SURFACE-AT ?auto_59077 ?auto_59095 ) ( ON ?auto_59077 ?auto_59070 ) ( CLEAR ?auto_59077 ) ( not ( = ?auto_59065 ?auto_59070 ) ) ( not ( = ?auto_59066 ?auto_59070 ) ) ( not ( = ?auto_59072 ?auto_59070 ) ) ( not ( = ?auto_59077 ?auto_59070 ) ) ( not ( = ?auto_59093 ?auto_59070 ) ) ( not ( = ?auto_59091 ?auto_59070 ) ) ( IS-CRATE ?auto_59091 ) ( not ( = ?auto_59065 ?auto_59086 ) ) ( not ( = ?auto_59066 ?auto_59086 ) ) ( not ( = ?auto_59072 ?auto_59086 ) ) ( not ( = ?auto_59077 ?auto_59086 ) ) ( not ( = ?auto_59093 ?auto_59086 ) ) ( not ( = ?auto_59091 ?auto_59086 ) ) ( not ( = ?auto_59070 ?auto_59086 ) ) ( not ( = ?auto_59078 ?auto_59068 ) ) ( not ( = ?auto_59075 ?auto_59078 ) ) ( not ( = ?auto_59082 ?auto_59078 ) ) ( not ( = ?auto_59095 ?auto_59078 ) ) ( HOIST-AT ?auto_59092 ?auto_59078 ) ( not ( = ?auto_59088 ?auto_59092 ) ) ( not ( = ?auto_59071 ?auto_59092 ) ) ( not ( = ?auto_59081 ?auto_59092 ) ) ( not ( = ?auto_59079 ?auto_59092 ) ) ( AVAILABLE ?auto_59092 ) ( SURFACE-AT ?auto_59091 ?auto_59078 ) ( ON ?auto_59091 ?auto_59087 ) ( CLEAR ?auto_59091 ) ( not ( = ?auto_59065 ?auto_59087 ) ) ( not ( = ?auto_59066 ?auto_59087 ) ) ( not ( = ?auto_59072 ?auto_59087 ) ) ( not ( = ?auto_59077 ?auto_59087 ) ) ( not ( = ?auto_59093 ?auto_59087 ) ) ( not ( = ?auto_59091 ?auto_59087 ) ) ( not ( = ?auto_59070 ?auto_59087 ) ) ( not ( = ?auto_59086 ?auto_59087 ) ) ( IS-CRATE ?auto_59086 ) ( not ( = ?auto_59065 ?auto_59084 ) ) ( not ( = ?auto_59066 ?auto_59084 ) ) ( not ( = ?auto_59072 ?auto_59084 ) ) ( not ( = ?auto_59077 ?auto_59084 ) ) ( not ( = ?auto_59093 ?auto_59084 ) ) ( not ( = ?auto_59091 ?auto_59084 ) ) ( not ( = ?auto_59070 ?auto_59084 ) ) ( not ( = ?auto_59086 ?auto_59084 ) ) ( not ( = ?auto_59087 ?auto_59084 ) ) ( AVAILABLE ?auto_59081 ) ( SURFACE-AT ?auto_59086 ?auto_59082 ) ( ON ?auto_59086 ?auto_59080 ) ( CLEAR ?auto_59086 ) ( not ( = ?auto_59065 ?auto_59080 ) ) ( not ( = ?auto_59066 ?auto_59080 ) ) ( not ( = ?auto_59072 ?auto_59080 ) ) ( not ( = ?auto_59077 ?auto_59080 ) ) ( not ( = ?auto_59093 ?auto_59080 ) ) ( not ( = ?auto_59091 ?auto_59080 ) ) ( not ( = ?auto_59070 ?auto_59080 ) ) ( not ( = ?auto_59086 ?auto_59080 ) ) ( not ( = ?auto_59087 ?auto_59080 ) ) ( not ( = ?auto_59084 ?auto_59080 ) ) ( IS-CRATE ?auto_59084 ) ( not ( = ?auto_59065 ?auto_59085 ) ) ( not ( = ?auto_59066 ?auto_59085 ) ) ( not ( = ?auto_59072 ?auto_59085 ) ) ( not ( = ?auto_59077 ?auto_59085 ) ) ( not ( = ?auto_59093 ?auto_59085 ) ) ( not ( = ?auto_59091 ?auto_59085 ) ) ( not ( = ?auto_59070 ?auto_59085 ) ) ( not ( = ?auto_59086 ?auto_59085 ) ) ( not ( = ?auto_59087 ?auto_59085 ) ) ( not ( = ?auto_59084 ?auto_59085 ) ) ( not ( = ?auto_59080 ?auto_59085 ) ) ( not ( = ?auto_59094 ?auto_59068 ) ) ( not ( = ?auto_59075 ?auto_59094 ) ) ( not ( = ?auto_59082 ?auto_59094 ) ) ( not ( = ?auto_59095 ?auto_59094 ) ) ( not ( = ?auto_59078 ?auto_59094 ) ) ( HOIST-AT ?auto_59089 ?auto_59094 ) ( not ( = ?auto_59088 ?auto_59089 ) ) ( not ( = ?auto_59071 ?auto_59089 ) ) ( not ( = ?auto_59081 ?auto_59089 ) ) ( not ( = ?auto_59079 ?auto_59089 ) ) ( not ( = ?auto_59092 ?auto_59089 ) ) ( AVAILABLE ?auto_59089 ) ( SURFACE-AT ?auto_59084 ?auto_59094 ) ( ON ?auto_59084 ?auto_59090 ) ( CLEAR ?auto_59084 ) ( not ( = ?auto_59065 ?auto_59090 ) ) ( not ( = ?auto_59066 ?auto_59090 ) ) ( not ( = ?auto_59072 ?auto_59090 ) ) ( not ( = ?auto_59077 ?auto_59090 ) ) ( not ( = ?auto_59093 ?auto_59090 ) ) ( not ( = ?auto_59091 ?auto_59090 ) ) ( not ( = ?auto_59070 ?auto_59090 ) ) ( not ( = ?auto_59086 ?auto_59090 ) ) ( not ( = ?auto_59087 ?auto_59090 ) ) ( not ( = ?auto_59084 ?auto_59090 ) ) ( not ( = ?auto_59080 ?auto_59090 ) ) ( not ( = ?auto_59085 ?auto_59090 ) ) ( IS-CRATE ?auto_59085 ) ( not ( = ?auto_59065 ?auto_59073 ) ) ( not ( = ?auto_59066 ?auto_59073 ) ) ( not ( = ?auto_59072 ?auto_59073 ) ) ( not ( = ?auto_59077 ?auto_59073 ) ) ( not ( = ?auto_59093 ?auto_59073 ) ) ( not ( = ?auto_59091 ?auto_59073 ) ) ( not ( = ?auto_59070 ?auto_59073 ) ) ( not ( = ?auto_59086 ?auto_59073 ) ) ( not ( = ?auto_59087 ?auto_59073 ) ) ( not ( = ?auto_59084 ?auto_59073 ) ) ( not ( = ?auto_59080 ?auto_59073 ) ) ( not ( = ?auto_59085 ?auto_59073 ) ) ( not ( = ?auto_59090 ?auto_59073 ) ) ( not ( = ?auto_59076 ?auto_59068 ) ) ( not ( = ?auto_59075 ?auto_59076 ) ) ( not ( = ?auto_59082 ?auto_59076 ) ) ( not ( = ?auto_59095 ?auto_59076 ) ) ( not ( = ?auto_59078 ?auto_59076 ) ) ( not ( = ?auto_59094 ?auto_59076 ) ) ( HOIST-AT ?auto_59069 ?auto_59076 ) ( not ( = ?auto_59088 ?auto_59069 ) ) ( not ( = ?auto_59071 ?auto_59069 ) ) ( not ( = ?auto_59081 ?auto_59069 ) ) ( not ( = ?auto_59079 ?auto_59069 ) ) ( not ( = ?auto_59092 ?auto_59069 ) ) ( not ( = ?auto_59089 ?auto_59069 ) ) ( AVAILABLE ?auto_59069 ) ( SURFACE-AT ?auto_59085 ?auto_59076 ) ( ON ?auto_59085 ?auto_59067 ) ( CLEAR ?auto_59085 ) ( not ( = ?auto_59065 ?auto_59067 ) ) ( not ( = ?auto_59066 ?auto_59067 ) ) ( not ( = ?auto_59072 ?auto_59067 ) ) ( not ( = ?auto_59077 ?auto_59067 ) ) ( not ( = ?auto_59093 ?auto_59067 ) ) ( not ( = ?auto_59091 ?auto_59067 ) ) ( not ( = ?auto_59070 ?auto_59067 ) ) ( not ( = ?auto_59086 ?auto_59067 ) ) ( not ( = ?auto_59087 ?auto_59067 ) ) ( not ( = ?auto_59084 ?auto_59067 ) ) ( not ( = ?auto_59080 ?auto_59067 ) ) ( not ( = ?auto_59085 ?auto_59067 ) ) ( not ( = ?auto_59090 ?auto_59067 ) ) ( not ( = ?auto_59073 ?auto_59067 ) ) ( SURFACE-AT ?auto_59083 ?auto_59068 ) ( CLEAR ?auto_59083 ) ( IS-CRATE ?auto_59073 ) ( not ( = ?auto_59065 ?auto_59083 ) ) ( not ( = ?auto_59066 ?auto_59083 ) ) ( not ( = ?auto_59072 ?auto_59083 ) ) ( not ( = ?auto_59077 ?auto_59083 ) ) ( not ( = ?auto_59093 ?auto_59083 ) ) ( not ( = ?auto_59091 ?auto_59083 ) ) ( not ( = ?auto_59070 ?auto_59083 ) ) ( not ( = ?auto_59086 ?auto_59083 ) ) ( not ( = ?auto_59087 ?auto_59083 ) ) ( not ( = ?auto_59084 ?auto_59083 ) ) ( not ( = ?auto_59080 ?auto_59083 ) ) ( not ( = ?auto_59085 ?auto_59083 ) ) ( not ( = ?auto_59090 ?auto_59083 ) ) ( not ( = ?auto_59073 ?auto_59083 ) ) ( not ( = ?auto_59067 ?auto_59083 ) ) ( AVAILABLE ?auto_59088 ) ( IN ?auto_59073 ?auto_59074 ) ( TRUCK-AT ?auto_59074 ?auto_59075 ) )
    :subtasks
    ( ( !DRIVE ?auto_59074 ?auto_59075 ?auto_59068 )
      ( MAKE-ON ?auto_59065 ?auto_59066 )
      ( MAKE-ON-VERIFY ?auto_59065 ?auto_59066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59096 - SURFACE
      ?auto_59097 - SURFACE
    )
    :vars
    (
      ?auto_59109 - HOIST
      ?auto_59114 - PLACE
      ?auto_59125 - PLACE
      ?auto_59119 - HOIST
      ?auto_59111 - SURFACE
      ?auto_59098 - SURFACE
      ?auto_59104 - PLACE
      ?auto_59103 - HOIST
      ?auto_59122 - SURFACE
      ?auto_59120 - SURFACE
      ?auto_59124 - PLACE
      ?auto_59102 - HOIST
      ?auto_59118 - SURFACE
      ?auto_59106 - SURFACE
      ?auto_59117 - PLACE
      ?auto_59121 - HOIST
      ?auto_59107 - SURFACE
      ?auto_59101 - SURFACE
      ?auto_59108 - SURFACE
      ?auto_59100 - SURFACE
      ?auto_59123 - PLACE
      ?auto_59110 - HOIST
      ?auto_59115 - SURFACE
      ?auto_59105 - SURFACE
      ?auto_59099 - PLACE
      ?auto_59113 - HOIST
      ?auto_59126 - SURFACE
      ?auto_59116 - SURFACE
      ?auto_59112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59109 ?auto_59114 ) ( IS-CRATE ?auto_59096 ) ( not ( = ?auto_59096 ?auto_59097 ) ) ( not ( = ?auto_59125 ?auto_59114 ) ) ( HOIST-AT ?auto_59119 ?auto_59125 ) ( not ( = ?auto_59109 ?auto_59119 ) ) ( SURFACE-AT ?auto_59096 ?auto_59125 ) ( ON ?auto_59096 ?auto_59111 ) ( CLEAR ?auto_59096 ) ( not ( = ?auto_59096 ?auto_59111 ) ) ( not ( = ?auto_59097 ?auto_59111 ) ) ( IS-CRATE ?auto_59097 ) ( not ( = ?auto_59096 ?auto_59098 ) ) ( not ( = ?auto_59097 ?auto_59098 ) ) ( not ( = ?auto_59111 ?auto_59098 ) ) ( not ( = ?auto_59104 ?auto_59114 ) ) ( not ( = ?auto_59125 ?auto_59104 ) ) ( HOIST-AT ?auto_59103 ?auto_59104 ) ( not ( = ?auto_59109 ?auto_59103 ) ) ( not ( = ?auto_59119 ?auto_59103 ) ) ( SURFACE-AT ?auto_59097 ?auto_59104 ) ( ON ?auto_59097 ?auto_59122 ) ( CLEAR ?auto_59097 ) ( not ( = ?auto_59096 ?auto_59122 ) ) ( not ( = ?auto_59097 ?auto_59122 ) ) ( not ( = ?auto_59111 ?auto_59122 ) ) ( not ( = ?auto_59098 ?auto_59122 ) ) ( IS-CRATE ?auto_59098 ) ( not ( = ?auto_59096 ?auto_59120 ) ) ( not ( = ?auto_59097 ?auto_59120 ) ) ( not ( = ?auto_59111 ?auto_59120 ) ) ( not ( = ?auto_59098 ?auto_59120 ) ) ( not ( = ?auto_59122 ?auto_59120 ) ) ( not ( = ?auto_59124 ?auto_59114 ) ) ( not ( = ?auto_59125 ?auto_59124 ) ) ( not ( = ?auto_59104 ?auto_59124 ) ) ( HOIST-AT ?auto_59102 ?auto_59124 ) ( not ( = ?auto_59109 ?auto_59102 ) ) ( not ( = ?auto_59119 ?auto_59102 ) ) ( not ( = ?auto_59103 ?auto_59102 ) ) ( AVAILABLE ?auto_59102 ) ( SURFACE-AT ?auto_59098 ?auto_59124 ) ( ON ?auto_59098 ?auto_59118 ) ( CLEAR ?auto_59098 ) ( not ( = ?auto_59096 ?auto_59118 ) ) ( not ( = ?auto_59097 ?auto_59118 ) ) ( not ( = ?auto_59111 ?auto_59118 ) ) ( not ( = ?auto_59098 ?auto_59118 ) ) ( not ( = ?auto_59122 ?auto_59118 ) ) ( not ( = ?auto_59120 ?auto_59118 ) ) ( IS-CRATE ?auto_59120 ) ( not ( = ?auto_59096 ?auto_59106 ) ) ( not ( = ?auto_59097 ?auto_59106 ) ) ( not ( = ?auto_59111 ?auto_59106 ) ) ( not ( = ?auto_59098 ?auto_59106 ) ) ( not ( = ?auto_59122 ?auto_59106 ) ) ( not ( = ?auto_59120 ?auto_59106 ) ) ( not ( = ?auto_59118 ?auto_59106 ) ) ( not ( = ?auto_59117 ?auto_59114 ) ) ( not ( = ?auto_59125 ?auto_59117 ) ) ( not ( = ?auto_59104 ?auto_59117 ) ) ( not ( = ?auto_59124 ?auto_59117 ) ) ( HOIST-AT ?auto_59121 ?auto_59117 ) ( not ( = ?auto_59109 ?auto_59121 ) ) ( not ( = ?auto_59119 ?auto_59121 ) ) ( not ( = ?auto_59103 ?auto_59121 ) ) ( not ( = ?auto_59102 ?auto_59121 ) ) ( AVAILABLE ?auto_59121 ) ( SURFACE-AT ?auto_59120 ?auto_59117 ) ( ON ?auto_59120 ?auto_59107 ) ( CLEAR ?auto_59120 ) ( not ( = ?auto_59096 ?auto_59107 ) ) ( not ( = ?auto_59097 ?auto_59107 ) ) ( not ( = ?auto_59111 ?auto_59107 ) ) ( not ( = ?auto_59098 ?auto_59107 ) ) ( not ( = ?auto_59122 ?auto_59107 ) ) ( not ( = ?auto_59120 ?auto_59107 ) ) ( not ( = ?auto_59118 ?auto_59107 ) ) ( not ( = ?auto_59106 ?auto_59107 ) ) ( IS-CRATE ?auto_59106 ) ( not ( = ?auto_59096 ?auto_59101 ) ) ( not ( = ?auto_59097 ?auto_59101 ) ) ( not ( = ?auto_59111 ?auto_59101 ) ) ( not ( = ?auto_59098 ?auto_59101 ) ) ( not ( = ?auto_59122 ?auto_59101 ) ) ( not ( = ?auto_59120 ?auto_59101 ) ) ( not ( = ?auto_59118 ?auto_59101 ) ) ( not ( = ?auto_59106 ?auto_59101 ) ) ( not ( = ?auto_59107 ?auto_59101 ) ) ( AVAILABLE ?auto_59103 ) ( SURFACE-AT ?auto_59106 ?auto_59104 ) ( ON ?auto_59106 ?auto_59108 ) ( CLEAR ?auto_59106 ) ( not ( = ?auto_59096 ?auto_59108 ) ) ( not ( = ?auto_59097 ?auto_59108 ) ) ( not ( = ?auto_59111 ?auto_59108 ) ) ( not ( = ?auto_59098 ?auto_59108 ) ) ( not ( = ?auto_59122 ?auto_59108 ) ) ( not ( = ?auto_59120 ?auto_59108 ) ) ( not ( = ?auto_59118 ?auto_59108 ) ) ( not ( = ?auto_59106 ?auto_59108 ) ) ( not ( = ?auto_59107 ?auto_59108 ) ) ( not ( = ?auto_59101 ?auto_59108 ) ) ( IS-CRATE ?auto_59101 ) ( not ( = ?auto_59096 ?auto_59100 ) ) ( not ( = ?auto_59097 ?auto_59100 ) ) ( not ( = ?auto_59111 ?auto_59100 ) ) ( not ( = ?auto_59098 ?auto_59100 ) ) ( not ( = ?auto_59122 ?auto_59100 ) ) ( not ( = ?auto_59120 ?auto_59100 ) ) ( not ( = ?auto_59118 ?auto_59100 ) ) ( not ( = ?auto_59106 ?auto_59100 ) ) ( not ( = ?auto_59107 ?auto_59100 ) ) ( not ( = ?auto_59101 ?auto_59100 ) ) ( not ( = ?auto_59108 ?auto_59100 ) ) ( not ( = ?auto_59123 ?auto_59114 ) ) ( not ( = ?auto_59125 ?auto_59123 ) ) ( not ( = ?auto_59104 ?auto_59123 ) ) ( not ( = ?auto_59124 ?auto_59123 ) ) ( not ( = ?auto_59117 ?auto_59123 ) ) ( HOIST-AT ?auto_59110 ?auto_59123 ) ( not ( = ?auto_59109 ?auto_59110 ) ) ( not ( = ?auto_59119 ?auto_59110 ) ) ( not ( = ?auto_59103 ?auto_59110 ) ) ( not ( = ?auto_59102 ?auto_59110 ) ) ( not ( = ?auto_59121 ?auto_59110 ) ) ( AVAILABLE ?auto_59110 ) ( SURFACE-AT ?auto_59101 ?auto_59123 ) ( ON ?auto_59101 ?auto_59115 ) ( CLEAR ?auto_59101 ) ( not ( = ?auto_59096 ?auto_59115 ) ) ( not ( = ?auto_59097 ?auto_59115 ) ) ( not ( = ?auto_59111 ?auto_59115 ) ) ( not ( = ?auto_59098 ?auto_59115 ) ) ( not ( = ?auto_59122 ?auto_59115 ) ) ( not ( = ?auto_59120 ?auto_59115 ) ) ( not ( = ?auto_59118 ?auto_59115 ) ) ( not ( = ?auto_59106 ?auto_59115 ) ) ( not ( = ?auto_59107 ?auto_59115 ) ) ( not ( = ?auto_59101 ?auto_59115 ) ) ( not ( = ?auto_59108 ?auto_59115 ) ) ( not ( = ?auto_59100 ?auto_59115 ) ) ( IS-CRATE ?auto_59100 ) ( not ( = ?auto_59096 ?auto_59105 ) ) ( not ( = ?auto_59097 ?auto_59105 ) ) ( not ( = ?auto_59111 ?auto_59105 ) ) ( not ( = ?auto_59098 ?auto_59105 ) ) ( not ( = ?auto_59122 ?auto_59105 ) ) ( not ( = ?auto_59120 ?auto_59105 ) ) ( not ( = ?auto_59118 ?auto_59105 ) ) ( not ( = ?auto_59106 ?auto_59105 ) ) ( not ( = ?auto_59107 ?auto_59105 ) ) ( not ( = ?auto_59101 ?auto_59105 ) ) ( not ( = ?auto_59108 ?auto_59105 ) ) ( not ( = ?auto_59100 ?auto_59105 ) ) ( not ( = ?auto_59115 ?auto_59105 ) ) ( not ( = ?auto_59099 ?auto_59114 ) ) ( not ( = ?auto_59125 ?auto_59099 ) ) ( not ( = ?auto_59104 ?auto_59099 ) ) ( not ( = ?auto_59124 ?auto_59099 ) ) ( not ( = ?auto_59117 ?auto_59099 ) ) ( not ( = ?auto_59123 ?auto_59099 ) ) ( HOIST-AT ?auto_59113 ?auto_59099 ) ( not ( = ?auto_59109 ?auto_59113 ) ) ( not ( = ?auto_59119 ?auto_59113 ) ) ( not ( = ?auto_59103 ?auto_59113 ) ) ( not ( = ?auto_59102 ?auto_59113 ) ) ( not ( = ?auto_59121 ?auto_59113 ) ) ( not ( = ?auto_59110 ?auto_59113 ) ) ( AVAILABLE ?auto_59113 ) ( SURFACE-AT ?auto_59100 ?auto_59099 ) ( ON ?auto_59100 ?auto_59126 ) ( CLEAR ?auto_59100 ) ( not ( = ?auto_59096 ?auto_59126 ) ) ( not ( = ?auto_59097 ?auto_59126 ) ) ( not ( = ?auto_59111 ?auto_59126 ) ) ( not ( = ?auto_59098 ?auto_59126 ) ) ( not ( = ?auto_59122 ?auto_59126 ) ) ( not ( = ?auto_59120 ?auto_59126 ) ) ( not ( = ?auto_59118 ?auto_59126 ) ) ( not ( = ?auto_59106 ?auto_59126 ) ) ( not ( = ?auto_59107 ?auto_59126 ) ) ( not ( = ?auto_59101 ?auto_59126 ) ) ( not ( = ?auto_59108 ?auto_59126 ) ) ( not ( = ?auto_59100 ?auto_59126 ) ) ( not ( = ?auto_59115 ?auto_59126 ) ) ( not ( = ?auto_59105 ?auto_59126 ) ) ( SURFACE-AT ?auto_59116 ?auto_59114 ) ( CLEAR ?auto_59116 ) ( IS-CRATE ?auto_59105 ) ( not ( = ?auto_59096 ?auto_59116 ) ) ( not ( = ?auto_59097 ?auto_59116 ) ) ( not ( = ?auto_59111 ?auto_59116 ) ) ( not ( = ?auto_59098 ?auto_59116 ) ) ( not ( = ?auto_59122 ?auto_59116 ) ) ( not ( = ?auto_59120 ?auto_59116 ) ) ( not ( = ?auto_59118 ?auto_59116 ) ) ( not ( = ?auto_59106 ?auto_59116 ) ) ( not ( = ?auto_59107 ?auto_59116 ) ) ( not ( = ?auto_59101 ?auto_59116 ) ) ( not ( = ?auto_59108 ?auto_59116 ) ) ( not ( = ?auto_59100 ?auto_59116 ) ) ( not ( = ?auto_59115 ?auto_59116 ) ) ( not ( = ?auto_59105 ?auto_59116 ) ) ( not ( = ?auto_59126 ?auto_59116 ) ) ( AVAILABLE ?auto_59109 ) ( TRUCK-AT ?auto_59112 ?auto_59125 ) ( LIFTING ?auto_59119 ?auto_59105 ) )
    :subtasks
    ( ( !LOAD ?auto_59119 ?auto_59105 ?auto_59112 ?auto_59125 )
      ( MAKE-ON ?auto_59096 ?auto_59097 )
      ( MAKE-ON-VERIFY ?auto_59096 ?auto_59097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59127 - SURFACE
      ?auto_59128 - SURFACE
    )
    :vars
    (
      ?auto_59149 - HOIST
      ?auto_59138 - PLACE
      ?auto_59133 - PLACE
      ?auto_59143 - HOIST
      ?auto_59151 - SURFACE
      ?auto_59156 - SURFACE
      ?auto_59134 - PLACE
      ?auto_59130 - HOIST
      ?auto_59131 - SURFACE
      ?auto_59144 - SURFACE
      ?auto_59132 - PLACE
      ?auto_59153 - HOIST
      ?auto_59142 - SURFACE
      ?auto_59146 - SURFACE
      ?auto_59141 - PLACE
      ?auto_59137 - HOIST
      ?auto_59147 - SURFACE
      ?auto_59154 - SURFACE
      ?auto_59148 - SURFACE
      ?auto_59155 - SURFACE
      ?auto_59129 - PLACE
      ?auto_59150 - HOIST
      ?auto_59139 - SURFACE
      ?auto_59152 - SURFACE
      ?auto_59135 - PLACE
      ?auto_59145 - HOIST
      ?auto_59136 - SURFACE
      ?auto_59140 - SURFACE
      ?auto_59157 - TRUCK
      ?auto_59158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59149 ?auto_59138 ) ( IS-CRATE ?auto_59127 ) ( not ( = ?auto_59127 ?auto_59128 ) ) ( not ( = ?auto_59133 ?auto_59138 ) ) ( HOIST-AT ?auto_59143 ?auto_59133 ) ( not ( = ?auto_59149 ?auto_59143 ) ) ( SURFACE-AT ?auto_59127 ?auto_59133 ) ( ON ?auto_59127 ?auto_59151 ) ( CLEAR ?auto_59127 ) ( not ( = ?auto_59127 ?auto_59151 ) ) ( not ( = ?auto_59128 ?auto_59151 ) ) ( IS-CRATE ?auto_59128 ) ( not ( = ?auto_59127 ?auto_59156 ) ) ( not ( = ?auto_59128 ?auto_59156 ) ) ( not ( = ?auto_59151 ?auto_59156 ) ) ( not ( = ?auto_59134 ?auto_59138 ) ) ( not ( = ?auto_59133 ?auto_59134 ) ) ( HOIST-AT ?auto_59130 ?auto_59134 ) ( not ( = ?auto_59149 ?auto_59130 ) ) ( not ( = ?auto_59143 ?auto_59130 ) ) ( SURFACE-AT ?auto_59128 ?auto_59134 ) ( ON ?auto_59128 ?auto_59131 ) ( CLEAR ?auto_59128 ) ( not ( = ?auto_59127 ?auto_59131 ) ) ( not ( = ?auto_59128 ?auto_59131 ) ) ( not ( = ?auto_59151 ?auto_59131 ) ) ( not ( = ?auto_59156 ?auto_59131 ) ) ( IS-CRATE ?auto_59156 ) ( not ( = ?auto_59127 ?auto_59144 ) ) ( not ( = ?auto_59128 ?auto_59144 ) ) ( not ( = ?auto_59151 ?auto_59144 ) ) ( not ( = ?auto_59156 ?auto_59144 ) ) ( not ( = ?auto_59131 ?auto_59144 ) ) ( not ( = ?auto_59132 ?auto_59138 ) ) ( not ( = ?auto_59133 ?auto_59132 ) ) ( not ( = ?auto_59134 ?auto_59132 ) ) ( HOIST-AT ?auto_59153 ?auto_59132 ) ( not ( = ?auto_59149 ?auto_59153 ) ) ( not ( = ?auto_59143 ?auto_59153 ) ) ( not ( = ?auto_59130 ?auto_59153 ) ) ( AVAILABLE ?auto_59153 ) ( SURFACE-AT ?auto_59156 ?auto_59132 ) ( ON ?auto_59156 ?auto_59142 ) ( CLEAR ?auto_59156 ) ( not ( = ?auto_59127 ?auto_59142 ) ) ( not ( = ?auto_59128 ?auto_59142 ) ) ( not ( = ?auto_59151 ?auto_59142 ) ) ( not ( = ?auto_59156 ?auto_59142 ) ) ( not ( = ?auto_59131 ?auto_59142 ) ) ( not ( = ?auto_59144 ?auto_59142 ) ) ( IS-CRATE ?auto_59144 ) ( not ( = ?auto_59127 ?auto_59146 ) ) ( not ( = ?auto_59128 ?auto_59146 ) ) ( not ( = ?auto_59151 ?auto_59146 ) ) ( not ( = ?auto_59156 ?auto_59146 ) ) ( not ( = ?auto_59131 ?auto_59146 ) ) ( not ( = ?auto_59144 ?auto_59146 ) ) ( not ( = ?auto_59142 ?auto_59146 ) ) ( not ( = ?auto_59141 ?auto_59138 ) ) ( not ( = ?auto_59133 ?auto_59141 ) ) ( not ( = ?auto_59134 ?auto_59141 ) ) ( not ( = ?auto_59132 ?auto_59141 ) ) ( HOIST-AT ?auto_59137 ?auto_59141 ) ( not ( = ?auto_59149 ?auto_59137 ) ) ( not ( = ?auto_59143 ?auto_59137 ) ) ( not ( = ?auto_59130 ?auto_59137 ) ) ( not ( = ?auto_59153 ?auto_59137 ) ) ( AVAILABLE ?auto_59137 ) ( SURFACE-AT ?auto_59144 ?auto_59141 ) ( ON ?auto_59144 ?auto_59147 ) ( CLEAR ?auto_59144 ) ( not ( = ?auto_59127 ?auto_59147 ) ) ( not ( = ?auto_59128 ?auto_59147 ) ) ( not ( = ?auto_59151 ?auto_59147 ) ) ( not ( = ?auto_59156 ?auto_59147 ) ) ( not ( = ?auto_59131 ?auto_59147 ) ) ( not ( = ?auto_59144 ?auto_59147 ) ) ( not ( = ?auto_59142 ?auto_59147 ) ) ( not ( = ?auto_59146 ?auto_59147 ) ) ( IS-CRATE ?auto_59146 ) ( not ( = ?auto_59127 ?auto_59154 ) ) ( not ( = ?auto_59128 ?auto_59154 ) ) ( not ( = ?auto_59151 ?auto_59154 ) ) ( not ( = ?auto_59156 ?auto_59154 ) ) ( not ( = ?auto_59131 ?auto_59154 ) ) ( not ( = ?auto_59144 ?auto_59154 ) ) ( not ( = ?auto_59142 ?auto_59154 ) ) ( not ( = ?auto_59146 ?auto_59154 ) ) ( not ( = ?auto_59147 ?auto_59154 ) ) ( AVAILABLE ?auto_59130 ) ( SURFACE-AT ?auto_59146 ?auto_59134 ) ( ON ?auto_59146 ?auto_59148 ) ( CLEAR ?auto_59146 ) ( not ( = ?auto_59127 ?auto_59148 ) ) ( not ( = ?auto_59128 ?auto_59148 ) ) ( not ( = ?auto_59151 ?auto_59148 ) ) ( not ( = ?auto_59156 ?auto_59148 ) ) ( not ( = ?auto_59131 ?auto_59148 ) ) ( not ( = ?auto_59144 ?auto_59148 ) ) ( not ( = ?auto_59142 ?auto_59148 ) ) ( not ( = ?auto_59146 ?auto_59148 ) ) ( not ( = ?auto_59147 ?auto_59148 ) ) ( not ( = ?auto_59154 ?auto_59148 ) ) ( IS-CRATE ?auto_59154 ) ( not ( = ?auto_59127 ?auto_59155 ) ) ( not ( = ?auto_59128 ?auto_59155 ) ) ( not ( = ?auto_59151 ?auto_59155 ) ) ( not ( = ?auto_59156 ?auto_59155 ) ) ( not ( = ?auto_59131 ?auto_59155 ) ) ( not ( = ?auto_59144 ?auto_59155 ) ) ( not ( = ?auto_59142 ?auto_59155 ) ) ( not ( = ?auto_59146 ?auto_59155 ) ) ( not ( = ?auto_59147 ?auto_59155 ) ) ( not ( = ?auto_59154 ?auto_59155 ) ) ( not ( = ?auto_59148 ?auto_59155 ) ) ( not ( = ?auto_59129 ?auto_59138 ) ) ( not ( = ?auto_59133 ?auto_59129 ) ) ( not ( = ?auto_59134 ?auto_59129 ) ) ( not ( = ?auto_59132 ?auto_59129 ) ) ( not ( = ?auto_59141 ?auto_59129 ) ) ( HOIST-AT ?auto_59150 ?auto_59129 ) ( not ( = ?auto_59149 ?auto_59150 ) ) ( not ( = ?auto_59143 ?auto_59150 ) ) ( not ( = ?auto_59130 ?auto_59150 ) ) ( not ( = ?auto_59153 ?auto_59150 ) ) ( not ( = ?auto_59137 ?auto_59150 ) ) ( AVAILABLE ?auto_59150 ) ( SURFACE-AT ?auto_59154 ?auto_59129 ) ( ON ?auto_59154 ?auto_59139 ) ( CLEAR ?auto_59154 ) ( not ( = ?auto_59127 ?auto_59139 ) ) ( not ( = ?auto_59128 ?auto_59139 ) ) ( not ( = ?auto_59151 ?auto_59139 ) ) ( not ( = ?auto_59156 ?auto_59139 ) ) ( not ( = ?auto_59131 ?auto_59139 ) ) ( not ( = ?auto_59144 ?auto_59139 ) ) ( not ( = ?auto_59142 ?auto_59139 ) ) ( not ( = ?auto_59146 ?auto_59139 ) ) ( not ( = ?auto_59147 ?auto_59139 ) ) ( not ( = ?auto_59154 ?auto_59139 ) ) ( not ( = ?auto_59148 ?auto_59139 ) ) ( not ( = ?auto_59155 ?auto_59139 ) ) ( IS-CRATE ?auto_59155 ) ( not ( = ?auto_59127 ?auto_59152 ) ) ( not ( = ?auto_59128 ?auto_59152 ) ) ( not ( = ?auto_59151 ?auto_59152 ) ) ( not ( = ?auto_59156 ?auto_59152 ) ) ( not ( = ?auto_59131 ?auto_59152 ) ) ( not ( = ?auto_59144 ?auto_59152 ) ) ( not ( = ?auto_59142 ?auto_59152 ) ) ( not ( = ?auto_59146 ?auto_59152 ) ) ( not ( = ?auto_59147 ?auto_59152 ) ) ( not ( = ?auto_59154 ?auto_59152 ) ) ( not ( = ?auto_59148 ?auto_59152 ) ) ( not ( = ?auto_59155 ?auto_59152 ) ) ( not ( = ?auto_59139 ?auto_59152 ) ) ( not ( = ?auto_59135 ?auto_59138 ) ) ( not ( = ?auto_59133 ?auto_59135 ) ) ( not ( = ?auto_59134 ?auto_59135 ) ) ( not ( = ?auto_59132 ?auto_59135 ) ) ( not ( = ?auto_59141 ?auto_59135 ) ) ( not ( = ?auto_59129 ?auto_59135 ) ) ( HOIST-AT ?auto_59145 ?auto_59135 ) ( not ( = ?auto_59149 ?auto_59145 ) ) ( not ( = ?auto_59143 ?auto_59145 ) ) ( not ( = ?auto_59130 ?auto_59145 ) ) ( not ( = ?auto_59153 ?auto_59145 ) ) ( not ( = ?auto_59137 ?auto_59145 ) ) ( not ( = ?auto_59150 ?auto_59145 ) ) ( AVAILABLE ?auto_59145 ) ( SURFACE-AT ?auto_59155 ?auto_59135 ) ( ON ?auto_59155 ?auto_59136 ) ( CLEAR ?auto_59155 ) ( not ( = ?auto_59127 ?auto_59136 ) ) ( not ( = ?auto_59128 ?auto_59136 ) ) ( not ( = ?auto_59151 ?auto_59136 ) ) ( not ( = ?auto_59156 ?auto_59136 ) ) ( not ( = ?auto_59131 ?auto_59136 ) ) ( not ( = ?auto_59144 ?auto_59136 ) ) ( not ( = ?auto_59142 ?auto_59136 ) ) ( not ( = ?auto_59146 ?auto_59136 ) ) ( not ( = ?auto_59147 ?auto_59136 ) ) ( not ( = ?auto_59154 ?auto_59136 ) ) ( not ( = ?auto_59148 ?auto_59136 ) ) ( not ( = ?auto_59155 ?auto_59136 ) ) ( not ( = ?auto_59139 ?auto_59136 ) ) ( not ( = ?auto_59152 ?auto_59136 ) ) ( SURFACE-AT ?auto_59140 ?auto_59138 ) ( CLEAR ?auto_59140 ) ( IS-CRATE ?auto_59152 ) ( not ( = ?auto_59127 ?auto_59140 ) ) ( not ( = ?auto_59128 ?auto_59140 ) ) ( not ( = ?auto_59151 ?auto_59140 ) ) ( not ( = ?auto_59156 ?auto_59140 ) ) ( not ( = ?auto_59131 ?auto_59140 ) ) ( not ( = ?auto_59144 ?auto_59140 ) ) ( not ( = ?auto_59142 ?auto_59140 ) ) ( not ( = ?auto_59146 ?auto_59140 ) ) ( not ( = ?auto_59147 ?auto_59140 ) ) ( not ( = ?auto_59154 ?auto_59140 ) ) ( not ( = ?auto_59148 ?auto_59140 ) ) ( not ( = ?auto_59155 ?auto_59140 ) ) ( not ( = ?auto_59139 ?auto_59140 ) ) ( not ( = ?auto_59152 ?auto_59140 ) ) ( not ( = ?auto_59136 ?auto_59140 ) ) ( AVAILABLE ?auto_59149 ) ( TRUCK-AT ?auto_59157 ?auto_59133 ) ( AVAILABLE ?auto_59143 ) ( SURFACE-AT ?auto_59152 ?auto_59133 ) ( ON ?auto_59152 ?auto_59158 ) ( CLEAR ?auto_59152 ) ( not ( = ?auto_59127 ?auto_59158 ) ) ( not ( = ?auto_59128 ?auto_59158 ) ) ( not ( = ?auto_59151 ?auto_59158 ) ) ( not ( = ?auto_59156 ?auto_59158 ) ) ( not ( = ?auto_59131 ?auto_59158 ) ) ( not ( = ?auto_59144 ?auto_59158 ) ) ( not ( = ?auto_59142 ?auto_59158 ) ) ( not ( = ?auto_59146 ?auto_59158 ) ) ( not ( = ?auto_59147 ?auto_59158 ) ) ( not ( = ?auto_59154 ?auto_59158 ) ) ( not ( = ?auto_59148 ?auto_59158 ) ) ( not ( = ?auto_59155 ?auto_59158 ) ) ( not ( = ?auto_59139 ?auto_59158 ) ) ( not ( = ?auto_59152 ?auto_59158 ) ) ( not ( = ?auto_59136 ?auto_59158 ) ) ( not ( = ?auto_59140 ?auto_59158 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59143 ?auto_59152 ?auto_59158 ?auto_59133 )
      ( MAKE-ON ?auto_59127 ?auto_59128 )
      ( MAKE-ON-VERIFY ?auto_59127 ?auto_59128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59159 - SURFACE
      ?auto_59160 - SURFACE
    )
    :vars
    (
      ?auto_59174 - HOIST
      ?auto_59163 - PLACE
      ?auto_59182 - PLACE
      ?auto_59188 - HOIST
      ?auto_59176 - SURFACE
      ?auto_59166 - SURFACE
      ?auto_59183 - PLACE
      ?auto_59179 - HOIST
      ?auto_59180 - SURFACE
      ?auto_59177 - SURFACE
      ?auto_59181 - PLACE
      ?auto_59162 - HOIST
      ?auto_59186 - SURFACE
      ?auto_59171 - SURFACE
      ?auto_59164 - PLACE
      ?auto_59165 - HOIST
      ?auto_59172 - SURFACE
      ?auto_59161 - SURFACE
      ?auto_59173 - SURFACE
      ?auto_59167 - SURFACE
      ?auto_59178 - PLACE
      ?auto_59175 - HOIST
      ?auto_59184 - SURFACE
      ?auto_59169 - SURFACE
      ?auto_59189 - PLACE
      ?auto_59170 - HOIST
      ?auto_59185 - SURFACE
      ?auto_59187 - SURFACE
      ?auto_59190 - SURFACE
      ?auto_59168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59174 ?auto_59163 ) ( IS-CRATE ?auto_59159 ) ( not ( = ?auto_59159 ?auto_59160 ) ) ( not ( = ?auto_59182 ?auto_59163 ) ) ( HOIST-AT ?auto_59188 ?auto_59182 ) ( not ( = ?auto_59174 ?auto_59188 ) ) ( SURFACE-AT ?auto_59159 ?auto_59182 ) ( ON ?auto_59159 ?auto_59176 ) ( CLEAR ?auto_59159 ) ( not ( = ?auto_59159 ?auto_59176 ) ) ( not ( = ?auto_59160 ?auto_59176 ) ) ( IS-CRATE ?auto_59160 ) ( not ( = ?auto_59159 ?auto_59166 ) ) ( not ( = ?auto_59160 ?auto_59166 ) ) ( not ( = ?auto_59176 ?auto_59166 ) ) ( not ( = ?auto_59183 ?auto_59163 ) ) ( not ( = ?auto_59182 ?auto_59183 ) ) ( HOIST-AT ?auto_59179 ?auto_59183 ) ( not ( = ?auto_59174 ?auto_59179 ) ) ( not ( = ?auto_59188 ?auto_59179 ) ) ( SURFACE-AT ?auto_59160 ?auto_59183 ) ( ON ?auto_59160 ?auto_59180 ) ( CLEAR ?auto_59160 ) ( not ( = ?auto_59159 ?auto_59180 ) ) ( not ( = ?auto_59160 ?auto_59180 ) ) ( not ( = ?auto_59176 ?auto_59180 ) ) ( not ( = ?auto_59166 ?auto_59180 ) ) ( IS-CRATE ?auto_59166 ) ( not ( = ?auto_59159 ?auto_59177 ) ) ( not ( = ?auto_59160 ?auto_59177 ) ) ( not ( = ?auto_59176 ?auto_59177 ) ) ( not ( = ?auto_59166 ?auto_59177 ) ) ( not ( = ?auto_59180 ?auto_59177 ) ) ( not ( = ?auto_59181 ?auto_59163 ) ) ( not ( = ?auto_59182 ?auto_59181 ) ) ( not ( = ?auto_59183 ?auto_59181 ) ) ( HOIST-AT ?auto_59162 ?auto_59181 ) ( not ( = ?auto_59174 ?auto_59162 ) ) ( not ( = ?auto_59188 ?auto_59162 ) ) ( not ( = ?auto_59179 ?auto_59162 ) ) ( AVAILABLE ?auto_59162 ) ( SURFACE-AT ?auto_59166 ?auto_59181 ) ( ON ?auto_59166 ?auto_59186 ) ( CLEAR ?auto_59166 ) ( not ( = ?auto_59159 ?auto_59186 ) ) ( not ( = ?auto_59160 ?auto_59186 ) ) ( not ( = ?auto_59176 ?auto_59186 ) ) ( not ( = ?auto_59166 ?auto_59186 ) ) ( not ( = ?auto_59180 ?auto_59186 ) ) ( not ( = ?auto_59177 ?auto_59186 ) ) ( IS-CRATE ?auto_59177 ) ( not ( = ?auto_59159 ?auto_59171 ) ) ( not ( = ?auto_59160 ?auto_59171 ) ) ( not ( = ?auto_59176 ?auto_59171 ) ) ( not ( = ?auto_59166 ?auto_59171 ) ) ( not ( = ?auto_59180 ?auto_59171 ) ) ( not ( = ?auto_59177 ?auto_59171 ) ) ( not ( = ?auto_59186 ?auto_59171 ) ) ( not ( = ?auto_59164 ?auto_59163 ) ) ( not ( = ?auto_59182 ?auto_59164 ) ) ( not ( = ?auto_59183 ?auto_59164 ) ) ( not ( = ?auto_59181 ?auto_59164 ) ) ( HOIST-AT ?auto_59165 ?auto_59164 ) ( not ( = ?auto_59174 ?auto_59165 ) ) ( not ( = ?auto_59188 ?auto_59165 ) ) ( not ( = ?auto_59179 ?auto_59165 ) ) ( not ( = ?auto_59162 ?auto_59165 ) ) ( AVAILABLE ?auto_59165 ) ( SURFACE-AT ?auto_59177 ?auto_59164 ) ( ON ?auto_59177 ?auto_59172 ) ( CLEAR ?auto_59177 ) ( not ( = ?auto_59159 ?auto_59172 ) ) ( not ( = ?auto_59160 ?auto_59172 ) ) ( not ( = ?auto_59176 ?auto_59172 ) ) ( not ( = ?auto_59166 ?auto_59172 ) ) ( not ( = ?auto_59180 ?auto_59172 ) ) ( not ( = ?auto_59177 ?auto_59172 ) ) ( not ( = ?auto_59186 ?auto_59172 ) ) ( not ( = ?auto_59171 ?auto_59172 ) ) ( IS-CRATE ?auto_59171 ) ( not ( = ?auto_59159 ?auto_59161 ) ) ( not ( = ?auto_59160 ?auto_59161 ) ) ( not ( = ?auto_59176 ?auto_59161 ) ) ( not ( = ?auto_59166 ?auto_59161 ) ) ( not ( = ?auto_59180 ?auto_59161 ) ) ( not ( = ?auto_59177 ?auto_59161 ) ) ( not ( = ?auto_59186 ?auto_59161 ) ) ( not ( = ?auto_59171 ?auto_59161 ) ) ( not ( = ?auto_59172 ?auto_59161 ) ) ( AVAILABLE ?auto_59179 ) ( SURFACE-AT ?auto_59171 ?auto_59183 ) ( ON ?auto_59171 ?auto_59173 ) ( CLEAR ?auto_59171 ) ( not ( = ?auto_59159 ?auto_59173 ) ) ( not ( = ?auto_59160 ?auto_59173 ) ) ( not ( = ?auto_59176 ?auto_59173 ) ) ( not ( = ?auto_59166 ?auto_59173 ) ) ( not ( = ?auto_59180 ?auto_59173 ) ) ( not ( = ?auto_59177 ?auto_59173 ) ) ( not ( = ?auto_59186 ?auto_59173 ) ) ( not ( = ?auto_59171 ?auto_59173 ) ) ( not ( = ?auto_59172 ?auto_59173 ) ) ( not ( = ?auto_59161 ?auto_59173 ) ) ( IS-CRATE ?auto_59161 ) ( not ( = ?auto_59159 ?auto_59167 ) ) ( not ( = ?auto_59160 ?auto_59167 ) ) ( not ( = ?auto_59176 ?auto_59167 ) ) ( not ( = ?auto_59166 ?auto_59167 ) ) ( not ( = ?auto_59180 ?auto_59167 ) ) ( not ( = ?auto_59177 ?auto_59167 ) ) ( not ( = ?auto_59186 ?auto_59167 ) ) ( not ( = ?auto_59171 ?auto_59167 ) ) ( not ( = ?auto_59172 ?auto_59167 ) ) ( not ( = ?auto_59161 ?auto_59167 ) ) ( not ( = ?auto_59173 ?auto_59167 ) ) ( not ( = ?auto_59178 ?auto_59163 ) ) ( not ( = ?auto_59182 ?auto_59178 ) ) ( not ( = ?auto_59183 ?auto_59178 ) ) ( not ( = ?auto_59181 ?auto_59178 ) ) ( not ( = ?auto_59164 ?auto_59178 ) ) ( HOIST-AT ?auto_59175 ?auto_59178 ) ( not ( = ?auto_59174 ?auto_59175 ) ) ( not ( = ?auto_59188 ?auto_59175 ) ) ( not ( = ?auto_59179 ?auto_59175 ) ) ( not ( = ?auto_59162 ?auto_59175 ) ) ( not ( = ?auto_59165 ?auto_59175 ) ) ( AVAILABLE ?auto_59175 ) ( SURFACE-AT ?auto_59161 ?auto_59178 ) ( ON ?auto_59161 ?auto_59184 ) ( CLEAR ?auto_59161 ) ( not ( = ?auto_59159 ?auto_59184 ) ) ( not ( = ?auto_59160 ?auto_59184 ) ) ( not ( = ?auto_59176 ?auto_59184 ) ) ( not ( = ?auto_59166 ?auto_59184 ) ) ( not ( = ?auto_59180 ?auto_59184 ) ) ( not ( = ?auto_59177 ?auto_59184 ) ) ( not ( = ?auto_59186 ?auto_59184 ) ) ( not ( = ?auto_59171 ?auto_59184 ) ) ( not ( = ?auto_59172 ?auto_59184 ) ) ( not ( = ?auto_59161 ?auto_59184 ) ) ( not ( = ?auto_59173 ?auto_59184 ) ) ( not ( = ?auto_59167 ?auto_59184 ) ) ( IS-CRATE ?auto_59167 ) ( not ( = ?auto_59159 ?auto_59169 ) ) ( not ( = ?auto_59160 ?auto_59169 ) ) ( not ( = ?auto_59176 ?auto_59169 ) ) ( not ( = ?auto_59166 ?auto_59169 ) ) ( not ( = ?auto_59180 ?auto_59169 ) ) ( not ( = ?auto_59177 ?auto_59169 ) ) ( not ( = ?auto_59186 ?auto_59169 ) ) ( not ( = ?auto_59171 ?auto_59169 ) ) ( not ( = ?auto_59172 ?auto_59169 ) ) ( not ( = ?auto_59161 ?auto_59169 ) ) ( not ( = ?auto_59173 ?auto_59169 ) ) ( not ( = ?auto_59167 ?auto_59169 ) ) ( not ( = ?auto_59184 ?auto_59169 ) ) ( not ( = ?auto_59189 ?auto_59163 ) ) ( not ( = ?auto_59182 ?auto_59189 ) ) ( not ( = ?auto_59183 ?auto_59189 ) ) ( not ( = ?auto_59181 ?auto_59189 ) ) ( not ( = ?auto_59164 ?auto_59189 ) ) ( not ( = ?auto_59178 ?auto_59189 ) ) ( HOIST-AT ?auto_59170 ?auto_59189 ) ( not ( = ?auto_59174 ?auto_59170 ) ) ( not ( = ?auto_59188 ?auto_59170 ) ) ( not ( = ?auto_59179 ?auto_59170 ) ) ( not ( = ?auto_59162 ?auto_59170 ) ) ( not ( = ?auto_59165 ?auto_59170 ) ) ( not ( = ?auto_59175 ?auto_59170 ) ) ( AVAILABLE ?auto_59170 ) ( SURFACE-AT ?auto_59167 ?auto_59189 ) ( ON ?auto_59167 ?auto_59185 ) ( CLEAR ?auto_59167 ) ( not ( = ?auto_59159 ?auto_59185 ) ) ( not ( = ?auto_59160 ?auto_59185 ) ) ( not ( = ?auto_59176 ?auto_59185 ) ) ( not ( = ?auto_59166 ?auto_59185 ) ) ( not ( = ?auto_59180 ?auto_59185 ) ) ( not ( = ?auto_59177 ?auto_59185 ) ) ( not ( = ?auto_59186 ?auto_59185 ) ) ( not ( = ?auto_59171 ?auto_59185 ) ) ( not ( = ?auto_59172 ?auto_59185 ) ) ( not ( = ?auto_59161 ?auto_59185 ) ) ( not ( = ?auto_59173 ?auto_59185 ) ) ( not ( = ?auto_59167 ?auto_59185 ) ) ( not ( = ?auto_59184 ?auto_59185 ) ) ( not ( = ?auto_59169 ?auto_59185 ) ) ( SURFACE-AT ?auto_59187 ?auto_59163 ) ( CLEAR ?auto_59187 ) ( IS-CRATE ?auto_59169 ) ( not ( = ?auto_59159 ?auto_59187 ) ) ( not ( = ?auto_59160 ?auto_59187 ) ) ( not ( = ?auto_59176 ?auto_59187 ) ) ( not ( = ?auto_59166 ?auto_59187 ) ) ( not ( = ?auto_59180 ?auto_59187 ) ) ( not ( = ?auto_59177 ?auto_59187 ) ) ( not ( = ?auto_59186 ?auto_59187 ) ) ( not ( = ?auto_59171 ?auto_59187 ) ) ( not ( = ?auto_59172 ?auto_59187 ) ) ( not ( = ?auto_59161 ?auto_59187 ) ) ( not ( = ?auto_59173 ?auto_59187 ) ) ( not ( = ?auto_59167 ?auto_59187 ) ) ( not ( = ?auto_59184 ?auto_59187 ) ) ( not ( = ?auto_59169 ?auto_59187 ) ) ( not ( = ?auto_59185 ?auto_59187 ) ) ( AVAILABLE ?auto_59174 ) ( AVAILABLE ?auto_59188 ) ( SURFACE-AT ?auto_59169 ?auto_59182 ) ( ON ?auto_59169 ?auto_59190 ) ( CLEAR ?auto_59169 ) ( not ( = ?auto_59159 ?auto_59190 ) ) ( not ( = ?auto_59160 ?auto_59190 ) ) ( not ( = ?auto_59176 ?auto_59190 ) ) ( not ( = ?auto_59166 ?auto_59190 ) ) ( not ( = ?auto_59180 ?auto_59190 ) ) ( not ( = ?auto_59177 ?auto_59190 ) ) ( not ( = ?auto_59186 ?auto_59190 ) ) ( not ( = ?auto_59171 ?auto_59190 ) ) ( not ( = ?auto_59172 ?auto_59190 ) ) ( not ( = ?auto_59161 ?auto_59190 ) ) ( not ( = ?auto_59173 ?auto_59190 ) ) ( not ( = ?auto_59167 ?auto_59190 ) ) ( not ( = ?auto_59184 ?auto_59190 ) ) ( not ( = ?auto_59169 ?auto_59190 ) ) ( not ( = ?auto_59185 ?auto_59190 ) ) ( not ( = ?auto_59187 ?auto_59190 ) ) ( TRUCK-AT ?auto_59168 ?auto_59163 ) )
    :subtasks
    ( ( !DRIVE ?auto_59168 ?auto_59163 ?auto_59182 )
      ( MAKE-ON ?auto_59159 ?auto_59160 )
      ( MAKE-ON-VERIFY ?auto_59159 ?auto_59160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59191 - SURFACE
      ?auto_59192 - SURFACE
    )
    :vars
    (
      ?auto_59197 - HOIST
      ?auto_59198 - PLACE
      ?auto_59212 - PLACE
      ?auto_59193 - HOIST
      ?auto_59214 - SURFACE
      ?auto_59218 - SURFACE
      ?auto_59213 - PLACE
      ?auto_59209 - HOIST
      ?auto_59210 - SURFACE
      ?auto_59207 - SURFACE
      ?auto_59211 - PLACE
      ?auto_59202 - HOIST
      ?auto_59205 - SURFACE
      ?auto_59201 - SURFACE
      ?auto_59219 - PLACE
      ?auto_59204 - HOIST
      ?auto_59217 - SURFACE
      ?auto_59203 - SURFACE
      ?auto_59215 - SURFACE
      ?auto_59221 - SURFACE
      ?auto_59208 - PLACE
      ?auto_59216 - HOIST
      ?auto_59206 - SURFACE
      ?auto_59222 - SURFACE
      ?auto_59196 - PLACE
      ?auto_59220 - HOIST
      ?auto_59195 - SURFACE
      ?auto_59194 - SURFACE
      ?auto_59199 - SURFACE
      ?auto_59200 - TRUCK
      ?auto_59223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59197 ?auto_59198 ) ( IS-CRATE ?auto_59191 ) ( not ( = ?auto_59191 ?auto_59192 ) ) ( not ( = ?auto_59212 ?auto_59198 ) ) ( HOIST-AT ?auto_59193 ?auto_59212 ) ( not ( = ?auto_59197 ?auto_59193 ) ) ( SURFACE-AT ?auto_59191 ?auto_59212 ) ( ON ?auto_59191 ?auto_59214 ) ( CLEAR ?auto_59191 ) ( not ( = ?auto_59191 ?auto_59214 ) ) ( not ( = ?auto_59192 ?auto_59214 ) ) ( IS-CRATE ?auto_59192 ) ( not ( = ?auto_59191 ?auto_59218 ) ) ( not ( = ?auto_59192 ?auto_59218 ) ) ( not ( = ?auto_59214 ?auto_59218 ) ) ( not ( = ?auto_59213 ?auto_59198 ) ) ( not ( = ?auto_59212 ?auto_59213 ) ) ( HOIST-AT ?auto_59209 ?auto_59213 ) ( not ( = ?auto_59197 ?auto_59209 ) ) ( not ( = ?auto_59193 ?auto_59209 ) ) ( SURFACE-AT ?auto_59192 ?auto_59213 ) ( ON ?auto_59192 ?auto_59210 ) ( CLEAR ?auto_59192 ) ( not ( = ?auto_59191 ?auto_59210 ) ) ( not ( = ?auto_59192 ?auto_59210 ) ) ( not ( = ?auto_59214 ?auto_59210 ) ) ( not ( = ?auto_59218 ?auto_59210 ) ) ( IS-CRATE ?auto_59218 ) ( not ( = ?auto_59191 ?auto_59207 ) ) ( not ( = ?auto_59192 ?auto_59207 ) ) ( not ( = ?auto_59214 ?auto_59207 ) ) ( not ( = ?auto_59218 ?auto_59207 ) ) ( not ( = ?auto_59210 ?auto_59207 ) ) ( not ( = ?auto_59211 ?auto_59198 ) ) ( not ( = ?auto_59212 ?auto_59211 ) ) ( not ( = ?auto_59213 ?auto_59211 ) ) ( HOIST-AT ?auto_59202 ?auto_59211 ) ( not ( = ?auto_59197 ?auto_59202 ) ) ( not ( = ?auto_59193 ?auto_59202 ) ) ( not ( = ?auto_59209 ?auto_59202 ) ) ( AVAILABLE ?auto_59202 ) ( SURFACE-AT ?auto_59218 ?auto_59211 ) ( ON ?auto_59218 ?auto_59205 ) ( CLEAR ?auto_59218 ) ( not ( = ?auto_59191 ?auto_59205 ) ) ( not ( = ?auto_59192 ?auto_59205 ) ) ( not ( = ?auto_59214 ?auto_59205 ) ) ( not ( = ?auto_59218 ?auto_59205 ) ) ( not ( = ?auto_59210 ?auto_59205 ) ) ( not ( = ?auto_59207 ?auto_59205 ) ) ( IS-CRATE ?auto_59207 ) ( not ( = ?auto_59191 ?auto_59201 ) ) ( not ( = ?auto_59192 ?auto_59201 ) ) ( not ( = ?auto_59214 ?auto_59201 ) ) ( not ( = ?auto_59218 ?auto_59201 ) ) ( not ( = ?auto_59210 ?auto_59201 ) ) ( not ( = ?auto_59207 ?auto_59201 ) ) ( not ( = ?auto_59205 ?auto_59201 ) ) ( not ( = ?auto_59219 ?auto_59198 ) ) ( not ( = ?auto_59212 ?auto_59219 ) ) ( not ( = ?auto_59213 ?auto_59219 ) ) ( not ( = ?auto_59211 ?auto_59219 ) ) ( HOIST-AT ?auto_59204 ?auto_59219 ) ( not ( = ?auto_59197 ?auto_59204 ) ) ( not ( = ?auto_59193 ?auto_59204 ) ) ( not ( = ?auto_59209 ?auto_59204 ) ) ( not ( = ?auto_59202 ?auto_59204 ) ) ( AVAILABLE ?auto_59204 ) ( SURFACE-AT ?auto_59207 ?auto_59219 ) ( ON ?auto_59207 ?auto_59217 ) ( CLEAR ?auto_59207 ) ( not ( = ?auto_59191 ?auto_59217 ) ) ( not ( = ?auto_59192 ?auto_59217 ) ) ( not ( = ?auto_59214 ?auto_59217 ) ) ( not ( = ?auto_59218 ?auto_59217 ) ) ( not ( = ?auto_59210 ?auto_59217 ) ) ( not ( = ?auto_59207 ?auto_59217 ) ) ( not ( = ?auto_59205 ?auto_59217 ) ) ( not ( = ?auto_59201 ?auto_59217 ) ) ( IS-CRATE ?auto_59201 ) ( not ( = ?auto_59191 ?auto_59203 ) ) ( not ( = ?auto_59192 ?auto_59203 ) ) ( not ( = ?auto_59214 ?auto_59203 ) ) ( not ( = ?auto_59218 ?auto_59203 ) ) ( not ( = ?auto_59210 ?auto_59203 ) ) ( not ( = ?auto_59207 ?auto_59203 ) ) ( not ( = ?auto_59205 ?auto_59203 ) ) ( not ( = ?auto_59201 ?auto_59203 ) ) ( not ( = ?auto_59217 ?auto_59203 ) ) ( AVAILABLE ?auto_59209 ) ( SURFACE-AT ?auto_59201 ?auto_59213 ) ( ON ?auto_59201 ?auto_59215 ) ( CLEAR ?auto_59201 ) ( not ( = ?auto_59191 ?auto_59215 ) ) ( not ( = ?auto_59192 ?auto_59215 ) ) ( not ( = ?auto_59214 ?auto_59215 ) ) ( not ( = ?auto_59218 ?auto_59215 ) ) ( not ( = ?auto_59210 ?auto_59215 ) ) ( not ( = ?auto_59207 ?auto_59215 ) ) ( not ( = ?auto_59205 ?auto_59215 ) ) ( not ( = ?auto_59201 ?auto_59215 ) ) ( not ( = ?auto_59217 ?auto_59215 ) ) ( not ( = ?auto_59203 ?auto_59215 ) ) ( IS-CRATE ?auto_59203 ) ( not ( = ?auto_59191 ?auto_59221 ) ) ( not ( = ?auto_59192 ?auto_59221 ) ) ( not ( = ?auto_59214 ?auto_59221 ) ) ( not ( = ?auto_59218 ?auto_59221 ) ) ( not ( = ?auto_59210 ?auto_59221 ) ) ( not ( = ?auto_59207 ?auto_59221 ) ) ( not ( = ?auto_59205 ?auto_59221 ) ) ( not ( = ?auto_59201 ?auto_59221 ) ) ( not ( = ?auto_59217 ?auto_59221 ) ) ( not ( = ?auto_59203 ?auto_59221 ) ) ( not ( = ?auto_59215 ?auto_59221 ) ) ( not ( = ?auto_59208 ?auto_59198 ) ) ( not ( = ?auto_59212 ?auto_59208 ) ) ( not ( = ?auto_59213 ?auto_59208 ) ) ( not ( = ?auto_59211 ?auto_59208 ) ) ( not ( = ?auto_59219 ?auto_59208 ) ) ( HOIST-AT ?auto_59216 ?auto_59208 ) ( not ( = ?auto_59197 ?auto_59216 ) ) ( not ( = ?auto_59193 ?auto_59216 ) ) ( not ( = ?auto_59209 ?auto_59216 ) ) ( not ( = ?auto_59202 ?auto_59216 ) ) ( not ( = ?auto_59204 ?auto_59216 ) ) ( AVAILABLE ?auto_59216 ) ( SURFACE-AT ?auto_59203 ?auto_59208 ) ( ON ?auto_59203 ?auto_59206 ) ( CLEAR ?auto_59203 ) ( not ( = ?auto_59191 ?auto_59206 ) ) ( not ( = ?auto_59192 ?auto_59206 ) ) ( not ( = ?auto_59214 ?auto_59206 ) ) ( not ( = ?auto_59218 ?auto_59206 ) ) ( not ( = ?auto_59210 ?auto_59206 ) ) ( not ( = ?auto_59207 ?auto_59206 ) ) ( not ( = ?auto_59205 ?auto_59206 ) ) ( not ( = ?auto_59201 ?auto_59206 ) ) ( not ( = ?auto_59217 ?auto_59206 ) ) ( not ( = ?auto_59203 ?auto_59206 ) ) ( not ( = ?auto_59215 ?auto_59206 ) ) ( not ( = ?auto_59221 ?auto_59206 ) ) ( IS-CRATE ?auto_59221 ) ( not ( = ?auto_59191 ?auto_59222 ) ) ( not ( = ?auto_59192 ?auto_59222 ) ) ( not ( = ?auto_59214 ?auto_59222 ) ) ( not ( = ?auto_59218 ?auto_59222 ) ) ( not ( = ?auto_59210 ?auto_59222 ) ) ( not ( = ?auto_59207 ?auto_59222 ) ) ( not ( = ?auto_59205 ?auto_59222 ) ) ( not ( = ?auto_59201 ?auto_59222 ) ) ( not ( = ?auto_59217 ?auto_59222 ) ) ( not ( = ?auto_59203 ?auto_59222 ) ) ( not ( = ?auto_59215 ?auto_59222 ) ) ( not ( = ?auto_59221 ?auto_59222 ) ) ( not ( = ?auto_59206 ?auto_59222 ) ) ( not ( = ?auto_59196 ?auto_59198 ) ) ( not ( = ?auto_59212 ?auto_59196 ) ) ( not ( = ?auto_59213 ?auto_59196 ) ) ( not ( = ?auto_59211 ?auto_59196 ) ) ( not ( = ?auto_59219 ?auto_59196 ) ) ( not ( = ?auto_59208 ?auto_59196 ) ) ( HOIST-AT ?auto_59220 ?auto_59196 ) ( not ( = ?auto_59197 ?auto_59220 ) ) ( not ( = ?auto_59193 ?auto_59220 ) ) ( not ( = ?auto_59209 ?auto_59220 ) ) ( not ( = ?auto_59202 ?auto_59220 ) ) ( not ( = ?auto_59204 ?auto_59220 ) ) ( not ( = ?auto_59216 ?auto_59220 ) ) ( AVAILABLE ?auto_59220 ) ( SURFACE-AT ?auto_59221 ?auto_59196 ) ( ON ?auto_59221 ?auto_59195 ) ( CLEAR ?auto_59221 ) ( not ( = ?auto_59191 ?auto_59195 ) ) ( not ( = ?auto_59192 ?auto_59195 ) ) ( not ( = ?auto_59214 ?auto_59195 ) ) ( not ( = ?auto_59218 ?auto_59195 ) ) ( not ( = ?auto_59210 ?auto_59195 ) ) ( not ( = ?auto_59207 ?auto_59195 ) ) ( not ( = ?auto_59205 ?auto_59195 ) ) ( not ( = ?auto_59201 ?auto_59195 ) ) ( not ( = ?auto_59217 ?auto_59195 ) ) ( not ( = ?auto_59203 ?auto_59195 ) ) ( not ( = ?auto_59215 ?auto_59195 ) ) ( not ( = ?auto_59221 ?auto_59195 ) ) ( not ( = ?auto_59206 ?auto_59195 ) ) ( not ( = ?auto_59222 ?auto_59195 ) ) ( IS-CRATE ?auto_59222 ) ( not ( = ?auto_59191 ?auto_59194 ) ) ( not ( = ?auto_59192 ?auto_59194 ) ) ( not ( = ?auto_59214 ?auto_59194 ) ) ( not ( = ?auto_59218 ?auto_59194 ) ) ( not ( = ?auto_59210 ?auto_59194 ) ) ( not ( = ?auto_59207 ?auto_59194 ) ) ( not ( = ?auto_59205 ?auto_59194 ) ) ( not ( = ?auto_59201 ?auto_59194 ) ) ( not ( = ?auto_59217 ?auto_59194 ) ) ( not ( = ?auto_59203 ?auto_59194 ) ) ( not ( = ?auto_59215 ?auto_59194 ) ) ( not ( = ?auto_59221 ?auto_59194 ) ) ( not ( = ?auto_59206 ?auto_59194 ) ) ( not ( = ?auto_59222 ?auto_59194 ) ) ( not ( = ?auto_59195 ?auto_59194 ) ) ( AVAILABLE ?auto_59193 ) ( SURFACE-AT ?auto_59222 ?auto_59212 ) ( ON ?auto_59222 ?auto_59199 ) ( CLEAR ?auto_59222 ) ( not ( = ?auto_59191 ?auto_59199 ) ) ( not ( = ?auto_59192 ?auto_59199 ) ) ( not ( = ?auto_59214 ?auto_59199 ) ) ( not ( = ?auto_59218 ?auto_59199 ) ) ( not ( = ?auto_59210 ?auto_59199 ) ) ( not ( = ?auto_59207 ?auto_59199 ) ) ( not ( = ?auto_59205 ?auto_59199 ) ) ( not ( = ?auto_59201 ?auto_59199 ) ) ( not ( = ?auto_59217 ?auto_59199 ) ) ( not ( = ?auto_59203 ?auto_59199 ) ) ( not ( = ?auto_59215 ?auto_59199 ) ) ( not ( = ?auto_59221 ?auto_59199 ) ) ( not ( = ?auto_59206 ?auto_59199 ) ) ( not ( = ?auto_59222 ?auto_59199 ) ) ( not ( = ?auto_59195 ?auto_59199 ) ) ( not ( = ?auto_59194 ?auto_59199 ) ) ( TRUCK-AT ?auto_59200 ?auto_59198 ) ( SURFACE-AT ?auto_59223 ?auto_59198 ) ( CLEAR ?auto_59223 ) ( LIFTING ?auto_59197 ?auto_59194 ) ( IS-CRATE ?auto_59194 ) ( not ( = ?auto_59191 ?auto_59223 ) ) ( not ( = ?auto_59192 ?auto_59223 ) ) ( not ( = ?auto_59214 ?auto_59223 ) ) ( not ( = ?auto_59218 ?auto_59223 ) ) ( not ( = ?auto_59210 ?auto_59223 ) ) ( not ( = ?auto_59207 ?auto_59223 ) ) ( not ( = ?auto_59205 ?auto_59223 ) ) ( not ( = ?auto_59201 ?auto_59223 ) ) ( not ( = ?auto_59217 ?auto_59223 ) ) ( not ( = ?auto_59203 ?auto_59223 ) ) ( not ( = ?auto_59215 ?auto_59223 ) ) ( not ( = ?auto_59221 ?auto_59223 ) ) ( not ( = ?auto_59206 ?auto_59223 ) ) ( not ( = ?auto_59222 ?auto_59223 ) ) ( not ( = ?auto_59195 ?auto_59223 ) ) ( not ( = ?auto_59194 ?auto_59223 ) ) ( not ( = ?auto_59199 ?auto_59223 ) ) )
    :subtasks
    ( ( !DROP ?auto_59197 ?auto_59194 ?auto_59223 ?auto_59198 )
      ( MAKE-ON ?auto_59191 ?auto_59192 )
      ( MAKE-ON-VERIFY ?auto_59191 ?auto_59192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59224 - SURFACE
      ?auto_59225 - SURFACE
    )
    :vars
    (
      ?auto_59234 - HOIST
      ?auto_59236 - PLACE
      ?auto_59227 - PLACE
      ?auto_59255 - HOIST
      ?auto_59230 - SURFACE
      ?auto_59243 - SURFACE
      ?auto_59226 - PLACE
      ?auto_59249 - HOIST
      ?auto_59229 - SURFACE
      ?auto_59252 - SURFACE
      ?auto_59228 - PLACE
      ?auto_59240 - HOIST
      ?auto_59253 - SURFACE
      ?auto_59254 - SURFACE
      ?auto_59244 - PLACE
      ?auto_59239 - HOIST
      ?auto_59250 - SURFACE
      ?auto_59237 - SURFACE
      ?auto_59231 - SURFACE
      ?auto_59246 - SURFACE
      ?auto_59232 - PLACE
      ?auto_59248 - HOIST
      ?auto_59242 - SURFACE
      ?auto_59247 - SURFACE
      ?auto_59235 - PLACE
      ?auto_59245 - HOIST
      ?auto_59241 - SURFACE
      ?auto_59238 - SURFACE
      ?auto_59233 - SURFACE
      ?auto_59251 - TRUCK
      ?auto_59256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59234 ?auto_59236 ) ( IS-CRATE ?auto_59224 ) ( not ( = ?auto_59224 ?auto_59225 ) ) ( not ( = ?auto_59227 ?auto_59236 ) ) ( HOIST-AT ?auto_59255 ?auto_59227 ) ( not ( = ?auto_59234 ?auto_59255 ) ) ( SURFACE-AT ?auto_59224 ?auto_59227 ) ( ON ?auto_59224 ?auto_59230 ) ( CLEAR ?auto_59224 ) ( not ( = ?auto_59224 ?auto_59230 ) ) ( not ( = ?auto_59225 ?auto_59230 ) ) ( IS-CRATE ?auto_59225 ) ( not ( = ?auto_59224 ?auto_59243 ) ) ( not ( = ?auto_59225 ?auto_59243 ) ) ( not ( = ?auto_59230 ?auto_59243 ) ) ( not ( = ?auto_59226 ?auto_59236 ) ) ( not ( = ?auto_59227 ?auto_59226 ) ) ( HOIST-AT ?auto_59249 ?auto_59226 ) ( not ( = ?auto_59234 ?auto_59249 ) ) ( not ( = ?auto_59255 ?auto_59249 ) ) ( SURFACE-AT ?auto_59225 ?auto_59226 ) ( ON ?auto_59225 ?auto_59229 ) ( CLEAR ?auto_59225 ) ( not ( = ?auto_59224 ?auto_59229 ) ) ( not ( = ?auto_59225 ?auto_59229 ) ) ( not ( = ?auto_59230 ?auto_59229 ) ) ( not ( = ?auto_59243 ?auto_59229 ) ) ( IS-CRATE ?auto_59243 ) ( not ( = ?auto_59224 ?auto_59252 ) ) ( not ( = ?auto_59225 ?auto_59252 ) ) ( not ( = ?auto_59230 ?auto_59252 ) ) ( not ( = ?auto_59243 ?auto_59252 ) ) ( not ( = ?auto_59229 ?auto_59252 ) ) ( not ( = ?auto_59228 ?auto_59236 ) ) ( not ( = ?auto_59227 ?auto_59228 ) ) ( not ( = ?auto_59226 ?auto_59228 ) ) ( HOIST-AT ?auto_59240 ?auto_59228 ) ( not ( = ?auto_59234 ?auto_59240 ) ) ( not ( = ?auto_59255 ?auto_59240 ) ) ( not ( = ?auto_59249 ?auto_59240 ) ) ( AVAILABLE ?auto_59240 ) ( SURFACE-AT ?auto_59243 ?auto_59228 ) ( ON ?auto_59243 ?auto_59253 ) ( CLEAR ?auto_59243 ) ( not ( = ?auto_59224 ?auto_59253 ) ) ( not ( = ?auto_59225 ?auto_59253 ) ) ( not ( = ?auto_59230 ?auto_59253 ) ) ( not ( = ?auto_59243 ?auto_59253 ) ) ( not ( = ?auto_59229 ?auto_59253 ) ) ( not ( = ?auto_59252 ?auto_59253 ) ) ( IS-CRATE ?auto_59252 ) ( not ( = ?auto_59224 ?auto_59254 ) ) ( not ( = ?auto_59225 ?auto_59254 ) ) ( not ( = ?auto_59230 ?auto_59254 ) ) ( not ( = ?auto_59243 ?auto_59254 ) ) ( not ( = ?auto_59229 ?auto_59254 ) ) ( not ( = ?auto_59252 ?auto_59254 ) ) ( not ( = ?auto_59253 ?auto_59254 ) ) ( not ( = ?auto_59244 ?auto_59236 ) ) ( not ( = ?auto_59227 ?auto_59244 ) ) ( not ( = ?auto_59226 ?auto_59244 ) ) ( not ( = ?auto_59228 ?auto_59244 ) ) ( HOIST-AT ?auto_59239 ?auto_59244 ) ( not ( = ?auto_59234 ?auto_59239 ) ) ( not ( = ?auto_59255 ?auto_59239 ) ) ( not ( = ?auto_59249 ?auto_59239 ) ) ( not ( = ?auto_59240 ?auto_59239 ) ) ( AVAILABLE ?auto_59239 ) ( SURFACE-AT ?auto_59252 ?auto_59244 ) ( ON ?auto_59252 ?auto_59250 ) ( CLEAR ?auto_59252 ) ( not ( = ?auto_59224 ?auto_59250 ) ) ( not ( = ?auto_59225 ?auto_59250 ) ) ( not ( = ?auto_59230 ?auto_59250 ) ) ( not ( = ?auto_59243 ?auto_59250 ) ) ( not ( = ?auto_59229 ?auto_59250 ) ) ( not ( = ?auto_59252 ?auto_59250 ) ) ( not ( = ?auto_59253 ?auto_59250 ) ) ( not ( = ?auto_59254 ?auto_59250 ) ) ( IS-CRATE ?auto_59254 ) ( not ( = ?auto_59224 ?auto_59237 ) ) ( not ( = ?auto_59225 ?auto_59237 ) ) ( not ( = ?auto_59230 ?auto_59237 ) ) ( not ( = ?auto_59243 ?auto_59237 ) ) ( not ( = ?auto_59229 ?auto_59237 ) ) ( not ( = ?auto_59252 ?auto_59237 ) ) ( not ( = ?auto_59253 ?auto_59237 ) ) ( not ( = ?auto_59254 ?auto_59237 ) ) ( not ( = ?auto_59250 ?auto_59237 ) ) ( AVAILABLE ?auto_59249 ) ( SURFACE-AT ?auto_59254 ?auto_59226 ) ( ON ?auto_59254 ?auto_59231 ) ( CLEAR ?auto_59254 ) ( not ( = ?auto_59224 ?auto_59231 ) ) ( not ( = ?auto_59225 ?auto_59231 ) ) ( not ( = ?auto_59230 ?auto_59231 ) ) ( not ( = ?auto_59243 ?auto_59231 ) ) ( not ( = ?auto_59229 ?auto_59231 ) ) ( not ( = ?auto_59252 ?auto_59231 ) ) ( not ( = ?auto_59253 ?auto_59231 ) ) ( not ( = ?auto_59254 ?auto_59231 ) ) ( not ( = ?auto_59250 ?auto_59231 ) ) ( not ( = ?auto_59237 ?auto_59231 ) ) ( IS-CRATE ?auto_59237 ) ( not ( = ?auto_59224 ?auto_59246 ) ) ( not ( = ?auto_59225 ?auto_59246 ) ) ( not ( = ?auto_59230 ?auto_59246 ) ) ( not ( = ?auto_59243 ?auto_59246 ) ) ( not ( = ?auto_59229 ?auto_59246 ) ) ( not ( = ?auto_59252 ?auto_59246 ) ) ( not ( = ?auto_59253 ?auto_59246 ) ) ( not ( = ?auto_59254 ?auto_59246 ) ) ( not ( = ?auto_59250 ?auto_59246 ) ) ( not ( = ?auto_59237 ?auto_59246 ) ) ( not ( = ?auto_59231 ?auto_59246 ) ) ( not ( = ?auto_59232 ?auto_59236 ) ) ( not ( = ?auto_59227 ?auto_59232 ) ) ( not ( = ?auto_59226 ?auto_59232 ) ) ( not ( = ?auto_59228 ?auto_59232 ) ) ( not ( = ?auto_59244 ?auto_59232 ) ) ( HOIST-AT ?auto_59248 ?auto_59232 ) ( not ( = ?auto_59234 ?auto_59248 ) ) ( not ( = ?auto_59255 ?auto_59248 ) ) ( not ( = ?auto_59249 ?auto_59248 ) ) ( not ( = ?auto_59240 ?auto_59248 ) ) ( not ( = ?auto_59239 ?auto_59248 ) ) ( AVAILABLE ?auto_59248 ) ( SURFACE-AT ?auto_59237 ?auto_59232 ) ( ON ?auto_59237 ?auto_59242 ) ( CLEAR ?auto_59237 ) ( not ( = ?auto_59224 ?auto_59242 ) ) ( not ( = ?auto_59225 ?auto_59242 ) ) ( not ( = ?auto_59230 ?auto_59242 ) ) ( not ( = ?auto_59243 ?auto_59242 ) ) ( not ( = ?auto_59229 ?auto_59242 ) ) ( not ( = ?auto_59252 ?auto_59242 ) ) ( not ( = ?auto_59253 ?auto_59242 ) ) ( not ( = ?auto_59254 ?auto_59242 ) ) ( not ( = ?auto_59250 ?auto_59242 ) ) ( not ( = ?auto_59237 ?auto_59242 ) ) ( not ( = ?auto_59231 ?auto_59242 ) ) ( not ( = ?auto_59246 ?auto_59242 ) ) ( IS-CRATE ?auto_59246 ) ( not ( = ?auto_59224 ?auto_59247 ) ) ( not ( = ?auto_59225 ?auto_59247 ) ) ( not ( = ?auto_59230 ?auto_59247 ) ) ( not ( = ?auto_59243 ?auto_59247 ) ) ( not ( = ?auto_59229 ?auto_59247 ) ) ( not ( = ?auto_59252 ?auto_59247 ) ) ( not ( = ?auto_59253 ?auto_59247 ) ) ( not ( = ?auto_59254 ?auto_59247 ) ) ( not ( = ?auto_59250 ?auto_59247 ) ) ( not ( = ?auto_59237 ?auto_59247 ) ) ( not ( = ?auto_59231 ?auto_59247 ) ) ( not ( = ?auto_59246 ?auto_59247 ) ) ( not ( = ?auto_59242 ?auto_59247 ) ) ( not ( = ?auto_59235 ?auto_59236 ) ) ( not ( = ?auto_59227 ?auto_59235 ) ) ( not ( = ?auto_59226 ?auto_59235 ) ) ( not ( = ?auto_59228 ?auto_59235 ) ) ( not ( = ?auto_59244 ?auto_59235 ) ) ( not ( = ?auto_59232 ?auto_59235 ) ) ( HOIST-AT ?auto_59245 ?auto_59235 ) ( not ( = ?auto_59234 ?auto_59245 ) ) ( not ( = ?auto_59255 ?auto_59245 ) ) ( not ( = ?auto_59249 ?auto_59245 ) ) ( not ( = ?auto_59240 ?auto_59245 ) ) ( not ( = ?auto_59239 ?auto_59245 ) ) ( not ( = ?auto_59248 ?auto_59245 ) ) ( AVAILABLE ?auto_59245 ) ( SURFACE-AT ?auto_59246 ?auto_59235 ) ( ON ?auto_59246 ?auto_59241 ) ( CLEAR ?auto_59246 ) ( not ( = ?auto_59224 ?auto_59241 ) ) ( not ( = ?auto_59225 ?auto_59241 ) ) ( not ( = ?auto_59230 ?auto_59241 ) ) ( not ( = ?auto_59243 ?auto_59241 ) ) ( not ( = ?auto_59229 ?auto_59241 ) ) ( not ( = ?auto_59252 ?auto_59241 ) ) ( not ( = ?auto_59253 ?auto_59241 ) ) ( not ( = ?auto_59254 ?auto_59241 ) ) ( not ( = ?auto_59250 ?auto_59241 ) ) ( not ( = ?auto_59237 ?auto_59241 ) ) ( not ( = ?auto_59231 ?auto_59241 ) ) ( not ( = ?auto_59246 ?auto_59241 ) ) ( not ( = ?auto_59242 ?auto_59241 ) ) ( not ( = ?auto_59247 ?auto_59241 ) ) ( IS-CRATE ?auto_59247 ) ( not ( = ?auto_59224 ?auto_59238 ) ) ( not ( = ?auto_59225 ?auto_59238 ) ) ( not ( = ?auto_59230 ?auto_59238 ) ) ( not ( = ?auto_59243 ?auto_59238 ) ) ( not ( = ?auto_59229 ?auto_59238 ) ) ( not ( = ?auto_59252 ?auto_59238 ) ) ( not ( = ?auto_59253 ?auto_59238 ) ) ( not ( = ?auto_59254 ?auto_59238 ) ) ( not ( = ?auto_59250 ?auto_59238 ) ) ( not ( = ?auto_59237 ?auto_59238 ) ) ( not ( = ?auto_59231 ?auto_59238 ) ) ( not ( = ?auto_59246 ?auto_59238 ) ) ( not ( = ?auto_59242 ?auto_59238 ) ) ( not ( = ?auto_59247 ?auto_59238 ) ) ( not ( = ?auto_59241 ?auto_59238 ) ) ( AVAILABLE ?auto_59255 ) ( SURFACE-AT ?auto_59247 ?auto_59227 ) ( ON ?auto_59247 ?auto_59233 ) ( CLEAR ?auto_59247 ) ( not ( = ?auto_59224 ?auto_59233 ) ) ( not ( = ?auto_59225 ?auto_59233 ) ) ( not ( = ?auto_59230 ?auto_59233 ) ) ( not ( = ?auto_59243 ?auto_59233 ) ) ( not ( = ?auto_59229 ?auto_59233 ) ) ( not ( = ?auto_59252 ?auto_59233 ) ) ( not ( = ?auto_59253 ?auto_59233 ) ) ( not ( = ?auto_59254 ?auto_59233 ) ) ( not ( = ?auto_59250 ?auto_59233 ) ) ( not ( = ?auto_59237 ?auto_59233 ) ) ( not ( = ?auto_59231 ?auto_59233 ) ) ( not ( = ?auto_59246 ?auto_59233 ) ) ( not ( = ?auto_59242 ?auto_59233 ) ) ( not ( = ?auto_59247 ?auto_59233 ) ) ( not ( = ?auto_59241 ?auto_59233 ) ) ( not ( = ?auto_59238 ?auto_59233 ) ) ( TRUCK-AT ?auto_59251 ?auto_59236 ) ( SURFACE-AT ?auto_59256 ?auto_59236 ) ( CLEAR ?auto_59256 ) ( IS-CRATE ?auto_59238 ) ( not ( = ?auto_59224 ?auto_59256 ) ) ( not ( = ?auto_59225 ?auto_59256 ) ) ( not ( = ?auto_59230 ?auto_59256 ) ) ( not ( = ?auto_59243 ?auto_59256 ) ) ( not ( = ?auto_59229 ?auto_59256 ) ) ( not ( = ?auto_59252 ?auto_59256 ) ) ( not ( = ?auto_59253 ?auto_59256 ) ) ( not ( = ?auto_59254 ?auto_59256 ) ) ( not ( = ?auto_59250 ?auto_59256 ) ) ( not ( = ?auto_59237 ?auto_59256 ) ) ( not ( = ?auto_59231 ?auto_59256 ) ) ( not ( = ?auto_59246 ?auto_59256 ) ) ( not ( = ?auto_59242 ?auto_59256 ) ) ( not ( = ?auto_59247 ?auto_59256 ) ) ( not ( = ?auto_59241 ?auto_59256 ) ) ( not ( = ?auto_59238 ?auto_59256 ) ) ( not ( = ?auto_59233 ?auto_59256 ) ) ( AVAILABLE ?auto_59234 ) ( IN ?auto_59238 ?auto_59251 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59234 ?auto_59238 ?auto_59251 ?auto_59236 )
      ( MAKE-ON ?auto_59224 ?auto_59225 )
      ( MAKE-ON-VERIFY ?auto_59224 ?auto_59225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59257 - SURFACE
      ?auto_59258 - SURFACE
    )
    :vars
    (
      ?auto_59288 - HOIST
      ?auto_59270 - PLACE
      ?auto_59260 - PLACE
      ?auto_59276 - HOIST
      ?auto_59269 - SURFACE
      ?auto_59280 - SURFACE
      ?auto_59271 - PLACE
      ?auto_59278 - HOIST
      ?auto_59263 - SURFACE
      ?auto_59273 - SURFACE
      ?auto_59264 - PLACE
      ?auto_59272 - HOIST
      ?auto_59274 - SURFACE
      ?auto_59275 - SURFACE
      ?auto_59281 - PLACE
      ?auto_59289 - HOIST
      ?auto_59267 - SURFACE
      ?auto_59266 - SURFACE
      ?auto_59261 - SURFACE
      ?auto_59283 - SURFACE
      ?auto_59259 - PLACE
      ?auto_59285 - HOIST
      ?auto_59279 - SURFACE
      ?auto_59284 - SURFACE
      ?auto_59268 - PLACE
      ?auto_59282 - HOIST
      ?auto_59286 - SURFACE
      ?auto_59262 - SURFACE
      ?auto_59287 - SURFACE
      ?auto_59277 - SURFACE
      ?auto_59265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59288 ?auto_59270 ) ( IS-CRATE ?auto_59257 ) ( not ( = ?auto_59257 ?auto_59258 ) ) ( not ( = ?auto_59260 ?auto_59270 ) ) ( HOIST-AT ?auto_59276 ?auto_59260 ) ( not ( = ?auto_59288 ?auto_59276 ) ) ( SURFACE-AT ?auto_59257 ?auto_59260 ) ( ON ?auto_59257 ?auto_59269 ) ( CLEAR ?auto_59257 ) ( not ( = ?auto_59257 ?auto_59269 ) ) ( not ( = ?auto_59258 ?auto_59269 ) ) ( IS-CRATE ?auto_59258 ) ( not ( = ?auto_59257 ?auto_59280 ) ) ( not ( = ?auto_59258 ?auto_59280 ) ) ( not ( = ?auto_59269 ?auto_59280 ) ) ( not ( = ?auto_59271 ?auto_59270 ) ) ( not ( = ?auto_59260 ?auto_59271 ) ) ( HOIST-AT ?auto_59278 ?auto_59271 ) ( not ( = ?auto_59288 ?auto_59278 ) ) ( not ( = ?auto_59276 ?auto_59278 ) ) ( SURFACE-AT ?auto_59258 ?auto_59271 ) ( ON ?auto_59258 ?auto_59263 ) ( CLEAR ?auto_59258 ) ( not ( = ?auto_59257 ?auto_59263 ) ) ( not ( = ?auto_59258 ?auto_59263 ) ) ( not ( = ?auto_59269 ?auto_59263 ) ) ( not ( = ?auto_59280 ?auto_59263 ) ) ( IS-CRATE ?auto_59280 ) ( not ( = ?auto_59257 ?auto_59273 ) ) ( not ( = ?auto_59258 ?auto_59273 ) ) ( not ( = ?auto_59269 ?auto_59273 ) ) ( not ( = ?auto_59280 ?auto_59273 ) ) ( not ( = ?auto_59263 ?auto_59273 ) ) ( not ( = ?auto_59264 ?auto_59270 ) ) ( not ( = ?auto_59260 ?auto_59264 ) ) ( not ( = ?auto_59271 ?auto_59264 ) ) ( HOIST-AT ?auto_59272 ?auto_59264 ) ( not ( = ?auto_59288 ?auto_59272 ) ) ( not ( = ?auto_59276 ?auto_59272 ) ) ( not ( = ?auto_59278 ?auto_59272 ) ) ( AVAILABLE ?auto_59272 ) ( SURFACE-AT ?auto_59280 ?auto_59264 ) ( ON ?auto_59280 ?auto_59274 ) ( CLEAR ?auto_59280 ) ( not ( = ?auto_59257 ?auto_59274 ) ) ( not ( = ?auto_59258 ?auto_59274 ) ) ( not ( = ?auto_59269 ?auto_59274 ) ) ( not ( = ?auto_59280 ?auto_59274 ) ) ( not ( = ?auto_59263 ?auto_59274 ) ) ( not ( = ?auto_59273 ?auto_59274 ) ) ( IS-CRATE ?auto_59273 ) ( not ( = ?auto_59257 ?auto_59275 ) ) ( not ( = ?auto_59258 ?auto_59275 ) ) ( not ( = ?auto_59269 ?auto_59275 ) ) ( not ( = ?auto_59280 ?auto_59275 ) ) ( not ( = ?auto_59263 ?auto_59275 ) ) ( not ( = ?auto_59273 ?auto_59275 ) ) ( not ( = ?auto_59274 ?auto_59275 ) ) ( not ( = ?auto_59281 ?auto_59270 ) ) ( not ( = ?auto_59260 ?auto_59281 ) ) ( not ( = ?auto_59271 ?auto_59281 ) ) ( not ( = ?auto_59264 ?auto_59281 ) ) ( HOIST-AT ?auto_59289 ?auto_59281 ) ( not ( = ?auto_59288 ?auto_59289 ) ) ( not ( = ?auto_59276 ?auto_59289 ) ) ( not ( = ?auto_59278 ?auto_59289 ) ) ( not ( = ?auto_59272 ?auto_59289 ) ) ( AVAILABLE ?auto_59289 ) ( SURFACE-AT ?auto_59273 ?auto_59281 ) ( ON ?auto_59273 ?auto_59267 ) ( CLEAR ?auto_59273 ) ( not ( = ?auto_59257 ?auto_59267 ) ) ( not ( = ?auto_59258 ?auto_59267 ) ) ( not ( = ?auto_59269 ?auto_59267 ) ) ( not ( = ?auto_59280 ?auto_59267 ) ) ( not ( = ?auto_59263 ?auto_59267 ) ) ( not ( = ?auto_59273 ?auto_59267 ) ) ( not ( = ?auto_59274 ?auto_59267 ) ) ( not ( = ?auto_59275 ?auto_59267 ) ) ( IS-CRATE ?auto_59275 ) ( not ( = ?auto_59257 ?auto_59266 ) ) ( not ( = ?auto_59258 ?auto_59266 ) ) ( not ( = ?auto_59269 ?auto_59266 ) ) ( not ( = ?auto_59280 ?auto_59266 ) ) ( not ( = ?auto_59263 ?auto_59266 ) ) ( not ( = ?auto_59273 ?auto_59266 ) ) ( not ( = ?auto_59274 ?auto_59266 ) ) ( not ( = ?auto_59275 ?auto_59266 ) ) ( not ( = ?auto_59267 ?auto_59266 ) ) ( AVAILABLE ?auto_59278 ) ( SURFACE-AT ?auto_59275 ?auto_59271 ) ( ON ?auto_59275 ?auto_59261 ) ( CLEAR ?auto_59275 ) ( not ( = ?auto_59257 ?auto_59261 ) ) ( not ( = ?auto_59258 ?auto_59261 ) ) ( not ( = ?auto_59269 ?auto_59261 ) ) ( not ( = ?auto_59280 ?auto_59261 ) ) ( not ( = ?auto_59263 ?auto_59261 ) ) ( not ( = ?auto_59273 ?auto_59261 ) ) ( not ( = ?auto_59274 ?auto_59261 ) ) ( not ( = ?auto_59275 ?auto_59261 ) ) ( not ( = ?auto_59267 ?auto_59261 ) ) ( not ( = ?auto_59266 ?auto_59261 ) ) ( IS-CRATE ?auto_59266 ) ( not ( = ?auto_59257 ?auto_59283 ) ) ( not ( = ?auto_59258 ?auto_59283 ) ) ( not ( = ?auto_59269 ?auto_59283 ) ) ( not ( = ?auto_59280 ?auto_59283 ) ) ( not ( = ?auto_59263 ?auto_59283 ) ) ( not ( = ?auto_59273 ?auto_59283 ) ) ( not ( = ?auto_59274 ?auto_59283 ) ) ( not ( = ?auto_59275 ?auto_59283 ) ) ( not ( = ?auto_59267 ?auto_59283 ) ) ( not ( = ?auto_59266 ?auto_59283 ) ) ( not ( = ?auto_59261 ?auto_59283 ) ) ( not ( = ?auto_59259 ?auto_59270 ) ) ( not ( = ?auto_59260 ?auto_59259 ) ) ( not ( = ?auto_59271 ?auto_59259 ) ) ( not ( = ?auto_59264 ?auto_59259 ) ) ( not ( = ?auto_59281 ?auto_59259 ) ) ( HOIST-AT ?auto_59285 ?auto_59259 ) ( not ( = ?auto_59288 ?auto_59285 ) ) ( not ( = ?auto_59276 ?auto_59285 ) ) ( not ( = ?auto_59278 ?auto_59285 ) ) ( not ( = ?auto_59272 ?auto_59285 ) ) ( not ( = ?auto_59289 ?auto_59285 ) ) ( AVAILABLE ?auto_59285 ) ( SURFACE-AT ?auto_59266 ?auto_59259 ) ( ON ?auto_59266 ?auto_59279 ) ( CLEAR ?auto_59266 ) ( not ( = ?auto_59257 ?auto_59279 ) ) ( not ( = ?auto_59258 ?auto_59279 ) ) ( not ( = ?auto_59269 ?auto_59279 ) ) ( not ( = ?auto_59280 ?auto_59279 ) ) ( not ( = ?auto_59263 ?auto_59279 ) ) ( not ( = ?auto_59273 ?auto_59279 ) ) ( not ( = ?auto_59274 ?auto_59279 ) ) ( not ( = ?auto_59275 ?auto_59279 ) ) ( not ( = ?auto_59267 ?auto_59279 ) ) ( not ( = ?auto_59266 ?auto_59279 ) ) ( not ( = ?auto_59261 ?auto_59279 ) ) ( not ( = ?auto_59283 ?auto_59279 ) ) ( IS-CRATE ?auto_59283 ) ( not ( = ?auto_59257 ?auto_59284 ) ) ( not ( = ?auto_59258 ?auto_59284 ) ) ( not ( = ?auto_59269 ?auto_59284 ) ) ( not ( = ?auto_59280 ?auto_59284 ) ) ( not ( = ?auto_59263 ?auto_59284 ) ) ( not ( = ?auto_59273 ?auto_59284 ) ) ( not ( = ?auto_59274 ?auto_59284 ) ) ( not ( = ?auto_59275 ?auto_59284 ) ) ( not ( = ?auto_59267 ?auto_59284 ) ) ( not ( = ?auto_59266 ?auto_59284 ) ) ( not ( = ?auto_59261 ?auto_59284 ) ) ( not ( = ?auto_59283 ?auto_59284 ) ) ( not ( = ?auto_59279 ?auto_59284 ) ) ( not ( = ?auto_59268 ?auto_59270 ) ) ( not ( = ?auto_59260 ?auto_59268 ) ) ( not ( = ?auto_59271 ?auto_59268 ) ) ( not ( = ?auto_59264 ?auto_59268 ) ) ( not ( = ?auto_59281 ?auto_59268 ) ) ( not ( = ?auto_59259 ?auto_59268 ) ) ( HOIST-AT ?auto_59282 ?auto_59268 ) ( not ( = ?auto_59288 ?auto_59282 ) ) ( not ( = ?auto_59276 ?auto_59282 ) ) ( not ( = ?auto_59278 ?auto_59282 ) ) ( not ( = ?auto_59272 ?auto_59282 ) ) ( not ( = ?auto_59289 ?auto_59282 ) ) ( not ( = ?auto_59285 ?auto_59282 ) ) ( AVAILABLE ?auto_59282 ) ( SURFACE-AT ?auto_59283 ?auto_59268 ) ( ON ?auto_59283 ?auto_59286 ) ( CLEAR ?auto_59283 ) ( not ( = ?auto_59257 ?auto_59286 ) ) ( not ( = ?auto_59258 ?auto_59286 ) ) ( not ( = ?auto_59269 ?auto_59286 ) ) ( not ( = ?auto_59280 ?auto_59286 ) ) ( not ( = ?auto_59263 ?auto_59286 ) ) ( not ( = ?auto_59273 ?auto_59286 ) ) ( not ( = ?auto_59274 ?auto_59286 ) ) ( not ( = ?auto_59275 ?auto_59286 ) ) ( not ( = ?auto_59267 ?auto_59286 ) ) ( not ( = ?auto_59266 ?auto_59286 ) ) ( not ( = ?auto_59261 ?auto_59286 ) ) ( not ( = ?auto_59283 ?auto_59286 ) ) ( not ( = ?auto_59279 ?auto_59286 ) ) ( not ( = ?auto_59284 ?auto_59286 ) ) ( IS-CRATE ?auto_59284 ) ( not ( = ?auto_59257 ?auto_59262 ) ) ( not ( = ?auto_59258 ?auto_59262 ) ) ( not ( = ?auto_59269 ?auto_59262 ) ) ( not ( = ?auto_59280 ?auto_59262 ) ) ( not ( = ?auto_59263 ?auto_59262 ) ) ( not ( = ?auto_59273 ?auto_59262 ) ) ( not ( = ?auto_59274 ?auto_59262 ) ) ( not ( = ?auto_59275 ?auto_59262 ) ) ( not ( = ?auto_59267 ?auto_59262 ) ) ( not ( = ?auto_59266 ?auto_59262 ) ) ( not ( = ?auto_59261 ?auto_59262 ) ) ( not ( = ?auto_59283 ?auto_59262 ) ) ( not ( = ?auto_59279 ?auto_59262 ) ) ( not ( = ?auto_59284 ?auto_59262 ) ) ( not ( = ?auto_59286 ?auto_59262 ) ) ( AVAILABLE ?auto_59276 ) ( SURFACE-AT ?auto_59284 ?auto_59260 ) ( ON ?auto_59284 ?auto_59287 ) ( CLEAR ?auto_59284 ) ( not ( = ?auto_59257 ?auto_59287 ) ) ( not ( = ?auto_59258 ?auto_59287 ) ) ( not ( = ?auto_59269 ?auto_59287 ) ) ( not ( = ?auto_59280 ?auto_59287 ) ) ( not ( = ?auto_59263 ?auto_59287 ) ) ( not ( = ?auto_59273 ?auto_59287 ) ) ( not ( = ?auto_59274 ?auto_59287 ) ) ( not ( = ?auto_59275 ?auto_59287 ) ) ( not ( = ?auto_59267 ?auto_59287 ) ) ( not ( = ?auto_59266 ?auto_59287 ) ) ( not ( = ?auto_59261 ?auto_59287 ) ) ( not ( = ?auto_59283 ?auto_59287 ) ) ( not ( = ?auto_59279 ?auto_59287 ) ) ( not ( = ?auto_59284 ?auto_59287 ) ) ( not ( = ?auto_59286 ?auto_59287 ) ) ( not ( = ?auto_59262 ?auto_59287 ) ) ( SURFACE-AT ?auto_59277 ?auto_59270 ) ( CLEAR ?auto_59277 ) ( IS-CRATE ?auto_59262 ) ( not ( = ?auto_59257 ?auto_59277 ) ) ( not ( = ?auto_59258 ?auto_59277 ) ) ( not ( = ?auto_59269 ?auto_59277 ) ) ( not ( = ?auto_59280 ?auto_59277 ) ) ( not ( = ?auto_59263 ?auto_59277 ) ) ( not ( = ?auto_59273 ?auto_59277 ) ) ( not ( = ?auto_59274 ?auto_59277 ) ) ( not ( = ?auto_59275 ?auto_59277 ) ) ( not ( = ?auto_59267 ?auto_59277 ) ) ( not ( = ?auto_59266 ?auto_59277 ) ) ( not ( = ?auto_59261 ?auto_59277 ) ) ( not ( = ?auto_59283 ?auto_59277 ) ) ( not ( = ?auto_59279 ?auto_59277 ) ) ( not ( = ?auto_59284 ?auto_59277 ) ) ( not ( = ?auto_59286 ?auto_59277 ) ) ( not ( = ?auto_59262 ?auto_59277 ) ) ( not ( = ?auto_59287 ?auto_59277 ) ) ( AVAILABLE ?auto_59288 ) ( IN ?auto_59262 ?auto_59265 ) ( TRUCK-AT ?auto_59265 ?auto_59260 ) )
    :subtasks
    ( ( !DRIVE ?auto_59265 ?auto_59260 ?auto_59270 )
      ( MAKE-ON ?auto_59257 ?auto_59258 )
      ( MAKE-ON-VERIFY ?auto_59257 ?auto_59258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59290 - SURFACE
      ?auto_59291 - SURFACE
    )
    :vars
    (
      ?auto_59303 - HOIST
      ?auto_59300 - PLACE
      ?auto_59299 - PLACE
      ?auto_59294 - HOIST
      ?auto_59314 - SURFACE
      ?auto_59309 - SURFACE
      ?auto_59316 - PLACE
      ?auto_59305 - HOIST
      ?auto_59307 - SURFACE
      ?auto_59321 - SURFACE
      ?auto_59315 - PLACE
      ?auto_59308 - HOIST
      ?auto_59311 - SURFACE
      ?auto_59298 - SURFACE
      ?auto_59310 - PLACE
      ?auto_59304 - HOIST
      ?auto_59318 - SURFACE
      ?auto_59313 - SURFACE
      ?auto_59320 - SURFACE
      ?auto_59295 - SURFACE
      ?auto_59312 - PLACE
      ?auto_59297 - HOIST
      ?auto_59306 - SURFACE
      ?auto_59292 - SURFACE
      ?auto_59317 - PLACE
      ?auto_59296 - HOIST
      ?auto_59301 - SURFACE
      ?auto_59319 - SURFACE
      ?auto_59302 - SURFACE
      ?auto_59293 - SURFACE
      ?auto_59322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59303 ?auto_59300 ) ( IS-CRATE ?auto_59290 ) ( not ( = ?auto_59290 ?auto_59291 ) ) ( not ( = ?auto_59299 ?auto_59300 ) ) ( HOIST-AT ?auto_59294 ?auto_59299 ) ( not ( = ?auto_59303 ?auto_59294 ) ) ( SURFACE-AT ?auto_59290 ?auto_59299 ) ( ON ?auto_59290 ?auto_59314 ) ( CLEAR ?auto_59290 ) ( not ( = ?auto_59290 ?auto_59314 ) ) ( not ( = ?auto_59291 ?auto_59314 ) ) ( IS-CRATE ?auto_59291 ) ( not ( = ?auto_59290 ?auto_59309 ) ) ( not ( = ?auto_59291 ?auto_59309 ) ) ( not ( = ?auto_59314 ?auto_59309 ) ) ( not ( = ?auto_59316 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59316 ) ) ( HOIST-AT ?auto_59305 ?auto_59316 ) ( not ( = ?auto_59303 ?auto_59305 ) ) ( not ( = ?auto_59294 ?auto_59305 ) ) ( SURFACE-AT ?auto_59291 ?auto_59316 ) ( ON ?auto_59291 ?auto_59307 ) ( CLEAR ?auto_59291 ) ( not ( = ?auto_59290 ?auto_59307 ) ) ( not ( = ?auto_59291 ?auto_59307 ) ) ( not ( = ?auto_59314 ?auto_59307 ) ) ( not ( = ?auto_59309 ?auto_59307 ) ) ( IS-CRATE ?auto_59309 ) ( not ( = ?auto_59290 ?auto_59321 ) ) ( not ( = ?auto_59291 ?auto_59321 ) ) ( not ( = ?auto_59314 ?auto_59321 ) ) ( not ( = ?auto_59309 ?auto_59321 ) ) ( not ( = ?auto_59307 ?auto_59321 ) ) ( not ( = ?auto_59315 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59315 ) ) ( not ( = ?auto_59316 ?auto_59315 ) ) ( HOIST-AT ?auto_59308 ?auto_59315 ) ( not ( = ?auto_59303 ?auto_59308 ) ) ( not ( = ?auto_59294 ?auto_59308 ) ) ( not ( = ?auto_59305 ?auto_59308 ) ) ( AVAILABLE ?auto_59308 ) ( SURFACE-AT ?auto_59309 ?auto_59315 ) ( ON ?auto_59309 ?auto_59311 ) ( CLEAR ?auto_59309 ) ( not ( = ?auto_59290 ?auto_59311 ) ) ( not ( = ?auto_59291 ?auto_59311 ) ) ( not ( = ?auto_59314 ?auto_59311 ) ) ( not ( = ?auto_59309 ?auto_59311 ) ) ( not ( = ?auto_59307 ?auto_59311 ) ) ( not ( = ?auto_59321 ?auto_59311 ) ) ( IS-CRATE ?auto_59321 ) ( not ( = ?auto_59290 ?auto_59298 ) ) ( not ( = ?auto_59291 ?auto_59298 ) ) ( not ( = ?auto_59314 ?auto_59298 ) ) ( not ( = ?auto_59309 ?auto_59298 ) ) ( not ( = ?auto_59307 ?auto_59298 ) ) ( not ( = ?auto_59321 ?auto_59298 ) ) ( not ( = ?auto_59311 ?auto_59298 ) ) ( not ( = ?auto_59310 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59310 ) ) ( not ( = ?auto_59316 ?auto_59310 ) ) ( not ( = ?auto_59315 ?auto_59310 ) ) ( HOIST-AT ?auto_59304 ?auto_59310 ) ( not ( = ?auto_59303 ?auto_59304 ) ) ( not ( = ?auto_59294 ?auto_59304 ) ) ( not ( = ?auto_59305 ?auto_59304 ) ) ( not ( = ?auto_59308 ?auto_59304 ) ) ( AVAILABLE ?auto_59304 ) ( SURFACE-AT ?auto_59321 ?auto_59310 ) ( ON ?auto_59321 ?auto_59318 ) ( CLEAR ?auto_59321 ) ( not ( = ?auto_59290 ?auto_59318 ) ) ( not ( = ?auto_59291 ?auto_59318 ) ) ( not ( = ?auto_59314 ?auto_59318 ) ) ( not ( = ?auto_59309 ?auto_59318 ) ) ( not ( = ?auto_59307 ?auto_59318 ) ) ( not ( = ?auto_59321 ?auto_59318 ) ) ( not ( = ?auto_59311 ?auto_59318 ) ) ( not ( = ?auto_59298 ?auto_59318 ) ) ( IS-CRATE ?auto_59298 ) ( not ( = ?auto_59290 ?auto_59313 ) ) ( not ( = ?auto_59291 ?auto_59313 ) ) ( not ( = ?auto_59314 ?auto_59313 ) ) ( not ( = ?auto_59309 ?auto_59313 ) ) ( not ( = ?auto_59307 ?auto_59313 ) ) ( not ( = ?auto_59321 ?auto_59313 ) ) ( not ( = ?auto_59311 ?auto_59313 ) ) ( not ( = ?auto_59298 ?auto_59313 ) ) ( not ( = ?auto_59318 ?auto_59313 ) ) ( AVAILABLE ?auto_59305 ) ( SURFACE-AT ?auto_59298 ?auto_59316 ) ( ON ?auto_59298 ?auto_59320 ) ( CLEAR ?auto_59298 ) ( not ( = ?auto_59290 ?auto_59320 ) ) ( not ( = ?auto_59291 ?auto_59320 ) ) ( not ( = ?auto_59314 ?auto_59320 ) ) ( not ( = ?auto_59309 ?auto_59320 ) ) ( not ( = ?auto_59307 ?auto_59320 ) ) ( not ( = ?auto_59321 ?auto_59320 ) ) ( not ( = ?auto_59311 ?auto_59320 ) ) ( not ( = ?auto_59298 ?auto_59320 ) ) ( not ( = ?auto_59318 ?auto_59320 ) ) ( not ( = ?auto_59313 ?auto_59320 ) ) ( IS-CRATE ?auto_59313 ) ( not ( = ?auto_59290 ?auto_59295 ) ) ( not ( = ?auto_59291 ?auto_59295 ) ) ( not ( = ?auto_59314 ?auto_59295 ) ) ( not ( = ?auto_59309 ?auto_59295 ) ) ( not ( = ?auto_59307 ?auto_59295 ) ) ( not ( = ?auto_59321 ?auto_59295 ) ) ( not ( = ?auto_59311 ?auto_59295 ) ) ( not ( = ?auto_59298 ?auto_59295 ) ) ( not ( = ?auto_59318 ?auto_59295 ) ) ( not ( = ?auto_59313 ?auto_59295 ) ) ( not ( = ?auto_59320 ?auto_59295 ) ) ( not ( = ?auto_59312 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59312 ) ) ( not ( = ?auto_59316 ?auto_59312 ) ) ( not ( = ?auto_59315 ?auto_59312 ) ) ( not ( = ?auto_59310 ?auto_59312 ) ) ( HOIST-AT ?auto_59297 ?auto_59312 ) ( not ( = ?auto_59303 ?auto_59297 ) ) ( not ( = ?auto_59294 ?auto_59297 ) ) ( not ( = ?auto_59305 ?auto_59297 ) ) ( not ( = ?auto_59308 ?auto_59297 ) ) ( not ( = ?auto_59304 ?auto_59297 ) ) ( AVAILABLE ?auto_59297 ) ( SURFACE-AT ?auto_59313 ?auto_59312 ) ( ON ?auto_59313 ?auto_59306 ) ( CLEAR ?auto_59313 ) ( not ( = ?auto_59290 ?auto_59306 ) ) ( not ( = ?auto_59291 ?auto_59306 ) ) ( not ( = ?auto_59314 ?auto_59306 ) ) ( not ( = ?auto_59309 ?auto_59306 ) ) ( not ( = ?auto_59307 ?auto_59306 ) ) ( not ( = ?auto_59321 ?auto_59306 ) ) ( not ( = ?auto_59311 ?auto_59306 ) ) ( not ( = ?auto_59298 ?auto_59306 ) ) ( not ( = ?auto_59318 ?auto_59306 ) ) ( not ( = ?auto_59313 ?auto_59306 ) ) ( not ( = ?auto_59320 ?auto_59306 ) ) ( not ( = ?auto_59295 ?auto_59306 ) ) ( IS-CRATE ?auto_59295 ) ( not ( = ?auto_59290 ?auto_59292 ) ) ( not ( = ?auto_59291 ?auto_59292 ) ) ( not ( = ?auto_59314 ?auto_59292 ) ) ( not ( = ?auto_59309 ?auto_59292 ) ) ( not ( = ?auto_59307 ?auto_59292 ) ) ( not ( = ?auto_59321 ?auto_59292 ) ) ( not ( = ?auto_59311 ?auto_59292 ) ) ( not ( = ?auto_59298 ?auto_59292 ) ) ( not ( = ?auto_59318 ?auto_59292 ) ) ( not ( = ?auto_59313 ?auto_59292 ) ) ( not ( = ?auto_59320 ?auto_59292 ) ) ( not ( = ?auto_59295 ?auto_59292 ) ) ( not ( = ?auto_59306 ?auto_59292 ) ) ( not ( = ?auto_59317 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59317 ) ) ( not ( = ?auto_59316 ?auto_59317 ) ) ( not ( = ?auto_59315 ?auto_59317 ) ) ( not ( = ?auto_59310 ?auto_59317 ) ) ( not ( = ?auto_59312 ?auto_59317 ) ) ( HOIST-AT ?auto_59296 ?auto_59317 ) ( not ( = ?auto_59303 ?auto_59296 ) ) ( not ( = ?auto_59294 ?auto_59296 ) ) ( not ( = ?auto_59305 ?auto_59296 ) ) ( not ( = ?auto_59308 ?auto_59296 ) ) ( not ( = ?auto_59304 ?auto_59296 ) ) ( not ( = ?auto_59297 ?auto_59296 ) ) ( AVAILABLE ?auto_59296 ) ( SURFACE-AT ?auto_59295 ?auto_59317 ) ( ON ?auto_59295 ?auto_59301 ) ( CLEAR ?auto_59295 ) ( not ( = ?auto_59290 ?auto_59301 ) ) ( not ( = ?auto_59291 ?auto_59301 ) ) ( not ( = ?auto_59314 ?auto_59301 ) ) ( not ( = ?auto_59309 ?auto_59301 ) ) ( not ( = ?auto_59307 ?auto_59301 ) ) ( not ( = ?auto_59321 ?auto_59301 ) ) ( not ( = ?auto_59311 ?auto_59301 ) ) ( not ( = ?auto_59298 ?auto_59301 ) ) ( not ( = ?auto_59318 ?auto_59301 ) ) ( not ( = ?auto_59313 ?auto_59301 ) ) ( not ( = ?auto_59320 ?auto_59301 ) ) ( not ( = ?auto_59295 ?auto_59301 ) ) ( not ( = ?auto_59306 ?auto_59301 ) ) ( not ( = ?auto_59292 ?auto_59301 ) ) ( IS-CRATE ?auto_59292 ) ( not ( = ?auto_59290 ?auto_59319 ) ) ( not ( = ?auto_59291 ?auto_59319 ) ) ( not ( = ?auto_59314 ?auto_59319 ) ) ( not ( = ?auto_59309 ?auto_59319 ) ) ( not ( = ?auto_59307 ?auto_59319 ) ) ( not ( = ?auto_59321 ?auto_59319 ) ) ( not ( = ?auto_59311 ?auto_59319 ) ) ( not ( = ?auto_59298 ?auto_59319 ) ) ( not ( = ?auto_59318 ?auto_59319 ) ) ( not ( = ?auto_59313 ?auto_59319 ) ) ( not ( = ?auto_59320 ?auto_59319 ) ) ( not ( = ?auto_59295 ?auto_59319 ) ) ( not ( = ?auto_59306 ?auto_59319 ) ) ( not ( = ?auto_59292 ?auto_59319 ) ) ( not ( = ?auto_59301 ?auto_59319 ) ) ( SURFACE-AT ?auto_59292 ?auto_59299 ) ( ON ?auto_59292 ?auto_59302 ) ( CLEAR ?auto_59292 ) ( not ( = ?auto_59290 ?auto_59302 ) ) ( not ( = ?auto_59291 ?auto_59302 ) ) ( not ( = ?auto_59314 ?auto_59302 ) ) ( not ( = ?auto_59309 ?auto_59302 ) ) ( not ( = ?auto_59307 ?auto_59302 ) ) ( not ( = ?auto_59321 ?auto_59302 ) ) ( not ( = ?auto_59311 ?auto_59302 ) ) ( not ( = ?auto_59298 ?auto_59302 ) ) ( not ( = ?auto_59318 ?auto_59302 ) ) ( not ( = ?auto_59313 ?auto_59302 ) ) ( not ( = ?auto_59320 ?auto_59302 ) ) ( not ( = ?auto_59295 ?auto_59302 ) ) ( not ( = ?auto_59306 ?auto_59302 ) ) ( not ( = ?auto_59292 ?auto_59302 ) ) ( not ( = ?auto_59301 ?auto_59302 ) ) ( not ( = ?auto_59319 ?auto_59302 ) ) ( SURFACE-AT ?auto_59293 ?auto_59300 ) ( CLEAR ?auto_59293 ) ( IS-CRATE ?auto_59319 ) ( not ( = ?auto_59290 ?auto_59293 ) ) ( not ( = ?auto_59291 ?auto_59293 ) ) ( not ( = ?auto_59314 ?auto_59293 ) ) ( not ( = ?auto_59309 ?auto_59293 ) ) ( not ( = ?auto_59307 ?auto_59293 ) ) ( not ( = ?auto_59321 ?auto_59293 ) ) ( not ( = ?auto_59311 ?auto_59293 ) ) ( not ( = ?auto_59298 ?auto_59293 ) ) ( not ( = ?auto_59318 ?auto_59293 ) ) ( not ( = ?auto_59313 ?auto_59293 ) ) ( not ( = ?auto_59320 ?auto_59293 ) ) ( not ( = ?auto_59295 ?auto_59293 ) ) ( not ( = ?auto_59306 ?auto_59293 ) ) ( not ( = ?auto_59292 ?auto_59293 ) ) ( not ( = ?auto_59301 ?auto_59293 ) ) ( not ( = ?auto_59319 ?auto_59293 ) ) ( not ( = ?auto_59302 ?auto_59293 ) ) ( AVAILABLE ?auto_59303 ) ( TRUCK-AT ?auto_59322 ?auto_59299 ) ( LIFTING ?auto_59294 ?auto_59319 ) )
    :subtasks
    ( ( !LOAD ?auto_59294 ?auto_59319 ?auto_59322 ?auto_59299 )
      ( MAKE-ON ?auto_59290 ?auto_59291 )
      ( MAKE-ON-VERIFY ?auto_59290 ?auto_59291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59323 - SURFACE
      ?auto_59324 - SURFACE
    )
    :vars
    (
      ?auto_59332 - HOIST
      ?auto_59330 - PLACE
      ?auto_59351 - PLACE
      ?auto_59347 - HOIST
      ?auto_59344 - SURFACE
      ?auto_59339 - SURFACE
      ?auto_59329 - PLACE
      ?auto_59353 - HOIST
      ?auto_59345 - SURFACE
      ?auto_59335 - SURFACE
      ?auto_59337 - PLACE
      ?auto_59338 - HOIST
      ?auto_59341 - SURFACE
      ?auto_59326 - SURFACE
      ?auto_59340 - PLACE
      ?auto_59349 - HOIST
      ?auto_59328 - SURFACE
      ?auto_59343 - SURFACE
      ?auto_59334 - SURFACE
      ?auto_59350 - SURFACE
      ?auto_59342 - PLACE
      ?auto_59352 - HOIST
      ?auto_59346 - SURFACE
      ?auto_59333 - SURFACE
      ?auto_59327 - PLACE
      ?auto_59354 - HOIST
      ?auto_59348 - SURFACE
      ?auto_59325 - SURFACE
      ?auto_59331 - SURFACE
      ?auto_59355 - SURFACE
      ?auto_59336 - TRUCK
      ?auto_59356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59332 ?auto_59330 ) ( IS-CRATE ?auto_59323 ) ( not ( = ?auto_59323 ?auto_59324 ) ) ( not ( = ?auto_59351 ?auto_59330 ) ) ( HOIST-AT ?auto_59347 ?auto_59351 ) ( not ( = ?auto_59332 ?auto_59347 ) ) ( SURFACE-AT ?auto_59323 ?auto_59351 ) ( ON ?auto_59323 ?auto_59344 ) ( CLEAR ?auto_59323 ) ( not ( = ?auto_59323 ?auto_59344 ) ) ( not ( = ?auto_59324 ?auto_59344 ) ) ( IS-CRATE ?auto_59324 ) ( not ( = ?auto_59323 ?auto_59339 ) ) ( not ( = ?auto_59324 ?auto_59339 ) ) ( not ( = ?auto_59344 ?auto_59339 ) ) ( not ( = ?auto_59329 ?auto_59330 ) ) ( not ( = ?auto_59351 ?auto_59329 ) ) ( HOIST-AT ?auto_59353 ?auto_59329 ) ( not ( = ?auto_59332 ?auto_59353 ) ) ( not ( = ?auto_59347 ?auto_59353 ) ) ( SURFACE-AT ?auto_59324 ?auto_59329 ) ( ON ?auto_59324 ?auto_59345 ) ( CLEAR ?auto_59324 ) ( not ( = ?auto_59323 ?auto_59345 ) ) ( not ( = ?auto_59324 ?auto_59345 ) ) ( not ( = ?auto_59344 ?auto_59345 ) ) ( not ( = ?auto_59339 ?auto_59345 ) ) ( IS-CRATE ?auto_59339 ) ( not ( = ?auto_59323 ?auto_59335 ) ) ( not ( = ?auto_59324 ?auto_59335 ) ) ( not ( = ?auto_59344 ?auto_59335 ) ) ( not ( = ?auto_59339 ?auto_59335 ) ) ( not ( = ?auto_59345 ?auto_59335 ) ) ( not ( = ?auto_59337 ?auto_59330 ) ) ( not ( = ?auto_59351 ?auto_59337 ) ) ( not ( = ?auto_59329 ?auto_59337 ) ) ( HOIST-AT ?auto_59338 ?auto_59337 ) ( not ( = ?auto_59332 ?auto_59338 ) ) ( not ( = ?auto_59347 ?auto_59338 ) ) ( not ( = ?auto_59353 ?auto_59338 ) ) ( AVAILABLE ?auto_59338 ) ( SURFACE-AT ?auto_59339 ?auto_59337 ) ( ON ?auto_59339 ?auto_59341 ) ( CLEAR ?auto_59339 ) ( not ( = ?auto_59323 ?auto_59341 ) ) ( not ( = ?auto_59324 ?auto_59341 ) ) ( not ( = ?auto_59344 ?auto_59341 ) ) ( not ( = ?auto_59339 ?auto_59341 ) ) ( not ( = ?auto_59345 ?auto_59341 ) ) ( not ( = ?auto_59335 ?auto_59341 ) ) ( IS-CRATE ?auto_59335 ) ( not ( = ?auto_59323 ?auto_59326 ) ) ( not ( = ?auto_59324 ?auto_59326 ) ) ( not ( = ?auto_59344 ?auto_59326 ) ) ( not ( = ?auto_59339 ?auto_59326 ) ) ( not ( = ?auto_59345 ?auto_59326 ) ) ( not ( = ?auto_59335 ?auto_59326 ) ) ( not ( = ?auto_59341 ?auto_59326 ) ) ( not ( = ?auto_59340 ?auto_59330 ) ) ( not ( = ?auto_59351 ?auto_59340 ) ) ( not ( = ?auto_59329 ?auto_59340 ) ) ( not ( = ?auto_59337 ?auto_59340 ) ) ( HOIST-AT ?auto_59349 ?auto_59340 ) ( not ( = ?auto_59332 ?auto_59349 ) ) ( not ( = ?auto_59347 ?auto_59349 ) ) ( not ( = ?auto_59353 ?auto_59349 ) ) ( not ( = ?auto_59338 ?auto_59349 ) ) ( AVAILABLE ?auto_59349 ) ( SURFACE-AT ?auto_59335 ?auto_59340 ) ( ON ?auto_59335 ?auto_59328 ) ( CLEAR ?auto_59335 ) ( not ( = ?auto_59323 ?auto_59328 ) ) ( not ( = ?auto_59324 ?auto_59328 ) ) ( not ( = ?auto_59344 ?auto_59328 ) ) ( not ( = ?auto_59339 ?auto_59328 ) ) ( not ( = ?auto_59345 ?auto_59328 ) ) ( not ( = ?auto_59335 ?auto_59328 ) ) ( not ( = ?auto_59341 ?auto_59328 ) ) ( not ( = ?auto_59326 ?auto_59328 ) ) ( IS-CRATE ?auto_59326 ) ( not ( = ?auto_59323 ?auto_59343 ) ) ( not ( = ?auto_59324 ?auto_59343 ) ) ( not ( = ?auto_59344 ?auto_59343 ) ) ( not ( = ?auto_59339 ?auto_59343 ) ) ( not ( = ?auto_59345 ?auto_59343 ) ) ( not ( = ?auto_59335 ?auto_59343 ) ) ( not ( = ?auto_59341 ?auto_59343 ) ) ( not ( = ?auto_59326 ?auto_59343 ) ) ( not ( = ?auto_59328 ?auto_59343 ) ) ( AVAILABLE ?auto_59353 ) ( SURFACE-AT ?auto_59326 ?auto_59329 ) ( ON ?auto_59326 ?auto_59334 ) ( CLEAR ?auto_59326 ) ( not ( = ?auto_59323 ?auto_59334 ) ) ( not ( = ?auto_59324 ?auto_59334 ) ) ( not ( = ?auto_59344 ?auto_59334 ) ) ( not ( = ?auto_59339 ?auto_59334 ) ) ( not ( = ?auto_59345 ?auto_59334 ) ) ( not ( = ?auto_59335 ?auto_59334 ) ) ( not ( = ?auto_59341 ?auto_59334 ) ) ( not ( = ?auto_59326 ?auto_59334 ) ) ( not ( = ?auto_59328 ?auto_59334 ) ) ( not ( = ?auto_59343 ?auto_59334 ) ) ( IS-CRATE ?auto_59343 ) ( not ( = ?auto_59323 ?auto_59350 ) ) ( not ( = ?auto_59324 ?auto_59350 ) ) ( not ( = ?auto_59344 ?auto_59350 ) ) ( not ( = ?auto_59339 ?auto_59350 ) ) ( not ( = ?auto_59345 ?auto_59350 ) ) ( not ( = ?auto_59335 ?auto_59350 ) ) ( not ( = ?auto_59341 ?auto_59350 ) ) ( not ( = ?auto_59326 ?auto_59350 ) ) ( not ( = ?auto_59328 ?auto_59350 ) ) ( not ( = ?auto_59343 ?auto_59350 ) ) ( not ( = ?auto_59334 ?auto_59350 ) ) ( not ( = ?auto_59342 ?auto_59330 ) ) ( not ( = ?auto_59351 ?auto_59342 ) ) ( not ( = ?auto_59329 ?auto_59342 ) ) ( not ( = ?auto_59337 ?auto_59342 ) ) ( not ( = ?auto_59340 ?auto_59342 ) ) ( HOIST-AT ?auto_59352 ?auto_59342 ) ( not ( = ?auto_59332 ?auto_59352 ) ) ( not ( = ?auto_59347 ?auto_59352 ) ) ( not ( = ?auto_59353 ?auto_59352 ) ) ( not ( = ?auto_59338 ?auto_59352 ) ) ( not ( = ?auto_59349 ?auto_59352 ) ) ( AVAILABLE ?auto_59352 ) ( SURFACE-AT ?auto_59343 ?auto_59342 ) ( ON ?auto_59343 ?auto_59346 ) ( CLEAR ?auto_59343 ) ( not ( = ?auto_59323 ?auto_59346 ) ) ( not ( = ?auto_59324 ?auto_59346 ) ) ( not ( = ?auto_59344 ?auto_59346 ) ) ( not ( = ?auto_59339 ?auto_59346 ) ) ( not ( = ?auto_59345 ?auto_59346 ) ) ( not ( = ?auto_59335 ?auto_59346 ) ) ( not ( = ?auto_59341 ?auto_59346 ) ) ( not ( = ?auto_59326 ?auto_59346 ) ) ( not ( = ?auto_59328 ?auto_59346 ) ) ( not ( = ?auto_59343 ?auto_59346 ) ) ( not ( = ?auto_59334 ?auto_59346 ) ) ( not ( = ?auto_59350 ?auto_59346 ) ) ( IS-CRATE ?auto_59350 ) ( not ( = ?auto_59323 ?auto_59333 ) ) ( not ( = ?auto_59324 ?auto_59333 ) ) ( not ( = ?auto_59344 ?auto_59333 ) ) ( not ( = ?auto_59339 ?auto_59333 ) ) ( not ( = ?auto_59345 ?auto_59333 ) ) ( not ( = ?auto_59335 ?auto_59333 ) ) ( not ( = ?auto_59341 ?auto_59333 ) ) ( not ( = ?auto_59326 ?auto_59333 ) ) ( not ( = ?auto_59328 ?auto_59333 ) ) ( not ( = ?auto_59343 ?auto_59333 ) ) ( not ( = ?auto_59334 ?auto_59333 ) ) ( not ( = ?auto_59350 ?auto_59333 ) ) ( not ( = ?auto_59346 ?auto_59333 ) ) ( not ( = ?auto_59327 ?auto_59330 ) ) ( not ( = ?auto_59351 ?auto_59327 ) ) ( not ( = ?auto_59329 ?auto_59327 ) ) ( not ( = ?auto_59337 ?auto_59327 ) ) ( not ( = ?auto_59340 ?auto_59327 ) ) ( not ( = ?auto_59342 ?auto_59327 ) ) ( HOIST-AT ?auto_59354 ?auto_59327 ) ( not ( = ?auto_59332 ?auto_59354 ) ) ( not ( = ?auto_59347 ?auto_59354 ) ) ( not ( = ?auto_59353 ?auto_59354 ) ) ( not ( = ?auto_59338 ?auto_59354 ) ) ( not ( = ?auto_59349 ?auto_59354 ) ) ( not ( = ?auto_59352 ?auto_59354 ) ) ( AVAILABLE ?auto_59354 ) ( SURFACE-AT ?auto_59350 ?auto_59327 ) ( ON ?auto_59350 ?auto_59348 ) ( CLEAR ?auto_59350 ) ( not ( = ?auto_59323 ?auto_59348 ) ) ( not ( = ?auto_59324 ?auto_59348 ) ) ( not ( = ?auto_59344 ?auto_59348 ) ) ( not ( = ?auto_59339 ?auto_59348 ) ) ( not ( = ?auto_59345 ?auto_59348 ) ) ( not ( = ?auto_59335 ?auto_59348 ) ) ( not ( = ?auto_59341 ?auto_59348 ) ) ( not ( = ?auto_59326 ?auto_59348 ) ) ( not ( = ?auto_59328 ?auto_59348 ) ) ( not ( = ?auto_59343 ?auto_59348 ) ) ( not ( = ?auto_59334 ?auto_59348 ) ) ( not ( = ?auto_59350 ?auto_59348 ) ) ( not ( = ?auto_59346 ?auto_59348 ) ) ( not ( = ?auto_59333 ?auto_59348 ) ) ( IS-CRATE ?auto_59333 ) ( not ( = ?auto_59323 ?auto_59325 ) ) ( not ( = ?auto_59324 ?auto_59325 ) ) ( not ( = ?auto_59344 ?auto_59325 ) ) ( not ( = ?auto_59339 ?auto_59325 ) ) ( not ( = ?auto_59345 ?auto_59325 ) ) ( not ( = ?auto_59335 ?auto_59325 ) ) ( not ( = ?auto_59341 ?auto_59325 ) ) ( not ( = ?auto_59326 ?auto_59325 ) ) ( not ( = ?auto_59328 ?auto_59325 ) ) ( not ( = ?auto_59343 ?auto_59325 ) ) ( not ( = ?auto_59334 ?auto_59325 ) ) ( not ( = ?auto_59350 ?auto_59325 ) ) ( not ( = ?auto_59346 ?auto_59325 ) ) ( not ( = ?auto_59333 ?auto_59325 ) ) ( not ( = ?auto_59348 ?auto_59325 ) ) ( SURFACE-AT ?auto_59333 ?auto_59351 ) ( ON ?auto_59333 ?auto_59331 ) ( CLEAR ?auto_59333 ) ( not ( = ?auto_59323 ?auto_59331 ) ) ( not ( = ?auto_59324 ?auto_59331 ) ) ( not ( = ?auto_59344 ?auto_59331 ) ) ( not ( = ?auto_59339 ?auto_59331 ) ) ( not ( = ?auto_59345 ?auto_59331 ) ) ( not ( = ?auto_59335 ?auto_59331 ) ) ( not ( = ?auto_59341 ?auto_59331 ) ) ( not ( = ?auto_59326 ?auto_59331 ) ) ( not ( = ?auto_59328 ?auto_59331 ) ) ( not ( = ?auto_59343 ?auto_59331 ) ) ( not ( = ?auto_59334 ?auto_59331 ) ) ( not ( = ?auto_59350 ?auto_59331 ) ) ( not ( = ?auto_59346 ?auto_59331 ) ) ( not ( = ?auto_59333 ?auto_59331 ) ) ( not ( = ?auto_59348 ?auto_59331 ) ) ( not ( = ?auto_59325 ?auto_59331 ) ) ( SURFACE-AT ?auto_59355 ?auto_59330 ) ( CLEAR ?auto_59355 ) ( IS-CRATE ?auto_59325 ) ( not ( = ?auto_59323 ?auto_59355 ) ) ( not ( = ?auto_59324 ?auto_59355 ) ) ( not ( = ?auto_59344 ?auto_59355 ) ) ( not ( = ?auto_59339 ?auto_59355 ) ) ( not ( = ?auto_59345 ?auto_59355 ) ) ( not ( = ?auto_59335 ?auto_59355 ) ) ( not ( = ?auto_59341 ?auto_59355 ) ) ( not ( = ?auto_59326 ?auto_59355 ) ) ( not ( = ?auto_59328 ?auto_59355 ) ) ( not ( = ?auto_59343 ?auto_59355 ) ) ( not ( = ?auto_59334 ?auto_59355 ) ) ( not ( = ?auto_59350 ?auto_59355 ) ) ( not ( = ?auto_59346 ?auto_59355 ) ) ( not ( = ?auto_59333 ?auto_59355 ) ) ( not ( = ?auto_59348 ?auto_59355 ) ) ( not ( = ?auto_59325 ?auto_59355 ) ) ( not ( = ?auto_59331 ?auto_59355 ) ) ( AVAILABLE ?auto_59332 ) ( TRUCK-AT ?auto_59336 ?auto_59351 ) ( AVAILABLE ?auto_59347 ) ( SURFACE-AT ?auto_59325 ?auto_59351 ) ( ON ?auto_59325 ?auto_59356 ) ( CLEAR ?auto_59325 ) ( not ( = ?auto_59323 ?auto_59356 ) ) ( not ( = ?auto_59324 ?auto_59356 ) ) ( not ( = ?auto_59344 ?auto_59356 ) ) ( not ( = ?auto_59339 ?auto_59356 ) ) ( not ( = ?auto_59345 ?auto_59356 ) ) ( not ( = ?auto_59335 ?auto_59356 ) ) ( not ( = ?auto_59341 ?auto_59356 ) ) ( not ( = ?auto_59326 ?auto_59356 ) ) ( not ( = ?auto_59328 ?auto_59356 ) ) ( not ( = ?auto_59343 ?auto_59356 ) ) ( not ( = ?auto_59334 ?auto_59356 ) ) ( not ( = ?auto_59350 ?auto_59356 ) ) ( not ( = ?auto_59346 ?auto_59356 ) ) ( not ( = ?auto_59333 ?auto_59356 ) ) ( not ( = ?auto_59348 ?auto_59356 ) ) ( not ( = ?auto_59325 ?auto_59356 ) ) ( not ( = ?auto_59331 ?auto_59356 ) ) ( not ( = ?auto_59355 ?auto_59356 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59347 ?auto_59325 ?auto_59356 ?auto_59351 )
      ( MAKE-ON ?auto_59323 ?auto_59324 )
      ( MAKE-ON-VERIFY ?auto_59323 ?auto_59324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59357 - SURFACE
      ?auto_59358 - SURFACE
    )
    :vars
    (
      ?auto_59388 - HOIST
      ?auto_59387 - PLACE
      ?auto_59360 - PLACE
      ?auto_59378 - HOIST
      ?auto_59371 - SURFACE
      ?auto_59362 - SURFACE
      ?auto_59383 - PLACE
      ?auto_59365 - HOIST
      ?auto_59376 - SURFACE
      ?auto_59385 - SURFACE
      ?auto_59389 - PLACE
      ?auto_59384 - HOIST
      ?auto_59368 - SURFACE
      ?auto_59382 - SURFACE
      ?auto_59379 - PLACE
      ?auto_59372 - HOIST
      ?auto_59373 - SURFACE
      ?auto_59370 - SURFACE
      ?auto_59386 - SURFACE
      ?auto_59361 - SURFACE
      ?auto_59369 - PLACE
      ?auto_59359 - HOIST
      ?auto_59377 - SURFACE
      ?auto_59374 - SURFACE
      ?auto_59363 - PLACE
      ?auto_59364 - HOIST
      ?auto_59367 - SURFACE
      ?auto_59375 - SURFACE
      ?auto_59380 - SURFACE
      ?auto_59366 - SURFACE
      ?auto_59390 - SURFACE
      ?auto_59381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59388 ?auto_59387 ) ( IS-CRATE ?auto_59357 ) ( not ( = ?auto_59357 ?auto_59358 ) ) ( not ( = ?auto_59360 ?auto_59387 ) ) ( HOIST-AT ?auto_59378 ?auto_59360 ) ( not ( = ?auto_59388 ?auto_59378 ) ) ( SURFACE-AT ?auto_59357 ?auto_59360 ) ( ON ?auto_59357 ?auto_59371 ) ( CLEAR ?auto_59357 ) ( not ( = ?auto_59357 ?auto_59371 ) ) ( not ( = ?auto_59358 ?auto_59371 ) ) ( IS-CRATE ?auto_59358 ) ( not ( = ?auto_59357 ?auto_59362 ) ) ( not ( = ?auto_59358 ?auto_59362 ) ) ( not ( = ?auto_59371 ?auto_59362 ) ) ( not ( = ?auto_59383 ?auto_59387 ) ) ( not ( = ?auto_59360 ?auto_59383 ) ) ( HOIST-AT ?auto_59365 ?auto_59383 ) ( not ( = ?auto_59388 ?auto_59365 ) ) ( not ( = ?auto_59378 ?auto_59365 ) ) ( SURFACE-AT ?auto_59358 ?auto_59383 ) ( ON ?auto_59358 ?auto_59376 ) ( CLEAR ?auto_59358 ) ( not ( = ?auto_59357 ?auto_59376 ) ) ( not ( = ?auto_59358 ?auto_59376 ) ) ( not ( = ?auto_59371 ?auto_59376 ) ) ( not ( = ?auto_59362 ?auto_59376 ) ) ( IS-CRATE ?auto_59362 ) ( not ( = ?auto_59357 ?auto_59385 ) ) ( not ( = ?auto_59358 ?auto_59385 ) ) ( not ( = ?auto_59371 ?auto_59385 ) ) ( not ( = ?auto_59362 ?auto_59385 ) ) ( not ( = ?auto_59376 ?auto_59385 ) ) ( not ( = ?auto_59389 ?auto_59387 ) ) ( not ( = ?auto_59360 ?auto_59389 ) ) ( not ( = ?auto_59383 ?auto_59389 ) ) ( HOIST-AT ?auto_59384 ?auto_59389 ) ( not ( = ?auto_59388 ?auto_59384 ) ) ( not ( = ?auto_59378 ?auto_59384 ) ) ( not ( = ?auto_59365 ?auto_59384 ) ) ( AVAILABLE ?auto_59384 ) ( SURFACE-AT ?auto_59362 ?auto_59389 ) ( ON ?auto_59362 ?auto_59368 ) ( CLEAR ?auto_59362 ) ( not ( = ?auto_59357 ?auto_59368 ) ) ( not ( = ?auto_59358 ?auto_59368 ) ) ( not ( = ?auto_59371 ?auto_59368 ) ) ( not ( = ?auto_59362 ?auto_59368 ) ) ( not ( = ?auto_59376 ?auto_59368 ) ) ( not ( = ?auto_59385 ?auto_59368 ) ) ( IS-CRATE ?auto_59385 ) ( not ( = ?auto_59357 ?auto_59382 ) ) ( not ( = ?auto_59358 ?auto_59382 ) ) ( not ( = ?auto_59371 ?auto_59382 ) ) ( not ( = ?auto_59362 ?auto_59382 ) ) ( not ( = ?auto_59376 ?auto_59382 ) ) ( not ( = ?auto_59385 ?auto_59382 ) ) ( not ( = ?auto_59368 ?auto_59382 ) ) ( not ( = ?auto_59379 ?auto_59387 ) ) ( not ( = ?auto_59360 ?auto_59379 ) ) ( not ( = ?auto_59383 ?auto_59379 ) ) ( not ( = ?auto_59389 ?auto_59379 ) ) ( HOIST-AT ?auto_59372 ?auto_59379 ) ( not ( = ?auto_59388 ?auto_59372 ) ) ( not ( = ?auto_59378 ?auto_59372 ) ) ( not ( = ?auto_59365 ?auto_59372 ) ) ( not ( = ?auto_59384 ?auto_59372 ) ) ( AVAILABLE ?auto_59372 ) ( SURFACE-AT ?auto_59385 ?auto_59379 ) ( ON ?auto_59385 ?auto_59373 ) ( CLEAR ?auto_59385 ) ( not ( = ?auto_59357 ?auto_59373 ) ) ( not ( = ?auto_59358 ?auto_59373 ) ) ( not ( = ?auto_59371 ?auto_59373 ) ) ( not ( = ?auto_59362 ?auto_59373 ) ) ( not ( = ?auto_59376 ?auto_59373 ) ) ( not ( = ?auto_59385 ?auto_59373 ) ) ( not ( = ?auto_59368 ?auto_59373 ) ) ( not ( = ?auto_59382 ?auto_59373 ) ) ( IS-CRATE ?auto_59382 ) ( not ( = ?auto_59357 ?auto_59370 ) ) ( not ( = ?auto_59358 ?auto_59370 ) ) ( not ( = ?auto_59371 ?auto_59370 ) ) ( not ( = ?auto_59362 ?auto_59370 ) ) ( not ( = ?auto_59376 ?auto_59370 ) ) ( not ( = ?auto_59385 ?auto_59370 ) ) ( not ( = ?auto_59368 ?auto_59370 ) ) ( not ( = ?auto_59382 ?auto_59370 ) ) ( not ( = ?auto_59373 ?auto_59370 ) ) ( AVAILABLE ?auto_59365 ) ( SURFACE-AT ?auto_59382 ?auto_59383 ) ( ON ?auto_59382 ?auto_59386 ) ( CLEAR ?auto_59382 ) ( not ( = ?auto_59357 ?auto_59386 ) ) ( not ( = ?auto_59358 ?auto_59386 ) ) ( not ( = ?auto_59371 ?auto_59386 ) ) ( not ( = ?auto_59362 ?auto_59386 ) ) ( not ( = ?auto_59376 ?auto_59386 ) ) ( not ( = ?auto_59385 ?auto_59386 ) ) ( not ( = ?auto_59368 ?auto_59386 ) ) ( not ( = ?auto_59382 ?auto_59386 ) ) ( not ( = ?auto_59373 ?auto_59386 ) ) ( not ( = ?auto_59370 ?auto_59386 ) ) ( IS-CRATE ?auto_59370 ) ( not ( = ?auto_59357 ?auto_59361 ) ) ( not ( = ?auto_59358 ?auto_59361 ) ) ( not ( = ?auto_59371 ?auto_59361 ) ) ( not ( = ?auto_59362 ?auto_59361 ) ) ( not ( = ?auto_59376 ?auto_59361 ) ) ( not ( = ?auto_59385 ?auto_59361 ) ) ( not ( = ?auto_59368 ?auto_59361 ) ) ( not ( = ?auto_59382 ?auto_59361 ) ) ( not ( = ?auto_59373 ?auto_59361 ) ) ( not ( = ?auto_59370 ?auto_59361 ) ) ( not ( = ?auto_59386 ?auto_59361 ) ) ( not ( = ?auto_59369 ?auto_59387 ) ) ( not ( = ?auto_59360 ?auto_59369 ) ) ( not ( = ?auto_59383 ?auto_59369 ) ) ( not ( = ?auto_59389 ?auto_59369 ) ) ( not ( = ?auto_59379 ?auto_59369 ) ) ( HOIST-AT ?auto_59359 ?auto_59369 ) ( not ( = ?auto_59388 ?auto_59359 ) ) ( not ( = ?auto_59378 ?auto_59359 ) ) ( not ( = ?auto_59365 ?auto_59359 ) ) ( not ( = ?auto_59384 ?auto_59359 ) ) ( not ( = ?auto_59372 ?auto_59359 ) ) ( AVAILABLE ?auto_59359 ) ( SURFACE-AT ?auto_59370 ?auto_59369 ) ( ON ?auto_59370 ?auto_59377 ) ( CLEAR ?auto_59370 ) ( not ( = ?auto_59357 ?auto_59377 ) ) ( not ( = ?auto_59358 ?auto_59377 ) ) ( not ( = ?auto_59371 ?auto_59377 ) ) ( not ( = ?auto_59362 ?auto_59377 ) ) ( not ( = ?auto_59376 ?auto_59377 ) ) ( not ( = ?auto_59385 ?auto_59377 ) ) ( not ( = ?auto_59368 ?auto_59377 ) ) ( not ( = ?auto_59382 ?auto_59377 ) ) ( not ( = ?auto_59373 ?auto_59377 ) ) ( not ( = ?auto_59370 ?auto_59377 ) ) ( not ( = ?auto_59386 ?auto_59377 ) ) ( not ( = ?auto_59361 ?auto_59377 ) ) ( IS-CRATE ?auto_59361 ) ( not ( = ?auto_59357 ?auto_59374 ) ) ( not ( = ?auto_59358 ?auto_59374 ) ) ( not ( = ?auto_59371 ?auto_59374 ) ) ( not ( = ?auto_59362 ?auto_59374 ) ) ( not ( = ?auto_59376 ?auto_59374 ) ) ( not ( = ?auto_59385 ?auto_59374 ) ) ( not ( = ?auto_59368 ?auto_59374 ) ) ( not ( = ?auto_59382 ?auto_59374 ) ) ( not ( = ?auto_59373 ?auto_59374 ) ) ( not ( = ?auto_59370 ?auto_59374 ) ) ( not ( = ?auto_59386 ?auto_59374 ) ) ( not ( = ?auto_59361 ?auto_59374 ) ) ( not ( = ?auto_59377 ?auto_59374 ) ) ( not ( = ?auto_59363 ?auto_59387 ) ) ( not ( = ?auto_59360 ?auto_59363 ) ) ( not ( = ?auto_59383 ?auto_59363 ) ) ( not ( = ?auto_59389 ?auto_59363 ) ) ( not ( = ?auto_59379 ?auto_59363 ) ) ( not ( = ?auto_59369 ?auto_59363 ) ) ( HOIST-AT ?auto_59364 ?auto_59363 ) ( not ( = ?auto_59388 ?auto_59364 ) ) ( not ( = ?auto_59378 ?auto_59364 ) ) ( not ( = ?auto_59365 ?auto_59364 ) ) ( not ( = ?auto_59384 ?auto_59364 ) ) ( not ( = ?auto_59372 ?auto_59364 ) ) ( not ( = ?auto_59359 ?auto_59364 ) ) ( AVAILABLE ?auto_59364 ) ( SURFACE-AT ?auto_59361 ?auto_59363 ) ( ON ?auto_59361 ?auto_59367 ) ( CLEAR ?auto_59361 ) ( not ( = ?auto_59357 ?auto_59367 ) ) ( not ( = ?auto_59358 ?auto_59367 ) ) ( not ( = ?auto_59371 ?auto_59367 ) ) ( not ( = ?auto_59362 ?auto_59367 ) ) ( not ( = ?auto_59376 ?auto_59367 ) ) ( not ( = ?auto_59385 ?auto_59367 ) ) ( not ( = ?auto_59368 ?auto_59367 ) ) ( not ( = ?auto_59382 ?auto_59367 ) ) ( not ( = ?auto_59373 ?auto_59367 ) ) ( not ( = ?auto_59370 ?auto_59367 ) ) ( not ( = ?auto_59386 ?auto_59367 ) ) ( not ( = ?auto_59361 ?auto_59367 ) ) ( not ( = ?auto_59377 ?auto_59367 ) ) ( not ( = ?auto_59374 ?auto_59367 ) ) ( IS-CRATE ?auto_59374 ) ( not ( = ?auto_59357 ?auto_59375 ) ) ( not ( = ?auto_59358 ?auto_59375 ) ) ( not ( = ?auto_59371 ?auto_59375 ) ) ( not ( = ?auto_59362 ?auto_59375 ) ) ( not ( = ?auto_59376 ?auto_59375 ) ) ( not ( = ?auto_59385 ?auto_59375 ) ) ( not ( = ?auto_59368 ?auto_59375 ) ) ( not ( = ?auto_59382 ?auto_59375 ) ) ( not ( = ?auto_59373 ?auto_59375 ) ) ( not ( = ?auto_59370 ?auto_59375 ) ) ( not ( = ?auto_59386 ?auto_59375 ) ) ( not ( = ?auto_59361 ?auto_59375 ) ) ( not ( = ?auto_59377 ?auto_59375 ) ) ( not ( = ?auto_59374 ?auto_59375 ) ) ( not ( = ?auto_59367 ?auto_59375 ) ) ( SURFACE-AT ?auto_59374 ?auto_59360 ) ( ON ?auto_59374 ?auto_59380 ) ( CLEAR ?auto_59374 ) ( not ( = ?auto_59357 ?auto_59380 ) ) ( not ( = ?auto_59358 ?auto_59380 ) ) ( not ( = ?auto_59371 ?auto_59380 ) ) ( not ( = ?auto_59362 ?auto_59380 ) ) ( not ( = ?auto_59376 ?auto_59380 ) ) ( not ( = ?auto_59385 ?auto_59380 ) ) ( not ( = ?auto_59368 ?auto_59380 ) ) ( not ( = ?auto_59382 ?auto_59380 ) ) ( not ( = ?auto_59373 ?auto_59380 ) ) ( not ( = ?auto_59370 ?auto_59380 ) ) ( not ( = ?auto_59386 ?auto_59380 ) ) ( not ( = ?auto_59361 ?auto_59380 ) ) ( not ( = ?auto_59377 ?auto_59380 ) ) ( not ( = ?auto_59374 ?auto_59380 ) ) ( not ( = ?auto_59367 ?auto_59380 ) ) ( not ( = ?auto_59375 ?auto_59380 ) ) ( SURFACE-AT ?auto_59366 ?auto_59387 ) ( CLEAR ?auto_59366 ) ( IS-CRATE ?auto_59375 ) ( not ( = ?auto_59357 ?auto_59366 ) ) ( not ( = ?auto_59358 ?auto_59366 ) ) ( not ( = ?auto_59371 ?auto_59366 ) ) ( not ( = ?auto_59362 ?auto_59366 ) ) ( not ( = ?auto_59376 ?auto_59366 ) ) ( not ( = ?auto_59385 ?auto_59366 ) ) ( not ( = ?auto_59368 ?auto_59366 ) ) ( not ( = ?auto_59382 ?auto_59366 ) ) ( not ( = ?auto_59373 ?auto_59366 ) ) ( not ( = ?auto_59370 ?auto_59366 ) ) ( not ( = ?auto_59386 ?auto_59366 ) ) ( not ( = ?auto_59361 ?auto_59366 ) ) ( not ( = ?auto_59377 ?auto_59366 ) ) ( not ( = ?auto_59374 ?auto_59366 ) ) ( not ( = ?auto_59367 ?auto_59366 ) ) ( not ( = ?auto_59375 ?auto_59366 ) ) ( not ( = ?auto_59380 ?auto_59366 ) ) ( AVAILABLE ?auto_59388 ) ( AVAILABLE ?auto_59378 ) ( SURFACE-AT ?auto_59375 ?auto_59360 ) ( ON ?auto_59375 ?auto_59390 ) ( CLEAR ?auto_59375 ) ( not ( = ?auto_59357 ?auto_59390 ) ) ( not ( = ?auto_59358 ?auto_59390 ) ) ( not ( = ?auto_59371 ?auto_59390 ) ) ( not ( = ?auto_59362 ?auto_59390 ) ) ( not ( = ?auto_59376 ?auto_59390 ) ) ( not ( = ?auto_59385 ?auto_59390 ) ) ( not ( = ?auto_59368 ?auto_59390 ) ) ( not ( = ?auto_59382 ?auto_59390 ) ) ( not ( = ?auto_59373 ?auto_59390 ) ) ( not ( = ?auto_59370 ?auto_59390 ) ) ( not ( = ?auto_59386 ?auto_59390 ) ) ( not ( = ?auto_59361 ?auto_59390 ) ) ( not ( = ?auto_59377 ?auto_59390 ) ) ( not ( = ?auto_59374 ?auto_59390 ) ) ( not ( = ?auto_59367 ?auto_59390 ) ) ( not ( = ?auto_59375 ?auto_59390 ) ) ( not ( = ?auto_59380 ?auto_59390 ) ) ( not ( = ?auto_59366 ?auto_59390 ) ) ( TRUCK-AT ?auto_59381 ?auto_59387 ) )
    :subtasks
    ( ( !DRIVE ?auto_59381 ?auto_59387 ?auto_59360 )
      ( MAKE-ON ?auto_59357 ?auto_59358 )
      ( MAKE-ON-VERIFY ?auto_59357 ?auto_59358 ) )
  )

)

