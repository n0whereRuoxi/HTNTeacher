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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3906 - SURFACE
      ?auto_3907 - SURFACE
    )
    :vars
    (
      ?auto_3908 - HOIST
      ?auto_3909 - PLACE
      ?auto_3911 - PLACE
      ?auto_3912 - HOIST
      ?auto_3913 - SURFACE
      ?auto_3910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3908 ?auto_3909 ) ( SURFACE-AT ?auto_3906 ?auto_3909 ) ( CLEAR ?auto_3906 ) ( IS-CRATE ?auto_3907 ) ( AVAILABLE ?auto_3908 ) ( not ( = ?auto_3911 ?auto_3909 ) ) ( HOIST-AT ?auto_3912 ?auto_3911 ) ( AVAILABLE ?auto_3912 ) ( SURFACE-AT ?auto_3907 ?auto_3911 ) ( ON ?auto_3907 ?auto_3913 ) ( CLEAR ?auto_3907 ) ( TRUCK-AT ?auto_3910 ?auto_3909 ) ( not ( = ?auto_3906 ?auto_3907 ) ) ( not ( = ?auto_3906 ?auto_3913 ) ) ( not ( = ?auto_3907 ?auto_3913 ) ) ( not ( = ?auto_3908 ?auto_3912 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3910 ?auto_3909 ?auto_3911 )
      ( !LIFT ?auto_3912 ?auto_3907 ?auto_3913 ?auto_3911 )
      ( !LOAD ?auto_3912 ?auto_3907 ?auto_3910 ?auto_3911 )
      ( !DRIVE ?auto_3910 ?auto_3911 ?auto_3909 )
      ( !UNLOAD ?auto_3908 ?auto_3907 ?auto_3910 ?auto_3909 )
      ( !DROP ?auto_3908 ?auto_3907 ?auto_3906 ?auto_3909 )
      ( MAKE-1CRATE-VERIFY ?auto_3906 ?auto_3907 ) )
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
      ?auto_3925 - HOIST
      ?auto_3924 - PLACE
      ?auto_3922 - PLACE
      ?auto_3920 - HOIST
      ?auto_3921 - SURFACE
      ?auto_3926 - PLACE
      ?auto_3928 - HOIST
      ?auto_3927 - SURFACE
      ?auto_3923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3925 ?auto_3924 ) ( IS-CRATE ?auto_3919 ) ( not ( = ?auto_3922 ?auto_3924 ) ) ( HOIST-AT ?auto_3920 ?auto_3922 ) ( AVAILABLE ?auto_3920 ) ( SURFACE-AT ?auto_3919 ?auto_3922 ) ( ON ?auto_3919 ?auto_3921 ) ( CLEAR ?auto_3919 ) ( not ( = ?auto_3918 ?auto_3919 ) ) ( not ( = ?auto_3918 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3921 ) ) ( not ( = ?auto_3925 ?auto_3920 ) ) ( SURFACE-AT ?auto_3917 ?auto_3924 ) ( CLEAR ?auto_3917 ) ( IS-CRATE ?auto_3918 ) ( AVAILABLE ?auto_3925 ) ( not ( = ?auto_3926 ?auto_3924 ) ) ( HOIST-AT ?auto_3928 ?auto_3926 ) ( AVAILABLE ?auto_3928 ) ( SURFACE-AT ?auto_3918 ?auto_3926 ) ( ON ?auto_3918 ?auto_3927 ) ( CLEAR ?auto_3918 ) ( TRUCK-AT ?auto_3923 ?auto_3924 ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( not ( = ?auto_3917 ?auto_3927 ) ) ( not ( = ?auto_3918 ?auto_3927 ) ) ( not ( = ?auto_3925 ?auto_3928 ) ) ( not ( = ?auto_3917 ?auto_3919 ) ) ( not ( = ?auto_3917 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3927 ) ) ( not ( = ?auto_3922 ?auto_3926 ) ) ( not ( = ?auto_3920 ?auto_3928 ) ) ( not ( = ?auto_3921 ?auto_3927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3917 ?auto_3918 )
      ( MAKE-1CRATE ?auto_3918 ?auto_3919 )
      ( MAKE-2CRATE-VERIFY ?auto_3917 ?auto_3918 ?auto_3919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3931 - SURFACE
      ?auto_3932 - SURFACE
    )
    :vars
    (
      ?auto_3933 - HOIST
      ?auto_3934 - PLACE
      ?auto_3936 - PLACE
      ?auto_3937 - HOIST
      ?auto_3938 - SURFACE
      ?auto_3935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3933 ?auto_3934 ) ( SURFACE-AT ?auto_3931 ?auto_3934 ) ( CLEAR ?auto_3931 ) ( IS-CRATE ?auto_3932 ) ( AVAILABLE ?auto_3933 ) ( not ( = ?auto_3936 ?auto_3934 ) ) ( HOIST-AT ?auto_3937 ?auto_3936 ) ( AVAILABLE ?auto_3937 ) ( SURFACE-AT ?auto_3932 ?auto_3936 ) ( ON ?auto_3932 ?auto_3938 ) ( CLEAR ?auto_3932 ) ( TRUCK-AT ?auto_3935 ?auto_3934 ) ( not ( = ?auto_3931 ?auto_3932 ) ) ( not ( = ?auto_3931 ?auto_3938 ) ) ( not ( = ?auto_3932 ?auto_3938 ) ) ( not ( = ?auto_3933 ?auto_3937 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3935 ?auto_3934 ?auto_3936 )
      ( !LIFT ?auto_3937 ?auto_3932 ?auto_3938 ?auto_3936 )
      ( !LOAD ?auto_3937 ?auto_3932 ?auto_3935 ?auto_3936 )
      ( !DRIVE ?auto_3935 ?auto_3936 ?auto_3934 )
      ( !UNLOAD ?auto_3933 ?auto_3932 ?auto_3935 ?auto_3934 )
      ( !DROP ?auto_3933 ?auto_3932 ?auto_3931 ?auto_3934 )
      ( MAKE-1CRATE-VERIFY ?auto_3931 ?auto_3932 ) )
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
      ?auto_3949 - PLACE
      ?auto_3947 - PLACE
      ?auto_3950 - HOIST
      ?auto_3952 - SURFACE
      ?auto_3956 - PLACE
      ?auto_3958 - HOIST
      ?auto_3955 - SURFACE
      ?auto_3957 - PLACE
      ?auto_3954 - HOIST
      ?auto_3953 - SURFACE
      ?auto_3948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3951 ?auto_3949 ) ( IS-CRATE ?auto_3946 ) ( not ( = ?auto_3947 ?auto_3949 ) ) ( HOIST-AT ?auto_3950 ?auto_3947 ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3946 ?auto_3947 ) ( ON ?auto_3946 ?auto_3952 ) ( CLEAR ?auto_3946 ) ( not ( = ?auto_3945 ?auto_3946 ) ) ( not ( = ?auto_3945 ?auto_3952 ) ) ( not ( = ?auto_3946 ?auto_3952 ) ) ( not ( = ?auto_3951 ?auto_3950 ) ) ( IS-CRATE ?auto_3945 ) ( not ( = ?auto_3956 ?auto_3949 ) ) ( HOIST-AT ?auto_3958 ?auto_3956 ) ( AVAILABLE ?auto_3958 ) ( SURFACE-AT ?auto_3945 ?auto_3956 ) ( ON ?auto_3945 ?auto_3955 ) ( CLEAR ?auto_3945 ) ( not ( = ?auto_3944 ?auto_3945 ) ) ( not ( = ?auto_3944 ?auto_3955 ) ) ( not ( = ?auto_3945 ?auto_3955 ) ) ( not ( = ?auto_3951 ?auto_3958 ) ) ( SURFACE-AT ?auto_3943 ?auto_3949 ) ( CLEAR ?auto_3943 ) ( IS-CRATE ?auto_3944 ) ( AVAILABLE ?auto_3951 ) ( not ( = ?auto_3957 ?auto_3949 ) ) ( HOIST-AT ?auto_3954 ?auto_3957 ) ( AVAILABLE ?auto_3954 ) ( SURFACE-AT ?auto_3944 ?auto_3957 ) ( ON ?auto_3944 ?auto_3953 ) ( CLEAR ?auto_3944 ) ( TRUCK-AT ?auto_3948 ?auto_3949 ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( not ( = ?auto_3943 ?auto_3953 ) ) ( not ( = ?auto_3944 ?auto_3953 ) ) ( not ( = ?auto_3951 ?auto_3954 ) ) ( not ( = ?auto_3943 ?auto_3945 ) ) ( not ( = ?auto_3943 ?auto_3955 ) ) ( not ( = ?auto_3945 ?auto_3953 ) ) ( not ( = ?auto_3956 ?auto_3957 ) ) ( not ( = ?auto_3958 ?auto_3954 ) ) ( not ( = ?auto_3955 ?auto_3953 ) ) ( not ( = ?auto_3943 ?auto_3946 ) ) ( not ( = ?auto_3943 ?auto_3952 ) ) ( not ( = ?auto_3944 ?auto_3946 ) ) ( not ( = ?auto_3944 ?auto_3952 ) ) ( not ( = ?auto_3946 ?auto_3955 ) ) ( not ( = ?auto_3946 ?auto_3953 ) ) ( not ( = ?auto_3947 ?auto_3956 ) ) ( not ( = ?auto_3947 ?auto_3957 ) ) ( not ( = ?auto_3950 ?auto_3958 ) ) ( not ( = ?auto_3950 ?auto_3954 ) ) ( not ( = ?auto_3952 ?auto_3955 ) ) ( not ( = ?auto_3952 ?auto_3953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3943 ?auto_3944 ?auto_3945 )
      ( MAKE-1CRATE ?auto_3945 ?auto_3946 )
      ( MAKE-3CRATE-VERIFY ?auto_3943 ?auto_3944 ?auto_3945 ?auto_3946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3961 - SURFACE
      ?auto_3962 - SURFACE
    )
    :vars
    (
      ?auto_3963 - HOIST
      ?auto_3964 - PLACE
      ?auto_3966 - PLACE
      ?auto_3967 - HOIST
      ?auto_3968 - SURFACE
      ?auto_3965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3963 ?auto_3964 ) ( SURFACE-AT ?auto_3961 ?auto_3964 ) ( CLEAR ?auto_3961 ) ( IS-CRATE ?auto_3962 ) ( AVAILABLE ?auto_3963 ) ( not ( = ?auto_3966 ?auto_3964 ) ) ( HOIST-AT ?auto_3967 ?auto_3966 ) ( AVAILABLE ?auto_3967 ) ( SURFACE-AT ?auto_3962 ?auto_3966 ) ( ON ?auto_3962 ?auto_3968 ) ( CLEAR ?auto_3962 ) ( TRUCK-AT ?auto_3965 ?auto_3964 ) ( not ( = ?auto_3961 ?auto_3962 ) ) ( not ( = ?auto_3961 ?auto_3968 ) ) ( not ( = ?auto_3962 ?auto_3968 ) ) ( not ( = ?auto_3963 ?auto_3967 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3965 ?auto_3964 ?auto_3966 )
      ( !LIFT ?auto_3967 ?auto_3962 ?auto_3968 ?auto_3966 )
      ( !LOAD ?auto_3967 ?auto_3962 ?auto_3965 ?auto_3966 )
      ( !DRIVE ?auto_3965 ?auto_3966 ?auto_3964 )
      ( !UNLOAD ?auto_3963 ?auto_3962 ?auto_3965 ?auto_3964 )
      ( !DROP ?auto_3963 ?auto_3962 ?auto_3961 ?auto_3964 )
      ( MAKE-1CRATE-VERIFY ?auto_3961 ?auto_3962 ) )
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
      ?auto_3979 - HOIST
      ?auto_3981 - PLACE
      ?auto_3980 - PLACE
      ?auto_3982 - HOIST
      ?auto_3984 - SURFACE
      ?auto_3985 - SURFACE
      ?auto_3991 - PLACE
      ?auto_3988 - HOIST
      ?auto_3989 - SURFACE
      ?auto_3990 - PLACE
      ?auto_3987 - HOIST
      ?auto_3986 - SURFACE
      ?auto_3983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3979 ?auto_3981 ) ( IS-CRATE ?auto_3978 ) ( not ( = ?auto_3980 ?auto_3981 ) ) ( HOIST-AT ?auto_3982 ?auto_3980 ) ( SURFACE-AT ?auto_3978 ?auto_3980 ) ( ON ?auto_3978 ?auto_3984 ) ( CLEAR ?auto_3978 ) ( not ( = ?auto_3977 ?auto_3978 ) ) ( not ( = ?auto_3977 ?auto_3984 ) ) ( not ( = ?auto_3978 ?auto_3984 ) ) ( not ( = ?auto_3979 ?auto_3982 ) ) ( IS-CRATE ?auto_3977 ) ( AVAILABLE ?auto_3982 ) ( SURFACE-AT ?auto_3977 ?auto_3980 ) ( ON ?auto_3977 ?auto_3985 ) ( CLEAR ?auto_3977 ) ( not ( = ?auto_3976 ?auto_3977 ) ) ( not ( = ?auto_3976 ?auto_3985 ) ) ( not ( = ?auto_3977 ?auto_3985 ) ) ( IS-CRATE ?auto_3976 ) ( not ( = ?auto_3991 ?auto_3981 ) ) ( HOIST-AT ?auto_3988 ?auto_3991 ) ( AVAILABLE ?auto_3988 ) ( SURFACE-AT ?auto_3976 ?auto_3991 ) ( ON ?auto_3976 ?auto_3989 ) ( CLEAR ?auto_3976 ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( not ( = ?auto_3975 ?auto_3989 ) ) ( not ( = ?auto_3976 ?auto_3989 ) ) ( not ( = ?auto_3979 ?auto_3988 ) ) ( SURFACE-AT ?auto_3974 ?auto_3981 ) ( CLEAR ?auto_3974 ) ( IS-CRATE ?auto_3975 ) ( AVAILABLE ?auto_3979 ) ( not ( = ?auto_3990 ?auto_3981 ) ) ( HOIST-AT ?auto_3987 ?auto_3990 ) ( AVAILABLE ?auto_3987 ) ( SURFACE-AT ?auto_3975 ?auto_3990 ) ( ON ?auto_3975 ?auto_3986 ) ( CLEAR ?auto_3975 ) ( TRUCK-AT ?auto_3983 ?auto_3981 ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3986 ) ) ( not ( = ?auto_3975 ?auto_3986 ) ) ( not ( = ?auto_3979 ?auto_3987 ) ) ( not ( = ?auto_3974 ?auto_3976 ) ) ( not ( = ?auto_3974 ?auto_3989 ) ) ( not ( = ?auto_3976 ?auto_3986 ) ) ( not ( = ?auto_3991 ?auto_3990 ) ) ( not ( = ?auto_3988 ?auto_3987 ) ) ( not ( = ?auto_3989 ?auto_3986 ) ) ( not ( = ?auto_3974 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3985 ) ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( not ( = ?auto_3975 ?auto_3985 ) ) ( not ( = ?auto_3977 ?auto_3989 ) ) ( not ( = ?auto_3977 ?auto_3986 ) ) ( not ( = ?auto_3980 ?auto_3991 ) ) ( not ( = ?auto_3980 ?auto_3990 ) ) ( not ( = ?auto_3982 ?auto_3988 ) ) ( not ( = ?auto_3982 ?auto_3987 ) ) ( not ( = ?auto_3985 ?auto_3989 ) ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( not ( = ?auto_3974 ?auto_3978 ) ) ( not ( = ?auto_3974 ?auto_3984 ) ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3975 ?auto_3984 ) ) ( not ( = ?auto_3976 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3984 ) ) ( not ( = ?auto_3978 ?auto_3985 ) ) ( not ( = ?auto_3978 ?auto_3989 ) ) ( not ( = ?auto_3978 ?auto_3986 ) ) ( not ( = ?auto_3984 ?auto_3985 ) ) ( not ( = ?auto_3984 ?auto_3989 ) ) ( not ( = ?auto_3984 ?auto_3986 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3974 ?auto_3975 ?auto_3976 ?auto_3977 )
      ( MAKE-1CRATE ?auto_3977 ?auto_3978 )
      ( MAKE-4CRATE-VERIFY ?auto_3974 ?auto_3975 ?auto_3976 ?auto_3977 ?auto_3978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3994 - SURFACE
      ?auto_3995 - SURFACE
    )
    :vars
    (
      ?auto_3996 - HOIST
      ?auto_3997 - PLACE
      ?auto_3999 - PLACE
      ?auto_4000 - HOIST
      ?auto_4001 - SURFACE
      ?auto_3998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3996 ?auto_3997 ) ( SURFACE-AT ?auto_3994 ?auto_3997 ) ( CLEAR ?auto_3994 ) ( IS-CRATE ?auto_3995 ) ( AVAILABLE ?auto_3996 ) ( not ( = ?auto_3999 ?auto_3997 ) ) ( HOIST-AT ?auto_4000 ?auto_3999 ) ( AVAILABLE ?auto_4000 ) ( SURFACE-AT ?auto_3995 ?auto_3999 ) ( ON ?auto_3995 ?auto_4001 ) ( CLEAR ?auto_3995 ) ( TRUCK-AT ?auto_3998 ?auto_3997 ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_4001 ) ) ( not ( = ?auto_3995 ?auto_4001 ) ) ( not ( = ?auto_3996 ?auto_4000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3998 ?auto_3997 ?auto_3999 )
      ( !LIFT ?auto_4000 ?auto_3995 ?auto_4001 ?auto_3999 )
      ( !LOAD ?auto_4000 ?auto_3995 ?auto_3998 ?auto_3999 )
      ( !DRIVE ?auto_3998 ?auto_3999 ?auto_3997 )
      ( !UNLOAD ?auto_3996 ?auto_3995 ?auto_3998 ?auto_3997 )
      ( !DROP ?auto_3996 ?auto_3995 ?auto_3994 ?auto_3997 )
      ( MAKE-1CRATE-VERIFY ?auto_3994 ?auto_3995 ) )
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
      ?auto_4018 - HOIST
      ?auto_4019 - PLACE
      ?auto_4017 - PLACE
      ?auto_4016 - HOIST
      ?auto_4014 - SURFACE
      ?auto_4025 - PLACE
      ?auto_4022 - HOIST
      ?auto_4029 - SURFACE
      ?auto_4027 - SURFACE
      ?auto_4023 - PLACE
      ?auto_4021 - HOIST
      ?auto_4028 - SURFACE
      ?auto_4026 - PLACE
      ?auto_4024 - HOIST
      ?auto_4020 - SURFACE
      ?auto_4015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4018 ?auto_4019 ) ( IS-CRATE ?auto_4013 ) ( not ( = ?auto_4017 ?auto_4019 ) ) ( HOIST-AT ?auto_4016 ?auto_4017 ) ( AVAILABLE ?auto_4016 ) ( SURFACE-AT ?auto_4013 ?auto_4017 ) ( ON ?auto_4013 ?auto_4014 ) ( CLEAR ?auto_4013 ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( not ( = ?auto_4012 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4014 ) ) ( not ( = ?auto_4018 ?auto_4016 ) ) ( IS-CRATE ?auto_4012 ) ( not ( = ?auto_4025 ?auto_4019 ) ) ( HOIST-AT ?auto_4022 ?auto_4025 ) ( SURFACE-AT ?auto_4012 ?auto_4025 ) ( ON ?auto_4012 ?auto_4029 ) ( CLEAR ?auto_4012 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4029 ) ) ( not ( = ?auto_4012 ?auto_4029 ) ) ( not ( = ?auto_4018 ?auto_4022 ) ) ( IS-CRATE ?auto_4011 ) ( AVAILABLE ?auto_4022 ) ( SURFACE-AT ?auto_4011 ?auto_4025 ) ( ON ?auto_4011 ?auto_4027 ) ( CLEAR ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4010 ?auto_4027 ) ) ( not ( = ?auto_4011 ?auto_4027 ) ) ( IS-CRATE ?auto_4010 ) ( not ( = ?auto_4023 ?auto_4019 ) ) ( HOIST-AT ?auto_4021 ?auto_4023 ) ( AVAILABLE ?auto_4021 ) ( SURFACE-AT ?auto_4010 ?auto_4023 ) ( ON ?auto_4010 ?auto_4028 ) ( CLEAR ?auto_4010 ) ( not ( = ?auto_4009 ?auto_4010 ) ) ( not ( = ?auto_4009 ?auto_4028 ) ) ( not ( = ?auto_4010 ?auto_4028 ) ) ( not ( = ?auto_4018 ?auto_4021 ) ) ( SURFACE-AT ?auto_4008 ?auto_4019 ) ( CLEAR ?auto_4008 ) ( IS-CRATE ?auto_4009 ) ( AVAILABLE ?auto_4018 ) ( not ( = ?auto_4026 ?auto_4019 ) ) ( HOIST-AT ?auto_4024 ?auto_4026 ) ( AVAILABLE ?auto_4024 ) ( SURFACE-AT ?auto_4009 ?auto_4026 ) ( ON ?auto_4009 ?auto_4020 ) ( CLEAR ?auto_4009 ) ( TRUCK-AT ?auto_4015 ?auto_4019 ) ( not ( = ?auto_4008 ?auto_4009 ) ) ( not ( = ?auto_4008 ?auto_4020 ) ) ( not ( = ?auto_4009 ?auto_4020 ) ) ( not ( = ?auto_4018 ?auto_4024 ) ) ( not ( = ?auto_4008 ?auto_4010 ) ) ( not ( = ?auto_4008 ?auto_4028 ) ) ( not ( = ?auto_4010 ?auto_4020 ) ) ( not ( = ?auto_4023 ?auto_4026 ) ) ( not ( = ?auto_4021 ?auto_4024 ) ) ( not ( = ?auto_4028 ?auto_4020 ) ) ( not ( = ?auto_4008 ?auto_4011 ) ) ( not ( = ?auto_4008 ?auto_4027 ) ) ( not ( = ?auto_4009 ?auto_4011 ) ) ( not ( = ?auto_4009 ?auto_4027 ) ) ( not ( = ?auto_4011 ?auto_4028 ) ) ( not ( = ?auto_4011 ?auto_4020 ) ) ( not ( = ?auto_4025 ?auto_4023 ) ) ( not ( = ?auto_4025 ?auto_4026 ) ) ( not ( = ?auto_4022 ?auto_4021 ) ) ( not ( = ?auto_4022 ?auto_4024 ) ) ( not ( = ?auto_4027 ?auto_4028 ) ) ( not ( = ?auto_4027 ?auto_4020 ) ) ( not ( = ?auto_4008 ?auto_4012 ) ) ( not ( = ?auto_4008 ?auto_4029 ) ) ( not ( = ?auto_4009 ?auto_4012 ) ) ( not ( = ?auto_4009 ?auto_4029 ) ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4010 ?auto_4029 ) ) ( not ( = ?auto_4012 ?auto_4027 ) ) ( not ( = ?auto_4012 ?auto_4028 ) ) ( not ( = ?auto_4012 ?auto_4020 ) ) ( not ( = ?auto_4029 ?auto_4027 ) ) ( not ( = ?auto_4029 ?auto_4028 ) ) ( not ( = ?auto_4029 ?auto_4020 ) ) ( not ( = ?auto_4008 ?auto_4013 ) ) ( not ( = ?auto_4008 ?auto_4014 ) ) ( not ( = ?auto_4009 ?auto_4013 ) ) ( not ( = ?auto_4009 ?auto_4014 ) ) ( not ( = ?auto_4010 ?auto_4013 ) ) ( not ( = ?auto_4010 ?auto_4014 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_4011 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4029 ) ) ( not ( = ?auto_4013 ?auto_4027 ) ) ( not ( = ?auto_4013 ?auto_4028 ) ) ( not ( = ?auto_4013 ?auto_4020 ) ) ( not ( = ?auto_4017 ?auto_4025 ) ) ( not ( = ?auto_4017 ?auto_4023 ) ) ( not ( = ?auto_4017 ?auto_4026 ) ) ( not ( = ?auto_4016 ?auto_4022 ) ) ( not ( = ?auto_4016 ?auto_4021 ) ) ( not ( = ?auto_4016 ?auto_4024 ) ) ( not ( = ?auto_4014 ?auto_4029 ) ) ( not ( = ?auto_4014 ?auto_4027 ) ) ( not ( = ?auto_4014 ?auto_4028 ) ) ( not ( = ?auto_4014 ?auto_4020 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4008 ?auto_4009 ?auto_4010 ?auto_4011 ?auto_4012 )
      ( MAKE-1CRATE ?auto_4012 ?auto_4013 )
      ( MAKE-5CRATE-VERIFY ?auto_4008 ?auto_4009 ?auto_4010 ?auto_4011 ?auto_4012 ?auto_4013 ) )
  )

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_4034 ?auto_4035 ) ( SURFACE-AT ?auto_4032 ?auto_4035 ) ( CLEAR ?auto_4032 ) ( IS-CRATE ?auto_4033 ) ( AVAILABLE ?auto_4034 ) ( not ( = ?auto_4037 ?auto_4035 ) ) ( HOIST-AT ?auto_4038 ?auto_4037 ) ( AVAILABLE ?auto_4038 ) ( SURFACE-AT ?auto_4033 ?auto_4037 ) ( ON ?auto_4033 ?auto_4039 ) ( CLEAR ?auto_4033 ) ( TRUCK-AT ?auto_4036 ?auto_4035 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4039 ) ) ( not ( = ?auto_4033 ?auto_4039 ) ) ( not ( = ?auto_4034 ?auto_4038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4036 ?auto_4035 ?auto_4037 )
      ( !LIFT ?auto_4038 ?auto_4033 ?auto_4039 ?auto_4037 )
      ( !LOAD ?auto_4038 ?auto_4033 ?auto_4036 ?auto_4037 )
      ( !DRIVE ?auto_4036 ?auto_4037 ?auto_4035 )
      ( !UNLOAD ?auto_4034 ?auto_4033 ?auto_4036 ?auto_4035 )
      ( !DROP ?auto_4034 ?auto_4033 ?auto_4032 ?auto_4035 )
      ( MAKE-1CRATE-VERIFY ?auto_4032 ?auto_4033 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4047 - SURFACE
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
      ?auto_4050 - SURFACE
      ?auto_4051 - SURFACE
      ?auto_4053 - SURFACE
      ?auto_4052 - SURFACE
    )
    :vars
    (
      ?auto_4059 - HOIST
      ?auto_4057 - PLACE
      ?auto_4055 - PLACE
      ?auto_4058 - HOIST
      ?auto_4056 - SURFACE
      ?auto_4060 - PLACE
      ?auto_4069 - HOIST
      ?auto_4061 - SURFACE
      ?auto_4070 - PLACE
      ?auto_4063 - HOIST
      ?auto_4066 - SURFACE
      ?auto_4068 - SURFACE
      ?auto_4064 - PLACE
      ?auto_4065 - HOIST
      ?auto_4067 - SURFACE
      ?auto_4062 - SURFACE
      ?auto_4054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4059 ?auto_4057 ) ( IS-CRATE ?auto_4052 ) ( not ( = ?auto_4055 ?auto_4057 ) ) ( HOIST-AT ?auto_4058 ?auto_4055 ) ( SURFACE-AT ?auto_4052 ?auto_4055 ) ( ON ?auto_4052 ?auto_4056 ) ( CLEAR ?auto_4052 ) ( not ( = ?auto_4053 ?auto_4052 ) ) ( not ( = ?auto_4053 ?auto_4056 ) ) ( not ( = ?auto_4052 ?auto_4056 ) ) ( not ( = ?auto_4059 ?auto_4058 ) ) ( IS-CRATE ?auto_4053 ) ( not ( = ?auto_4060 ?auto_4057 ) ) ( HOIST-AT ?auto_4069 ?auto_4060 ) ( AVAILABLE ?auto_4069 ) ( SURFACE-AT ?auto_4053 ?auto_4060 ) ( ON ?auto_4053 ?auto_4061 ) ( CLEAR ?auto_4053 ) ( not ( = ?auto_4051 ?auto_4053 ) ) ( not ( = ?auto_4051 ?auto_4061 ) ) ( not ( = ?auto_4053 ?auto_4061 ) ) ( not ( = ?auto_4059 ?auto_4069 ) ) ( IS-CRATE ?auto_4051 ) ( not ( = ?auto_4070 ?auto_4057 ) ) ( HOIST-AT ?auto_4063 ?auto_4070 ) ( SURFACE-AT ?auto_4051 ?auto_4070 ) ( ON ?auto_4051 ?auto_4066 ) ( CLEAR ?auto_4051 ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( not ( = ?auto_4050 ?auto_4066 ) ) ( not ( = ?auto_4051 ?auto_4066 ) ) ( not ( = ?auto_4059 ?auto_4063 ) ) ( IS-CRATE ?auto_4050 ) ( AVAILABLE ?auto_4063 ) ( SURFACE-AT ?auto_4050 ?auto_4070 ) ( ON ?auto_4050 ?auto_4068 ) ( CLEAR ?auto_4050 ) ( not ( = ?auto_4049 ?auto_4050 ) ) ( not ( = ?auto_4049 ?auto_4068 ) ) ( not ( = ?auto_4050 ?auto_4068 ) ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4064 ?auto_4057 ) ) ( HOIST-AT ?auto_4065 ?auto_4064 ) ( AVAILABLE ?auto_4065 ) ( SURFACE-AT ?auto_4049 ?auto_4064 ) ( ON ?auto_4049 ?auto_4067 ) ( CLEAR ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4067 ) ) ( not ( = ?auto_4049 ?auto_4067 ) ) ( not ( = ?auto_4059 ?auto_4065 ) ) ( SURFACE-AT ?auto_4047 ?auto_4057 ) ( CLEAR ?auto_4047 ) ( IS-CRATE ?auto_4048 ) ( AVAILABLE ?auto_4059 ) ( AVAILABLE ?auto_4058 ) ( SURFACE-AT ?auto_4048 ?auto_4055 ) ( ON ?auto_4048 ?auto_4062 ) ( CLEAR ?auto_4048 ) ( TRUCK-AT ?auto_4054 ?auto_4057 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4062 ) ) ( not ( = ?auto_4048 ?auto_4062 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4047 ?auto_4067 ) ) ( not ( = ?auto_4049 ?auto_4062 ) ) ( not ( = ?auto_4064 ?auto_4055 ) ) ( not ( = ?auto_4065 ?auto_4058 ) ) ( not ( = ?auto_4067 ?auto_4062 ) ) ( not ( = ?auto_4047 ?auto_4050 ) ) ( not ( = ?auto_4047 ?auto_4068 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4068 ) ) ( not ( = ?auto_4050 ?auto_4067 ) ) ( not ( = ?auto_4050 ?auto_4062 ) ) ( not ( = ?auto_4070 ?auto_4064 ) ) ( not ( = ?auto_4070 ?auto_4055 ) ) ( not ( = ?auto_4063 ?auto_4065 ) ) ( not ( = ?auto_4063 ?auto_4058 ) ) ( not ( = ?auto_4068 ?auto_4067 ) ) ( not ( = ?auto_4068 ?auto_4062 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4047 ?auto_4066 ) ) ( not ( = ?auto_4048 ?auto_4051 ) ) ( not ( = ?auto_4048 ?auto_4066 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4066 ) ) ( not ( = ?auto_4051 ?auto_4068 ) ) ( not ( = ?auto_4051 ?auto_4067 ) ) ( not ( = ?auto_4051 ?auto_4062 ) ) ( not ( = ?auto_4066 ?auto_4068 ) ) ( not ( = ?auto_4066 ?auto_4067 ) ) ( not ( = ?auto_4066 ?auto_4062 ) ) ( not ( = ?auto_4047 ?auto_4053 ) ) ( not ( = ?auto_4047 ?auto_4061 ) ) ( not ( = ?auto_4048 ?auto_4053 ) ) ( not ( = ?auto_4048 ?auto_4061 ) ) ( not ( = ?auto_4049 ?auto_4053 ) ) ( not ( = ?auto_4049 ?auto_4061 ) ) ( not ( = ?auto_4050 ?auto_4053 ) ) ( not ( = ?auto_4050 ?auto_4061 ) ) ( not ( = ?auto_4053 ?auto_4066 ) ) ( not ( = ?auto_4053 ?auto_4068 ) ) ( not ( = ?auto_4053 ?auto_4067 ) ) ( not ( = ?auto_4053 ?auto_4062 ) ) ( not ( = ?auto_4060 ?auto_4070 ) ) ( not ( = ?auto_4060 ?auto_4064 ) ) ( not ( = ?auto_4060 ?auto_4055 ) ) ( not ( = ?auto_4069 ?auto_4063 ) ) ( not ( = ?auto_4069 ?auto_4065 ) ) ( not ( = ?auto_4069 ?auto_4058 ) ) ( not ( = ?auto_4061 ?auto_4066 ) ) ( not ( = ?auto_4061 ?auto_4068 ) ) ( not ( = ?auto_4061 ?auto_4067 ) ) ( not ( = ?auto_4061 ?auto_4062 ) ) ( not ( = ?auto_4047 ?auto_4052 ) ) ( not ( = ?auto_4047 ?auto_4056 ) ) ( not ( = ?auto_4048 ?auto_4052 ) ) ( not ( = ?auto_4048 ?auto_4056 ) ) ( not ( = ?auto_4049 ?auto_4052 ) ) ( not ( = ?auto_4049 ?auto_4056 ) ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( not ( = ?auto_4050 ?auto_4056 ) ) ( not ( = ?auto_4051 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4056 ) ) ( not ( = ?auto_4052 ?auto_4061 ) ) ( not ( = ?auto_4052 ?auto_4066 ) ) ( not ( = ?auto_4052 ?auto_4068 ) ) ( not ( = ?auto_4052 ?auto_4067 ) ) ( not ( = ?auto_4052 ?auto_4062 ) ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4056 ?auto_4066 ) ) ( not ( = ?auto_4056 ?auto_4068 ) ) ( not ( = ?auto_4056 ?auto_4067 ) ) ( not ( = ?auto_4056 ?auto_4062 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ?auto_4053 )
      ( MAKE-1CRATE ?auto_4053 ?auto_4052 )
      ( MAKE-6CRATE-VERIFY ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ?auto_4053 ?auto_4052 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
    )
    :vars
    (
      ?auto_4075 - HOIST
      ?auto_4076 - PLACE
      ?auto_4078 - PLACE
      ?auto_4079 - HOIST
      ?auto_4080 - SURFACE
      ?auto_4077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4075 ?auto_4076 ) ( SURFACE-AT ?auto_4073 ?auto_4076 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4074 ) ( AVAILABLE ?auto_4075 ) ( not ( = ?auto_4078 ?auto_4076 ) ) ( HOIST-AT ?auto_4079 ?auto_4078 ) ( AVAILABLE ?auto_4079 ) ( SURFACE-AT ?auto_4074 ?auto_4078 ) ( ON ?auto_4074 ?auto_4080 ) ( CLEAR ?auto_4074 ) ( TRUCK-AT ?auto_4077 ?auto_4076 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4080 ) ) ( not ( = ?auto_4074 ?auto_4080 ) ) ( not ( = ?auto_4075 ?auto_4079 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4077 ?auto_4076 ?auto_4078 )
      ( !LIFT ?auto_4079 ?auto_4074 ?auto_4080 ?auto_4078 )
      ( !LOAD ?auto_4079 ?auto_4074 ?auto_4077 ?auto_4078 )
      ( !DRIVE ?auto_4077 ?auto_4078 ?auto_4076 )
      ( !UNLOAD ?auto_4075 ?auto_4074 ?auto_4077 ?auto_4076 )
      ( !DROP ?auto_4075 ?auto_4074 ?auto_4073 ?auto_4076 )
      ( MAKE-1CRATE-VERIFY ?auto_4073 ?auto_4074 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4089 - SURFACE
      ?auto_4090 - SURFACE
      ?auto_4091 - SURFACE
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
      ?auto_4095 - SURFACE
      ?auto_4094 - SURFACE
      ?auto_4096 - SURFACE
    )
    :vars
    (
      ?auto_4102 - HOIST
      ?auto_4101 - PLACE
      ?auto_4098 - PLACE
      ?auto_4099 - HOIST
      ?auto_4097 - SURFACE
      ?auto_4103 - SURFACE
      ?auto_4105 - PLACE
      ?auto_4104 - HOIST
      ?auto_4107 - SURFACE
      ?auto_4108 - PLACE
      ?auto_4106 - HOIST
      ?auto_4111 - SURFACE
      ?auto_4109 - SURFACE
      ?auto_4113 - PLACE
      ?auto_4112 - HOIST
      ?auto_4110 - SURFACE
      ?auto_4114 - SURFACE
      ?auto_4100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4102 ?auto_4101 ) ( IS-CRATE ?auto_4096 ) ( not ( = ?auto_4098 ?auto_4101 ) ) ( HOIST-AT ?auto_4099 ?auto_4098 ) ( SURFACE-AT ?auto_4096 ?auto_4098 ) ( ON ?auto_4096 ?auto_4097 ) ( CLEAR ?auto_4096 ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4094 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( not ( = ?auto_4102 ?auto_4099 ) ) ( IS-CRATE ?auto_4094 ) ( SURFACE-AT ?auto_4094 ?auto_4098 ) ( ON ?auto_4094 ?auto_4103 ) ( CLEAR ?auto_4094 ) ( not ( = ?auto_4095 ?auto_4094 ) ) ( not ( = ?auto_4095 ?auto_4103 ) ) ( not ( = ?auto_4094 ?auto_4103 ) ) ( IS-CRATE ?auto_4095 ) ( not ( = ?auto_4105 ?auto_4101 ) ) ( HOIST-AT ?auto_4104 ?auto_4105 ) ( AVAILABLE ?auto_4104 ) ( SURFACE-AT ?auto_4095 ?auto_4105 ) ( ON ?auto_4095 ?auto_4107 ) ( CLEAR ?auto_4095 ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4107 ) ) ( not ( = ?auto_4095 ?auto_4107 ) ) ( not ( = ?auto_4102 ?auto_4104 ) ) ( IS-CRATE ?auto_4093 ) ( not ( = ?auto_4108 ?auto_4101 ) ) ( HOIST-AT ?auto_4106 ?auto_4108 ) ( SURFACE-AT ?auto_4093 ?auto_4108 ) ( ON ?auto_4093 ?auto_4111 ) ( CLEAR ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4111 ) ) ( not ( = ?auto_4093 ?auto_4111 ) ) ( not ( = ?auto_4102 ?auto_4106 ) ) ( IS-CRATE ?auto_4092 ) ( AVAILABLE ?auto_4106 ) ( SURFACE-AT ?auto_4092 ?auto_4108 ) ( ON ?auto_4092 ?auto_4109 ) ( CLEAR ?auto_4092 ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4109 ) ) ( not ( = ?auto_4092 ?auto_4109 ) ) ( IS-CRATE ?auto_4091 ) ( not ( = ?auto_4113 ?auto_4101 ) ) ( HOIST-AT ?auto_4112 ?auto_4113 ) ( AVAILABLE ?auto_4112 ) ( SURFACE-AT ?auto_4091 ?auto_4113 ) ( ON ?auto_4091 ?auto_4110 ) ( CLEAR ?auto_4091 ) ( not ( = ?auto_4090 ?auto_4091 ) ) ( not ( = ?auto_4090 ?auto_4110 ) ) ( not ( = ?auto_4091 ?auto_4110 ) ) ( not ( = ?auto_4102 ?auto_4112 ) ) ( SURFACE-AT ?auto_4089 ?auto_4101 ) ( CLEAR ?auto_4089 ) ( IS-CRATE ?auto_4090 ) ( AVAILABLE ?auto_4102 ) ( AVAILABLE ?auto_4099 ) ( SURFACE-AT ?auto_4090 ?auto_4098 ) ( ON ?auto_4090 ?auto_4114 ) ( CLEAR ?auto_4090 ) ( TRUCK-AT ?auto_4100 ?auto_4101 ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4114 ) ) ( not ( = ?auto_4090 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4091 ) ) ( not ( = ?auto_4089 ?auto_4110 ) ) ( not ( = ?auto_4091 ?auto_4114 ) ) ( not ( = ?auto_4113 ?auto_4098 ) ) ( not ( = ?auto_4112 ?auto_4099 ) ) ( not ( = ?auto_4110 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4092 ) ) ( not ( = ?auto_4089 ?auto_4109 ) ) ( not ( = ?auto_4090 ?auto_4092 ) ) ( not ( = ?auto_4090 ?auto_4109 ) ) ( not ( = ?auto_4092 ?auto_4110 ) ) ( not ( = ?auto_4092 ?auto_4114 ) ) ( not ( = ?auto_4108 ?auto_4113 ) ) ( not ( = ?auto_4108 ?auto_4098 ) ) ( not ( = ?auto_4106 ?auto_4112 ) ) ( not ( = ?auto_4106 ?auto_4099 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4093 ) ) ( not ( = ?auto_4089 ?auto_4111 ) ) ( not ( = ?auto_4090 ?auto_4093 ) ) ( not ( = ?auto_4090 ?auto_4111 ) ) ( not ( = ?auto_4091 ?auto_4093 ) ) ( not ( = ?auto_4091 ?auto_4111 ) ) ( not ( = ?auto_4093 ?auto_4109 ) ) ( not ( = ?auto_4093 ?auto_4110 ) ) ( not ( = ?auto_4093 ?auto_4114 ) ) ( not ( = ?auto_4111 ?auto_4109 ) ) ( not ( = ?auto_4111 ?auto_4110 ) ) ( not ( = ?auto_4111 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4095 ) ) ( not ( = ?auto_4089 ?auto_4107 ) ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( not ( = ?auto_4090 ?auto_4107 ) ) ( not ( = ?auto_4091 ?auto_4095 ) ) ( not ( = ?auto_4091 ?auto_4107 ) ) ( not ( = ?auto_4092 ?auto_4095 ) ) ( not ( = ?auto_4092 ?auto_4107 ) ) ( not ( = ?auto_4095 ?auto_4111 ) ) ( not ( = ?auto_4095 ?auto_4109 ) ) ( not ( = ?auto_4095 ?auto_4110 ) ) ( not ( = ?auto_4095 ?auto_4114 ) ) ( not ( = ?auto_4105 ?auto_4108 ) ) ( not ( = ?auto_4105 ?auto_4113 ) ) ( not ( = ?auto_4105 ?auto_4098 ) ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( not ( = ?auto_4104 ?auto_4112 ) ) ( not ( = ?auto_4104 ?auto_4099 ) ) ( not ( = ?auto_4107 ?auto_4111 ) ) ( not ( = ?auto_4107 ?auto_4109 ) ) ( not ( = ?auto_4107 ?auto_4110 ) ) ( not ( = ?auto_4107 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4094 ) ) ( not ( = ?auto_4089 ?auto_4103 ) ) ( not ( = ?auto_4090 ?auto_4094 ) ) ( not ( = ?auto_4090 ?auto_4103 ) ) ( not ( = ?auto_4091 ?auto_4094 ) ) ( not ( = ?auto_4091 ?auto_4103 ) ) ( not ( = ?auto_4092 ?auto_4094 ) ) ( not ( = ?auto_4092 ?auto_4103 ) ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4103 ) ) ( not ( = ?auto_4094 ?auto_4107 ) ) ( not ( = ?auto_4094 ?auto_4111 ) ) ( not ( = ?auto_4094 ?auto_4109 ) ) ( not ( = ?auto_4094 ?auto_4110 ) ) ( not ( = ?auto_4094 ?auto_4114 ) ) ( not ( = ?auto_4103 ?auto_4107 ) ) ( not ( = ?auto_4103 ?auto_4111 ) ) ( not ( = ?auto_4103 ?auto_4109 ) ) ( not ( = ?auto_4103 ?auto_4110 ) ) ( not ( = ?auto_4103 ?auto_4114 ) ) ( not ( = ?auto_4089 ?auto_4096 ) ) ( not ( = ?auto_4089 ?auto_4097 ) ) ( not ( = ?auto_4090 ?auto_4096 ) ) ( not ( = ?auto_4090 ?auto_4097 ) ) ( not ( = ?auto_4091 ?auto_4096 ) ) ( not ( = ?auto_4091 ?auto_4097 ) ) ( not ( = ?auto_4092 ?auto_4096 ) ) ( not ( = ?auto_4092 ?auto_4097 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4093 ?auto_4097 ) ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4103 ) ) ( not ( = ?auto_4096 ?auto_4107 ) ) ( not ( = ?auto_4096 ?auto_4111 ) ) ( not ( = ?auto_4096 ?auto_4109 ) ) ( not ( = ?auto_4096 ?auto_4110 ) ) ( not ( = ?auto_4096 ?auto_4114 ) ) ( not ( = ?auto_4097 ?auto_4103 ) ) ( not ( = ?auto_4097 ?auto_4107 ) ) ( not ( = ?auto_4097 ?auto_4111 ) ) ( not ( = ?auto_4097 ?auto_4109 ) ) ( not ( = ?auto_4097 ?auto_4110 ) ) ( not ( = ?auto_4097 ?auto_4114 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4089 ?auto_4090 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4095 ?auto_4094 )
      ( MAKE-1CRATE ?auto_4094 ?auto_4096 )
      ( MAKE-7CRATE-VERIFY ?auto_4089 ?auto_4090 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4095 ?auto_4094 ?auto_4096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4117 - SURFACE
      ?auto_4118 - SURFACE
    )
    :vars
    (
      ?auto_4119 - HOIST
      ?auto_4120 - PLACE
      ?auto_4122 - PLACE
      ?auto_4123 - HOIST
      ?auto_4124 - SURFACE
      ?auto_4121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4119 ?auto_4120 ) ( SURFACE-AT ?auto_4117 ?auto_4120 ) ( CLEAR ?auto_4117 ) ( IS-CRATE ?auto_4118 ) ( AVAILABLE ?auto_4119 ) ( not ( = ?auto_4122 ?auto_4120 ) ) ( HOIST-AT ?auto_4123 ?auto_4122 ) ( AVAILABLE ?auto_4123 ) ( SURFACE-AT ?auto_4118 ?auto_4122 ) ( ON ?auto_4118 ?auto_4124 ) ( CLEAR ?auto_4118 ) ( TRUCK-AT ?auto_4121 ?auto_4120 ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4124 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4121 ?auto_4120 ?auto_4122 )
      ( !LIFT ?auto_4123 ?auto_4118 ?auto_4124 ?auto_4122 )
      ( !LOAD ?auto_4123 ?auto_4118 ?auto_4121 ?auto_4122 )
      ( !DRIVE ?auto_4121 ?auto_4122 ?auto_4120 )
      ( !UNLOAD ?auto_4119 ?auto_4118 ?auto_4121 ?auto_4120 )
      ( !DROP ?auto_4119 ?auto_4118 ?auto_4117 ?auto_4120 )
      ( MAKE-1CRATE-VERIFY ?auto_4117 ?auto_4118 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4134 - SURFACE
      ?auto_4135 - SURFACE
      ?auto_4136 - SURFACE
      ?auto_4137 - SURFACE
      ?auto_4138 - SURFACE
      ?auto_4140 - SURFACE
      ?auto_4139 - SURFACE
      ?auto_4142 - SURFACE
      ?auto_4141 - SURFACE
    )
    :vars
    (
      ?auto_4143 - HOIST
      ?auto_4147 - PLACE
      ?auto_4146 - PLACE
      ?auto_4145 - HOIST
      ?auto_4148 - SURFACE
      ?auto_4156 - PLACE
      ?auto_4157 - HOIST
      ?auto_4158 - SURFACE
      ?auto_4160 - SURFACE
      ?auto_4161 - PLACE
      ?auto_4159 - HOIST
      ?auto_4155 - SURFACE
      ?auto_4149 - SURFACE
      ?auto_4154 - SURFACE
      ?auto_4150 - PLACE
      ?auto_4151 - HOIST
      ?auto_4153 - SURFACE
      ?auto_4152 - SURFACE
      ?auto_4144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4143 ?auto_4147 ) ( IS-CRATE ?auto_4141 ) ( not ( = ?auto_4146 ?auto_4147 ) ) ( HOIST-AT ?auto_4145 ?auto_4146 ) ( SURFACE-AT ?auto_4141 ?auto_4146 ) ( ON ?auto_4141 ?auto_4148 ) ( CLEAR ?auto_4141 ) ( not ( = ?auto_4142 ?auto_4141 ) ) ( not ( = ?auto_4142 ?auto_4148 ) ) ( not ( = ?auto_4141 ?auto_4148 ) ) ( not ( = ?auto_4143 ?auto_4145 ) ) ( IS-CRATE ?auto_4142 ) ( not ( = ?auto_4156 ?auto_4147 ) ) ( HOIST-AT ?auto_4157 ?auto_4156 ) ( SURFACE-AT ?auto_4142 ?auto_4156 ) ( ON ?auto_4142 ?auto_4158 ) ( CLEAR ?auto_4142 ) ( not ( = ?auto_4139 ?auto_4142 ) ) ( not ( = ?auto_4139 ?auto_4158 ) ) ( not ( = ?auto_4142 ?auto_4158 ) ) ( not ( = ?auto_4143 ?auto_4157 ) ) ( IS-CRATE ?auto_4139 ) ( SURFACE-AT ?auto_4139 ?auto_4156 ) ( ON ?auto_4139 ?auto_4160 ) ( CLEAR ?auto_4139 ) ( not ( = ?auto_4140 ?auto_4139 ) ) ( not ( = ?auto_4140 ?auto_4160 ) ) ( not ( = ?auto_4139 ?auto_4160 ) ) ( IS-CRATE ?auto_4140 ) ( not ( = ?auto_4161 ?auto_4147 ) ) ( HOIST-AT ?auto_4159 ?auto_4161 ) ( AVAILABLE ?auto_4159 ) ( SURFACE-AT ?auto_4140 ?auto_4161 ) ( ON ?auto_4140 ?auto_4155 ) ( CLEAR ?auto_4140 ) ( not ( = ?auto_4138 ?auto_4140 ) ) ( not ( = ?auto_4138 ?auto_4155 ) ) ( not ( = ?auto_4140 ?auto_4155 ) ) ( not ( = ?auto_4143 ?auto_4159 ) ) ( IS-CRATE ?auto_4138 ) ( SURFACE-AT ?auto_4138 ?auto_4146 ) ( ON ?auto_4138 ?auto_4149 ) ( CLEAR ?auto_4138 ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4149 ) ) ( not ( = ?auto_4138 ?auto_4149 ) ) ( IS-CRATE ?auto_4137 ) ( AVAILABLE ?auto_4145 ) ( SURFACE-AT ?auto_4137 ?auto_4146 ) ( ON ?auto_4137 ?auto_4154 ) ( CLEAR ?auto_4137 ) ( not ( = ?auto_4136 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4154 ) ) ( not ( = ?auto_4137 ?auto_4154 ) ) ( IS-CRATE ?auto_4136 ) ( not ( = ?auto_4150 ?auto_4147 ) ) ( HOIST-AT ?auto_4151 ?auto_4150 ) ( AVAILABLE ?auto_4151 ) ( SURFACE-AT ?auto_4136 ?auto_4150 ) ( ON ?auto_4136 ?auto_4153 ) ( CLEAR ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4136 ) ) ( not ( = ?auto_4135 ?auto_4153 ) ) ( not ( = ?auto_4136 ?auto_4153 ) ) ( not ( = ?auto_4143 ?auto_4151 ) ) ( SURFACE-AT ?auto_4134 ?auto_4147 ) ( CLEAR ?auto_4134 ) ( IS-CRATE ?auto_4135 ) ( AVAILABLE ?auto_4143 ) ( AVAILABLE ?auto_4157 ) ( SURFACE-AT ?auto_4135 ?auto_4156 ) ( ON ?auto_4135 ?auto_4152 ) ( CLEAR ?auto_4135 ) ( TRUCK-AT ?auto_4144 ?auto_4147 ) ( not ( = ?auto_4134 ?auto_4135 ) ) ( not ( = ?auto_4134 ?auto_4152 ) ) ( not ( = ?auto_4135 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4136 ) ) ( not ( = ?auto_4134 ?auto_4153 ) ) ( not ( = ?auto_4136 ?auto_4152 ) ) ( not ( = ?auto_4150 ?auto_4156 ) ) ( not ( = ?auto_4151 ?auto_4157 ) ) ( not ( = ?auto_4153 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4137 ) ) ( not ( = ?auto_4134 ?auto_4154 ) ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( not ( = ?auto_4135 ?auto_4154 ) ) ( not ( = ?auto_4137 ?auto_4153 ) ) ( not ( = ?auto_4137 ?auto_4152 ) ) ( not ( = ?auto_4146 ?auto_4150 ) ) ( not ( = ?auto_4146 ?auto_4156 ) ) ( not ( = ?auto_4145 ?auto_4151 ) ) ( not ( = ?auto_4145 ?auto_4157 ) ) ( not ( = ?auto_4154 ?auto_4153 ) ) ( not ( = ?auto_4154 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4138 ) ) ( not ( = ?auto_4134 ?auto_4149 ) ) ( not ( = ?auto_4135 ?auto_4138 ) ) ( not ( = ?auto_4135 ?auto_4149 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4136 ?auto_4149 ) ) ( not ( = ?auto_4138 ?auto_4154 ) ) ( not ( = ?auto_4138 ?auto_4153 ) ) ( not ( = ?auto_4138 ?auto_4152 ) ) ( not ( = ?auto_4149 ?auto_4154 ) ) ( not ( = ?auto_4149 ?auto_4153 ) ) ( not ( = ?auto_4149 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4140 ) ) ( not ( = ?auto_4134 ?auto_4155 ) ) ( not ( = ?auto_4135 ?auto_4140 ) ) ( not ( = ?auto_4135 ?auto_4155 ) ) ( not ( = ?auto_4136 ?auto_4140 ) ) ( not ( = ?auto_4136 ?auto_4155 ) ) ( not ( = ?auto_4137 ?auto_4140 ) ) ( not ( = ?auto_4137 ?auto_4155 ) ) ( not ( = ?auto_4140 ?auto_4149 ) ) ( not ( = ?auto_4140 ?auto_4154 ) ) ( not ( = ?auto_4140 ?auto_4153 ) ) ( not ( = ?auto_4140 ?auto_4152 ) ) ( not ( = ?auto_4161 ?auto_4146 ) ) ( not ( = ?auto_4161 ?auto_4150 ) ) ( not ( = ?auto_4161 ?auto_4156 ) ) ( not ( = ?auto_4159 ?auto_4145 ) ) ( not ( = ?auto_4159 ?auto_4151 ) ) ( not ( = ?auto_4159 ?auto_4157 ) ) ( not ( = ?auto_4155 ?auto_4149 ) ) ( not ( = ?auto_4155 ?auto_4154 ) ) ( not ( = ?auto_4155 ?auto_4153 ) ) ( not ( = ?auto_4155 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4139 ) ) ( not ( = ?auto_4134 ?auto_4160 ) ) ( not ( = ?auto_4135 ?auto_4139 ) ) ( not ( = ?auto_4135 ?auto_4160 ) ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4136 ?auto_4160 ) ) ( not ( = ?auto_4137 ?auto_4139 ) ) ( not ( = ?auto_4137 ?auto_4160 ) ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4160 ) ) ( not ( = ?auto_4139 ?auto_4155 ) ) ( not ( = ?auto_4139 ?auto_4149 ) ) ( not ( = ?auto_4139 ?auto_4154 ) ) ( not ( = ?auto_4139 ?auto_4153 ) ) ( not ( = ?auto_4139 ?auto_4152 ) ) ( not ( = ?auto_4160 ?auto_4155 ) ) ( not ( = ?auto_4160 ?auto_4149 ) ) ( not ( = ?auto_4160 ?auto_4154 ) ) ( not ( = ?auto_4160 ?auto_4153 ) ) ( not ( = ?auto_4160 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4142 ) ) ( not ( = ?auto_4134 ?auto_4158 ) ) ( not ( = ?auto_4135 ?auto_4142 ) ) ( not ( = ?auto_4135 ?auto_4158 ) ) ( not ( = ?auto_4136 ?auto_4142 ) ) ( not ( = ?auto_4136 ?auto_4158 ) ) ( not ( = ?auto_4137 ?auto_4142 ) ) ( not ( = ?auto_4137 ?auto_4158 ) ) ( not ( = ?auto_4138 ?auto_4142 ) ) ( not ( = ?auto_4138 ?auto_4158 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4140 ?auto_4158 ) ) ( not ( = ?auto_4142 ?auto_4160 ) ) ( not ( = ?auto_4142 ?auto_4155 ) ) ( not ( = ?auto_4142 ?auto_4149 ) ) ( not ( = ?auto_4142 ?auto_4154 ) ) ( not ( = ?auto_4142 ?auto_4153 ) ) ( not ( = ?auto_4142 ?auto_4152 ) ) ( not ( = ?auto_4158 ?auto_4160 ) ) ( not ( = ?auto_4158 ?auto_4155 ) ) ( not ( = ?auto_4158 ?auto_4149 ) ) ( not ( = ?auto_4158 ?auto_4154 ) ) ( not ( = ?auto_4158 ?auto_4153 ) ) ( not ( = ?auto_4158 ?auto_4152 ) ) ( not ( = ?auto_4134 ?auto_4141 ) ) ( not ( = ?auto_4134 ?auto_4148 ) ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( not ( = ?auto_4135 ?auto_4148 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) ( not ( = ?auto_4136 ?auto_4148 ) ) ( not ( = ?auto_4137 ?auto_4141 ) ) ( not ( = ?auto_4137 ?auto_4148 ) ) ( not ( = ?auto_4138 ?auto_4141 ) ) ( not ( = ?auto_4138 ?auto_4148 ) ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4148 ) ) ( not ( = ?auto_4139 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4148 ) ) ( not ( = ?auto_4141 ?auto_4158 ) ) ( not ( = ?auto_4141 ?auto_4160 ) ) ( not ( = ?auto_4141 ?auto_4155 ) ) ( not ( = ?auto_4141 ?auto_4149 ) ) ( not ( = ?auto_4141 ?auto_4154 ) ) ( not ( = ?auto_4141 ?auto_4153 ) ) ( not ( = ?auto_4141 ?auto_4152 ) ) ( not ( = ?auto_4148 ?auto_4158 ) ) ( not ( = ?auto_4148 ?auto_4160 ) ) ( not ( = ?auto_4148 ?auto_4155 ) ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( not ( = ?auto_4148 ?auto_4154 ) ) ( not ( = ?auto_4148 ?auto_4153 ) ) ( not ( = ?auto_4148 ?auto_4152 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4134 ?auto_4135 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4140 ?auto_4139 ?auto_4142 )
      ( MAKE-1CRATE ?auto_4142 ?auto_4141 )
      ( MAKE-8CRATE-VERIFY ?auto_4134 ?auto_4135 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4140 ?auto_4139 ?auto_4142 ?auto_4141 ) )
  )

)

