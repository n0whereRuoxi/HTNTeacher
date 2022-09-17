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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7732 - SURFACE
      ?auto_7733 - SURFACE
    )
    :vars
    (
      ?auto_7734 - HOIST
      ?auto_7735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7734 ?auto_7735 ) ( SURFACE-AT ?auto_7732 ?auto_7735 ) ( CLEAR ?auto_7732 ) ( LIFTING ?auto_7734 ?auto_7733 ) ( IS-CRATE ?auto_7733 ) ( not ( = ?auto_7732 ?auto_7733 ) ) )
    :subtasks
    ( ( !DROP ?auto_7734 ?auto_7733 ?auto_7732 ?auto_7735 )
      ( MAKE-1CRATE-VERIFY ?auto_7732 ?auto_7733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7736 - SURFACE
      ?auto_7737 - SURFACE
    )
    :vars
    (
      ?auto_7739 - HOIST
      ?auto_7738 - PLACE
      ?auto_7740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7739 ?auto_7738 ) ( SURFACE-AT ?auto_7736 ?auto_7738 ) ( CLEAR ?auto_7736 ) ( IS-CRATE ?auto_7737 ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( TRUCK-AT ?auto_7740 ?auto_7738 ) ( AVAILABLE ?auto_7739 ) ( IN ?auto_7737 ?auto_7740 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7739 ?auto_7737 ?auto_7740 ?auto_7738 )
      ( MAKE-1CRATE ?auto_7736 ?auto_7737 )
      ( MAKE-1CRATE-VERIFY ?auto_7736 ?auto_7737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7741 - SURFACE
      ?auto_7742 - SURFACE
    )
    :vars
    (
      ?auto_7743 - HOIST
      ?auto_7745 - PLACE
      ?auto_7744 - TRUCK
      ?auto_7746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7743 ?auto_7745 ) ( SURFACE-AT ?auto_7741 ?auto_7745 ) ( CLEAR ?auto_7741 ) ( IS-CRATE ?auto_7742 ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( AVAILABLE ?auto_7743 ) ( IN ?auto_7742 ?auto_7744 ) ( TRUCK-AT ?auto_7744 ?auto_7746 ) ( not ( = ?auto_7746 ?auto_7745 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7744 ?auto_7746 ?auto_7745 )
      ( MAKE-1CRATE ?auto_7741 ?auto_7742 )
      ( MAKE-1CRATE-VERIFY ?auto_7741 ?auto_7742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7747 - SURFACE
      ?auto_7748 - SURFACE
    )
    :vars
    (
      ?auto_7752 - HOIST
      ?auto_7749 - PLACE
      ?auto_7750 - TRUCK
      ?auto_7751 - PLACE
      ?auto_7753 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7752 ?auto_7749 ) ( SURFACE-AT ?auto_7747 ?auto_7749 ) ( CLEAR ?auto_7747 ) ( IS-CRATE ?auto_7748 ) ( not ( = ?auto_7747 ?auto_7748 ) ) ( AVAILABLE ?auto_7752 ) ( TRUCK-AT ?auto_7750 ?auto_7751 ) ( not ( = ?auto_7751 ?auto_7749 ) ) ( HOIST-AT ?auto_7753 ?auto_7751 ) ( LIFTING ?auto_7753 ?auto_7748 ) ( not ( = ?auto_7752 ?auto_7753 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7753 ?auto_7748 ?auto_7750 ?auto_7751 )
      ( MAKE-1CRATE ?auto_7747 ?auto_7748 )
      ( MAKE-1CRATE-VERIFY ?auto_7747 ?auto_7748 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7754 - SURFACE
      ?auto_7755 - SURFACE
    )
    :vars
    (
      ?auto_7757 - HOIST
      ?auto_7760 - PLACE
      ?auto_7759 - TRUCK
      ?auto_7756 - PLACE
      ?auto_7758 - HOIST
      ?auto_7761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7757 ?auto_7760 ) ( SURFACE-AT ?auto_7754 ?auto_7760 ) ( CLEAR ?auto_7754 ) ( IS-CRATE ?auto_7755 ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( AVAILABLE ?auto_7757 ) ( TRUCK-AT ?auto_7759 ?auto_7756 ) ( not ( = ?auto_7756 ?auto_7760 ) ) ( HOIST-AT ?auto_7758 ?auto_7756 ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( AVAILABLE ?auto_7758 ) ( SURFACE-AT ?auto_7755 ?auto_7756 ) ( ON ?auto_7755 ?auto_7761 ) ( CLEAR ?auto_7755 ) ( not ( = ?auto_7754 ?auto_7761 ) ) ( not ( = ?auto_7755 ?auto_7761 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7758 ?auto_7755 ?auto_7761 ?auto_7756 )
      ( MAKE-1CRATE ?auto_7754 ?auto_7755 )
      ( MAKE-1CRATE-VERIFY ?auto_7754 ?auto_7755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7762 - SURFACE
      ?auto_7763 - SURFACE
    )
    :vars
    (
      ?auto_7766 - HOIST
      ?auto_7767 - PLACE
      ?auto_7765 - PLACE
      ?auto_7764 - HOIST
      ?auto_7769 - SURFACE
      ?auto_7768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7766 ?auto_7767 ) ( SURFACE-AT ?auto_7762 ?auto_7767 ) ( CLEAR ?auto_7762 ) ( IS-CRATE ?auto_7763 ) ( not ( = ?auto_7762 ?auto_7763 ) ) ( AVAILABLE ?auto_7766 ) ( not ( = ?auto_7765 ?auto_7767 ) ) ( HOIST-AT ?auto_7764 ?auto_7765 ) ( not ( = ?auto_7766 ?auto_7764 ) ) ( AVAILABLE ?auto_7764 ) ( SURFACE-AT ?auto_7763 ?auto_7765 ) ( ON ?auto_7763 ?auto_7769 ) ( CLEAR ?auto_7763 ) ( not ( = ?auto_7762 ?auto_7769 ) ) ( not ( = ?auto_7763 ?auto_7769 ) ) ( TRUCK-AT ?auto_7768 ?auto_7767 ) )
    :subtasks
    ( ( !DRIVE ?auto_7768 ?auto_7767 ?auto_7765 )
      ( MAKE-1CRATE ?auto_7762 ?auto_7763 )
      ( MAKE-1CRATE-VERIFY ?auto_7762 ?auto_7763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7779 - SURFACE
      ?auto_7780 - SURFACE
      ?auto_7781 - SURFACE
    )
    :vars
    (
      ?auto_7783 - HOIST
      ?auto_7782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7783 ?auto_7782 ) ( SURFACE-AT ?auto_7780 ?auto_7782 ) ( CLEAR ?auto_7780 ) ( LIFTING ?auto_7783 ?auto_7781 ) ( IS-CRATE ?auto_7781 ) ( not ( = ?auto_7780 ?auto_7781 ) ) ( ON ?auto_7780 ?auto_7779 ) ( not ( = ?auto_7779 ?auto_7780 ) ) ( not ( = ?auto_7779 ?auto_7781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7780 ?auto_7781 )
      ( MAKE-2CRATE-VERIFY ?auto_7779 ?auto_7780 ?auto_7781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7789 - SURFACE
      ?auto_7790 - SURFACE
      ?auto_7791 - SURFACE
    )
    :vars
    (
      ?auto_7793 - HOIST
      ?auto_7794 - PLACE
      ?auto_7792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7793 ?auto_7794 ) ( SURFACE-AT ?auto_7790 ?auto_7794 ) ( CLEAR ?auto_7790 ) ( IS-CRATE ?auto_7791 ) ( not ( = ?auto_7790 ?auto_7791 ) ) ( TRUCK-AT ?auto_7792 ?auto_7794 ) ( AVAILABLE ?auto_7793 ) ( IN ?auto_7791 ?auto_7792 ) ( ON ?auto_7790 ?auto_7789 ) ( not ( = ?auto_7789 ?auto_7790 ) ) ( not ( = ?auto_7789 ?auto_7791 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7790 ?auto_7791 )
      ( MAKE-2CRATE-VERIFY ?auto_7789 ?auto_7790 ?auto_7791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7795 - SURFACE
      ?auto_7796 - SURFACE
    )
    :vars
    (
      ?auto_7800 - HOIST
      ?auto_7798 - PLACE
      ?auto_7797 - TRUCK
      ?auto_7799 - SURFACE
      ?auto_7801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7800 ?auto_7798 ) ( SURFACE-AT ?auto_7795 ?auto_7798 ) ( CLEAR ?auto_7795 ) ( IS-CRATE ?auto_7796 ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( AVAILABLE ?auto_7800 ) ( IN ?auto_7796 ?auto_7797 ) ( ON ?auto_7795 ?auto_7799 ) ( not ( = ?auto_7799 ?auto_7795 ) ) ( not ( = ?auto_7799 ?auto_7796 ) ) ( TRUCK-AT ?auto_7797 ?auto_7801 ) ( not ( = ?auto_7801 ?auto_7798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7797 ?auto_7801 ?auto_7798 )
      ( MAKE-2CRATE ?auto_7799 ?auto_7795 ?auto_7796 )
      ( MAKE-1CRATE-VERIFY ?auto_7795 ?auto_7796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7802 - SURFACE
      ?auto_7803 - SURFACE
      ?auto_7804 - SURFACE
    )
    :vars
    (
      ?auto_7806 - HOIST
      ?auto_7807 - PLACE
      ?auto_7805 - TRUCK
      ?auto_7808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7806 ?auto_7807 ) ( SURFACE-AT ?auto_7803 ?auto_7807 ) ( CLEAR ?auto_7803 ) ( IS-CRATE ?auto_7804 ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( AVAILABLE ?auto_7806 ) ( IN ?auto_7804 ?auto_7805 ) ( ON ?auto_7803 ?auto_7802 ) ( not ( = ?auto_7802 ?auto_7803 ) ) ( not ( = ?auto_7802 ?auto_7804 ) ) ( TRUCK-AT ?auto_7805 ?auto_7808 ) ( not ( = ?auto_7808 ?auto_7807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7803 ?auto_7804 )
      ( MAKE-2CRATE-VERIFY ?auto_7802 ?auto_7803 ?auto_7804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7809 - SURFACE
      ?auto_7810 - SURFACE
    )
    :vars
    (
      ?auto_7812 - HOIST
      ?auto_7814 - PLACE
      ?auto_7811 - SURFACE
      ?auto_7813 - TRUCK
      ?auto_7815 - PLACE
      ?auto_7816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7812 ?auto_7814 ) ( SURFACE-AT ?auto_7809 ?auto_7814 ) ( CLEAR ?auto_7809 ) ( IS-CRATE ?auto_7810 ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( AVAILABLE ?auto_7812 ) ( ON ?auto_7809 ?auto_7811 ) ( not ( = ?auto_7811 ?auto_7809 ) ) ( not ( = ?auto_7811 ?auto_7810 ) ) ( TRUCK-AT ?auto_7813 ?auto_7815 ) ( not ( = ?auto_7815 ?auto_7814 ) ) ( HOIST-AT ?auto_7816 ?auto_7815 ) ( LIFTING ?auto_7816 ?auto_7810 ) ( not ( = ?auto_7812 ?auto_7816 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7816 ?auto_7810 ?auto_7813 ?auto_7815 )
      ( MAKE-2CRATE ?auto_7811 ?auto_7809 ?auto_7810 )
      ( MAKE-1CRATE-VERIFY ?auto_7809 ?auto_7810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7817 - SURFACE
      ?auto_7818 - SURFACE
      ?auto_7819 - SURFACE
    )
    :vars
    (
      ?auto_7822 - HOIST
      ?auto_7823 - PLACE
      ?auto_7820 - TRUCK
      ?auto_7824 - PLACE
      ?auto_7821 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7822 ?auto_7823 ) ( SURFACE-AT ?auto_7818 ?auto_7823 ) ( CLEAR ?auto_7818 ) ( IS-CRATE ?auto_7819 ) ( not ( = ?auto_7818 ?auto_7819 ) ) ( AVAILABLE ?auto_7822 ) ( ON ?auto_7818 ?auto_7817 ) ( not ( = ?auto_7817 ?auto_7818 ) ) ( not ( = ?auto_7817 ?auto_7819 ) ) ( TRUCK-AT ?auto_7820 ?auto_7824 ) ( not ( = ?auto_7824 ?auto_7823 ) ) ( HOIST-AT ?auto_7821 ?auto_7824 ) ( LIFTING ?auto_7821 ?auto_7819 ) ( not ( = ?auto_7822 ?auto_7821 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7818 ?auto_7819 )
      ( MAKE-2CRATE-VERIFY ?auto_7817 ?auto_7818 ?auto_7819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7825 - SURFACE
      ?auto_7826 - SURFACE
    )
    :vars
    (
      ?auto_7827 - HOIST
      ?auto_7832 - PLACE
      ?auto_7830 - SURFACE
      ?auto_7829 - TRUCK
      ?auto_7828 - PLACE
      ?auto_7831 - HOIST
      ?auto_7833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7827 ?auto_7832 ) ( SURFACE-AT ?auto_7825 ?auto_7832 ) ( CLEAR ?auto_7825 ) ( IS-CRATE ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( AVAILABLE ?auto_7827 ) ( ON ?auto_7825 ?auto_7830 ) ( not ( = ?auto_7830 ?auto_7825 ) ) ( not ( = ?auto_7830 ?auto_7826 ) ) ( TRUCK-AT ?auto_7829 ?auto_7828 ) ( not ( = ?auto_7828 ?auto_7832 ) ) ( HOIST-AT ?auto_7831 ?auto_7828 ) ( not ( = ?auto_7827 ?auto_7831 ) ) ( AVAILABLE ?auto_7831 ) ( SURFACE-AT ?auto_7826 ?auto_7828 ) ( ON ?auto_7826 ?auto_7833 ) ( CLEAR ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7833 ) ) ( not ( = ?auto_7826 ?auto_7833 ) ) ( not ( = ?auto_7830 ?auto_7833 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7831 ?auto_7826 ?auto_7833 ?auto_7828 )
      ( MAKE-2CRATE ?auto_7830 ?auto_7825 ?auto_7826 )
      ( MAKE-1CRATE-VERIFY ?auto_7825 ?auto_7826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7834 - SURFACE
      ?auto_7835 - SURFACE
      ?auto_7836 - SURFACE
    )
    :vars
    (
      ?auto_7842 - HOIST
      ?auto_7838 - PLACE
      ?auto_7837 - TRUCK
      ?auto_7841 - PLACE
      ?auto_7839 - HOIST
      ?auto_7840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7842 ?auto_7838 ) ( SURFACE-AT ?auto_7835 ?auto_7838 ) ( CLEAR ?auto_7835 ) ( IS-CRATE ?auto_7836 ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( AVAILABLE ?auto_7842 ) ( ON ?auto_7835 ?auto_7834 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( TRUCK-AT ?auto_7837 ?auto_7841 ) ( not ( = ?auto_7841 ?auto_7838 ) ) ( HOIST-AT ?auto_7839 ?auto_7841 ) ( not ( = ?auto_7842 ?auto_7839 ) ) ( AVAILABLE ?auto_7839 ) ( SURFACE-AT ?auto_7836 ?auto_7841 ) ( ON ?auto_7836 ?auto_7840 ) ( CLEAR ?auto_7836 ) ( not ( = ?auto_7835 ?auto_7840 ) ) ( not ( = ?auto_7836 ?auto_7840 ) ) ( not ( = ?auto_7834 ?auto_7840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7835 ?auto_7836 )
      ( MAKE-2CRATE-VERIFY ?auto_7834 ?auto_7835 ?auto_7836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7843 - SURFACE
      ?auto_7844 - SURFACE
    )
    :vars
    (
      ?auto_7846 - HOIST
      ?auto_7848 - PLACE
      ?auto_7845 - SURFACE
      ?auto_7851 - PLACE
      ?auto_7850 - HOIST
      ?auto_7847 - SURFACE
      ?auto_7849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7846 ?auto_7848 ) ( SURFACE-AT ?auto_7843 ?auto_7848 ) ( CLEAR ?auto_7843 ) ( IS-CRATE ?auto_7844 ) ( not ( = ?auto_7843 ?auto_7844 ) ) ( AVAILABLE ?auto_7846 ) ( ON ?auto_7843 ?auto_7845 ) ( not ( = ?auto_7845 ?auto_7843 ) ) ( not ( = ?auto_7845 ?auto_7844 ) ) ( not ( = ?auto_7851 ?auto_7848 ) ) ( HOIST-AT ?auto_7850 ?auto_7851 ) ( not ( = ?auto_7846 ?auto_7850 ) ) ( AVAILABLE ?auto_7850 ) ( SURFACE-AT ?auto_7844 ?auto_7851 ) ( ON ?auto_7844 ?auto_7847 ) ( CLEAR ?auto_7844 ) ( not ( = ?auto_7843 ?auto_7847 ) ) ( not ( = ?auto_7844 ?auto_7847 ) ) ( not ( = ?auto_7845 ?auto_7847 ) ) ( TRUCK-AT ?auto_7849 ?auto_7848 ) )
    :subtasks
    ( ( !DRIVE ?auto_7849 ?auto_7848 ?auto_7851 )
      ( MAKE-2CRATE ?auto_7845 ?auto_7843 ?auto_7844 )
      ( MAKE-1CRATE-VERIFY ?auto_7843 ?auto_7844 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7852 - SURFACE
      ?auto_7853 - SURFACE
      ?auto_7854 - SURFACE
    )
    :vars
    (
      ?auto_7856 - HOIST
      ?auto_7860 - PLACE
      ?auto_7857 - PLACE
      ?auto_7855 - HOIST
      ?auto_7858 - SURFACE
      ?auto_7859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7856 ?auto_7860 ) ( SURFACE-AT ?auto_7853 ?auto_7860 ) ( CLEAR ?auto_7853 ) ( IS-CRATE ?auto_7854 ) ( not ( = ?auto_7853 ?auto_7854 ) ) ( AVAILABLE ?auto_7856 ) ( ON ?auto_7853 ?auto_7852 ) ( not ( = ?auto_7852 ?auto_7853 ) ) ( not ( = ?auto_7852 ?auto_7854 ) ) ( not ( = ?auto_7857 ?auto_7860 ) ) ( HOIST-AT ?auto_7855 ?auto_7857 ) ( not ( = ?auto_7856 ?auto_7855 ) ) ( AVAILABLE ?auto_7855 ) ( SURFACE-AT ?auto_7854 ?auto_7857 ) ( ON ?auto_7854 ?auto_7858 ) ( CLEAR ?auto_7854 ) ( not ( = ?auto_7853 ?auto_7858 ) ) ( not ( = ?auto_7854 ?auto_7858 ) ) ( not ( = ?auto_7852 ?auto_7858 ) ) ( TRUCK-AT ?auto_7859 ?auto_7860 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7853 ?auto_7854 )
      ( MAKE-2CRATE-VERIFY ?auto_7852 ?auto_7853 ?auto_7854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7861 - SURFACE
      ?auto_7862 - SURFACE
    )
    :vars
    (
      ?auto_7867 - HOIST
      ?auto_7864 - PLACE
      ?auto_7866 - SURFACE
      ?auto_7869 - PLACE
      ?auto_7868 - HOIST
      ?auto_7865 - SURFACE
      ?auto_7863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7867 ?auto_7864 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7866 ?auto_7861 ) ) ( not ( = ?auto_7866 ?auto_7862 ) ) ( not ( = ?auto_7869 ?auto_7864 ) ) ( HOIST-AT ?auto_7868 ?auto_7869 ) ( not ( = ?auto_7867 ?auto_7868 ) ) ( AVAILABLE ?auto_7868 ) ( SURFACE-AT ?auto_7862 ?auto_7869 ) ( ON ?auto_7862 ?auto_7865 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7865 ) ) ( not ( = ?auto_7862 ?auto_7865 ) ) ( not ( = ?auto_7866 ?auto_7865 ) ) ( TRUCK-AT ?auto_7863 ?auto_7864 ) ( SURFACE-AT ?auto_7866 ?auto_7864 ) ( CLEAR ?auto_7866 ) ( LIFTING ?auto_7867 ?auto_7861 ) ( IS-CRATE ?auto_7861 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7866 ?auto_7861 )
      ( MAKE-2CRATE ?auto_7866 ?auto_7861 ?auto_7862 )
      ( MAKE-1CRATE-VERIFY ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7870 - SURFACE
      ?auto_7871 - SURFACE
      ?auto_7872 - SURFACE
    )
    :vars
    (
      ?auto_7878 - HOIST
      ?auto_7875 - PLACE
      ?auto_7874 - PLACE
      ?auto_7873 - HOIST
      ?auto_7876 - SURFACE
      ?auto_7877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7878 ?auto_7875 ) ( IS-CRATE ?auto_7872 ) ( not ( = ?auto_7871 ?auto_7872 ) ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( not ( = ?auto_7870 ?auto_7872 ) ) ( not ( = ?auto_7874 ?auto_7875 ) ) ( HOIST-AT ?auto_7873 ?auto_7874 ) ( not ( = ?auto_7878 ?auto_7873 ) ) ( AVAILABLE ?auto_7873 ) ( SURFACE-AT ?auto_7872 ?auto_7874 ) ( ON ?auto_7872 ?auto_7876 ) ( CLEAR ?auto_7872 ) ( not ( = ?auto_7871 ?auto_7876 ) ) ( not ( = ?auto_7872 ?auto_7876 ) ) ( not ( = ?auto_7870 ?auto_7876 ) ) ( TRUCK-AT ?auto_7877 ?auto_7875 ) ( SURFACE-AT ?auto_7870 ?auto_7875 ) ( CLEAR ?auto_7870 ) ( LIFTING ?auto_7878 ?auto_7871 ) ( IS-CRATE ?auto_7871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7871 ?auto_7872 )
      ( MAKE-2CRATE-VERIFY ?auto_7870 ?auto_7871 ?auto_7872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7879 - SURFACE
      ?auto_7880 - SURFACE
    )
    :vars
    (
      ?auto_7882 - HOIST
      ?auto_7887 - PLACE
      ?auto_7883 - SURFACE
      ?auto_7886 - PLACE
      ?auto_7881 - HOIST
      ?auto_7884 - SURFACE
      ?auto_7885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7882 ?auto_7887 ) ( IS-CRATE ?auto_7880 ) ( not ( = ?auto_7879 ?auto_7880 ) ) ( not ( = ?auto_7883 ?auto_7879 ) ) ( not ( = ?auto_7883 ?auto_7880 ) ) ( not ( = ?auto_7886 ?auto_7887 ) ) ( HOIST-AT ?auto_7881 ?auto_7886 ) ( not ( = ?auto_7882 ?auto_7881 ) ) ( AVAILABLE ?auto_7881 ) ( SURFACE-AT ?auto_7880 ?auto_7886 ) ( ON ?auto_7880 ?auto_7884 ) ( CLEAR ?auto_7880 ) ( not ( = ?auto_7879 ?auto_7884 ) ) ( not ( = ?auto_7880 ?auto_7884 ) ) ( not ( = ?auto_7883 ?auto_7884 ) ) ( TRUCK-AT ?auto_7885 ?auto_7887 ) ( SURFACE-AT ?auto_7883 ?auto_7887 ) ( CLEAR ?auto_7883 ) ( IS-CRATE ?auto_7879 ) ( AVAILABLE ?auto_7882 ) ( IN ?auto_7879 ?auto_7885 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7882 ?auto_7879 ?auto_7885 ?auto_7887 )
      ( MAKE-2CRATE ?auto_7883 ?auto_7879 ?auto_7880 )
      ( MAKE-1CRATE-VERIFY ?auto_7879 ?auto_7880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7888 - SURFACE
      ?auto_7889 - SURFACE
      ?auto_7890 - SURFACE
    )
    :vars
    (
      ?auto_7894 - HOIST
      ?auto_7893 - PLACE
      ?auto_7896 - PLACE
      ?auto_7895 - HOIST
      ?auto_7891 - SURFACE
      ?auto_7892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7894 ?auto_7893 ) ( IS-CRATE ?auto_7890 ) ( not ( = ?auto_7889 ?auto_7890 ) ) ( not ( = ?auto_7888 ?auto_7889 ) ) ( not ( = ?auto_7888 ?auto_7890 ) ) ( not ( = ?auto_7896 ?auto_7893 ) ) ( HOIST-AT ?auto_7895 ?auto_7896 ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( AVAILABLE ?auto_7895 ) ( SURFACE-AT ?auto_7890 ?auto_7896 ) ( ON ?auto_7890 ?auto_7891 ) ( CLEAR ?auto_7890 ) ( not ( = ?auto_7889 ?auto_7891 ) ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( not ( = ?auto_7888 ?auto_7891 ) ) ( TRUCK-AT ?auto_7892 ?auto_7893 ) ( SURFACE-AT ?auto_7888 ?auto_7893 ) ( CLEAR ?auto_7888 ) ( IS-CRATE ?auto_7889 ) ( AVAILABLE ?auto_7894 ) ( IN ?auto_7889 ?auto_7892 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7889 ?auto_7890 )
      ( MAKE-2CRATE-VERIFY ?auto_7888 ?auto_7889 ?auto_7890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7933 - SURFACE
      ?auto_7934 - SURFACE
    )
    :vars
    (
      ?auto_7937 - HOIST
      ?auto_7935 - PLACE
      ?auto_7940 - SURFACE
      ?auto_7941 - PLACE
      ?auto_7938 - HOIST
      ?auto_7936 - SURFACE
      ?auto_7939 - TRUCK
      ?auto_7942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7937 ?auto_7935 ) ( SURFACE-AT ?auto_7933 ?auto_7935 ) ( CLEAR ?auto_7933 ) ( IS-CRATE ?auto_7934 ) ( not ( = ?auto_7933 ?auto_7934 ) ) ( AVAILABLE ?auto_7937 ) ( ON ?auto_7933 ?auto_7940 ) ( not ( = ?auto_7940 ?auto_7933 ) ) ( not ( = ?auto_7940 ?auto_7934 ) ) ( not ( = ?auto_7941 ?auto_7935 ) ) ( HOIST-AT ?auto_7938 ?auto_7941 ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( AVAILABLE ?auto_7938 ) ( SURFACE-AT ?auto_7934 ?auto_7941 ) ( ON ?auto_7934 ?auto_7936 ) ( CLEAR ?auto_7934 ) ( not ( = ?auto_7933 ?auto_7936 ) ) ( not ( = ?auto_7934 ?auto_7936 ) ) ( not ( = ?auto_7940 ?auto_7936 ) ) ( TRUCK-AT ?auto_7939 ?auto_7942 ) ( not ( = ?auto_7942 ?auto_7935 ) ) ( not ( = ?auto_7941 ?auto_7942 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7939 ?auto_7942 ?auto_7935 )
      ( MAKE-1CRATE ?auto_7933 ?auto_7934 )
      ( MAKE-1CRATE-VERIFY ?auto_7933 ?auto_7934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7973 - SURFACE
      ?auto_7974 - SURFACE
      ?auto_7975 - SURFACE
      ?auto_7972 - SURFACE
    )
    :vars
    (
      ?auto_7977 - HOIST
      ?auto_7976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7977 ?auto_7976 ) ( SURFACE-AT ?auto_7975 ?auto_7976 ) ( CLEAR ?auto_7975 ) ( LIFTING ?auto_7977 ?auto_7972 ) ( IS-CRATE ?auto_7972 ) ( not ( = ?auto_7975 ?auto_7972 ) ) ( ON ?auto_7974 ?auto_7973 ) ( ON ?auto_7975 ?auto_7974 ) ( not ( = ?auto_7973 ?auto_7974 ) ) ( not ( = ?auto_7973 ?auto_7975 ) ) ( not ( = ?auto_7973 ?auto_7972 ) ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( not ( = ?auto_7974 ?auto_7972 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7975 ?auto_7972 )
      ( MAKE-3CRATE-VERIFY ?auto_7973 ?auto_7974 ?auto_7975 ?auto_7972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7990 - SURFACE
      ?auto_7991 - SURFACE
      ?auto_7992 - SURFACE
      ?auto_7989 - SURFACE
    )
    :vars
    (
      ?auto_7994 - HOIST
      ?auto_7993 - PLACE
      ?auto_7995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7994 ?auto_7993 ) ( SURFACE-AT ?auto_7992 ?auto_7993 ) ( CLEAR ?auto_7992 ) ( IS-CRATE ?auto_7989 ) ( not ( = ?auto_7992 ?auto_7989 ) ) ( TRUCK-AT ?auto_7995 ?auto_7993 ) ( AVAILABLE ?auto_7994 ) ( IN ?auto_7989 ?auto_7995 ) ( ON ?auto_7992 ?auto_7991 ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_7989 ) ) ( ON ?auto_7991 ?auto_7990 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_7989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7991 ?auto_7992 ?auto_7989 )
      ( MAKE-3CRATE-VERIFY ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8011 - SURFACE
      ?auto_8012 - SURFACE
      ?auto_8013 - SURFACE
      ?auto_8010 - SURFACE
    )
    :vars
    (
      ?auto_8016 - HOIST
      ?auto_8017 - PLACE
      ?auto_8014 - TRUCK
      ?auto_8015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8016 ?auto_8017 ) ( SURFACE-AT ?auto_8013 ?auto_8017 ) ( CLEAR ?auto_8013 ) ( IS-CRATE ?auto_8010 ) ( not ( = ?auto_8013 ?auto_8010 ) ) ( AVAILABLE ?auto_8016 ) ( IN ?auto_8010 ?auto_8014 ) ( ON ?auto_8013 ?auto_8012 ) ( not ( = ?auto_8012 ?auto_8013 ) ) ( not ( = ?auto_8012 ?auto_8010 ) ) ( TRUCK-AT ?auto_8014 ?auto_8015 ) ( not ( = ?auto_8015 ?auto_8017 ) ) ( ON ?auto_8012 ?auto_8011 ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( not ( = ?auto_8011 ?auto_8010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8012 ?auto_8013 ?auto_8010 )
      ( MAKE-3CRATE-VERIFY ?auto_8011 ?auto_8012 ?auto_8013 ?auto_8010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8035 - SURFACE
      ?auto_8036 - SURFACE
      ?auto_8037 - SURFACE
      ?auto_8034 - SURFACE
    )
    :vars
    (
      ?auto_8040 - HOIST
      ?auto_8039 - PLACE
      ?auto_8041 - TRUCK
      ?auto_8042 - PLACE
      ?auto_8038 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8040 ?auto_8039 ) ( SURFACE-AT ?auto_8037 ?auto_8039 ) ( CLEAR ?auto_8037 ) ( IS-CRATE ?auto_8034 ) ( not ( = ?auto_8037 ?auto_8034 ) ) ( AVAILABLE ?auto_8040 ) ( ON ?auto_8037 ?auto_8036 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8034 ) ) ( TRUCK-AT ?auto_8041 ?auto_8042 ) ( not ( = ?auto_8042 ?auto_8039 ) ) ( HOIST-AT ?auto_8038 ?auto_8042 ) ( LIFTING ?auto_8038 ?auto_8034 ) ( not ( = ?auto_8040 ?auto_8038 ) ) ( ON ?auto_8036 ?auto_8035 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8036 ?auto_8037 ?auto_8034 )
      ( MAKE-3CRATE-VERIFY ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8062 - SURFACE
      ?auto_8063 - SURFACE
      ?auto_8064 - SURFACE
      ?auto_8061 - SURFACE
    )
    :vars
    (
      ?auto_8068 - HOIST
      ?auto_8065 - PLACE
      ?auto_8069 - TRUCK
      ?auto_8066 - PLACE
      ?auto_8067 - HOIST
      ?auto_8070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8068 ?auto_8065 ) ( SURFACE-AT ?auto_8064 ?auto_8065 ) ( CLEAR ?auto_8064 ) ( IS-CRATE ?auto_8061 ) ( not ( = ?auto_8064 ?auto_8061 ) ) ( AVAILABLE ?auto_8068 ) ( ON ?auto_8064 ?auto_8063 ) ( not ( = ?auto_8063 ?auto_8064 ) ) ( not ( = ?auto_8063 ?auto_8061 ) ) ( TRUCK-AT ?auto_8069 ?auto_8066 ) ( not ( = ?auto_8066 ?auto_8065 ) ) ( HOIST-AT ?auto_8067 ?auto_8066 ) ( not ( = ?auto_8068 ?auto_8067 ) ) ( AVAILABLE ?auto_8067 ) ( SURFACE-AT ?auto_8061 ?auto_8066 ) ( ON ?auto_8061 ?auto_8070 ) ( CLEAR ?auto_8061 ) ( not ( = ?auto_8064 ?auto_8070 ) ) ( not ( = ?auto_8061 ?auto_8070 ) ) ( not ( = ?auto_8063 ?auto_8070 ) ) ( ON ?auto_8063 ?auto_8062 ) ( not ( = ?auto_8062 ?auto_8063 ) ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( not ( = ?auto_8062 ?auto_8061 ) ) ( not ( = ?auto_8062 ?auto_8070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8063 ?auto_8064 ?auto_8061 )
      ( MAKE-3CRATE-VERIFY ?auto_8062 ?auto_8063 ?auto_8064 ?auto_8061 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8090 - SURFACE
      ?auto_8091 - SURFACE
      ?auto_8092 - SURFACE
      ?auto_8089 - SURFACE
    )
    :vars
    (
      ?auto_8095 - HOIST
      ?auto_8093 - PLACE
      ?auto_8097 - PLACE
      ?auto_8098 - HOIST
      ?auto_8096 - SURFACE
      ?auto_8094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8095 ?auto_8093 ) ( SURFACE-AT ?auto_8092 ?auto_8093 ) ( CLEAR ?auto_8092 ) ( IS-CRATE ?auto_8089 ) ( not ( = ?auto_8092 ?auto_8089 ) ) ( AVAILABLE ?auto_8095 ) ( ON ?auto_8092 ?auto_8091 ) ( not ( = ?auto_8091 ?auto_8092 ) ) ( not ( = ?auto_8091 ?auto_8089 ) ) ( not ( = ?auto_8097 ?auto_8093 ) ) ( HOIST-AT ?auto_8098 ?auto_8097 ) ( not ( = ?auto_8095 ?auto_8098 ) ) ( AVAILABLE ?auto_8098 ) ( SURFACE-AT ?auto_8089 ?auto_8097 ) ( ON ?auto_8089 ?auto_8096 ) ( CLEAR ?auto_8089 ) ( not ( = ?auto_8092 ?auto_8096 ) ) ( not ( = ?auto_8089 ?auto_8096 ) ) ( not ( = ?auto_8091 ?auto_8096 ) ) ( TRUCK-AT ?auto_8094 ?auto_8093 ) ( ON ?auto_8091 ?auto_8090 ) ( not ( = ?auto_8090 ?auto_8091 ) ) ( not ( = ?auto_8090 ?auto_8092 ) ) ( not ( = ?auto_8090 ?auto_8089 ) ) ( not ( = ?auto_8090 ?auto_8096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8091 ?auto_8092 ?auto_8089 )
      ( MAKE-3CRATE-VERIFY ?auto_8090 ?auto_8091 ?auto_8092 ?auto_8089 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8118 - SURFACE
      ?auto_8119 - SURFACE
      ?auto_8120 - SURFACE
      ?auto_8117 - SURFACE
    )
    :vars
    (
      ?auto_8126 - HOIST
      ?auto_8123 - PLACE
      ?auto_8124 - PLACE
      ?auto_8122 - HOIST
      ?auto_8125 - SURFACE
      ?auto_8121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8126 ?auto_8123 ) ( IS-CRATE ?auto_8117 ) ( not ( = ?auto_8120 ?auto_8117 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8117 ) ) ( not ( = ?auto_8124 ?auto_8123 ) ) ( HOIST-AT ?auto_8122 ?auto_8124 ) ( not ( = ?auto_8126 ?auto_8122 ) ) ( AVAILABLE ?auto_8122 ) ( SURFACE-AT ?auto_8117 ?auto_8124 ) ( ON ?auto_8117 ?auto_8125 ) ( CLEAR ?auto_8117 ) ( not ( = ?auto_8120 ?auto_8125 ) ) ( not ( = ?auto_8117 ?auto_8125 ) ) ( not ( = ?auto_8119 ?auto_8125 ) ) ( TRUCK-AT ?auto_8121 ?auto_8123 ) ( SURFACE-AT ?auto_8119 ?auto_8123 ) ( CLEAR ?auto_8119 ) ( LIFTING ?auto_8126 ?auto_8120 ) ( IS-CRATE ?auto_8120 ) ( ON ?auto_8119 ?auto_8118 ) ( not ( = ?auto_8118 ?auto_8119 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8117 ) ) ( not ( = ?auto_8118 ?auto_8125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8119 ?auto_8120 ?auto_8117 )
      ( MAKE-3CRATE-VERIFY ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8117 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8146 - SURFACE
      ?auto_8147 - SURFACE
      ?auto_8148 - SURFACE
      ?auto_8145 - SURFACE
    )
    :vars
    (
      ?auto_8151 - HOIST
      ?auto_8149 - PLACE
      ?auto_8152 - PLACE
      ?auto_8153 - HOIST
      ?auto_8154 - SURFACE
      ?auto_8150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8151 ?auto_8149 ) ( IS-CRATE ?auto_8145 ) ( not ( = ?auto_8148 ?auto_8145 ) ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( not ( = ?auto_8147 ?auto_8145 ) ) ( not ( = ?auto_8152 ?auto_8149 ) ) ( HOIST-AT ?auto_8153 ?auto_8152 ) ( not ( = ?auto_8151 ?auto_8153 ) ) ( AVAILABLE ?auto_8153 ) ( SURFACE-AT ?auto_8145 ?auto_8152 ) ( ON ?auto_8145 ?auto_8154 ) ( CLEAR ?auto_8145 ) ( not ( = ?auto_8148 ?auto_8154 ) ) ( not ( = ?auto_8145 ?auto_8154 ) ) ( not ( = ?auto_8147 ?auto_8154 ) ) ( TRUCK-AT ?auto_8150 ?auto_8149 ) ( SURFACE-AT ?auto_8147 ?auto_8149 ) ( CLEAR ?auto_8147 ) ( IS-CRATE ?auto_8148 ) ( AVAILABLE ?auto_8151 ) ( IN ?auto_8148 ?auto_8150 ) ( ON ?auto_8147 ?auto_8146 ) ( not ( = ?auto_8146 ?auto_8147 ) ) ( not ( = ?auto_8146 ?auto_8148 ) ) ( not ( = ?auto_8146 ?auto_8145 ) ) ( not ( = ?auto_8146 ?auto_8154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8147 ?auto_8148 ?auto_8145 )
      ( MAKE-3CRATE-VERIFY ?auto_8146 ?auto_8147 ?auto_8148 ?auto_8145 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8330 - SURFACE
      ?auto_8331 - SURFACE
    )
    :vars
    (
      ?auto_8337 - HOIST
      ?auto_8333 - PLACE
      ?auto_8334 - SURFACE
      ?auto_8336 - TRUCK
      ?auto_8335 - PLACE
      ?auto_8338 - HOIST
      ?auto_8332 - SURFACE
      ?auto_8339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8337 ?auto_8333 ) ( SURFACE-AT ?auto_8330 ?auto_8333 ) ( CLEAR ?auto_8330 ) ( IS-CRATE ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( AVAILABLE ?auto_8337 ) ( ON ?auto_8330 ?auto_8334 ) ( not ( = ?auto_8334 ?auto_8330 ) ) ( not ( = ?auto_8334 ?auto_8331 ) ) ( TRUCK-AT ?auto_8336 ?auto_8335 ) ( not ( = ?auto_8335 ?auto_8333 ) ) ( HOIST-AT ?auto_8338 ?auto_8335 ) ( not ( = ?auto_8337 ?auto_8338 ) ) ( SURFACE-AT ?auto_8331 ?auto_8335 ) ( ON ?auto_8331 ?auto_8332 ) ( CLEAR ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8334 ?auto_8332 ) ) ( LIFTING ?auto_8338 ?auto_8339 ) ( IS-CRATE ?auto_8339 ) ( not ( = ?auto_8330 ?auto_8339 ) ) ( not ( = ?auto_8331 ?auto_8339 ) ) ( not ( = ?auto_8334 ?auto_8339 ) ) ( not ( = ?auto_8332 ?auto_8339 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8338 ?auto_8339 ?auto_8336 ?auto_8335 )
      ( MAKE-1CRATE ?auto_8330 ?auto_8331 )
      ( MAKE-1CRATE-VERIFY ?auto_8330 ?auto_8331 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8439 - SURFACE
      ?auto_8440 - SURFACE
      ?auto_8441 - SURFACE
      ?auto_8438 - SURFACE
      ?auto_8442 - SURFACE
    )
    :vars
    (
      ?auto_8444 - HOIST
      ?auto_8443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8444 ?auto_8443 ) ( SURFACE-AT ?auto_8438 ?auto_8443 ) ( CLEAR ?auto_8438 ) ( LIFTING ?auto_8444 ?auto_8442 ) ( IS-CRATE ?auto_8442 ) ( not ( = ?auto_8438 ?auto_8442 ) ) ( ON ?auto_8440 ?auto_8439 ) ( ON ?auto_8441 ?auto_8440 ) ( ON ?auto_8438 ?auto_8441 ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8441 ) ) ( not ( = ?auto_8439 ?auto_8438 ) ) ( not ( = ?auto_8439 ?auto_8442 ) ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8438 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( not ( = ?auto_8441 ?auto_8438 ) ) ( not ( = ?auto_8441 ?auto_8442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8438 ?auto_8442 )
      ( MAKE-4CRATE-VERIFY ?auto_8439 ?auto_8440 ?auto_8441 ?auto_8438 ?auto_8442 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8464 - SURFACE
      ?auto_8465 - SURFACE
      ?auto_8466 - SURFACE
      ?auto_8463 - SURFACE
      ?auto_8467 - SURFACE
    )
    :vars
    (
      ?auto_8468 - HOIST
      ?auto_8469 - PLACE
      ?auto_8470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8468 ?auto_8469 ) ( SURFACE-AT ?auto_8463 ?auto_8469 ) ( CLEAR ?auto_8463 ) ( IS-CRATE ?auto_8467 ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( TRUCK-AT ?auto_8470 ?auto_8469 ) ( AVAILABLE ?auto_8468 ) ( IN ?auto_8467 ?auto_8470 ) ( ON ?auto_8463 ?auto_8466 ) ( not ( = ?auto_8466 ?auto_8463 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( ON ?auto_8465 ?auto_8464 ) ( ON ?auto_8466 ?auto_8465 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8463 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8463 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8466 ?auto_8463 ?auto_8467 )
      ( MAKE-4CRATE-VERIFY ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8463 ?auto_8467 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8494 - SURFACE
      ?auto_8495 - SURFACE
      ?auto_8496 - SURFACE
      ?auto_8493 - SURFACE
      ?auto_8497 - SURFACE
    )
    :vars
    (
      ?auto_8498 - HOIST
      ?auto_8501 - PLACE
      ?auto_8500 - TRUCK
      ?auto_8499 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8498 ?auto_8501 ) ( SURFACE-AT ?auto_8493 ?auto_8501 ) ( CLEAR ?auto_8493 ) ( IS-CRATE ?auto_8497 ) ( not ( = ?auto_8493 ?auto_8497 ) ) ( AVAILABLE ?auto_8498 ) ( IN ?auto_8497 ?auto_8500 ) ( ON ?auto_8493 ?auto_8496 ) ( not ( = ?auto_8496 ?auto_8493 ) ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( TRUCK-AT ?auto_8500 ?auto_8499 ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( ON ?auto_8495 ?auto_8494 ) ( ON ?auto_8496 ?auto_8495 ) ( not ( = ?auto_8494 ?auto_8495 ) ) ( not ( = ?auto_8494 ?auto_8496 ) ) ( not ( = ?auto_8494 ?auto_8493 ) ) ( not ( = ?auto_8494 ?auto_8497 ) ) ( not ( = ?auto_8495 ?auto_8496 ) ) ( not ( = ?auto_8495 ?auto_8493 ) ) ( not ( = ?auto_8495 ?auto_8497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8496 ?auto_8493 ?auto_8497 )
      ( MAKE-4CRATE-VERIFY ?auto_8494 ?auto_8495 ?auto_8496 ?auto_8493 ?auto_8497 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8528 - SURFACE
      ?auto_8529 - SURFACE
      ?auto_8530 - SURFACE
      ?auto_8527 - SURFACE
      ?auto_8531 - SURFACE
    )
    :vars
    (
      ?auto_8535 - HOIST
      ?auto_8534 - PLACE
      ?auto_8533 - TRUCK
      ?auto_8532 - PLACE
      ?auto_8536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8535 ?auto_8534 ) ( SURFACE-AT ?auto_8527 ?auto_8534 ) ( CLEAR ?auto_8527 ) ( IS-CRATE ?auto_8531 ) ( not ( = ?auto_8527 ?auto_8531 ) ) ( AVAILABLE ?auto_8535 ) ( ON ?auto_8527 ?auto_8530 ) ( not ( = ?auto_8530 ?auto_8527 ) ) ( not ( = ?auto_8530 ?auto_8531 ) ) ( TRUCK-AT ?auto_8533 ?auto_8532 ) ( not ( = ?auto_8532 ?auto_8534 ) ) ( HOIST-AT ?auto_8536 ?auto_8532 ) ( LIFTING ?auto_8536 ?auto_8531 ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( ON ?auto_8529 ?auto_8528 ) ( ON ?auto_8530 ?auto_8529 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8528 ?auto_8530 ) ) ( not ( = ?auto_8528 ?auto_8527 ) ) ( not ( = ?auto_8528 ?auto_8531 ) ) ( not ( = ?auto_8529 ?auto_8530 ) ) ( not ( = ?auto_8529 ?auto_8527 ) ) ( not ( = ?auto_8529 ?auto_8531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8530 ?auto_8527 ?auto_8531 )
      ( MAKE-4CRATE-VERIFY ?auto_8528 ?auto_8529 ?auto_8530 ?auto_8527 ?auto_8531 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8566 - SURFACE
      ?auto_8567 - SURFACE
      ?auto_8568 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8569 - SURFACE
    )
    :vars
    (
      ?auto_8574 - HOIST
      ?auto_8573 - PLACE
      ?auto_8575 - TRUCK
      ?auto_8570 - PLACE
      ?auto_8571 - HOIST
      ?auto_8572 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8574 ?auto_8573 ) ( SURFACE-AT ?auto_8565 ?auto_8573 ) ( CLEAR ?auto_8565 ) ( IS-CRATE ?auto_8569 ) ( not ( = ?auto_8565 ?auto_8569 ) ) ( AVAILABLE ?auto_8574 ) ( ON ?auto_8565 ?auto_8568 ) ( not ( = ?auto_8568 ?auto_8565 ) ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( TRUCK-AT ?auto_8575 ?auto_8570 ) ( not ( = ?auto_8570 ?auto_8573 ) ) ( HOIST-AT ?auto_8571 ?auto_8570 ) ( not ( = ?auto_8574 ?auto_8571 ) ) ( AVAILABLE ?auto_8571 ) ( SURFACE-AT ?auto_8569 ?auto_8570 ) ( ON ?auto_8569 ?auto_8572 ) ( CLEAR ?auto_8569 ) ( not ( = ?auto_8565 ?auto_8572 ) ) ( not ( = ?auto_8569 ?auto_8572 ) ) ( not ( = ?auto_8568 ?auto_8572 ) ) ( ON ?auto_8567 ?auto_8566 ) ( ON ?auto_8568 ?auto_8567 ) ( not ( = ?auto_8566 ?auto_8567 ) ) ( not ( = ?auto_8566 ?auto_8568 ) ) ( not ( = ?auto_8566 ?auto_8565 ) ) ( not ( = ?auto_8566 ?auto_8569 ) ) ( not ( = ?auto_8566 ?auto_8572 ) ) ( not ( = ?auto_8567 ?auto_8568 ) ) ( not ( = ?auto_8567 ?auto_8565 ) ) ( not ( = ?auto_8567 ?auto_8569 ) ) ( not ( = ?auto_8567 ?auto_8572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8568 ?auto_8565 ?auto_8569 )
      ( MAKE-4CRATE-VERIFY ?auto_8566 ?auto_8567 ?auto_8568 ?auto_8565 ?auto_8569 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8605 - SURFACE
      ?auto_8606 - SURFACE
      ?auto_8607 - SURFACE
      ?auto_8604 - SURFACE
      ?auto_8608 - SURFACE
    )
    :vars
    (
      ?auto_8613 - HOIST
      ?auto_8609 - PLACE
      ?auto_8611 - PLACE
      ?auto_8614 - HOIST
      ?auto_8610 - SURFACE
      ?auto_8612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8613 ?auto_8609 ) ( SURFACE-AT ?auto_8604 ?auto_8609 ) ( CLEAR ?auto_8604 ) ( IS-CRATE ?auto_8608 ) ( not ( = ?auto_8604 ?auto_8608 ) ) ( AVAILABLE ?auto_8613 ) ( ON ?auto_8604 ?auto_8607 ) ( not ( = ?auto_8607 ?auto_8604 ) ) ( not ( = ?auto_8607 ?auto_8608 ) ) ( not ( = ?auto_8611 ?auto_8609 ) ) ( HOIST-AT ?auto_8614 ?auto_8611 ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( AVAILABLE ?auto_8614 ) ( SURFACE-AT ?auto_8608 ?auto_8611 ) ( ON ?auto_8608 ?auto_8610 ) ( CLEAR ?auto_8608 ) ( not ( = ?auto_8604 ?auto_8610 ) ) ( not ( = ?auto_8608 ?auto_8610 ) ) ( not ( = ?auto_8607 ?auto_8610 ) ) ( TRUCK-AT ?auto_8612 ?auto_8609 ) ( ON ?auto_8606 ?auto_8605 ) ( ON ?auto_8607 ?auto_8606 ) ( not ( = ?auto_8605 ?auto_8606 ) ) ( not ( = ?auto_8605 ?auto_8607 ) ) ( not ( = ?auto_8605 ?auto_8604 ) ) ( not ( = ?auto_8605 ?auto_8608 ) ) ( not ( = ?auto_8605 ?auto_8610 ) ) ( not ( = ?auto_8606 ?auto_8607 ) ) ( not ( = ?auto_8606 ?auto_8604 ) ) ( not ( = ?auto_8606 ?auto_8608 ) ) ( not ( = ?auto_8606 ?auto_8610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8607 ?auto_8604 ?auto_8608 )
      ( MAKE-4CRATE-VERIFY ?auto_8605 ?auto_8606 ?auto_8607 ?auto_8604 ?auto_8608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8644 - SURFACE
      ?auto_8645 - SURFACE
      ?auto_8646 - SURFACE
      ?auto_8643 - SURFACE
      ?auto_8647 - SURFACE
    )
    :vars
    (
      ?auto_8653 - HOIST
      ?auto_8652 - PLACE
      ?auto_8649 - PLACE
      ?auto_8650 - HOIST
      ?auto_8648 - SURFACE
      ?auto_8651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8653 ?auto_8652 ) ( IS-CRATE ?auto_8647 ) ( not ( = ?auto_8643 ?auto_8647 ) ) ( not ( = ?auto_8646 ?auto_8643 ) ) ( not ( = ?auto_8646 ?auto_8647 ) ) ( not ( = ?auto_8649 ?auto_8652 ) ) ( HOIST-AT ?auto_8650 ?auto_8649 ) ( not ( = ?auto_8653 ?auto_8650 ) ) ( AVAILABLE ?auto_8650 ) ( SURFACE-AT ?auto_8647 ?auto_8649 ) ( ON ?auto_8647 ?auto_8648 ) ( CLEAR ?auto_8647 ) ( not ( = ?auto_8643 ?auto_8648 ) ) ( not ( = ?auto_8647 ?auto_8648 ) ) ( not ( = ?auto_8646 ?auto_8648 ) ) ( TRUCK-AT ?auto_8651 ?auto_8652 ) ( SURFACE-AT ?auto_8646 ?auto_8652 ) ( CLEAR ?auto_8646 ) ( LIFTING ?auto_8653 ?auto_8643 ) ( IS-CRATE ?auto_8643 ) ( ON ?auto_8645 ?auto_8644 ) ( ON ?auto_8646 ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8643 ) ) ( not ( = ?auto_8644 ?auto_8647 ) ) ( not ( = ?auto_8644 ?auto_8648 ) ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8645 ?auto_8643 ) ) ( not ( = ?auto_8645 ?auto_8647 ) ) ( not ( = ?auto_8645 ?auto_8648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8646 ?auto_8643 ?auto_8647 )
      ( MAKE-4CRATE-VERIFY ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8643 ?auto_8647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8683 - SURFACE
      ?auto_8684 - SURFACE
      ?auto_8685 - SURFACE
      ?auto_8682 - SURFACE
      ?auto_8686 - SURFACE
    )
    :vars
    (
      ?auto_8692 - HOIST
      ?auto_8688 - PLACE
      ?auto_8690 - PLACE
      ?auto_8689 - HOIST
      ?auto_8687 - SURFACE
      ?auto_8691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8692 ?auto_8688 ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8682 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8682 ) ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( not ( = ?auto_8690 ?auto_8688 ) ) ( HOIST-AT ?auto_8689 ?auto_8690 ) ( not ( = ?auto_8692 ?auto_8689 ) ) ( AVAILABLE ?auto_8689 ) ( SURFACE-AT ?auto_8686 ?auto_8690 ) ( ON ?auto_8686 ?auto_8687 ) ( CLEAR ?auto_8686 ) ( not ( = ?auto_8682 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( not ( = ?auto_8685 ?auto_8687 ) ) ( TRUCK-AT ?auto_8691 ?auto_8688 ) ( SURFACE-AT ?auto_8685 ?auto_8688 ) ( CLEAR ?auto_8685 ) ( IS-CRATE ?auto_8682 ) ( AVAILABLE ?auto_8692 ) ( IN ?auto_8682 ?auto_8691 ) ( ON ?auto_8684 ?auto_8683 ) ( ON ?auto_8685 ?auto_8684 ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8682 ) ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8683 ?auto_8687 ) ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8682 ) ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8685 ?auto_8682 ?auto_8686 )
      ( MAKE-4CRATE-VERIFY ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8682 ?auto_8686 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8693 - SURFACE
      ?auto_8694 - SURFACE
    )
    :vars
    (
      ?auto_8700 - HOIST
      ?auto_8696 - PLACE
      ?auto_8701 - SURFACE
      ?auto_8698 - PLACE
      ?auto_8697 - HOIST
      ?auto_8695 - SURFACE
      ?auto_8699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8700 ?auto_8696 ) ( IS-CRATE ?auto_8694 ) ( not ( = ?auto_8693 ?auto_8694 ) ) ( not ( = ?auto_8701 ?auto_8693 ) ) ( not ( = ?auto_8701 ?auto_8694 ) ) ( not ( = ?auto_8698 ?auto_8696 ) ) ( HOIST-AT ?auto_8697 ?auto_8698 ) ( not ( = ?auto_8700 ?auto_8697 ) ) ( AVAILABLE ?auto_8697 ) ( SURFACE-AT ?auto_8694 ?auto_8698 ) ( ON ?auto_8694 ?auto_8695 ) ( CLEAR ?auto_8694 ) ( not ( = ?auto_8693 ?auto_8695 ) ) ( not ( = ?auto_8694 ?auto_8695 ) ) ( not ( = ?auto_8701 ?auto_8695 ) ) ( SURFACE-AT ?auto_8701 ?auto_8696 ) ( CLEAR ?auto_8701 ) ( IS-CRATE ?auto_8693 ) ( AVAILABLE ?auto_8700 ) ( IN ?auto_8693 ?auto_8699 ) ( TRUCK-AT ?auto_8699 ?auto_8698 ) )
    :subtasks
    ( ( !DRIVE ?auto_8699 ?auto_8698 ?auto_8696 )
      ( MAKE-2CRATE ?auto_8701 ?auto_8693 ?auto_8694 )
      ( MAKE-1CRATE-VERIFY ?auto_8693 ?auto_8694 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8702 - SURFACE
      ?auto_8703 - SURFACE
      ?auto_8704 - SURFACE
    )
    :vars
    (
      ?auto_8706 - HOIST
      ?auto_8705 - PLACE
      ?auto_8710 - PLACE
      ?auto_8709 - HOIST
      ?auto_8707 - SURFACE
      ?auto_8708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8706 ?auto_8705 ) ( IS-CRATE ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( not ( = ?auto_8702 ?auto_8704 ) ) ( not ( = ?auto_8710 ?auto_8705 ) ) ( HOIST-AT ?auto_8709 ?auto_8710 ) ( not ( = ?auto_8706 ?auto_8709 ) ) ( AVAILABLE ?auto_8709 ) ( SURFACE-AT ?auto_8704 ?auto_8710 ) ( ON ?auto_8704 ?auto_8707 ) ( CLEAR ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8707 ) ) ( not ( = ?auto_8704 ?auto_8707 ) ) ( not ( = ?auto_8702 ?auto_8707 ) ) ( SURFACE-AT ?auto_8702 ?auto_8705 ) ( CLEAR ?auto_8702 ) ( IS-CRATE ?auto_8703 ) ( AVAILABLE ?auto_8706 ) ( IN ?auto_8703 ?auto_8708 ) ( TRUCK-AT ?auto_8708 ?auto_8710 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8703 ?auto_8704 )
      ( MAKE-2CRATE-VERIFY ?auto_8702 ?auto_8703 ?auto_8704 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8712 - SURFACE
      ?auto_8713 - SURFACE
      ?auto_8714 - SURFACE
      ?auto_8711 - SURFACE
    )
    :vars
    (
      ?auto_8720 - HOIST
      ?auto_8719 - PLACE
      ?auto_8718 - PLACE
      ?auto_8717 - HOIST
      ?auto_8715 - SURFACE
      ?auto_8716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8720 ?auto_8719 ) ( IS-CRATE ?auto_8711 ) ( not ( = ?auto_8714 ?auto_8711 ) ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( not ( = ?auto_8713 ?auto_8711 ) ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( HOIST-AT ?auto_8717 ?auto_8718 ) ( not ( = ?auto_8720 ?auto_8717 ) ) ( AVAILABLE ?auto_8717 ) ( SURFACE-AT ?auto_8711 ?auto_8718 ) ( ON ?auto_8711 ?auto_8715 ) ( CLEAR ?auto_8711 ) ( not ( = ?auto_8714 ?auto_8715 ) ) ( not ( = ?auto_8711 ?auto_8715 ) ) ( not ( = ?auto_8713 ?auto_8715 ) ) ( SURFACE-AT ?auto_8713 ?auto_8719 ) ( CLEAR ?auto_8713 ) ( IS-CRATE ?auto_8714 ) ( AVAILABLE ?auto_8720 ) ( IN ?auto_8714 ?auto_8716 ) ( TRUCK-AT ?auto_8716 ?auto_8718 ) ( ON ?auto_8713 ?auto_8712 ) ( not ( = ?auto_8712 ?auto_8713 ) ) ( not ( = ?auto_8712 ?auto_8714 ) ) ( not ( = ?auto_8712 ?auto_8711 ) ) ( not ( = ?auto_8712 ?auto_8715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8713 ?auto_8714 ?auto_8711 )
      ( MAKE-3CRATE-VERIFY ?auto_8712 ?auto_8713 ?auto_8714 ?auto_8711 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8722 - SURFACE
      ?auto_8723 - SURFACE
      ?auto_8724 - SURFACE
      ?auto_8721 - SURFACE
      ?auto_8725 - SURFACE
    )
    :vars
    (
      ?auto_8731 - HOIST
      ?auto_8730 - PLACE
      ?auto_8729 - PLACE
      ?auto_8728 - HOIST
      ?auto_8726 - SURFACE
      ?auto_8727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8731 ?auto_8730 ) ( IS-CRATE ?auto_8725 ) ( not ( = ?auto_8721 ?auto_8725 ) ) ( not ( = ?auto_8724 ?auto_8721 ) ) ( not ( = ?auto_8724 ?auto_8725 ) ) ( not ( = ?auto_8729 ?auto_8730 ) ) ( HOIST-AT ?auto_8728 ?auto_8729 ) ( not ( = ?auto_8731 ?auto_8728 ) ) ( AVAILABLE ?auto_8728 ) ( SURFACE-AT ?auto_8725 ?auto_8729 ) ( ON ?auto_8725 ?auto_8726 ) ( CLEAR ?auto_8725 ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( SURFACE-AT ?auto_8724 ?auto_8730 ) ( CLEAR ?auto_8724 ) ( IS-CRATE ?auto_8721 ) ( AVAILABLE ?auto_8731 ) ( IN ?auto_8721 ?auto_8727 ) ( TRUCK-AT ?auto_8727 ?auto_8729 ) ( ON ?auto_8723 ?auto_8722 ) ( ON ?auto_8724 ?auto_8723 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8721 ) ) ( not ( = ?auto_8722 ?auto_8725 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8721 ) ) ( not ( = ?auto_8723 ?auto_8725 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8724 ?auto_8721 ?auto_8725 )
      ( MAKE-4CRATE-VERIFY ?auto_8722 ?auto_8723 ?auto_8724 ?auto_8721 ?auto_8725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8732 - SURFACE
      ?auto_8733 - SURFACE
    )
    :vars
    (
      ?auto_8740 - HOIST
      ?auto_8739 - PLACE
      ?auto_8737 - SURFACE
      ?auto_8738 - PLACE
      ?auto_8736 - HOIST
      ?auto_8734 - SURFACE
      ?auto_8735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8740 ?auto_8739 ) ( IS-CRATE ?auto_8733 ) ( not ( = ?auto_8732 ?auto_8733 ) ) ( not ( = ?auto_8737 ?auto_8732 ) ) ( not ( = ?auto_8737 ?auto_8733 ) ) ( not ( = ?auto_8738 ?auto_8739 ) ) ( HOIST-AT ?auto_8736 ?auto_8738 ) ( not ( = ?auto_8740 ?auto_8736 ) ) ( SURFACE-AT ?auto_8733 ?auto_8738 ) ( ON ?auto_8733 ?auto_8734 ) ( CLEAR ?auto_8733 ) ( not ( = ?auto_8732 ?auto_8734 ) ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( not ( = ?auto_8737 ?auto_8734 ) ) ( SURFACE-AT ?auto_8737 ?auto_8739 ) ( CLEAR ?auto_8737 ) ( IS-CRATE ?auto_8732 ) ( AVAILABLE ?auto_8740 ) ( TRUCK-AT ?auto_8735 ?auto_8738 ) ( LIFTING ?auto_8736 ?auto_8732 ) )
    :subtasks
    ( ( !LOAD ?auto_8736 ?auto_8732 ?auto_8735 ?auto_8738 )
      ( MAKE-2CRATE ?auto_8737 ?auto_8732 ?auto_8733 )
      ( MAKE-1CRATE-VERIFY ?auto_8732 ?auto_8733 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8741 - SURFACE
      ?auto_8742 - SURFACE
      ?auto_8743 - SURFACE
    )
    :vars
    (
      ?auto_8748 - HOIST
      ?auto_8749 - PLACE
      ?auto_8744 - PLACE
      ?auto_8746 - HOIST
      ?auto_8745 - SURFACE
      ?auto_8747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8748 ?auto_8749 ) ( IS-CRATE ?auto_8743 ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8741 ?auto_8742 ) ) ( not ( = ?auto_8741 ?auto_8743 ) ) ( not ( = ?auto_8744 ?auto_8749 ) ) ( HOIST-AT ?auto_8746 ?auto_8744 ) ( not ( = ?auto_8748 ?auto_8746 ) ) ( SURFACE-AT ?auto_8743 ?auto_8744 ) ( ON ?auto_8743 ?auto_8745 ) ( CLEAR ?auto_8743 ) ( not ( = ?auto_8742 ?auto_8745 ) ) ( not ( = ?auto_8743 ?auto_8745 ) ) ( not ( = ?auto_8741 ?auto_8745 ) ) ( SURFACE-AT ?auto_8741 ?auto_8749 ) ( CLEAR ?auto_8741 ) ( IS-CRATE ?auto_8742 ) ( AVAILABLE ?auto_8748 ) ( TRUCK-AT ?auto_8747 ?auto_8744 ) ( LIFTING ?auto_8746 ?auto_8742 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8742 ?auto_8743 )
      ( MAKE-2CRATE-VERIFY ?auto_8741 ?auto_8742 ?auto_8743 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8751 - SURFACE
      ?auto_8752 - SURFACE
      ?auto_8753 - SURFACE
      ?auto_8750 - SURFACE
    )
    :vars
    (
      ?auto_8758 - HOIST
      ?auto_8756 - PLACE
      ?auto_8755 - PLACE
      ?auto_8757 - HOIST
      ?auto_8754 - SURFACE
      ?auto_8759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8758 ?auto_8756 ) ( IS-CRATE ?auto_8750 ) ( not ( = ?auto_8753 ?auto_8750 ) ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8750 ) ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( HOIST-AT ?auto_8757 ?auto_8755 ) ( not ( = ?auto_8758 ?auto_8757 ) ) ( SURFACE-AT ?auto_8750 ?auto_8755 ) ( ON ?auto_8750 ?auto_8754 ) ( CLEAR ?auto_8750 ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( not ( = ?auto_8750 ?auto_8754 ) ) ( not ( = ?auto_8752 ?auto_8754 ) ) ( SURFACE-AT ?auto_8752 ?auto_8756 ) ( CLEAR ?auto_8752 ) ( IS-CRATE ?auto_8753 ) ( AVAILABLE ?auto_8758 ) ( TRUCK-AT ?auto_8759 ?auto_8755 ) ( LIFTING ?auto_8757 ?auto_8753 ) ( ON ?auto_8752 ?auto_8751 ) ( not ( = ?auto_8751 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8753 ) ) ( not ( = ?auto_8751 ?auto_8750 ) ) ( not ( = ?auto_8751 ?auto_8754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8752 ?auto_8753 ?auto_8750 )
      ( MAKE-3CRATE-VERIFY ?auto_8751 ?auto_8752 ?auto_8753 ?auto_8750 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8761 - SURFACE
      ?auto_8762 - SURFACE
      ?auto_8763 - SURFACE
      ?auto_8760 - SURFACE
      ?auto_8764 - SURFACE
    )
    :vars
    (
      ?auto_8769 - HOIST
      ?auto_8767 - PLACE
      ?auto_8766 - PLACE
      ?auto_8768 - HOIST
      ?auto_8765 - SURFACE
      ?auto_8770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8769 ?auto_8767 ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8760 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8760 ) ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( HOIST-AT ?auto_8768 ?auto_8766 ) ( not ( = ?auto_8769 ?auto_8768 ) ) ( SURFACE-AT ?auto_8764 ?auto_8766 ) ( ON ?auto_8764 ?auto_8765 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8760 ?auto_8765 ) ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( SURFACE-AT ?auto_8763 ?auto_8767 ) ( CLEAR ?auto_8763 ) ( IS-CRATE ?auto_8760 ) ( AVAILABLE ?auto_8769 ) ( TRUCK-AT ?auto_8770 ?auto_8766 ) ( LIFTING ?auto_8768 ?auto_8760 ) ( ON ?auto_8762 ?auto_8761 ) ( ON ?auto_8763 ?auto_8762 ) ( not ( = ?auto_8761 ?auto_8762 ) ) ( not ( = ?auto_8761 ?auto_8763 ) ) ( not ( = ?auto_8761 ?auto_8760 ) ) ( not ( = ?auto_8761 ?auto_8764 ) ) ( not ( = ?auto_8761 ?auto_8765 ) ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8760 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8762 ?auto_8765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8763 ?auto_8760 ?auto_8764 )
      ( MAKE-4CRATE-VERIFY ?auto_8761 ?auto_8762 ?auto_8763 ?auto_8760 ?auto_8764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8771 - SURFACE
      ?auto_8772 - SURFACE
    )
    :vars
    (
      ?auto_8777 - HOIST
      ?auto_8775 - PLACE
      ?auto_8779 - SURFACE
      ?auto_8774 - PLACE
      ?auto_8776 - HOIST
      ?auto_8773 - SURFACE
      ?auto_8778 - TRUCK
      ?auto_8780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8777 ?auto_8775 ) ( IS-CRATE ?auto_8772 ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( not ( = ?auto_8779 ?auto_8771 ) ) ( not ( = ?auto_8779 ?auto_8772 ) ) ( not ( = ?auto_8774 ?auto_8775 ) ) ( HOIST-AT ?auto_8776 ?auto_8774 ) ( not ( = ?auto_8777 ?auto_8776 ) ) ( SURFACE-AT ?auto_8772 ?auto_8774 ) ( ON ?auto_8772 ?auto_8773 ) ( CLEAR ?auto_8772 ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8773 ) ) ( not ( = ?auto_8779 ?auto_8773 ) ) ( SURFACE-AT ?auto_8779 ?auto_8775 ) ( CLEAR ?auto_8779 ) ( IS-CRATE ?auto_8771 ) ( AVAILABLE ?auto_8777 ) ( TRUCK-AT ?auto_8778 ?auto_8774 ) ( AVAILABLE ?auto_8776 ) ( SURFACE-AT ?auto_8771 ?auto_8774 ) ( ON ?auto_8771 ?auto_8780 ) ( CLEAR ?auto_8771 ) ( not ( = ?auto_8771 ?auto_8780 ) ) ( not ( = ?auto_8772 ?auto_8780 ) ) ( not ( = ?auto_8779 ?auto_8780 ) ) ( not ( = ?auto_8773 ?auto_8780 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8776 ?auto_8771 ?auto_8780 ?auto_8774 )
      ( MAKE-2CRATE ?auto_8779 ?auto_8771 ?auto_8772 )
      ( MAKE-1CRATE-VERIFY ?auto_8771 ?auto_8772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8781 - SURFACE
      ?auto_8782 - SURFACE
      ?auto_8783 - SURFACE
    )
    :vars
    (
      ?auto_8787 - HOIST
      ?auto_8785 - PLACE
      ?auto_8790 - PLACE
      ?auto_8786 - HOIST
      ?auto_8789 - SURFACE
      ?auto_8788 - TRUCK
      ?auto_8784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8787 ?auto_8785 ) ( IS-CRATE ?auto_8783 ) ( not ( = ?auto_8782 ?auto_8783 ) ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8783 ) ) ( not ( = ?auto_8790 ?auto_8785 ) ) ( HOIST-AT ?auto_8786 ?auto_8790 ) ( not ( = ?auto_8787 ?auto_8786 ) ) ( SURFACE-AT ?auto_8783 ?auto_8790 ) ( ON ?auto_8783 ?auto_8789 ) ( CLEAR ?auto_8783 ) ( not ( = ?auto_8782 ?auto_8789 ) ) ( not ( = ?auto_8783 ?auto_8789 ) ) ( not ( = ?auto_8781 ?auto_8789 ) ) ( SURFACE-AT ?auto_8781 ?auto_8785 ) ( CLEAR ?auto_8781 ) ( IS-CRATE ?auto_8782 ) ( AVAILABLE ?auto_8787 ) ( TRUCK-AT ?auto_8788 ?auto_8790 ) ( AVAILABLE ?auto_8786 ) ( SURFACE-AT ?auto_8782 ?auto_8790 ) ( ON ?auto_8782 ?auto_8784 ) ( CLEAR ?auto_8782 ) ( not ( = ?auto_8782 ?auto_8784 ) ) ( not ( = ?auto_8783 ?auto_8784 ) ) ( not ( = ?auto_8781 ?auto_8784 ) ) ( not ( = ?auto_8789 ?auto_8784 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8782 ?auto_8783 )
      ( MAKE-2CRATE-VERIFY ?auto_8781 ?auto_8782 ?auto_8783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8792 - SURFACE
      ?auto_8793 - SURFACE
      ?auto_8794 - SURFACE
      ?auto_8791 - SURFACE
    )
    :vars
    (
      ?auto_8795 - HOIST
      ?auto_8796 - PLACE
      ?auto_8799 - PLACE
      ?auto_8801 - HOIST
      ?auto_8800 - SURFACE
      ?auto_8798 - TRUCK
      ?auto_8797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8795 ?auto_8796 ) ( IS-CRATE ?auto_8791 ) ( not ( = ?auto_8794 ?auto_8791 ) ) ( not ( = ?auto_8793 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8791 ) ) ( not ( = ?auto_8799 ?auto_8796 ) ) ( HOIST-AT ?auto_8801 ?auto_8799 ) ( not ( = ?auto_8795 ?auto_8801 ) ) ( SURFACE-AT ?auto_8791 ?auto_8799 ) ( ON ?auto_8791 ?auto_8800 ) ( CLEAR ?auto_8791 ) ( not ( = ?auto_8794 ?auto_8800 ) ) ( not ( = ?auto_8791 ?auto_8800 ) ) ( not ( = ?auto_8793 ?auto_8800 ) ) ( SURFACE-AT ?auto_8793 ?auto_8796 ) ( CLEAR ?auto_8793 ) ( IS-CRATE ?auto_8794 ) ( AVAILABLE ?auto_8795 ) ( TRUCK-AT ?auto_8798 ?auto_8799 ) ( AVAILABLE ?auto_8801 ) ( SURFACE-AT ?auto_8794 ?auto_8799 ) ( ON ?auto_8794 ?auto_8797 ) ( CLEAR ?auto_8794 ) ( not ( = ?auto_8794 ?auto_8797 ) ) ( not ( = ?auto_8791 ?auto_8797 ) ) ( not ( = ?auto_8793 ?auto_8797 ) ) ( not ( = ?auto_8800 ?auto_8797 ) ) ( ON ?auto_8793 ?auto_8792 ) ( not ( = ?auto_8792 ?auto_8793 ) ) ( not ( = ?auto_8792 ?auto_8794 ) ) ( not ( = ?auto_8792 ?auto_8791 ) ) ( not ( = ?auto_8792 ?auto_8800 ) ) ( not ( = ?auto_8792 ?auto_8797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8793 ?auto_8794 ?auto_8791 )
      ( MAKE-3CRATE-VERIFY ?auto_8792 ?auto_8793 ?auto_8794 ?auto_8791 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8803 - SURFACE
      ?auto_8804 - SURFACE
      ?auto_8805 - SURFACE
      ?auto_8802 - SURFACE
      ?auto_8806 - SURFACE
    )
    :vars
    (
      ?auto_8807 - HOIST
      ?auto_8808 - PLACE
      ?auto_8811 - PLACE
      ?auto_8813 - HOIST
      ?auto_8812 - SURFACE
      ?auto_8810 - TRUCK
      ?auto_8809 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8807 ?auto_8808 ) ( IS-CRATE ?auto_8806 ) ( not ( = ?auto_8802 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8802 ) ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8811 ?auto_8808 ) ) ( HOIST-AT ?auto_8813 ?auto_8811 ) ( not ( = ?auto_8807 ?auto_8813 ) ) ( SURFACE-AT ?auto_8806 ?auto_8811 ) ( ON ?auto_8806 ?auto_8812 ) ( CLEAR ?auto_8806 ) ( not ( = ?auto_8802 ?auto_8812 ) ) ( not ( = ?auto_8806 ?auto_8812 ) ) ( not ( = ?auto_8805 ?auto_8812 ) ) ( SURFACE-AT ?auto_8805 ?auto_8808 ) ( CLEAR ?auto_8805 ) ( IS-CRATE ?auto_8802 ) ( AVAILABLE ?auto_8807 ) ( TRUCK-AT ?auto_8810 ?auto_8811 ) ( AVAILABLE ?auto_8813 ) ( SURFACE-AT ?auto_8802 ?auto_8811 ) ( ON ?auto_8802 ?auto_8809 ) ( CLEAR ?auto_8802 ) ( not ( = ?auto_8802 ?auto_8809 ) ) ( not ( = ?auto_8806 ?auto_8809 ) ) ( not ( = ?auto_8805 ?auto_8809 ) ) ( not ( = ?auto_8812 ?auto_8809 ) ) ( ON ?auto_8804 ?auto_8803 ) ( ON ?auto_8805 ?auto_8804 ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8802 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8803 ?auto_8812 ) ) ( not ( = ?auto_8803 ?auto_8809 ) ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8804 ?auto_8802 ) ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8804 ?auto_8812 ) ) ( not ( = ?auto_8804 ?auto_8809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8805 ?auto_8802 ?auto_8806 )
      ( MAKE-4CRATE-VERIFY ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8802 ?auto_8806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8814 - SURFACE
      ?auto_8815 - SURFACE
    )
    :vars
    (
      ?auto_8816 - HOIST
      ?auto_8817 - PLACE
      ?auto_8822 - SURFACE
      ?auto_8820 - PLACE
      ?auto_8823 - HOIST
      ?auto_8821 - SURFACE
      ?auto_8818 - SURFACE
      ?auto_8819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8816 ?auto_8817 ) ( IS-CRATE ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8822 ?auto_8814 ) ) ( not ( = ?auto_8822 ?auto_8815 ) ) ( not ( = ?auto_8820 ?auto_8817 ) ) ( HOIST-AT ?auto_8823 ?auto_8820 ) ( not ( = ?auto_8816 ?auto_8823 ) ) ( SURFACE-AT ?auto_8815 ?auto_8820 ) ( ON ?auto_8815 ?auto_8821 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8821 ) ) ( not ( = ?auto_8815 ?auto_8821 ) ) ( not ( = ?auto_8822 ?auto_8821 ) ) ( SURFACE-AT ?auto_8822 ?auto_8817 ) ( CLEAR ?auto_8822 ) ( IS-CRATE ?auto_8814 ) ( AVAILABLE ?auto_8816 ) ( AVAILABLE ?auto_8823 ) ( SURFACE-AT ?auto_8814 ?auto_8820 ) ( ON ?auto_8814 ?auto_8818 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8814 ?auto_8818 ) ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8822 ?auto_8818 ) ) ( not ( = ?auto_8821 ?auto_8818 ) ) ( TRUCK-AT ?auto_8819 ?auto_8817 ) )
    :subtasks
    ( ( !DRIVE ?auto_8819 ?auto_8817 ?auto_8820 )
      ( MAKE-2CRATE ?auto_8822 ?auto_8814 ?auto_8815 )
      ( MAKE-1CRATE-VERIFY ?auto_8814 ?auto_8815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8824 - SURFACE
      ?auto_8825 - SURFACE
      ?auto_8826 - SURFACE
    )
    :vars
    (
      ?auto_8828 - HOIST
      ?auto_8827 - PLACE
      ?auto_8832 - PLACE
      ?auto_8829 - HOIST
      ?auto_8833 - SURFACE
      ?auto_8830 - SURFACE
      ?auto_8831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8828 ?auto_8827 ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8825 ?auto_8826 ) ) ( not ( = ?auto_8824 ?auto_8825 ) ) ( not ( = ?auto_8824 ?auto_8826 ) ) ( not ( = ?auto_8832 ?auto_8827 ) ) ( HOIST-AT ?auto_8829 ?auto_8832 ) ( not ( = ?auto_8828 ?auto_8829 ) ) ( SURFACE-AT ?auto_8826 ?auto_8832 ) ( ON ?auto_8826 ?auto_8833 ) ( CLEAR ?auto_8826 ) ( not ( = ?auto_8825 ?auto_8833 ) ) ( not ( = ?auto_8826 ?auto_8833 ) ) ( not ( = ?auto_8824 ?auto_8833 ) ) ( SURFACE-AT ?auto_8824 ?auto_8827 ) ( CLEAR ?auto_8824 ) ( IS-CRATE ?auto_8825 ) ( AVAILABLE ?auto_8828 ) ( AVAILABLE ?auto_8829 ) ( SURFACE-AT ?auto_8825 ?auto_8832 ) ( ON ?auto_8825 ?auto_8830 ) ( CLEAR ?auto_8825 ) ( not ( = ?auto_8825 ?auto_8830 ) ) ( not ( = ?auto_8826 ?auto_8830 ) ) ( not ( = ?auto_8824 ?auto_8830 ) ) ( not ( = ?auto_8833 ?auto_8830 ) ) ( TRUCK-AT ?auto_8831 ?auto_8827 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8825 ?auto_8826 )
      ( MAKE-2CRATE-VERIFY ?auto_8824 ?auto_8825 ?auto_8826 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8835 - SURFACE
      ?auto_8836 - SURFACE
      ?auto_8837 - SURFACE
      ?auto_8834 - SURFACE
    )
    :vars
    (
      ?auto_8843 - HOIST
      ?auto_8841 - PLACE
      ?auto_8840 - PLACE
      ?auto_8842 - HOIST
      ?auto_8844 - SURFACE
      ?auto_8839 - SURFACE
      ?auto_8838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8843 ?auto_8841 ) ( IS-CRATE ?auto_8834 ) ( not ( = ?auto_8837 ?auto_8834 ) ) ( not ( = ?auto_8836 ?auto_8837 ) ) ( not ( = ?auto_8836 ?auto_8834 ) ) ( not ( = ?auto_8840 ?auto_8841 ) ) ( HOIST-AT ?auto_8842 ?auto_8840 ) ( not ( = ?auto_8843 ?auto_8842 ) ) ( SURFACE-AT ?auto_8834 ?auto_8840 ) ( ON ?auto_8834 ?auto_8844 ) ( CLEAR ?auto_8834 ) ( not ( = ?auto_8837 ?auto_8844 ) ) ( not ( = ?auto_8834 ?auto_8844 ) ) ( not ( = ?auto_8836 ?auto_8844 ) ) ( SURFACE-AT ?auto_8836 ?auto_8841 ) ( CLEAR ?auto_8836 ) ( IS-CRATE ?auto_8837 ) ( AVAILABLE ?auto_8843 ) ( AVAILABLE ?auto_8842 ) ( SURFACE-AT ?auto_8837 ?auto_8840 ) ( ON ?auto_8837 ?auto_8839 ) ( CLEAR ?auto_8837 ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8834 ?auto_8839 ) ) ( not ( = ?auto_8836 ?auto_8839 ) ) ( not ( = ?auto_8844 ?auto_8839 ) ) ( TRUCK-AT ?auto_8838 ?auto_8841 ) ( ON ?auto_8836 ?auto_8835 ) ( not ( = ?auto_8835 ?auto_8836 ) ) ( not ( = ?auto_8835 ?auto_8837 ) ) ( not ( = ?auto_8835 ?auto_8834 ) ) ( not ( = ?auto_8835 ?auto_8844 ) ) ( not ( = ?auto_8835 ?auto_8839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8836 ?auto_8837 ?auto_8834 )
      ( MAKE-3CRATE-VERIFY ?auto_8835 ?auto_8836 ?auto_8837 ?auto_8834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8846 - SURFACE
      ?auto_8847 - SURFACE
      ?auto_8848 - SURFACE
      ?auto_8845 - SURFACE
      ?auto_8849 - SURFACE
    )
    :vars
    (
      ?auto_8855 - HOIST
      ?auto_8853 - PLACE
      ?auto_8852 - PLACE
      ?auto_8854 - HOIST
      ?auto_8856 - SURFACE
      ?auto_8851 - SURFACE
      ?auto_8850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8855 ?auto_8853 ) ( IS-CRATE ?auto_8849 ) ( not ( = ?auto_8845 ?auto_8849 ) ) ( not ( = ?auto_8848 ?auto_8845 ) ) ( not ( = ?auto_8848 ?auto_8849 ) ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( HOIST-AT ?auto_8854 ?auto_8852 ) ( not ( = ?auto_8855 ?auto_8854 ) ) ( SURFACE-AT ?auto_8849 ?auto_8852 ) ( ON ?auto_8849 ?auto_8856 ) ( CLEAR ?auto_8849 ) ( not ( = ?auto_8845 ?auto_8856 ) ) ( not ( = ?auto_8849 ?auto_8856 ) ) ( not ( = ?auto_8848 ?auto_8856 ) ) ( SURFACE-AT ?auto_8848 ?auto_8853 ) ( CLEAR ?auto_8848 ) ( IS-CRATE ?auto_8845 ) ( AVAILABLE ?auto_8855 ) ( AVAILABLE ?auto_8854 ) ( SURFACE-AT ?auto_8845 ?auto_8852 ) ( ON ?auto_8845 ?auto_8851 ) ( CLEAR ?auto_8845 ) ( not ( = ?auto_8845 ?auto_8851 ) ) ( not ( = ?auto_8849 ?auto_8851 ) ) ( not ( = ?auto_8848 ?auto_8851 ) ) ( not ( = ?auto_8856 ?auto_8851 ) ) ( TRUCK-AT ?auto_8850 ?auto_8853 ) ( ON ?auto_8847 ?auto_8846 ) ( ON ?auto_8848 ?auto_8847 ) ( not ( = ?auto_8846 ?auto_8847 ) ) ( not ( = ?auto_8846 ?auto_8848 ) ) ( not ( = ?auto_8846 ?auto_8845 ) ) ( not ( = ?auto_8846 ?auto_8849 ) ) ( not ( = ?auto_8846 ?auto_8856 ) ) ( not ( = ?auto_8846 ?auto_8851 ) ) ( not ( = ?auto_8847 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8845 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8856 ) ) ( not ( = ?auto_8847 ?auto_8851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8848 ?auto_8845 ?auto_8849 )
      ( MAKE-4CRATE-VERIFY ?auto_8846 ?auto_8847 ?auto_8848 ?auto_8845 ?auto_8849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8857 - SURFACE
      ?auto_8858 - SURFACE
    )
    :vars
    (
      ?auto_8865 - HOIST
      ?auto_8862 - PLACE
      ?auto_8864 - SURFACE
      ?auto_8861 - PLACE
      ?auto_8863 - HOIST
      ?auto_8866 - SURFACE
      ?auto_8860 - SURFACE
      ?auto_8859 - TRUCK
      ?auto_8867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8865 ?auto_8862 ) ( IS-CRATE ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8858 ) ) ( not ( = ?auto_8864 ?auto_8857 ) ) ( not ( = ?auto_8864 ?auto_8858 ) ) ( not ( = ?auto_8861 ?auto_8862 ) ) ( HOIST-AT ?auto_8863 ?auto_8861 ) ( not ( = ?auto_8865 ?auto_8863 ) ) ( SURFACE-AT ?auto_8858 ?auto_8861 ) ( ON ?auto_8858 ?auto_8866 ) ( CLEAR ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8866 ) ) ( not ( = ?auto_8858 ?auto_8866 ) ) ( not ( = ?auto_8864 ?auto_8866 ) ) ( IS-CRATE ?auto_8857 ) ( AVAILABLE ?auto_8863 ) ( SURFACE-AT ?auto_8857 ?auto_8861 ) ( ON ?auto_8857 ?auto_8860 ) ( CLEAR ?auto_8857 ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8858 ?auto_8860 ) ) ( not ( = ?auto_8864 ?auto_8860 ) ) ( not ( = ?auto_8866 ?auto_8860 ) ) ( TRUCK-AT ?auto_8859 ?auto_8862 ) ( SURFACE-AT ?auto_8867 ?auto_8862 ) ( CLEAR ?auto_8867 ) ( LIFTING ?auto_8865 ?auto_8864 ) ( IS-CRATE ?auto_8864 ) ( not ( = ?auto_8867 ?auto_8864 ) ) ( not ( = ?auto_8857 ?auto_8867 ) ) ( not ( = ?auto_8858 ?auto_8867 ) ) ( not ( = ?auto_8866 ?auto_8867 ) ) ( not ( = ?auto_8860 ?auto_8867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8867 ?auto_8864 )
      ( MAKE-2CRATE ?auto_8864 ?auto_8857 ?auto_8858 )
      ( MAKE-1CRATE-VERIFY ?auto_8857 ?auto_8858 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8868 - SURFACE
      ?auto_8869 - SURFACE
      ?auto_8870 - SURFACE
    )
    :vars
    (
      ?auto_8872 - HOIST
      ?auto_8875 - PLACE
      ?auto_8877 - PLACE
      ?auto_8873 - HOIST
      ?auto_8874 - SURFACE
      ?auto_8876 - SURFACE
      ?auto_8878 - TRUCK
      ?auto_8871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8872 ?auto_8875 ) ( IS-CRATE ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8877 ?auto_8875 ) ) ( HOIST-AT ?auto_8873 ?auto_8877 ) ( not ( = ?auto_8872 ?auto_8873 ) ) ( SURFACE-AT ?auto_8870 ?auto_8877 ) ( ON ?auto_8870 ?auto_8874 ) ( CLEAR ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8874 ) ) ( not ( = ?auto_8870 ?auto_8874 ) ) ( not ( = ?auto_8868 ?auto_8874 ) ) ( IS-CRATE ?auto_8869 ) ( AVAILABLE ?auto_8873 ) ( SURFACE-AT ?auto_8869 ?auto_8877 ) ( ON ?auto_8869 ?auto_8876 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8869 ?auto_8876 ) ) ( not ( = ?auto_8870 ?auto_8876 ) ) ( not ( = ?auto_8868 ?auto_8876 ) ) ( not ( = ?auto_8874 ?auto_8876 ) ) ( TRUCK-AT ?auto_8878 ?auto_8875 ) ( SURFACE-AT ?auto_8871 ?auto_8875 ) ( CLEAR ?auto_8871 ) ( LIFTING ?auto_8872 ?auto_8868 ) ( IS-CRATE ?auto_8868 ) ( not ( = ?auto_8871 ?auto_8868 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8874 ?auto_8871 ) ) ( not ( = ?auto_8876 ?auto_8871 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8869 ?auto_8870 )
      ( MAKE-2CRATE-VERIFY ?auto_8868 ?auto_8869 ?auto_8870 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8880 - SURFACE
      ?auto_8881 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8879 - SURFACE
    )
    :vars
    (
      ?auto_8884 - HOIST
      ?auto_8887 - PLACE
      ?auto_8888 - PLACE
      ?auto_8885 - HOIST
      ?auto_8883 - SURFACE
      ?auto_8886 - SURFACE
      ?auto_8889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8884 ?auto_8887 ) ( IS-CRATE ?auto_8879 ) ( not ( = ?auto_8882 ?auto_8879 ) ) ( not ( = ?auto_8881 ?auto_8882 ) ) ( not ( = ?auto_8881 ?auto_8879 ) ) ( not ( = ?auto_8888 ?auto_8887 ) ) ( HOIST-AT ?auto_8885 ?auto_8888 ) ( not ( = ?auto_8884 ?auto_8885 ) ) ( SURFACE-AT ?auto_8879 ?auto_8888 ) ( ON ?auto_8879 ?auto_8883 ) ( CLEAR ?auto_8879 ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( IS-CRATE ?auto_8882 ) ( AVAILABLE ?auto_8885 ) ( SURFACE-AT ?auto_8882 ?auto_8888 ) ( ON ?auto_8882 ?auto_8886 ) ( CLEAR ?auto_8882 ) ( not ( = ?auto_8882 ?auto_8886 ) ) ( not ( = ?auto_8879 ?auto_8886 ) ) ( not ( = ?auto_8881 ?auto_8886 ) ) ( not ( = ?auto_8883 ?auto_8886 ) ) ( TRUCK-AT ?auto_8889 ?auto_8887 ) ( SURFACE-AT ?auto_8880 ?auto_8887 ) ( CLEAR ?auto_8880 ) ( LIFTING ?auto_8884 ?auto_8881 ) ( IS-CRATE ?auto_8881 ) ( not ( = ?auto_8880 ?auto_8881 ) ) ( not ( = ?auto_8882 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8880 ) ) ( not ( = ?auto_8883 ?auto_8880 ) ) ( not ( = ?auto_8886 ?auto_8880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8881 ?auto_8882 ?auto_8879 )
      ( MAKE-3CRATE-VERIFY ?auto_8880 ?auto_8881 ?auto_8882 ?auto_8879 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8891 - SURFACE
      ?auto_8892 - SURFACE
      ?auto_8893 - SURFACE
      ?auto_8890 - SURFACE
      ?auto_8894 - SURFACE
    )
    :vars
    (
      ?auto_8896 - HOIST
      ?auto_8899 - PLACE
      ?auto_8900 - PLACE
      ?auto_8897 - HOIST
      ?auto_8895 - SURFACE
      ?auto_8898 - SURFACE
      ?auto_8901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8896 ?auto_8899 ) ( IS-CRATE ?auto_8894 ) ( not ( = ?auto_8890 ?auto_8894 ) ) ( not ( = ?auto_8893 ?auto_8890 ) ) ( not ( = ?auto_8893 ?auto_8894 ) ) ( not ( = ?auto_8900 ?auto_8899 ) ) ( HOIST-AT ?auto_8897 ?auto_8900 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( SURFACE-AT ?auto_8894 ?auto_8900 ) ( ON ?auto_8894 ?auto_8895 ) ( CLEAR ?auto_8894 ) ( not ( = ?auto_8890 ?auto_8895 ) ) ( not ( = ?auto_8894 ?auto_8895 ) ) ( not ( = ?auto_8893 ?auto_8895 ) ) ( IS-CRATE ?auto_8890 ) ( AVAILABLE ?auto_8897 ) ( SURFACE-AT ?auto_8890 ?auto_8900 ) ( ON ?auto_8890 ?auto_8898 ) ( CLEAR ?auto_8890 ) ( not ( = ?auto_8890 ?auto_8898 ) ) ( not ( = ?auto_8894 ?auto_8898 ) ) ( not ( = ?auto_8893 ?auto_8898 ) ) ( not ( = ?auto_8895 ?auto_8898 ) ) ( TRUCK-AT ?auto_8901 ?auto_8899 ) ( SURFACE-AT ?auto_8892 ?auto_8899 ) ( CLEAR ?auto_8892 ) ( LIFTING ?auto_8896 ?auto_8893 ) ( IS-CRATE ?auto_8893 ) ( not ( = ?auto_8892 ?auto_8893 ) ) ( not ( = ?auto_8890 ?auto_8892 ) ) ( not ( = ?auto_8894 ?auto_8892 ) ) ( not ( = ?auto_8895 ?auto_8892 ) ) ( not ( = ?auto_8898 ?auto_8892 ) ) ( ON ?auto_8892 ?auto_8891 ) ( not ( = ?auto_8891 ?auto_8892 ) ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( not ( = ?auto_8891 ?auto_8890 ) ) ( not ( = ?auto_8891 ?auto_8894 ) ) ( not ( = ?auto_8891 ?auto_8895 ) ) ( not ( = ?auto_8891 ?auto_8898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8893 ?auto_8890 ?auto_8894 )
      ( MAKE-4CRATE-VERIFY ?auto_8891 ?auto_8892 ?auto_8893 ?auto_8890 ?auto_8894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9173 - SURFACE
      ?auto_9174 - SURFACE
    )
    :vars
    (
      ?auto_9180 - HOIST
      ?auto_9178 - PLACE
      ?auto_9175 - SURFACE
      ?auto_9182 - PLACE
      ?auto_9176 - HOIST
      ?auto_9181 - SURFACE
      ?auto_9177 - TRUCK
      ?auto_9179 - SURFACE
      ?auto_9183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9180 ?auto_9178 ) ( IS-CRATE ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9175 ?auto_9173 ) ) ( not ( = ?auto_9175 ?auto_9174 ) ) ( not ( = ?auto_9182 ?auto_9178 ) ) ( HOIST-AT ?auto_9176 ?auto_9182 ) ( not ( = ?auto_9180 ?auto_9176 ) ) ( SURFACE-AT ?auto_9174 ?auto_9182 ) ( ON ?auto_9174 ?auto_9181 ) ( CLEAR ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9181 ) ) ( not ( = ?auto_9174 ?auto_9181 ) ) ( not ( = ?auto_9175 ?auto_9181 ) ) ( SURFACE-AT ?auto_9175 ?auto_9178 ) ( CLEAR ?auto_9175 ) ( IS-CRATE ?auto_9173 ) ( AVAILABLE ?auto_9180 ) ( TRUCK-AT ?auto_9177 ?auto_9182 ) ( SURFACE-AT ?auto_9173 ?auto_9182 ) ( ON ?auto_9173 ?auto_9179 ) ( CLEAR ?auto_9173 ) ( not ( = ?auto_9173 ?auto_9179 ) ) ( not ( = ?auto_9174 ?auto_9179 ) ) ( not ( = ?auto_9175 ?auto_9179 ) ) ( not ( = ?auto_9181 ?auto_9179 ) ) ( LIFTING ?auto_9176 ?auto_9183 ) ( IS-CRATE ?auto_9183 ) ( not ( = ?auto_9173 ?auto_9183 ) ) ( not ( = ?auto_9174 ?auto_9183 ) ) ( not ( = ?auto_9175 ?auto_9183 ) ) ( not ( = ?auto_9181 ?auto_9183 ) ) ( not ( = ?auto_9179 ?auto_9183 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9176 ?auto_9183 ?auto_9177 ?auto_9182 )
      ( MAKE-2CRATE ?auto_9175 ?auto_9173 ?auto_9174 )
      ( MAKE-1CRATE-VERIFY ?auto_9173 ?auto_9174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9184 - SURFACE
      ?auto_9185 - SURFACE
      ?auto_9186 - SURFACE
    )
    :vars
    (
      ?auto_9194 - HOIST
      ?auto_9193 - PLACE
      ?auto_9192 - PLACE
      ?auto_9187 - HOIST
      ?auto_9190 - SURFACE
      ?auto_9189 - TRUCK
      ?auto_9188 - SURFACE
      ?auto_9191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9194 ?auto_9193 ) ( IS-CRATE ?auto_9186 ) ( not ( = ?auto_9185 ?auto_9186 ) ) ( not ( = ?auto_9184 ?auto_9185 ) ) ( not ( = ?auto_9184 ?auto_9186 ) ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( HOIST-AT ?auto_9187 ?auto_9192 ) ( not ( = ?auto_9194 ?auto_9187 ) ) ( SURFACE-AT ?auto_9186 ?auto_9192 ) ( ON ?auto_9186 ?auto_9190 ) ( CLEAR ?auto_9186 ) ( not ( = ?auto_9185 ?auto_9190 ) ) ( not ( = ?auto_9186 ?auto_9190 ) ) ( not ( = ?auto_9184 ?auto_9190 ) ) ( SURFACE-AT ?auto_9184 ?auto_9193 ) ( CLEAR ?auto_9184 ) ( IS-CRATE ?auto_9185 ) ( AVAILABLE ?auto_9194 ) ( TRUCK-AT ?auto_9189 ?auto_9192 ) ( SURFACE-AT ?auto_9185 ?auto_9192 ) ( ON ?auto_9185 ?auto_9188 ) ( CLEAR ?auto_9185 ) ( not ( = ?auto_9185 ?auto_9188 ) ) ( not ( = ?auto_9186 ?auto_9188 ) ) ( not ( = ?auto_9184 ?auto_9188 ) ) ( not ( = ?auto_9190 ?auto_9188 ) ) ( LIFTING ?auto_9187 ?auto_9191 ) ( IS-CRATE ?auto_9191 ) ( not ( = ?auto_9185 ?auto_9191 ) ) ( not ( = ?auto_9186 ?auto_9191 ) ) ( not ( = ?auto_9184 ?auto_9191 ) ) ( not ( = ?auto_9190 ?auto_9191 ) ) ( not ( = ?auto_9188 ?auto_9191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9185 ?auto_9186 )
      ( MAKE-2CRATE-VERIFY ?auto_9184 ?auto_9185 ?auto_9186 ) )
  )

)

