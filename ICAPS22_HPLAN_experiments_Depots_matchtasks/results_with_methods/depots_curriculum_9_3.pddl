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
      ?auto_5964 - SURFACE
      ?auto_5965 - SURFACE
    )
    :vars
    (
      ?auto_5966 - HOIST
      ?auto_5967 - PLACE
      ?auto_5969 - PLACE
      ?auto_5970 - HOIST
      ?auto_5971 - SURFACE
      ?auto_5968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5966 ?auto_5967 ) ( SURFACE-AT ?auto_5964 ?auto_5967 ) ( CLEAR ?auto_5964 ) ( IS-CRATE ?auto_5965 ) ( AVAILABLE ?auto_5966 ) ( not ( = ?auto_5969 ?auto_5967 ) ) ( HOIST-AT ?auto_5970 ?auto_5969 ) ( AVAILABLE ?auto_5970 ) ( SURFACE-AT ?auto_5965 ?auto_5969 ) ( ON ?auto_5965 ?auto_5971 ) ( CLEAR ?auto_5965 ) ( TRUCK-AT ?auto_5968 ?auto_5967 ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( not ( = ?auto_5964 ?auto_5971 ) ) ( not ( = ?auto_5965 ?auto_5971 ) ) ( not ( = ?auto_5966 ?auto_5970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5968 ?auto_5967 ?auto_5969 )
      ( !LIFT ?auto_5970 ?auto_5965 ?auto_5971 ?auto_5969 )
      ( !LOAD ?auto_5970 ?auto_5965 ?auto_5968 ?auto_5969 )
      ( !DRIVE ?auto_5968 ?auto_5969 ?auto_5967 )
      ( !UNLOAD ?auto_5966 ?auto_5965 ?auto_5968 ?auto_5967 )
      ( !DROP ?auto_5966 ?auto_5965 ?auto_5964 ?auto_5967 )
      ( MAKE-1CRATE-VERIFY ?auto_5964 ?auto_5965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5974 - SURFACE
      ?auto_5975 - SURFACE
    )
    :vars
    (
      ?auto_5976 - HOIST
      ?auto_5977 - PLACE
      ?auto_5979 - PLACE
      ?auto_5980 - HOIST
      ?auto_5981 - SURFACE
      ?auto_5978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5976 ?auto_5977 ) ( SURFACE-AT ?auto_5974 ?auto_5977 ) ( CLEAR ?auto_5974 ) ( IS-CRATE ?auto_5975 ) ( AVAILABLE ?auto_5976 ) ( not ( = ?auto_5979 ?auto_5977 ) ) ( HOIST-AT ?auto_5980 ?auto_5979 ) ( AVAILABLE ?auto_5980 ) ( SURFACE-AT ?auto_5975 ?auto_5979 ) ( ON ?auto_5975 ?auto_5981 ) ( CLEAR ?auto_5975 ) ( TRUCK-AT ?auto_5978 ?auto_5977 ) ( not ( = ?auto_5974 ?auto_5975 ) ) ( not ( = ?auto_5974 ?auto_5981 ) ) ( not ( = ?auto_5975 ?auto_5981 ) ) ( not ( = ?auto_5976 ?auto_5980 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5978 ?auto_5977 ?auto_5979 )
      ( !LIFT ?auto_5980 ?auto_5975 ?auto_5981 ?auto_5979 )
      ( !LOAD ?auto_5980 ?auto_5975 ?auto_5978 ?auto_5979 )
      ( !DRIVE ?auto_5978 ?auto_5979 ?auto_5977 )
      ( !UNLOAD ?auto_5976 ?auto_5975 ?auto_5978 ?auto_5977 )
      ( !DROP ?auto_5976 ?auto_5975 ?auto_5974 ?auto_5977 )
      ( MAKE-1CRATE-VERIFY ?auto_5974 ?auto_5975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5985 - SURFACE
      ?auto_5986 - SURFACE
      ?auto_5987 - SURFACE
    )
    :vars
    (
      ?auto_5991 - HOIST
      ?auto_5993 - PLACE
      ?auto_5989 - PLACE
      ?auto_5988 - HOIST
      ?auto_5990 - SURFACE
      ?auto_5994 - SURFACE
      ?auto_5992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5991 ?auto_5993 ) ( IS-CRATE ?auto_5987 ) ( not ( = ?auto_5989 ?auto_5993 ) ) ( HOIST-AT ?auto_5988 ?auto_5989 ) ( SURFACE-AT ?auto_5987 ?auto_5989 ) ( ON ?auto_5987 ?auto_5990 ) ( CLEAR ?auto_5987 ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( not ( = ?auto_5986 ?auto_5990 ) ) ( not ( = ?auto_5987 ?auto_5990 ) ) ( not ( = ?auto_5991 ?auto_5988 ) ) ( SURFACE-AT ?auto_5985 ?auto_5993 ) ( CLEAR ?auto_5985 ) ( IS-CRATE ?auto_5986 ) ( AVAILABLE ?auto_5991 ) ( AVAILABLE ?auto_5988 ) ( SURFACE-AT ?auto_5986 ?auto_5989 ) ( ON ?auto_5986 ?auto_5994 ) ( CLEAR ?auto_5986 ) ( TRUCK-AT ?auto_5992 ?auto_5993 ) ( not ( = ?auto_5985 ?auto_5986 ) ) ( not ( = ?auto_5985 ?auto_5994 ) ) ( not ( = ?auto_5986 ?auto_5994 ) ) ( not ( = ?auto_5985 ?auto_5987 ) ) ( not ( = ?auto_5985 ?auto_5990 ) ) ( not ( = ?auto_5987 ?auto_5994 ) ) ( not ( = ?auto_5990 ?auto_5994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5985 ?auto_5986 )
      ( MAKE-1CRATE ?auto_5986 ?auto_5987 )
      ( MAKE-2CRATE-VERIFY ?auto_5985 ?auto_5986 ?auto_5987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5997 - SURFACE
      ?auto_5998 - SURFACE
    )
    :vars
    (
      ?auto_5999 - HOIST
      ?auto_6000 - PLACE
      ?auto_6002 - PLACE
      ?auto_6003 - HOIST
      ?auto_6004 - SURFACE
      ?auto_6001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5999 ?auto_6000 ) ( SURFACE-AT ?auto_5997 ?auto_6000 ) ( CLEAR ?auto_5997 ) ( IS-CRATE ?auto_5998 ) ( AVAILABLE ?auto_5999 ) ( not ( = ?auto_6002 ?auto_6000 ) ) ( HOIST-AT ?auto_6003 ?auto_6002 ) ( AVAILABLE ?auto_6003 ) ( SURFACE-AT ?auto_5998 ?auto_6002 ) ( ON ?auto_5998 ?auto_6004 ) ( CLEAR ?auto_5998 ) ( TRUCK-AT ?auto_6001 ?auto_6000 ) ( not ( = ?auto_5997 ?auto_5998 ) ) ( not ( = ?auto_5997 ?auto_6004 ) ) ( not ( = ?auto_5998 ?auto_6004 ) ) ( not ( = ?auto_5999 ?auto_6003 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6001 ?auto_6000 ?auto_6002 )
      ( !LIFT ?auto_6003 ?auto_5998 ?auto_6004 ?auto_6002 )
      ( !LOAD ?auto_6003 ?auto_5998 ?auto_6001 ?auto_6002 )
      ( !DRIVE ?auto_6001 ?auto_6002 ?auto_6000 )
      ( !UNLOAD ?auto_5999 ?auto_5998 ?auto_6001 ?auto_6000 )
      ( !DROP ?auto_5999 ?auto_5998 ?auto_5997 ?auto_6000 )
      ( MAKE-1CRATE-VERIFY ?auto_5997 ?auto_5998 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6009 - SURFACE
      ?auto_6010 - SURFACE
      ?auto_6011 - SURFACE
      ?auto_6012 - SURFACE
    )
    :vars
    (
      ?auto_6015 - HOIST
      ?auto_6017 - PLACE
      ?auto_6013 - PLACE
      ?auto_6014 - HOIST
      ?auto_6018 - SURFACE
      ?auto_6019 - SURFACE
      ?auto_6020 - SURFACE
      ?auto_6016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6015 ?auto_6017 ) ( IS-CRATE ?auto_6012 ) ( not ( = ?auto_6013 ?auto_6017 ) ) ( HOIST-AT ?auto_6014 ?auto_6013 ) ( SURFACE-AT ?auto_6012 ?auto_6013 ) ( ON ?auto_6012 ?auto_6018 ) ( CLEAR ?auto_6012 ) ( not ( = ?auto_6011 ?auto_6012 ) ) ( not ( = ?auto_6011 ?auto_6018 ) ) ( not ( = ?auto_6012 ?auto_6018 ) ) ( not ( = ?auto_6015 ?auto_6014 ) ) ( IS-CRATE ?auto_6011 ) ( SURFACE-AT ?auto_6011 ?auto_6013 ) ( ON ?auto_6011 ?auto_6019 ) ( CLEAR ?auto_6011 ) ( not ( = ?auto_6010 ?auto_6011 ) ) ( not ( = ?auto_6010 ?auto_6019 ) ) ( not ( = ?auto_6011 ?auto_6019 ) ) ( SURFACE-AT ?auto_6009 ?auto_6017 ) ( CLEAR ?auto_6009 ) ( IS-CRATE ?auto_6010 ) ( AVAILABLE ?auto_6015 ) ( AVAILABLE ?auto_6014 ) ( SURFACE-AT ?auto_6010 ?auto_6013 ) ( ON ?auto_6010 ?auto_6020 ) ( CLEAR ?auto_6010 ) ( TRUCK-AT ?auto_6016 ?auto_6017 ) ( not ( = ?auto_6009 ?auto_6010 ) ) ( not ( = ?auto_6009 ?auto_6020 ) ) ( not ( = ?auto_6010 ?auto_6020 ) ) ( not ( = ?auto_6009 ?auto_6011 ) ) ( not ( = ?auto_6009 ?auto_6019 ) ) ( not ( = ?auto_6011 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6020 ) ) ( not ( = ?auto_6009 ?auto_6012 ) ) ( not ( = ?auto_6009 ?auto_6018 ) ) ( not ( = ?auto_6010 ?auto_6012 ) ) ( not ( = ?auto_6010 ?auto_6018 ) ) ( not ( = ?auto_6012 ?auto_6019 ) ) ( not ( = ?auto_6012 ?auto_6020 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6009 ?auto_6010 ?auto_6011 )
      ( MAKE-1CRATE ?auto_6011 ?auto_6012 )
      ( MAKE-3CRATE-VERIFY ?auto_6009 ?auto_6010 ?auto_6011 ?auto_6012 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6023 - SURFACE
      ?auto_6024 - SURFACE
    )
    :vars
    (
      ?auto_6025 - HOIST
      ?auto_6026 - PLACE
      ?auto_6028 - PLACE
      ?auto_6029 - HOIST
      ?auto_6030 - SURFACE
      ?auto_6027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6025 ?auto_6026 ) ( SURFACE-AT ?auto_6023 ?auto_6026 ) ( CLEAR ?auto_6023 ) ( IS-CRATE ?auto_6024 ) ( AVAILABLE ?auto_6025 ) ( not ( = ?auto_6028 ?auto_6026 ) ) ( HOIST-AT ?auto_6029 ?auto_6028 ) ( AVAILABLE ?auto_6029 ) ( SURFACE-AT ?auto_6024 ?auto_6028 ) ( ON ?auto_6024 ?auto_6030 ) ( CLEAR ?auto_6024 ) ( TRUCK-AT ?auto_6027 ?auto_6026 ) ( not ( = ?auto_6023 ?auto_6024 ) ) ( not ( = ?auto_6023 ?auto_6030 ) ) ( not ( = ?auto_6024 ?auto_6030 ) ) ( not ( = ?auto_6025 ?auto_6029 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6027 ?auto_6026 ?auto_6028 )
      ( !LIFT ?auto_6029 ?auto_6024 ?auto_6030 ?auto_6028 )
      ( !LOAD ?auto_6029 ?auto_6024 ?auto_6027 ?auto_6028 )
      ( !DRIVE ?auto_6027 ?auto_6028 ?auto_6026 )
      ( !UNLOAD ?auto_6025 ?auto_6024 ?auto_6027 ?auto_6026 )
      ( !DROP ?auto_6025 ?auto_6024 ?auto_6023 ?auto_6026 )
      ( MAKE-1CRATE-VERIFY ?auto_6023 ?auto_6024 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6036 - SURFACE
      ?auto_6037 - SURFACE
      ?auto_6038 - SURFACE
      ?auto_6039 - SURFACE
      ?auto_6040 - SURFACE
    )
    :vars
    (
      ?auto_6044 - HOIST
      ?auto_6046 - PLACE
      ?auto_6042 - PLACE
      ?auto_6043 - HOIST
      ?auto_6045 - SURFACE
      ?auto_6051 - PLACE
      ?auto_6050 - HOIST
      ?auto_6048 - SURFACE
      ?auto_6049 - SURFACE
      ?auto_6047 - SURFACE
      ?auto_6041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6044 ?auto_6046 ) ( IS-CRATE ?auto_6040 ) ( not ( = ?auto_6042 ?auto_6046 ) ) ( HOIST-AT ?auto_6043 ?auto_6042 ) ( AVAILABLE ?auto_6043 ) ( SURFACE-AT ?auto_6040 ?auto_6042 ) ( ON ?auto_6040 ?auto_6045 ) ( CLEAR ?auto_6040 ) ( not ( = ?auto_6039 ?auto_6040 ) ) ( not ( = ?auto_6039 ?auto_6045 ) ) ( not ( = ?auto_6040 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6043 ) ) ( IS-CRATE ?auto_6039 ) ( not ( = ?auto_6051 ?auto_6046 ) ) ( HOIST-AT ?auto_6050 ?auto_6051 ) ( SURFACE-AT ?auto_6039 ?auto_6051 ) ( ON ?auto_6039 ?auto_6048 ) ( CLEAR ?auto_6039 ) ( not ( = ?auto_6038 ?auto_6039 ) ) ( not ( = ?auto_6038 ?auto_6048 ) ) ( not ( = ?auto_6039 ?auto_6048 ) ) ( not ( = ?auto_6044 ?auto_6050 ) ) ( IS-CRATE ?auto_6038 ) ( SURFACE-AT ?auto_6038 ?auto_6051 ) ( ON ?auto_6038 ?auto_6049 ) ( CLEAR ?auto_6038 ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6049 ) ) ( not ( = ?auto_6038 ?auto_6049 ) ) ( SURFACE-AT ?auto_6036 ?auto_6046 ) ( CLEAR ?auto_6036 ) ( IS-CRATE ?auto_6037 ) ( AVAILABLE ?auto_6044 ) ( AVAILABLE ?auto_6050 ) ( SURFACE-AT ?auto_6037 ?auto_6051 ) ( ON ?auto_6037 ?auto_6047 ) ( CLEAR ?auto_6037 ) ( TRUCK-AT ?auto_6041 ?auto_6046 ) ( not ( = ?auto_6036 ?auto_6037 ) ) ( not ( = ?auto_6036 ?auto_6047 ) ) ( not ( = ?auto_6037 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6038 ) ) ( not ( = ?auto_6036 ?auto_6049 ) ) ( not ( = ?auto_6038 ?auto_6047 ) ) ( not ( = ?auto_6049 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6039 ) ) ( not ( = ?auto_6036 ?auto_6048 ) ) ( not ( = ?auto_6037 ?auto_6039 ) ) ( not ( = ?auto_6037 ?auto_6048 ) ) ( not ( = ?auto_6039 ?auto_6049 ) ) ( not ( = ?auto_6039 ?auto_6047 ) ) ( not ( = ?auto_6048 ?auto_6049 ) ) ( not ( = ?auto_6048 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6040 ) ) ( not ( = ?auto_6036 ?auto_6045 ) ) ( not ( = ?auto_6037 ?auto_6040 ) ) ( not ( = ?auto_6037 ?auto_6045 ) ) ( not ( = ?auto_6038 ?auto_6040 ) ) ( not ( = ?auto_6038 ?auto_6045 ) ) ( not ( = ?auto_6040 ?auto_6048 ) ) ( not ( = ?auto_6040 ?auto_6049 ) ) ( not ( = ?auto_6040 ?auto_6047 ) ) ( not ( = ?auto_6042 ?auto_6051 ) ) ( not ( = ?auto_6043 ?auto_6050 ) ) ( not ( = ?auto_6045 ?auto_6048 ) ) ( not ( = ?auto_6045 ?auto_6049 ) ) ( not ( = ?auto_6045 ?auto_6047 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6036 ?auto_6037 ?auto_6038 ?auto_6039 )
      ( MAKE-1CRATE ?auto_6039 ?auto_6040 )
      ( MAKE-4CRATE-VERIFY ?auto_6036 ?auto_6037 ?auto_6038 ?auto_6039 ?auto_6040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6054 - SURFACE
      ?auto_6055 - SURFACE
    )
    :vars
    (
      ?auto_6056 - HOIST
      ?auto_6057 - PLACE
      ?auto_6059 - PLACE
      ?auto_6060 - HOIST
      ?auto_6061 - SURFACE
      ?auto_6058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6056 ?auto_6057 ) ( SURFACE-AT ?auto_6054 ?auto_6057 ) ( CLEAR ?auto_6054 ) ( IS-CRATE ?auto_6055 ) ( AVAILABLE ?auto_6056 ) ( not ( = ?auto_6059 ?auto_6057 ) ) ( HOIST-AT ?auto_6060 ?auto_6059 ) ( AVAILABLE ?auto_6060 ) ( SURFACE-AT ?auto_6055 ?auto_6059 ) ( ON ?auto_6055 ?auto_6061 ) ( CLEAR ?auto_6055 ) ( TRUCK-AT ?auto_6058 ?auto_6057 ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6061 ) ) ( not ( = ?auto_6055 ?auto_6061 ) ) ( not ( = ?auto_6056 ?auto_6060 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6058 ?auto_6057 ?auto_6059 )
      ( !LIFT ?auto_6060 ?auto_6055 ?auto_6061 ?auto_6059 )
      ( !LOAD ?auto_6060 ?auto_6055 ?auto_6058 ?auto_6059 )
      ( !DRIVE ?auto_6058 ?auto_6059 ?auto_6057 )
      ( !UNLOAD ?auto_6056 ?auto_6055 ?auto_6058 ?auto_6057 )
      ( !DROP ?auto_6056 ?auto_6055 ?auto_6054 ?auto_6057 )
      ( MAKE-1CRATE-VERIFY ?auto_6054 ?auto_6055 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6068 - SURFACE
      ?auto_6069 - SURFACE
      ?auto_6070 - SURFACE
      ?auto_6071 - SURFACE
      ?auto_6072 - SURFACE
      ?auto_6073 - SURFACE
    )
    :vars
    (
      ?auto_6076 - HOIST
      ?auto_6077 - PLACE
      ?auto_6075 - PLACE
      ?auto_6074 - HOIST
      ?auto_6078 - SURFACE
      ?auto_6083 - PLACE
      ?auto_6080 - HOIST
      ?auto_6084 - SURFACE
      ?auto_6086 - PLACE
      ?auto_6082 - HOIST
      ?auto_6081 - SURFACE
      ?auto_6087 - SURFACE
      ?auto_6085 - SURFACE
      ?auto_6079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6076 ?auto_6077 ) ( IS-CRATE ?auto_6073 ) ( not ( = ?auto_6075 ?auto_6077 ) ) ( HOIST-AT ?auto_6074 ?auto_6075 ) ( AVAILABLE ?auto_6074 ) ( SURFACE-AT ?auto_6073 ?auto_6075 ) ( ON ?auto_6073 ?auto_6078 ) ( CLEAR ?auto_6073 ) ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6078 ) ) ( not ( = ?auto_6073 ?auto_6078 ) ) ( not ( = ?auto_6076 ?auto_6074 ) ) ( IS-CRATE ?auto_6072 ) ( not ( = ?auto_6083 ?auto_6077 ) ) ( HOIST-AT ?auto_6080 ?auto_6083 ) ( AVAILABLE ?auto_6080 ) ( SURFACE-AT ?auto_6072 ?auto_6083 ) ( ON ?auto_6072 ?auto_6084 ) ( CLEAR ?auto_6072 ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6084 ) ) ( not ( = ?auto_6072 ?auto_6084 ) ) ( not ( = ?auto_6076 ?auto_6080 ) ) ( IS-CRATE ?auto_6071 ) ( not ( = ?auto_6086 ?auto_6077 ) ) ( HOIST-AT ?auto_6082 ?auto_6086 ) ( SURFACE-AT ?auto_6071 ?auto_6086 ) ( ON ?auto_6071 ?auto_6081 ) ( CLEAR ?auto_6071 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6081 ) ) ( not ( = ?auto_6071 ?auto_6081 ) ) ( not ( = ?auto_6076 ?auto_6082 ) ) ( IS-CRATE ?auto_6070 ) ( SURFACE-AT ?auto_6070 ?auto_6086 ) ( ON ?auto_6070 ?auto_6087 ) ( CLEAR ?auto_6070 ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( not ( = ?auto_6069 ?auto_6087 ) ) ( not ( = ?auto_6070 ?auto_6087 ) ) ( SURFACE-AT ?auto_6068 ?auto_6077 ) ( CLEAR ?auto_6068 ) ( IS-CRATE ?auto_6069 ) ( AVAILABLE ?auto_6076 ) ( AVAILABLE ?auto_6082 ) ( SURFACE-AT ?auto_6069 ?auto_6086 ) ( ON ?auto_6069 ?auto_6085 ) ( CLEAR ?auto_6069 ) ( TRUCK-AT ?auto_6079 ?auto_6077 ) ( not ( = ?auto_6068 ?auto_6069 ) ) ( not ( = ?auto_6068 ?auto_6085 ) ) ( not ( = ?auto_6069 ?auto_6085 ) ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6068 ?auto_6087 ) ) ( not ( = ?auto_6070 ?auto_6085 ) ) ( not ( = ?auto_6087 ?auto_6085 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6068 ?auto_6081 ) ) ( not ( = ?auto_6069 ?auto_6071 ) ) ( not ( = ?auto_6069 ?auto_6081 ) ) ( not ( = ?auto_6071 ?auto_6087 ) ) ( not ( = ?auto_6071 ?auto_6085 ) ) ( not ( = ?auto_6081 ?auto_6087 ) ) ( not ( = ?auto_6081 ?auto_6085 ) ) ( not ( = ?auto_6068 ?auto_6072 ) ) ( not ( = ?auto_6068 ?auto_6084 ) ) ( not ( = ?auto_6069 ?auto_6072 ) ) ( not ( = ?auto_6069 ?auto_6084 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6084 ) ) ( not ( = ?auto_6072 ?auto_6081 ) ) ( not ( = ?auto_6072 ?auto_6087 ) ) ( not ( = ?auto_6072 ?auto_6085 ) ) ( not ( = ?auto_6083 ?auto_6086 ) ) ( not ( = ?auto_6080 ?auto_6082 ) ) ( not ( = ?auto_6084 ?auto_6081 ) ) ( not ( = ?auto_6084 ?auto_6087 ) ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6068 ?auto_6073 ) ) ( not ( = ?auto_6068 ?auto_6078 ) ) ( not ( = ?auto_6069 ?auto_6073 ) ) ( not ( = ?auto_6069 ?auto_6078 ) ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6070 ?auto_6078 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6078 ) ) ( not ( = ?auto_6073 ?auto_6084 ) ) ( not ( = ?auto_6073 ?auto_6081 ) ) ( not ( = ?auto_6073 ?auto_6087 ) ) ( not ( = ?auto_6073 ?auto_6085 ) ) ( not ( = ?auto_6075 ?auto_6083 ) ) ( not ( = ?auto_6075 ?auto_6086 ) ) ( not ( = ?auto_6074 ?auto_6080 ) ) ( not ( = ?auto_6074 ?auto_6082 ) ) ( not ( = ?auto_6078 ?auto_6084 ) ) ( not ( = ?auto_6078 ?auto_6081 ) ) ( not ( = ?auto_6078 ?auto_6087 ) ) ( not ( = ?auto_6078 ?auto_6085 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6068 ?auto_6069 ?auto_6070 ?auto_6071 ?auto_6072 )
      ( MAKE-1CRATE ?auto_6072 ?auto_6073 )
      ( MAKE-5CRATE-VERIFY ?auto_6068 ?auto_6069 ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6090 - SURFACE
      ?auto_6091 - SURFACE
    )
    :vars
    (
      ?auto_6092 - HOIST
      ?auto_6093 - PLACE
      ?auto_6095 - PLACE
      ?auto_6096 - HOIST
      ?auto_6097 - SURFACE
      ?auto_6094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6092 ?auto_6093 ) ( SURFACE-AT ?auto_6090 ?auto_6093 ) ( CLEAR ?auto_6090 ) ( IS-CRATE ?auto_6091 ) ( AVAILABLE ?auto_6092 ) ( not ( = ?auto_6095 ?auto_6093 ) ) ( HOIST-AT ?auto_6096 ?auto_6095 ) ( AVAILABLE ?auto_6096 ) ( SURFACE-AT ?auto_6091 ?auto_6095 ) ( ON ?auto_6091 ?auto_6097 ) ( CLEAR ?auto_6091 ) ( TRUCK-AT ?auto_6094 ?auto_6093 ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( not ( = ?auto_6090 ?auto_6097 ) ) ( not ( = ?auto_6091 ?auto_6097 ) ) ( not ( = ?auto_6092 ?auto_6096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6094 ?auto_6093 ?auto_6095 )
      ( !LIFT ?auto_6096 ?auto_6091 ?auto_6097 ?auto_6095 )
      ( !LOAD ?auto_6096 ?auto_6091 ?auto_6094 ?auto_6095 )
      ( !DRIVE ?auto_6094 ?auto_6095 ?auto_6093 )
      ( !UNLOAD ?auto_6092 ?auto_6091 ?auto_6094 ?auto_6093 )
      ( !DROP ?auto_6092 ?auto_6091 ?auto_6090 ?auto_6093 )
      ( MAKE-1CRATE-VERIFY ?auto_6090 ?auto_6091 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6105 - SURFACE
      ?auto_6106 - SURFACE
      ?auto_6107 - SURFACE
      ?auto_6108 - SURFACE
      ?auto_6109 - SURFACE
      ?auto_6111 - SURFACE
      ?auto_6110 - SURFACE
    )
    :vars
    (
      ?auto_6112 - HOIST
      ?auto_6114 - PLACE
      ?auto_6116 - PLACE
      ?auto_6117 - HOIST
      ?auto_6115 - SURFACE
      ?auto_6125 - PLACE
      ?auto_6126 - HOIST
      ?auto_6118 - SURFACE
      ?auto_6124 - PLACE
      ?auto_6119 - HOIST
      ?auto_6122 - SURFACE
      ?auto_6121 - SURFACE
      ?auto_6123 - SURFACE
      ?auto_6120 - SURFACE
      ?auto_6113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6112 ?auto_6114 ) ( IS-CRATE ?auto_6110 ) ( not ( = ?auto_6116 ?auto_6114 ) ) ( HOIST-AT ?auto_6117 ?auto_6116 ) ( SURFACE-AT ?auto_6110 ?auto_6116 ) ( ON ?auto_6110 ?auto_6115 ) ( CLEAR ?auto_6110 ) ( not ( = ?auto_6111 ?auto_6110 ) ) ( not ( = ?auto_6111 ?auto_6115 ) ) ( not ( = ?auto_6110 ?auto_6115 ) ) ( not ( = ?auto_6112 ?auto_6117 ) ) ( IS-CRATE ?auto_6111 ) ( not ( = ?auto_6125 ?auto_6114 ) ) ( HOIST-AT ?auto_6126 ?auto_6125 ) ( AVAILABLE ?auto_6126 ) ( SURFACE-AT ?auto_6111 ?auto_6125 ) ( ON ?auto_6111 ?auto_6118 ) ( CLEAR ?auto_6111 ) ( not ( = ?auto_6109 ?auto_6111 ) ) ( not ( = ?auto_6109 ?auto_6118 ) ) ( not ( = ?auto_6111 ?auto_6118 ) ) ( not ( = ?auto_6112 ?auto_6126 ) ) ( IS-CRATE ?auto_6109 ) ( not ( = ?auto_6124 ?auto_6114 ) ) ( HOIST-AT ?auto_6119 ?auto_6124 ) ( AVAILABLE ?auto_6119 ) ( SURFACE-AT ?auto_6109 ?auto_6124 ) ( ON ?auto_6109 ?auto_6122 ) ( CLEAR ?auto_6109 ) ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6122 ) ) ( not ( = ?auto_6109 ?auto_6122 ) ) ( not ( = ?auto_6112 ?auto_6119 ) ) ( IS-CRATE ?auto_6108 ) ( SURFACE-AT ?auto_6108 ?auto_6116 ) ( ON ?auto_6108 ?auto_6121 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6107 ?auto_6121 ) ) ( not ( = ?auto_6108 ?auto_6121 ) ) ( IS-CRATE ?auto_6107 ) ( SURFACE-AT ?auto_6107 ?auto_6116 ) ( ON ?auto_6107 ?auto_6123 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6123 ) ) ( not ( = ?auto_6107 ?auto_6123 ) ) ( SURFACE-AT ?auto_6105 ?auto_6114 ) ( CLEAR ?auto_6105 ) ( IS-CRATE ?auto_6106 ) ( AVAILABLE ?auto_6112 ) ( AVAILABLE ?auto_6117 ) ( SURFACE-AT ?auto_6106 ?auto_6116 ) ( ON ?auto_6106 ?auto_6120 ) ( CLEAR ?auto_6106 ) ( TRUCK-AT ?auto_6113 ?auto_6114 ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6120 ) ) ( not ( = ?auto_6106 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6123 ) ) ( not ( = ?auto_6107 ?auto_6120 ) ) ( not ( = ?auto_6123 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6108 ) ) ( not ( = ?auto_6105 ?auto_6121 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6121 ) ) ( not ( = ?auto_6108 ?auto_6123 ) ) ( not ( = ?auto_6108 ?auto_6120 ) ) ( not ( = ?auto_6121 ?auto_6123 ) ) ( not ( = ?auto_6121 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6109 ) ) ( not ( = ?auto_6105 ?auto_6122 ) ) ( not ( = ?auto_6106 ?auto_6109 ) ) ( not ( = ?auto_6106 ?auto_6122 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6122 ) ) ( not ( = ?auto_6109 ?auto_6121 ) ) ( not ( = ?auto_6109 ?auto_6123 ) ) ( not ( = ?auto_6109 ?auto_6120 ) ) ( not ( = ?auto_6124 ?auto_6116 ) ) ( not ( = ?auto_6119 ?auto_6117 ) ) ( not ( = ?auto_6122 ?auto_6121 ) ) ( not ( = ?auto_6122 ?auto_6123 ) ) ( not ( = ?auto_6122 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6111 ) ) ( not ( = ?auto_6105 ?auto_6118 ) ) ( not ( = ?auto_6106 ?auto_6111 ) ) ( not ( = ?auto_6106 ?auto_6118 ) ) ( not ( = ?auto_6107 ?auto_6111 ) ) ( not ( = ?auto_6107 ?auto_6118 ) ) ( not ( = ?auto_6108 ?auto_6111 ) ) ( not ( = ?auto_6108 ?auto_6118 ) ) ( not ( = ?auto_6111 ?auto_6122 ) ) ( not ( = ?auto_6111 ?auto_6121 ) ) ( not ( = ?auto_6111 ?auto_6123 ) ) ( not ( = ?auto_6111 ?auto_6120 ) ) ( not ( = ?auto_6125 ?auto_6124 ) ) ( not ( = ?auto_6125 ?auto_6116 ) ) ( not ( = ?auto_6126 ?auto_6119 ) ) ( not ( = ?auto_6126 ?auto_6117 ) ) ( not ( = ?auto_6118 ?auto_6122 ) ) ( not ( = ?auto_6118 ?auto_6121 ) ) ( not ( = ?auto_6118 ?auto_6123 ) ) ( not ( = ?auto_6118 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6110 ) ) ( not ( = ?auto_6105 ?auto_6115 ) ) ( not ( = ?auto_6106 ?auto_6110 ) ) ( not ( = ?auto_6106 ?auto_6115 ) ) ( not ( = ?auto_6107 ?auto_6110 ) ) ( not ( = ?auto_6107 ?auto_6115 ) ) ( not ( = ?auto_6108 ?auto_6110 ) ) ( not ( = ?auto_6108 ?auto_6115 ) ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6115 ) ) ( not ( = ?auto_6110 ?auto_6118 ) ) ( not ( = ?auto_6110 ?auto_6122 ) ) ( not ( = ?auto_6110 ?auto_6121 ) ) ( not ( = ?auto_6110 ?auto_6123 ) ) ( not ( = ?auto_6110 ?auto_6120 ) ) ( not ( = ?auto_6115 ?auto_6118 ) ) ( not ( = ?auto_6115 ?auto_6122 ) ) ( not ( = ?auto_6115 ?auto_6121 ) ) ( not ( = ?auto_6115 ?auto_6123 ) ) ( not ( = ?auto_6115 ?auto_6120 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ?auto_6111 )
      ( MAKE-1CRATE ?auto_6111 ?auto_6110 )
      ( MAKE-6CRATE-VERIFY ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ?auto_6111 ?auto_6110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6129 - SURFACE
      ?auto_6130 - SURFACE
    )
    :vars
    (
      ?auto_6131 - HOIST
      ?auto_6132 - PLACE
      ?auto_6134 - PLACE
      ?auto_6135 - HOIST
      ?auto_6136 - SURFACE
      ?auto_6133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6131 ?auto_6132 ) ( SURFACE-AT ?auto_6129 ?auto_6132 ) ( CLEAR ?auto_6129 ) ( IS-CRATE ?auto_6130 ) ( AVAILABLE ?auto_6131 ) ( not ( = ?auto_6134 ?auto_6132 ) ) ( HOIST-AT ?auto_6135 ?auto_6134 ) ( AVAILABLE ?auto_6135 ) ( SURFACE-AT ?auto_6130 ?auto_6134 ) ( ON ?auto_6130 ?auto_6136 ) ( CLEAR ?auto_6130 ) ( TRUCK-AT ?auto_6133 ?auto_6132 ) ( not ( = ?auto_6129 ?auto_6130 ) ) ( not ( = ?auto_6129 ?auto_6136 ) ) ( not ( = ?auto_6130 ?auto_6136 ) ) ( not ( = ?auto_6131 ?auto_6135 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6133 ?auto_6132 ?auto_6134 )
      ( !LIFT ?auto_6135 ?auto_6130 ?auto_6136 ?auto_6134 )
      ( !LOAD ?auto_6135 ?auto_6130 ?auto_6133 ?auto_6134 )
      ( !DRIVE ?auto_6133 ?auto_6134 ?auto_6132 )
      ( !UNLOAD ?auto_6131 ?auto_6130 ?auto_6133 ?auto_6132 )
      ( !DROP ?auto_6131 ?auto_6130 ?auto_6129 ?auto_6132 )
      ( MAKE-1CRATE-VERIFY ?auto_6129 ?auto_6130 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6145 - SURFACE
      ?auto_6146 - SURFACE
      ?auto_6147 - SURFACE
      ?auto_6148 - SURFACE
      ?auto_6149 - SURFACE
      ?auto_6151 - SURFACE
      ?auto_6150 - SURFACE
      ?auto_6152 - SURFACE
    )
    :vars
    (
      ?auto_6155 - HOIST
      ?auto_6158 - PLACE
      ?auto_6157 - PLACE
      ?auto_6154 - HOIST
      ?auto_6156 - SURFACE
      ?auto_6159 - PLACE
      ?auto_6161 - HOIST
      ?auto_6160 - SURFACE
      ?auto_6166 - PLACE
      ?auto_6165 - HOIST
      ?auto_6170 - SURFACE
      ?auto_6167 - PLACE
      ?auto_6164 - HOIST
      ?auto_6169 - SURFACE
      ?auto_6163 - SURFACE
      ?auto_6168 - SURFACE
      ?auto_6162 - SURFACE
      ?auto_6153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6155 ?auto_6158 ) ( IS-CRATE ?auto_6152 ) ( not ( = ?auto_6157 ?auto_6158 ) ) ( HOIST-AT ?auto_6154 ?auto_6157 ) ( AVAILABLE ?auto_6154 ) ( SURFACE-AT ?auto_6152 ?auto_6157 ) ( ON ?auto_6152 ?auto_6156 ) ( CLEAR ?auto_6152 ) ( not ( = ?auto_6150 ?auto_6152 ) ) ( not ( = ?auto_6150 ?auto_6156 ) ) ( not ( = ?auto_6152 ?auto_6156 ) ) ( not ( = ?auto_6155 ?auto_6154 ) ) ( IS-CRATE ?auto_6150 ) ( not ( = ?auto_6159 ?auto_6158 ) ) ( HOIST-AT ?auto_6161 ?auto_6159 ) ( SURFACE-AT ?auto_6150 ?auto_6159 ) ( ON ?auto_6150 ?auto_6160 ) ( CLEAR ?auto_6150 ) ( not ( = ?auto_6151 ?auto_6150 ) ) ( not ( = ?auto_6151 ?auto_6160 ) ) ( not ( = ?auto_6150 ?auto_6160 ) ) ( not ( = ?auto_6155 ?auto_6161 ) ) ( IS-CRATE ?auto_6151 ) ( not ( = ?auto_6166 ?auto_6158 ) ) ( HOIST-AT ?auto_6165 ?auto_6166 ) ( AVAILABLE ?auto_6165 ) ( SURFACE-AT ?auto_6151 ?auto_6166 ) ( ON ?auto_6151 ?auto_6170 ) ( CLEAR ?auto_6151 ) ( not ( = ?auto_6149 ?auto_6151 ) ) ( not ( = ?auto_6149 ?auto_6170 ) ) ( not ( = ?auto_6151 ?auto_6170 ) ) ( not ( = ?auto_6155 ?auto_6165 ) ) ( IS-CRATE ?auto_6149 ) ( not ( = ?auto_6167 ?auto_6158 ) ) ( HOIST-AT ?auto_6164 ?auto_6167 ) ( AVAILABLE ?auto_6164 ) ( SURFACE-AT ?auto_6149 ?auto_6167 ) ( ON ?auto_6149 ?auto_6169 ) ( CLEAR ?auto_6149 ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6169 ) ) ( not ( = ?auto_6149 ?auto_6169 ) ) ( not ( = ?auto_6155 ?auto_6164 ) ) ( IS-CRATE ?auto_6148 ) ( SURFACE-AT ?auto_6148 ?auto_6159 ) ( ON ?auto_6148 ?auto_6163 ) ( CLEAR ?auto_6148 ) ( not ( = ?auto_6147 ?auto_6148 ) ) ( not ( = ?auto_6147 ?auto_6163 ) ) ( not ( = ?auto_6148 ?auto_6163 ) ) ( IS-CRATE ?auto_6147 ) ( SURFACE-AT ?auto_6147 ?auto_6159 ) ( ON ?auto_6147 ?auto_6168 ) ( CLEAR ?auto_6147 ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6168 ) ) ( not ( = ?auto_6147 ?auto_6168 ) ) ( SURFACE-AT ?auto_6145 ?auto_6158 ) ( CLEAR ?auto_6145 ) ( IS-CRATE ?auto_6146 ) ( AVAILABLE ?auto_6155 ) ( AVAILABLE ?auto_6161 ) ( SURFACE-AT ?auto_6146 ?auto_6159 ) ( ON ?auto_6146 ?auto_6162 ) ( CLEAR ?auto_6146 ) ( TRUCK-AT ?auto_6153 ?auto_6158 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6162 ) ) ( not ( = ?auto_6146 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6145 ?auto_6168 ) ) ( not ( = ?auto_6147 ?auto_6162 ) ) ( not ( = ?auto_6168 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6163 ) ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6163 ) ) ( not ( = ?auto_6148 ?auto_6168 ) ) ( not ( = ?auto_6148 ?auto_6162 ) ) ( not ( = ?auto_6163 ?auto_6168 ) ) ( not ( = ?auto_6163 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6149 ) ) ( not ( = ?auto_6145 ?auto_6169 ) ) ( not ( = ?auto_6146 ?auto_6149 ) ) ( not ( = ?auto_6146 ?auto_6169 ) ) ( not ( = ?auto_6147 ?auto_6149 ) ) ( not ( = ?auto_6147 ?auto_6169 ) ) ( not ( = ?auto_6149 ?auto_6163 ) ) ( not ( = ?auto_6149 ?auto_6168 ) ) ( not ( = ?auto_6149 ?auto_6162 ) ) ( not ( = ?auto_6167 ?auto_6159 ) ) ( not ( = ?auto_6164 ?auto_6161 ) ) ( not ( = ?auto_6169 ?auto_6163 ) ) ( not ( = ?auto_6169 ?auto_6168 ) ) ( not ( = ?auto_6169 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6151 ) ) ( not ( = ?auto_6145 ?auto_6170 ) ) ( not ( = ?auto_6146 ?auto_6151 ) ) ( not ( = ?auto_6146 ?auto_6170 ) ) ( not ( = ?auto_6147 ?auto_6151 ) ) ( not ( = ?auto_6147 ?auto_6170 ) ) ( not ( = ?auto_6148 ?auto_6151 ) ) ( not ( = ?auto_6148 ?auto_6170 ) ) ( not ( = ?auto_6151 ?auto_6169 ) ) ( not ( = ?auto_6151 ?auto_6163 ) ) ( not ( = ?auto_6151 ?auto_6168 ) ) ( not ( = ?auto_6151 ?auto_6162 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6159 ) ) ( not ( = ?auto_6165 ?auto_6164 ) ) ( not ( = ?auto_6165 ?auto_6161 ) ) ( not ( = ?auto_6170 ?auto_6169 ) ) ( not ( = ?auto_6170 ?auto_6163 ) ) ( not ( = ?auto_6170 ?auto_6168 ) ) ( not ( = ?auto_6170 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6150 ) ) ( not ( = ?auto_6145 ?auto_6160 ) ) ( not ( = ?auto_6146 ?auto_6150 ) ) ( not ( = ?auto_6146 ?auto_6160 ) ) ( not ( = ?auto_6147 ?auto_6150 ) ) ( not ( = ?auto_6147 ?auto_6160 ) ) ( not ( = ?auto_6148 ?auto_6150 ) ) ( not ( = ?auto_6148 ?auto_6160 ) ) ( not ( = ?auto_6149 ?auto_6150 ) ) ( not ( = ?auto_6149 ?auto_6160 ) ) ( not ( = ?auto_6150 ?auto_6170 ) ) ( not ( = ?auto_6150 ?auto_6169 ) ) ( not ( = ?auto_6150 ?auto_6163 ) ) ( not ( = ?auto_6150 ?auto_6168 ) ) ( not ( = ?auto_6150 ?auto_6162 ) ) ( not ( = ?auto_6160 ?auto_6170 ) ) ( not ( = ?auto_6160 ?auto_6169 ) ) ( not ( = ?auto_6160 ?auto_6163 ) ) ( not ( = ?auto_6160 ?auto_6168 ) ) ( not ( = ?auto_6160 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6152 ) ) ( not ( = ?auto_6145 ?auto_6156 ) ) ( not ( = ?auto_6146 ?auto_6152 ) ) ( not ( = ?auto_6146 ?auto_6156 ) ) ( not ( = ?auto_6147 ?auto_6152 ) ) ( not ( = ?auto_6147 ?auto_6156 ) ) ( not ( = ?auto_6148 ?auto_6152 ) ) ( not ( = ?auto_6148 ?auto_6156 ) ) ( not ( = ?auto_6149 ?auto_6152 ) ) ( not ( = ?auto_6149 ?auto_6156 ) ) ( not ( = ?auto_6151 ?auto_6152 ) ) ( not ( = ?auto_6151 ?auto_6156 ) ) ( not ( = ?auto_6152 ?auto_6160 ) ) ( not ( = ?auto_6152 ?auto_6170 ) ) ( not ( = ?auto_6152 ?auto_6169 ) ) ( not ( = ?auto_6152 ?auto_6163 ) ) ( not ( = ?auto_6152 ?auto_6168 ) ) ( not ( = ?auto_6152 ?auto_6162 ) ) ( not ( = ?auto_6157 ?auto_6159 ) ) ( not ( = ?auto_6157 ?auto_6166 ) ) ( not ( = ?auto_6157 ?auto_6167 ) ) ( not ( = ?auto_6154 ?auto_6161 ) ) ( not ( = ?auto_6154 ?auto_6165 ) ) ( not ( = ?auto_6154 ?auto_6164 ) ) ( not ( = ?auto_6156 ?auto_6160 ) ) ( not ( = ?auto_6156 ?auto_6170 ) ) ( not ( = ?auto_6156 ?auto_6169 ) ) ( not ( = ?auto_6156 ?auto_6163 ) ) ( not ( = ?auto_6156 ?auto_6168 ) ) ( not ( = ?auto_6156 ?auto_6162 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ?auto_6151 ?auto_6150 )
      ( MAKE-1CRATE ?auto_6150 ?auto_6152 )
      ( MAKE-7CRATE-VERIFY ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ?auto_6151 ?auto_6150 ?auto_6152 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6173 - SURFACE
      ?auto_6174 - SURFACE
    )
    :vars
    (
      ?auto_6175 - HOIST
      ?auto_6176 - PLACE
      ?auto_6178 - PLACE
      ?auto_6179 - HOIST
      ?auto_6180 - SURFACE
      ?auto_6177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6175 ?auto_6176 ) ( SURFACE-AT ?auto_6173 ?auto_6176 ) ( CLEAR ?auto_6173 ) ( IS-CRATE ?auto_6174 ) ( AVAILABLE ?auto_6175 ) ( not ( = ?auto_6178 ?auto_6176 ) ) ( HOIST-AT ?auto_6179 ?auto_6178 ) ( AVAILABLE ?auto_6179 ) ( SURFACE-AT ?auto_6174 ?auto_6178 ) ( ON ?auto_6174 ?auto_6180 ) ( CLEAR ?auto_6174 ) ( TRUCK-AT ?auto_6177 ?auto_6176 ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6173 ?auto_6180 ) ) ( not ( = ?auto_6174 ?auto_6180 ) ) ( not ( = ?auto_6175 ?auto_6179 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6177 ?auto_6176 ?auto_6178 )
      ( !LIFT ?auto_6179 ?auto_6174 ?auto_6180 ?auto_6178 )
      ( !LOAD ?auto_6179 ?auto_6174 ?auto_6177 ?auto_6178 )
      ( !DRIVE ?auto_6177 ?auto_6178 ?auto_6176 )
      ( !UNLOAD ?auto_6175 ?auto_6174 ?auto_6177 ?auto_6176 )
      ( !DROP ?auto_6175 ?auto_6174 ?auto_6173 ?auto_6176 )
      ( MAKE-1CRATE-VERIFY ?auto_6173 ?auto_6174 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6190 - SURFACE
      ?auto_6191 - SURFACE
      ?auto_6192 - SURFACE
      ?auto_6193 - SURFACE
      ?auto_6194 - SURFACE
      ?auto_6196 - SURFACE
      ?auto_6195 - SURFACE
      ?auto_6198 - SURFACE
      ?auto_6197 - SURFACE
    )
    :vars
    (
      ?auto_6202 - HOIST
      ?auto_6201 - PLACE
      ?auto_6204 - PLACE
      ?auto_6200 - HOIST
      ?auto_6199 - SURFACE
      ?auto_6214 - PLACE
      ?auto_6213 - HOIST
      ?auto_6212 - SURFACE
      ?auto_6217 - PLACE
      ?auto_6215 - HOIST
      ?auto_6216 - SURFACE
      ?auto_6208 - PLACE
      ?auto_6209 - HOIST
      ?auto_6207 - SURFACE
      ?auto_6205 - SURFACE
      ?auto_6210 - SURFACE
      ?auto_6206 - SURFACE
      ?auto_6211 - SURFACE
      ?auto_6203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6202 ?auto_6201 ) ( IS-CRATE ?auto_6197 ) ( not ( = ?auto_6204 ?auto_6201 ) ) ( HOIST-AT ?auto_6200 ?auto_6204 ) ( SURFACE-AT ?auto_6197 ?auto_6204 ) ( ON ?auto_6197 ?auto_6199 ) ( CLEAR ?auto_6197 ) ( not ( = ?auto_6198 ?auto_6197 ) ) ( not ( = ?auto_6198 ?auto_6199 ) ) ( not ( = ?auto_6197 ?auto_6199 ) ) ( not ( = ?auto_6202 ?auto_6200 ) ) ( IS-CRATE ?auto_6198 ) ( not ( = ?auto_6214 ?auto_6201 ) ) ( HOIST-AT ?auto_6213 ?auto_6214 ) ( AVAILABLE ?auto_6213 ) ( SURFACE-AT ?auto_6198 ?auto_6214 ) ( ON ?auto_6198 ?auto_6212 ) ( CLEAR ?auto_6198 ) ( not ( = ?auto_6195 ?auto_6198 ) ) ( not ( = ?auto_6195 ?auto_6212 ) ) ( not ( = ?auto_6198 ?auto_6212 ) ) ( not ( = ?auto_6202 ?auto_6213 ) ) ( IS-CRATE ?auto_6195 ) ( not ( = ?auto_6217 ?auto_6201 ) ) ( HOIST-AT ?auto_6215 ?auto_6217 ) ( SURFACE-AT ?auto_6195 ?auto_6217 ) ( ON ?auto_6195 ?auto_6216 ) ( CLEAR ?auto_6195 ) ( not ( = ?auto_6196 ?auto_6195 ) ) ( not ( = ?auto_6196 ?auto_6216 ) ) ( not ( = ?auto_6195 ?auto_6216 ) ) ( not ( = ?auto_6202 ?auto_6215 ) ) ( IS-CRATE ?auto_6196 ) ( not ( = ?auto_6208 ?auto_6201 ) ) ( HOIST-AT ?auto_6209 ?auto_6208 ) ( AVAILABLE ?auto_6209 ) ( SURFACE-AT ?auto_6196 ?auto_6208 ) ( ON ?auto_6196 ?auto_6207 ) ( CLEAR ?auto_6196 ) ( not ( = ?auto_6194 ?auto_6196 ) ) ( not ( = ?auto_6194 ?auto_6207 ) ) ( not ( = ?auto_6196 ?auto_6207 ) ) ( not ( = ?auto_6202 ?auto_6209 ) ) ( IS-CRATE ?auto_6194 ) ( AVAILABLE ?auto_6200 ) ( SURFACE-AT ?auto_6194 ?auto_6204 ) ( ON ?auto_6194 ?auto_6205 ) ( CLEAR ?auto_6194 ) ( not ( = ?auto_6193 ?auto_6194 ) ) ( not ( = ?auto_6193 ?auto_6205 ) ) ( not ( = ?auto_6194 ?auto_6205 ) ) ( IS-CRATE ?auto_6193 ) ( SURFACE-AT ?auto_6193 ?auto_6217 ) ( ON ?auto_6193 ?auto_6210 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( not ( = ?auto_6192 ?auto_6210 ) ) ( not ( = ?auto_6193 ?auto_6210 ) ) ( IS-CRATE ?auto_6192 ) ( SURFACE-AT ?auto_6192 ?auto_6217 ) ( ON ?auto_6192 ?auto_6206 ) ( CLEAR ?auto_6192 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6191 ?auto_6206 ) ) ( not ( = ?auto_6192 ?auto_6206 ) ) ( SURFACE-AT ?auto_6190 ?auto_6201 ) ( CLEAR ?auto_6190 ) ( IS-CRATE ?auto_6191 ) ( AVAILABLE ?auto_6202 ) ( AVAILABLE ?auto_6215 ) ( SURFACE-AT ?auto_6191 ?auto_6217 ) ( ON ?auto_6191 ?auto_6211 ) ( CLEAR ?auto_6191 ) ( TRUCK-AT ?auto_6203 ?auto_6201 ) ( not ( = ?auto_6190 ?auto_6191 ) ) ( not ( = ?auto_6190 ?auto_6211 ) ) ( not ( = ?auto_6191 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6192 ) ) ( not ( = ?auto_6190 ?auto_6206 ) ) ( not ( = ?auto_6192 ?auto_6211 ) ) ( not ( = ?auto_6206 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6193 ) ) ( not ( = ?auto_6190 ?auto_6210 ) ) ( not ( = ?auto_6191 ?auto_6193 ) ) ( not ( = ?auto_6191 ?auto_6210 ) ) ( not ( = ?auto_6193 ?auto_6206 ) ) ( not ( = ?auto_6193 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6206 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6194 ) ) ( not ( = ?auto_6190 ?auto_6205 ) ) ( not ( = ?auto_6191 ?auto_6194 ) ) ( not ( = ?auto_6191 ?auto_6205 ) ) ( not ( = ?auto_6192 ?auto_6194 ) ) ( not ( = ?auto_6192 ?auto_6205 ) ) ( not ( = ?auto_6194 ?auto_6210 ) ) ( not ( = ?auto_6194 ?auto_6206 ) ) ( not ( = ?auto_6194 ?auto_6211 ) ) ( not ( = ?auto_6204 ?auto_6217 ) ) ( not ( = ?auto_6200 ?auto_6215 ) ) ( not ( = ?auto_6205 ?auto_6210 ) ) ( not ( = ?auto_6205 ?auto_6206 ) ) ( not ( = ?auto_6205 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6196 ) ) ( not ( = ?auto_6190 ?auto_6207 ) ) ( not ( = ?auto_6191 ?auto_6196 ) ) ( not ( = ?auto_6191 ?auto_6207 ) ) ( not ( = ?auto_6192 ?auto_6196 ) ) ( not ( = ?auto_6192 ?auto_6207 ) ) ( not ( = ?auto_6193 ?auto_6196 ) ) ( not ( = ?auto_6193 ?auto_6207 ) ) ( not ( = ?auto_6196 ?auto_6205 ) ) ( not ( = ?auto_6196 ?auto_6210 ) ) ( not ( = ?auto_6196 ?auto_6206 ) ) ( not ( = ?auto_6196 ?auto_6211 ) ) ( not ( = ?auto_6208 ?auto_6204 ) ) ( not ( = ?auto_6208 ?auto_6217 ) ) ( not ( = ?auto_6209 ?auto_6200 ) ) ( not ( = ?auto_6209 ?auto_6215 ) ) ( not ( = ?auto_6207 ?auto_6205 ) ) ( not ( = ?auto_6207 ?auto_6210 ) ) ( not ( = ?auto_6207 ?auto_6206 ) ) ( not ( = ?auto_6207 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6195 ) ) ( not ( = ?auto_6190 ?auto_6216 ) ) ( not ( = ?auto_6191 ?auto_6195 ) ) ( not ( = ?auto_6191 ?auto_6216 ) ) ( not ( = ?auto_6192 ?auto_6195 ) ) ( not ( = ?auto_6192 ?auto_6216 ) ) ( not ( = ?auto_6193 ?auto_6195 ) ) ( not ( = ?auto_6193 ?auto_6216 ) ) ( not ( = ?auto_6194 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6216 ) ) ( not ( = ?auto_6195 ?auto_6207 ) ) ( not ( = ?auto_6195 ?auto_6205 ) ) ( not ( = ?auto_6195 ?auto_6210 ) ) ( not ( = ?auto_6195 ?auto_6206 ) ) ( not ( = ?auto_6195 ?auto_6211 ) ) ( not ( = ?auto_6216 ?auto_6207 ) ) ( not ( = ?auto_6216 ?auto_6205 ) ) ( not ( = ?auto_6216 ?auto_6210 ) ) ( not ( = ?auto_6216 ?auto_6206 ) ) ( not ( = ?auto_6216 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6198 ) ) ( not ( = ?auto_6190 ?auto_6212 ) ) ( not ( = ?auto_6191 ?auto_6198 ) ) ( not ( = ?auto_6191 ?auto_6212 ) ) ( not ( = ?auto_6192 ?auto_6198 ) ) ( not ( = ?auto_6192 ?auto_6212 ) ) ( not ( = ?auto_6193 ?auto_6198 ) ) ( not ( = ?auto_6193 ?auto_6212 ) ) ( not ( = ?auto_6194 ?auto_6198 ) ) ( not ( = ?auto_6194 ?auto_6212 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6196 ?auto_6212 ) ) ( not ( = ?auto_6198 ?auto_6216 ) ) ( not ( = ?auto_6198 ?auto_6207 ) ) ( not ( = ?auto_6198 ?auto_6205 ) ) ( not ( = ?auto_6198 ?auto_6210 ) ) ( not ( = ?auto_6198 ?auto_6206 ) ) ( not ( = ?auto_6198 ?auto_6211 ) ) ( not ( = ?auto_6214 ?auto_6217 ) ) ( not ( = ?auto_6214 ?auto_6208 ) ) ( not ( = ?auto_6214 ?auto_6204 ) ) ( not ( = ?auto_6213 ?auto_6215 ) ) ( not ( = ?auto_6213 ?auto_6209 ) ) ( not ( = ?auto_6213 ?auto_6200 ) ) ( not ( = ?auto_6212 ?auto_6216 ) ) ( not ( = ?auto_6212 ?auto_6207 ) ) ( not ( = ?auto_6212 ?auto_6205 ) ) ( not ( = ?auto_6212 ?auto_6210 ) ) ( not ( = ?auto_6212 ?auto_6206 ) ) ( not ( = ?auto_6212 ?auto_6211 ) ) ( not ( = ?auto_6190 ?auto_6197 ) ) ( not ( = ?auto_6190 ?auto_6199 ) ) ( not ( = ?auto_6191 ?auto_6197 ) ) ( not ( = ?auto_6191 ?auto_6199 ) ) ( not ( = ?auto_6192 ?auto_6197 ) ) ( not ( = ?auto_6192 ?auto_6199 ) ) ( not ( = ?auto_6193 ?auto_6197 ) ) ( not ( = ?auto_6193 ?auto_6199 ) ) ( not ( = ?auto_6194 ?auto_6197 ) ) ( not ( = ?auto_6194 ?auto_6199 ) ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6196 ?auto_6199 ) ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6195 ?auto_6199 ) ) ( not ( = ?auto_6197 ?auto_6212 ) ) ( not ( = ?auto_6197 ?auto_6216 ) ) ( not ( = ?auto_6197 ?auto_6207 ) ) ( not ( = ?auto_6197 ?auto_6205 ) ) ( not ( = ?auto_6197 ?auto_6210 ) ) ( not ( = ?auto_6197 ?auto_6206 ) ) ( not ( = ?auto_6197 ?auto_6211 ) ) ( not ( = ?auto_6199 ?auto_6212 ) ) ( not ( = ?auto_6199 ?auto_6216 ) ) ( not ( = ?auto_6199 ?auto_6207 ) ) ( not ( = ?auto_6199 ?auto_6205 ) ) ( not ( = ?auto_6199 ?auto_6210 ) ) ( not ( = ?auto_6199 ?auto_6206 ) ) ( not ( = ?auto_6199 ?auto_6211 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 ?auto_6194 ?auto_6196 ?auto_6195 ?auto_6198 )
      ( MAKE-1CRATE ?auto_6198 ?auto_6197 )
      ( MAKE-8CRATE-VERIFY ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 ?auto_6194 ?auto_6196 ?auto_6195 ?auto_6198 ?auto_6197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6220 - SURFACE
      ?auto_6221 - SURFACE
    )
    :vars
    (
      ?auto_6222 - HOIST
      ?auto_6223 - PLACE
      ?auto_6225 - PLACE
      ?auto_6226 - HOIST
      ?auto_6227 - SURFACE
      ?auto_6224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6222 ?auto_6223 ) ( SURFACE-AT ?auto_6220 ?auto_6223 ) ( CLEAR ?auto_6220 ) ( IS-CRATE ?auto_6221 ) ( AVAILABLE ?auto_6222 ) ( not ( = ?auto_6225 ?auto_6223 ) ) ( HOIST-AT ?auto_6226 ?auto_6225 ) ( AVAILABLE ?auto_6226 ) ( SURFACE-AT ?auto_6221 ?auto_6225 ) ( ON ?auto_6221 ?auto_6227 ) ( CLEAR ?auto_6221 ) ( TRUCK-AT ?auto_6224 ?auto_6223 ) ( not ( = ?auto_6220 ?auto_6221 ) ) ( not ( = ?auto_6220 ?auto_6227 ) ) ( not ( = ?auto_6221 ?auto_6227 ) ) ( not ( = ?auto_6222 ?auto_6226 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6224 ?auto_6223 ?auto_6225 )
      ( !LIFT ?auto_6226 ?auto_6221 ?auto_6227 ?auto_6225 )
      ( !LOAD ?auto_6226 ?auto_6221 ?auto_6224 ?auto_6225 )
      ( !DRIVE ?auto_6224 ?auto_6225 ?auto_6223 )
      ( !UNLOAD ?auto_6222 ?auto_6221 ?auto_6224 ?auto_6223 )
      ( !DROP ?auto_6222 ?auto_6221 ?auto_6220 ?auto_6223 )
      ( MAKE-1CRATE-VERIFY ?auto_6220 ?auto_6221 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6238 - SURFACE
      ?auto_6239 - SURFACE
      ?auto_6240 - SURFACE
      ?auto_6241 - SURFACE
      ?auto_6242 - SURFACE
      ?auto_6245 - SURFACE
      ?auto_6243 - SURFACE
      ?auto_6247 - SURFACE
      ?auto_6246 - SURFACE
      ?auto_6244 - SURFACE
    )
    :vars
    (
      ?auto_6252 - HOIST
      ?auto_6250 - PLACE
      ?auto_6253 - PLACE
      ?auto_6248 - HOIST
      ?auto_6249 - SURFACE
      ?auto_6265 - PLACE
      ?auto_6254 - HOIST
      ?auto_6267 - SURFACE
      ?auto_6259 - SURFACE
      ?auto_6258 - PLACE
      ?auto_6256 - HOIST
      ?auto_6257 - SURFACE
      ?auto_6255 - PLACE
      ?auto_6262 - HOIST
      ?auto_6264 - SURFACE
      ?auto_6263 - SURFACE
      ?auto_6261 - SURFACE
      ?auto_6266 - SURFACE
      ?auto_6260 - SURFACE
      ?auto_6251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6252 ?auto_6250 ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6253 ?auto_6250 ) ) ( HOIST-AT ?auto_6248 ?auto_6253 ) ( SURFACE-AT ?auto_6244 ?auto_6253 ) ( ON ?auto_6244 ?auto_6249 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6246 ?auto_6244 ) ) ( not ( = ?auto_6246 ?auto_6249 ) ) ( not ( = ?auto_6244 ?auto_6249 ) ) ( not ( = ?auto_6252 ?auto_6248 ) ) ( IS-CRATE ?auto_6246 ) ( not ( = ?auto_6265 ?auto_6250 ) ) ( HOIST-AT ?auto_6254 ?auto_6265 ) ( SURFACE-AT ?auto_6246 ?auto_6265 ) ( ON ?auto_6246 ?auto_6267 ) ( CLEAR ?auto_6246 ) ( not ( = ?auto_6247 ?auto_6246 ) ) ( not ( = ?auto_6247 ?auto_6267 ) ) ( not ( = ?auto_6246 ?auto_6267 ) ) ( not ( = ?auto_6252 ?auto_6254 ) ) ( IS-CRATE ?auto_6247 ) ( AVAILABLE ?auto_6248 ) ( SURFACE-AT ?auto_6247 ?auto_6253 ) ( ON ?auto_6247 ?auto_6259 ) ( CLEAR ?auto_6247 ) ( not ( = ?auto_6243 ?auto_6247 ) ) ( not ( = ?auto_6243 ?auto_6259 ) ) ( not ( = ?auto_6247 ?auto_6259 ) ) ( IS-CRATE ?auto_6243 ) ( not ( = ?auto_6258 ?auto_6250 ) ) ( HOIST-AT ?auto_6256 ?auto_6258 ) ( SURFACE-AT ?auto_6243 ?auto_6258 ) ( ON ?auto_6243 ?auto_6257 ) ( CLEAR ?auto_6243 ) ( not ( = ?auto_6245 ?auto_6243 ) ) ( not ( = ?auto_6245 ?auto_6257 ) ) ( not ( = ?auto_6243 ?auto_6257 ) ) ( not ( = ?auto_6252 ?auto_6256 ) ) ( IS-CRATE ?auto_6245 ) ( not ( = ?auto_6255 ?auto_6250 ) ) ( HOIST-AT ?auto_6262 ?auto_6255 ) ( AVAILABLE ?auto_6262 ) ( SURFACE-AT ?auto_6245 ?auto_6255 ) ( ON ?auto_6245 ?auto_6264 ) ( CLEAR ?auto_6245 ) ( not ( = ?auto_6242 ?auto_6245 ) ) ( not ( = ?auto_6242 ?auto_6264 ) ) ( not ( = ?auto_6245 ?auto_6264 ) ) ( not ( = ?auto_6252 ?auto_6262 ) ) ( IS-CRATE ?auto_6242 ) ( AVAILABLE ?auto_6254 ) ( SURFACE-AT ?auto_6242 ?auto_6265 ) ( ON ?auto_6242 ?auto_6263 ) ( CLEAR ?auto_6242 ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6263 ) ) ( not ( = ?auto_6242 ?auto_6263 ) ) ( IS-CRATE ?auto_6241 ) ( SURFACE-AT ?auto_6241 ?auto_6258 ) ( ON ?auto_6241 ?auto_6261 ) ( CLEAR ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6261 ) ) ( not ( = ?auto_6241 ?auto_6261 ) ) ( IS-CRATE ?auto_6240 ) ( SURFACE-AT ?auto_6240 ?auto_6258 ) ( ON ?auto_6240 ?auto_6266 ) ( CLEAR ?auto_6240 ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( not ( = ?auto_6239 ?auto_6266 ) ) ( not ( = ?auto_6240 ?auto_6266 ) ) ( SURFACE-AT ?auto_6238 ?auto_6250 ) ( CLEAR ?auto_6238 ) ( IS-CRATE ?auto_6239 ) ( AVAILABLE ?auto_6252 ) ( AVAILABLE ?auto_6256 ) ( SURFACE-AT ?auto_6239 ?auto_6258 ) ( ON ?auto_6239 ?auto_6260 ) ( CLEAR ?auto_6239 ) ( TRUCK-AT ?auto_6251 ?auto_6250 ) ( not ( = ?auto_6238 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6260 ) ) ( not ( = ?auto_6239 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6238 ?auto_6266 ) ) ( not ( = ?auto_6240 ?auto_6260 ) ) ( not ( = ?auto_6266 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6261 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6261 ) ) ( not ( = ?auto_6241 ?auto_6266 ) ) ( not ( = ?auto_6241 ?auto_6260 ) ) ( not ( = ?auto_6261 ?auto_6266 ) ) ( not ( = ?auto_6261 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6238 ?auto_6263 ) ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6239 ?auto_6263 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6263 ) ) ( not ( = ?auto_6242 ?auto_6261 ) ) ( not ( = ?auto_6242 ?auto_6266 ) ) ( not ( = ?auto_6242 ?auto_6260 ) ) ( not ( = ?auto_6265 ?auto_6258 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6263 ?auto_6261 ) ) ( not ( = ?auto_6263 ?auto_6266 ) ) ( not ( = ?auto_6263 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6245 ) ) ( not ( = ?auto_6238 ?auto_6264 ) ) ( not ( = ?auto_6239 ?auto_6245 ) ) ( not ( = ?auto_6239 ?auto_6264 ) ) ( not ( = ?auto_6240 ?auto_6245 ) ) ( not ( = ?auto_6240 ?auto_6264 ) ) ( not ( = ?auto_6241 ?auto_6245 ) ) ( not ( = ?auto_6241 ?auto_6264 ) ) ( not ( = ?auto_6245 ?auto_6263 ) ) ( not ( = ?auto_6245 ?auto_6261 ) ) ( not ( = ?auto_6245 ?auto_6266 ) ) ( not ( = ?auto_6245 ?auto_6260 ) ) ( not ( = ?auto_6255 ?auto_6265 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6262 ?auto_6254 ) ) ( not ( = ?auto_6262 ?auto_6256 ) ) ( not ( = ?auto_6264 ?auto_6263 ) ) ( not ( = ?auto_6264 ?auto_6261 ) ) ( not ( = ?auto_6264 ?auto_6266 ) ) ( not ( = ?auto_6264 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( not ( = ?auto_6238 ?auto_6257 ) ) ( not ( = ?auto_6239 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6257 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6257 ) ) ( not ( = ?auto_6241 ?auto_6243 ) ) ( not ( = ?auto_6241 ?auto_6257 ) ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6242 ?auto_6257 ) ) ( not ( = ?auto_6243 ?auto_6264 ) ) ( not ( = ?auto_6243 ?auto_6263 ) ) ( not ( = ?auto_6243 ?auto_6261 ) ) ( not ( = ?auto_6243 ?auto_6266 ) ) ( not ( = ?auto_6243 ?auto_6260 ) ) ( not ( = ?auto_6257 ?auto_6264 ) ) ( not ( = ?auto_6257 ?auto_6263 ) ) ( not ( = ?auto_6257 ?auto_6261 ) ) ( not ( = ?auto_6257 ?auto_6266 ) ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6247 ) ) ( not ( = ?auto_6238 ?auto_6259 ) ) ( not ( = ?auto_6239 ?auto_6247 ) ) ( not ( = ?auto_6239 ?auto_6259 ) ) ( not ( = ?auto_6240 ?auto_6247 ) ) ( not ( = ?auto_6240 ?auto_6259 ) ) ( not ( = ?auto_6241 ?auto_6247 ) ) ( not ( = ?auto_6241 ?auto_6259 ) ) ( not ( = ?auto_6242 ?auto_6247 ) ) ( not ( = ?auto_6242 ?auto_6259 ) ) ( not ( = ?auto_6245 ?auto_6247 ) ) ( not ( = ?auto_6245 ?auto_6259 ) ) ( not ( = ?auto_6247 ?auto_6257 ) ) ( not ( = ?auto_6247 ?auto_6264 ) ) ( not ( = ?auto_6247 ?auto_6263 ) ) ( not ( = ?auto_6247 ?auto_6261 ) ) ( not ( = ?auto_6247 ?auto_6266 ) ) ( not ( = ?auto_6247 ?auto_6260 ) ) ( not ( = ?auto_6253 ?auto_6258 ) ) ( not ( = ?auto_6253 ?auto_6255 ) ) ( not ( = ?auto_6253 ?auto_6265 ) ) ( not ( = ?auto_6248 ?auto_6256 ) ) ( not ( = ?auto_6248 ?auto_6262 ) ) ( not ( = ?auto_6248 ?auto_6254 ) ) ( not ( = ?auto_6259 ?auto_6257 ) ) ( not ( = ?auto_6259 ?auto_6264 ) ) ( not ( = ?auto_6259 ?auto_6263 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6266 ) ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6246 ) ) ( not ( = ?auto_6238 ?auto_6267 ) ) ( not ( = ?auto_6239 ?auto_6246 ) ) ( not ( = ?auto_6239 ?auto_6267 ) ) ( not ( = ?auto_6240 ?auto_6246 ) ) ( not ( = ?auto_6240 ?auto_6267 ) ) ( not ( = ?auto_6241 ?auto_6246 ) ) ( not ( = ?auto_6241 ?auto_6267 ) ) ( not ( = ?auto_6242 ?auto_6246 ) ) ( not ( = ?auto_6242 ?auto_6267 ) ) ( not ( = ?auto_6245 ?auto_6246 ) ) ( not ( = ?auto_6245 ?auto_6267 ) ) ( not ( = ?auto_6243 ?auto_6246 ) ) ( not ( = ?auto_6243 ?auto_6267 ) ) ( not ( = ?auto_6246 ?auto_6259 ) ) ( not ( = ?auto_6246 ?auto_6257 ) ) ( not ( = ?auto_6246 ?auto_6264 ) ) ( not ( = ?auto_6246 ?auto_6263 ) ) ( not ( = ?auto_6246 ?auto_6261 ) ) ( not ( = ?auto_6246 ?auto_6266 ) ) ( not ( = ?auto_6246 ?auto_6260 ) ) ( not ( = ?auto_6267 ?auto_6259 ) ) ( not ( = ?auto_6267 ?auto_6257 ) ) ( not ( = ?auto_6267 ?auto_6264 ) ) ( not ( = ?auto_6267 ?auto_6263 ) ) ( not ( = ?auto_6267 ?auto_6261 ) ) ( not ( = ?auto_6267 ?auto_6266 ) ) ( not ( = ?auto_6267 ?auto_6260 ) ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( not ( = ?auto_6238 ?auto_6249 ) ) ( not ( = ?auto_6239 ?auto_6244 ) ) ( not ( = ?auto_6239 ?auto_6249 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6240 ?auto_6249 ) ) ( not ( = ?auto_6241 ?auto_6244 ) ) ( not ( = ?auto_6241 ?auto_6249 ) ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( not ( = ?auto_6242 ?auto_6249 ) ) ( not ( = ?auto_6245 ?auto_6244 ) ) ( not ( = ?auto_6245 ?auto_6249 ) ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6249 ) ) ( not ( = ?auto_6247 ?auto_6244 ) ) ( not ( = ?auto_6247 ?auto_6249 ) ) ( not ( = ?auto_6244 ?auto_6267 ) ) ( not ( = ?auto_6244 ?auto_6259 ) ) ( not ( = ?auto_6244 ?auto_6257 ) ) ( not ( = ?auto_6244 ?auto_6264 ) ) ( not ( = ?auto_6244 ?auto_6263 ) ) ( not ( = ?auto_6244 ?auto_6261 ) ) ( not ( = ?auto_6244 ?auto_6266 ) ) ( not ( = ?auto_6244 ?auto_6260 ) ) ( not ( = ?auto_6249 ?auto_6267 ) ) ( not ( = ?auto_6249 ?auto_6259 ) ) ( not ( = ?auto_6249 ?auto_6257 ) ) ( not ( = ?auto_6249 ?auto_6264 ) ) ( not ( = ?auto_6249 ?auto_6263 ) ) ( not ( = ?auto_6249 ?auto_6261 ) ) ( not ( = ?auto_6249 ?auto_6266 ) ) ( not ( = ?auto_6249 ?auto_6260 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6245 ?auto_6243 ?auto_6247 ?auto_6246 )
      ( MAKE-1CRATE ?auto_6246 ?auto_6244 )
      ( MAKE-9CRATE-VERIFY ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6245 ?auto_6243 ?auto_6247 ?auto_6246 ?auto_6244 ) )
  )

)

