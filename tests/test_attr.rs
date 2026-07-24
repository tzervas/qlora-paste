#![allow(clippy::let_underscore_untyped)]

use qlora_paste::paste;
use qlora_paste_test_suite::paste_test;

#[test]
fn test_attr() {
    paste! {
        #[paste_test(k = "val" "ue")]
        struct A;

        #[qlora_paste_test_suite::paste_test(k = "val" "ue")]
        struct B;

        #[::qlora_paste_test_suite::paste_test(k = "val" "ue")]
        struct C;

        #[paste_test(k = "va" [<l u>] e)]
        struct D;
    }

    let _ = A;
    let _ = B;
    let _ = C;
    let _ = D;
}

#[test]
fn test_paste_cfg() {
    macro_rules! m {
        ($ret:ident, $width:expr) => {
            paste! {
                #[cfg(any(feature = "protocol_feature_" $ret:snake, target_pointer_width = "" $width))]
                fn new() -> $ret { todo!() }
            }
        };
    }

    struct Paste;

    #[cfg(target_pointer_width = "64")]
    m!(Paste, 64);
    #[cfg(target_pointer_width = "32")]
    m!(Paste, 32);

    let _ = new;
}

#[test]
fn test_path_in_attr() {
    macro_rules! m {
        (#[x = $x:ty]) => {
            stringify!($x)
        };
    }

    let ty = paste! {
        m!(#[x = foo::Bar])
    };

    assert_eq!("foo::Bar", ty);
}

/// Regression/guard for attribute string-literal concatenation beyond `#[doc]`
/// (upstream behavior from dtolnay/paste#57; docs clarified in proposed #105).
#[test]
fn test_attr_string_literal_concat_non_doc() {
    // Concatenate into a non-doc attribute string the same way #57/#105 describe.
    // Using `protocol_feature_` prefix keeps check-cfg quiet (see test_paste_cfg).
    macro_rules! m {
        ($ret:ident) => {
            paste! {
                #[cfg(feature = "protocol_feature_" $ret:snake)]
                fn gated_on() -> bool {
                    true
                }

                #[cfg(not(feature = "protocol_feature_" $ret:snake))]
                fn gated_on() -> bool {
                    false
                }
            }
        };
    }

    struct Paste;
    m!(Paste);
    // Feature is not enabled; pasting still produced a valid cfg string.
    assert!(!gated_on());
    let _: Paste = Paste;
}
