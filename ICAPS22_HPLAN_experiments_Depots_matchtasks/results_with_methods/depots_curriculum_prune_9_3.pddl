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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5985 - SURFACE
      ?auto_5986 - SURFACE
      ?auto_5987 - SURFACE
    )
    :vars
    (
      ?auto_5993 - HOIST
      ?auto_5989 - PLACE
      ?auto_5991 - PLACE
      ?auto_5992 - HOIST
      ?auto_5988 - SURFACE
      ?auto_5994 - SURFACE
      ?auto_5990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5993 ?auto_5989 ) ( IS-CRATE ?auto_5987 ) ( not ( = ?auto_5991 ?auto_5989 ) ) ( HOIST-AT ?auto_5992 ?auto_5991 ) ( SURFACE-AT ?auto_5987 ?auto_5991 ) ( ON ?auto_5987 ?auto_5988 ) ( CLEAR ?auto_5987 ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( not ( = ?auto_5986 ?auto_5988 ) ) ( not ( = ?auto_5987 ?auto_5988 ) ) ( not ( = ?auto_5993 ?auto_5992 ) ) ( SURFACE-AT ?auto_5985 ?auto_5989 ) ( CLEAR ?auto_5985 ) ( IS-CRATE ?auto_5986 ) ( AVAILABLE ?auto_5993 ) ( AVAILABLE ?auto_5992 ) ( SURFACE-AT ?auto_5986 ?auto_5991 ) ( ON ?auto_5986 ?auto_5994 ) ( CLEAR ?auto_5986 ) ( TRUCK-AT ?auto_5990 ?auto_5989 ) ( not ( = ?auto_5985 ?auto_5986 ) ) ( not ( = ?auto_5985 ?auto_5994 ) ) ( not ( = ?auto_5986 ?auto_5994 ) ) ( not ( = ?auto_5985 ?auto_5987 ) ) ( not ( = ?auto_5985 ?auto_5988 ) ) ( not ( = ?auto_5987 ?auto_5994 ) ) ( not ( = ?auto_5988 ?auto_5994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5985 ?auto_5986 )
      ( MAKE-1CRATE ?auto_5986 ?auto_5987 )
      ( MAKE-2CRATE-VERIFY ?auto_5985 ?auto_5986 ?auto_5987 ) )
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
      ?auto_6014 - PLACE
      ?auto_6013 - PLACE
      ?auto_6016 - HOIST
      ?auto_6018 - SURFACE
      ?auto_6020 - SURFACE
      ?auto_6019 - SURFACE
      ?auto_6017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6015 ?auto_6014 ) ( IS-CRATE ?auto_6012 ) ( not ( = ?auto_6013 ?auto_6014 ) ) ( HOIST-AT ?auto_6016 ?auto_6013 ) ( SURFACE-AT ?auto_6012 ?auto_6013 ) ( ON ?auto_6012 ?auto_6018 ) ( CLEAR ?auto_6012 ) ( not ( = ?auto_6011 ?auto_6012 ) ) ( not ( = ?auto_6011 ?auto_6018 ) ) ( not ( = ?auto_6012 ?auto_6018 ) ) ( not ( = ?auto_6015 ?auto_6016 ) ) ( IS-CRATE ?auto_6011 ) ( SURFACE-AT ?auto_6011 ?auto_6013 ) ( ON ?auto_6011 ?auto_6020 ) ( CLEAR ?auto_6011 ) ( not ( = ?auto_6010 ?auto_6011 ) ) ( not ( = ?auto_6010 ?auto_6020 ) ) ( not ( = ?auto_6011 ?auto_6020 ) ) ( SURFACE-AT ?auto_6009 ?auto_6014 ) ( CLEAR ?auto_6009 ) ( IS-CRATE ?auto_6010 ) ( AVAILABLE ?auto_6015 ) ( AVAILABLE ?auto_6016 ) ( SURFACE-AT ?auto_6010 ?auto_6013 ) ( ON ?auto_6010 ?auto_6019 ) ( CLEAR ?auto_6010 ) ( TRUCK-AT ?auto_6017 ?auto_6014 ) ( not ( = ?auto_6009 ?auto_6010 ) ) ( not ( = ?auto_6009 ?auto_6019 ) ) ( not ( = ?auto_6010 ?auto_6019 ) ) ( not ( = ?auto_6009 ?auto_6011 ) ) ( not ( = ?auto_6009 ?auto_6020 ) ) ( not ( = ?auto_6011 ?auto_6019 ) ) ( not ( = ?auto_6020 ?auto_6019 ) ) ( not ( = ?auto_6009 ?auto_6012 ) ) ( not ( = ?auto_6009 ?auto_6018 ) ) ( not ( = ?auto_6010 ?auto_6012 ) ) ( not ( = ?auto_6010 ?auto_6018 ) ) ( not ( = ?auto_6012 ?auto_6020 ) ) ( not ( = ?auto_6012 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6020 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6009 ?auto_6010 ?auto_6011 )
      ( MAKE-1CRATE ?auto_6011 ?auto_6012 )
      ( MAKE-3CRATE-VERIFY ?auto_6009 ?auto_6010 ?auto_6011 ?auto_6012 ) )
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
      ?auto_6046 - HOIST
      ?auto_6043 - PLACE
      ?auto_6042 - PLACE
      ?auto_6041 - HOIST
      ?auto_6045 - SURFACE
      ?auto_6048 - PLACE
      ?auto_6051 - HOIST
      ?auto_6049 - SURFACE
      ?auto_6050 - SURFACE
      ?auto_6047 - SURFACE
      ?auto_6044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6046 ?auto_6043 ) ( IS-CRATE ?auto_6040 ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( HOIST-AT ?auto_6041 ?auto_6042 ) ( AVAILABLE ?auto_6041 ) ( SURFACE-AT ?auto_6040 ?auto_6042 ) ( ON ?auto_6040 ?auto_6045 ) ( CLEAR ?auto_6040 ) ( not ( = ?auto_6039 ?auto_6040 ) ) ( not ( = ?auto_6039 ?auto_6045 ) ) ( not ( = ?auto_6040 ?auto_6045 ) ) ( not ( = ?auto_6046 ?auto_6041 ) ) ( IS-CRATE ?auto_6039 ) ( not ( = ?auto_6048 ?auto_6043 ) ) ( HOIST-AT ?auto_6051 ?auto_6048 ) ( SURFACE-AT ?auto_6039 ?auto_6048 ) ( ON ?auto_6039 ?auto_6049 ) ( CLEAR ?auto_6039 ) ( not ( = ?auto_6038 ?auto_6039 ) ) ( not ( = ?auto_6038 ?auto_6049 ) ) ( not ( = ?auto_6039 ?auto_6049 ) ) ( not ( = ?auto_6046 ?auto_6051 ) ) ( IS-CRATE ?auto_6038 ) ( SURFACE-AT ?auto_6038 ?auto_6048 ) ( ON ?auto_6038 ?auto_6050 ) ( CLEAR ?auto_6038 ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6050 ) ) ( not ( = ?auto_6038 ?auto_6050 ) ) ( SURFACE-AT ?auto_6036 ?auto_6043 ) ( CLEAR ?auto_6036 ) ( IS-CRATE ?auto_6037 ) ( AVAILABLE ?auto_6046 ) ( AVAILABLE ?auto_6051 ) ( SURFACE-AT ?auto_6037 ?auto_6048 ) ( ON ?auto_6037 ?auto_6047 ) ( CLEAR ?auto_6037 ) ( TRUCK-AT ?auto_6044 ?auto_6043 ) ( not ( = ?auto_6036 ?auto_6037 ) ) ( not ( = ?auto_6036 ?auto_6047 ) ) ( not ( = ?auto_6037 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6038 ) ) ( not ( = ?auto_6036 ?auto_6050 ) ) ( not ( = ?auto_6038 ?auto_6047 ) ) ( not ( = ?auto_6050 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6039 ) ) ( not ( = ?auto_6036 ?auto_6049 ) ) ( not ( = ?auto_6037 ?auto_6039 ) ) ( not ( = ?auto_6037 ?auto_6049 ) ) ( not ( = ?auto_6039 ?auto_6050 ) ) ( not ( = ?auto_6039 ?auto_6047 ) ) ( not ( = ?auto_6049 ?auto_6050 ) ) ( not ( = ?auto_6049 ?auto_6047 ) ) ( not ( = ?auto_6036 ?auto_6040 ) ) ( not ( = ?auto_6036 ?auto_6045 ) ) ( not ( = ?auto_6037 ?auto_6040 ) ) ( not ( = ?auto_6037 ?auto_6045 ) ) ( not ( = ?auto_6038 ?auto_6040 ) ) ( not ( = ?auto_6038 ?auto_6045 ) ) ( not ( = ?auto_6040 ?auto_6049 ) ) ( not ( = ?auto_6040 ?auto_6050 ) ) ( not ( = ?auto_6040 ?auto_6047 ) ) ( not ( = ?auto_6042 ?auto_6048 ) ) ( not ( = ?auto_6041 ?auto_6051 ) ) ( not ( = ?auto_6045 ?auto_6049 ) ) ( not ( = ?auto_6045 ?auto_6050 ) ) ( not ( = ?auto_6045 ?auto_6047 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6036 ?auto_6037 ?auto_6038 ?auto_6039 )
      ( MAKE-1CRATE ?auto_6039 ?auto_6040 )
      ( MAKE-4CRATE-VERIFY ?auto_6036 ?auto_6037 ?auto_6038 ?auto_6039 ?auto_6040 ) )
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
      ?auto_6074 - PLACE
      ?auto_6079 - HOIST
      ?auto_6078 - SURFACE
      ?auto_6084 - PLACE
      ?auto_6087 - HOIST
      ?auto_6083 - SURFACE
      ?auto_6085 - PLACE
      ?auto_6082 - HOIST
      ?auto_6080 - SURFACE
      ?auto_6086 - SURFACE
      ?auto_6081 - SURFACE
      ?auto_6075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6076 ?auto_6077 ) ( IS-CRATE ?auto_6073 ) ( not ( = ?auto_6074 ?auto_6077 ) ) ( HOIST-AT ?auto_6079 ?auto_6074 ) ( AVAILABLE ?auto_6079 ) ( SURFACE-AT ?auto_6073 ?auto_6074 ) ( ON ?auto_6073 ?auto_6078 ) ( CLEAR ?auto_6073 ) ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6078 ) ) ( not ( = ?auto_6073 ?auto_6078 ) ) ( not ( = ?auto_6076 ?auto_6079 ) ) ( IS-CRATE ?auto_6072 ) ( not ( = ?auto_6084 ?auto_6077 ) ) ( HOIST-AT ?auto_6087 ?auto_6084 ) ( AVAILABLE ?auto_6087 ) ( SURFACE-AT ?auto_6072 ?auto_6084 ) ( ON ?auto_6072 ?auto_6083 ) ( CLEAR ?auto_6072 ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6083 ) ) ( not ( = ?auto_6072 ?auto_6083 ) ) ( not ( = ?auto_6076 ?auto_6087 ) ) ( IS-CRATE ?auto_6071 ) ( not ( = ?auto_6085 ?auto_6077 ) ) ( HOIST-AT ?auto_6082 ?auto_6085 ) ( SURFACE-AT ?auto_6071 ?auto_6085 ) ( ON ?auto_6071 ?auto_6080 ) ( CLEAR ?auto_6071 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6080 ) ) ( not ( = ?auto_6071 ?auto_6080 ) ) ( not ( = ?auto_6076 ?auto_6082 ) ) ( IS-CRATE ?auto_6070 ) ( SURFACE-AT ?auto_6070 ?auto_6085 ) ( ON ?auto_6070 ?auto_6086 ) ( CLEAR ?auto_6070 ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( not ( = ?auto_6069 ?auto_6086 ) ) ( not ( = ?auto_6070 ?auto_6086 ) ) ( SURFACE-AT ?auto_6068 ?auto_6077 ) ( CLEAR ?auto_6068 ) ( IS-CRATE ?auto_6069 ) ( AVAILABLE ?auto_6076 ) ( AVAILABLE ?auto_6082 ) ( SURFACE-AT ?auto_6069 ?auto_6085 ) ( ON ?auto_6069 ?auto_6081 ) ( CLEAR ?auto_6069 ) ( TRUCK-AT ?auto_6075 ?auto_6077 ) ( not ( = ?auto_6068 ?auto_6069 ) ) ( not ( = ?auto_6068 ?auto_6081 ) ) ( not ( = ?auto_6069 ?auto_6081 ) ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6068 ?auto_6086 ) ) ( not ( = ?auto_6070 ?auto_6081 ) ) ( not ( = ?auto_6086 ?auto_6081 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6068 ?auto_6080 ) ) ( not ( = ?auto_6069 ?auto_6071 ) ) ( not ( = ?auto_6069 ?auto_6080 ) ) ( not ( = ?auto_6071 ?auto_6086 ) ) ( not ( = ?auto_6071 ?auto_6081 ) ) ( not ( = ?auto_6080 ?auto_6086 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) ( not ( = ?auto_6068 ?auto_6072 ) ) ( not ( = ?auto_6068 ?auto_6083 ) ) ( not ( = ?auto_6069 ?auto_6072 ) ) ( not ( = ?auto_6069 ?auto_6083 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6083 ) ) ( not ( = ?auto_6072 ?auto_6080 ) ) ( not ( = ?auto_6072 ?auto_6086 ) ) ( not ( = ?auto_6072 ?auto_6081 ) ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6087 ?auto_6082 ) ) ( not ( = ?auto_6083 ?auto_6080 ) ) ( not ( = ?auto_6083 ?auto_6086 ) ) ( not ( = ?auto_6083 ?auto_6081 ) ) ( not ( = ?auto_6068 ?auto_6073 ) ) ( not ( = ?auto_6068 ?auto_6078 ) ) ( not ( = ?auto_6069 ?auto_6073 ) ) ( not ( = ?auto_6069 ?auto_6078 ) ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6070 ?auto_6078 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6078 ) ) ( not ( = ?auto_6073 ?auto_6083 ) ) ( not ( = ?auto_6073 ?auto_6080 ) ) ( not ( = ?auto_6073 ?auto_6086 ) ) ( not ( = ?auto_6073 ?auto_6081 ) ) ( not ( = ?auto_6074 ?auto_6084 ) ) ( not ( = ?auto_6074 ?auto_6085 ) ) ( not ( = ?auto_6079 ?auto_6087 ) ) ( not ( = ?auto_6079 ?auto_6082 ) ) ( not ( = ?auto_6078 ?auto_6083 ) ) ( not ( = ?auto_6078 ?auto_6080 ) ) ( not ( = ?auto_6078 ?auto_6086 ) ) ( not ( = ?auto_6078 ?auto_6081 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6068 ?auto_6069 ?auto_6070 ?auto_6071 ?auto_6072 )
      ( MAKE-1CRATE ?auto_6072 ?auto_6073 )
      ( MAKE-5CRATE-VERIFY ?auto_6068 ?auto_6069 ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6105 - SURFACE
      ?auto_6106 - SURFACE
      ?auto_6107 - SURFACE
      ?auto_6108 - SURFACE
      ?auto_6109 - SURFACE
      ?auto_6110 - SURFACE
      ?auto_6111 - SURFACE
    )
    :vars
    (
      ?auto_6113 - HOIST
      ?auto_6116 - PLACE
      ?auto_6117 - PLACE
      ?auto_6112 - HOIST
      ?auto_6115 - SURFACE
      ?auto_6119 - PLACE
      ?auto_6121 - HOIST
      ?auto_6120 - SURFACE
      ?auto_6126 - PLACE
      ?auto_6122 - HOIST
      ?auto_6124 - SURFACE
      ?auto_6125 - SURFACE
      ?auto_6123 - SURFACE
      ?auto_6118 - SURFACE
      ?auto_6114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6113 ?auto_6116 ) ( IS-CRATE ?auto_6111 ) ( not ( = ?auto_6117 ?auto_6116 ) ) ( HOIST-AT ?auto_6112 ?auto_6117 ) ( SURFACE-AT ?auto_6111 ?auto_6117 ) ( ON ?auto_6111 ?auto_6115 ) ( CLEAR ?auto_6111 ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6115 ) ) ( not ( = ?auto_6111 ?auto_6115 ) ) ( not ( = ?auto_6113 ?auto_6112 ) ) ( IS-CRATE ?auto_6110 ) ( not ( = ?auto_6119 ?auto_6116 ) ) ( HOIST-AT ?auto_6121 ?auto_6119 ) ( AVAILABLE ?auto_6121 ) ( SURFACE-AT ?auto_6110 ?auto_6119 ) ( ON ?auto_6110 ?auto_6120 ) ( CLEAR ?auto_6110 ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6120 ) ) ( not ( = ?auto_6110 ?auto_6120 ) ) ( not ( = ?auto_6113 ?auto_6121 ) ) ( IS-CRATE ?auto_6109 ) ( not ( = ?auto_6126 ?auto_6116 ) ) ( HOIST-AT ?auto_6122 ?auto_6126 ) ( AVAILABLE ?auto_6122 ) ( SURFACE-AT ?auto_6109 ?auto_6126 ) ( ON ?auto_6109 ?auto_6124 ) ( CLEAR ?auto_6109 ) ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6124 ) ) ( not ( = ?auto_6109 ?auto_6124 ) ) ( not ( = ?auto_6113 ?auto_6122 ) ) ( IS-CRATE ?auto_6108 ) ( SURFACE-AT ?auto_6108 ?auto_6117 ) ( ON ?auto_6108 ?auto_6125 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6107 ?auto_6125 ) ) ( not ( = ?auto_6108 ?auto_6125 ) ) ( IS-CRATE ?auto_6107 ) ( SURFACE-AT ?auto_6107 ?auto_6117 ) ( ON ?auto_6107 ?auto_6123 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6123 ) ) ( not ( = ?auto_6107 ?auto_6123 ) ) ( SURFACE-AT ?auto_6105 ?auto_6116 ) ( CLEAR ?auto_6105 ) ( IS-CRATE ?auto_6106 ) ( AVAILABLE ?auto_6113 ) ( AVAILABLE ?auto_6112 ) ( SURFACE-AT ?auto_6106 ?auto_6117 ) ( ON ?auto_6106 ?auto_6118 ) ( CLEAR ?auto_6106 ) ( TRUCK-AT ?auto_6114 ?auto_6116 ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6118 ) ) ( not ( = ?auto_6106 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6123 ) ) ( not ( = ?auto_6107 ?auto_6118 ) ) ( not ( = ?auto_6123 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6108 ) ) ( not ( = ?auto_6105 ?auto_6125 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6125 ) ) ( not ( = ?auto_6108 ?auto_6123 ) ) ( not ( = ?auto_6108 ?auto_6118 ) ) ( not ( = ?auto_6125 ?auto_6123 ) ) ( not ( = ?auto_6125 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6109 ) ) ( not ( = ?auto_6105 ?auto_6124 ) ) ( not ( = ?auto_6106 ?auto_6109 ) ) ( not ( = ?auto_6106 ?auto_6124 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6124 ) ) ( not ( = ?auto_6109 ?auto_6125 ) ) ( not ( = ?auto_6109 ?auto_6123 ) ) ( not ( = ?auto_6109 ?auto_6118 ) ) ( not ( = ?auto_6126 ?auto_6117 ) ) ( not ( = ?auto_6122 ?auto_6112 ) ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6124 ?auto_6123 ) ) ( not ( = ?auto_6124 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6110 ) ) ( not ( = ?auto_6105 ?auto_6120 ) ) ( not ( = ?auto_6106 ?auto_6110 ) ) ( not ( = ?auto_6106 ?auto_6120 ) ) ( not ( = ?auto_6107 ?auto_6110 ) ) ( not ( = ?auto_6107 ?auto_6120 ) ) ( not ( = ?auto_6108 ?auto_6110 ) ) ( not ( = ?auto_6108 ?auto_6120 ) ) ( not ( = ?auto_6110 ?auto_6124 ) ) ( not ( = ?auto_6110 ?auto_6125 ) ) ( not ( = ?auto_6110 ?auto_6123 ) ) ( not ( = ?auto_6110 ?auto_6118 ) ) ( not ( = ?auto_6119 ?auto_6126 ) ) ( not ( = ?auto_6119 ?auto_6117 ) ) ( not ( = ?auto_6121 ?auto_6122 ) ) ( not ( = ?auto_6121 ?auto_6112 ) ) ( not ( = ?auto_6120 ?auto_6124 ) ) ( not ( = ?auto_6120 ?auto_6125 ) ) ( not ( = ?auto_6120 ?auto_6123 ) ) ( not ( = ?auto_6120 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6111 ) ) ( not ( = ?auto_6105 ?auto_6115 ) ) ( not ( = ?auto_6106 ?auto_6111 ) ) ( not ( = ?auto_6106 ?auto_6115 ) ) ( not ( = ?auto_6107 ?auto_6111 ) ) ( not ( = ?auto_6107 ?auto_6115 ) ) ( not ( = ?auto_6108 ?auto_6111 ) ) ( not ( = ?auto_6108 ?auto_6115 ) ) ( not ( = ?auto_6109 ?auto_6111 ) ) ( not ( = ?auto_6109 ?auto_6115 ) ) ( not ( = ?auto_6111 ?auto_6120 ) ) ( not ( = ?auto_6111 ?auto_6124 ) ) ( not ( = ?auto_6111 ?auto_6125 ) ) ( not ( = ?auto_6111 ?auto_6123 ) ) ( not ( = ?auto_6111 ?auto_6118 ) ) ( not ( = ?auto_6115 ?auto_6120 ) ) ( not ( = ?auto_6115 ?auto_6124 ) ) ( not ( = ?auto_6115 ?auto_6125 ) ) ( not ( = ?auto_6115 ?auto_6123 ) ) ( not ( = ?auto_6115 ?auto_6118 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ?auto_6110 )
      ( MAKE-1CRATE ?auto_6110 ?auto_6111 )
      ( MAKE-6CRATE-VERIFY ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ?auto_6110 ?auto_6111 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6145 - SURFACE
      ?auto_6146 - SURFACE
      ?auto_6147 - SURFACE
      ?auto_6148 - SURFACE
      ?auto_6149 - SURFACE
      ?auto_6150 - SURFACE
      ?auto_6151 - SURFACE
      ?auto_6152 - SURFACE
    )
    :vars
    (
      ?auto_6157 - HOIST
      ?auto_6155 - PLACE
      ?auto_6156 - PLACE
      ?auto_6154 - HOIST
      ?auto_6153 - SURFACE
      ?auto_6163 - PLACE
      ?auto_6168 - HOIST
      ?auto_6165 - SURFACE
      ?auto_6169 - PLACE
      ?auto_6159 - HOIST
      ?auto_6167 - SURFACE
      ?auto_6170 - PLACE
      ?auto_6166 - HOIST
      ?auto_6160 - SURFACE
      ?auto_6164 - SURFACE
      ?auto_6162 - SURFACE
      ?auto_6161 - SURFACE
      ?auto_6158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6157 ?auto_6155 ) ( IS-CRATE ?auto_6152 ) ( not ( = ?auto_6156 ?auto_6155 ) ) ( HOIST-AT ?auto_6154 ?auto_6156 ) ( AVAILABLE ?auto_6154 ) ( SURFACE-AT ?auto_6152 ?auto_6156 ) ( ON ?auto_6152 ?auto_6153 ) ( CLEAR ?auto_6152 ) ( not ( = ?auto_6151 ?auto_6152 ) ) ( not ( = ?auto_6151 ?auto_6153 ) ) ( not ( = ?auto_6152 ?auto_6153 ) ) ( not ( = ?auto_6157 ?auto_6154 ) ) ( IS-CRATE ?auto_6151 ) ( not ( = ?auto_6163 ?auto_6155 ) ) ( HOIST-AT ?auto_6168 ?auto_6163 ) ( SURFACE-AT ?auto_6151 ?auto_6163 ) ( ON ?auto_6151 ?auto_6165 ) ( CLEAR ?auto_6151 ) ( not ( = ?auto_6150 ?auto_6151 ) ) ( not ( = ?auto_6150 ?auto_6165 ) ) ( not ( = ?auto_6151 ?auto_6165 ) ) ( not ( = ?auto_6157 ?auto_6168 ) ) ( IS-CRATE ?auto_6150 ) ( not ( = ?auto_6169 ?auto_6155 ) ) ( HOIST-AT ?auto_6159 ?auto_6169 ) ( AVAILABLE ?auto_6159 ) ( SURFACE-AT ?auto_6150 ?auto_6169 ) ( ON ?auto_6150 ?auto_6167 ) ( CLEAR ?auto_6150 ) ( not ( = ?auto_6149 ?auto_6150 ) ) ( not ( = ?auto_6149 ?auto_6167 ) ) ( not ( = ?auto_6150 ?auto_6167 ) ) ( not ( = ?auto_6157 ?auto_6159 ) ) ( IS-CRATE ?auto_6149 ) ( not ( = ?auto_6170 ?auto_6155 ) ) ( HOIST-AT ?auto_6166 ?auto_6170 ) ( AVAILABLE ?auto_6166 ) ( SURFACE-AT ?auto_6149 ?auto_6170 ) ( ON ?auto_6149 ?auto_6160 ) ( CLEAR ?auto_6149 ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6160 ) ) ( not ( = ?auto_6149 ?auto_6160 ) ) ( not ( = ?auto_6157 ?auto_6166 ) ) ( IS-CRATE ?auto_6148 ) ( SURFACE-AT ?auto_6148 ?auto_6163 ) ( ON ?auto_6148 ?auto_6164 ) ( CLEAR ?auto_6148 ) ( not ( = ?auto_6147 ?auto_6148 ) ) ( not ( = ?auto_6147 ?auto_6164 ) ) ( not ( = ?auto_6148 ?auto_6164 ) ) ( IS-CRATE ?auto_6147 ) ( SURFACE-AT ?auto_6147 ?auto_6163 ) ( ON ?auto_6147 ?auto_6162 ) ( CLEAR ?auto_6147 ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6162 ) ) ( not ( = ?auto_6147 ?auto_6162 ) ) ( SURFACE-AT ?auto_6145 ?auto_6155 ) ( CLEAR ?auto_6145 ) ( IS-CRATE ?auto_6146 ) ( AVAILABLE ?auto_6157 ) ( AVAILABLE ?auto_6168 ) ( SURFACE-AT ?auto_6146 ?auto_6163 ) ( ON ?auto_6146 ?auto_6161 ) ( CLEAR ?auto_6146 ) ( TRUCK-AT ?auto_6158 ?auto_6155 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6161 ) ) ( not ( = ?auto_6146 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6145 ?auto_6162 ) ) ( not ( = ?auto_6147 ?auto_6161 ) ) ( not ( = ?auto_6162 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6164 ) ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6164 ) ) ( not ( = ?auto_6148 ?auto_6162 ) ) ( not ( = ?auto_6148 ?auto_6161 ) ) ( not ( = ?auto_6164 ?auto_6162 ) ) ( not ( = ?auto_6164 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6149 ) ) ( not ( = ?auto_6145 ?auto_6160 ) ) ( not ( = ?auto_6146 ?auto_6149 ) ) ( not ( = ?auto_6146 ?auto_6160 ) ) ( not ( = ?auto_6147 ?auto_6149 ) ) ( not ( = ?auto_6147 ?auto_6160 ) ) ( not ( = ?auto_6149 ?auto_6164 ) ) ( not ( = ?auto_6149 ?auto_6162 ) ) ( not ( = ?auto_6149 ?auto_6161 ) ) ( not ( = ?auto_6170 ?auto_6163 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( not ( = ?auto_6160 ?auto_6164 ) ) ( not ( = ?auto_6160 ?auto_6162 ) ) ( not ( = ?auto_6160 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6150 ) ) ( not ( = ?auto_6145 ?auto_6167 ) ) ( not ( = ?auto_6146 ?auto_6150 ) ) ( not ( = ?auto_6146 ?auto_6167 ) ) ( not ( = ?auto_6147 ?auto_6150 ) ) ( not ( = ?auto_6147 ?auto_6167 ) ) ( not ( = ?auto_6148 ?auto_6150 ) ) ( not ( = ?auto_6148 ?auto_6167 ) ) ( not ( = ?auto_6150 ?auto_6160 ) ) ( not ( = ?auto_6150 ?auto_6164 ) ) ( not ( = ?auto_6150 ?auto_6162 ) ) ( not ( = ?auto_6150 ?auto_6161 ) ) ( not ( = ?auto_6169 ?auto_6170 ) ) ( not ( = ?auto_6169 ?auto_6163 ) ) ( not ( = ?auto_6159 ?auto_6166 ) ) ( not ( = ?auto_6159 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6160 ) ) ( not ( = ?auto_6167 ?auto_6164 ) ) ( not ( = ?auto_6167 ?auto_6162 ) ) ( not ( = ?auto_6167 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6151 ) ) ( not ( = ?auto_6145 ?auto_6165 ) ) ( not ( = ?auto_6146 ?auto_6151 ) ) ( not ( = ?auto_6146 ?auto_6165 ) ) ( not ( = ?auto_6147 ?auto_6151 ) ) ( not ( = ?auto_6147 ?auto_6165 ) ) ( not ( = ?auto_6148 ?auto_6151 ) ) ( not ( = ?auto_6148 ?auto_6165 ) ) ( not ( = ?auto_6149 ?auto_6151 ) ) ( not ( = ?auto_6149 ?auto_6165 ) ) ( not ( = ?auto_6151 ?auto_6167 ) ) ( not ( = ?auto_6151 ?auto_6160 ) ) ( not ( = ?auto_6151 ?auto_6164 ) ) ( not ( = ?auto_6151 ?auto_6162 ) ) ( not ( = ?auto_6151 ?auto_6161 ) ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6160 ) ) ( not ( = ?auto_6165 ?auto_6164 ) ) ( not ( = ?auto_6165 ?auto_6162 ) ) ( not ( = ?auto_6165 ?auto_6161 ) ) ( not ( = ?auto_6145 ?auto_6152 ) ) ( not ( = ?auto_6145 ?auto_6153 ) ) ( not ( = ?auto_6146 ?auto_6152 ) ) ( not ( = ?auto_6146 ?auto_6153 ) ) ( not ( = ?auto_6147 ?auto_6152 ) ) ( not ( = ?auto_6147 ?auto_6153 ) ) ( not ( = ?auto_6148 ?auto_6152 ) ) ( not ( = ?auto_6148 ?auto_6153 ) ) ( not ( = ?auto_6149 ?auto_6152 ) ) ( not ( = ?auto_6149 ?auto_6153 ) ) ( not ( = ?auto_6150 ?auto_6152 ) ) ( not ( = ?auto_6150 ?auto_6153 ) ) ( not ( = ?auto_6152 ?auto_6165 ) ) ( not ( = ?auto_6152 ?auto_6167 ) ) ( not ( = ?auto_6152 ?auto_6160 ) ) ( not ( = ?auto_6152 ?auto_6164 ) ) ( not ( = ?auto_6152 ?auto_6162 ) ) ( not ( = ?auto_6152 ?auto_6161 ) ) ( not ( = ?auto_6156 ?auto_6163 ) ) ( not ( = ?auto_6156 ?auto_6169 ) ) ( not ( = ?auto_6156 ?auto_6170 ) ) ( not ( = ?auto_6154 ?auto_6168 ) ) ( not ( = ?auto_6154 ?auto_6159 ) ) ( not ( = ?auto_6154 ?auto_6166 ) ) ( not ( = ?auto_6153 ?auto_6165 ) ) ( not ( = ?auto_6153 ?auto_6167 ) ) ( not ( = ?auto_6153 ?auto_6160 ) ) ( not ( = ?auto_6153 ?auto_6164 ) ) ( not ( = ?auto_6153 ?auto_6162 ) ) ( not ( = ?auto_6153 ?auto_6161 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ?auto_6150 ?auto_6151 )
      ( MAKE-1CRATE ?auto_6151 ?auto_6152 )
      ( MAKE-7CRATE-VERIFY ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ?auto_6150 ?auto_6151 ?auto_6152 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6190 - SURFACE
      ?auto_6191 - SURFACE
      ?auto_6192 - SURFACE
      ?auto_6193 - SURFACE
      ?auto_6194 - SURFACE
      ?auto_6195 - SURFACE
      ?auto_6196 - SURFACE
      ?auto_6197 - SURFACE
      ?auto_6198 - SURFACE
    )
    :vars
    (
      ?auto_6200 - HOIST
      ?auto_6199 - PLACE
      ?auto_6201 - PLACE
      ?auto_6203 - HOIST
      ?auto_6204 - SURFACE
      ?auto_6214 - PLACE
      ?auto_6215 - HOIST
      ?auto_6210 - SURFACE
      ?auto_6208 - PLACE
      ?auto_6205 - HOIST
      ?auto_6211 - SURFACE
      ?auto_6217 - PLACE
      ?auto_6212 - HOIST
      ?auto_6206 - SURFACE
      ?auto_6213 - SURFACE
      ?auto_6207 - SURFACE
      ?auto_6216 - SURFACE
      ?auto_6209 - SURFACE
      ?auto_6202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6200 ?auto_6199 ) ( IS-CRATE ?auto_6198 ) ( not ( = ?auto_6201 ?auto_6199 ) ) ( HOIST-AT ?auto_6203 ?auto_6201 ) ( SURFACE-AT ?auto_6198 ?auto_6201 ) ( ON ?auto_6198 ?auto_6204 ) ( CLEAR ?auto_6198 ) ( not ( = ?auto_6197 ?auto_6198 ) ) ( not ( = ?auto_6197 ?auto_6204 ) ) ( not ( = ?auto_6198 ?auto_6204 ) ) ( not ( = ?auto_6200 ?auto_6203 ) ) ( IS-CRATE ?auto_6197 ) ( not ( = ?auto_6214 ?auto_6199 ) ) ( HOIST-AT ?auto_6215 ?auto_6214 ) ( AVAILABLE ?auto_6215 ) ( SURFACE-AT ?auto_6197 ?auto_6214 ) ( ON ?auto_6197 ?auto_6210 ) ( CLEAR ?auto_6197 ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6196 ?auto_6210 ) ) ( not ( = ?auto_6197 ?auto_6210 ) ) ( not ( = ?auto_6200 ?auto_6215 ) ) ( IS-CRATE ?auto_6196 ) ( not ( = ?auto_6208 ?auto_6199 ) ) ( HOIST-AT ?auto_6205 ?auto_6208 ) ( SURFACE-AT ?auto_6196 ?auto_6208 ) ( ON ?auto_6196 ?auto_6211 ) ( CLEAR ?auto_6196 ) ( not ( = ?auto_6195 ?auto_6196 ) ) ( not ( = ?auto_6195 ?auto_6211 ) ) ( not ( = ?auto_6196 ?auto_6211 ) ) ( not ( = ?auto_6200 ?auto_6205 ) ) ( IS-CRATE ?auto_6195 ) ( not ( = ?auto_6217 ?auto_6199 ) ) ( HOIST-AT ?auto_6212 ?auto_6217 ) ( AVAILABLE ?auto_6212 ) ( SURFACE-AT ?auto_6195 ?auto_6217 ) ( ON ?auto_6195 ?auto_6206 ) ( CLEAR ?auto_6195 ) ( not ( = ?auto_6194 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6206 ) ) ( not ( = ?auto_6195 ?auto_6206 ) ) ( not ( = ?auto_6200 ?auto_6212 ) ) ( IS-CRATE ?auto_6194 ) ( AVAILABLE ?auto_6203 ) ( SURFACE-AT ?auto_6194 ?auto_6201 ) ( ON ?auto_6194 ?auto_6213 ) ( CLEAR ?auto_6194 ) ( not ( = ?auto_6193 ?auto_6194 ) ) ( not ( = ?auto_6193 ?auto_6213 ) ) ( not ( = ?auto_6194 ?auto_6213 ) ) ( IS-CRATE ?auto_6193 ) ( SURFACE-AT ?auto_6193 ?auto_6208 ) ( ON ?auto_6193 ?auto_6207 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( not ( = ?auto_6192 ?auto_6207 ) ) ( not ( = ?auto_6193 ?auto_6207 ) ) ( IS-CRATE ?auto_6192 ) ( SURFACE-AT ?auto_6192 ?auto_6208 ) ( ON ?auto_6192 ?auto_6216 ) ( CLEAR ?auto_6192 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6191 ?auto_6216 ) ) ( not ( = ?auto_6192 ?auto_6216 ) ) ( SURFACE-AT ?auto_6190 ?auto_6199 ) ( CLEAR ?auto_6190 ) ( IS-CRATE ?auto_6191 ) ( AVAILABLE ?auto_6200 ) ( AVAILABLE ?auto_6205 ) ( SURFACE-AT ?auto_6191 ?auto_6208 ) ( ON ?auto_6191 ?auto_6209 ) ( CLEAR ?auto_6191 ) ( TRUCK-AT ?auto_6202 ?auto_6199 ) ( not ( = ?auto_6190 ?auto_6191 ) ) ( not ( = ?auto_6190 ?auto_6209 ) ) ( not ( = ?auto_6191 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6192 ) ) ( not ( = ?auto_6190 ?auto_6216 ) ) ( not ( = ?auto_6192 ?auto_6209 ) ) ( not ( = ?auto_6216 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6193 ) ) ( not ( = ?auto_6190 ?auto_6207 ) ) ( not ( = ?auto_6191 ?auto_6193 ) ) ( not ( = ?auto_6191 ?auto_6207 ) ) ( not ( = ?auto_6193 ?auto_6216 ) ) ( not ( = ?auto_6193 ?auto_6209 ) ) ( not ( = ?auto_6207 ?auto_6216 ) ) ( not ( = ?auto_6207 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6194 ) ) ( not ( = ?auto_6190 ?auto_6213 ) ) ( not ( = ?auto_6191 ?auto_6194 ) ) ( not ( = ?auto_6191 ?auto_6213 ) ) ( not ( = ?auto_6192 ?auto_6194 ) ) ( not ( = ?auto_6192 ?auto_6213 ) ) ( not ( = ?auto_6194 ?auto_6207 ) ) ( not ( = ?auto_6194 ?auto_6216 ) ) ( not ( = ?auto_6194 ?auto_6209 ) ) ( not ( = ?auto_6201 ?auto_6208 ) ) ( not ( = ?auto_6203 ?auto_6205 ) ) ( not ( = ?auto_6213 ?auto_6207 ) ) ( not ( = ?auto_6213 ?auto_6216 ) ) ( not ( = ?auto_6213 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6195 ) ) ( not ( = ?auto_6190 ?auto_6206 ) ) ( not ( = ?auto_6191 ?auto_6195 ) ) ( not ( = ?auto_6191 ?auto_6206 ) ) ( not ( = ?auto_6192 ?auto_6195 ) ) ( not ( = ?auto_6192 ?auto_6206 ) ) ( not ( = ?auto_6193 ?auto_6195 ) ) ( not ( = ?auto_6193 ?auto_6206 ) ) ( not ( = ?auto_6195 ?auto_6213 ) ) ( not ( = ?auto_6195 ?auto_6207 ) ) ( not ( = ?auto_6195 ?auto_6216 ) ) ( not ( = ?auto_6195 ?auto_6209 ) ) ( not ( = ?auto_6217 ?auto_6201 ) ) ( not ( = ?auto_6217 ?auto_6208 ) ) ( not ( = ?auto_6212 ?auto_6203 ) ) ( not ( = ?auto_6212 ?auto_6205 ) ) ( not ( = ?auto_6206 ?auto_6213 ) ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6216 ) ) ( not ( = ?auto_6206 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6196 ) ) ( not ( = ?auto_6190 ?auto_6211 ) ) ( not ( = ?auto_6191 ?auto_6196 ) ) ( not ( = ?auto_6191 ?auto_6211 ) ) ( not ( = ?auto_6192 ?auto_6196 ) ) ( not ( = ?auto_6192 ?auto_6211 ) ) ( not ( = ?auto_6193 ?auto_6196 ) ) ( not ( = ?auto_6193 ?auto_6211 ) ) ( not ( = ?auto_6194 ?auto_6196 ) ) ( not ( = ?auto_6194 ?auto_6211 ) ) ( not ( = ?auto_6196 ?auto_6206 ) ) ( not ( = ?auto_6196 ?auto_6213 ) ) ( not ( = ?auto_6196 ?auto_6207 ) ) ( not ( = ?auto_6196 ?auto_6216 ) ) ( not ( = ?auto_6196 ?auto_6209 ) ) ( not ( = ?auto_6211 ?auto_6206 ) ) ( not ( = ?auto_6211 ?auto_6213 ) ) ( not ( = ?auto_6211 ?auto_6207 ) ) ( not ( = ?auto_6211 ?auto_6216 ) ) ( not ( = ?auto_6211 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6197 ) ) ( not ( = ?auto_6190 ?auto_6210 ) ) ( not ( = ?auto_6191 ?auto_6197 ) ) ( not ( = ?auto_6191 ?auto_6210 ) ) ( not ( = ?auto_6192 ?auto_6197 ) ) ( not ( = ?auto_6192 ?auto_6210 ) ) ( not ( = ?auto_6193 ?auto_6197 ) ) ( not ( = ?auto_6193 ?auto_6210 ) ) ( not ( = ?auto_6194 ?auto_6197 ) ) ( not ( = ?auto_6194 ?auto_6210 ) ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6195 ?auto_6210 ) ) ( not ( = ?auto_6197 ?auto_6211 ) ) ( not ( = ?auto_6197 ?auto_6206 ) ) ( not ( = ?auto_6197 ?auto_6213 ) ) ( not ( = ?auto_6197 ?auto_6207 ) ) ( not ( = ?auto_6197 ?auto_6216 ) ) ( not ( = ?auto_6197 ?auto_6209 ) ) ( not ( = ?auto_6214 ?auto_6208 ) ) ( not ( = ?auto_6214 ?auto_6217 ) ) ( not ( = ?auto_6214 ?auto_6201 ) ) ( not ( = ?auto_6215 ?auto_6205 ) ) ( not ( = ?auto_6215 ?auto_6212 ) ) ( not ( = ?auto_6215 ?auto_6203 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6206 ) ) ( not ( = ?auto_6210 ?auto_6213 ) ) ( not ( = ?auto_6210 ?auto_6207 ) ) ( not ( = ?auto_6210 ?auto_6216 ) ) ( not ( = ?auto_6210 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6198 ) ) ( not ( = ?auto_6190 ?auto_6204 ) ) ( not ( = ?auto_6191 ?auto_6198 ) ) ( not ( = ?auto_6191 ?auto_6204 ) ) ( not ( = ?auto_6192 ?auto_6198 ) ) ( not ( = ?auto_6192 ?auto_6204 ) ) ( not ( = ?auto_6193 ?auto_6198 ) ) ( not ( = ?auto_6193 ?auto_6204 ) ) ( not ( = ?auto_6194 ?auto_6198 ) ) ( not ( = ?auto_6194 ?auto_6204 ) ) ( not ( = ?auto_6195 ?auto_6198 ) ) ( not ( = ?auto_6195 ?auto_6204 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6196 ?auto_6204 ) ) ( not ( = ?auto_6198 ?auto_6210 ) ) ( not ( = ?auto_6198 ?auto_6211 ) ) ( not ( = ?auto_6198 ?auto_6206 ) ) ( not ( = ?auto_6198 ?auto_6213 ) ) ( not ( = ?auto_6198 ?auto_6207 ) ) ( not ( = ?auto_6198 ?auto_6216 ) ) ( not ( = ?auto_6198 ?auto_6209 ) ) ( not ( = ?auto_6204 ?auto_6210 ) ) ( not ( = ?auto_6204 ?auto_6211 ) ) ( not ( = ?auto_6204 ?auto_6206 ) ) ( not ( = ?auto_6204 ?auto_6213 ) ) ( not ( = ?auto_6204 ?auto_6207 ) ) ( not ( = ?auto_6204 ?auto_6216 ) ) ( not ( = ?auto_6204 ?auto_6209 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 ?auto_6194 ?auto_6195 ?auto_6196 ?auto_6197 )
      ( MAKE-1CRATE ?auto_6197 ?auto_6198 )
      ( MAKE-8CRATE-VERIFY ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 ?auto_6194 ?auto_6195 ?auto_6196 ?auto_6197 ?auto_6198 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6238 - SURFACE
      ?auto_6239 - SURFACE
      ?auto_6240 - SURFACE
      ?auto_6241 - SURFACE
      ?auto_6242 - SURFACE
      ?auto_6243 - SURFACE
      ?auto_6244 - SURFACE
      ?auto_6245 - SURFACE
      ?auto_6246 - SURFACE
      ?auto_6247 - SURFACE
    )
    :vars
    (
      ?auto_6250 - HOIST
      ?auto_6252 - PLACE
      ?auto_6251 - PLACE
      ?auto_6253 - HOIST
      ?auto_6248 - SURFACE
      ?auto_6263 - PLACE
      ?auto_6265 - HOIST
      ?auto_6262 - SURFACE
      ?auto_6260 - SURFACE
      ?auto_6256 - PLACE
      ?auto_6259 - HOIST
      ?auto_6261 - SURFACE
      ?auto_6254 - PLACE
      ?auto_6266 - HOIST
      ?auto_6267 - SURFACE
      ?auto_6264 - SURFACE
      ?auto_6255 - SURFACE
      ?auto_6257 - SURFACE
      ?auto_6258 - SURFACE
      ?auto_6249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6250 ?auto_6252 ) ( IS-CRATE ?auto_6247 ) ( not ( = ?auto_6251 ?auto_6252 ) ) ( HOIST-AT ?auto_6253 ?auto_6251 ) ( SURFACE-AT ?auto_6247 ?auto_6251 ) ( ON ?auto_6247 ?auto_6248 ) ( CLEAR ?auto_6247 ) ( not ( = ?auto_6246 ?auto_6247 ) ) ( not ( = ?auto_6246 ?auto_6248 ) ) ( not ( = ?auto_6247 ?auto_6248 ) ) ( not ( = ?auto_6250 ?auto_6253 ) ) ( IS-CRATE ?auto_6246 ) ( not ( = ?auto_6263 ?auto_6252 ) ) ( HOIST-AT ?auto_6265 ?auto_6263 ) ( SURFACE-AT ?auto_6246 ?auto_6263 ) ( ON ?auto_6246 ?auto_6262 ) ( CLEAR ?auto_6246 ) ( not ( = ?auto_6245 ?auto_6246 ) ) ( not ( = ?auto_6245 ?auto_6262 ) ) ( not ( = ?auto_6246 ?auto_6262 ) ) ( not ( = ?auto_6250 ?auto_6265 ) ) ( IS-CRATE ?auto_6245 ) ( AVAILABLE ?auto_6253 ) ( SURFACE-AT ?auto_6245 ?auto_6251 ) ( ON ?auto_6245 ?auto_6260 ) ( CLEAR ?auto_6245 ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6260 ) ) ( not ( = ?auto_6245 ?auto_6260 ) ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6256 ?auto_6252 ) ) ( HOIST-AT ?auto_6259 ?auto_6256 ) ( SURFACE-AT ?auto_6244 ?auto_6256 ) ( ON ?auto_6244 ?auto_6261 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6261 ) ) ( not ( = ?auto_6244 ?auto_6261 ) ) ( not ( = ?auto_6250 ?auto_6259 ) ) ( IS-CRATE ?auto_6243 ) ( not ( = ?auto_6254 ?auto_6252 ) ) ( HOIST-AT ?auto_6266 ?auto_6254 ) ( AVAILABLE ?auto_6266 ) ( SURFACE-AT ?auto_6243 ?auto_6254 ) ( ON ?auto_6243 ?auto_6267 ) ( CLEAR ?auto_6243 ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6242 ?auto_6267 ) ) ( not ( = ?auto_6243 ?auto_6267 ) ) ( not ( = ?auto_6250 ?auto_6266 ) ) ( IS-CRATE ?auto_6242 ) ( AVAILABLE ?auto_6265 ) ( SURFACE-AT ?auto_6242 ?auto_6263 ) ( ON ?auto_6242 ?auto_6264 ) ( CLEAR ?auto_6242 ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6264 ) ) ( not ( = ?auto_6242 ?auto_6264 ) ) ( IS-CRATE ?auto_6241 ) ( SURFACE-AT ?auto_6241 ?auto_6256 ) ( ON ?auto_6241 ?auto_6255 ) ( CLEAR ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6255 ) ) ( not ( = ?auto_6241 ?auto_6255 ) ) ( IS-CRATE ?auto_6240 ) ( SURFACE-AT ?auto_6240 ?auto_6256 ) ( ON ?auto_6240 ?auto_6257 ) ( CLEAR ?auto_6240 ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( not ( = ?auto_6239 ?auto_6257 ) ) ( not ( = ?auto_6240 ?auto_6257 ) ) ( SURFACE-AT ?auto_6238 ?auto_6252 ) ( CLEAR ?auto_6238 ) ( IS-CRATE ?auto_6239 ) ( AVAILABLE ?auto_6250 ) ( AVAILABLE ?auto_6259 ) ( SURFACE-AT ?auto_6239 ?auto_6256 ) ( ON ?auto_6239 ?auto_6258 ) ( CLEAR ?auto_6239 ) ( TRUCK-AT ?auto_6249 ?auto_6252 ) ( not ( = ?auto_6238 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6258 ) ) ( not ( = ?auto_6239 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6238 ?auto_6257 ) ) ( not ( = ?auto_6240 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6255 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6255 ) ) ( not ( = ?auto_6241 ?auto_6257 ) ) ( not ( = ?auto_6241 ?auto_6258 ) ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6238 ?auto_6264 ) ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6239 ?auto_6264 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6264 ) ) ( not ( = ?auto_6242 ?auto_6255 ) ) ( not ( = ?auto_6242 ?auto_6257 ) ) ( not ( = ?auto_6242 ?auto_6258 ) ) ( not ( = ?auto_6263 ?auto_6256 ) ) ( not ( = ?auto_6265 ?auto_6259 ) ) ( not ( = ?auto_6264 ?auto_6255 ) ) ( not ( = ?auto_6264 ?auto_6257 ) ) ( not ( = ?auto_6264 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( not ( = ?auto_6238 ?auto_6267 ) ) ( not ( = ?auto_6239 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6267 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6267 ) ) ( not ( = ?auto_6241 ?auto_6243 ) ) ( not ( = ?auto_6241 ?auto_6267 ) ) ( not ( = ?auto_6243 ?auto_6264 ) ) ( not ( = ?auto_6243 ?auto_6255 ) ) ( not ( = ?auto_6243 ?auto_6257 ) ) ( not ( = ?auto_6243 ?auto_6258 ) ) ( not ( = ?auto_6254 ?auto_6263 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6266 ?auto_6265 ) ) ( not ( = ?auto_6266 ?auto_6259 ) ) ( not ( = ?auto_6267 ?auto_6264 ) ) ( not ( = ?auto_6267 ?auto_6255 ) ) ( not ( = ?auto_6267 ?auto_6257 ) ) ( not ( = ?auto_6267 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( not ( = ?auto_6238 ?auto_6261 ) ) ( not ( = ?auto_6239 ?auto_6244 ) ) ( not ( = ?auto_6239 ?auto_6261 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6240 ?auto_6261 ) ) ( not ( = ?auto_6241 ?auto_6244 ) ) ( not ( = ?auto_6241 ?auto_6261 ) ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( not ( = ?auto_6242 ?auto_6261 ) ) ( not ( = ?auto_6244 ?auto_6267 ) ) ( not ( = ?auto_6244 ?auto_6264 ) ) ( not ( = ?auto_6244 ?auto_6255 ) ) ( not ( = ?auto_6244 ?auto_6257 ) ) ( not ( = ?auto_6244 ?auto_6258 ) ) ( not ( = ?auto_6261 ?auto_6267 ) ) ( not ( = ?auto_6261 ?auto_6264 ) ) ( not ( = ?auto_6261 ?auto_6255 ) ) ( not ( = ?auto_6261 ?auto_6257 ) ) ( not ( = ?auto_6261 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6245 ) ) ( not ( = ?auto_6238 ?auto_6260 ) ) ( not ( = ?auto_6239 ?auto_6245 ) ) ( not ( = ?auto_6239 ?auto_6260 ) ) ( not ( = ?auto_6240 ?auto_6245 ) ) ( not ( = ?auto_6240 ?auto_6260 ) ) ( not ( = ?auto_6241 ?auto_6245 ) ) ( not ( = ?auto_6241 ?auto_6260 ) ) ( not ( = ?auto_6242 ?auto_6245 ) ) ( not ( = ?auto_6242 ?auto_6260 ) ) ( not ( = ?auto_6243 ?auto_6245 ) ) ( not ( = ?auto_6243 ?auto_6260 ) ) ( not ( = ?auto_6245 ?auto_6261 ) ) ( not ( = ?auto_6245 ?auto_6267 ) ) ( not ( = ?auto_6245 ?auto_6264 ) ) ( not ( = ?auto_6245 ?auto_6255 ) ) ( not ( = ?auto_6245 ?auto_6257 ) ) ( not ( = ?auto_6245 ?auto_6258 ) ) ( not ( = ?auto_6251 ?auto_6256 ) ) ( not ( = ?auto_6251 ?auto_6254 ) ) ( not ( = ?auto_6251 ?auto_6263 ) ) ( not ( = ?auto_6253 ?auto_6259 ) ) ( not ( = ?auto_6253 ?auto_6266 ) ) ( not ( = ?auto_6253 ?auto_6265 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6267 ) ) ( not ( = ?auto_6260 ?auto_6264 ) ) ( not ( = ?auto_6260 ?auto_6255 ) ) ( not ( = ?auto_6260 ?auto_6257 ) ) ( not ( = ?auto_6260 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6246 ) ) ( not ( = ?auto_6238 ?auto_6262 ) ) ( not ( = ?auto_6239 ?auto_6246 ) ) ( not ( = ?auto_6239 ?auto_6262 ) ) ( not ( = ?auto_6240 ?auto_6246 ) ) ( not ( = ?auto_6240 ?auto_6262 ) ) ( not ( = ?auto_6241 ?auto_6246 ) ) ( not ( = ?auto_6241 ?auto_6262 ) ) ( not ( = ?auto_6242 ?auto_6246 ) ) ( not ( = ?auto_6242 ?auto_6262 ) ) ( not ( = ?auto_6243 ?auto_6246 ) ) ( not ( = ?auto_6243 ?auto_6262 ) ) ( not ( = ?auto_6244 ?auto_6246 ) ) ( not ( = ?auto_6244 ?auto_6262 ) ) ( not ( = ?auto_6246 ?auto_6260 ) ) ( not ( = ?auto_6246 ?auto_6261 ) ) ( not ( = ?auto_6246 ?auto_6267 ) ) ( not ( = ?auto_6246 ?auto_6264 ) ) ( not ( = ?auto_6246 ?auto_6255 ) ) ( not ( = ?auto_6246 ?auto_6257 ) ) ( not ( = ?auto_6246 ?auto_6258 ) ) ( not ( = ?auto_6262 ?auto_6260 ) ) ( not ( = ?auto_6262 ?auto_6261 ) ) ( not ( = ?auto_6262 ?auto_6267 ) ) ( not ( = ?auto_6262 ?auto_6264 ) ) ( not ( = ?auto_6262 ?auto_6255 ) ) ( not ( = ?auto_6262 ?auto_6257 ) ) ( not ( = ?auto_6262 ?auto_6258 ) ) ( not ( = ?auto_6238 ?auto_6247 ) ) ( not ( = ?auto_6238 ?auto_6248 ) ) ( not ( = ?auto_6239 ?auto_6247 ) ) ( not ( = ?auto_6239 ?auto_6248 ) ) ( not ( = ?auto_6240 ?auto_6247 ) ) ( not ( = ?auto_6240 ?auto_6248 ) ) ( not ( = ?auto_6241 ?auto_6247 ) ) ( not ( = ?auto_6241 ?auto_6248 ) ) ( not ( = ?auto_6242 ?auto_6247 ) ) ( not ( = ?auto_6242 ?auto_6248 ) ) ( not ( = ?auto_6243 ?auto_6247 ) ) ( not ( = ?auto_6243 ?auto_6248 ) ) ( not ( = ?auto_6244 ?auto_6247 ) ) ( not ( = ?auto_6244 ?auto_6248 ) ) ( not ( = ?auto_6245 ?auto_6247 ) ) ( not ( = ?auto_6245 ?auto_6248 ) ) ( not ( = ?auto_6247 ?auto_6262 ) ) ( not ( = ?auto_6247 ?auto_6260 ) ) ( not ( = ?auto_6247 ?auto_6261 ) ) ( not ( = ?auto_6247 ?auto_6267 ) ) ( not ( = ?auto_6247 ?auto_6264 ) ) ( not ( = ?auto_6247 ?auto_6255 ) ) ( not ( = ?auto_6247 ?auto_6257 ) ) ( not ( = ?auto_6247 ?auto_6258 ) ) ( not ( = ?auto_6248 ?auto_6262 ) ) ( not ( = ?auto_6248 ?auto_6260 ) ) ( not ( = ?auto_6248 ?auto_6261 ) ) ( not ( = ?auto_6248 ?auto_6267 ) ) ( not ( = ?auto_6248 ?auto_6264 ) ) ( not ( = ?auto_6248 ?auto_6255 ) ) ( not ( = ?auto_6248 ?auto_6257 ) ) ( not ( = ?auto_6248 ?auto_6258 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6243 ?auto_6244 ?auto_6245 ?auto_6246 )
      ( MAKE-1CRATE ?auto_6246 ?auto_6247 )
      ( MAKE-9CRATE-VERIFY ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6243 ?auto_6244 ?auto_6245 ?auto_6246 ?auto_6247 ) )
  )

)

