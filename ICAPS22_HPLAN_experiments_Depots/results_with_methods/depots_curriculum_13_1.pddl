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
      ?auto_3982 - SURFACE
      ?auto_3983 - SURFACE
    )
    :vars
    (
      ?auto_3984 - HOIST
      ?auto_3985 - PLACE
      ?auto_3987 - PLACE
      ?auto_3988 - HOIST
      ?auto_3989 - SURFACE
      ?auto_3986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3984 ?auto_3985 ) ( SURFACE-AT ?auto_3983 ?auto_3985 ) ( CLEAR ?auto_3983 ) ( IS-CRATE ?auto_3982 ) ( AVAILABLE ?auto_3984 ) ( not ( = ?auto_3987 ?auto_3985 ) ) ( HOIST-AT ?auto_3988 ?auto_3987 ) ( AVAILABLE ?auto_3988 ) ( SURFACE-AT ?auto_3982 ?auto_3987 ) ( ON ?auto_3982 ?auto_3989 ) ( CLEAR ?auto_3982 ) ( TRUCK-AT ?auto_3986 ?auto_3985 ) ( not ( = ?auto_3982 ?auto_3983 ) ) ( not ( = ?auto_3982 ?auto_3989 ) ) ( not ( = ?auto_3983 ?auto_3989 ) ) ( not ( = ?auto_3984 ?auto_3988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3986 ?auto_3985 ?auto_3987 )
      ( !LIFT ?auto_3988 ?auto_3982 ?auto_3989 ?auto_3987 )
      ( !LOAD ?auto_3988 ?auto_3982 ?auto_3986 ?auto_3987 )
      ( !DRIVE ?auto_3986 ?auto_3987 ?auto_3985 )
      ( !UNLOAD ?auto_3984 ?auto_3982 ?auto_3986 ?auto_3985 )
      ( !DROP ?auto_3984 ?auto_3982 ?auto_3983 ?auto_3985 )
      ( MAKE-ON-VERIFY ?auto_3982 ?auto_3983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3992 - SURFACE
      ?auto_3993 - SURFACE
    )
    :vars
    (
      ?auto_3994 - HOIST
      ?auto_3995 - PLACE
      ?auto_3997 - PLACE
      ?auto_3998 - HOIST
      ?auto_3999 - SURFACE
      ?auto_3996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3994 ?auto_3995 ) ( SURFACE-AT ?auto_3993 ?auto_3995 ) ( CLEAR ?auto_3993 ) ( IS-CRATE ?auto_3992 ) ( AVAILABLE ?auto_3994 ) ( not ( = ?auto_3997 ?auto_3995 ) ) ( HOIST-AT ?auto_3998 ?auto_3997 ) ( AVAILABLE ?auto_3998 ) ( SURFACE-AT ?auto_3992 ?auto_3997 ) ( ON ?auto_3992 ?auto_3999 ) ( CLEAR ?auto_3992 ) ( TRUCK-AT ?auto_3996 ?auto_3995 ) ( not ( = ?auto_3992 ?auto_3993 ) ) ( not ( = ?auto_3992 ?auto_3999 ) ) ( not ( = ?auto_3993 ?auto_3999 ) ) ( not ( = ?auto_3994 ?auto_3998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3996 ?auto_3995 ?auto_3997 )
      ( !LIFT ?auto_3998 ?auto_3992 ?auto_3999 ?auto_3997 )
      ( !LOAD ?auto_3998 ?auto_3992 ?auto_3996 ?auto_3997 )
      ( !DRIVE ?auto_3996 ?auto_3997 ?auto_3995 )
      ( !UNLOAD ?auto_3994 ?auto_3992 ?auto_3996 ?auto_3995 )
      ( !DROP ?auto_3994 ?auto_3992 ?auto_3993 ?auto_3995 )
      ( MAKE-ON-VERIFY ?auto_3992 ?auto_3993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4002 - SURFACE
      ?auto_4003 - SURFACE
    )
    :vars
    (
      ?auto_4004 - HOIST
      ?auto_4005 - PLACE
      ?auto_4007 - PLACE
      ?auto_4008 - HOIST
      ?auto_4009 - SURFACE
      ?auto_4006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4004 ?auto_4005 ) ( SURFACE-AT ?auto_4003 ?auto_4005 ) ( CLEAR ?auto_4003 ) ( IS-CRATE ?auto_4002 ) ( AVAILABLE ?auto_4004 ) ( not ( = ?auto_4007 ?auto_4005 ) ) ( HOIST-AT ?auto_4008 ?auto_4007 ) ( AVAILABLE ?auto_4008 ) ( SURFACE-AT ?auto_4002 ?auto_4007 ) ( ON ?auto_4002 ?auto_4009 ) ( CLEAR ?auto_4002 ) ( TRUCK-AT ?auto_4006 ?auto_4005 ) ( not ( = ?auto_4002 ?auto_4003 ) ) ( not ( = ?auto_4002 ?auto_4009 ) ) ( not ( = ?auto_4003 ?auto_4009 ) ) ( not ( = ?auto_4004 ?auto_4008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4006 ?auto_4005 ?auto_4007 )
      ( !LIFT ?auto_4008 ?auto_4002 ?auto_4009 ?auto_4007 )
      ( !LOAD ?auto_4008 ?auto_4002 ?auto_4006 ?auto_4007 )
      ( !DRIVE ?auto_4006 ?auto_4007 ?auto_4005 )
      ( !UNLOAD ?auto_4004 ?auto_4002 ?auto_4006 ?auto_4005 )
      ( !DROP ?auto_4004 ?auto_4002 ?auto_4003 ?auto_4005 )
      ( MAKE-ON-VERIFY ?auto_4002 ?auto_4003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4012 - SURFACE
      ?auto_4013 - SURFACE
    )
    :vars
    (
      ?auto_4014 - HOIST
      ?auto_4015 - PLACE
      ?auto_4017 - PLACE
      ?auto_4018 - HOIST
      ?auto_4019 - SURFACE
      ?auto_4016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4014 ?auto_4015 ) ( SURFACE-AT ?auto_4013 ?auto_4015 ) ( CLEAR ?auto_4013 ) ( IS-CRATE ?auto_4012 ) ( AVAILABLE ?auto_4014 ) ( not ( = ?auto_4017 ?auto_4015 ) ) ( HOIST-AT ?auto_4018 ?auto_4017 ) ( AVAILABLE ?auto_4018 ) ( SURFACE-AT ?auto_4012 ?auto_4017 ) ( ON ?auto_4012 ?auto_4019 ) ( CLEAR ?auto_4012 ) ( TRUCK-AT ?auto_4016 ?auto_4015 ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( not ( = ?auto_4012 ?auto_4019 ) ) ( not ( = ?auto_4013 ?auto_4019 ) ) ( not ( = ?auto_4014 ?auto_4018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4016 ?auto_4015 ?auto_4017 )
      ( !LIFT ?auto_4018 ?auto_4012 ?auto_4019 ?auto_4017 )
      ( !LOAD ?auto_4018 ?auto_4012 ?auto_4016 ?auto_4017 )
      ( !DRIVE ?auto_4016 ?auto_4017 ?auto_4015 )
      ( !UNLOAD ?auto_4014 ?auto_4012 ?auto_4016 ?auto_4015 )
      ( !DROP ?auto_4014 ?auto_4012 ?auto_4013 ?auto_4015 )
      ( MAKE-ON-VERIFY ?auto_4012 ?auto_4013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4022 - SURFACE
      ?auto_4023 - SURFACE
    )
    :vars
    (
      ?auto_4024 - HOIST
      ?auto_4025 - PLACE
      ?auto_4027 - PLACE
      ?auto_4028 - HOIST
      ?auto_4029 - SURFACE
      ?auto_4026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4024 ?auto_4025 ) ( SURFACE-AT ?auto_4023 ?auto_4025 ) ( CLEAR ?auto_4023 ) ( IS-CRATE ?auto_4022 ) ( AVAILABLE ?auto_4024 ) ( not ( = ?auto_4027 ?auto_4025 ) ) ( HOIST-AT ?auto_4028 ?auto_4027 ) ( AVAILABLE ?auto_4028 ) ( SURFACE-AT ?auto_4022 ?auto_4027 ) ( ON ?auto_4022 ?auto_4029 ) ( CLEAR ?auto_4022 ) ( TRUCK-AT ?auto_4026 ?auto_4025 ) ( not ( = ?auto_4022 ?auto_4023 ) ) ( not ( = ?auto_4022 ?auto_4029 ) ) ( not ( = ?auto_4023 ?auto_4029 ) ) ( not ( = ?auto_4024 ?auto_4028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4026 ?auto_4025 ?auto_4027 )
      ( !LIFT ?auto_4028 ?auto_4022 ?auto_4029 ?auto_4027 )
      ( !LOAD ?auto_4028 ?auto_4022 ?auto_4026 ?auto_4027 )
      ( !DRIVE ?auto_4026 ?auto_4027 ?auto_4025 )
      ( !UNLOAD ?auto_4024 ?auto_4022 ?auto_4026 ?auto_4025 )
      ( !DROP ?auto_4024 ?auto_4022 ?auto_4023 ?auto_4025 )
      ( MAKE-ON-VERIFY ?auto_4022 ?auto_4023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4032 - SURFACE
      ?auto_4033 - SURFACE
    )
    :vars
    (
      ?auto_4034 - HOIST
      ?auto_4035 - PLACE
      ?auto_4037 - PLACE
      ?auto_4038 - HOIST
      ?auto_4039 - SURFACE
      ?auto_4036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4034 ?auto_4035 ) ( SURFACE-AT ?auto_4033 ?auto_4035 ) ( CLEAR ?auto_4033 ) ( IS-CRATE ?auto_4032 ) ( AVAILABLE ?auto_4034 ) ( not ( = ?auto_4037 ?auto_4035 ) ) ( HOIST-AT ?auto_4038 ?auto_4037 ) ( AVAILABLE ?auto_4038 ) ( SURFACE-AT ?auto_4032 ?auto_4037 ) ( ON ?auto_4032 ?auto_4039 ) ( CLEAR ?auto_4032 ) ( TRUCK-AT ?auto_4036 ?auto_4035 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4039 ) ) ( not ( = ?auto_4033 ?auto_4039 ) ) ( not ( = ?auto_4034 ?auto_4038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4036 ?auto_4035 ?auto_4037 )
      ( !LIFT ?auto_4038 ?auto_4032 ?auto_4039 ?auto_4037 )
      ( !LOAD ?auto_4038 ?auto_4032 ?auto_4036 ?auto_4037 )
      ( !DRIVE ?auto_4036 ?auto_4037 ?auto_4035 )
      ( !UNLOAD ?auto_4034 ?auto_4032 ?auto_4036 ?auto_4035 )
      ( !DROP ?auto_4034 ?auto_4032 ?auto_4033 ?auto_4035 )
      ( MAKE-ON-VERIFY ?auto_4032 ?auto_4033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4042 - SURFACE
      ?auto_4043 - SURFACE
    )
    :vars
    (
      ?auto_4044 - HOIST
      ?auto_4045 - PLACE
      ?auto_4047 - PLACE
      ?auto_4048 - HOIST
      ?auto_4049 - SURFACE
      ?auto_4046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4044 ?auto_4045 ) ( SURFACE-AT ?auto_4043 ?auto_4045 ) ( CLEAR ?auto_4043 ) ( IS-CRATE ?auto_4042 ) ( AVAILABLE ?auto_4044 ) ( not ( = ?auto_4047 ?auto_4045 ) ) ( HOIST-AT ?auto_4048 ?auto_4047 ) ( AVAILABLE ?auto_4048 ) ( SURFACE-AT ?auto_4042 ?auto_4047 ) ( ON ?auto_4042 ?auto_4049 ) ( CLEAR ?auto_4042 ) ( TRUCK-AT ?auto_4046 ?auto_4045 ) ( not ( = ?auto_4042 ?auto_4043 ) ) ( not ( = ?auto_4042 ?auto_4049 ) ) ( not ( = ?auto_4043 ?auto_4049 ) ) ( not ( = ?auto_4044 ?auto_4048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4046 ?auto_4045 ?auto_4047 )
      ( !LIFT ?auto_4048 ?auto_4042 ?auto_4049 ?auto_4047 )
      ( !LOAD ?auto_4048 ?auto_4042 ?auto_4046 ?auto_4047 )
      ( !DRIVE ?auto_4046 ?auto_4047 ?auto_4045 )
      ( !UNLOAD ?auto_4044 ?auto_4042 ?auto_4046 ?auto_4045 )
      ( !DROP ?auto_4044 ?auto_4042 ?auto_4043 ?auto_4045 )
      ( MAKE-ON-VERIFY ?auto_4042 ?auto_4043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4052 - SURFACE
      ?auto_4053 - SURFACE
    )
    :vars
    (
      ?auto_4054 - HOIST
      ?auto_4055 - PLACE
      ?auto_4057 - PLACE
      ?auto_4058 - HOIST
      ?auto_4059 - SURFACE
      ?auto_4056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4054 ?auto_4055 ) ( SURFACE-AT ?auto_4053 ?auto_4055 ) ( CLEAR ?auto_4053 ) ( IS-CRATE ?auto_4052 ) ( AVAILABLE ?auto_4054 ) ( not ( = ?auto_4057 ?auto_4055 ) ) ( HOIST-AT ?auto_4058 ?auto_4057 ) ( AVAILABLE ?auto_4058 ) ( SURFACE-AT ?auto_4052 ?auto_4057 ) ( ON ?auto_4052 ?auto_4059 ) ( CLEAR ?auto_4052 ) ( TRUCK-AT ?auto_4056 ?auto_4055 ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4052 ?auto_4059 ) ) ( not ( = ?auto_4053 ?auto_4059 ) ) ( not ( = ?auto_4054 ?auto_4058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4056 ?auto_4055 ?auto_4057 )
      ( !LIFT ?auto_4058 ?auto_4052 ?auto_4059 ?auto_4057 )
      ( !LOAD ?auto_4058 ?auto_4052 ?auto_4056 ?auto_4057 )
      ( !DRIVE ?auto_4056 ?auto_4057 ?auto_4055 )
      ( !UNLOAD ?auto_4054 ?auto_4052 ?auto_4056 ?auto_4055 )
      ( !DROP ?auto_4054 ?auto_4052 ?auto_4053 ?auto_4055 )
      ( MAKE-ON-VERIFY ?auto_4052 ?auto_4053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4062 - SURFACE
      ?auto_4063 - SURFACE
    )
    :vars
    (
      ?auto_4064 - HOIST
      ?auto_4065 - PLACE
      ?auto_4067 - PLACE
      ?auto_4068 - HOIST
      ?auto_4069 - SURFACE
      ?auto_4066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4064 ?auto_4065 ) ( SURFACE-AT ?auto_4063 ?auto_4065 ) ( CLEAR ?auto_4063 ) ( IS-CRATE ?auto_4062 ) ( AVAILABLE ?auto_4064 ) ( not ( = ?auto_4067 ?auto_4065 ) ) ( HOIST-AT ?auto_4068 ?auto_4067 ) ( AVAILABLE ?auto_4068 ) ( SURFACE-AT ?auto_4062 ?auto_4067 ) ( ON ?auto_4062 ?auto_4069 ) ( CLEAR ?auto_4062 ) ( TRUCK-AT ?auto_4066 ?auto_4065 ) ( not ( = ?auto_4062 ?auto_4063 ) ) ( not ( = ?auto_4062 ?auto_4069 ) ) ( not ( = ?auto_4063 ?auto_4069 ) ) ( not ( = ?auto_4064 ?auto_4068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4066 ?auto_4065 ?auto_4067 )
      ( !LIFT ?auto_4068 ?auto_4062 ?auto_4069 ?auto_4067 )
      ( !LOAD ?auto_4068 ?auto_4062 ?auto_4066 ?auto_4067 )
      ( !DRIVE ?auto_4066 ?auto_4067 ?auto_4065 )
      ( !UNLOAD ?auto_4064 ?auto_4062 ?auto_4066 ?auto_4065 )
      ( !DROP ?auto_4064 ?auto_4062 ?auto_4063 ?auto_4065 )
      ( MAKE-ON-VERIFY ?auto_4062 ?auto_4063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4072 - SURFACE
      ?auto_4073 - SURFACE
    )
    :vars
    (
      ?auto_4074 - HOIST
      ?auto_4075 - PLACE
      ?auto_4077 - PLACE
      ?auto_4078 - HOIST
      ?auto_4079 - SURFACE
      ?auto_4076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4074 ?auto_4075 ) ( SURFACE-AT ?auto_4073 ?auto_4075 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4072 ) ( AVAILABLE ?auto_4074 ) ( not ( = ?auto_4077 ?auto_4075 ) ) ( HOIST-AT ?auto_4078 ?auto_4077 ) ( AVAILABLE ?auto_4078 ) ( SURFACE-AT ?auto_4072 ?auto_4077 ) ( ON ?auto_4072 ?auto_4079 ) ( CLEAR ?auto_4072 ) ( TRUCK-AT ?auto_4076 ?auto_4075 ) ( not ( = ?auto_4072 ?auto_4073 ) ) ( not ( = ?auto_4072 ?auto_4079 ) ) ( not ( = ?auto_4073 ?auto_4079 ) ) ( not ( = ?auto_4074 ?auto_4078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4076 ?auto_4075 ?auto_4077 )
      ( !LIFT ?auto_4078 ?auto_4072 ?auto_4079 ?auto_4077 )
      ( !LOAD ?auto_4078 ?auto_4072 ?auto_4076 ?auto_4077 )
      ( !DRIVE ?auto_4076 ?auto_4077 ?auto_4075 )
      ( !UNLOAD ?auto_4074 ?auto_4072 ?auto_4076 ?auto_4075 )
      ( !DROP ?auto_4074 ?auto_4072 ?auto_4073 ?auto_4075 )
      ( MAKE-ON-VERIFY ?auto_4072 ?auto_4073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4082 - SURFACE
      ?auto_4083 - SURFACE
    )
    :vars
    (
      ?auto_4084 - HOIST
      ?auto_4085 - PLACE
      ?auto_4087 - PLACE
      ?auto_4088 - HOIST
      ?auto_4089 - SURFACE
      ?auto_4086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4084 ?auto_4085 ) ( SURFACE-AT ?auto_4083 ?auto_4085 ) ( CLEAR ?auto_4083 ) ( IS-CRATE ?auto_4082 ) ( AVAILABLE ?auto_4084 ) ( not ( = ?auto_4087 ?auto_4085 ) ) ( HOIST-AT ?auto_4088 ?auto_4087 ) ( AVAILABLE ?auto_4088 ) ( SURFACE-AT ?auto_4082 ?auto_4087 ) ( ON ?auto_4082 ?auto_4089 ) ( CLEAR ?auto_4082 ) ( TRUCK-AT ?auto_4086 ?auto_4085 ) ( not ( = ?auto_4082 ?auto_4083 ) ) ( not ( = ?auto_4082 ?auto_4089 ) ) ( not ( = ?auto_4083 ?auto_4089 ) ) ( not ( = ?auto_4084 ?auto_4088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4086 ?auto_4085 ?auto_4087 )
      ( !LIFT ?auto_4088 ?auto_4082 ?auto_4089 ?auto_4087 )
      ( !LOAD ?auto_4088 ?auto_4082 ?auto_4086 ?auto_4087 )
      ( !DRIVE ?auto_4086 ?auto_4087 ?auto_4085 )
      ( !UNLOAD ?auto_4084 ?auto_4082 ?auto_4086 ?auto_4085 )
      ( !DROP ?auto_4084 ?auto_4082 ?auto_4083 ?auto_4085 )
      ( MAKE-ON-VERIFY ?auto_4082 ?auto_4083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
    )
    :vars
    (
      ?auto_4094 - HOIST
      ?auto_4095 - PLACE
      ?auto_4097 - PLACE
      ?auto_4098 - HOIST
      ?auto_4099 - SURFACE
      ?auto_4096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4094 ?auto_4095 ) ( SURFACE-AT ?auto_4093 ?auto_4095 ) ( CLEAR ?auto_4093 ) ( IS-CRATE ?auto_4092 ) ( AVAILABLE ?auto_4094 ) ( not ( = ?auto_4097 ?auto_4095 ) ) ( HOIST-AT ?auto_4098 ?auto_4097 ) ( AVAILABLE ?auto_4098 ) ( SURFACE-AT ?auto_4092 ?auto_4097 ) ( ON ?auto_4092 ?auto_4099 ) ( CLEAR ?auto_4092 ) ( TRUCK-AT ?auto_4096 ?auto_4095 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4099 ) ) ( not ( = ?auto_4093 ?auto_4099 ) ) ( not ( = ?auto_4094 ?auto_4098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4096 ?auto_4095 ?auto_4097 )
      ( !LIFT ?auto_4098 ?auto_4092 ?auto_4099 ?auto_4097 )
      ( !LOAD ?auto_4098 ?auto_4092 ?auto_4096 ?auto_4097 )
      ( !DRIVE ?auto_4096 ?auto_4097 ?auto_4095 )
      ( !UNLOAD ?auto_4094 ?auto_4092 ?auto_4096 ?auto_4095 )
      ( !DROP ?auto_4094 ?auto_4092 ?auto_4093 ?auto_4095 )
      ( MAKE-ON-VERIFY ?auto_4092 ?auto_4093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4102 - SURFACE
      ?auto_4103 - SURFACE
    )
    :vars
    (
      ?auto_4104 - HOIST
      ?auto_4105 - PLACE
      ?auto_4107 - PLACE
      ?auto_4108 - HOIST
      ?auto_4109 - SURFACE
      ?auto_4106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4104 ?auto_4105 ) ( SURFACE-AT ?auto_4103 ?auto_4105 ) ( CLEAR ?auto_4103 ) ( IS-CRATE ?auto_4102 ) ( AVAILABLE ?auto_4104 ) ( not ( = ?auto_4107 ?auto_4105 ) ) ( HOIST-AT ?auto_4108 ?auto_4107 ) ( AVAILABLE ?auto_4108 ) ( SURFACE-AT ?auto_4102 ?auto_4107 ) ( ON ?auto_4102 ?auto_4109 ) ( CLEAR ?auto_4102 ) ( TRUCK-AT ?auto_4106 ?auto_4105 ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( not ( = ?auto_4102 ?auto_4109 ) ) ( not ( = ?auto_4103 ?auto_4109 ) ) ( not ( = ?auto_4104 ?auto_4108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4106 ?auto_4105 ?auto_4107 )
      ( !LIFT ?auto_4108 ?auto_4102 ?auto_4109 ?auto_4107 )
      ( !LOAD ?auto_4108 ?auto_4102 ?auto_4106 ?auto_4107 )
      ( !DRIVE ?auto_4106 ?auto_4107 ?auto_4105 )
      ( !UNLOAD ?auto_4104 ?auto_4102 ?auto_4106 ?auto_4105 )
      ( !DROP ?auto_4104 ?auto_4102 ?auto_4103 ?auto_4105 )
      ( MAKE-ON-VERIFY ?auto_4102 ?auto_4103 ) )
  )

)

