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
      ?auto_4922 - SURFACE
      ?auto_4923 - SURFACE
    )
    :vars
    (
      ?auto_4924 - HOIST
      ?auto_4925 - PLACE
      ?auto_4927 - PLACE
      ?auto_4928 - HOIST
      ?auto_4929 - SURFACE
      ?auto_4926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4924 ?auto_4925 ) ( SURFACE-AT ?auto_4923 ?auto_4925 ) ( CLEAR ?auto_4923 ) ( IS-CRATE ?auto_4922 ) ( AVAILABLE ?auto_4924 ) ( not ( = ?auto_4927 ?auto_4925 ) ) ( HOIST-AT ?auto_4928 ?auto_4927 ) ( AVAILABLE ?auto_4928 ) ( SURFACE-AT ?auto_4922 ?auto_4927 ) ( ON ?auto_4922 ?auto_4929 ) ( CLEAR ?auto_4922 ) ( TRUCK-AT ?auto_4926 ?auto_4925 ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( not ( = ?auto_4922 ?auto_4929 ) ) ( not ( = ?auto_4923 ?auto_4929 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4926 ?auto_4925 ?auto_4927 )
      ( !LIFT ?auto_4928 ?auto_4922 ?auto_4929 ?auto_4927 )
      ( !LOAD ?auto_4928 ?auto_4922 ?auto_4926 ?auto_4927 )
      ( !DRIVE ?auto_4926 ?auto_4927 ?auto_4925 )
      ( !UNLOAD ?auto_4924 ?auto_4922 ?auto_4926 ?auto_4925 )
      ( !DROP ?auto_4924 ?auto_4922 ?auto_4923 ?auto_4925 )
      ( MAKE-ON-VERIFY ?auto_4922 ?auto_4923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4932 - SURFACE
      ?auto_4933 - SURFACE
    )
    :vars
    (
      ?auto_4934 - HOIST
      ?auto_4935 - PLACE
      ?auto_4937 - PLACE
      ?auto_4938 - HOIST
      ?auto_4939 - SURFACE
      ?auto_4936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4934 ?auto_4935 ) ( SURFACE-AT ?auto_4933 ?auto_4935 ) ( CLEAR ?auto_4933 ) ( IS-CRATE ?auto_4932 ) ( AVAILABLE ?auto_4934 ) ( not ( = ?auto_4937 ?auto_4935 ) ) ( HOIST-AT ?auto_4938 ?auto_4937 ) ( AVAILABLE ?auto_4938 ) ( SURFACE-AT ?auto_4932 ?auto_4937 ) ( ON ?auto_4932 ?auto_4939 ) ( CLEAR ?auto_4932 ) ( TRUCK-AT ?auto_4936 ?auto_4935 ) ( not ( = ?auto_4932 ?auto_4933 ) ) ( not ( = ?auto_4932 ?auto_4939 ) ) ( not ( = ?auto_4933 ?auto_4939 ) ) ( not ( = ?auto_4934 ?auto_4938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4936 ?auto_4935 ?auto_4937 )
      ( !LIFT ?auto_4938 ?auto_4932 ?auto_4939 ?auto_4937 )
      ( !LOAD ?auto_4938 ?auto_4932 ?auto_4936 ?auto_4937 )
      ( !DRIVE ?auto_4936 ?auto_4937 ?auto_4935 )
      ( !UNLOAD ?auto_4934 ?auto_4932 ?auto_4936 ?auto_4935 )
      ( !DROP ?auto_4934 ?auto_4932 ?auto_4933 ?auto_4935 )
      ( MAKE-ON-VERIFY ?auto_4932 ?auto_4933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4942 - SURFACE
      ?auto_4943 - SURFACE
    )
    :vars
    (
      ?auto_4944 - HOIST
      ?auto_4945 - PLACE
      ?auto_4947 - PLACE
      ?auto_4948 - HOIST
      ?auto_4949 - SURFACE
      ?auto_4946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4944 ?auto_4945 ) ( SURFACE-AT ?auto_4943 ?auto_4945 ) ( CLEAR ?auto_4943 ) ( IS-CRATE ?auto_4942 ) ( AVAILABLE ?auto_4944 ) ( not ( = ?auto_4947 ?auto_4945 ) ) ( HOIST-AT ?auto_4948 ?auto_4947 ) ( AVAILABLE ?auto_4948 ) ( SURFACE-AT ?auto_4942 ?auto_4947 ) ( ON ?auto_4942 ?auto_4949 ) ( CLEAR ?auto_4942 ) ( TRUCK-AT ?auto_4946 ?auto_4945 ) ( not ( = ?auto_4942 ?auto_4943 ) ) ( not ( = ?auto_4942 ?auto_4949 ) ) ( not ( = ?auto_4943 ?auto_4949 ) ) ( not ( = ?auto_4944 ?auto_4948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4946 ?auto_4945 ?auto_4947 )
      ( !LIFT ?auto_4948 ?auto_4942 ?auto_4949 ?auto_4947 )
      ( !LOAD ?auto_4948 ?auto_4942 ?auto_4946 ?auto_4947 )
      ( !DRIVE ?auto_4946 ?auto_4947 ?auto_4945 )
      ( !UNLOAD ?auto_4944 ?auto_4942 ?auto_4946 ?auto_4945 )
      ( !DROP ?auto_4944 ?auto_4942 ?auto_4943 ?auto_4945 )
      ( MAKE-ON-VERIFY ?auto_4942 ?auto_4943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4952 - SURFACE
      ?auto_4953 - SURFACE
    )
    :vars
    (
      ?auto_4954 - HOIST
      ?auto_4955 - PLACE
      ?auto_4957 - PLACE
      ?auto_4958 - HOIST
      ?auto_4959 - SURFACE
      ?auto_4956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4954 ?auto_4955 ) ( SURFACE-AT ?auto_4953 ?auto_4955 ) ( CLEAR ?auto_4953 ) ( IS-CRATE ?auto_4952 ) ( AVAILABLE ?auto_4954 ) ( not ( = ?auto_4957 ?auto_4955 ) ) ( HOIST-AT ?auto_4958 ?auto_4957 ) ( AVAILABLE ?auto_4958 ) ( SURFACE-AT ?auto_4952 ?auto_4957 ) ( ON ?auto_4952 ?auto_4959 ) ( CLEAR ?auto_4952 ) ( TRUCK-AT ?auto_4956 ?auto_4955 ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( not ( = ?auto_4952 ?auto_4959 ) ) ( not ( = ?auto_4953 ?auto_4959 ) ) ( not ( = ?auto_4954 ?auto_4958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4956 ?auto_4955 ?auto_4957 )
      ( !LIFT ?auto_4958 ?auto_4952 ?auto_4959 ?auto_4957 )
      ( !LOAD ?auto_4958 ?auto_4952 ?auto_4956 ?auto_4957 )
      ( !DRIVE ?auto_4956 ?auto_4957 ?auto_4955 )
      ( !UNLOAD ?auto_4954 ?auto_4952 ?auto_4956 ?auto_4955 )
      ( !DROP ?auto_4954 ?auto_4952 ?auto_4953 ?auto_4955 )
      ( MAKE-ON-VERIFY ?auto_4952 ?auto_4953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4962 - SURFACE
      ?auto_4963 - SURFACE
    )
    :vars
    (
      ?auto_4964 - HOIST
      ?auto_4965 - PLACE
      ?auto_4967 - PLACE
      ?auto_4968 - HOIST
      ?auto_4969 - SURFACE
      ?auto_4966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4964 ?auto_4965 ) ( SURFACE-AT ?auto_4963 ?auto_4965 ) ( CLEAR ?auto_4963 ) ( IS-CRATE ?auto_4962 ) ( AVAILABLE ?auto_4964 ) ( not ( = ?auto_4967 ?auto_4965 ) ) ( HOIST-AT ?auto_4968 ?auto_4967 ) ( AVAILABLE ?auto_4968 ) ( SURFACE-AT ?auto_4962 ?auto_4967 ) ( ON ?auto_4962 ?auto_4969 ) ( CLEAR ?auto_4962 ) ( TRUCK-AT ?auto_4966 ?auto_4965 ) ( not ( = ?auto_4962 ?auto_4963 ) ) ( not ( = ?auto_4962 ?auto_4969 ) ) ( not ( = ?auto_4963 ?auto_4969 ) ) ( not ( = ?auto_4964 ?auto_4968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4966 ?auto_4965 ?auto_4967 )
      ( !LIFT ?auto_4968 ?auto_4962 ?auto_4969 ?auto_4967 )
      ( !LOAD ?auto_4968 ?auto_4962 ?auto_4966 ?auto_4967 )
      ( !DRIVE ?auto_4966 ?auto_4967 ?auto_4965 )
      ( !UNLOAD ?auto_4964 ?auto_4962 ?auto_4966 ?auto_4965 )
      ( !DROP ?auto_4964 ?auto_4962 ?auto_4963 ?auto_4965 )
      ( MAKE-ON-VERIFY ?auto_4962 ?auto_4963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4972 - SURFACE
      ?auto_4973 - SURFACE
    )
    :vars
    (
      ?auto_4974 - HOIST
      ?auto_4975 - PLACE
      ?auto_4977 - PLACE
      ?auto_4978 - HOIST
      ?auto_4979 - SURFACE
      ?auto_4976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4974 ?auto_4975 ) ( SURFACE-AT ?auto_4973 ?auto_4975 ) ( CLEAR ?auto_4973 ) ( IS-CRATE ?auto_4972 ) ( AVAILABLE ?auto_4974 ) ( not ( = ?auto_4977 ?auto_4975 ) ) ( HOIST-AT ?auto_4978 ?auto_4977 ) ( AVAILABLE ?auto_4978 ) ( SURFACE-AT ?auto_4972 ?auto_4977 ) ( ON ?auto_4972 ?auto_4979 ) ( CLEAR ?auto_4972 ) ( TRUCK-AT ?auto_4976 ?auto_4975 ) ( not ( = ?auto_4972 ?auto_4973 ) ) ( not ( = ?auto_4972 ?auto_4979 ) ) ( not ( = ?auto_4973 ?auto_4979 ) ) ( not ( = ?auto_4974 ?auto_4978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4976 ?auto_4975 ?auto_4977 )
      ( !LIFT ?auto_4978 ?auto_4972 ?auto_4979 ?auto_4977 )
      ( !LOAD ?auto_4978 ?auto_4972 ?auto_4976 ?auto_4977 )
      ( !DRIVE ?auto_4976 ?auto_4977 ?auto_4975 )
      ( !UNLOAD ?auto_4974 ?auto_4972 ?auto_4976 ?auto_4975 )
      ( !DROP ?auto_4974 ?auto_4972 ?auto_4973 ?auto_4975 )
      ( MAKE-ON-VERIFY ?auto_4972 ?auto_4973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4982 - SURFACE
      ?auto_4983 - SURFACE
    )
    :vars
    (
      ?auto_4984 - HOIST
      ?auto_4985 - PLACE
      ?auto_4987 - PLACE
      ?auto_4988 - HOIST
      ?auto_4989 - SURFACE
      ?auto_4986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4984 ?auto_4985 ) ( SURFACE-AT ?auto_4983 ?auto_4985 ) ( CLEAR ?auto_4983 ) ( IS-CRATE ?auto_4982 ) ( AVAILABLE ?auto_4984 ) ( not ( = ?auto_4987 ?auto_4985 ) ) ( HOIST-AT ?auto_4988 ?auto_4987 ) ( AVAILABLE ?auto_4988 ) ( SURFACE-AT ?auto_4982 ?auto_4987 ) ( ON ?auto_4982 ?auto_4989 ) ( CLEAR ?auto_4982 ) ( TRUCK-AT ?auto_4986 ?auto_4985 ) ( not ( = ?auto_4982 ?auto_4983 ) ) ( not ( = ?auto_4982 ?auto_4989 ) ) ( not ( = ?auto_4983 ?auto_4989 ) ) ( not ( = ?auto_4984 ?auto_4988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4986 ?auto_4985 ?auto_4987 )
      ( !LIFT ?auto_4988 ?auto_4982 ?auto_4989 ?auto_4987 )
      ( !LOAD ?auto_4988 ?auto_4982 ?auto_4986 ?auto_4987 )
      ( !DRIVE ?auto_4986 ?auto_4987 ?auto_4985 )
      ( !UNLOAD ?auto_4984 ?auto_4982 ?auto_4986 ?auto_4985 )
      ( !DROP ?auto_4984 ?auto_4982 ?auto_4983 ?auto_4985 )
      ( MAKE-ON-VERIFY ?auto_4982 ?auto_4983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4992 - SURFACE
      ?auto_4993 - SURFACE
    )
    :vars
    (
      ?auto_4994 - HOIST
      ?auto_4995 - PLACE
      ?auto_4997 - PLACE
      ?auto_4998 - HOIST
      ?auto_4999 - SURFACE
      ?auto_4996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4994 ?auto_4995 ) ( SURFACE-AT ?auto_4993 ?auto_4995 ) ( CLEAR ?auto_4993 ) ( IS-CRATE ?auto_4992 ) ( AVAILABLE ?auto_4994 ) ( not ( = ?auto_4997 ?auto_4995 ) ) ( HOIST-AT ?auto_4998 ?auto_4997 ) ( AVAILABLE ?auto_4998 ) ( SURFACE-AT ?auto_4992 ?auto_4997 ) ( ON ?auto_4992 ?auto_4999 ) ( CLEAR ?auto_4992 ) ( TRUCK-AT ?auto_4996 ?auto_4995 ) ( not ( = ?auto_4992 ?auto_4993 ) ) ( not ( = ?auto_4992 ?auto_4999 ) ) ( not ( = ?auto_4993 ?auto_4999 ) ) ( not ( = ?auto_4994 ?auto_4998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4996 ?auto_4995 ?auto_4997 )
      ( !LIFT ?auto_4998 ?auto_4992 ?auto_4999 ?auto_4997 )
      ( !LOAD ?auto_4998 ?auto_4992 ?auto_4996 ?auto_4997 )
      ( !DRIVE ?auto_4996 ?auto_4997 ?auto_4995 )
      ( !UNLOAD ?auto_4994 ?auto_4992 ?auto_4996 ?auto_4995 )
      ( !DROP ?auto_4994 ?auto_4992 ?auto_4993 ?auto_4995 )
      ( MAKE-ON-VERIFY ?auto_4992 ?auto_4993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5002 - SURFACE
      ?auto_5003 - SURFACE
    )
    :vars
    (
      ?auto_5004 - HOIST
      ?auto_5005 - PLACE
      ?auto_5007 - PLACE
      ?auto_5008 - HOIST
      ?auto_5009 - SURFACE
      ?auto_5006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5004 ?auto_5005 ) ( SURFACE-AT ?auto_5003 ?auto_5005 ) ( CLEAR ?auto_5003 ) ( IS-CRATE ?auto_5002 ) ( AVAILABLE ?auto_5004 ) ( not ( = ?auto_5007 ?auto_5005 ) ) ( HOIST-AT ?auto_5008 ?auto_5007 ) ( AVAILABLE ?auto_5008 ) ( SURFACE-AT ?auto_5002 ?auto_5007 ) ( ON ?auto_5002 ?auto_5009 ) ( CLEAR ?auto_5002 ) ( TRUCK-AT ?auto_5006 ?auto_5005 ) ( not ( = ?auto_5002 ?auto_5003 ) ) ( not ( = ?auto_5002 ?auto_5009 ) ) ( not ( = ?auto_5003 ?auto_5009 ) ) ( not ( = ?auto_5004 ?auto_5008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5006 ?auto_5005 ?auto_5007 )
      ( !LIFT ?auto_5008 ?auto_5002 ?auto_5009 ?auto_5007 )
      ( !LOAD ?auto_5008 ?auto_5002 ?auto_5006 ?auto_5007 )
      ( !DRIVE ?auto_5006 ?auto_5007 ?auto_5005 )
      ( !UNLOAD ?auto_5004 ?auto_5002 ?auto_5006 ?auto_5005 )
      ( !DROP ?auto_5004 ?auto_5002 ?auto_5003 ?auto_5005 )
      ( MAKE-ON-VERIFY ?auto_5002 ?auto_5003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5012 - SURFACE
      ?auto_5013 - SURFACE
    )
    :vars
    (
      ?auto_5014 - HOIST
      ?auto_5015 - PLACE
      ?auto_5017 - PLACE
      ?auto_5018 - HOIST
      ?auto_5019 - SURFACE
      ?auto_5016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5014 ?auto_5015 ) ( SURFACE-AT ?auto_5013 ?auto_5015 ) ( CLEAR ?auto_5013 ) ( IS-CRATE ?auto_5012 ) ( AVAILABLE ?auto_5014 ) ( not ( = ?auto_5017 ?auto_5015 ) ) ( HOIST-AT ?auto_5018 ?auto_5017 ) ( AVAILABLE ?auto_5018 ) ( SURFACE-AT ?auto_5012 ?auto_5017 ) ( ON ?auto_5012 ?auto_5019 ) ( CLEAR ?auto_5012 ) ( TRUCK-AT ?auto_5016 ?auto_5015 ) ( not ( = ?auto_5012 ?auto_5013 ) ) ( not ( = ?auto_5012 ?auto_5019 ) ) ( not ( = ?auto_5013 ?auto_5019 ) ) ( not ( = ?auto_5014 ?auto_5018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5016 ?auto_5015 ?auto_5017 )
      ( !LIFT ?auto_5018 ?auto_5012 ?auto_5019 ?auto_5017 )
      ( !LOAD ?auto_5018 ?auto_5012 ?auto_5016 ?auto_5017 )
      ( !DRIVE ?auto_5016 ?auto_5017 ?auto_5015 )
      ( !UNLOAD ?auto_5014 ?auto_5012 ?auto_5016 ?auto_5015 )
      ( !DROP ?auto_5014 ?auto_5012 ?auto_5013 ?auto_5015 )
      ( MAKE-ON-VERIFY ?auto_5012 ?auto_5013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5022 - SURFACE
      ?auto_5023 - SURFACE
    )
    :vars
    (
      ?auto_5024 - HOIST
      ?auto_5025 - PLACE
      ?auto_5027 - PLACE
      ?auto_5028 - HOIST
      ?auto_5029 - SURFACE
      ?auto_5026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5024 ?auto_5025 ) ( SURFACE-AT ?auto_5023 ?auto_5025 ) ( CLEAR ?auto_5023 ) ( IS-CRATE ?auto_5022 ) ( AVAILABLE ?auto_5024 ) ( not ( = ?auto_5027 ?auto_5025 ) ) ( HOIST-AT ?auto_5028 ?auto_5027 ) ( AVAILABLE ?auto_5028 ) ( SURFACE-AT ?auto_5022 ?auto_5027 ) ( ON ?auto_5022 ?auto_5029 ) ( CLEAR ?auto_5022 ) ( TRUCK-AT ?auto_5026 ?auto_5025 ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5029 ) ) ( not ( = ?auto_5023 ?auto_5029 ) ) ( not ( = ?auto_5024 ?auto_5028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5026 ?auto_5025 ?auto_5027 )
      ( !LIFT ?auto_5028 ?auto_5022 ?auto_5029 ?auto_5027 )
      ( !LOAD ?auto_5028 ?auto_5022 ?auto_5026 ?auto_5027 )
      ( !DRIVE ?auto_5026 ?auto_5027 ?auto_5025 )
      ( !UNLOAD ?auto_5024 ?auto_5022 ?auto_5026 ?auto_5025 )
      ( !DROP ?auto_5024 ?auto_5022 ?auto_5023 ?auto_5025 )
      ( MAKE-ON-VERIFY ?auto_5022 ?auto_5023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5032 - SURFACE
      ?auto_5033 - SURFACE
    )
    :vars
    (
      ?auto_5034 - HOIST
      ?auto_5035 - PLACE
      ?auto_5037 - PLACE
      ?auto_5038 - HOIST
      ?auto_5039 - SURFACE
      ?auto_5036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5034 ?auto_5035 ) ( SURFACE-AT ?auto_5033 ?auto_5035 ) ( CLEAR ?auto_5033 ) ( IS-CRATE ?auto_5032 ) ( AVAILABLE ?auto_5034 ) ( not ( = ?auto_5037 ?auto_5035 ) ) ( HOIST-AT ?auto_5038 ?auto_5037 ) ( AVAILABLE ?auto_5038 ) ( SURFACE-AT ?auto_5032 ?auto_5037 ) ( ON ?auto_5032 ?auto_5039 ) ( CLEAR ?auto_5032 ) ( TRUCK-AT ?auto_5036 ?auto_5035 ) ( not ( = ?auto_5032 ?auto_5033 ) ) ( not ( = ?auto_5032 ?auto_5039 ) ) ( not ( = ?auto_5033 ?auto_5039 ) ) ( not ( = ?auto_5034 ?auto_5038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5036 ?auto_5035 ?auto_5037 )
      ( !LIFT ?auto_5038 ?auto_5032 ?auto_5039 ?auto_5037 )
      ( !LOAD ?auto_5038 ?auto_5032 ?auto_5036 ?auto_5037 )
      ( !DRIVE ?auto_5036 ?auto_5037 ?auto_5035 )
      ( !UNLOAD ?auto_5034 ?auto_5032 ?auto_5036 ?auto_5035 )
      ( !DROP ?auto_5034 ?auto_5032 ?auto_5033 ?auto_5035 )
      ( MAKE-ON-VERIFY ?auto_5032 ?auto_5033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5042 - SURFACE
      ?auto_5043 - SURFACE
    )
    :vars
    (
      ?auto_5044 - HOIST
      ?auto_5045 - PLACE
      ?auto_5047 - PLACE
      ?auto_5048 - HOIST
      ?auto_5049 - SURFACE
      ?auto_5046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5044 ?auto_5045 ) ( SURFACE-AT ?auto_5043 ?auto_5045 ) ( CLEAR ?auto_5043 ) ( IS-CRATE ?auto_5042 ) ( AVAILABLE ?auto_5044 ) ( not ( = ?auto_5047 ?auto_5045 ) ) ( HOIST-AT ?auto_5048 ?auto_5047 ) ( AVAILABLE ?auto_5048 ) ( SURFACE-AT ?auto_5042 ?auto_5047 ) ( ON ?auto_5042 ?auto_5049 ) ( CLEAR ?auto_5042 ) ( TRUCK-AT ?auto_5046 ?auto_5045 ) ( not ( = ?auto_5042 ?auto_5043 ) ) ( not ( = ?auto_5042 ?auto_5049 ) ) ( not ( = ?auto_5043 ?auto_5049 ) ) ( not ( = ?auto_5044 ?auto_5048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5046 ?auto_5045 ?auto_5047 )
      ( !LIFT ?auto_5048 ?auto_5042 ?auto_5049 ?auto_5047 )
      ( !LOAD ?auto_5048 ?auto_5042 ?auto_5046 ?auto_5047 )
      ( !DRIVE ?auto_5046 ?auto_5047 ?auto_5045 )
      ( !UNLOAD ?auto_5044 ?auto_5042 ?auto_5046 ?auto_5045 )
      ( !DROP ?auto_5044 ?auto_5042 ?auto_5043 ?auto_5045 )
      ( MAKE-ON-VERIFY ?auto_5042 ?auto_5043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5052 - SURFACE
      ?auto_5053 - SURFACE
    )
    :vars
    (
      ?auto_5054 - HOIST
      ?auto_5055 - PLACE
      ?auto_5057 - PLACE
      ?auto_5058 - HOIST
      ?auto_5059 - SURFACE
      ?auto_5056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5054 ?auto_5055 ) ( SURFACE-AT ?auto_5053 ?auto_5055 ) ( CLEAR ?auto_5053 ) ( IS-CRATE ?auto_5052 ) ( AVAILABLE ?auto_5054 ) ( not ( = ?auto_5057 ?auto_5055 ) ) ( HOIST-AT ?auto_5058 ?auto_5057 ) ( AVAILABLE ?auto_5058 ) ( SURFACE-AT ?auto_5052 ?auto_5057 ) ( ON ?auto_5052 ?auto_5059 ) ( CLEAR ?auto_5052 ) ( TRUCK-AT ?auto_5056 ?auto_5055 ) ( not ( = ?auto_5052 ?auto_5053 ) ) ( not ( = ?auto_5052 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5059 ) ) ( not ( = ?auto_5054 ?auto_5058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5056 ?auto_5055 ?auto_5057 )
      ( !LIFT ?auto_5058 ?auto_5052 ?auto_5059 ?auto_5057 )
      ( !LOAD ?auto_5058 ?auto_5052 ?auto_5056 ?auto_5057 )
      ( !DRIVE ?auto_5056 ?auto_5057 ?auto_5055 )
      ( !UNLOAD ?auto_5054 ?auto_5052 ?auto_5056 ?auto_5055 )
      ( !DROP ?auto_5054 ?auto_5052 ?auto_5053 ?auto_5055 )
      ( MAKE-ON-VERIFY ?auto_5052 ?auto_5053 ) )
  )

)

