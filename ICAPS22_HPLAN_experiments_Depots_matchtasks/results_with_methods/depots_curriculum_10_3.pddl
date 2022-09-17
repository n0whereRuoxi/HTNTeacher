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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7745 - SURFACE
      ?auto_7746 - SURFACE
    )
    :vars
    (
      ?auto_7747 - HOIST
      ?auto_7748 - PLACE
      ?auto_7750 - PLACE
      ?auto_7751 - HOIST
      ?auto_7752 - SURFACE
      ?auto_7749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7747 ?auto_7748 ) ( SURFACE-AT ?auto_7745 ?auto_7748 ) ( CLEAR ?auto_7745 ) ( IS-CRATE ?auto_7746 ) ( AVAILABLE ?auto_7747 ) ( not ( = ?auto_7750 ?auto_7748 ) ) ( HOIST-AT ?auto_7751 ?auto_7750 ) ( AVAILABLE ?auto_7751 ) ( SURFACE-AT ?auto_7746 ?auto_7750 ) ( ON ?auto_7746 ?auto_7752 ) ( CLEAR ?auto_7746 ) ( TRUCK-AT ?auto_7749 ?auto_7748 ) ( not ( = ?auto_7745 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7752 ) ) ( not ( = ?auto_7746 ?auto_7752 ) ) ( not ( = ?auto_7747 ?auto_7751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7749 ?auto_7748 ?auto_7750 )
      ( !LIFT ?auto_7751 ?auto_7746 ?auto_7752 ?auto_7750 )
      ( !LOAD ?auto_7751 ?auto_7746 ?auto_7749 ?auto_7750 )
      ( !DRIVE ?auto_7749 ?auto_7750 ?auto_7748 )
      ( !UNLOAD ?auto_7747 ?auto_7746 ?auto_7749 ?auto_7748 )
      ( !DROP ?auto_7747 ?auto_7746 ?auto_7745 ?auto_7748 )
      ( MAKE-1CRATE-VERIFY ?auto_7745 ?auto_7746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7755 - SURFACE
      ?auto_7756 - SURFACE
    )
    :vars
    (
      ?auto_7757 - HOIST
      ?auto_7758 - PLACE
      ?auto_7760 - PLACE
      ?auto_7761 - HOIST
      ?auto_7762 - SURFACE
      ?auto_7759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7757 ?auto_7758 ) ( SURFACE-AT ?auto_7755 ?auto_7758 ) ( CLEAR ?auto_7755 ) ( IS-CRATE ?auto_7756 ) ( AVAILABLE ?auto_7757 ) ( not ( = ?auto_7760 ?auto_7758 ) ) ( HOIST-AT ?auto_7761 ?auto_7760 ) ( AVAILABLE ?auto_7761 ) ( SURFACE-AT ?auto_7756 ?auto_7760 ) ( ON ?auto_7756 ?auto_7762 ) ( CLEAR ?auto_7756 ) ( TRUCK-AT ?auto_7759 ?auto_7758 ) ( not ( = ?auto_7755 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7762 ) ) ( not ( = ?auto_7756 ?auto_7762 ) ) ( not ( = ?auto_7757 ?auto_7761 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7759 ?auto_7758 ?auto_7760 )
      ( !LIFT ?auto_7761 ?auto_7756 ?auto_7762 ?auto_7760 )
      ( !LOAD ?auto_7761 ?auto_7756 ?auto_7759 ?auto_7760 )
      ( !DRIVE ?auto_7759 ?auto_7760 ?auto_7758 )
      ( !UNLOAD ?auto_7757 ?auto_7756 ?auto_7759 ?auto_7758 )
      ( !DROP ?auto_7757 ?auto_7756 ?auto_7755 ?auto_7758 )
      ( MAKE-1CRATE-VERIFY ?auto_7755 ?auto_7756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7766 - SURFACE
      ?auto_7767 - SURFACE
      ?auto_7768 - SURFACE
    )
    :vars
    (
      ?auto_7773 - HOIST
      ?auto_7769 - PLACE
      ?auto_7774 - PLACE
      ?auto_7771 - HOIST
      ?auto_7772 - SURFACE
      ?auto_7777 - PLACE
      ?auto_7775 - HOIST
      ?auto_7776 - SURFACE
      ?auto_7770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7773 ?auto_7769 ) ( IS-CRATE ?auto_7768 ) ( not ( = ?auto_7774 ?auto_7769 ) ) ( HOIST-AT ?auto_7771 ?auto_7774 ) ( AVAILABLE ?auto_7771 ) ( SURFACE-AT ?auto_7768 ?auto_7774 ) ( ON ?auto_7768 ?auto_7772 ) ( CLEAR ?auto_7768 ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7772 ) ) ( not ( = ?auto_7768 ?auto_7772 ) ) ( not ( = ?auto_7773 ?auto_7771 ) ) ( SURFACE-AT ?auto_7766 ?auto_7769 ) ( CLEAR ?auto_7766 ) ( IS-CRATE ?auto_7767 ) ( AVAILABLE ?auto_7773 ) ( not ( = ?auto_7777 ?auto_7769 ) ) ( HOIST-AT ?auto_7775 ?auto_7777 ) ( AVAILABLE ?auto_7775 ) ( SURFACE-AT ?auto_7767 ?auto_7777 ) ( ON ?auto_7767 ?auto_7776 ) ( CLEAR ?auto_7767 ) ( TRUCK-AT ?auto_7770 ?auto_7769 ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( not ( = ?auto_7766 ?auto_7776 ) ) ( not ( = ?auto_7767 ?auto_7776 ) ) ( not ( = ?auto_7773 ?auto_7775 ) ) ( not ( = ?auto_7766 ?auto_7768 ) ) ( not ( = ?auto_7766 ?auto_7772 ) ) ( not ( = ?auto_7768 ?auto_7776 ) ) ( not ( = ?auto_7774 ?auto_7777 ) ) ( not ( = ?auto_7771 ?auto_7775 ) ) ( not ( = ?auto_7772 ?auto_7776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7766 ?auto_7767 )
      ( MAKE-1CRATE ?auto_7767 ?auto_7768 )
      ( MAKE-2CRATE-VERIFY ?auto_7766 ?auto_7767 ?auto_7768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7780 - SURFACE
      ?auto_7781 - SURFACE
    )
    :vars
    (
      ?auto_7782 - HOIST
      ?auto_7783 - PLACE
      ?auto_7785 - PLACE
      ?auto_7786 - HOIST
      ?auto_7787 - SURFACE
      ?auto_7784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7782 ?auto_7783 ) ( SURFACE-AT ?auto_7780 ?auto_7783 ) ( CLEAR ?auto_7780 ) ( IS-CRATE ?auto_7781 ) ( AVAILABLE ?auto_7782 ) ( not ( = ?auto_7785 ?auto_7783 ) ) ( HOIST-AT ?auto_7786 ?auto_7785 ) ( AVAILABLE ?auto_7786 ) ( SURFACE-AT ?auto_7781 ?auto_7785 ) ( ON ?auto_7781 ?auto_7787 ) ( CLEAR ?auto_7781 ) ( TRUCK-AT ?auto_7784 ?auto_7783 ) ( not ( = ?auto_7780 ?auto_7781 ) ) ( not ( = ?auto_7780 ?auto_7787 ) ) ( not ( = ?auto_7781 ?auto_7787 ) ) ( not ( = ?auto_7782 ?auto_7786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7784 ?auto_7783 ?auto_7785 )
      ( !LIFT ?auto_7786 ?auto_7781 ?auto_7787 ?auto_7785 )
      ( !LOAD ?auto_7786 ?auto_7781 ?auto_7784 ?auto_7785 )
      ( !DRIVE ?auto_7784 ?auto_7785 ?auto_7783 )
      ( !UNLOAD ?auto_7782 ?auto_7781 ?auto_7784 ?auto_7783 )
      ( !DROP ?auto_7782 ?auto_7781 ?auto_7780 ?auto_7783 )
      ( MAKE-1CRATE-VERIFY ?auto_7780 ?auto_7781 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7792 - SURFACE
      ?auto_7793 - SURFACE
      ?auto_7794 - SURFACE
      ?auto_7795 - SURFACE
    )
    :vars
    (
      ?auto_7801 - HOIST
      ?auto_7800 - PLACE
      ?auto_7797 - PLACE
      ?auto_7798 - HOIST
      ?auto_7796 - SURFACE
      ?auto_7807 - PLACE
      ?auto_7806 - HOIST
      ?auto_7803 - SURFACE
      ?auto_7805 - PLACE
      ?auto_7802 - HOIST
      ?auto_7804 - SURFACE
      ?auto_7799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7801 ?auto_7800 ) ( IS-CRATE ?auto_7795 ) ( not ( = ?auto_7797 ?auto_7800 ) ) ( HOIST-AT ?auto_7798 ?auto_7797 ) ( AVAILABLE ?auto_7798 ) ( SURFACE-AT ?auto_7795 ?auto_7797 ) ( ON ?auto_7795 ?auto_7796 ) ( CLEAR ?auto_7795 ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7801 ?auto_7798 ) ) ( IS-CRATE ?auto_7794 ) ( not ( = ?auto_7807 ?auto_7800 ) ) ( HOIST-AT ?auto_7806 ?auto_7807 ) ( AVAILABLE ?auto_7806 ) ( SURFACE-AT ?auto_7794 ?auto_7807 ) ( ON ?auto_7794 ?auto_7803 ) ( CLEAR ?auto_7794 ) ( not ( = ?auto_7793 ?auto_7794 ) ) ( not ( = ?auto_7793 ?auto_7803 ) ) ( not ( = ?auto_7794 ?auto_7803 ) ) ( not ( = ?auto_7801 ?auto_7806 ) ) ( SURFACE-AT ?auto_7792 ?auto_7800 ) ( CLEAR ?auto_7792 ) ( IS-CRATE ?auto_7793 ) ( AVAILABLE ?auto_7801 ) ( not ( = ?auto_7805 ?auto_7800 ) ) ( HOIST-AT ?auto_7802 ?auto_7805 ) ( AVAILABLE ?auto_7802 ) ( SURFACE-AT ?auto_7793 ?auto_7805 ) ( ON ?auto_7793 ?auto_7804 ) ( CLEAR ?auto_7793 ) ( TRUCK-AT ?auto_7799 ?auto_7800 ) ( not ( = ?auto_7792 ?auto_7793 ) ) ( not ( = ?auto_7792 ?auto_7804 ) ) ( not ( = ?auto_7793 ?auto_7804 ) ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( not ( = ?auto_7792 ?auto_7794 ) ) ( not ( = ?auto_7792 ?auto_7803 ) ) ( not ( = ?auto_7794 ?auto_7804 ) ) ( not ( = ?auto_7807 ?auto_7805 ) ) ( not ( = ?auto_7806 ?auto_7802 ) ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( not ( = ?auto_7792 ?auto_7795 ) ) ( not ( = ?auto_7792 ?auto_7796 ) ) ( not ( = ?auto_7793 ?auto_7795 ) ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7803 ) ) ( not ( = ?auto_7795 ?auto_7804 ) ) ( not ( = ?auto_7797 ?auto_7807 ) ) ( not ( = ?auto_7797 ?auto_7805 ) ) ( not ( = ?auto_7798 ?auto_7806 ) ) ( not ( = ?auto_7798 ?auto_7802 ) ) ( not ( = ?auto_7796 ?auto_7803 ) ) ( not ( = ?auto_7796 ?auto_7804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7792 ?auto_7793 ?auto_7794 )
      ( MAKE-1CRATE ?auto_7794 ?auto_7795 )
      ( MAKE-3CRATE-VERIFY ?auto_7792 ?auto_7793 ?auto_7794 ?auto_7795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7810 - SURFACE
      ?auto_7811 - SURFACE
    )
    :vars
    (
      ?auto_7812 - HOIST
      ?auto_7813 - PLACE
      ?auto_7815 - PLACE
      ?auto_7816 - HOIST
      ?auto_7817 - SURFACE
      ?auto_7814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7812 ?auto_7813 ) ( SURFACE-AT ?auto_7810 ?auto_7813 ) ( CLEAR ?auto_7810 ) ( IS-CRATE ?auto_7811 ) ( AVAILABLE ?auto_7812 ) ( not ( = ?auto_7815 ?auto_7813 ) ) ( HOIST-AT ?auto_7816 ?auto_7815 ) ( AVAILABLE ?auto_7816 ) ( SURFACE-AT ?auto_7811 ?auto_7815 ) ( ON ?auto_7811 ?auto_7817 ) ( CLEAR ?auto_7811 ) ( TRUCK-AT ?auto_7814 ?auto_7813 ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7817 ) ) ( not ( = ?auto_7811 ?auto_7817 ) ) ( not ( = ?auto_7812 ?auto_7816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7814 ?auto_7813 ?auto_7815 )
      ( !LIFT ?auto_7816 ?auto_7811 ?auto_7817 ?auto_7815 )
      ( !LOAD ?auto_7816 ?auto_7811 ?auto_7814 ?auto_7815 )
      ( !DRIVE ?auto_7814 ?auto_7815 ?auto_7813 )
      ( !UNLOAD ?auto_7812 ?auto_7811 ?auto_7814 ?auto_7813 )
      ( !DROP ?auto_7812 ?auto_7811 ?auto_7810 ?auto_7813 )
      ( MAKE-1CRATE-VERIFY ?auto_7810 ?auto_7811 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7823 - SURFACE
      ?auto_7824 - SURFACE
      ?auto_7825 - SURFACE
      ?auto_7826 - SURFACE
      ?auto_7827 - SURFACE
    )
    :vars
    (
      ?auto_7831 - HOIST
      ?auto_7830 - PLACE
      ?auto_7828 - PLACE
      ?auto_7832 - HOIST
      ?auto_7829 - SURFACE
      ?auto_7835 - PLACE
      ?auto_7834 - HOIST
      ?auto_7839 - SURFACE
      ?auto_7838 - SURFACE
      ?auto_7837 - PLACE
      ?auto_7836 - HOIST
      ?auto_7840 - SURFACE
      ?auto_7833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7831 ?auto_7830 ) ( IS-CRATE ?auto_7827 ) ( not ( = ?auto_7828 ?auto_7830 ) ) ( HOIST-AT ?auto_7832 ?auto_7828 ) ( SURFACE-AT ?auto_7827 ?auto_7828 ) ( ON ?auto_7827 ?auto_7829 ) ( CLEAR ?auto_7827 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7829 ) ) ( not ( = ?auto_7827 ?auto_7829 ) ) ( not ( = ?auto_7831 ?auto_7832 ) ) ( IS-CRATE ?auto_7826 ) ( not ( = ?auto_7835 ?auto_7830 ) ) ( HOIST-AT ?auto_7834 ?auto_7835 ) ( AVAILABLE ?auto_7834 ) ( SURFACE-AT ?auto_7826 ?auto_7835 ) ( ON ?auto_7826 ?auto_7839 ) ( CLEAR ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( not ( = ?auto_7825 ?auto_7839 ) ) ( not ( = ?auto_7826 ?auto_7839 ) ) ( not ( = ?auto_7831 ?auto_7834 ) ) ( IS-CRATE ?auto_7825 ) ( AVAILABLE ?auto_7832 ) ( SURFACE-AT ?auto_7825 ?auto_7828 ) ( ON ?auto_7825 ?auto_7838 ) ( CLEAR ?auto_7825 ) ( not ( = ?auto_7824 ?auto_7825 ) ) ( not ( = ?auto_7824 ?auto_7838 ) ) ( not ( = ?auto_7825 ?auto_7838 ) ) ( SURFACE-AT ?auto_7823 ?auto_7830 ) ( CLEAR ?auto_7823 ) ( IS-CRATE ?auto_7824 ) ( AVAILABLE ?auto_7831 ) ( not ( = ?auto_7837 ?auto_7830 ) ) ( HOIST-AT ?auto_7836 ?auto_7837 ) ( AVAILABLE ?auto_7836 ) ( SURFACE-AT ?auto_7824 ?auto_7837 ) ( ON ?auto_7824 ?auto_7840 ) ( CLEAR ?auto_7824 ) ( TRUCK-AT ?auto_7833 ?auto_7830 ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7840 ) ) ( not ( = ?auto_7824 ?auto_7840 ) ) ( not ( = ?auto_7831 ?auto_7836 ) ) ( not ( = ?auto_7823 ?auto_7825 ) ) ( not ( = ?auto_7823 ?auto_7838 ) ) ( not ( = ?auto_7825 ?auto_7840 ) ) ( not ( = ?auto_7828 ?auto_7837 ) ) ( not ( = ?auto_7832 ?auto_7836 ) ) ( not ( = ?auto_7838 ?auto_7840 ) ) ( not ( = ?auto_7823 ?auto_7826 ) ) ( not ( = ?auto_7823 ?auto_7839 ) ) ( not ( = ?auto_7824 ?auto_7826 ) ) ( not ( = ?auto_7824 ?auto_7839 ) ) ( not ( = ?auto_7826 ?auto_7838 ) ) ( not ( = ?auto_7826 ?auto_7840 ) ) ( not ( = ?auto_7835 ?auto_7828 ) ) ( not ( = ?auto_7835 ?auto_7837 ) ) ( not ( = ?auto_7834 ?auto_7832 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7839 ?auto_7838 ) ) ( not ( = ?auto_7839 ?auto_7840 ) ) ( not ( = ?auto_7823 ?auto_7827 ) ) ( not ( = ?auto_7823 ?auto_7829 ) ) ( not ( = ?auto_7824 ?auto_7827 ) ) ( not ( = ?auto_7824 ?auto_7829 ) ) ( not ( = ?auto_7825 ?auto_7827 ) ) ( not ( = ?auto_7825 ?auto_7829 ) ) ( not ( = ?auto_7827 ?auto_7839 ) ) ( not ( = ?auto_7827 ?auto_7838 ) ) ( not ( = ?auto_7827 ?auto_7840 ) ) ( not ( = ?auto_7829 ?auto_7839 ) ) ( not ( = ?auto_7829 ?auto_7838 ) ) ( not ( = ?auto_7829 ?auto_7840 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7823 ?auto_7824 ?auto_7825 ?auto_7826 )
      ( MAKE-1CRATE ?auto_7826 ?auto_7827 )
      ( MAKE-4CRATE-VERIFY ?auto_7823 ?auto_7824 ?auto_7825 ?auto_7826 ?auto_7827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7843 - SURFACE
      ?auto_7844 - SURFACE
    )
    :vars
    (
      ?auto_7845 - HOIST
      ?auto_7846 - PLACE
      ?auto_7848 - PLACE
      ?auto_7849 - HOIST
      ?auto_7850 - SURFACE
      ?auto_7847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7845 ?auto_7846 ) ( SURFACE-AT ?auto_7843 ?auto_7846 ) ( CLEAR ?auto_7843 ) ( IS-CRATE ?auto_7844 ) ( AVAILABLE ?auto_7845 ) ( not ( = ?auto_7848 ?auto_7846 ) ) ( HOIST-AT ?auto_7849 ?auto_7848 ) ( AVAILABLE ?auto_7849 ) ( SURFACE-AT ?auto_7844 ?auto_7848 ) ( ON ?auto_7844 ?auto_7850 ) ( CLEAR ?auto_7844 ) ( TRUCK-AT ?auto_7847 ?auto_7846 ) ( not ( = ?auto_7843 ?auto_7844 ) ) ( not ( = ?auto_7843 ?auto_7850 ) ) ( not ( = ?auto_7844 ?auto_7850 ) ) ( not ( = ?auto_7845 ?auto_7849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7847 ?auto_7846 ?auto_7848 )
      ( !LIFT ?auto_7849 ?auto_7844 ?auto_7850 ?auto_7848 )
      ( !LOAD ?auto_7849 ?auto_7844 ?auto_7847 ?auto_7848 )
      ( !DRIVE ?auto_7847 ?auto_7848 ?auto_7846 )
      ( !UNLOAD ?auto_7845 ?auto_7844 ?auto_7847 ?auto_7846 )
      ( !DROP ?auto_7845 ?auto_7844 ?auto_7843 ?auto_7846 )
      ( MAKE-1CRATE-VERIFY ?auto_7843 ?auto_7844 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7857 - SURFACE
      ?auto_7858 - SURFACE
      ?auto_7859 - SURFACE
      ?auto_7860 - SURFACE
      ?auto_7861 - SURFACE
      ?auto_7862 - SURFACE
    )
    :vars
    (
      ?auto_7866 - HOIST
      ?auto_7867 - PLACE
      ?auto_7865 - PLACE
      ?auto_7864 - HOIST
      ?auto_7868 - SURFACE
      ?auto_7870 - PLACE
      ?auto_7874 - HOIST
      ?auto_7872 - SURFACE
      ?auto_7876 - PLACE
      ?auto_7875 - HOIST
      ?auto_7869 - SURFACE
      ?auto_7871 - SURFACE
      ?auto_7873 - SURFACE
      ?auto_7863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7866 ?auto_7867 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( HOIST-AT ?auto_7864 ?auto_7865 ) ( SURFACE-AT ?auto_7862 ?auto_7865 ) ( ON ?auto_7862 ?auto_7868 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7868 ) ) ( not ( = ?auto_7862 ?auto_7868 ) ) ( not ( = ?auto_7866 ?auto_7864 ) ) ( IS-CRATE ?auto_7861 ) ( not ( = ?auto_7870 ?auto_7867 ) ) ( HOIST-AT ?auto_7874 ?auto_7870 ) ( SURFACE-AT ?auto_7861 ?auto_7870 ) ( ON ?auto_7861 ?auto_7872 ) ( CLEAR ?auto_7861 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7872 ) ) ( not ( = ?auto_7861 ?auto_7872 ) ) ( not ( = ?auto_7866 ?auto_7874 ) ) ( IS-CRATE ?auto_7860 ) ( not ( = ?auto_7876 ?auto_7867 ) ) ( HOIST-AT ?auto_7875 ?auto_7876 ) ( AVAILABLE ?auto_7875 ) ( SURFACE-AT ?auto_7860 ?auto_7876 ) ( ON ?auto_7860 ?auto_7869 ) ( CLEAR ?auto_7860 ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( not ( = ?auto_7859 ?auto_7869 ) ) ( not ( = ?auto_7860 ?auto_7869 ) ) ( not ( = ?auto_7866 ?auto_7875 ) ) ( IS-CRATE ?auto_7859 ) ( AVAILABLE ?auto_7874 ) ( SURFACE-AT ?auto_7859 ?auto_7870 ) ( ON ?auto_7859 ?auto_7871 ) ( CLEAR ?auto_7859 ) ( not ( = ?auto_7858 ?auto_7859 ) ) ( not ( = ?auto_7858 ?auto_7871 ) ) ( not ( = ?auto_7859 ?auto_7871 ) ) ( SURFACE-AT ?auto_7857 ?auto_7867 ) ( CLEAR ?auto_7857 ) ( IS-CRATE ?auto_7858 ) ( AVAILABLE ?auto_7866 ) ( AVAILABLE ?auto_7864 ) ( SURFACE-AT ?auto_7858 ?auto_7865 ) ( ON ?auto_7858 ?auto_7873 ) ( CLEAR ?auto_7858 ) ( TRUCK-AT ?auto_7863 ?auto_7867 ) ( not ( = ?auto_7857 ?auto_7858 ) ) ( not ( = ?auto_7857 ?auto_7873 ) ) ( not ( = ?auto_7858 ?auto_7873 ) ) ( not ( = ?auto_7857 ?auto_7859 ) ) ( not ( = ?auto_7857 ?auto_7871 ) ) ( not ( = ?auto_7859 ?auto_7873 ) ) ( not ( = ?auto_7870 ?auto_7865 ) ) ( not ( = ?auto_7874 ?auto_7864 ) ) ( not ( = ?auto_7871 ?auto_7873 ) ) ( not ( = ?auto_7857 ?auto_7860 ) ) ( not ( = ?auto_7857 ?auto_7869 ) ) ( not ( = ?auto_7858 ?auto_7860 ) ) ( not ( = ?auto_7858 ?auto_7869 ) ) ( not ( = ?auto_7860 ?auto_7871 ) ) ( not ( = ?auto_7860 ?auto_7873 ) ) ( not ( = ?auto_7876 ?auto_7870 ) ) ( not ( = ?auto_7876 ?auto_7865 ) ) ( not ( = ?auto_7875 ?auto_7874 ) ) ( not ( = ?auto_7875 ?auto_7864 ) ) ( not ( = ?auto_7869 ?auto_7871 ) ) ( not ( = ?auto_7869 ?auto_7873 ) ) ( not ( = ?auto_7857 ?auto_7861 ) ) ( not ( = ?auto_7857 ?auto_7872 ) ) ( not ( = ?auto_7858 ?auto_7861 ) ) ( not ( = ?auto_7858 ?auto_7872 ) ) ( not ( = ?auto_7859 ?auto_7861 ) ) ( not ( = ?auto_7859 ?auto_7872 ) ) ( not ( = ?auto_7861 ?auto_7869 ) ) ( not ( = ?auto_7861 ?auto_7871 ) ) ( not ( = ?auto_7861 ?auto_7873 ) ) ( not ( = ?auto_7872 ?auto_7869 ) ) ( not ( = ?auto_7872 ?auto_7871 ) ) ( not ( = ?auto_7872 ?auto_7873 ) ) ( not ( = ?auto_7857 ?auto_7862 ) ) ( not ( = ?auto_7857 ?auto_7868 ) ) ( not ( = ?auto_7858 ?auto_7862 ) ) ( not ( = ?auto_7858 ?auto_7868 ) ) ( not ( = ?auto_7859 ?auto_7862 ) ) ( not ( = ?auto_7859 ?auto_7868 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7868 ) ) ( not ( = ?auto_7862 ?auto_7872 ) ) ( not ( = ?auto_7862 ?auto_7869 ) ) ( not ( = ?auto_7862 ?auto_7871 ) ) ( not ( = ?auto_7862 ?auto_7873 ) ) ( not ( = ?auto_7868 ?auto_7872 ) ) ( not ( = ?auto_7868 ?auto_7869 ) ) ( not ( = ?auto_7868 ?auto_7871 ) ) ( not ( = ?auto_7868 ?auto_7873 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7857 ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7861 )
      ( MAKE-1CRATE ?auto_7861 ?auto_7862 )
      ( MAKE-5CRATE-VERIFY ?auto_7857 ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7879 - SURFACE
      ?auto_7880 - SURFACE
    )
    :vars
    (
      ?auto_7881 - HOIST
      ?auto_7882 - PLACE
      ?auto_7884 - PLACE
      ?auto_7885 - HOIST
      ?auto_7886 - SURFACE
      ?auto_7883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7881 ?auto_7882 ) ( SURFACE-AT ?auto_7879 ?auto_7882 ) ( CLEAR ?auto_7879 ) ( IS-CRATE ?auto_7880 ) ( AVAILABLE ?auto_7881 ) ( not ( = ?auto_7884 ?auto_7882 ) ) ( HOIST-AT ?auto_7885 ?auto_7884 ) ( AVAILABLE ?auto_7885 ) ( SURFACE-AT ?auto_7880 ?auto_7884 ) ( ON ?auto_7880 ?auto_7886 ) ( CLEAR ?auto_7880 ) ( TRUCK-AT ?auto_7883 ?auto_7882 ) ( not ( = ?auto_7879 ?auto_7880 ) ) ( not ( = ?auto_7879 ?auto_7886 ) ) ( not ( = ?auto_7880 ?auto_7886 ) ) ( not ( = ?auto_7881 ?auto_7885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7883 ?auto_7882 ?auto_7884 )
      ( !LIFT ?auto_7885 ?auto_7880 ?auto_7886 ?auto_7884 )
      ( !LOAD ?auto_7885 ?auto_7880 ?auto_7883 ?auto_7884 )
      ( !DRIVE ?auto_7883 ?auto_7884 ?auto_7882 )
      ( !UNLOAD ?auto_7881 ?auto_7880 ?auto_7883 ?auto_7882 )
      ( !DROP ?auto_7881 ?auto_7880 ?auto_7879 ?auto_7882 )
      ( MAKE-1CRATE-VERIFY ?auto_7879 ?auto_7880 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7894 - SURFACE
      ?auto_7895 - SURFACE
      ?auto_7896 - SURFACE
      ?auto_7897 - SURFACE
      ?auto_7898 - SURFACE
      ?auto_7900 - SURFACE
      ?auto_7899 - SURFACE
    )
    :vars
    (
      ?auto_7903 - HOIST
      ?auto_7902 - PLACE
      ?auto_7904 - PLACE
      ?auto_7906 - HOIST
      ?auto_7901 - SURFACE
      ?auto_7911 - PLACE
      ?auto_7907 - HOIST
      ?auto_7912 - SURFACE
      ?auto_7909 - PLACE
      ?auto_7917 - HOIST
      ?auto_7916 - SURFACE
      ?auto_7913 - PLACE
      ?auto_7914 - HOIST
      ?auto_7908 - SURFACE
      ?auto_7915 - SURFACE
      ?auto_7910 - SURFACE
      ?auto_7905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7903 ?auto_7902 ) ( IS-CRATE ?auto_7899 ) ( not ( = ?auto_7904 ?auto_7902 ) ) ( HOIST-AT ?auto_7906 ?auto_7904 ) ( AVAILABLE ?auto_7906 ) ( SURFACE-AT ?auto_7899 ?auto_7904 ) ( ON ?auto_7899 ?auto_7901 ) ( CLEAR ?auto_7899 ) ( not ( = ?auto_7900 ?auto_7899 ) ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( not ( = ?auto_7903 ?auto_7906 ) ) ( IS-CRATE ?auto_7900 ) ( not ( = ?auto_7911 ?auto_7902 ) ) ( HOIST-AT ?auto_7907 ?auto_7911 ) ( SURFACE-AT ?auto_7900 ?auto_7911 ) ( ON ?auto_7900 ?auto_7912 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7898 ?auto_7900 ) ) ( not ( = ?auto_7898 ?auto_7912 ) ) ( not ( = ?auto_7900 ?auto_7912 ) ) ( not ( = ?auto_7903 ?auto_7907 ) ) ( IS-CRATE ?auto_7898 ) ( not ( = ?auto_7909 ?auto_7902 ) ) ( HOIST-AT ?auto_7917 ?auto_7909 ) ( SURFACE-AT ?auto_7898 ?auto_7909 ) ( ON ?auto_7898 ?auto_7916 ) ( CLEAR ?auto_7898 ) ( not ( = ?auto_7897 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7916 ) ) ( not ( = ?auto_7898 ?auto_7916 ) ) ( not ( = ?auto_7903 ?auto_7917 ) ) ( IS-CRATE ?auto_7897 ) ( not ( = ?auto_7913 ?auto_7902 ) ) ( HOIST-AT ?auto_7914 ?auto_7913 ) ( AVAILABLE ?auto_7914 ) ( SURFACE-AT ?auto_7897 ?auto_7913 ) ( ON ?auto_7897 ?auto_7908 ) ( CLEAR ?auto_7897 ) ( not ( = ?auto_7896 ?auto_7897 ) ) ( not ( = ?auto_7896 ?auto_7908 ) ) ( not ( = ?auto_7897 ?auto_7908 ) ) ( not ( = ?auto_7903 ?auto_7914 ) ) ( IS-CRATE ?auto_7896 ) ( AVAILABLE ?auto_7917 ) ( SURFACE-AT ?auto_7896 ?auto_7909 ) ( ON ?auto_7896 ?auto_7915 ) ( CLEAR ?auto_7896 ) ( not ( = ?auto_7895 ?auto_7896 ) ) ( not ( = ?auto_7895 ?auto_7915 ) ) ( not ( = ?auto_7896 ?auto_7915 ) ) ( SURFACE-AT ?auto_7894 ?auto_7902 ) ( CLEAR ?auto_7894 ) ( IS-CRATE ?auto_7895 ) ( AVAILABLE ?auto_7903 ) ( AVAILABLE ?auto_7907 ) ( SURFACE-AT ?auto_7895 ?auto_7911 ) ( ON ?auto_7895 ?auto_7910 ) ( CLEAR ?auto_7895 ) ( TRUCK-AT ?auto_7905 ?auto_7902 ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7910 ) ) ( not ( = ?auto_7895 ?auto_7910 ) ) ( not ( = ?auto_7894 ?auto_7896 ) ) ( not ( = ?auto_7894 ?auto_7915 ) ) ( not ( = ?auto_7896 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7917 ?auto_7907 ) ) ( not ( = ?auto_7915 ?auto_7910 ) ) ( not ( = ?auto_7894 ?auto_7897 ) ) ( not ( = ?auto_7894 ?auto_7908 ) ) ( not ( = ?auto_7895 ?auto_7897 ) ) ( not ( = ?auto_7895 ?auto_7908 ) ) ( not ( = ?auto_7897 ?auto_7915 ) ) ( not ( = ?auto_7897 ?auto_7910 ) ) ( not ( = ?auto_7913 ?auto_7909 ) ) ( not ( = ?auto_7913 ?auto_7911 ) ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( not ( = ?auto_7914 ?auto_7907 ) ) ( not ( = ?auto_7908 ?auto_7915 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7894 ?auto_7898 ) ) ( not ( = ?auto_7894 ?auto_7916 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) ( not ( = ?auto_7895 ?auto_7916 ) ) ( not ( = ?auto_7896 ?auto_7898 ) ) ( not ( = ?auto_7896 ?auto_7916 ) ) ( not ( = ?auto_7898 ?auto_7908 ) ) ( not ( = ?auto_7898 ?auto_7915 ) ) ( not ( = ?auto_7898 ?auto_7910 ) ) ( not ( = ?auto_7916 ?auto_7908 ) ) ( not ( = ?auto_7916 ?auto_7915 ) ) ( not ( = ?auto_7916 ?auto_7910 ) ) ( not ( = ?auto_7894 ?auto_7900 ) ) ( not ( = ?auto_7894 ?auto_7912 ) ) ( not ( = ?auto_7895 ?auto_7900 ) ) ( not ( = ?auto_7895 ?auto_7912 ) ) ( not ( = ?auto_7896 ?auto_7900 ) ) ( not ( = ?auto_7896 ?auto_7912 ) ) ( not ( = ?auto_7897 ?auto_7900 ) ) ( not ( = ?auto_7897 ?auto_7912 ) ) ( not ( = ?auto_7900 ?auto_7916 ) ) ( not ( = ?auto_7900 ?auto_7908 ) ) ( not ( = ?auto_7900 ?auto_7915 ) ) ( not ( = ?auto_7900 ?auto_7910 ) ) ( not ( = ?auto_7912 ?auto_7916 ) ) ( not ( = ?auto_7912 ?auto_7908 ) ) ( not ( = ?auto_7912 ?auto_7915 ) ) ( not ( = ?auto_7912 ?auto_7910 ) ) ( not ( = ?auto_7894 ?auto_7899 ) ) ( not ( = ?auto_7894 ?auto_7901 ) ) ( not ( = ?auto_7895 ?auto_7899 ) ) ( not ( = ?auto_7895 ?auto_7901 ) ) ( not ( = ?auto_7896 ?auto_7899 ) ) ( not ( = ?auto_7896 ?auto_7901 ) ) ( not ( = ?auto_7897 ?auto_7899 ) ) ( not ( = ?auto_7897 ?auto_7901 ) ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( not ( = ?auto_7899 ?auto_7912 ) ) ( not ( = ?auto_7899 ?auto_7916 ) ) ( not ( = ?auto_7899 ?auto_7908 ) ) ( not ( = ?auto_7899 ?auto_7915 ) ) ( not ( = ?auto_7899 ?auto_7910 ) ) ( not ( = ?auto_7904 ?auto_7911 ) ) ( not ( = ?auto_7904 ?auto_7909 ) ) ( not ( = ?auto_7904 ?auto_7913 ) ) ( not ( = ?auto_7906 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7917 ) ) ( not ( = ?auto_7906 ?auto_7914 ) ) ( not ( = ?auto_7901 ?auto_7912 ) ) ( not ( = ?auto_7901 ?auto_7916 ) ) ( not ( = ?auto_7901 ?auto_7908 ) ) ( not ( = ?auto_7901 ?auto_7915 ) ) ( not ( = ?auto_7901 ?auto_7910 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7894 ?auto_7895 ?auto_7896 ?auto_7897 ?auto_7898 ?auto_7900 )
      ( MAKE-1CRATE ?auto_7900 ?auto_7899 )
      ( MAKE-6CRATE-VERIFY ?auto_7894 ?auto_7895 ?auto_7896 ?auto_7897 ?auto_7898 ?auto_7900 ?auto_7899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7920 - SURFACE
      ?auto_7921 - SURFACE
    )
    :vars
    (
      ?auto_7922 - HOIST
      ?auto_7923 - PLACE
      ?auto_7925 - PLACE
      ?auto_7926 - HOIST
      ?auto_7927 - SURFACE
      ?auto_7924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7922 ?auto_7923 ) ( SURFACE-AT ?auto_7920 ?auto_7923 ) ( CLEAR ?auto_7920 ) ( IS-CRATE ?auto_7921 ) ( AVAILABLE ?auto_7922 ) ( not ( = ?auto_7925 ?auto_7923 ) ) ( HOIST-AT ?auto_7926 ?auto_7925 ) ( AVAILABLE ?auto_7926 ) ( SURFACE-AT ?auto_7921 ?auto_7925 ) ( ON ?auto_7921 ?auto_7927 ) ( CLEAR ?auto_7921 ) ( TRUCK-AT ?auto_7924 ?auto_7923 ) ( not ( = ?auto_7920 ?auto_7921 ) ) ( not ( = ?auto_7920 ?auto_7927 ) ) ( not ( = ?auto_7921 ?auto_7927 ) ) ( not ( = ?auto_7922 ?auto_7926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7924 ?auto_7923 ?auto_7925 )
      ( !LIFT ?auto_7926 ?auto_7921 ?auto_7927 ?auto_7925 )
      ( !LOAD ?auto_7926 ?auto_7921 ?auto_7924 ?auto_7925 )
      ( !DRIVE ?auto_7924 ?auto_7925 ?auto_7923 )
      ( !UNLOAD ?auto_7922 ?auto_7921 ?auto_7924 ?auto_7923 )
      ( !DROP ?auto_7922 ?auto_7921 ?auto_7920 ?auto_7923 )
      ( MAKE-1CRATE-VERIFY ?auto_7920 ?auto_7921 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7936 - SURFACE
      ?auto_7937 - SURFACE
      ?auto_7938 - SURFACE
      ?auto_7939 - SURFACE
      ?auto_7940 - SURFACE
      ?auto_7942 - SURFACE
      ?auto_7941 - SURFACE
      ?auto_7943 - SURFACE
    )
    :vars
    (
      ?auto_7948 - HOIST
      ?auto_7944 - PLACE
      ?auto_7946 - PLACE
      ?auto_7947 - HOIST
      ?auto_7945 - SURFACE
      ?auto_7963 - PLACE
      ?auto_7956 - HOIST
      ?auto_7957 - SURFACE
      ?auto_7960 - PLACE
      ?auto_7952 - HOIST
      ?auto_7959 - SURFACE
      ?auto_7954 - PLACE
      ?auto_7961 - HOIST
      ?auto_7950 - SURFACE
      ?auto_7958 - PLACE
      ?auto_7953 - HOIST
      ?auto_7955 - SURFACE
      ?auto_7951 - SURFACE
      ?auto_7962 - SURFACE
      ?auto_7949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7948 ?auto_7944 ) ( IS-CRATE ?auto_7943 ) ( not ( = ?auto_7946 ?auto_7944 ) ) ( HOIST-AT ?auto_7947 ?auto_7946 ) ( AVAILABLE ?auto_7947 ) ( SURFACE-AT ?auto_7943 ?auto_7946 ) ( ON ?auto_7943 ?auto_7945 ) ( CLEAR ?auto_7943 ) ( not ( = ?auto_7941 ?auto_7943 ) ) ( not ( = ?auto_7941 ?auto_7945 ) ) ( not ( = ?auto_7943 ?auto_7945 ) ) ( not ( = ?auto_7948 ?auto_7947 ) ) ( IS-CRATE ?auto_7941 ) ( not ( = ?auto_7963 ?auto_7944 ) ) ( HOIST-AT ?auto_7956 ?auto_7963 ) ( AVAILABLE ?auto_7956 ) ( SURFACE-AT ?auto_7941 ?auto_7963 ) ( ON ?auto_7941 ?auto_7957 ) ( CLEAR ?auto_7941 ) ( not ( = ?auto_7942 ?auto_7941 ) ) ( not ( = ?auto_7942 ?auto_7957 ) ) ( not ( = ?auto_7941 ?auto_7957 ) ) ( not ( = ?auto_7948 ?auto_7956 ) ) ( IS-CRATE ?auto_7942 ) ( not ( = ?auto_7960 ?auto_7944 ) ) ( HOIST-AT ?auto_7952 ?auto_7960 ) ( SURFACE-AT ?auto_7942 ?auto_7960 ) ( ON ?auto_7942 ?auto_7959 ) ( CLEAR ?auto_7942 ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7959 ) ) ( not ( = ?auto_7942 ?auto_7959 ) ) ( not ( = ?auto_7948 ?auto_7952 ) ) ( IS-CRATE ?auto_7940 ) ( not ( = ?auto_7954 ?auto_7944 ) ) ( HOIST-AT ?auto_7961 ?auto_7954 ) ( SURFACE-AT ?auto_7940 ?auto_7954 ) ( ON ?auto_7940 ?auto_7950 ) ( CLEAR ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7950 ) ) ( not ( = ?auto_7940 ?auto_7950 ) ) ( not ( = ?auto_7948 ?auto_7961 ) ) ( IS-CRATE ?auto_7939 ) ( not ( = ?auto_7958 ?auto_7944 ) ) ( HOIST-AT ?auto_7953 ?auto_7958 ) ( AVAILABLE ?auto_7953 ) ( SURFACE-AT ?auto_7939 ?auto_7958 ) ( ON ?auto_7939 ?auto_7955 ) ( CLEAR ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7938 ?auto_7955 ) ) ( not ( = ?auto_7939 ?auto_7955 ) ) ( not ( = ?auto_7948 ?auto_7953 ) ) ( IS-CRATE ?auto_7938 ) ( AVAILABLE ?auto_7961 ) ( SURFACE-AT ?auto_7938 ?auto_7954 ) ( ON ?auto_7938 ?auto_7951 ) ( CLEAR ?auto_7938 ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7951 ) ) ( not ( = ?auto_7938 ?auto_7951 ) ) ( SURFACE-AT ?auto_7936 ?auto_7944 ) ( CLEAR ?auto_7936 ) ( IS-CRATE ?auto_7937 ) ( AVAILABLE ?auto_7948 ) ( AVAILABLE ?auto_7952 ) ( SURFACE-AT ?auto_7937 ?auto_7960 ) ( ON ?auto_7937 ?auto_7962 ) ( CLEAR ?auto_7937 ) ( TRUCK-AT ?auto_7949 ?auto_7944 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7962 ) ) ( not ( = ?auto_7937 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7936 ?auto_7951 ) ) ( not ( = ?auto_7938 ?auto_7962 ) ) ( not ( = ?auto_7954 ?auto_7960 ) ) ( not ( = ?auto_7961 ?auto_7952 ) ) ( not ( = ?auto_7951 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7939 ) ) ( not ( = ?auto_7936 ?auto_7955 ) ) ( not ( = ?auto_7937 ?auto_7939 ) ) ( not ( = ?auto_7937 ?auto_7955 ) ) ( not ( = ?auto_7939 ?auto_7951 ) ) ( not ( = ?auto_7939 ?auto_7962 ) ) ( not ( = ?auto_7958 ?auto_7954 ) ) ( not ( = ?auto_7958 ?auto_7960 ) ) ( not ( = ?auto_7953 ?auto_7961 ) ) ( not ( = ?auto_7953 ?auto_7952 ) ) ( not ( = ?auto_7955 ?auto_7951 ) ) ( not ( = ?auto_7955 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7940 ) ) ( not ( = ?auto_7936 ?auto_7950 ) ) ( not ( = ?auto_7937 ?auto_7940 ) ) ( not ( = ?auto_7937 ?auto_7950 ) ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( not ( = ?auto_7938 ?auto_7950 ) ) ( not ( = ?auto_7940 ?auto_7955 ) ) ( not ( = ?auto_7940 ?auto_7951 ) ) ( not ( = ?auto_7940 ?auto_7962 ) ) ( not ( = ?auto_7950 ?auto_7955 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7942 ) ) ( not ( = ?auto_7936 ?auto_7959 ) ) ( not ( = ?auto_7937 ?auto_7942 ) ) ( not ( = ?auto_7937 ?auto_7959 ) ) ( not ( = ?auto_7938 ?auto_7942 ) ) ( not ( = ?auto_7938 ?auto_7959 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( not ( = ?auto_7939 ?auto_7959 ) ) ( not ( = ?auto_7942 ?auto_7950 ) ) ( not ( = ?auto_7942 ?auto_7955 ) ) ( not ( = ?auto_7942 ?auto_7951 ) ) ( not ( = ?auto_7942 ?auto_7962 ) ) ( not ( = ?auto_7959 ?auto_7950 ) ) ( not ( = ?auto_7959 ?auto_7955 ) ) ( not ( = ?auto_7959 ?auto_7951 ) ) ( not ( = ?auto_7959 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7941 ) ) ( not ( = ?auto_7936 ?auto_7957 ) ) ( not ( = ?auto_7937 ?auto_7941 ) ) ( not ( = ?auto_7937 ?auto_7957 ) ) ( not ( = ?auto_7938 ?auto_7941 ) ) ( not ( = ?auto_7938 ?auto_7957 ) ) ( not ( = ?auto_7939 ?auto_7941 ) ) ( not ( = ?auto_7939 ?auto_7957 ) ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7957 ) ) ( not ( = ?auto_7941 ?auto_7959 ) ) ( not ( = ?auto_7941 ?auto_7950 ) ) ( not ( = ?auto_7941 ?auto_7955 ) ) ( not ( = ?auto_7941 ?auto_7951 ) ) ( not ( = ?auto_7941 ?auto_7962 ) ) ( not ( = ?auto_7963 ?auto_7960 ) ) ( not ( = ?auto_7963 ?auto_7954 ) ) ( not ( = ?auto_7963 ?auto_7958 ) ) ( not ( = ?auto_7956 ?auto_7952 ) ) ( not ( = ?auto_7956 ?auto_7961 ) ) ( not ( = ?auto_7956 ?auto_7953 ) ) ( not ( = ?auto_7957 ?auto_7959 ) ) ( not ( = ?auto_7957 ?auto_7950 ) ) ( not ( = ?auto_7957 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7951 ) ) ( not ( = ?auto_7957 ?auto_7962 ) ) ( not ( = ?auto_7936 ?auto_7943 ) ) ( not ( = ?auto_7936 ?auto_7945 ) ) ( not ( = ?auto_7937 ?auto_7943 ) ) ( not ( = ?auto_7937 ?auto_7945 ) ) ( not ( = ?auto_7938 ?auto_7943 ) ) ( not ( = ?auto_7938 ?auto_7945 ) ) ( not ( = ?auto_7939 ?auto_7943 ) ) ( not ( = ?auto_7939 ?auto_7945 ) ) ( not ( = ?auto_7940 ?auto_7943 ) ) ( not ( = ?auto_7940 ?auto_7945 ) ) ( not ( = ?auto_7942 ?auto_7943 ) ) ( not ( = ?auto_7942 ?auto_7945 ) ) ( not ( = ?auto_7943 ?auto_7957 ) ) ( not ( = ?auto_7943 ?auto_7959 ) ) ( not ( = ?auto_7943 ?auto_7950 ) ) ( not ( = ?auto_7943 ?auto_7955 ) ) ( not ( = ?auto_7943 ?auto_7951 ) ) ( not ( = ?auto_7943 ?auto_7962 ) ) ( not ( = ?auto_7946 ?auto_7963 ) ) ( not ( = ?auto_7946 ?auto_7960 ) ) ( not ( = ?auto_7946 ?auto_7954 ) ) ( not ( = ?auto_7946 ?auto_7958 ) ) ( not ( = ?auto_7947 ?auto_7956 ) ) ( not ( = ?auto_7947 ?auto_7952 ) ) ( not ( = ?auto_7947 ?auto_7961 ) ) ( not ( = ?auto_7947 ?auto_7953 ) ) ( not ( = ?auto_7945 ?auto_7957 ) ) ( not ( = ?auto_7945 ?auto_7959 ) ) ( not ( = ?auto_7945 ?auto_7950 ) ) ( not ( = ?auto_7945 ?auto_7955 ) ) ( not ( = ?auto_7945 ?auto_7951 ) ) ( not ( = ?auto_7945 ?auto_7962 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ?auto_7942 ?auto_7941 )
      ( MAKE-1CRATE ?auto_7941 ?auto_7943 )
      ( MAKE-7CRATE-VERIFY ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ?auto_7942 ?auto_7941 ?auto_7943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7966 - SURFACE
      ?auto_7967 - SURFACE
    )
    :vars
    (
      ?auto_7968 - HOIST
      ?auto_7969 - PLACE
      ?auto_7971 - PLACE
      ?auto_7972 - HOIST
      ?auto_7973 - SURFACE
      ?auto_7970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7968 ?auto_7969 ) ( SURFACE-AT ?auto_7966 ?auto_7969 ) ( CLEAR ?auto_7966 ) ( IS-CRATE ?auto_7967 ) ( AVAILABLE ?auto_7968 ) ( not ( = ?auto_7971 ?auto_7969 ) ) ( HOIST-AT ?auto_7972 ?auto_7971 ) ( AVAILABLE ?auto_7972 ) ( SURFACE-AT ?auto_7967 ?auto_7971 ) ( ON ?auto_7967 ?auto_7973 ) ( CLEAR ?auto_7967 ) ( TRUCK-AT ?auto_7970 ?auto_7969 ) ( not ( = ?auto_7966 ?auto_7967 ) ) ( not ( = ?auto_7966 ?auto_7973 ) ) ( not ( = ?auto_7967 ?auto_7973 ) ) ( not ( = ?auto_7968 ?auto_7972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7970 ?auto_7969 ?auto_7971 )
      ( !LIFT ?auto_7972 ?auto_7967 ?auto_7973 ?auto_7971 )
      ( !LOAD ?auto_7972 ?auto_7967 ?auto_7970 ?auto_7971 )
      ( !DRIVE ?auto_7970 ?auto_7971 ?auto_7969 )
      ( !UNLOAD ?auto_7968 ?auto_7967 ?auto_7970 ?auto_7969 )
      ( !DROP ?auto_7968 ?auto_7967 ?auto_7966 ?auto_7969 )
      ( MAKE-1CRATE-VERIFY ?auto_7966 ?auto_7967 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7983 - SURFACE
      ?auto_7984 - SURFACE
      ?auto_7985 - SURFACE
      ?auto_7986 - SURFACE
      ?auto_7987 - SURFACE
      ?auto_7989 - SURFACE
      ?auto_7988 - SURFACE
      ?auto_7991 - SURFACE
      ?auto_7990 - SURFACE
    )
    :vars
    (
      ?auto_7997 - HOIST
      ?auto_7996 - PLACE
      ?auto_7992 - PLACE
      ?auto_7994 - HOIST
      ?auto_7995 - SURFACE
      ?auto_7998 - PLACE
      ?auto_7999 - HOIST
      ?auto_8000 - SURFACE
      ?auto_8010 - PLACE
      ?auto_8012 - HOIST
      ?auto_8011 - SURFACE
      ?auto_8006 - PLACE
      ?auto_8003 - HOIST
      ?auto_8007 - SURFACE
      ?auto_8014 - PLACE
      ?auto_8008 - HOIST
      ?auto_8004 - SURFACE
      ?auto_8005 - PLACE
      ?auto_8001 - HOIST
      ?auto_8013 - SURFACE
      ?auto_8002 - SURFACE
      ?auto_8009 - SURFACE
      ?auto_7993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7997 ?auto_7996 ) ( IS-CRATE ?auto_7990 ) ( not ( = ?auto_7992 ?auto_7996 ) ) ( HOIST-AT ?auto_7994 ?auto_7992 ) ( AVAILABLE ?auto_7994 ) ( SURFACE-AT ?auto_7990 ?auto_7992 ) ( ON ?auto_7990 ?auto_7995 ) ( CLEAR ?auto_7990 ) ( not ( = ?auto_7991 ?auto_7990 ) ) ( not ( = ?auto_7991 ?auto_7995 ) ) ( not ( = ?auto_7990 ?auto_7995 ) ) ( not ( = ?auto_7997 ?auto_7994 ) ) ( IS-CRATE ?auto_7991 ) ( not ( = ?auto_7998 ?auto_7996 ) ) ( HOIST-AT ?auto_7999 ?auto_7998 ) ( AVAILABLE ?auto_7999 ) ( SURFACE-AT ?auto_7991 ?auto_7998 ) ( ON ?auto_7991 ?auto_8000 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7988 ?auto_7991 ) ) ( not ( = ?auto_7988 ?auto_8000 ) ) ( not ( = ?auto_7991 ?auto_8000 ) ) ( not ( = ?auto_7997 ?auto_7999 ) ) ( IS-CRATE ?auto_7988 ) ( not ( = ?auto_8010 ?auto_7996 ) ) ( HOIST-AT ?auto_8012 ?auto_8010 ) ( AVAILABLE ?auto_8012 ) ( SURFACE-AT ?auto_7988 ?auto_8010 ) ( ON ?auto_7988 ?auto_8011 ) ( CLEAR ?auto_7988 ) ( not ( = ?auto_7989 ?auto_7988 ) ) ( not ( = ?auto_7989 ?auto_8011 ) ) ( not ( = ?auto_7988 ?auto_8011 ) ) ( not ( = ?auto_7997 ?auto_8012 ) ) ( IS-CRATE ?auto_7989 ) ( not ( = ?auto_8006 ?auto_7996 ) ) ( HOIST-AT ?auto_8003 ?auto_8006 ) ( SURFACE-AT ?auto_7989 ?auto_8006 ) ( ON ?auto_7989 ?auto_8007 ) ( CLEAR ?auto_7989 ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_8007 ) ) ( not ( = ?auto_7989 ?auto_8007 ) ) ( not ( = ?auto_7997 ?auto_8003 ) ) ( IS-CRATE ?auto_7987 ) ( not ( = ?auto_8014 ?auto_7996 ) ) ( HOIST-AT ?auto_8008 ?auto_8014 ) ( SURFACE-AT ?auto_7987 ?auto_8014 ) ( ON ?auto_7987 ?auto_8004 ) ( CLEAR ?auto_7987 ) ( not ( = ?auto_7986 ?auto_7987 ) ) ( not ( = ?auto_7986 ?auto_8004 ) ) ( not ( = ?auto_7987 ?auto_8004 ) ) ( not ( = ?auto_7997 ?auto_8008 ) ) ( IS-CRATE ?auto_7986 ) ( not ( = ?auto_8005 ?auto_7996 ) ) ( HOIST-AT ?auto_8001 ?auto_8005 ) ( AVAILABLE ?auto_8001 ) ( SURFACE-AT ?auto_7986 ?auto_8005 ) ( ON ?auto_7986 ?auto_8013 ) ( CLEAR ?auto_7986 ) ( not ( = ?auto_7985 ?auto_7986 ) ) ( not ( = ?auto_7985 ?auto_8013 ) ) ( not ( = ?auto_7986 ?auto_8013 ) ) ( not ( = ?auto_7997 ?auto_8001 ) ) ( IS-CRATE ?auto_7985 ) ( AVAILABLE ?auto_8008 ) ( SURFACE-AT ?auto_7985 ?auto_8014 ) ( ON ?auto_7985 ?auto_8002 ) ( CLEAR ?auto_7985 ) ( not ( = ?auto_7984 ?auto_7985 ) ) ( not ( = ?auto_7984 ?auto_8002 ) ) ( not ( = ?auto_7985 ?auto_8002 ) ) ( SURFACE-AT ?auto_7983 ?auto_7996 ) ( CLEAR ?auto_7983 ) ( IS-CRATE ?auto_7984 ) ( AVAILABLE ?auto_7997 ) ( AVAILABLE ?auto_8003 ) ( SURFACE-AT ?auto_7984 ?auto_8006 ) ( ON ?auto_7984 ?auto_8009 ) ( CLEAR ?auto_7984 ) ( TRUCK-AT ?auto_7993 ?auto_7996 ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( not ( = ?auto_7983 ?auto_8009 ) ) ( not ( = ?auto_7984 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7985 ) ) ( not ( = ?auto_7983 ?auto_8002 ) ) ( not ( = ?auto_7985 ?auto_8009 ) ) ( not ( = ?auto_8014 ?auto_8006 ) ) ( not ( = ?auto_8008 ?auto_8003 ) ) ( not ( = ?auto_8002 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7986 ) ) ( not ( = ?auto_7983 ?auto_8013 ) ) ( not ( = ?auto_7984 ?auto_7986 ) ) ( not ( = ?auto_7984 ?auto_8013 ) ) ( not ( = ?auto_7986 ?auto_8002 ) ) ( not ( = ?auto_7986 ?auto_8009 ) ) ( not ( = ?auto_8005 ?auto_8014 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8001 ?auto_8008 ) ) ( not ( = ?auto_8001 ?auto_8003 ) ) ( not ( = ?auto_8013 ?auto_8002 ) ) ( not ( = ?auto_8013 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7987 ) ) ( not ( = ?auto_7983 ?auto_8004 ) ) ( not ( = ?auto_7984 ?auto_7987 ) ) ( not ( = ?auto_7984 ?auto_8004 ) ) ( not ( = ?auto_7985 ?auto_7987 ) ) ( not ( = ?auto_7985 ?auto_8004 ) ) ( not ( = ?auto_7987 ?auto_8013 ) ) ( not ( = ?auto_7987 ?auto_8002 ) ) ( not ( = ?auto_7987 ?auto_8009 ) ) ( not ( = ?auto_8004 ?auto_8013 ) ) ( not ( = ?auto_8004 ?auto_8002 ) ) ( not ( = ?auto_8004 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7989 ) ) ( not ( = ?auto_7983 ?auto_8007 ) ) ( not ( = ?auto_7984 ?auto_7989 ) ) ( not ( = ?auto_7984 ?auto_8007 ) ) ( not ( = ?auto_7985 ?auto_7989 ) ) ( not ( = ?auto_7985 ?auto_8007 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7986 ?auto_8007 ) ) ( not ( = ?auto_7989 ?auto_8004 ) ) ( not ( = ?auto_7989 ?auto_8013 ) ) ( not ( = ?auto_7989 ?auto_8002 ) ) ( not ( = ?auto_7989 ?auto_8009 ) ) ( not ( = ?auto_8007 ?auto_8004 ) ) ( not ( = ?auto_8007 ?auto_8013 ) ) ( not ( = ?auto_8007 ?auto_8002 ) ) ( not ( = ?auto_8007 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7988 ) ) ( not ( = ?auto_7983 ?auto_8011 ) ) ( not ( = ?auto_7984 ?auto_7988 ) ) ( not ( = ?auto_7984 ?auto_8011 ) ) ( not ( = ?auto_7985 ?auto_7988 ) ) ( not ( = ?auto_7985 ?auto_8011 ) ) ( not ( = ?auto_7986 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_8011 ) ) ( not ( = ?auto_7987 ?auto_7988 ) ) ( not ( = ?auto_7987 ?auto_8011 ) ) ( not ( = ?auto_7988 ?auto_8007 ) ) ( not ( = ?auto_7988 ?auto_8004 ) ) ( not ( = ?auto_7988 ?auto_8013 ) ) ( not ( = ?auto_7988 ?auto_8002 ) ) ( not ( = ?auto_7988 ?auto_8009 ) ) ( not ( = ?auto_8010 ?auto_8006 ) ) ( not ( = ?auto_8010 ?auto_8014 ) ) ( not ( = ?auto_8010 ?auto_8005 ) ) ( not ( = ?auto_8012 ?auto_8003 ) ) ( not ( = ?auto_8012 ?auto_8008 ) ) ( not ( = ?auto_8012 ?auto_8001 ) ) ( not ( = ?auto_8011 ?auto_8007 ) ) ( not ( = ?auto_8011 ?auto_8004 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( not ( = ?auto_8011 ?auto_8002 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7991 ) ) ( not ( = ?auto_7983 ?auto_8000 ) ) ( not ( = ?auto_7984 ?auto_7991 ) ) ( not ( = ?auto_7984 ?auto_8000 ) ) ( not ( = ?auto_7985 ?auto_7991 ) ) ( not ( = ?auto_7985 ?auto_8000 ) ) ( not ( = ?auto_7986 ?auto_7991 ) ) ( not ( = ?auto_7986 ?auto_8000 ) ) ( not ( = ?auto_7987 ?auto_7991 ) ) ( not ( = ?auto_7987 ?auto_8000 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_8000 ) ) ( not ( = ?auto_7991 ?auto_8011 ) ) ( not ( = ?auto_7991 ?auto_8007 ) ) ( not ( = ?auto_7991 ?auto_8004 ) ) ( not ( = ?auto_7991 ?auto_8013 ) ) ( not ( = ?auto_7991 ?auto_8002 ) ) ( not ( = ?auto_7991 ?auto_8009 ) ) ( not ( = ?auto_7998 ?auto_8010 ) ) ( not ( = ?auto_7998 ?auto_8006 ) ) ( not ( = ?auto_7998 ?auto_8014 ) ) ( not ( = ?auto_7998 ?auto_8005 ) ) ( not ( = ?auto_7999 ?auto_8012 ) ) ( not ( = ?auto_7999 ?auto_8003 ) ) ( not ( = ?auto_7999 ?auto_8008 ) ) ( not ( = ?auto_7999 ?auto_8001 ) ) ( not ( = ?auto_8000 ?auto_8011 ) ) ( not ( = ?auto_8000 ?auto_8007 ) ) ( not ( = ?auto_8000 ?auto_8004 ) ) ( not ( = ?auto_8000 ?auto_8013 ) ) ( not ( = ?auto_8000 ?auto_8002 ) ) ( not ( = ?auto_8000 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7990 ) ) ( not ( = ?auto_7983 ?auto_7995 ) ) ( not ( = ?auto_7984 ?auto_7990 ) ) ( not ( = ?auto_7984 ?auto_7995 ) ) ( not ( = ?auto_7985 ?auto_7990 ) ) ( not ( = ?auto_7985 ?auto_7995 ) ) ( not ( = ?auto_7986 ?auto_7990 ) ) ( not ( = ?auto_7986 ?auto_7995 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_7995 ) ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_7995 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_7995 ) ) ( not ( = ?auto_7990 ?auto_8000 ) ) ( not ( = ?auto_7990 ?auto_8011 ) ) ( not ( = ?auto_7990 ?auto_8007 ) ) ( not ( = ?auto_7990 ?auto_8004 ) ) ( not ( = ?auto_7990 ?auto_8013 ) ) ( not ( = ?auto_7990 ?auto_8002 ) ) ( not ( = ?auto_7990 ?auto_8009 ) ) ( not ( = ?auto_7992 ?auto_7998 ) ) ( not ( = ?auto_7992 ?auto_8010 ) ) ( not ( = ?auto_7992 ?auto_8006 ) ) ( not ( = ?auto_7992 ?auto_8014 ) ) ( not ( = ?auto_7992 ?auto_8005 ) ) ( not ( = ?auto_7994 ?auto_7999 ) ) ( not ( = ?auto_7994 ?auto_8012 ) ) ( not ( = ?auto_7994 ?auto_8003 ) ) ( not ( = ?auto_7994 ?auto_8008 ) ) ( not ( = ?auto_7994 ?auto_8001 ) ) ( not ( = ?auto_7995 ?auto_8000 ) ) ( not ( = ?auto_7995 ?auto_8011 ) ) ( not ( = ?auto_7995 ?auto_8007 ) ) ( not ( = ?auto_7995 ?auto_8004 ) ) ( not ( = ?auto_7995 ?auto_8013 ) ) ( not ( = ?auto_7995 ?auto_8002 ) ) ( not ( = ?auto_7995 ?auto_8009 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7983 ?auto_7984 ?auto_7985 ?auto_7986 ?auto_7987 ?auto_7989 ?auto_7988 ?auto_7991 )
      ( MAKE-1CRATE ?auto_7991 ?auto_7990 )
      ( MAKE-8CRATE-VERIFY ?auto_7983 ?auto_7984 ?auto_7985 ?auto_7986 ?auto_7987 ?auto_7989 ?auto_7988 ?auto_7991 ?auto_7990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8017 - SURFACE
      ?auto_8018 - SURFACE
    )
    :vars
    (
      ?auto_8019 - HOIST
      ?auto_8020 - PLACE
      ?auto_8022 - PLACE
      ?auto_8023 - HOIST
      ?auto_8024 - SURFACE
      ?auto_8021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8019 ?auto_8020 ) ( SURFACE-AT ?auto_8017 ?auto_8020 ) ( CLEAR ?auto_8017 ) ( IS-CRATE ?auto_8018 ) ( AVAILABLE ?auto_8019 ) ( not ( = ?auto_8022 ?auto_8020 ) ) ( HOIST-AT ?auto_8023 ?auto_8022 ) ( AVAILABLE ?auto_8023 ) ( SURFACE-AT ?auto_8018 ?auto_8022 ) ( ON ?auto_8018 ?auto_8024 ) ( CLEAR ?auto_8018 ) ( TRUCK-AT ?auto_8021 ?auto_8020 ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8024 ) ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( not ( = ?auto_8019 ?auto_8023 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8021 ?auto_8020 ?auto_8022 )
      ( !LIFT ?auto_8023 ?auto_8018 ?auto_8024 ?auto_8022 )
      ( !LOAD ?auto_8023 ?auto_8018 ?auto_8021 ?auto_8022 )
      ( !DRIVE ?auto_8021 ?auto_8022 ?auto_8020 )
      ( !UNLOAD ?auto_8019 ?auto_8018 ?auto_8021 ?auto_8020 )
      ( !DROP ?auto_8019 ?auto_8018 ?auto_8017 ?auto_8020 )
      ( MAKE-1CRATE-VERIFY ?auto_8017 ?auto_8018 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8035 - SURFACE
      ?auto_8036 - SURFACE
      ?auto_8037 - SURFACE
      ?auto_8038 - SURFACE
      ?auto_8039 - SURFACE
      ?auto_8042 - SURFACE
      ?auto_8040 - SURFACE
      ?auto_8044 - SURFACE
      ?auto_8043 - SURFACE
      ?auto_8041 - SURFACE
    )
    :vars
    (
      ?auto_8047 - HOIST
      ?auto_8048 - PLACE
      ?auto_8046 - PLACE
      ?auto_8045 - HOIST
      ?auto_8050 - SURFACE
      ?auto_8066 - PLACE
      ?auto_8063 - HOIST
      ?auto_8065 - SURFACE
      ?auto_8067 - PLACE
      ?auto_8059 - HOIST
      ?auto_8064 - SURFACE
      ?auto_8054 - PLACE
      ?auto_8061 - HOIST
      ?auto_8055 - SURFACE
      ?auto_8070 - PLACE
      ?auto_8058 - HOIST
      ?auto_8052 - SURFACE
      ?auto_8068 - PLACE
      ?auto_8051 - HOIST
      ?auto_8057 - SURFACE
      ?auto_8056 - PLACE
      ?auto_8060 - HOIST
      ?auto_8069 - SURFACE
      ?auto_8062 - SURFACE
      ?auto_8053 - SURFACE
      ?auto_8049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8047 ?auto_8048 ) ( IS-CRATE ?auto_8041 ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( HOIST-AT ?auto_8045 ?auto_8046 ) ( AVAILABLE ?auto_8045 ) ( SURFACE-AT ?auto_8041 ?auto_8046 ) ( ON ?auto_8041 ?auto_8050 ) ( CLEAR ?auto_8041 ) ( not ( = ?auto_8043 ?auto_8041 ) ) ( not ( = ?auto_8043 ?auto_8050 ) ) ( not ( = ?auto_8041 ?auto_8050 ) ) ( not ( = ?auto_8047 ?auto_8045 ) ) ( IS-CRATE ?auto_8043 ) ( not ( = ?auto_8066 ?auto_8048 ) ) ( HOIST-AT ?auto_8063 ?auto_8066 ) ( AVAILABLE ?auto_8063 ) ( SURFACE-AT ?auto_8043 ?auto_8066 ) ( ON ?auto_8043 ?auto_8065 ) ( CLEAR ?auto_8043 ) ( not ( = ?auto_8044 ?auto_8043 ) ) ( not ( = ?auto_8044 ?auto_8065 ) ) ( not ( = ?auto_8043 ?auto_8065 ) ) ( not ( = ?auto_8047 ?auto_8063 ) ) ( IS-CRATE ?auto_8044 ) ( not ( = ?auto_8067 ?auto_8048 ) ) ( HOIST-AT ?auto_8059 ?auto_8067 ) ( AVAILABLE ?auto_8059 ) ( SURFACE-AT ?auto_8044 ?auto_8067 ) ( ON ?auto_8044 ?auto_8064 ) ( CLEAR ?auto_8044 ) ( not ( = ?auto_8040 ?auto_8044 ) ) ( not ( = ?auto_8040 ?auto_8064 ) ) ( not ( = ?auto_8044 ?auto_8064 ) ) ( not ( = ?auto_8047 ?auto_8059 ) ) ( IS-CRATE ?auto_8040 ) ( not ( = ?auto_8054 ?auto_8048 ) ) ( HOIST-AT ?auto_8061 ?auto_8054 ) ( AVAILABLE ?auto_8061 ) ( SURFACE-AT ?auto_8040 ?auto_8054 ) ( ON ?auto_8040 ?auto_8055 ) ( CLEAR ?auto_8040 ) ( not ( = ?auto_8042 ?auto_8040 ) ) ( not ( = ?auto_8042 ?auto_8055 ) ) ( not ( = ?auto_8040 ?auto_8055 ) ) ( not ( = ?auto_8047 ?auto_8061 ) ) ( IS-CRATE ?auto_8042 ) ( not ( = ?auto_8070 ?auto_8048 ) ) ( HOIST-AT ?auto_8058 ?auto_8070 ) ( SURFACE-AT ?auto_8042 ?auto_8070 ) ( ON ?auto_8042 ?auto_8052 ) ( CLEAR ?auto_8042 ) ( not ( = ?auto_8039 ?auto_8042 ) ) ( not ( = ?auto_8039 ?auto_8052 ) ) ( not ( = ?auto_8042 ?auto_8052 ) ) ( not ( = ?auto_8047 ?auto_8058 ) ) ( IS-CRATE ?auto_8039 ) ( not ( = ?auto_8068 ?auto_8048 ) ) ( HOIST-AT ?auto_8051 ?auto_8068 ) ( SURFACE-AT ?auto_8039 ?auto_8068 ) ( ON ?auto_8039 ?auto_8057 ) ( CLEAR ?auto_8039 ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8057 ) ) ( not ( = ?auto_8039 ?auto_8057 ) ) ( not ( = ?auto_8047 ?auto_8051 ) ) ( IS-CRATE ?auto_8038 ) ( not ( = ?auto_8056 ?auto_8048 ) ) ( HOIST-AT ?auto_8060 ?auto_8056 ) ( AVAILABLE ?auto_8060 ) ( SURFACE-AT ?auto_8038 ?auto_8056 ) ( ON ?auto_8038 ?auto_8069 ) ( CLEAR ?auto_8038 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8069 ) ) ( not ( = ?auto_8038 ?auto_8069 ) ) ( not ( = ?auto_8047 ?auto_8060 ) ) ( IS-CRATE ?auto_8037 ) ( AVAILABLE ?auto_8051 ) ( SURFACE-AT ?auto_8037 ?auto_8068 ) ( ON ?auto_8037 ?auto_8062 ) ( CLEAR ?auto_8037 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8062 ) ) ( not ( = ?auto_8037 ?auto_8062 ) ) ( SURFACE-AT ?auto_8035 ?auto_8048 ) ( CLEAR ?auto_8035 ) ( IS-CRATE ?auto_8036 ) ( AVAILABLE ?auto_8047 ) ( AVAILABLE ?auto_8058 ) ( SURFACE-AT ?auto_8036 ?auto_8070 ) ( ON ?auto_8036 ?auto_8053 ) ( CLEAR ?auto_8036 ) ( TRUCK-AT ?auto_8049 ?auto_8048 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8053 ) ) ( not ( = ?auto_8036 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8062 ) ) ( not ( = ?auto_8037 ?auto_8053 ) ) ( not ( = ?auto_8068 ?auto_8070 ) ) ( not ( = ?auto_8051 ?auto_8058 ) ) ( not ( = ?auto_8062 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8069 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8069 ) ) ( not ( = ?auto_8038 ?auto_8062 ) ) ( not ( = ?auto_8038 ?auto_8053 ) ) ( not ( = ?auto_8056 ?auto_8068 ) ) ( not ( = ?auto_8056 ?auto_8070 ) ) ( not ( = ?auto_8060 ?auto_8051 ) ) ( not ( = ?auto_8060 ?auto_8058 ) ) ( not ( = ?auto_8069 ?auto_8062 ) ) ( not ( = ?auto_8069 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8035 ?auto_8057 ) ) ( not ( = ?auto_8036 ?auto_8039 ) ) ( not ( = ?auto_8036 ?auto_8057 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8057 ) ) ( not ( = ?auto_8039 ?auto_8069 ) ) ( not ( = ?auto_8039 ?auto_8062 ) ) ( not ( = ?auto_8039 ?auto_8053 ) ) ( not ( = ?auto_8057 ?auto_8069 ) ) ( not ( = ?auto_8057 ?auto_8062 ) ) ( not ( = ?auto_8057 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8042 ) ) ( not ( = ?auto_8035 ?auto_8052 ) ) ( not ( = ?auto_8036 ?auto_8042 ) ) ( not ( = ?auto_8036 ?auto_8052 ) ) ( not ( = ?auto_8037 ?auto_8042 ) ) ( not ( = ?auto_8037 ?auto_8052 ) ) ( not ( = ?auto_8038 ?auto_8042 ) ) ( not ( = ?auto_8038 ?auto_8052 ) ) ( not ( = ?auto_8042 ?auto_8057 ) ) ( not ( = ?auto_8042 ?auto_8069 ) ) ( not ( = ?auto_8042 ?auto_8062 ) ) ( not ( = ?auto_8042 ?auto_8053 ) ) ( not ( = ?auto_8052 ?auto_8057 ) ) ( not ( = ?auto_8052 ?auto_8069 ) ) ( not ( = ?auto_8052 ?auto_8062 ) ) ( not ( = ?auto_8052 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8040 ) ) ( not ( = ?auto_8035 ?auto_8055 ) ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( not ( = ?auto_8036 ?auto_8055 ) ) ( not ( = ?auto_8037 ?auto_8040 ) ) ( not ( = ?auto_8037 ?auto_8055 ) ) ( not ( = ?auto_8038 ?auto_8040 ) ) ( not ( = ?auto_8038 ?auto_8055 ) ) ( not ( = ?auto_8039 ?auto_8040 ) ) ( not ( = ?auto_8039 ?auto_8055 ) ) ( not ( = ?auto_8040 ?auto_8052 ) ) ( not ( = ?auto_8040 ?auto_8057 ) ) ( not ( = ?auto_8040 ?auto_8069 ) ) ( not ( = ?auto_8040 ?auto_8062 ) ) ( not ( = ?auto_8040 ?auto_8053 ) ) ( not ( = ?auto_8054 ?auto_8070 ) ) ( not ( = ?auto_8054 ?auto_8068 ) ) ( not ( = ?auto_8054 ?auto_8056 ) ) ( not ( = ?auto_8061 ?auto_8058 ) ) ( not ( = ?auto_8061 ?auto_8051 ) ) ( not ( = ?auto_8061 ?auto_8060 ) ) ( not ( = ?auto_8055 ?auto_8052 ) ) ( not ( = ?auto_8055 ?auto_8057 ) ) ( not ( = ?auto_8055 ?auto_8069 ) ) ( not ( = ?auto_8055 ?auto_8062 ) ) ( not ( = ?auto_8055 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8044 ) ) ( not ( = ?auto_8035 ?auto_8064 ) ) ( not ( = ?auto_8036 ?auto_8044 ) ) ( not ( = ?auto_8036 ?auto_8064 ) ) ( not ( = ?auto_8037 ?auto_8044 ) ) ( not ( = ?auto_8037 ?auto_8064 ) ) ( not ( = ?auto_8038 ?auto_8044 ) ) ( not ( = ?auto_8038 ?auto_8064 ) ) ( not ( = ?auto_8039 ?auto_8044 ) ) ( not ( = ?auto_8039 ?auto_8064 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8064 ) ) ( not ( = ?auto_8044 ?auto_8055 ) ) ( not ( = ?auto_8044 ?auto_8052 ) ) ( not ( = ?auto_8044 ?auto_8057 ) ) ( not ( = ?auto_8044 ?auto_8069 ) ) ( not ( = ?auto_8044 ?auto_8062 ) ) ( not ( = ?auto_8044 ?auto_8053 ) ) ( not ( = ?auto_8067 ?auto_8054 ) ) ( not ( = ?auto_8067 ?auto_8070 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8056 ) ) ( not ( = ?auto_8059 ?auto_8061 ) ) ( not ( = ?auto_8059 ?auto_8058 ) ) ( not ( = ?auto_8059 ?auto_8051 ) ) ( not ( = ?auto_8059 ?auto_8060 ) ) ( not ( = ?auto_8064 ?auto_8055 ) ) ( not ( = ?auto_8064 ?auto_8052 ) ) ( not ( = ?auto_8064 ?auto_8057 ) ) ( not ( = ?auto_8064 ?auto_8069 ) ) ( not ( = ?auto_8064 ?auto_8062 ) ) ( not ( = ?auto_8064 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8043 ) ) ( not ( = ?auto_8035 ?auto_8065 ) ) ( not ( = ?auto_8036 ?auto_8043 ) ) ( not ( = ?auto_8036 ?auto_8065 ) ) ( not ( = ?auto_8037 ?auto_8043 ) ) ( not ( = ?auto_8037 ?auto_8065 ) ) ( not ( = ?auto_8038 ?auto_8043 ) ) ( not ( = ?auto_8038 ?auto_8065 ) ) ( not ( = ?auto_8039 ?auto_8043 ) ) ( not ( = ?auto_8039 ?auto_8065 ) ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8065 ) ) ( not ( = ?auto_8040 ?auto_8043 ) ) ( not ( = ?auto_8040 ?auto_8065 ) ) ( not ( = ?auto_8043 ?auto_8064 ) ) ( not ( = ?auto_8043 ?auto_8055 ) ) ( not ( = ?auto_8043 ?auto_8052 ) ) ( not ( = ?auto_8043 ?auto_8057 ) ) ( not ( = ?auto_8043 ?auto_8069 ) ) ( not ( = ?auto_8043 ?auto_8062 ) ) ( not ( = ?auto_8043 ?auto_8053 ) ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8054 ) ) ( not ( = ?auto_8066 ?auto_8070 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8066 ?auto_8056 ) ) ( not ( = ?auto_8063 ?auto_8059 ) ) ( not ( = ?auto_8063 ?auto_8061 ) ) ( not ( = ?auto_8063 ?auto_8058 ) ) ( not ( = ?auto_8063 ?auto_8051 ) ) ( not ( = ?auto_8063 ?auto_8060 ) ) ( not ( = ?auto_8065 ?auto_8064 ) ) ( not ( = ?auto_8065 ?auto_8055 ) ) ( not ( = ?auto_8065 ?auto_8052 ) ) ( not ( = ?auto_8065 ?auto_8057 ) ) ( not ( = ?auto_8065 ?auto_8069 ) ) ( not ( = ?auto_8065 ?auto_8062 ) ) ( not ( = ?auto_8065 ?auto_8053 ) ) ( not ( = ?auto_8035 ?auto_8041 ) ) ( not ( = ?auto_8035 ?auto_8050 ) ) ( not ( = ?auto_8036 ?auto_8041 ) ) ( not ( = ?auto_8036 ?auto_8050 ) ) ( not ( = ?auto_8037 ?auto_8041 ) ) ( not ( = ?auto_8037 ?auto_8050 ) ) ( not ( = ?auto_8038 ?auto_8041 ) ) ( not ( = ?auto_8038 ?auto_8050 ) ) ( not ( = ?auto_8039 ?auto_8041 ) ) ( not ( = ?auto_8039 ?auto_8050 ) ) ( not ( = ?auto_8042 ?auto_8041 ) ) ( not ( = ?auto_8042 ?auto_8050 ) ) ( not ( = ?auto_8040 ?auto_8041 ) ) ( not ( = ?auto_8040 ?auto_8050 ) ) ( not ( = ?auto_8044 ?auto_8041 ) ) ( not ( = ?auto_8044 ?auto_8050 ) ) ( not ( = ?auto_8041 ?auto_8065 ) ) ( not ( = ?auto_8041 ?auto_8064 ) ) ( not ( = ?auto_8041 ?auto_8055 ) ) ( not ( = ?auto_8041 ?auto_8052 ) ) ( not ( = ?auto_8041 ?auto_8057 ) ) ( not ( = ?auto_8041 ?auto_8069 ) ) ( not ( = ?auto_8041 ?auto_8062 ) ) ( not ( = ?auto_8041 ?auto_8053 ) ) ( not ( = ?auto_8046 ?auto_8066 ) ) ( not ( = ?auto_8046 ?auto_8067 ) ) ( not ( = ?auto_8046 ?auto_8054 ) ) ( not ( = ?auto_8046 ?auto_8070 ) ) ( not ( = ?auto_8046 ?auto_8068 ) ) ( not ( = ?auto_8046 ?auto_8056 ) ) ( not ( = ?auto_8045 ?auto_8063 ) ) ( not ( = ?auto_8045 ?auto_8059 ) ) ( not ( = ?auto_8045 ?auto_8061 ) ) ( not ( = ?auto_8045 ?auto_8058 ) ) ( not ( = ?auto_8045 ?auto_8051 ) ) ( not ( = ?auto_8045 ?auto_8060 ) ) ( not ( = ?auto_8050 ?auto_8065 ) ) ( not ( = ?auto_8050 ?auto_8064 ) ) ( not ( = ?auto_8050 ?auto_8055 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) ( not ( = ?auto_8050 ?auto_8057 ) ) ( not ( = ?auto_8050 ?auto_8069 ) ) ( not ( = ?auto_8050 ?auto_8062 ) ) ( not ( = ?auto_8050 ?auto_8053 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ?auto_8042 ?auto_8040 ?auto_8044 ?auto_8043 )
      ( MAKE-1CRATE ?auto_8043 ?auto_8041 )
      ( MAKE-9CRATE-VERIFY ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ?auto_8042 ?auto_8040 ?auto_8044 ?auto_8043 ?auto_8041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8073 - SURFACE
      ?auto_8074 - SURFACE
    )
    :vars
    (
      ?auto_8075 - HOIST
      ?auto_8076 - PLACE
      ?auto_8078 - PLACE
      ?auto_8079 - HOIST
      ?auto_8080 - SURFACE
      ?auto_8077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8075 ?auto_8076 ) ( SURFACE-AT ?auto_8073 ?auto_8076 ) ( CLEAR ?auto_8073 ) ( IS-CRATE ?auto_8074 ) ( AVAILABLE ?auto_8075 ) ( not ( = ?auto_8078 ?auto_8076 ) ) ( HOIST-AT ?auto_8079 ?auto_8078 ) ( AVAILABLE ?auto_8079 ) ( SURFACE-AT ?auto_8074 ?auto_8078 ) ( ON ?auto_8074 ?auto_8080 ) ( CLEAR ?auto_8074 ) ( TRUCK-AT ?auto_8077 ?auto_8076 ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( not ( = ?auto_8073 ?auto_8080 ) ) ( not ( = ?auto_8074 ?auto_8080 ) ) ( not ( = ?auto_8075 ?auto_8079 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8077 ?auto_8076 ?auto_8078 )
      ( !LIFT ?auto_8079 ?auto_8074 ?auto_8080 ?auto_8078 )
      ( !LOAD ?auto_8079 ?auto_8074 ?auto_8077 ?auto_8078 )
      ( !DRIVE ?auto_8077 ?auto_8078 ?auto_8076 )
      ( !UNLOAD ?auto_8075 ?auto_8074 ?auto_8077 ?auto_8076 )
      ( !DROP ?auto_8075 ?auto_8074 ?auto_8073 ?auto_8076 )
      ( MAKE-1CRATE-VERIFY ?auto_8073 ?auto_8074 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8092 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8094 - SURFACE
      ?auto_8095 - SURFACE
      ?auto_8096 - SURFACE
      ?auto_8099 - SURFACE
      ?auto_8097 - SURFACE
      ?auto_8101 - SURFACE
      ?auto_8100 - SURFACE
      ?auto_8098 - SURFACE
      ?auto_8102 - SURFACE
    )
    :vars
    (
      ?auto_8103 - HOIST
      ?auto_8105 - PLACE
      ?auto_8108 - PLACE
      ?auto_8107 - HOIST
      ?auto_8106 - SURFACE
      ?auto_8128 - PLACE
      ?auto_8125 - HOIST
      ?auto_8119 - SURFACE
      ?auto_8113 - PLACE
      ?auto_8111 - HOIST
      ?auto_8117 - SURFACE
      ?auto_8122 - PLACE
      ?auto_8126 - HOIST
      ?auto_8112 - SURFACE
      ?auto_8127 - PLACE
      ?auto_8124 - HOIST
      ?auto_8129 - SURFACE
      ?auto_8121 - PLACE
      ?auto_8115 - HOIST
      ?auto_8118 - SURFACE
      ?auto_8109 - PLACE
      ?auto_8116 - HOIST
      ?auto_8131 - SURFACE
      ?auto_8130 - PLACE
      ?auto_8110 - HOIST
      ?auto_8120 - SURFACE
      ?auto_8114 - SURFACE
      ?auto_8123 - SURFACE
      ?auto_8104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8103 ?auto_8105 ) ( IS-CRATE ?auto_8102 ) ( not ( = ?auto_8108 ?auto_8105 ) ) ( HOIST-AT ?auto_8107 ?auto_8108 ) ( AVAILABLE ?auto_8107 ) ( SURFACE-AT ?auto_8102 ?auto_8108 ) ( ON ?auto_8102 ?auto_8106 ) ( CLEAR ?auto_8102 ) ( not ( = ?auto_8098 ?auto_8102 ) ) ( not ( = ?auto_8098 ?auto_8106 ) ) ( not ( = ?auto_8102 ?auto_8106 ) ) ( not ( = ?auto_8103 ?auto_8107 ) ) ( IS-CRATE ?auto_8098 ) ( not ( = ?auto_8128 ?auto_8105 ) ) ( HOIST-AT ?auto_8125 ?auto_8128 ) ( AVAILABLE ?auto_8125 ) ( SURFACE-AT ?auto_8098 ?auto_8128 ) ( ON ?auto_8098 ?auto_8119 ) ( CLEAR ?auto_8098 ) ( not ( = ?auto_8100 ?auto_8098 ) ) ( not ( = ?auto_8100 ?auto_8119 ) ) ( not ( = ?auto_8098 ?auto_8119 ) ) ( not ( = ?auto_8103 ?auto_8125 ) ) ( IS-CRATE ?auto_8100 ) ( not ( = ?auto_8113 ?auto_8105 ) ) ( HOIST-AT ?auto_8111 ?auto_8113 ) ( AVAILABLE ?auto_8111 ) ( SURFACE-AT ?auto_8100 ?auto_8113 ) ( ON ?auto_8100 ?auto_8117 ) ( CLEAR ?auto_8100 ) ( not ( = ?auto_8101 ?auto_8100 ) ) ( not ( = ?auto_8101 ?auto_8117 ) ) ( not ( = ?auto_8100 ?auto_8117 ) ) ( not ( = ?auto_8103 ?auto_8111 ) ) ( IS-CRATE ?auto_8101 ) ( not ( = ?auto_8122 ?auto_8105 ) ) ( HOIST-AT ?auto_8126 ?auto_8122 ) ( AVAILABLE ?auto_8126 ) ( SURFACE-AT ?auto_8101 ?auto_8122 ) ( ON ?auto_8101 ?auto_8112 ) ( CLEAR ?auto_8101 ) ( not ( = ?auto_8097 ?auto_8101 ) ) ( not ( = ?auto_8097 ?auto_8112 ) ) ( not ( = ?auto_8101 ?auto_8112 ) ) ( not ( = ?auto_8103 ?auto_8126 ) ) ( IS-CRATE ?auto_8097 ) ( not ( = ?auto_8127 ?auto_8105 ) ) ( HOIST-AT ?auto_8124 ?auto_8127 ) ( AVAILABLE ?auto_8124 ) ( SURFACE-AT ?auto_8097 ?auto_8127 ) ( ON ?auto_8097 ?auto_8129 ) ( CLEAR ?auto_8097 ) ( not ( = ?auto_8099 ?auto_8097 ) ) ( not ( = ?auto_8099 ?auto_8129 ) ) ( not ( = ?auto_8097 ?auto_8129 ) ) ( not ( = ?auto_8103 ?auto_8124 ) ) ( IS-CRATE ?auto_8099 ) ( not ( = ?auto_8121 ?auto_8105 ) ) ( HOIST-AT ?auto_8115 ?auto_8121 ) ( SURFACE-AT ?auto_8099 ?auto_8121 ) ( ON ?auto_8099 ?auto_8118 ) ( CLEAR ?auto_8099 ) ( not ( = ?auto_8096 ?auto_8099 ) ) ( not ( = ?auto_8096 ?auto_8118 ) ) ( not ( = ?auto_8099 ?auto_8118 ) ) ( not ( = ?auto_8103 ?auto_8115 ) ) ( IS-CRATE ?auto_8096 ) ( not ( = ?auto_8109 ?auto_8105 ) ) ( HOIST-AT ?auto_8116 ?auto_8109 ) ( SURFACE-AT ?auto_8096 ?auto_8109 ) ( ON ?auto_8096 ?auto_8131 ) ( CLEAR ?auto_8096 ) ( not ( = ?auto_8095 ?auto_8096 ) ) ( not ( = ?auto_8095 ?auto_8131 ) ) ( not ( = ?auto_8096 ?auto_8131 ) ) ( not ( = ?auto_8103 ?auto_8116 ) ) ( IS-CRATE ?auto_8095 ) ( not ( = ?auto_8130 ?auto_8105 ) ) ( HOIST-AT ?auto_8110 ?auto_8130 ) ( AVAILABLE ?auto_8110 ) ( SURFACE-AT ?auto_8095 ?auto_8130 ) ( ON ?auto_8095 ?auto_8120 ) ( CLEAR ?auto_8095 ) ( not ( = ?auto_8094 ?auto_8095 ) ) ( not ( = ?auto_8094 ?auto_8120 ) ) ( not ( = ?auto_8095 ?auto_8120 ) ) ( not ( = ?auto_8103 ?auto_8110 ) ) ( IS-CRATE ?auto_8094 ) ( AVAILABLE ?auto_8116 ) ( SURFACE-AT ?auto_8094 ?auto_8109 ) ( ON ?auto_8094 ?auto_8114 ) ( CLEAR ?auto_8094 ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8093 ?auto_8114 ) ) ( not ( = ?auto_8094 ?auto_8114 ) ) ( SURFACE-AT ?auto_8092 ?auto_8105 ) ( CLEAR ?auto_8092 ) ( IS-CRATE ?auto_8093 ) ( AVAILABLE ?auto_8103 ) ( AVAILABLE ?auto_8115 ) ( SURFACE-AT ?auto_8093 ?auto_8121 ) ( ON ?auto_8093 ?auto_8123 ) ( CLEAR ?auto_8093 ) ( TRUCK-AT ?auto_8104 ?auto_8105 ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8123 ) ) ( not ( = ?auto_8093 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8092 ?auto_8114 ) ) ( not ( = ?auto_8094 ?auto_8123 ) ) ( not ( = ?auto_8109 ?auto_8121 ) ) ( not ( = ?auto_8116 ?auto_8115 ) ) ( not ( = ?auto_8114 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8095 ) ) ( not ( = ?auto_8092 ?auto_8120 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8120 ) ) ( not ( = ?auto_8095 ?auto_8114 ) ) ( not ( = ?auto_8095 ?auto_8123 ) ) ( not ( = ?auto_8130 ?auto_8109 ) ) ( not ( = ?auto_8130 ?auto_8121 ) ) ( not ( = ?auto_8110 ?auto_8116 ) ) ( not ( = ?auto_8110 ?auto_8115 ) ) ( not ( = ?auto_8120 ?auto_8114 ) ) ( not ( = ?auto_8120 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8096 ) ) ( not ( = ?auto_8092 ?auto_8131 ) ) ( not ( = ?auto_8093 ?auto_8096 ) ) ( not ( = ?auto_8093 ?auto_8131 ) ) ( not ( = ?auto_8094 ?auto_8096 ) ) ( not ( = ?auto_8094 ?auto_8131 ) ) ( not ( = ?auto_8096 ?auto_8120 ) ) ( not ( = ?auto_8096 ?auto_8114 ) ) ( not ( = ?auto_8096 ?auto_8123 ) ) ( not ( = ?auto_8131 ?auto_8120 ) ) ( not ( = ?auto_8131 ?auto_8114 ) ) ( not ( = ?auto_8131 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8099 ) ) ( not ( = ?auto_8092 ?auto_8118 ) ) ( not ( = ?auto_8093 ?auto_8099 ) ) ( not ( = ?auto_8093 ?auto_8118 ) ) ( not ( = ?auto_8094 ?auto_8099 ) ) ( not ( = ?auto_8094 ?auto_8118 ) ) ( not ( = ?auto_8095 ?auto_8099 ) ) ( not ( = ?auto_8095 ?auto_8118 ) ) ( not ( = ?auto_8099 ?auto_8131 ) ) ( not ( = ?auto_8099 ?auto_8120 ) ) ( not ( = ?auto_8099 ?auto_8114 ) ) ( not ( = ?auto_8099 ?auto_8123 ) ) ( not ( = ?auto_8118 ?auto_8131 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8114 ) ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8097 ) ) ( not ( = ?auto_8092 ?auto_8129 ) ) ( not ( = ?auto_8093 ?auto_8097 ) ) ( not ( = ?auto_8093 ?auto_8129 ) ) ( not ( = ?auto_8094 ?auto_8097 ) ) ( not ( = ?auto_8094 ?auto_8129 ) ) ( not ( = ?auto_8095 ?auto_8097 ) ) ( not ( = ?auto_8095 ?auto_8129 ) ) ( not ( = ?auto_8096 ?auto_8097 ) ) ( not ( = ?auto_8096 ?auto_8129 ) ) ( not ( = ?auto_8097 ?auto_8118 ) ) ( not ( = ?auto_8097 ?auto_8131 ) ) ( not ( = ?auto_8097 ?auto_8120 ) ) ( not ( = ?auto_8097 ?auto_8114 ) ) ( not ( = ?auto_8097 ?auto_8123 ) ) ( not ( = ?auto_8127 ?auto_8121 ) ) ( not ( = ?auto_8127 ?auto_8109 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8124 ?auto_8115 ) ) ( not ( = ?auto_8124 ?auto_8116 ) ) ( not ( = ?auto_8124 ?auto_8110 ) ) ( not ( = ?auto_8129 ?auto_8118 ) ) ( not ( = ?auto_8129 ?auto_8131 ) ) ( not ( = ?auto_8129 ?auto_8120 ) ) ( not ( = ?auto_8129 ?auto_8114 ) ) ( not ( = ?auto_8129 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8101 ) ) ( not ( = ?auto_8092 ?auto_8112 ) ) ( not ( = ?auto_8093 ?auto_8101 ) ) ( not ( = ?auto_8093 ?auto_8112 ) ) ( not ( = ?auto_8094 ?auto_8101 ) ) ( not ( = ?auto_8094 ?auto_8112 ) ) ( not ( = ?auto_8095 ?auto_8101 ) ) ( not ( = ?auto_8095 ?auto_8112 ) ) ( not ( = ?auto_8096 ?auto_8101 ) ) ( not ( = ?auto_8096 ?auto_8112 ) ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8099 ?auto_8112 ) ) ( not ( = ?auto_8101 ?auto_8129 ) ) ( not ( = ?auto_8101 ?auto_8118 ) ) ( not ( = ?auto_8101 ?auto_8131 ) ) ( not ( = ?auto_8101 ?auto_8120 ) ) ( not ( = ?auto_8101 ?auto_8114 ) ) ( not ( = ?auto_8101 ?auto_8123 ) ) ( not ( = ?auto_8122 ?auto_8127 ) ) ( not ( = ?auto_8122 ?auto_8121 ) ) ( not ( = ?auto_8122 ?auto_8109 ) ) ( not ( = ?auto_8122 ?auto_8130 ) ) ( not ( = ?auto_8126 ?auto_8124 ) ) ( not ( = ?auto_8126 ?auto_8115 ) ) ( not ( = ?auto_8126 ?auto_8116 ) ) ( not ( = ?auto_8126 ?auto_8110 ) ) ( not ( = ?auto_8112 ?auto_8129 ) ) ( not ( = ?auto_8112 ?auto_8118 ) ) ( not ( = ?auto_8112 ?auto_8131 ) ) ( not ( = ?auto_8112 ?auto_8120 ) ) ( not ( = ?auto_8112 ?auto_8114 ) ) ( not ( = ?auto_8112 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8100 ) ) ( not ( = ?auto_8092 ?auto_8117 ) ) ( not ( = ?auto_8093 ?auto_8100 ) ) ( not ( = ?auto_8093 ?auto_8117 ) ) ( not ( = ?auto_8094 ?auto_8100 ) ) ( not ( = ?auto_8094 ?auto_8117 ) ) ( not ( = ?auto_8095 ?auto_8100 ) ) ( not ( = ?auto_8095 ?auto_8117 ) ) ( not ( = ?auto_8096 ?auto_8100 ) ) ( not ( = ?auto_8096 ?auto_8117 ) ) ( not ( = ?auto_8099 ?auto_8100 ) ) ( not ( = ?auto_8099 ?auto_8117 ) ) ( not ( = ?auto_8097 ?auto_8100 ) ) ( not ( = ?auto_8097 ?auto_8117 ) ) ( not ( = ?auto_8100 ?auto_8112 ) ) ( not ( = ?auto_8100 ?auto_8129 ) ) ( not ( = ?auto_8100 ?auto_8118 ) ) ( not ( = ?auto_8100 ?auto_8131 ) ) ( not ( = ?auto_8100 ?auto_8120 ) ) ( not ( = ?auto_8100 ?auto_8114 ) ) ( not ( = ?auto_8100 ?auto_8123 ) ) ( not ( = ?auto_8113 ?auto_8122 ) ) ( not ( = ?auto_8113 ?auto_8127 ) ) ( not ( = ?auto_8113 ?auto_8121 ) ) ( not ( = ?auto_8113 ?auto_8109 ) ) ( not ( = ?auto_8113 ?auto_8130 ) ) ( not ( = ?auto_8111 ?auto_8126 ) ) ( not ( = ?auto_8111 ?auto_8124 ) ) ( not ( = ?auto_8111 ?auto_8115 ) ) ( not ( = ?auto_8111 ?auto_8116 ) ) ( not ( = ?auto_8111 ?auto_8110 ) ) ( not ( = ?auto_8117 ?auto_8112 ) ) ( not ( = ?auto_8117 ?auto_8129 ) ) ( not ( = ?auto_8117 ?auto_8118 ) ) ( not ( = ?auto_8117 ?auto_8131 ) ) ( not ( = ?auto_8117 ?auto_8120 ) ) ( not ( = ?auto_8117 ?auto_8114 ) ) ( not ( = ?auto_8117 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8098 ) ) ( not ( = ?auto_8092 ?auto_8119 ) ) ( not ( = ?auto_8093 ?auto_8098 ) ) ( not ( = ?auto_8093 ?auto_8119 ) ) ( not ( = ?auto_8094 ?auto_8098 ) ) ( not ( = ?auto_8094 ?auto_8119 ) ) ( not ( = ?auto_8095 ?auto_8098 ) ) ( not ( = ?auto_8095 ?auto_8119 ) ) ( not ( = ?auto_8096 ?auto_8098 ) ) ( not ( = ?auto_8096 ?auto_8119 ) ) ( not ( = ?auto_8099 ?auto_8098 ) ) ( not ( = ?auto_8099 ?auto_8119 ) ) ( not ( = ?auto_8097 ?auto_8098 ) ) ( not ( = ?auto_8097 ?auto_8119 ) ) ( not ( = ?auto_8101 ?auto_8098 ) ) ( not ( = ?auto_8101 ?auto_8119 ) ) ( not ( = ?auto_8098 ?auto_8117 ) ) ( not ( = ?auto_8098 ?auto_8112 ) ) ( not ( = ?auto_8098 ?auto_8129 ) ) ( not ( = ?auto_8098 ?auto_8118 ) ) ( not ( = ?auto_8098 ?auto_8131 ) ) ( not ( = ?auto_8098 ?auto_8120 ) ) ( not ( = ?auto_8098 ?auto_8114 ) ) ( not ( = ?auto_8098 ?auto_8123 ) ) ( not ( = ?auto_8128 ?auto_8113 ) ) ( not ( = ?auto_8128 ?auto_8122 ) ) ( not ( = ?auto_8128 ?auto_8127 ) ) ( not ( = ?auto_8128 ?auto_8121 ) ) ( not ( = ?auto_8128 ?auto_8109 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8125 ?auto_8111 ) ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8125 ?auto_8124 ) ) ( not ( = ?auto_8125 ?auto_8115 ) ) ( not ( = ?auto_8125 ?auto_8116 ) ) ( not ( = ?auto_8125 ?auto_8110 ) ) ( not ( = ?auto_8119 ?auto_8117 ) ) ( not ( = ?auto_8119 ?auto_8112 ) ) ( not ( = ?auto_8119 ?auto_8129 ) ) ( not ( = ?auto_8119 ?auto_8118 ) ) ( not ( = ?auto_8119 ?auto_8131 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8114 ) ) ( not ( = ?auto_8119 ?auto_8123 ) ) ( not ( = ?auto_8092 ?auto_8102 ) ) ( not ( = ?auto_8092 ?auto_8106 ) ) ( not ( = ?auto_8093 ?auto_8102 ) ) ( not ( = ?auto_8093 ?auto_8106 ) ) ( not ( = ?auto_8094 ?auto_8102 ) ) ( not ( = ?auto_8094 ?auto_8106 ) ) ( not ( = ?auto_8095 ?auto_8102 ) ) ( not ( = ?auto_8095 ?auto_8106 ) ) ( not ( = ?auto_8096 ?auto_8102 ) ) ( not ( = ?auto_8096 ?auto_8106 ) ) ( not ( = ?auto_8099 ?auto_8102 ) ) ( not ( = ?auto_8099 ?auto_8106 ) ) ( not ( = ?auto_8097 ?auto_8102 ) ) ( not ( = ?auto_8097 ?auto_8106 ) ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( not ( = ?auto_8101 ?auto_8106 ) ) ( not ( = ?auto_8100 ?auto_8102 ) ) ( not ( = ?auto_8100 ?auto_8106 ) ) ( not ( = ?auto_8102 ?auto_8119 ) ) ( not ( = ?auto_8102 ?auto_8117 ) ) ( not ( = ?auto_8102 ?auto_8112 ) ) ( not ( = ?auto_8102 ?auto_8129 ) ) ( not ( = ?auto_8102 ?auto_8118 ) ) ( not ( = ?auto_8102 ?auto_8131 ) ) ( not ( = ?auto_8102 ?auto_8120 ) ) ( not ( = ?auto_8102 ?auto_8114 ) ) ( not ( = ?auto_8102 ?auto_8123 ) ) ( not ( = ?auto_8108 ?auto_8128 ) ) ( not ( = ?auto_8108 ?auto_8113 ) ) ( not ( = ?auto_8108 ?auto_8122 ) ) ( not ( = ?auto_8108 ?auto_8127 ) ) ( not ( = ?auto_8108 ?auto_8121 ) ) ( not ( = ?auto_8108 ?auto_8109 ) ) ( not ( = ?auto_8108 ?auto_8130 ) ) ( not ( = ?auto_8107 ?auto_8125 ) ) ( not ( = ?auto_8107 ?auto_8111 ) ) ( not ( = ?auto_8107 ?auto_8126 ) ) ( not ( = ?auto_8107 ?auto_8124 ) ) ( not ( = ?auto_8107 ?auto_8115 ) ) ( not ( = ?auto_8107 ?auto_8116 ) ) ( not ( = ?auto_8107 ?auto_8110 ) ) ( not ( = ?auto_8106 ?auto_8119 ) ) ( not ( = ?auto_8106 ?auto_8117 ) ) ( not ( = ?auto_8106 ?auto_8112 ) ) ( not ( = ?auto_8106 ?auto_8129 ) ) ( not ( = ?auto_8106 ?auto_8118 ) ) ( not ( = ?auto_8106 ?auto_8131 ) ) ( not ( = ?auto_8106 ?auto_8120 ) ) ( not ( = ?auto_8106 ?auto_8114 ) ) ( not ( = ?auto_8106 ?auto_8123 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8092 ?auto_8093 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8099 ?auto_8097 ?auto_8101 ?auto_8100 ?auto_8098 )
      ( MAKE-1CRATE ?auto_8098 ?auto_8102 )
      ( MAKE-10CRATE-VERIFY ?auto_8092 ?auto_8093 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8099 ?auto_8097 ?auto_8101 ?auto_8100 ?auto_8098 ?auto_8102 ) )
  )

)

