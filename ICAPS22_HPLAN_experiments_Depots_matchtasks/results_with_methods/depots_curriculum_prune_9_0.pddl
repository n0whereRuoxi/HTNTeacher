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
      ?auto_4978 - SURFACE
      ?auto_4979 - SURFACE
    )
    :vars
    (
      ?auto_4980 - HOIST
      ?auto_4981 - PLACE
      ?auto_4983 - PLACE
      ?auto_4984 - HOIST
      ?auto_4985 - SURFACE
      ?auto_4982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4980 ?auto_4981 ) ( SURFACE-AT ?auto_4978 ?auto_4981 ) ( CLEAR ?auto_4978 ) ( IS-CRATE ?auto_4979 ) ( AVAILABLE ?auto_4980 ) ( not ( = ?auto_4983 ?auto_4981 ) ) ( HOIST-AT ?auto_4984 ?auto_4983 ) ( AVAILABLE ?auto_4984 ) ( SURFACE-AT ?auto_4979 ?auto_4983 ) ( ON ?auto_4979 ?auto_4985 ) ( CLEAR ?auto_4979 ) ( TRUCK-AT ?auto_4982 ?auto_4981 ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4985 ) ) ( not ( = ?auto_4979 ?auto_4985 ) ) ( not ( = ?auto_4980 ?auto_4984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4982 ?auto_4981 ?auto_4983 )
      ( !LIFT ?auto_4984 ?auto_4979 ?auto_4985 ?auto_4983 )
      ( !LOAD ?auto_4984 ?auto_4979 ?auto_4982 ?auto_4983 )
      ( !DRIVE ?auto_4982 ?auto_4983 ?auto_4981 )
      ( !UNLOAD ?auto_4980 ?auto_4979 ?auto_4982 ?auto_4981 )
      ( !DROP ?auto_4980 ?auto_4979 ?auto_4978 ?auto_4981 )
      ( MAKE-1CRATE-VERIFY ?auto_4978 ?auto_4979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4999 - SURFACE
      ?auto_5000 - SURFACE
      ?auto_5001 - SURFACE
    )
    :vars
    (
      ?auto_5003 - HOIST
      ?auto_5004 - PLACE
      ?auto_5006 - PLACE
      ?auto_5007 - HOIST
      ?auto_5005 - SURFACE
      ?auto_5008 - PLACE
      ?auto_5009 - HOIST
      ?auto_5010 - SURFACE
      ?auto_5002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5003 ?auto_5004 ) ( IS-CRATE ?auto_5001 ) ( not ( = ?auto_5006 ?auto_5004 ) ) ( HOIST-AT ?auto_5007 ?auto_5006 ) ( AVAILABLE ?auto_5007 ) ( SURFACE-AT ?auto_5001 ?auto_5006 ) ( ON ?auto_5001 ?auto_5005 ) ( CLEAR ?auto_5001 ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5000 ?auto_5005 ) ) ( not ( = ?auto_5001 ?auto_5005 ) ) ( not ( = ?auto_5003 ?auto_5007 ) ) ( SURFACE-AT ?auto_4999 ?auto_5004 ) ( CLEAR ?auto_4999 ) ( IS-CRATE ?auto_5000 ) ( AVAILABLE ?auto_5003 ) ( not ( = ?auto_5008 ?auto_5004 ) ) ( HOIST-AT ?auto_5009 ?auto_5008 ) ( AVAILABLE ?auto_5009 ) ( SURFACE-AT ?auto_5000 ?auto_5008 ) ( ON ?auto_5000 ?auto_5010 ) ( CLEAR ?auto_5000 ) ( TRUCK-AT ?auto_5002 ?auto_5004 ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4999 ?auto_5010 ) ) ( not ( = ?auto_5000 ?auto_5010 ) ) ( not ( = ?auto_5003 ?auto_5009 ) ) ( not ( = ?auto_4999 ?auto_5001 ) ) ( not ( = ?auto_4999 ?auto_5005 ) ) ( not ( = ?auto_5001 ?auto_5010 ) ) ( not ( = ?auto_5006 ?auto_5008 ) ) ( not ( = ?auto_5007 ?auto_5009 ) ) ( not ( = ?auto_5005 ?auto_5010 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4999 ?auto_5000 )
      ( MAKE-1CRATE ?auto_5000 ?auto_5001 )
      ( MAKE-2CRATE-VERIFY ?auto_4999 ?auto_5000 ?auto_5001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5025 - SURFACE
      ?auto_5026 - SURFACE
      ?auto_5027 - SURFACE
      ?auto_5028 - SURFACE
    )
    :vars
    (
      ?auto_5029 - HOIST
      ?auto_5032 - PLACE
      ?auto_5031 - PLACE
      ?auto_5033 - HOIST
      ?auto_5030 - SURFACE
      ?auto_5037 - PLACE
      ?auto_5035 - HOIST
      ?auto_5036 - SURFACE
      ?auto_5038 - PLACE
      ?auto_5039 - HOIST
      ?auto_5040 - SURFACE
      ?auto_5034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5029 ?auto_5032 ) ( IS-CRATE ?auto_5028 ) ( not ( = ?auto_5031 ?auto_5032 ) ) ( HOIST-AT ?auto_5033 ?auto_5031 ) ( AVAILABLE ?auto_5033 ) ( SURFACE-AT ?auto_5028 ?auto_5031 ) ( ON ?auto_5028 ?auto_5030 ) ( CLEAR ?auto_5028 ) ( not ( = ?auto_5027 ?auto_5028 ) ) ( not ( = ?auto_5027 ?auto_5030 ) ) ( not ( = ?auto_5028 ?auto_5030 ) ) ( not ( = ?auto_5029 ?auto_5033 ) ) ( IS-CRATE ?auto_5027 ) ( not ( = ?auto_5037 ?auto_5032 ) ) ( HOIST-AT ?auto_5035 ?auto_5037 ) ( AVAILABLE ?auto_5035 ) ( SURFACE-AT ?auto_5027 ?auto_5037 ) ( ON ?auto_5027 ?auto_5036 ) ( CLEAR ?auto_5027 ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5036 ) ) ( not ( = ?auto_5027 ?auto_5036 ) ) ( not ( = ?auto_5029 ?auto_5035 ) ) ( SURFACE-AT ?auto_5025 ?auto_5032 ) ( CLEAR ?auto_5025 ) ( IS-CRATE ?auto_5026 ) ( AVAILABLE ?auto_5029 ) ( not ( = ?auto_5038 ?auto_5032 ) ) ( HOIST-AT ?auto_5039 ?auto_5038 ) ( AVAILABLE ?auto_5039 ) ( SURFACE-AT ?auto_5026 ?auto_5038 ) ( ON ?auto_5026 ?auto_5040 ) ( CLEAR ?auto_5026 ) ( TRUCK-AT ?auto_5034 ?auto_5032 ) ( not ( = ?auto_5025 ?auto_5026 ) ) ( not ( = ?auto_5025 ?auto_5040 ) ) ( not ( = ?auto_5026 ?auto_5040 ) ) ( not ( = ?auto_5029 ?auto_5039 ) ) ( not ( = ?auto_5025 ?auto_5027 ) ) ( not ( = ?auto_5025 ?auto_5036 ) ) ( not ( = ?auto_5027 ?auto_5040 ) ) ( not ( = ?auto_5037 ?auto_5038 ) ) ( not ( = ?auto_5035 ?auto_5039 ) ) ( not ( = ?auto_5036 ?auto_5040 ) ) ( not ( = ?auto_5025 ?auto_5028 ) ) ( not ( = ?auto_5025 ?auto_5030 ) ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5026 ?auto_5030 ) ) ( not ( = ?auto_5028 ?auto_5036 ) ) ( not ( = ?auto_5028 ?auto_5040 ) ) ( not ( = ?auto_5031 ?auto_5037 ) ) ( not ( = ?auto_5031 ?auto_5038 ) ) ( not ( = ?auto_5033 ?auto_5035 ) ) ( not ( = ?auto_5033 ?auto_5039 ) ) ( not ( = ?auto_5030 ?auto_5036 ) ) ( not ( = ?auto_5030 ?auto_5040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5025 ?auto_5026 ?auto_5027 )
      ( MAKE-1CRATE ?auto_5027 ?auto_5028 )
      ( MAKE-3CRATE-VERIFY ?auto_5025 ?auto_5026 ?auto_5027 ?auto_5028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5056 - SURFACE
      ?auto_5057 - SURFACE
      ?auto_5058 - SURFACE
      ?auto_5059 - SURFACE
      ?auto_5060 - SURFACE
    )
    :vars
    (
      ?auto_5064 - HOIST
      ?auto_5061 - PLACE
      ?auto_5063 - PLACE
      ?auto_5062 - HOIST
      ?auto_5065 - SURFACE
      ?auto_5073 - PLACE
      ?auto_5069 - HOIST
      ?auto_5072 - SURFACE
      ?auto_5071 - PLACE
      ?auto_5067 - HOIST
      ?auto_5068 - SURFACE
      ?auto_5070 - SURFACE
      ?auto_5066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5064 ?auto_5061 ) ( IS-CRATE ?auto_5060 ) ( not ( = ?auto_5063 ?auto_5061 ) ) ( HOIST-AT ?auto_5062 ?auto_5063 ) ( SURFACE-AT ?auto_5060 ?auto_5063 ) ( ON ?auto_5060 ?auto_5065 ) ( CLEAR ?auto_5060 ) ( not ( = ?auto_5059 ?auto_5060 ) ) ( not ( = ?auto_5059 ?auto_5065 ) ) ( not ( = ?auto_5060 ?auto_5065 ) ) ( not ( = ?auto_5064 ?auto_5062 ) ) ( IS-CRATE ?auto_5059 ) ( not ( = ?auto_5073 ?auto_5061 ) ) ( HOIST-AT ?auto_5069 ?auto_5073 ) ( AVAILABLE ?auto_5069 ) ( SURFACE-AT ?auto_5059 ?auto_5073 ) ( ON ?auto_5059 ?auto_5072 ) ( CLEAR ?auto_5059 ) ( not ( = ?auto_5058 ?auto_5059 ) ) ( not ( = ?auto_5058 ?auto_5072 ) ) ( not ( = ?auto_5059 ?auto_5072 ) ) ( not ( = ?auto_5064 ?auto_5069 ) ) ( IS-CRATE ?auto_5058 ) ( not ( = ?auto_5071 ?auto_5061 ) ) ( HOIST-AT ?auto_5067 ?auto_5071 ) ( AVAILABLE ?auto_5067 ) ( SURFACE-AT ?auto_5058 ?auto_5071 ) ( ON ?auto_5058 ?auto_5068 ) ( CLEAR ?auto_5058 ) ( not ( = ?auto_5057 ?auto_5058 ) ) ( not ( = ?auto_5057 ?auto_5068 ) ) ( not ( = ?auto_5058 ?auto_5068 ) ) ( not ( = ?auto_5064 ?auto_5067 ) ) ( SURFACE-AT ?auto_5056 ?auto_5061 ) ( CLEAR ?auto_5056 ) ( IS-CRATE ?auto_5057 ) ( AVAILABLE ?auto_5064 ) ( AVAILABLE ?auto_5062 ) ( SURFACE-AT ?auto_5057 ?auto_5063 ) ( ON ?auto_5057 ?auto_5070 ) ( CLEAR ?auto_5057 ) ( TRUCK-AT ?auto_5066 ?auto_5061 ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( not ( = ?auto_5056 ?auto_5070 ) ) ( not ( = ?auto_5057 ?auto_5070 ) ) ( not ( = ?auto_5056 ?auto_5058 ) ) ( not ( = ?auto_5056 ?auto_5068 ) ) ( not ( = ?auto_5058 ?auto_5070 ) ) ( not ( = ?auto_5071 ?auto_5063 ) ) ( not ( = ?auto_5067 ?auto_5062 ) ) ( not ( = ?auto_5068 ?auto_5070 ) ) ( not ( = ?auto_5056 ?auto_5059 ) ) ( not ( = ?auto_5056 ?auto_5072 ) ) ( not ( = ?auto_5057 ?auto_5059 ) ) ( not ( = ?auto_5057 ?auto_5072 ) ) ( not ( = ?auto_5059 ?auto_5068 ) ) ( not ( = ?auto_5059 ?auto_5070 ) ) ( not ( = ?auto_5073 ?auto_5071 ) ) ( not ( = ?auto_5073 ?auto_5063 ) ) ( not ( = ?auto_5069 ?auto_5067 ) ) ( not ( = ?auto_5069 ?auto_5062 ) ) ( not ( = ?auto_5072 ?auto_5068 ) ) ( not ( = ?auto_5072 ?auto_5070 ) ) ( not ( = ?auto_5056 ?auto_5060 ) ) ( not ( = ?auto_5056 ?auto_5065 ) ) ( not ( = ?auto_5057 ?auto_5060 ) ) ( not ( = ?auto_5057 ?auto_5065 ) ) ( not ( = ?auto_5058 ?auto_5060 ) ) ( not ( = ?auto_5058 ?auto_5065 ) ) ( not ( = ?auto_5060 ?auto_5072 ) ) ( not ( = ?auto_5060 ?auto_5068 ) ) ( not ( = ?auto_5060 ?auto_5070 ) ) ( not ( = ?auto_5065 ?auto_5072 ) ) ( not ( = ?auto_5065 ?auto_5068 ) ) ( not ( = ?auto_5065 ?auto_5070 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5056 ?auto_5057 ?auto_5058 ?auto_5059 )
      ( MAKE-1CRATE ?auto_5059 ?auto_5060 )
      ( MAKE-4CRATE-VERIFY ?auto_5056 ?auto_5057 ?auto_5058 ?auto_5059 ?auto_5060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5090 - SURFACE
      ?auto_5091 - SURFACE
      ?auto_5092 - SURFACE
      ?auto_5093 - SURFACE
      ?auto_5094 - SURFACE
      ?auto_5095 - SURFACE
    )
    :vars
    (
      ?auto_5099 - HOIST
      ?auto_5097 - PLACE
      ?auto_5096 - PLACE
      ?auto_5098 - HOIST
      ?auto_5101 - SURFACE
      ?auto_5111 - PLACE
      ?auto_5110 - HOIST
      ?auto_5103 - SURFACE
      ?auto_5109 - PLACE
      ?auto_5108 - HOIST
      ?auto_5106 - SURFACE
      ?auto_5105 - PLACE
      ?auto_5107 - HOIST
      ?auto_5102 - SURFACE
      ?auto_5104 - SURFACE
      ?auto_5100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5099 ?auto_5097 ) ( IS-CRATE ?auto_5095 ) ( not ( = ?auto_5096 ?auto_5097 ) ) ( HOIST-AT ?auto_5098 ?auto_5096 ) ( AVAILABLE ?auto_5098 ) ( SURFACE-AT ?auto_5095 ?auto_5096 ) ( ON ?auto_5095 ?auto_5101 ) ( CLEAR ?auto_5095 ) ( not ( = ?auto_5094 ?auto_5095 ) ) ( not ( = ?auto_5094 ?auto_5101 ) ) ( not ( = ?auto_5095 ?auto_5101 ) ) ( not ( = ?auto_5099 ?auto_5098 ) ) ( IS-CRATE ?auto_5094 ) ( not ( = ?auto_5111 ?auto_5097 ) ) ( HOIST-AT ?auto_5110 ?auto_5111 ) ( SURFACE-AT ?auto_5094 ?auto_5111 ) ( ON ?auto_5094 ?auto_5103 ) ( CLEAR ?auto_5094 ) ( not ( = ?auto_5093 ?auto_5094 ) ) ( not ( = ?auto_5093 ?auto_5103 ) ) ( not ( = ?auto_5094 ?auto_5103 ) ) ( not ( = ?auto_5099 ?auto_5110 ) ) ( IS-CRATE ?auto_5093 ) ( not ( = ?auto_5109 ?auto_5097 ) ) ( HOIST-AT ?auto_5108 ?auto_5109 ) ( AVAILABLE ?auto_5108 ) ( SURFACE-AT ?auto_5093 ?auto_5109 ) ( ON ?auto_5093 ?auto_5106 ) ( CLEAR ?auto_5093 ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5106 ) ) ( not ( = ?auto_5093 ?auto_5106 ) ) ( not ( = ?auto_5099 ?auto_5108 ) ) ( IS-CRATE ?auto_5092 ) ( not ( = ?auto_5105 ?auto_5097 ) ) ( HOIST-AT ?auto_5107 ?auto_5105 ) ( AVAILABLE ?auto_5107 ) ( SURFACE-AT ?auto_5092 ?auto_5105 ) ( ON ?auto_5092 ?auto_5102 ) ( CLEAR ?auto_5092 ) ( not ( = ?auto_5091 ?auto_5092 ) ) ( not ( = ?auto_5091 ?auto_5102 ) ) ( not ( = ?auto_5092 ?auto_5102 ) ) ( not ( = ?auto_5099 ?auto_5107 ) ) ( SURFACE-AT ?auto_5090 ?auto_5097 ) ( CLEAR ?auto_5090 ) ( IS-CRATE ?auto_5091 ) ( AVAILABLE ?auto_5099 ) ( AVAILABLE ?auto_5110 ) ( SURFACE-AT ?auto_5091 ?auto_5111 ) ( ON ?auto_5091 ?auto_5104 ) ( CLEAR ?auto_5091 ) ( TRUCK-AT ?auto_5100 ?auto_5097 ) ( not ( = ?auto_5090 ?auto_5091 ) ) ( not ( = ?auto_5090 ?auto_5104 ) ) ( not ( = ?auto_5091 ?auto_5104 ) ) ( not ( = ?auto_5090 ?auto_5092 ) ) ( not ( = ?auto_5090 ?auto_5102 ) ) ( not ( = ?auto_5092 ?auto_5104 ) ) ( not ( = ?auto_5105 ?auto_5111 ) ) ( not ( = ?auto_5107 ?auto_5110 ) ) ( not ( = ?auto_5102 ?auto_5104 ) ) ( not ( = ?auto_5090 ?auto_5093 ) ) ( not ( = ?auto_5090 ?auto_5106 ) ) ( not ( = ?auto_5091 ?auto_5093 ) ) ( not ( = ?auto_5091 ?auto_5106 ) ) ( not ( = ?auto_5093 ?auto_5102 ) ) ( not ( = ?auto_5093 ?auto_5104 ) ) ( not ( = ?auto_5109 ?auto_5105 ) ) ( not ( = ?auto_5109 ?auto_5111 ) ) ( not ( = ?auto_5108 ?auto_5107 ) ) ( not ( = ?auto_5108 ?auto_5110 ) ) ( not ( = ?auto_5106 ?auto_5102 ) ) ( not ( = ?auto_5106 ?auto_5104 ) ) ( not ( = ?auto_5090 ?auto_5094 ) ) ( not ( = ?auto_5090 ?auto_5103 ) ) ( not ( = ?auto_5091 ?auto_5094 ) ) ( not ( = ?auto_5091 ?auto_5103 ) ) ( not ( = ?auto_5092 ?auto_5094 ) ) ( not ( = ?auto_5092 ?auto_5103 ) ) ( not ( = ?auto_5094 ?auto_5106 ) ) ( not ( = ?auto_5094 ?auto_5102 ) ) ( not ( = ?auto_5094 ?auto_5104 ) ) ( not ( = ?auto_5103 ?auto_5106 ) ) ( not ( = ?auto_5103 ?auto_5102 ) ) ( not ( = ?auto_5103 ?auto_5104 ) ) ( not ( = ?auto_5090 ?auto_5095 ) ) ( not ( = ?auto_5090 ?auto_5101 ) ) ( not ( = ?auto_5091 ?auto_5095 ) ) ( not ( = ?auto_5091 ?auto_5101 ) ) ( not ( = ?auto_5092 ?auto_5095 ) ) ( not ( = ?auto_5092 ?auto_5101 ) ) ( not ( = ?auto_5093 ?auto_5095 ) ) ( not ( = ?auto_5093 ?auto_5101 ) ) ( not ( = ?auto_5095 ?auto_5103 ) ) ( not ( = ?auto_5095 ?auto_5106 ) ) ( not ( = ?auto_5095 ?auto_5102 ) ) ( not ( = ?auto_5095 ?auto_5104 ) ) ( not ( = ?auto_5096 ?auto_5111 ) ) ( not ( = ?auto_5096 ?auto_5109 ) ) ( not ( = ?auto_5096 ?auto_5105 ) ) ( not ( = ?auto_5098 ?auto_5110 ) ) ( not ( = ?auto_5098 ?auto_5108 ) ) ( not ( = ?auto_5098 ?auto_5107 ) ) ( not ( = ?auto_5101 ?auto_5103 ) ) ( not ( = ?auto_5101 ?auto_5106 ) ) ( not ( = ?auto_5101 ?auto_5102 ) ) ( not ( = ?auto_5101 ?auto_5104 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5090 ?auto_5091 ?auto_5092 ?auto_5093 ?auto_5094 )
      ( MAKE-1CRATE ?auto_5094 ?auto_5095 )
      ( MAKE-5CRATE-VERIFY ?auto_5090 ?auto_5091 ?auto_5092 ?auto_5093 ?auto_5094 ?auto_5095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5129 - SURFACE
      ?auto_5130 - SURFACE
      ?auto_5131 - SURFACE
      ?auto_5132 - SURFACE
      ?auto_5133 - SURFACE
      ?auto_5134 - SURFACE
      ?auto_5135 - SURFACE
    )
    :vars
    (
      ?auto_5141 - HOIST
      ?auto_5139 - PLACE
      ?auto_5140 - PLACE
      ?auto_5138 - HOIST
      ?auto_5137 - SURFACE
      ?auto_5142 - PLACE
      ?auto_5143 - HOIST
      ?auto_5154 - SURFACE
      ?auto_5150 - PLACE
      ?auto_5153 - HOIST
      ?auto_5151 - SURFACE
      ?auto_5144 - PLACE
      ?auto_5148 - HOIST
      ?auto_5147 - SURFACE
      ?auto_5145 - PLACE
      ?auto_5146 - HOIST
      ?auto_5152 - SURFACE
      ?auto_5149 - SURFACE
      ?auto_5136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5141 ?auto_5139 ) ( IS-CRATE ?auto_5135 ) ( not ( = ?auto_5140 ?auto_5139 ) ) ( HOIST-AT ?auto_5138 ?auto_5140 ) ( AVAILABLE ?auto_5138 ) ( SURFACE-AT ?auto_5135 ?auto_5140 ) ( ON ?auto_5135 ?auto_5137 ) ( CLEAR ?auto_5135 ) ( not ( = ?auto_5134 ?auto_5135 ) ) ( not ( = ?auto_5134 ?auto_5137 ) ) ( not ( = ?auto_5135 ?auto_5137 ) ) ( not ( = ?auto_5141 ?auto_5138 ) ) ( IS-CRATE ?auto_5134 ) ( not ( = ?auto_5142 ?auto_5139 ) ) ( HOIST-AT ?auto_5143 ?auto_5142 ) ( AVAILABLE ?auto_5143 ) ( SURFACE-AT ?auto_5134 ?auto_5142 ) ( ON ?auto_5134 ?auto_5154 ) ( CLEAR ?auto_5134 ) ( not ( = ?auto_5133 ?auto_5134 ) ) ( not ( = ?auto_5133 ?auto_5154 ) ) ( not ( = ?auto_5134 ?auto_5154 ) ) ( not ( = ?auto_5141 ?auto_5143 ) ) ( IS-CRATE ?auto_5133 ) ( not ( = ?auto_5150 ?auto_5139 ) ) ( HOIST-AT ?auto_5153 ?auto_5150 ) ( SURFACE-AT ?auto_5133 ?auto_5150 ) ( ON ?auto_5133 ?auto_5151 ) ( CLEAR ?auto_5133 ) ( not ( = ?auto_5132 ?auto_5133 ) ) ( not ( = ?auto_5132 ?auto_5151 ) ) ( not ( = ?auto_5133 ?auto_5151 ) ) ( not ( = ?auto_5141 ?auto_5153 ) ) ( IS-CRATE ?auto_5132 ) ( not ( = ?auto_5144 ?auto_5139 ) ) ( HOIST-AT ?auto_5148 ?auto_5144 ) ( AVAILABLE ?auto_5148 ) ( SURFACE-AT ?auto_5132 ?auto_5144 ) ( ON ?auto_5132 ?auto_5147 ) ( CLEAR ?auto_5132 ) ( not ( = ?auto_5131 ?auto_5132 ) ) ( not ( = ?auto_5131 ?auto_5147 ) ) ( not ( = ?auto_5132 ?auto_5147 ) ) ( not ( = ?auto_5141 ?auto_5148 ) ) ( IS-CRATE ?auto_5131 ) ( not ( = ?auto_5145 ?auto_5139 ) ) ( HOIST-AT ?auto_5146 ?auto_5145 ) ( AVAILABLE ?auto_5146 ) ( SURFACE-AT ?auto_5131 ?auto_5145 ) ( ON ?auto_5131 ?auto_5152 ) ( CLEAR ?auto_5131 ) ( not ( = ?auto_5130 ?auto_5131 ) ) ( not ( = ?auto_5130 ?auto_5152 ) ) ( not ( = ?auto_5131 ?auto_5152 ) ) ( not ( = ?auto_5141 ?auto_5146 ) ) ( SURFACE-AT ?auto_5129 ?auto_5139 ) ( CLEAR ?auto_5129 ) ( IS-CRATE ?auto_5130 ) ( AVAILABLE ?auto_5141 ) ( AVAILABLE ?auto_5153 ) ( SURFACE-AT ?auto_5130 ?auto_5150 ) ( ON ?auto_5130 ?auto_5149 ) ( CLEAR ?auto_5130 ) ( TRUCK-AT ?auto_5136 ?auto_5139 ) ( not ( = ?auto_5129 ?auto_5130 ) ) ( not ( = ?auto_5129 ?auto_5149 ) ) ( not ( = ?auto_5130 ?auto_5149 ) ) ( not ( = ?auto_5129 ?auto_5131 ) ) ( not ( = ?auto_5129 ?auto_5152 ) ) ( not ( = ?auto_5131 ?auto_5149 ) ) ( not ( = ?auto_5145 ?auto_5150 ) ) ( not ( = ?auto_5146 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5149 ) ) ( not ( = ?auto_5129 ?auto_5132 ) ) ( not ( = ?auto_5129 ?auto_5147 ) ) ( not ( = ?auto_5130 ?auto_5132 ) ) ( not ( = ?auto_5130 ?auto_5147 ) ) ( not ( = ?auto_5132 ?auto_5152 ) ) ( not ( = ?auto_5132 ?auto_5149 ) ) ( not ( = ?auto_5144 ?auto_5145 ) ) ( not ( = ?auto_5144 ?auto_5150 ) ) ( not ( = ?auto_5148 ?auto_5146 ) ) ( not ( = ?auto_5148 ?auto_5153 ) ) ( not ( = ?auto_5147 ?auto_5152 ) ) ( not ( = ?auto_5147 ?auto_5149 ) ) ( not ( = ?auto_5129 ?auto_5133 ) ) ( not ( = ?auto_5129 ?auto_5151 ) ) ( not ( = ?auto_5130 ?auto_5133 ) ) ( not ( = ?auto_5130 ?auto_5151 ) ) ( not ( = ?auto_5131 ?auto_5133 ) ) ( not ( = ?auto_5131 ?auto_5151 ) ) ( not ( = ?auto_5133 ?auto_5147 ) ) ( not ( = ?auto_5133 ?auto_5152 ) ) ( not ( = ?auto_5133 ?auto_5149 ) ) ( not ( = ?auto_5151 ?auto_5147 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5149 ) ) ( not ( = ?auto_5129 ?auto_5134 ) ) ( not ( = ?auto_5129 ?auto_5154 ) ) ( not ( = ?auto_5130 ?auto_5134 ) ) ( not ( = ?auto_5130 ?auto_5154 ) ) ( not ( = ?auto_5131 ?auto_5134 ) ) ( not ( = ?auto_5131 ?auto_5154 ) ) ( not ( = ?auto_5132 ?auto_5134 ) ) ( not ( = ?auto_5132 ?auto_5154 ) ) ( not ( = ?auto_5134 ?auto_5151 ) ) ( not ( = ?auto_5134 ?auto_5147 ) ) ( not ( = ?auto_5134 ?auto_5152 ) ) ( not ( = ?auto_5134 ?auto_5149 ) ) ( not ( = ?auto_5142 ?auto_5150 ) ) ( not ( = ?auto_5142 ?auto_5144 ) ) ( not ( = ?auto_5142 ?auto_5145 ) ) ( not ( = ?auto_5143 ?auto_5153 ) ) ( not ( = ?auto_5143 ?auto_5148 ) ) ( not ( = ?auto_5143 ?auto_5146 ) ) ( not ( = ?auto_5154 ?auto_5151 ) ) ( not ( = ?auto_5154 ?auto_5147 ) ) ( not ( = ?auto_5154 ?auto_5152 ) ) ( not ( = ?auto_5154 ?auto_5149 ) ) ( not ( = ?auto_5129 ?auto_5135 ) ) ( not ( = ?auto_5129 ?auto_5137 ) ) ( not ( = ?auto_5130 ?auto_5135 ) ) ( not ( = ?auto_5130 ?auto_5137 ) ) ( not ( = ?auto_5131 ?auto_5135 ) ) ( not ( = ?auto_5131 ?auto_5137 ) ) ( not ( = ?auto_5132 ?auto_5135 ) ) ( not ( = ?auto_5132 ?auto_5137 ) ) ( not ( = ?auto_5133 ?auto_5135 ) ) ( not ( = ?auto_5133 ?auto_5137 ) ) ( not ( = ?auto_5135 ?auto_5154 ) ) ( not ( = ?auto_5135 ?auto_5151 ) ) ( not ( = ?auto_5135 ?auto_5147 ) ) ( not ( = ?auto_5135 ?auto_5152 ) ) ( not ( = ?auto_5135 ?auto_5149 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( not ( = ?auto_5140 ?auto_5150 ) ) ( not ( = ?auto_5140 ?auto_5144 ) ) ( not ( = ?auto_5140 ?auto_5145 ) ) ( not ( = ?auto_5138 ?auto_5143 ) ) ( not ( = ?auto_5138 ?auto_5153 ) ) ( not ( = ?auto_5138 ?auto_5148 ) ) ( not ( = ?auto_5138 ?auto_5146 ) ) ( not ( = ?auto_5137 ?auto_5154 ) ) ( not ( = ?auto_5137 ?auto_5151 ) ) ( not ( = ?auto_5137 ?auto_5147 ) ) ( not ( = ?auto_5137 ?auto_5152 ) ) ( not ( = ?auto_5137 ?auto_5149 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5129 ?auto_5130 ?auto_5131 ?auto_5132 ?auto_5133 ?auto_5134 )
      ( MAKE-1CRATE ?auto_5134 ?auto_5135 )
      ( MAKE-6CRATE-VERIFY ?auto_5129 ?auto_5130 ?auto_5131 ?auto_5132 ?auto_5133 ?auto_5134 ?auto_5135 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5173 - SURFACE
      ?auto_5174 - SURFACE
      ?auto_5175 - SURFACE
      ?auto_5176 - SURFACE
      ?auto_5177 - SURFACE
      ?auto_5178 - SURFACE
      ?auto_5179 - SURFACE
      ?auto_5180 - SURFACE
    )
    :vars
    (
      ?auto_5186 - HOIST
      ?auto_5184 - PLACE
      ?auto_5185 - PLACE
      ?auto_5181 - HOIST
      ?auto_5182 - SURFACE
      ?auto_5188 - PLACE
      ?auto_5194 - HOIST
      ?auto_5201 - SURFACE
      ?auto_5200 - PLACE
      ?auto_5202 - HOIST
      ?auto_5193 - SURFACE
      ?auto_5199 - PLACE
      ?auto_5196 - HOIST
      ?auto_5195 - SURFACE
      ?auto_5191 - PLACE
      ?auto_5197 - HOIST
      ?auto_5190 - SURFACE
      ?auto_5198 - PLACE
      ?auto_5187 - HOIST
      ?auto_5192 - SURFACE
      ?auto_5189 - SURFACE
      ?auto_5183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5186 ?auto_5184 ) ( IS-CRATE ?auto_5180 ) ( not ( = ?auto_5185 ?auto_5184 ) ) ( HOIST-AT ?auto_5181 ?auto_5185 ) ( AVAILABLE ?auto_5181 ) ( SURFACE-AT ?auto_5180 ?auto_5185 ) ( ON ?auto_5180 ?auto_5182 ) ( CLEAR ?auto_5180 ) ( not ( = ?auto_5179 ?auto_5180 ) ) ( not ( = ?auto_5179 ?auto_5182 ) ) ( not ( = ?auto_5180 ?auto_5182 ) ) ( not ( = ?auto_5186 ?auto_5181 ) ) ( IS-CRATE ?auto_5179 ) ( not ( = ?auto_5188 ?auto_5184 ) ) ( HOIST-AT ?auto_5194 ?auto_5188 ) ( AVAILABLE ?auto_5194 ) ( SURFACE-AT ?auto_5179 ?auto_5188 ) ( ON ?auto_5179 ?auto_5201 ) ( CLEAR ?auto_5179 ) ( not ( = ?auto_5178 ?auto_5179 ) ) ( not ( = ?auto_5178 ?auto_5201 ) ) ( not ( = ?auto_5179 ?auto_5201 ) ) ( not ( = ?auto_5186 ?auto_5194 ) ) ( IS-CRATE ?auto_5178 ) ( not ( = ?auto_5200 ?auto_5184 ) ) ( HOIST-AT ?auto_5202 ?auto_5200 ) ( AVAILABLE ?auto_5202 ) ( SURFACE-AT ?auto_5178 ?auto_5200 ) ( ON ?auto_5178 ?auto_5193 ) ( CLEAR ?auto_5178 ) ( not ( = ?auto_5177 ?auto_5178 ) ) ( not ( = ?auto_5177 ?auto_5193 ) ) ( not ( = ?auto_5178 ?auto_5193 ) ) ( not ( = ?auto_5186 ?auto_5202 ) ) ( IS-CRATE ?auto_5177 ) ( not ( = ?auto_5199 ?auto_5184 ) ) ( HOIST-AT ?auto_5196 ?auto_5199 ) ( SURFACE-AT ?auto_5177 ?auto_5199 ) ( ON ?auto_5177 ?auto_5195 ) ( CLEAR ?auto_5177 ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( not ( = ?auto_5176 ?auto_5195 ) ) ( not ( = ?auto_5177 ?auto_5195 ) ) ( not ( = ?auto_5186 ?auto_5196 ) ) ( IS-CRATE ?auto_5176 ) ( not ( = ?auto_5191 ?auto_5184 ) ) ( HOIST-AT ?auto_5197 ?auto_5191 ) ( AVAILABLE ?auto_5197 ) ( SURFACE-AT ?auto_5176 ?auto_5191 ) ( ON ?auto_5176 ?auto_5190 ) ( CLEAR ?auto_5176 ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5190 ) ) ( not ( = ?auto_5176 ?auto_5190 ) ) ( not ( = ?auto_5186 ?auto_5197 ) ) ( IS-CRATE ?auto_5175 ) ( not ( = ?auto_5198 ?auto_5184 ) ) ( HOIST-AT ?auto_5187 ?auto_5198 ) ( AVAILABLE ?auto_5187 ) ( SURFACE-AT ?auto_5175 ?auto_5198 ) ( ON ?auto_5175 ?auto_5192 ) ( CLEAR ?auto_5175 ) ( not ( = ?auto_5174 ?auto_5175 ) ) ( not ( = ?auto_5174 ?auto_5192 ) ) ( not ( = ?auto_5175 ?auto_5192 ) ) ( not ( = ?auto_5186 ?auto_5187 ) ) ( SURFACE-AT ?auto_5173 ?auto_5184 ) ( CLEAR ?auto_5173 ) ( IS-CRATE ?auto_5174 ) ( AVAILABLE ?auto_5186 ) ( AVAILABLE ?auto_5196 ) ( SURFACE-AT ?auto_5174 ?auto_5199 ) ( ON ?auto_5174 ?auto_5189 ) ( CLEAR ?auto_5174 ) ( TRUCK-AT ?auto_5183 ?auto_5184 ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5173 ?auto_5189 ) ) ( not ( = ?auto_5174 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5192 ) ) ( not ( = ?auto_5175 ?auto_5189 ) ) ( not ( = ?auto_5198 ?auto_5199 ) ) ( not ( = ?auto_5187 ?auto_5196 ) ) ( not ( = ?auto_5192 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5173 ?auto_5190 ) ) ( not ( = ?auto_5174 ?auto_5176 ) ) ( not ( = ?auto_5174 ?auto_5190 ) ) ( not ( = ?auto_5176 ?auto_5192 ) ) ( not ( = ?auto_5176 ?auto_5189 ) ) ( not ( = ?auto_5191 ?auto_5198 ) ) ( not ( = ?auto_5191 ?auto_5199 ) ) ( not ( = ?auto_5197 ?auto_5187 ) ) ( not ( = ?auto_5197 ?auto_5196 ) ) ( not ( = ?auto_5190 ?auto_5192 ) ) ( not ( = ?auto_5190 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5177 ) ) ( not ( = ?auto_5173 ?auto_5195 ) ) ( not ( = ?auto_5174 ?auto_5177 ) ) ( not ( = ?auto_5174 ?auto_5195 ) ) ( not ( = ?auto_5175 ?auto_5177 ) ) ( not ( = ?auto_5175 ?auto_5195 ) ) ( not ( = ?auto_5177 ?auto_5190 ) ) ( not ( = ?auto_5177 ?auto_5192 ) ) ( not ( = ?auto_5177 ?auto_5189 ) ) ( not ( = ?auto_5195 ?auto_5190 ) ) ( not ( = ?auto_5195 ?auto_5192 ) ) ( not ( = ?auto_5195 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5178 ) ) ( not ( = ?auto_5173 ?auto_5193 ) ) ( not ( = ?auto_5174 ?auto_5178 ) ) ( not ( = ?auto_5174 ?auto_5193 ) ) ( not ( = ?auto_5175 ?auto_5178 ) ) ( not ( = ?auto_5175 ?auto_5193 ) ) ( not ( = ?auto_5176 ?auto_5178 ) ) ( not ( = ?auto_5176 ?auto_5193 ) ) ( not ( = ?auto_5178 ?auto_5195 ) ) ( not ( = ?auto_5178 ?auto_5190 ) ) ( not ( = ?auto_5178 ?auto_5192 ) ) ( not ( = ?auto_5178 ?auto_5189 ) ) ( not ( = ?auto_5200 ?auto_5199 ) ) ( not ( = ?auto_5200 ?auto_5191 ) ) ( not ( = ?auto_5200 ?auto_5198 ) ) ( not ( = ?auto_5202 ?auto_5196 ) ) ( not ( = ?auto_5202 ?auto_5197 ) ) ( not ( = ?auto_5202 ?auto_5187 ) ) ( not ( = ?auto_5193 ?auto_5195 ) ) ( not ( = ?auto_5193 ?auto_5190 ) ) ( not ( = ?auto_5193 ?auto_5192 ) ) ( not ( = ?auto_5193 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5179 ) ) ( not ( = ?auto_5173 ?auto_5201 ) ) ( not ( = ?auto_5174 ?auto_5179 ) ) ( not ( = ?auto_5174 ?auto_5201 ) ) ( not ( = ?auto_5175 ?auto_5179 ) ) ( not ( = ?auto_5175 ?auto_5201 ) ) ( not ( = ?auto_5176 ?auto_5179 ) ) ( not ( = ?auto_5176 ?auto_5201 ) ) ( not ( = ?auto_5177 ?auto_5179 ) ) ( not ( = ?auto_5177 ?auto_5201 ) ) ( not ( = ?auto_5179 ?auto_5193 ) ) ( not ( = ?auto_5179 ?auto_5195 ) ) ( not ( = ?auto_5179 ?auto_5190 ) ) ( not ( = ?auto_5179 ?auto_5192 ) ) ( not ( = ?auto_5179 ?auto_5189 ) ) ( not ( = ?auto_5188 ?auto_5200 ) ) ( not ( = ?auto_5188 ?auto_5199 ) ) ( not ( = ?auto_5188 ?auto_5191 ) ) ( not ( = ?auto_5188 ?auto_5198 ) ) ( not ( = ?auto_5194 ?auto_5202 ) ) ( not ( = ?auto_5194 ?auto_5196 ) ) ( not ( = ?auto_5194 ?auto_5197 ) ) ( not ( = ?auto_5194 ?auto_5187 ) ) ( not ( = ?auto_5201 ?auto_5193 ) ) ( not ( = ?auto_5201 ?auto_5195 ) ) ( not ( = ?auto_5201 ?auto_5190 ) ) ( not ( = ?auto_5201 ?auto_5192 ) ) ( not ( = ?auto_5201 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5180 ) ) ( not ( = ?auto_5173 ?auto_5182 ) ) ( not ( = ?auto_5174 ?auto_5180 ) ) ( not ( = ?auto_5174 ?auto_5182 ) ) ( not ( = ?auto_5175 ?auto_5180 ) ) ( not ( = ?auto_5175 ?auto_5182 ) ) ( not ( = ?auto_5176 ?auto_5180 ) ) ( not ( = ?auto_5176 ?auto_5182 ) ) ( not ( = ?auto_5177 ?auto_5180 ) ) ( not ( = ?auto_5177 ?auto_5182 ) ) ( not ( = ?auto_5178 ?auto_5180 ) ) ( not ( = ?auto_5178 ?auto_5182 ) ) ( not ( = ?auto_5180 ?auto_5201 ) ) ( not ( = ?auto_5180 ?auto_5193 ) ) ( not ( = ?auto_5180 ?auto_5195 ) ) ( not ( = ?auto_5180 ?auto_5190 ) ) ( not ( = ?auto_5180 ?auto_5192 ) ) ( not ( = ?auto_5180 ?auto_5189 ) ) ( not ( = ?auto_5185 ?auto_5188 ) ) ( not ( = ?auto_5185 ?auto_5200 ) ) ( not ( = ?auto_5185 ?auto_5199 ) ) ( not ( = ?auto_5185 ?auto_5191 ) ) ( not ( = ?auto_5185 ?auto_5198 ) ) ( not ( = ?auto_5181 ?auto_5194 ) ) ( not ( = ?auto_5181 ?auto_5202 ) ) ( not ( = ?auto_5181 ?auto_5196 ) ) ( not ( = ?auto_5181 ?auto_5197 ) ) ( not ( = ?auto_5181 ?auto_5187 ) ) ( not ( = ?auto_5182 ?auto_5201 ) ) ( not ( = ?auto_5182 ?auto_5193 ) ) ( not ( = ?auto_5182 ?auto_5195 ) ) ( not ( = ?auto_5182 ?auto_5190 ) ) ( not ( = ?auto_5182 ?auto_5192 ) ) ( not ( = ?auto_5182 ?auto_5189 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5177 ?auto_5178 ?auto_5179 )
      ( MAKE-1CRATE ?auto_5179 ?auto_5180 )
      ( MAKE-7CRATE-VERIFY ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5177 ?auto_5178 ?auto_5179 ?auto_5180 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5222 - SURFACE
      ?auto_5223 - SURFACE
      ?auto_5224 - SURFACE
      ?auto_5225 - SURFACE
      ?auto_5226 - SURFACE
      ?auto_5227 - SURFACE
      ?auto_5228 - SURFACE
      ?auto_5229 - SURFACE
      ?auto_5230 - SURFACE
    )
    :vars
    (
      ?auto_5236 - HOIST
      ?auto_5235 - PLACE
      ?auto_5231 - PLACE
      ?auto_5232 - HOIST
      ?auto_5233 - SURFACE
      ?auto_5252 - PLACE
      ?auto_5238 - HOIST
      ?auto_5251 - SURFACE
      ?auto_5237 - PLACE
      ?auto_5248 - HOIST
      ?auto_5253 - SURFACE
      ?auto_5246 - PLACE
      ?auto_5245 - HOIST
      ?auto_5241 - SURFACE
      ?auto_5240 - PLACE
      ?auto_5250 - HOIST
      ?auto_5242 - SURFACE
      ?auto_5243 - PLACE
      ?auto_5249 - HOIST
      ?auto_5247 - SURFACE
      ?auto_5239 - SURFACE
      ?auto_5244 - SURFACE
      ?auto_5234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5236 ?auto_5235 ) ( IS-CRATE ?auto_5230 ) ( not ( = ?auto_5231 ?auto_5235 ) ) ( HOIST-AT ?auto_5232 ?auto_5231 ) ( SURFACE-AT ?auto_5230 ?auto_5231 ) ( ON ?auto_5230 ?auto_5233 ) ( CLEAR ?auto_5230 ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5233 ) ) ( not ( = ?auto_5230 ?auto_5233 ) ) ( not ( = ?auto_5236 ?auto_5232 ) ) ( IS-CRATE ?auto_5229 ) ( not ( = ?auto_5252 ?auto_5235 ) ) ( HOIST-AT ?auto_5238 ?auto_5252 ) ( AVAILABLE ?auto_5238 ) ( SURFACE-AT ?auto_5229 ?auto_5252 ) ( ON ?auto_5229 ?auto_5251 ) ( CLEAR ?auto_5229 ) ( not ( = ?auto_5228 ?auto_5229 ) ) ( not ( = ?auto_5228 ?auto_5251 ) ) ( not ( = ?auto_5229 ?auto_5251 ) ) ( not ( = ?auto_5236 ?auto_5238 ) ) ( IS-CRATE ?auto_5228 ) ( not ( = ?auto_5237 ?auto_5235 ) ) ( HOIST-AT ?auto_5248 ?auto_5237 ) ( AVAILABLE ?auto_5248 ) ( SURFACE-AT ?auto_5228 ?auto_5237 ) ( ON ?auto_5228 ?auto_5253 ) ( CLEAR ?auto_5228 ) ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5227 ?auto_5253 ) ) ( not ( = ?auto_5228 ?auto_5253 ) ) ( not ( = ?auto_5236 ?auto_5248 ) ) ( IS-CRATE ?auto_5227 ) ( not ( = ?auto_5246 ?auto_5235 ) ) ( HOIST-AT ?auto_5245 ?auto_5246 ) ( AVAILABLE ?auto_5245 ) ( SURFACE-AT ?auto_5227 ?auto_5246 ) ( ON ?auto_5227 ?auto_5241 ) ( CLEAR ?auto_5227 ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5241 ) ) ( not ( = ?auto_5227 ?auto_5241 ) ) ( not ( = ?auto_5236 ?auto_5245 ) ) ( IS-CRATE ?auto_5226 ) ( not ( = ?auto_5240 ?auto_5235 ) ) ( HOIST-AT ?auto_5250 ?auto_5240 ) ( SURFACE-AT ?auto_5226 ?auto_5240 ) ( ON ?auto_5226 ?auto_5242 ) ( CLEAR ?auto_5226 ) ( not ( = ?auto_5225 ?auto_5226 ) ) ( not ( = ?auto_5225 ?auto_5242 ) ) ( not ( = ?auto_5226 ?auto_5242 ) ) ( not ( = ?auto_5236 ?auto_5250 ) ) ( IS-CRATE ?auto_5225 ) ( not ( = ?auto_5243 ?auto_5235 ) ) ( HOIST-AT ?auto_5249 ?auto_5243 ) ( AVAILABLE ?auto_5249 ) ( SURFACE-AT ?auto_5225 ?auto_5243 ) ( ON ?auto_5225 ?auto_5247 ) ( CLEAR ?auto_5225 ) ( not ( = ?auto_5224 ?auto_5225 ) ) ( not ( = ?auto_5224 ?auto_5247 ) ) ( not ( = ?auto_5225 ?auto_5247 ) ) ( not ( = ?auto_5236 ?auto_5249 ) ) ( IS-CRATE ?auto_5224 ) ( AVAILABLE ?auto_5232 ) ( SURFACE-AT ?auto_5224 ?auto_5231 ) ( ON ?auto_5224 ?auto_5239 ) ( CLEAR ?auto_5224 ) ( not ( = ?auto_5223 ?auto_5224 ) ) ( not ( = ?auto_5223 ?auto_5239 ) ) ( not ( = ?auto_5224 ?auto_5239 ) ) ( SURFACE-AT ?auto_5222 ?auto_5235 ) ( CLEAR ?auto_5222 ) ( IS-CRATE ?auto_5223 ) ( AVAILABLE ?auto_5236 ) ( AVAILABLE ?auto_5250 ) ( SURFACE-AT ?auto_5223 ?auto_5240 ) ( ON ?auto_5223 ?auto_5244 ) ( CLEAR ?auto_5223 ) ( TRUCK-AT ?auto_5234 ?auto_5235 ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( not ( = ?auto_5222 ?auto_5244 ) ) ( not ( = ?auto_5223 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5224 ) ) ( not ( = ?auto_5222 ?auto_5239 ) ) ( not ( = ?auto_5224 ?auto_5244 ) ) ( not ( = ?auto_5231 ?auto_5240 ) ) ( not ( = ?auto_5232 ?auto_5250 ) ) ( not ( = ?auto_5239 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5225 ) ) ( not ( = ?auto_5222 ?auto_5247 ) ) ( not ( = ?auto_5223 ?auto_5225 ) ) ( not ( = ?auto_5223 ?auto_5247 ) ) ( not ( = ?auto_5225 ?auto_5239 ) ) ( not ( = ?auto_5225 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5231 ) ) ( not ( = ?auto_5243 ?auto_5240 ) ) ( not ( = ?auto_5249 ?auto_5232 ) ) ( not ( = ?auto_5249 ?auto_5250 ) ) ( not ( = ?auto_5247 ?auto_5239 ) ) ( not ( = ?auto_5247 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5226 ) ) ( not ( = ?auto_5222 ?auto_5242 ) ) ( not ( = ?auto_5223 ?auto_5226 ) ) ( not ( = ?auto_5223 ?auto_5242 ) ) ( not ( = ?auto_5224 ?auto_5226 ) ) ( not ( = ?auto_5224 ?auto_5242 ) ) ( not ( = ?auto_5226 ?auto_5247 ) ) ( not ( = ?auto_5226 ?auto_5239 ) ) ( not ( = ?auto_5226 ?auto_5244 ) ) ( not ( = ?auto_5242 ?auto_5247 ) ) ( not ( = ?auto_5242 ?auto_5239 ) ) ( not ( = ?auto_5242 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5227 ) ) ( not ( = ?auto_5222 ?auto_5241 ) ) ( not ( = ?auto_5223 ?auto_5227 ) ) ( not ( = ?auto_5223 ?auto_5241 ) ) ( not ( = ?auto_5224 ?auto_5227 ) ) ( not ( = ?auto_5224 ?auto_5241 ) ) ( not ( = ?auto_5225 ?auto_5227 ) ) ( not ( = ?auto_5225 ?auto_5241 ) ) ( not ( = ?auto_5227 ?auto_5242 ) ) ( not ( = ?auto_5227 ?auto_5247 ) ) ( not ( = ?auto_5227 ?auto_5239 ) ) ( not ( = ?auto_5227 ?auto_5244 ) ) ( not ( = ?auto_5246 ?auto_5240 ) ) ( not ( = ?auto_5246 ?auto_5243 ) ) ( not ( = ?auto_5246 ?auto_5231 ) ) ( not ( = ?auto_5245 ?auto_5250 ) ) ( not ( = ?auto_5245 ?auto_5249 ) ) ( not ( = ?auto_5245 ?auto_5232 ) ) ( not ( = ?auto_5241 ?auto_5242 ) ) ( not ( = ?auto_5241 ?auto_5247 ) ) ( not ( = ?auto_5241 ?auto_5239 ) ) ( not ( = ?auto_5241 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5228 ) ) ( not ( = ?auto_5222 ?auto_5253 ) ) ( not ( = ?auto_5223 ?auto_5228 ) ) ( not ( = ?auto_5223 ?auto_5253 ) ) ( not ( = ?auto_5224 ?auto_5228 ) ) ( not ( = ?auto_5224 ?auto_5253 ) ) ( not ( = ?auto_5225 ?auto_5228 ) ) ( not ( = ?auto_5225 ?auto_5253 ) ) ( not ( = ?auto_5226 ?auto_5228 ) ) ( not ( = ?auto_5226 ?auto_5253 ) ) ( not ( = ?auto_5228 ?auto_5241 ) ) ( not ( = ?auto_5228 ?auto_5242 ) ) ( not ( = ?auto_5228 ?auto_5247 ) ) ( not ( = ?auto_5228 ?auto_5239 ) ) ( not ( = ?auto_5228 ?auto_5244 ) ) ( not ( = ?auto_5237 ?auto_5246 ) ) ( not ( = ?auto_5237 ?auto_5240 ) ) ( not ( = ?auto_5237 ?auto_5243 ) ) ( not ( = ?auto_5237 ?auto_5231 ) ) ( not ( = ?auto_5248 ?auto_5245 ) ) ( not ( = ?auto_5248 ?auto_5250 ) ) ( not ( = ?auto_5248 ?auto_5249 ) ) ( not ( = ?auto_5248 ?auto_5232 ) ) ( not ( = ?auto_5253 ?auto_5241 ) ) ( not ( = ?auto_5253 ?auto_5242 ) ) ( not ( = ?auto_5253 ?auto_5247 ) ) ( not ( = ?auto_5253 ?auto_5239 ) ) ( not ( = ?auto_5253 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5229 ) ) ( not ( = ?auto_5222 ?auto_5251 ) ) ( not ( = ?auto_5223 ?auto_5229 ) ) ( not ( = ?auto_5223 ?auto_5251 ) ) ( not ( = ?auto_5224 ?auto_5229 ) ) ( not ( = ?auto_5224 ?auto_5251 ) ) ( not ( = ?auto_5225 ?auto_5229 ) ) ( not ( = ?auto_5225 ?auto_5251 ) ) ( not ( = ?auto_5226 ?auto_5229 ) ) ( not ( = ?auto_5226 ?auto_5251 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( not ( = ?auto_5227 ?auto_5251 ) ) ( not ( = ?auto_5229 ?auto_5253 ) ) ( not ( = ?auto_5229 ?auto_5241 ) ) ( not ( = ?auto_5229 ?auto_5242 ) ) ( not ( = ?auto_5229 ?auto_5247 ) ) ( not ( = ?auto_5229 ?auto_5239 ) ) ( not ( = ?auto_5229 ?auto_5244 ) ) ( not ( = ?auto_5252 ?auto_5237 ) ) ( not ( = ?auto_5252 ?auto_5246 ) ) ( not ( = ?auto_5252 ?auto_5240 ) ) ( not ( = ?auto_5252 ?auto_5243 ) ) ( not ( = ?auto_5252 ?auto_5231 ) ) ( not ( = ?auto_5238 ?auto_5248 ) ) ( not ( = ?auto_5238 ?auto_5245 ) ) ( not ( = ?auto_5238 ?auto_5250 ) ) ( not ( = ?auto_5238 ?auto_5249 ) ) ( not ( = ?auto_5238 ?auto_5232 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( not ( = ?auto_5251 ?auto_5241 ) ) ( not ( = ?auto_5251 ?auto_5242 ) ) ( not ( = ?auto_5251 ?auto_5247 ) ) ( not ( = ?auto_5251 ?auto_5239 ) ) ( not ( = ?auto_5251 ?auto_5244 ) ) ( not ( = ?auto_5222 ?auto_5230 ) ) ( not ( = ?auto_5222 ?auto_5233 ) ) ( not ( = ?auto_5223 ?auto_5230 ) ) ( not ( = ?auto_5223 ?auto_5233 ) ) ( not ( = ?auto_5224 ?auto_5230 ) ) ( not ( = ?auto_5224 ?auto_5233 ) ) ( not ( = ?auto_5225 ?auto_5230 ) ) ( not ( = ?auto_5225 ?auto_5233 ) ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5226 ?auto_5233 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5227 ?auto_5233 ) ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5228 ?auto_5233 ) ) ( not ( = ?auto_5230 ?auto_5251 ) ) ( not ( = ?auto_5230 ?auto_5253 ) ) ( not ( = ?auto_5230 ?auto_5241 ) ) ( not ( = ?auto_5230 ?auto_5242 ) ) ( not ( = ?auto_5230 ?auto_5247 ) ) ( not ( = ?auto_5230 ?auto_5239 ) ) ( not ( = ?auto_5230 ?auto_5244 ) ) ( not ( = ?auto_5233 ?auto_5251 ) ) ( not ( = ?auto_5233 ?auto_5253 ) ) ( not ( = ?auto_5233 ?auto_5241 ) ) ( not ( = ?auto_5233 ?auto_5242 ) ) ( not ( = ?auto_5233 ?auto_5247 ) ) ( not ( = ?auto_5233 ?auto_5239 ) ) ( not ( = ?auto_5233 ?auto_5244 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5222 ?auto_5223 ?auto_5224 ?auto_5225 ?auto_5226 ?auto_5227 ?auto_5228 ?auto_5229 )
      ( MAKE-1CRATE ?auto_5229 ?auto_5230 )
      ( MAKE-8CRATE-VERIFY ?auto_5222 ?auto_5223 ?auto_5224 ?auto_5225 ?auto_5226 ?auto_5227 ?auto_5228 ?auto_5229 ?auto_5230 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5274 - SURFACE
      ?auto_5275 - SURFACE
      ?auto_5276 - SURFACE
      ?auto_5277 - SURFACE
      ?auto_5278 - SURFACE
      ?auto_5279 - SURFACE
      ?auto_5280 - SURFACE
      ?auto_5281 - SURFACE
      ?auto_5282 - SURFACE
      ?auto_5283 - SURFACE
    )
    :vars
    (
      ?auto_5287 - HOIST
      ?auto_5289 - PLACE
      ?auto_5288 - PLACE
      ?auto_5284 - HOIST
      ?auto_5286 - SURFACE
      ?auto_5307 - PLACE
      ?auto_5298 - HOIST
      ?auto_5297 - SURFACE
      ?auto_5306 - PLACE
      ?auto_5293 - HOIST
      ?auto_5301 - SURFACE
      ?auto_5299 - PLACE
      ?auto_5291 - HOIST
      ?auto_5300 - SURFACE
      ?auto_5292 - PLACE
      ?auto_5305 - HOIST
      ?auto_5304 - SURFACE
      ?auto_5296 - SURFACE
      ?auto_5294 - PLACE
      ?auto_5295 - HOIST
      ?auto_5290 - SURFACE
      ?auto_5303 - SURFACE
      ?auto_5302 - SURFACE
      ?auto_5285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5287 ?auto_5289 ) ( IS-CRATE ?auto_5283 ) ( not ( = ?auto_5288 ?auto_5289 ) ) ( HOIST-AT ?auto_5284 ?auto_5288 ) ( SURFACE-AT ?auto_5283 ?auto_5288 ) ( ON ?auto_5283 ?auto_5286 ) ( CLEAR ?auto_5283 ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5286 ) ) ( not ( = ?auto_5283 ?auto_5286 ) ) ( not ( = ?auto_5287 ?auto_5284 ) ) ( IS-CRATE ?auto_5282 ) ( not ( = ?auto_5307 ?auto_5289 ) ) ( HOIST-AT ?auto_5298 ?auto_5307 ) ( SURFACE-AT ?auto_5282 ?auto_5307 ) ( ON ?auto_5282 ?auto_5297 ) ( CLEAR ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5281 ?auto_5297 ) ) ( not ( = ?auto_5282 ?auto_5297 ) ) ( not ( = ?auto_5287 ?auto_5298 ) ) ( IS-CRATE ?auto_5281 ) ( not ( = ?auto_5306 ?auto_5289 ) ) ( HOIST-AT ?auto_5293 ?auto_5306 ) ( AVAILABLE ?auto_5293 ) ( SURFACE-AT ?auto_5281 ?auto_5306 ) ( ON ?auto_5281 ?auto_5301 ) ( CLEAR ?auto_5281 ) ( not ( = ?auto_5280 ?auto_5281 ) ) ( not ( = ?auto_5280 ?auto_5301 ) ) ( not ( = ?auto_5281 ?auto_5301 ) ) ( not ( = ?auto_5287 ?auto_5293 ) ) ( IS-CRATE ?auto_5280 ) ( not ( = ?auto_5299 ?auto_5289 ) ) ( HOIST-AT ?auto_5291 ?auto_5299 ) ( AVAILABLE ?auto_5291 ) ( SURFACE-AT ?auto_5280 ?auto_5299 ) ( ON ?auto_5280 ?auto_5300 ) ( CLEAR ?auto_5280 ) ( not ( = ?auto_5279 ?auto_5280 ) ) ( not ( = ?auto_5279 ?auto_5300 ) ) ( not ( = ?auto_5280 ?auto_5300 ) ) ( not ( = ?auto_5287 ?auto_5291 ) ) ( IS-CRATE ?auto_5279 ) ( not ( = ?auto_5292 ?auto_5289 ) ) ( HOIST-AT ?auto_5305 ?auto_5292 ) ( AVAILABLE ?auto_5305 ) ( SURFACE-AT ?auto_5279 ?auto_5292 ) ( ON ?auto_5279 ?auto_5304 ) ( CLEAR ?auto_5279 ) ( not ( = ?auto_5278 ?auto_5279 ) ) ( not ( = ?auto_5278 ?auto_5304 ) ) ( not ( = ?auto_5279 ?auto_5304 ) ) ( not ( = ?auto_5287 ?auto_5305 ) ) ( IS-CRATE ?auto_5278 ) ( SURFACE-AT ?auto_5278 ?auto_5288 ) ( ON ?auto_5278 ?auto_5296 ) ( CLEAR ?auto_5278 ) ( not ( = ?auto_5277 ?auto_5278 ) ) ( not ( = ?auto_5277 ?auto_5296 ) ) ( not ( = ?auto_5278 ?auto_5296 ) ) ( IS-CRATE ?auto_5277 ) ( not ( = ?auto_5294 ?auto_5289 ) ) ( HOIST-AT ?auto_5295 ?auto_5294 ) ( AVAILABLE ?auto_5295 ) ( SURFACE-AT ?auto_5277 ?auto_5294 ) ( ON ?auto_5277 ?auto_5290 ) ( CLEAR ?auto_5277 ) ( not ( = ?auto_5276 ?auto_5277 ) ) ( not ( = ?auto_5276 ?auto_5290 ) ) ( not ( = ?auto_5277 ?auto_5290 ) ) ( not ( = ?auto_5287 ?auto_5295 ) ) ( IS-CRATE ?auto_5276 ) ( AVAILABLE ?auto_5298 ) ( SURFACE-AT ?auto_5276 ?auto_5307 ) ( ON ?auto_5276 ?auto_5303 ) ( CLEAR ?auto_5276 ) ( not ( = ?auto_5275 ?auto_5276 ) ) ( not ( = ?auto_5275 ?auto_5303 ) ) ( not ( = ?auto_5276 ?auto_5303 ) ) ( SURFACE-AT ?auto_5274 ?auto_5289 ) ( CLEAR ?auto_5274 ) ( IS-CRATE ?auto_5275 ) ( AVAILABLE ?auto_5287 ) ( AVAILABLE ?auto_5284 ) ( SURFACE-AT ?auto_5275 ?auto_5288 ) ( ON ?auto_5275 ?auto_5302 ) ( CLEAR ?auto_5275 ) ( TRUCK-AT ?auto_5285 ?auto_5289 ) ( not ( = ?auto_5274 ?auto_5275 ) ) ( not ( = ?auto_5274 ?auto_5302 ) ) ( not ( = ?auto_5275 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5276 ) ) ( not ( = ?auto_5274 ?auto_5303 ) ) ( not ( = ?auto_5276 ?auto_5302 ) ) ( not ( = ?auto_5307 ?auto_5288 ) ) ( not ( = ?auto_5298 ?auto_5284 ) ) ( not ( = ?auto_5303 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5277 ) ) ( not ( = ?auto_5274 ?auto_5290 ) ) ( not ( = ?auto_5275 ?auto_5277 ) ) ( not ( = ?auto_5275 ?auto_5290 ) ) ( not ( = ?auto_5277 ?auto_5303 ) ) ( not ( = ?auto_5277 ?auto_5302 ) ) ( not ( = ?auto_5294 ?auto_5307 ) ) ( not ( = ?auto_5294 ?auto_5288 ) ) ( not ( = ?auto_5295 ?auto_5298 ) ) ( not ( = ?auto_5295 ?auto_5284 ) ) ( not ( = ?auto_5290 ?auto_5303 ) ) ( not ( = ?auto_5290 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5278 ) ) ( not ( = ?auto_5274 ?auto_5296 ) ) ( not ( = ?auto_5275 ?auto_5278 ) ) ( not ( = ?auto_5275 ?auto_5296 ) ) ( not ( = ?auto_5276 ?auto_5278 ) ) ( not ( = ?auto_5276 ?auto_5296 ) ) ( not ( = ?auto_5278 ?auto_5290 ) ) ( not ( = ?auto_5278 ?auto_5303 ) ) ( not ( = ?auto_5278 ?auto_5302 ) ) ( not ( = ?auto_5296 ?auto_5290 ) ) ( not ( = ?auto_5296 ?auto_5303 ) ) ( not ( = ?auto_5296 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5279 ) ) ( not ( = ?auto_5274 ?auto_5304 ) ) ( not ( = ?auto_5275 ?auto_5279 ) ) ( not ( = ?auto_5275 ?auto_5304 ) ) ( not ( = ?auto_5276 ?auto_5279 ) ) ( not ( = ?auto_5276 ?auto_5304 ) ) ( not ( = ?auto_5277 ?auto_5279 ) ) ( not ( = ?auto_5277 ?auto_5304 ) ) ( not ( = ?auto_5279 ?auto_5296 ) ) ( not ( = ?auto_5279 ?auto_5290 ) ) ( not ( = ?auto_5279 ?auto_5303 ) ) ( not ( = ?auto_5279 ?auto_5302 ) ) ( not ( = ?auto_5292 ?auto_5288 ) ) ( not ( = ?auto_5292 ?auto_5294 ) ) ( not ( = ?auto_5292 ?auto_5307 ) ) ( not ( = ?auto_5305 ?auto_5284 ) ) ( not ( = ?auto_5305 ?auto_5295 ) ) ( not ( = ?auto_5305 ?auto_5298 ) ) ( not ( = ?auto_5304 ?auto_5296 ) ) ( not ( = ?auto_5304 ?auto_5290 ) ) ( not ( = ?auto_5304 ?auto_5303 ) ) ( not ( = ?auto_5304 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5280 ) ) ( not ( = ?auto_5274 ?auto_5300 ) ) ( not ( = ?auto_5275 ?auto_5280 ) ) ( not ( = ?auto_5275 ?auto_5300 ) ) ( not ( = ?auto_5276 ?auto_5280 ) ) ( not ( = ?auto_5276 ?auto_5300 ) ) ( not ( = ?auto_5277 ?auto_5280 ) ) ( not ( = ?auto_5277 ?auto_5300 ) ) ( not ( = ?auto_5278 ?auto_5280 ) ) ( not ( = ?auto_5278 ?auto_5300 ) ) ( not ( = ?auto_5280 ?auto_5304 ) ) ( not ( = ?auto_5280 ?auto_5296 ) ) ( not ( = ?auto_5280 ?auto_5290 ) ) ( not ( = ?auto_5280 ?auto_5303 ) ) ( not ( = ?auto_5280 ?auto_5302 ) ) ( not ( = ?auto_5299 ?auto_5292 ) ) ( not ( = ?auto_5299 ?auto_5288 ) ) ( not ( = ?auto_5299 ?auto_5294 ) ) ( not ( = ?auto_5299 ?auto_5307 ) ) ( not ( = ?auto_5291 ?auto_5305 ) ) ( not ( = ?auto_5291 ?auto_5284 ) ) ( not ( = ?auto_5291 ?auto_5295 ) ) ( not ( = ?auto_5291 ?auto_5298 ) ) ( not ( = ?auto_5300 ?auto_5304 ) ) ( not ( = ?auto_5300 ?auto_5296 ) ) ( not ( = ?auto_5300 ?auto_5290 ) ) ( not ( = ?auto_5300 ?auto_5303 ) ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5281 ) ) ( not ( = ?auto_5274 ?auto_5301 ) ) ( not ( = ?auto_5275 ?auto_5281 ) ) ( not ( = ?auto_5275 ?auto_5301 ) ) ( not ( = ?auto_5276 ?auto_5281 ) ) ( not ( = ?auto_5276 ?auto_5301 ) ) ( not ( = ?auto_5277 ?auto_5281 ) ) ( not ( = ?auto_5277 ?auto_5301 ) ) ( not ( = ?auto_5278 ?auto_5281 ) ) ( not ( = ?auto_5278 ?auto_5301 ) ) ( not ( = ?auto_5279 ?auto_5281 ) ) ( not ( = ?auto_5279 ?auto_5301 ) ) ( not ( = ?auto_5281 ?auto_5300 ) ) ( not ( = ?auto_5281 ?auto_5304 ) ) ( not ( = ?auto_5281 ?auto_5296 ) ) ( not ( = ?auto_5281 ?auto_5290 ) ) ( not ( = ?auto_5281 ?auto_5303 ) ) ( not ( = ?auto_5281 ?auto_5302 ) ) ( not ( = ?auto_5306 ?auto_5299 ) ) ( not ( = ?auto_5306 ?auto_5292 ) ) ( not ( = ?auto_5306 ?auto_5288 ) ) ( not ( = ?auto_5306 ?auto_5294 ) ) ( not ( = ?auto_5306 ?auto_5307 ) ) ( not ( = ?auto_5293 ?auto_5291 ) ) ( not ( = ?auto_5293 ?auto_5305 ) ) ( not ( = ?auto_5293 ?auto_5284 ) ) ( not ( = ?auto_5293 ?auto_5295 ) ) ( not ( = ?auto_5293 ?auto_5298 ) ) ( not ( = ?auto_5301 ?auto_5300 ) ) ( not ( = ?auto_5301 ?auto_5304 ) ) ( not ( = ?auto_5301 ?auto_5296 ) ) ( not ( = ?auto_5301 ?auto_5290 ) ) ( not ( = ?auto_5301 ?auto_5303 ) ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5282 ) ) ( not ( = ?auto_5274 ?auto_5297 ) ) ( not ( = ?auto_5275 ?auto_5282 ) ) ( not ( = ?auto_5275 ?auto_5297 ) ) ( not ( = ?auto_5276 ?auto_5282 ) ) ( not ( = ?auto_5276 ?auto_5297 ) ) ( not ( = ?auto_5277 ?auto_5282 ) ) ( not ( = ?auto_5277 ?auto_5297 ) ) ( not ( = ?auto_5278 ?auto_5282 ) ) ( not ( = ?auto_5278 ?auto_5297 ) ) ( not ( = ?auto_5279 ?auto_5282 ) ) ( not ( = ?auto_5279 ?auto_5297 ) ) ( not ( = ?auto_5280 ?auto_5282 ) ) ( not ( = ?auto_5280 ?auto_5297 ) ) ( not ( = ?auto_5282 ?auto_5301 ) ) ( not ( = ?auto_5282 ?auto_5300 ) ) ( not ( = ?auto_5282 ?auto_5304 ) ) ( not ( = ?auto_5282 ?auto_5296 ) ) ( not ( = ?auto_5282 ?auto_5290 ) ) ( not ( = ?auto_5282 ?auto_5303 ) ) ( not ( = ?auto_5282 ?auto_5302 ) ) ( not ( = ?auto_5297 ?auto_5301 ) ) ( not ( = ?auto_5297 ?auto_5300 ) ) ( not ( = ?auto_5297 ?auto_5304 ) ) ( not ( = ?auto_5297 ?auto_5296 ) ) ( not ( = ?auto_5297 ?auto_5290 ) ) ( not ( = ?auto_5297 ?auto_5303 ) ) ( not ( = ?auto_5297 ?auto_5302 ) ) ( not ( = ?auto_5274 ?auto_5283 ) ) ( not ( = ?auto_5274 ?auto_5286 ) ) ( not ( = ?auto_5275 ?auto_5283 ) ) ( not ( = ?auto_5275 ?auto_5286 ) ) ( not ( = ?auto_5276 ?auto_5283 ) ) ( not ( = ?auto_5276 ?auto_5286 ) ) ( not ( = ?auto_5277 ?auto_5283 ) ) ( not ( = ?auto_5277 ?auto_5286 ) ) ( not ( = ?auto_5278 ?auto_5283 ) ) ( not ( = ?auto_5278 ?auto_5286 ) ) ( not ( = ?auto_5279 ?auto_5283 ) ) ( not ( = ?auto_5279 ?auto_5286 ) ) ( not ( = ?auto_5280 ?auto_5283 ) ) ( not ( = ?auto_5280 ?auto_5286 ) ) ( not ( = ?auto_5281 ?auto_5283 ) ) ( not ( = ?auto_5281 ?auto_5286 ) ) ( not ( = ?auto_5283 ?auto_5297 ) ) ( not ( = ?auto_5283 ?auto_5301 ) ) ( not ( = ?auto_5283 ?auto_5300 ) ) ( not ( = ?auto_5283 ?auto_5304 ) ) ( not ( = ?auto_5283 ?auto_5296 ) ) ( not ( = ?auto_5283 ?auto_5290 ) ) ( not ( = ?auto_5283 ?auto_5303 ) ) ( not ( = ?auto_5283 ?auto_5302 ) ) ( not ( = ?auto_5286 ?auto_5297 ) ) ( not ( = ?auto_5286 ?auto_5301 ) ) ( not ( = ?auto_5286 ?auto_5300 ) ) ( not ( = ?auto_5286 ?auto_5304 ) ) ( not ( = ?auto_5286 ?auto_5296 ) ) ( not ( = ?auto_5286 ?auto_5290 ) ) ( not ( = ?auto_5286 ?auto_5303 ) ) ( not ( = ?auto_5286 ?auto_5302 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5274 ?auto_5275 ?auto_5276 ?auto_5277 ?auto_5278 ?auto_5279 ?auto_5280 ?auto_5281 ?auto_5282 )
      ( MAKE-1CRATE ?auto_5282 ?auto_5283 )
      ( MAKE-9CRATE-VERIFY ?auto_5274 ?auto_5275 ?auto_5276 ?auto_5277 ?auto_5278 ?auto_5279 ?auto_5280 ?auto_5281 ?auto_5282 ?auto_5283 ) )
  )

)

