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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3896 - SURFACE
      ?auto_3897 - SURFACE
    )
    :vars
    (
      ?auto_3898 - HOIST
      ?auto_3899 - PLACE
      ?auto_3901 - PLACE
      ?auto_3902 - HOIST
      ?auto_3903 - SURFACE
      ?auto_3900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3898 ?auto_3899 ) ( SURFACE-AT ?auto_3896 ?auto_3899 ) ( CLEAR ?auto_3896 ) ( IS-CRATE ?auto_3897 ) ( AVAILABLE ?auto_3898 ) ( not ( = ?auto_3901 ?auto_3899 ) ) ( HOIST-AT ?auto_3902 ?auto_3901 ) ( AVAILABLE ?auto_3902 ) ( SURFACE-AT ?auto_3897 ?auto_3901 ) ( ON ?auto_3897 ?auto_3903 ) ( CLEAR ?auto_3897 ) ( TRUCK-AT ?auto_3900 ?auto_3899 ) ( not ( = ?auto_3896 ?auto_3897 ) ) ( not ( = ?auto_3896 ?auto_3903 ) ) ( not ( = ?auto_3897 ?auto_3903 ) ) ( not ( = ?auto_3898 ?auto_3902 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3900 ?auto_3899 ?auto_3901 )
      ( !LIFT ?auto_3902 ?auto_3897 ?auto_3903 ?auto_3901 )
      ( !LOAD ?auto_3902 ?auto_3897 ?auto_3900 ?auto_3901 )
      ( !DRIVE ?auto_3900 ?auto_3901 ?auto_3899 )
      ( !UNLOAD ?auto_3898 ?auto_3897 ?auto_3900 ?auto_3899 )
      ( !DROP ?auto_3898 ?auto_3897 ?auto_3896 ?auto_3899 )
      ( MAKE-1CRATE-VERIFY ?auto_3896 ?auto_3897 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3917 - SURFACE
      ?auto_3918 - SURFACE
      ?auto_3919 - SURFACE
    )
    :vars
    (
      ?auto_3922 - HOIST
      ?auto_3924 - PLACE
      ?auto_3923 - PLACE
      ?auto_3921 - HOIST
      ?auto_3920 - SURFACE
      ?auto_3926 - PLACE
      ?auto_3928 - HOIST
      ?auto_3927 - SURFACE
      ?auto_3925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3922 ?auto_3924 ) ( IS-CRATE ?auto_3919 ) ( not ( = ?auto_3923 ?auto_3924 ) ) ( HOIST-AT ?auto_3921 ?auto_3923 ) ( AVAILABLE ?auto_3921 ) ( SURFACE-AT ?auto_3919 ?auto_3923 ) ( ON ?auto_3919 ?auto_3920 ) ( CLEAR ?auto_3919 ) ( not ( = ?auto_3918 ?auto_3919 ) ) ( not ( = ?auto_3918 ?auto_3920 ) ) ( not ( = ?auto_3919 ?auto_3920 ) ) ( not ( = ?auto_3922 ?auto_3921 ) ) ( SURFACE-AT ?auto_3917 ?auto_3924 ) ( CLEAR ?auto_3917 ) ( IS-CRATE ?auto_3918 ) ( AVAILABLE ?auto_3922 ) ( not ( = ?auto_3926 ?auto_3924 ) ) ( HOIST-AT ?auto_3928 ?auto_3926 ) ( AVAILABLE ?auto_3928 ) ( SURFACE-AT ?auto_3918 ?auto_3926 ) ( ON ?auto_3918 ?auto_3927 ) ( CLEAR ?auto_3918 ) ( TRUCK-AT ?auto_3925 ?auto_3924 ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( not ( = ?auto_3917 ?auto_3927 ) ) ( not ( = ?auto_3918 ?auto_3927 ) ) ( not ( = ?auto_3922 ?auto_3928 ) ) ( not ( = ?auto_3917 ?auto_3919 ) ) ( not ( = ?auto_3917 ?auto_3920 ) ) ( not ( = ?auto_3919 ?auto_3927 ) ) ( not ( = ?auto_3923 ?auto_3926 ) ) ( not ( = ?auto_3921 ?auto_3928 ) ) ( not ( = ?auto_3920 ?auto_3927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3917 ?auto_3918 )
      ( MAKE-1CRATE ?auto_3918 ?auto_3919 )
      ( MAKE-2CRATE-VERIFY ?auto_3917 ?auto_3918 ?auto_3919 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3943 - SURFACE
      ?auto_3944 - SURFACE
      ?auto_3945 - SURFACE
      ?auto_3946 - SURFACE
    )
    :vars
    (
      ?auto_3951 - HOIST
      ?auto_3948 - PLACE
      ?auto_3950 - PLACE
      ?auto_3949 - HOIST
      ?auto_3952 - SURFACE
      ?auto_3958 - PLACE
      ?auto_3956 - HOIST
      ?auto_3953 - SURFACE
      ?auto_3954 - PLACE
      ?auto_3957 - HOIST
      ?auto_3955 - SURFACE
      ?auto_3947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3951 ?auto_3948 ) ( IS-CRATE ?auto_3946 ) ( not ( = ?auto_3950 ?auto_3948 ) ) ( HOIST-AT ?auto_3949 ?auto_3950 ) ( AVAILABLE ?auto_3949 ) ( SURFACE-AT ?auto_3946 ?auto_3950 ) ( ON ?auto_3946 ?auto_3952 ) ( CLEAR ?auto_3946 ) ( not ( = ?auto_3945 ?auto_3946 ) ) ( not ( = ?auto_3945 ?auto_3952 ) ) ( not ( = ?auto_3946 ?auto_3952 ) ) ( not ( = ?auto_3951 ?auto_3949 ) ) ( IS-CRATE ?auto_3945 ) ( not ( = ?auto_3958 ?auto_3948 ) ) ( HOIST-AT ?auto_3956 ?auto_3958 ) ( AVAILABLE ?auto_3956 ) ( SURFACE-AT ?auto_3945 ?auto_3958 ) ( ON ?auto_3945 ?auto_3953 ) ( CLEAR ?auto_3945 ) ( not ( = ?auto_3944 ?auto_3945 ) ) ( not ( = ?auto_3944 ?auto_3953 ) ) ( not ( = ?auto_3945 ?auto_3953 ) ) ( not ( = ?auto_3951 ?auto_3956 ) ) ( SURFACE-AT ?auto_3943 ?auto_3948 ) ( CLEAR ?auto_3943 ) ( IS-CRATE ?auto_3944 ) ( AVAILABLE ?auto_3951 ) ( not ( = ?auto_3954 ?auto_3948 ) ) ( HOIST-AT ?auto_3957 ?auto_3954 ) ( AVAILABLE ?auto_3957 ) ( SURFACE-AT ?auto_3944 ?auto_3954 ) ( ON ?auto_3944 ?auto_3955 ) ( CLEAR ?auto_3944 ) ( TRUCK-AT ?auto_3947 ?auto_3948 ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( not ( = ?auto_3943 ?auto_3955 ) ) ( not ( = ?auto_3944 ?auto_3955 ) ) ( not ( = ?auto_3951 ?auto_3957 ) ) ( not ( = ?auto_3943 ?auto_3945 ) ) ( not ( = ?auto_3943 ?auto_3953 ) ) ( not ( = ?auto_3945 ?auto_3955 ) ) ( not ( = ?auto_3958 ?auto_3954 ) ) ( not ( = ?auto_3956 ?auto_3957 ) ) ( not ( = ?auto_3953 ?auto_3955 ) ) ( not ( = ?auto_3943 ?auto_3946 ) ) ( not ( = ?auto_3943 ?auto_3952 ) ) ( not ( = ?auto_3944 ?auto_3946 ) ) ( not ( = ?auto_3944 ?auto_3952 ) ) ( not ( = ?auto_3946 ?auto_3953 ) ) ( not ( = ?auto_3946 ?auto_3955 ) ) ( not ( = ?auto_3950 ?auto_3958 ) ) ( not ( = ?auto_3950 ?auto_3954 ) ) ( not ( = ?auto_3949 ?auto_3956 ) ) ( not ( = ?auto_3949 ?auto_3957 ) ) ( not ( = ?auto_3952 ?auto_3953 ) ) ( not ( = ?auto_3952 ?auto_3955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3943 ?auto_3944 ?auto_3945 )
      ( MAKE-1CRATE ?auto_3945 ?auto_3946 )
      ( MAKE-3CRATE-VERIFY ?auto_3943 ?auto_3944 ?auto_3945 ?auto_3946 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3974 - SURFACE
      ?auto_3975 - SURFACE
      ?auto_3976 - SURFACE
      ?auto_3977 - SURFACE
      ?auto_3978 - SURFACE
    )
    :vars
    (
      ?auto_3981 - HOIST
      ?auto_3984 - PLACE
      ?auto_3982 - PLACE
      ?auto_3980 - HOIST
      ?auto_3983 - SURFACE
      ?auto_3987 - SURFACE
      ?auto_3985 - PLACE
      ?auto_3990 - HOIST
      ?auto_3991 - SURFACE
      ?auto_3988 - PLACE
      ?auto_3989 - HOIST
      ?auto_3986 - SURFACE
      ?auto_3979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3981 ?auto_3984 ) ( IS-CRATE ?auto_3978 ) ( not ( = ?auto_3982 ?auto_3984 ) ) ( HOIST-AT ?auto_3980 ?auto_3982 ) ( SURFACE-AT ?auto_3978 ?auto_3982 ) ( ON ?auto_3978 ?auto_3983 ) ( CLEAR ?auto_3978 ) ( not ( = ?auto_3977 ?auto_3978 ) ) ( not ( = ?auto_3977 ?auto_3983 ) ) ( not ( = ?auto_3978 ?auto_3983 ) ) ( not ( = ?auto_3981 ?auto_3980 ) ) ( IS-CRATE ?auto_3977 ) ( AVAILABLE ?auto_3980 ) ( SURFACE-AT ?auto_3977 ?auto_3982 ) ( ON ?auto_3977 ?auto_3987 ) ( CLEAR ?auto_3977 ) ( not ( = ?auto_3976 ?auto_3977 ) ) ( not ( = ?auto_3976 ?auto_3987 ) ) ( not ( = ?auto_3977 ?auto_3987 ) ) ( IS-CRATE ?auto_3976 ) ( not ( = ?auto_3985 ?auto_3984 ) ) ( HOIST-AT ?auto_3990 ?auto_3985 ) ( AVAILABLE ?auto_3990 ) ( SURFACE-AT ?auto_3976 ?auto_3985 ) ( ON ?auto_3976 ?auto_3991 ) ( CLEAR ?auto_3976 ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( not ( = ?auto_3975 ?auto_3991 ) ) ( not ( = ?auto_3976 ?auto_3991 ) ) ( not ( = ?auto_3981 ?auto_3990 ) ) ( SURFACE-AT ?auto_3974 ?auto_3984 ) ( CLEAR ?auto_3974 ) ( IS-CRATE ?auto_3975 ) ( AVAILABLE ?auto_3981 ) ( not ( = ?auto_3988 ?auto_3984 ) ) ( HOIST-AT ?auto_3989 ?auto_3988 ) ( AVAILABLE ?auto_3989 ) ( SURFACE-AT ?auto_3975 ?auto_3988 ) ( ON ?auto_3975 ?auto_3986 ) ( CLEAR ?auto_3975 ) ( TRUCK-AT ?auto_3979 ?auto_3984 ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3986 ) ) ( not ( = ?auto_3975 ?auto_3986 ) ) ( not ( = ?auto_3981 ?auto_3989 ) ) ( not ( = ?auto_3974 ?auto_3976 ) ) ( not ( = ?auto_3974 ?auto_3991 ) ) ( not ( = ?auto_3976 ?auto_3986 ) ) ( not ( = ?auto_3985 ?auto_3988 ) ) ( not ( = ?auto_3990 ?auto_3989 ) ) ( not ( = ?auto_3991 ?auto_3986 ) ) ( not ( = ?auto_3974 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3987 ) ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( not ( = ?auto_3975 ?auto_3987 ) ) ( not ( = ?auto_3977 ?auto_3991 ) ) ( not ( = ?auto_3977 ?auto_3986 ) ) ( not ( = ?auto_3982 ?auto_3985 ) ) ( not ( = ?auto_3982 ?auto_3988 ) ) ( not ( = ?auto_3980 ?auto_3990 ) ) ( not ( = ?auto_3980 ?auto_3989 ) ) ( not ( = ?auto_3987 ?auto_3991 ) ) ( not ( = ?auto_3987 ?auto_3986 ) ) ( not ( = ?auto_3974 ?auto_3978 ) ) ( not ( = ?auto_3974 ?auto_3983 ) ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3975 ?auto_3983 ) ) ( not ( = ?auto_3976 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3983 ) ) ( not ( = ?auto_3978 ?auto_3987 ) ) ( not ( = ?auto_3978 ?auto_3991 ) ) ( not ( = ?auto_3978 ?auto_3986 ) ) ( not ( = ?auto_3983 ?auto_3987 ) ) ( not ( = ?auto_3983 ?auto_3991 ) ) ( not ( = ?auto_3983 ?auto_3986 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3974 ?auto_3975 ?auto_3976 ?auto_3977 )
      ( MAKE-1CRATE ?auto_3977 ?auto_3978 )
      ( MAKE-4CRATE-VERIFY ?auto_3974 ?auto_3975 ?auto_3976 ?auto_3977 ?auto_3978 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4008 - SURFACE
      ?auto_4009 - SURFACE
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
      ?auto_4012 - SURFACE
      ?auto_4013 - SURFACE
    )
    :vars
    (
      ?auto_4017 - HOIST
      ?auto_4019 - PLACE
      ?auto_4015 - PLACE
      ?auto_4016 - HOIST
      ?auto_4014 - SURFACE
      ?auto_4022 - PLACE
      ?auto_4020 - HOIST
      ?auto_4023 - SURFACE
      ?auto_4029 - SURFACE
      ?auto_4027 - PLACE
      ?auto_4025 - HOIST
      ?auto_4028 - SURFACE
      ?auto_4026 - PLACE
      ?auto_4024 - HOIST
      ?auto_4021 - SURFACE
      ?auto_4018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4017 ?auto_4019 ) ( IS-CRATE ?auto_4013 ) ( not ( = ?auto_4015 ?auto_4019 ) ) ( HOIST-AT ?auto_4016 ?auto_4015 ) ( AVAILABLE ?auto_4016 ) ( SURFACE-AT ?auto_4013 ?auto_4015 ) ( ON ?auto_4013 ?auto_4014 ) ( CLEAR ?auto_4013 ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( not ( = ?auto_4012 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4014 ) ) ( not ( = ?auto_4017 ?auto_4016 ) ) ( IS-CRATE ?auto_4012 ) ( not ( = ?auto_4022 ?auto_4019 ) ) ( HOIST-AT ?auto_4020 ?auto_4022 ) ( SURFACE-AT ?auto_4012 ?auto_4022 ) ( ON ?auto_4012 ?auto_4023 ) ( CLEAR ?auto_4012 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4023 ) ) ( not ( = ?auto_4012 ?auto_4023 ) ) ( not ( = ?auto_4017 ?auto_4020 ) ) ( IS-CRATE ?auto_4011 ) ( AVAILABLE ?auto_4020 ) ( SURFACE-AT ?auto_4011 ?auto_4022 ) ( ON ?auto_4011 ?auto_4029 ) ( CLEAR ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4010 ?auto_4029 ) ) ( not ( = ?auto_4011 ?auto_4029 ) ) ( IS-CRATE ?auto_4010 ) ( not ( = ?auto_4027 ?auto_4019 ) ) ( HOIST-AT ?auto_4025 ?auto_4027 ) ( AVAILABLE ?auto_4025 ) ( SURFACE-AT ?auto_4010 ?auto_4027 ) ( ON ?auto_4010 ?auto_4028 ) ( CLEAR ?auto_4010 ) ( not ( = ?auto_4009 ?auto_4010 ) ) ( not ( = ?auto_4009 ?auto_4028 ) ) ( not ( = ?auto_4010 ?auto_4028 ) ) ( not ( = ?auto_4017 ?auto_4025 ) ) ( SURFACE-AT ?auto_4008 ?auto_4019 ) ( CLEAR ?auto_4008 ) ( IS-CRATE ?auto_4009 ) ( AVAILABLE ?auto_4017 ) ( not ( = ?auto_4026 ?auto_4019 ) ) ( HOIST-AT ?auto_4024 ?auto_4026 ) ( AVAILABLE ?auto_4024 ) ( SURFACE-AT ?auto_4009 ?auto_4026 ) ( ON ?auto_4009 ?auto_4021 ) ( CLEAR ?auto_4009 ) ( TRUCK-AT ?auto_4018 ?auto_4019 ) ( not ( = ?auto_4008 ?auto_4009 ) ) ( not ( = ?auto_4008 ?auto_4021 ) ) ( not ( = ?auto_4009 ?auto_4021 ) ) ( not ( = ?auto_4017 ?auto_4024 ) ) ( not ( = ?auto_4008 ?auto_4010 ) ) ( not ( = ?auto_4008 ?auto_4028 ) ) ( not ( = ?auto_4010 ?auto_4021 ) ) ( not ( = ?auto_4027 ?auto_4026 ) ) ( not ( = ?auto_4025 ?auto_4024 ) ) ( not ( = ?auto_4028 ?auto_4021 ) ) ( not ( = ?auto_4008 ?auto_4011 ) ) ( not ( = ?auto_4008 ?auto_4029 ) ) ( not ( = ?auto_4009 ?auto_4011 ) ) ( not ( = ?auto_4009 ?auto_4029 ) ) ( not ( = ?auto_4011 ?auto_4028 ) ) ( not ( = ?auto_4011 ?auto_4021 ) ) ( not ( = ?auto_4022 ?auto_4027 ) ) ( not ( = ?auto_4022 ?auto_4026 ) ) ( not ( = ?auto_4020 ?auto_4025 ) ) ( not ( = ?auto_4020 ?auto_4024 ) ) ( not ( = ?auto_4029 ?auto_4028 ) ) ( not ( = ?auto_4029 ?auto_4021 ) ) ( not ( = ?auto_4008 ?auto_4012 ) ) ( not ( = ?auto_4008 ?auto_4023 ) ) ( not ( = ?auto_4009 ?auto_4012 ) ) ( not ( = ?auto_4009 ?auto_4023 ) ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4010 ?auto_4023 ) ) ( not ( = ?auto_4012 ?auto_4029 ) ) ( not ( = ?auto_4012 ?auto_4028 ) ) ( not ( = ?auto_4012 ?auto_4021 ) ) ( not ( = ?auto_4023 ?auto_4029 ) ) ( not ( = ?auto_4023 ?auto_4028 ) ) ( not ( = ?auto_4023 ?auto_4021 ) ) ( not ( = ?auto_4008 ?auto_4013 ) ) ( not ( = ?auto_4008 ?auto_4014 ) ) ( not ( = ?auto_4009 ?auto_4013 ) ) ( not ( = ?auto_4009 ?auto_4014 ) ) ( not ( = ?auto_4010 ?auto_4013 ) ) ( not ( = ?auto_4010 ?auto_4014 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_4011 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4023 ) ) ( not ( = ?auto_4013 ?auto_4029 ) ) ( not ( = ?auto_4013 ?auto_4028 ) ) ( not ( = ?auto_4013 ?auto_4021 ) ) ( not ( = ?auto_4015 ?auto_4022 ) ) ( not ( = ?auto_4015 ?auto_4027 ) ) ( not ( = ?auto_4015 ?auto_4026 ) ) ( not ( = ?auto_4016 ?auto_4020 ) ) ( not ( = ?auto_4016 ?auto_4025 ) ) ( not ( = ?auto_4016 ?auto_4024 ) ) ( not ( = ?auto_4014 ?auto_4023 ) ) ( not ( = ?auto_4014 ?auto_4029 ) ) ( not ( = ?auto_4014 ?auto_4028 ) ) ( not ( = ?auto_4014 ?auto_4021 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4008 ?auto_4009 ?auto_4010 ?auto_4011 ?auto_4012 )
      ( MAKE-1CRATE ?auto_4012 ?auto_4013 )
      ( MAKE-5CRATE-VERIFY ?auto_4008 ?auto_4009 ?auto_4010 ?auto_4011 ?auto_4012 ?auto_4013 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4047 - SURFACE
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
      ?auto_4050 - SURFACE
      ?auto_4051 - SURFACE
      ?auto_4052 - SURFACE
      ?auto_4053 - SURFACE
    )
    :vars
    (
      ?auto_4057 - HOIST
      ?auto_4058 - PLACE
      ?auto_4054 - PLACE
      ?auto_4055 - HOIST
      ?auto_4056 - SURFACE
      ?auto_4065 - PLACE
      ?auto_4060 - HOIST
      ?auto_4061 - SURFACE
      ?auto_4069 - PLACE
      ?auto_4068 - HOIST
      ?auto_4067 - SURFACE
      ?auto_4064 - SURFACE
      ?auto_4062 - PLACE
      ?auto_4063 - HOIST
      ?auto_4070 - SURFACE
      ?auto_4066 - SURFACE
      ?auto_4059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4057 ?auto_4058 ) ( IS-CRATE ?auto_4053 ) ( not ( = ?auto_4054 ?auto_4058 ) ) ( HOIST-AT ?auto_4055 ?auto_4054 ) ( SURFACE-AT ?auto_4053 ?auto_4054 ) ( ON ?auto_4053 ?auto_4056 ) ( CLEAR ?auto_4053 ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4052 ?auto_4056 ) ) ( not ( = ?auto_4053 ?auto_4056 ) ) ( not ( = ?auto_4057 ?auto_4055 ) ) ( IS-CRATE ?auto_4052 ) ( not ( = ?auto_4065 ?auto_4058 ) ) ( HOIST-AT ?auto_4060 ?auto_4065 ) ( AVAILABLE ?auto_4060 ) ( SURFACE-AT ?auto_4052 ?auto_4065 ) ( ON ?auto_4052 ?auto_4061 ) ( CLEAR ?auto_4052 ) ( not ( = ?auto_4051 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4061 ) ) ( not ( = ?auto_4052 ?auto_4061 ) ) ( not ( = ?auto_4057 ?auto_4060 ) ) ( IS-CRATE ?auto_4051 ) ( not ( = ?auto_4069 ?auto_4058 ) ) ( HOIST-AT ?auto_4068 ?auto_4069 ) ( SURFACE-AT ?auto_4051 ?auto_4069 ) ( ON ?auto_4051 ?auto_4067 ) ( CLEAR ?auto_4051 ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( not ( = ?auto_4050 ?auto_4067 ) ) ( not ( = ?auto_4051 ?auto_4067 ) ) ( not ( = ?auto_4057 ?auto_4068 ) ) ( IS-CRATE ?auto_4050 ) ( AVAILABLE ?auto_4068 ) ( SURFACE-AT ?auto_4050 ?auto_4069 ) ( ON ?auto_4050 ?auto_4064 ) ( CLEAR ?auto_4050 ) ( not ( = ?auto_4049 ?auto_4050 ) ) ( not ( = ?auto_4049 ?auto_4064 ) ) ( not ( = ?auto_4050 ?auto_4064 ) ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4062 ?auto_4058 ) ) ( HOIST-AT ?auto_4063 ?auto_4062 ) ( AVAILABLE ?auto_4063 ) ( SURFACE-AT ?auto_4049 ?auto_4062 ) ( ON ?auto_4049 ?auto_4070 ) ( CLEAR ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4070 ) ) ( not ( = ?auto_4049 ?auto_4070 ) ) ( not ( = ?auto_4057 ?auto_4063 ) ) ( SURFACE-AT ?auto_4047 ?auto_4058 ) ( CLEAR ?auto_4047 ) ( IS-CRATE ?auto_4048 ) ( AVAILABLE ?auto_4057 ) ( AVAILABLE ?auto_4055 ) ( SURFACE-AT ?auto_4048 ?auto_4054 ) ( ON ?auto_4048 ?auto_4066 ) ( CLEAR ?auto_4048 ) ( TRUCK-AT ?auto_4059 ?auto_4058 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4066 ) ) ( not ( = ?auto_4048 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4047 ?auto_4070 ) ) ( not ( = ?auto_4049 ?auto_4066 ) ) ( not ( = ?auto_4062 ?auto_4054 ) ) ( not ( = ?auto_4063 ?auto_4055 ) ) ( not ( = ?auto_4070 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4050 ) ) ( not ( = ?auto_4047 ?auto_4064 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4064 ) ) ( not ( = ?auto_4050 ?auto_4070 ) ) ( not ( = ?auto_4050 ?auto_4066 ) ) ( not ( = ?auto_4069 ?auto_4062 ) ) ( not ( = ?auto_4069 ?auto_4054 ) ) ( not ( = ?auto_4068 ?auto_4063 ) ) ( not ( = ?auto_4068 ?auto_4055 ) ) ( not ( = ?auto_4064 ?auto_4070 ) ) ( not ( = ?auto_4064 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4047 ?auto_4067 ) ) ( not ( = ?auto_4048 ?auto_4051 ) ) ( not ( = ?auto_4048 ?auto_4067 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4067 ) ) ( not ( = ?auto_4051 ?auto_4064 ) ) ( not ( = ?auto_4051 ?auto_4070 ) ) ( not ( = ?auto_4051 ?auto_4066 ) ) ( not ( = ?auto_4067 ?auto_4064 ) ) ( not ( = ?auto_4067 ?auto_4070 ) ) ( not ( = ?auto_4067 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4052 ) ) ( not ( = ?auto_4047 ?auto_4061 ) ) ( not ( = ?auto_4048 ?auto_4052 ) ) ( not ( = ?auto_4048 ?auto_4061 ) ) ( not ( = ?auto_4049 ?auto_4052 ) ) ( not ( = ?auto_4049 ?auto_4061 ) ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( not ( = ?auto_4050 ?auto_4061 ) ) ( not ( = ?auto_4052 ?auto_4067 ) ) ( not ( = ?auto_4052 ?auto_4064 ) ) ( not ( = ?auto_4052 ?auto_4070 ) ) ( not ( = ?auto_4052 ?auto_4066 ) ) ( not ( = ?auto_4065 ?auto_4069 ) ) ( not ( = ?auto_4065 ?auto_4062 ) ) ( not ( = ?auto_4065 ?auto_4054 ) ) ( not ( = ?auto_4060 ?auto_4068 ) ) ( not ( = ?auto_4060 ?auto_4063 ) ) ( not ( = ?auto_4060 ?auto_4055 ) ) ( not ( = ?auto_4061 ?auto_4067 ) ) ( not ( = ?auto_4061 ?auto_4064 ) ) ( not ( = ?auto_4061 ?auto_4070 ) ) ( not ( = ?auto_4061 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4053 ) ) ( not ( = ?auto_4047 ?auto_4056 ) ) ( not ( = ?auto_4048 ?auto_4053 ) ) ( not ( = ?auto_4048 ?auto_4056 ) ) ( not ( = ?auto_4049 ?auto_4053 ) ) ( not ( = ?auto_4049 ?auto_4056 ) ) ( not ( = ?auto_4050 ?auto_4053 ) ) ( not ( = ?auto_4050 ?auto_4056 ) ) ( not ( = ?auto_4051 ?auto_4053 ) ) ( not ( = ?auto_4051 ?auto_4056 ) ) ( not ( = ?auto_4053 ?auto_4061 ) ) ( not ( = ?auto_4053 ?auto_4067 ) ) ( not ( = ?auto_4053 ?auto_4064 ) ) ( not ( = ?auto_4053 ?auto_4070 ) ) ( not ( = ?auto_4053 ?auto_4066 ) ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4056 ?auto_4067 ) ) ( not ( = ?auto_4056 ?auto_4064 ) ) ( not ( = ?auto_4056 ?auto_4070 ) ) ( not ( = ?auto_4056 ?auto_4066 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ?auto_4052 )
      ( MAKE-1CRATE ?auto_4052 ?auto_4053 )
      ( MAKE-6CRATE-VERIFY ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ?auto_4052 ?auto_4053 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4089 - SURFACE
      ?auto_4090 - SURFACE
      ?auto_4091 - SURFACE
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
      ?auto_4094 - SURFACE
      ?auto_4095 - SURFACE
      ?auto_4096 - SURFACE
    )
    :vars
    (
      ?auto_4099 - HOIST
      ?auto_4098 - PLACE
      ?auto_4101 - PLACE
      ?auto_4100 - HOIST
      ?auto_4097 - SURFACE
      ?auto_4107 - SURFACE
      ?auto_4112 - PLACE
      ?auto_4104 - HOIST
      ?auto_4110 - SURFACE
      ?auto_4111 - PLACE
      ?auto_4103 - HOIST
      ?auto_4106 - SURFACE
      ?auto_4113 - SURFACE
      ?auto_4109 - PLACE
      ?auto_4108 - HOIST
      ?auto_4114 - SURFACE
      ?auto_4105 - SURFACE
      ?auto_4102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4099 ?auto_4098 ) ( IS-CRATE ?auto_4096 ) ( not ( = ?auto_4101 ?auto_4098 ) ) ( HOIST-AT ?auto_4100 ?auto_4101 ) ( SURFACE-AT ?auto_4096 ?auto_4101 ) ( ON ?auto_4096 ?auto_4097 ) ( CLEAR ?auto_4096 ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( not ( = ?auto_4099 ?auto_4100 ) ) ( IS-CRATE ?auto_4095 ) ( SURFACE-AT ?auto_4095 ?auto_4101 ) ( ON ?auto_4095 ?auto_4107 ) ( CLEAR ?auto_4095 ) ( not ( = ?auto_4094 ?auto_4095 ) ) ( not ( = ?auto_4094 ?auto_4107 ) ) ( not ( = ?auto_4095 ?auto_4107 ) ) ( IS-CRATE ?auto_4094 ) ( not ( = ?auto_4112 ?auto_4098 ) ) ( HOIST-AT ?auto_4104 ?auto_4112 ) ( AVAILABLE ?auto_4104 ) ( SURFACE-AT ?auto_4094 ?auto_4112 ) ( ON ?auto_4094 ?auto_4110 ) ( CLEAR ?auto_4094 ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4110 ) ) ( not ( = ?auto_4094 ?auto_4110 ) ) ( not ( = ?auto_4099 ?auto_4104 ) ) ( IS-CRATE ?auto_4093 ) ( not ( = ?auto_4111 ?auto_4098 ) ) ( HOIST-AT ?auto_4103 ?auto_4111 ) ( SURFACE-AT ?auto_4093 ?auto_4111 ) ( ON ?auto_4093 ?auto_4106 ) ( CLEAR ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4106 ) ) ( not ( = ?auto_4093 ?auto_4106 ) ) ( not ( = ?auto_4099 ?auto_4103 ) ) ( IS-CRATE ?auto_4092 ) ( AVAILABLE ?auto_4103 ) ( SURFACE-AT ?auto_4092 ?auto_4111 ) ( ON ?auto_4092 ?auto_4113 ) ( CLEAR ?auto_4092 ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4113 ) ) ( not ( = ?auto_4092 ?auto_4113 ) ) ( IS-CRATE ?auto_4091 ) ( not ( = ?auto_4109 ?auto_4098 ) ) ( HOIST-AT ?auto_4108 ?auto_4109 ) ( AVAILABLE ?auto_4108 ) ( SURFACE-AT ?auto_4091 ?auto_4109 ) ( ON ?auto_4091 ?auto_4114 ) ( CLEAR ?auto_4091 ) ( not ( = ?auto_4090 ?auto_4091 ) ) ( not ( = ?auto_4090 ?auto_4114 ) ) ( not ( = ?auto_4091 ?auto_4114 ) ) ( not ( = ?auto_4099 ?auto_4108 ) ) ( SURFACE-AT ?auto_4089 ?auto_4098 ) ( CLEAR ?auto_4089 ) ( IS-CRATE ?auto_4090 ) ( AVAILABLE ?auto_4099 ) ( AVAILABLE ?auto_4100 ) ( SURFACE-AT ?auto_4090 ?auto_4101 ) ( ON ?auto_4090 ?auto_4105 ) ( CLEAR ?auto_4090 ) ( TRUCK-AT ?auto_4102 ?auto_4098 ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4105 ) ) ( not ( = ?auto_4090 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4091 ) ) ( not ( = ?auto_4089 ?auto_4114 ) ) ( not ( = ?auto_4091 ?auto_4105 ) ) ( not ( = ?auto_4109 ?auto_4101 ) ) ( not ( = ?auto_4108 ?auto_4100 ) ) ( not ( = ?auto_4114 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4092 ) ) ( not ( = ?auto_4089 ?auto_4113 ) ) ( not ( = ?auto_4090 ?auto_4092 ) ) ( not ( = ?auto_4090 ?auto_4113 ) ) ( not ( = ?auto_4092 ?auto_4114 ) ) ( not ( = ?auto_4092 ?auto_4105 ) ) ( not ( = ?auto_4111 ?auto_4109 ) ) ( not ( = ?auto_4111 ?auto_4101 ) ) ( not ( = ?auto_4103 ?auto_4108 ) ) ( not ( = ?auto_4103 ?auto_4100 ) ) ( not ( = ?auto_4113 ?auto_4114 ) ) ( not ( = ?auto_4113 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4093 ) ) ( not ( = ?auto_4089 ?auto_4106 ) ) ( not ( = ?auto_4090 ?auto_4093 ) ) ( not ( = ?auto_4090 ?auto_4106 ) ) ( not ( = ?auto_4091 ?auto_4093 ) ) ( not ( = ?auto_4091 ?auto_4106 ) ) ( not ( = ?auto_4093 ?auto_4113 ) ) ( not ( = ?auto_4093 ?auto_4114 ) ) ( not ( = ?auto_4093 ?auto_4105 ) ) ( not ( = ?auto_4106 ?auto_4113 ) ) ( not ( = ?auto_4106 ?auto_4114 ) ) ( not ( = ?auto_4106 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4094 ) ) ( not ( = ?auto_4089 ?auto_4110 ) ) ( not ( = ?auto_4090 ?auto_4094 ) ) ( not ( = ?auto_4090 ?auto_4110 ) ) ( not ( = ?auto_4091 ?auto_4094 ) ) ( not ( = ?auto_4091 ?auto_4110 ) ) ( not ( = ?auto_4092 ?auto_4094 ) ) ( not ( = ?auto_4092 ?auto_4110 ) ) ( not ( = ?auto_4094 ?auto_4106 ) ) ( not ( = ?auto_4094 ?auto_4113 ) ) ( not ( = ?auto_4094 ?auto_4114 ) ) ( not ( = ?auto_4094 ?auto_4105 ) ) ( not ( = ?auto_4112 ?auto_4111 ) ) ( not ( = ?auto_4112 ?auto_4109 ) ) ( not ( = ?auto_4112 ?auto_4101 ) ) ( not ( = ?auto_4104 ?auto_4103 ) ) ( not ( = ?auto_4104 ?auto_4108 ) ) ( not ( = ?auto_4104 ?auto_4100 ) ) ( not ( = ?auto_4110 ?auto_4106 ) ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( not ( = ?auto_4110 ?auto_4114 ) ) ( not ( = ?auto_4110 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4095 ) ) ( not ( = ?auto_4089 ?auto_4107 ) ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( not ( = ?auto_4090 ?auto_4107 ) ) ( not ( = ?auto_4091 ?auto_4095 ) ) ( not ( = ?auto_4091 ?auto_4107 ) ) ( not ( = ?auto_4092 ?auto_4095 ) ) ( not ( = ?auto_4092 ?auto_4107 ) ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4107 ) ) ( not ( = ?auto_4095 ?auto_4110 ) ) ( not ( = ?auto_4095 ?auto_4106 ) ) ( not ( = ?auto_4095 ?auto_4113 ) ) ( not ( = ?auto_4095 ?auto_4114 ) ) ( not ( = ?auto_4095 ?auto_4105 ) ) ( not ( = ?auto_4107 ?auto_4110 ) ) ( not ( = ?auto_4107 ?auto_4106 ) ) ( not ( = ?auto_4107 ?auto_4113 ) ) ( not ( = ?auto_4107 ?auto_4114 ) ) ( not ( = ?auto_4107 ?auto_4105 ) ) ( not ( = ?auto_4089 ?auto_4096 ) ) ( not ( = ?auto_4089 ?auto_4097 ) ) ( not ( = ?auto_4090 ?auto_4096 ) ) ( not ( = ?auto_4090 ?auto_4097 ) ) ( not ( = ?auto_4091 ?auto_4096 ) ) ( not ( = ?auto_4091 ?auto_4097 ) ) ( not ( = ?auto_4092 ?auto_4096 ) ) ( not ( = ?auto_4092 ?auto_4097 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4093 ?auto_4097 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4094 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4107 ) ) ( not ( = ?auto_4096 ?auto_4110 ) ) ( not ( = ?auto_4096 ?auto_4106 ) ) ( not ( = ?auto_4096 ?auto_4113 ) ) ( not ( = ?auto_4096 ?auto_4114 ) ) ( not ( = ?auto_4096 ?auto_4105 ) ) ( not ( = ?auto_4097 ?auto_4107 ) ) ( not ( = ?auto_4097 ?auto_4110 ) ) ( not ( = ?auto_4097 ?auto_4106 ) ) ( not ( = ?auto_4097 ?auto_4113 ) ) ( not ( = ?auto_4097 ?auto_4114 ) ) ( not ( = ?auto_4097 ?auto_4105 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4089 ?auto_4090 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4094 ?auto_4095 )
      ( MAKE-1CRATE ?auto_4095 ?auto_4096 )
      ( MAKE-7CRATE-VERIFY ?auto_4089 ?auto_4090 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4094 ?auto_4095 ?auto_4096 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4134 - SURFACE
      ?auto_4135 - SURFACE
      ?auto_4136 - SURFACE
      ?auto_4137 - SURFACE
      ?auto_4138 - SURFACE
      ?auto_4139 - SURFACE
      ?auto_4140 - SURFACE
      ?auto_4141 - SURFACE
      ?auto_4142 - SURFACE
    )
    :vars
    (
      ?auto_4147 - HOIST
      ?auto_4143 - PLACE
      ?auto_4144 - PLACE
      ?auto_4145 - HOIST
      ?auto_4146 - SURFACE
      ?auto_4149 - PLACE
      ?auto_4156 - HOIST
      ?auto_4157 - SURFACE
      ?auto_4153 - SURFACE
      ?auto_4159 - PLACE
      ?auto_4155 - HOIST
      ?auto_4151 - SURFACE
      ?auto_4154 - SURFACE
      ?auto_4160 - SURFACE
      ?auto_4161 - PLACE
      ?auto_4152 - HOIST
      ?auto_4150 - SURFACE
      ?auto_4158 - SURFACE
      ?auto_4148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4147 ?auto_4143 ) ( IS-CRATE ?auto_4142 ) ( not ( = ?auto_4144 ?auto_4143 ) ) ( HOIST-AT ?auto_4145 ?auto_4144 ) ( SURFACE-AT ?auto_4142 ?auto_4144 ) ( ON ?auto_4142 ?auto_4146 ) ( CLEAR ?auto_4142 ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4146 ) ) ( not ( = ?auto_4142 ?auto_4146 ) ) ( not ( = ?auto_4147 ?auto_4145 ) ) ( IS-CRATE ?auto_4141 ) ( not ( = ?auto_4149 ?auto_4143 ) ) ( HOIST-AT ?auto_4156 ?auto_4149 ) ( SURFACE-AT ?auto_4141 ?auto_4149 ) ( ON ?auto_4141 ?auto_4157 ) ( CLEAR ?auto_4141 ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4157 ) ) ( not ( = ?auto_4141 ?auto_4157 ) ) ( not ( = ?auto_4147 ?auto_4156 ) ) ( IS-CRATE ?auto_4140 ) ( SURFACE-AT ?auto_4140 ?auto_4149 ) ( ON ?auto_4140 ?auto_4153 ) ( CLEAR ?auto_4140 ) ( not ( = ?auto_4139 ?auto_4140 ) ) ( not ( = ?auto_4139 ?auto_4153 ) ) ( not ( = ?auto_4140 ?auto_4153 ) ) ( IS-CRATE ?auto_4139 ) ( not ( = ?auto_4159 ?auto_4143 ) ) ( HOIST-AT ?auto_4155 ?auto_4159 ) ( AVAILABLE ?auto_4155 ) ( SURFACE-AT ?auto_4139 ?auto_4159 ) ( ON ?auto_4139 ?auto_4151 ) ( CLEAR ?auto_4139 ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4151 ) ) ( not ( = ?auto_4139 ?auto_4151 ) ) ( not ( = ?auto_4147 ?auto_4155 ) ) ( IS-CRATE ?auto_4138 ) ( SURFACE-AT ?auto_4138 ?auto_4144 ) ( ON ?auto_4138 ?auto_4154 ) ( CLEAR ?auto_4138 ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4154 ) ) ( not ( = ?auto_4138 ?auto_4154 ) ) ( IS-CRATE ?auto_4137 ) ( AVAILABLE ?auto_4145 ) ( SURFACE-AT ?auto_4137 ?auto_4144 ) ( ON ?auto_4137 ?auto_4160 ) ( CLEAR ?auto_4137 ) ( not ( = ?auto_4136 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4160 ) ) ( not ( = ?auto_4137 ?auto_4160 ) ) ( IS-CRATE ?auto_4136 ) ( not ( = ?auto_4161 ?auto_4143 ) ) ( HOIST-AT ?auto_4152 ?auto_4161 ) ( AVAILABLE ?auto_4152 ) ( SURFACE-AT ?auto_4136 ?auto_4161 ) ( ON ?auto_4136 ?auto_4150 ) ( CLEAR ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4136 ) ) ( not ( = ?auto_4135 ?auto_4150 ) ) ( not ( = ?auto_4136 ?auto_4150 ) ) ( not ( = ?auto_4147 ?auto_4152 ) ) ( SURFACE-AT ?auto_4134 ?auto_4143 ) ( CLEAR ?auto_4134 ) ( IS-CRATE ?auto_4135 ) ( AVAILABLE ?auto_4147 ) ( AVAILABLE ?auto_4156 ) ( SURFACE-AT ?auto_4135 ?auto_4149 ) ( ON ?auto_4135 ?auto_4158 ) ( CLEAR ?auto_4135 ) ( TRUCK-AT ?auto_4148 ?auto_4143 ) ( not ( = ?auto_4134 ?auto_4135 ) ) ( not ( = ?auto_4134 ?auto_4158 ) ) ( not ( = ?auto_4135 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4136 ) ) ( not ( = ?auto_4134 ?auto_4150 ) ) ( not ( = ?auto_4136 ?auto_4158 ) ) ( not ( = ?auto_4161 ?auto_4149 ) ) ( not ( = ?auto_4152 ?auto_4156 ) ) ( not ( = ?auto_4150 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4137 ) ) ( not ( = ?auto_4134 ?auto_4160 ) ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( not ( = ?auto_4135 ?auto_4160 ) ) ( not ( = ?auto_4137 ?auto_4150 ) ) ( not ( = ?auto_4137 ?auto_4158 ) ) ( not ( = ?auto_4144 ?auto_4161 ) ) ( not ( = ?auto_4144 ?auto_4149 ) ) ( not ( = ?auto_4145 ?auto_4152 ) ) ( not ( = ?auto_4145 ?auto_4156 ) ) ( not ( = ?auto_4160 ?auto_4150 ) ) ( not ( = ?auto_4160 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4138 ) ) ( not ( = ?auto_4134 ?auto_4154 ) ) ( not ( = ?auto_4135 ?auto_4138 ) ) ( not ( = ?auto_4135 ?auto_4154 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4136 ?auto_4154 ) ) ( not ( = ?auto_4138 ?auto_4160 ) ) ( not ( = ?auto_4138 ?auto_4150 ) ) ( not ( = ?auto_4138 ?auto_4158 ) ) ( not ( = ?auto_4154 ?auto_4160 ) ) ( not ( = ?auto_4154 ?auto_4150 ) ) ( not ( = ?auto_4154 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4139 ) ) ( not ( = ?auto_4134 ?auto_4151 ) ) ( not ( = ?auto_4135 ?auto_4139 ) ) ( not ( = ?auto_4135 ?auto_4151 ) ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4136 ?auto_4151 ) ) ( not ( = ?auto_4137 ?auto_4139 ) ) ( not ( = ?auto_4137 ?auto_4151 ) ) ( not ( = ?auto_4139 ?auto_4154 ) ) ( not ( = ?auto_4139 ?auto_4160 ) ) ( not ( = ?auto_4139 ?auto_4150 ) ) ( not ( = ?auto_4139 ?auto_4158 ) ) ( not ( = ?auto_4159 ?auto_4144 ) ) ( not ( = ?auto_4159 ?auto_4161 ) ) ( not ( = ?auto_4159 ?auto_4149 ) ) ( not ( = ?auto_4155 ?auto_4145 ) ) ( not ( = ?auto_4155 ?auto_4152 ) ) ( not ( = ?auto_4155 ?auto_4156 ) ) ( not ( = ?auto_4151 ?auto_4154 ) ) ( not ( = ?auto_4151 ?auto_4160 ) ) ( not ( = ?auto_4151 ?auto_4150 ) ) ( not ( = ?auto_4151 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4140 ) ) ( not ( = ?auto_4134 ?auto_4153 ) ) ( not ( = ?auto_4135 ?auto_4140 ) ) ( not ( = ?auto_4135 ?auto_4153 ) ) ( not ( = ?auto_4136 ?auto_4140 ) ) ( not ( = ?auto_4136 ?auto_4153 ) ) ( not ( = ?auto_4137 ?auto_4140 ) ) ( not ( = ?auto_4137 ?auto_4153 ) ) ( not ( = ?auto_4138 ?auto_4140 ) ) ( not ( = ?auto_4138 ?auto_4153 ) ) ( not ( = ?auto_4140 ?auto_4151 ) ) ( not ( = ?auto_4140 ?auto_4154 ) ) ( not ( = ?auto_4140 ?auto_4160 ) ) ( not ( = ?auto_4140 ?auto_4150 ) ) ( not ( = ?auto_4140 ?auto_4158 ) ) ( not ( = ?auto_4153 ?auto_4151 ) ) ( not ( = ?auto_4153 ?auto_4154 ) ) ( not ( = ?auto_4153 ?auto_4160 ) ) ( not ( = ?auto_4153 ?auto_4150 ) ) ( not ( = ?auto_4153 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4141 ) ) ( not ( = ?auto_4134 ?auto_4157 ) ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( not ( = ?auto_4135 ?auto_4157 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) ( not ( = ?auto_4136 ?auto_4157 ) ) ( not ( = ?auto_4137 ?auto_4141 ) ) ( not ( = ?auto_4137 ?auto_4157 ) ) ( not ( = ?auto_4138 ?auto_4141 ) ) ( not ( = ?auto_4138 ?auto_4157 ) ) ( not ( = ?auto_4139 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4157 ) ) ( not ( = ?auto_4141 ?auto_4153 ) ) ( not ( = ?auto_4141 ?auto_4151 ) ) ( not ( = ?auto_4141 ?auto_4154 ) ) ( not ( = ?auto_4141 ?auto_4160 ) ) ( not ( = ?auto_4141 ?auto_4150 ) ) ( not ( = ?auto_4141 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4153 ) ) ( not ( = ?auto_4157 ?auto_4151 ) ) ( not ( = ?auto_4157 ?auto_4154 ) ) ( not ( = ?auto_4157 ?auto_4160 ) ) ( not ( = ?auto_4157 ?auto_4150 ) ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4134 ?auto_4142 ) ) ( not ( = ?auto_4134 ?auto_4146 ) ) ( not ( = ?auto_4135 ?auto_4142 ) ) ( not ( = ?auto_4135 ?auto_4146 ) ) ( not ( = ?auto_4136 ?auto_4142 ) ) ( not ( = ?auto_4136 ?auto_4146 ) ) ( not ( = ?auto_4137 ?auto_4142 ) ) ( not ( = ?auto_4137 ?auto_4146 ) ) ( not ( = ?auto_4138 ?auto_4142 ) ) ( not ( = ?auto_4138 ?auto_4146 ) ) ( not ( = ?auto_4139 ?auto_4142 ) ) ( not ( = ?auto_4139 ?auto_4146 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4140 ?auto_4146 ) ) ( not ( = ?auto_4142 ?auto_4157 ) ) ( not ( = ?auto_4142 ?auto_4153 ) ) ( not ( = ?auto_4142 ?auto_4151 ) ) ( not ( = ?auto_4142 ?auto_4154 ) ) ( not ( = ?auto_4142 ?auto_4160 ) ) ( not ( = ?auto_4142 ?auto_4150 ) ) ( not ( = ?auto_4142 ?auto_4158 ) ) ( not ( = ?auto_4146 ?auto_4157 ) ) ( not ( = ?auto_4146 ?auto_4153 ) ) ( not ( = ?auto_4146 ?auto_4151 ) ) ( not ( = ?auto_4146 ?auto_4154 ) ) ( not ( = ?auto_4146 ?auto_4160 ) ) ( not ( = ?auto_4146 ?auto_4150 ) ) ( not ( = ?auto_4146 ?auto_4158 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4134 ?auto_4135 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4139 ?auto_4140 ?auto_4141 )
      ( MAKE-1CRATE ?auto_4141 ?auto_4142 )
      ( MAKE-8CRATE-VERIFY ?auto_4134 ?auto_4135 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4139 ?auto_4140 ?auto_4141 ?auto_4142 ) )
  )

)

