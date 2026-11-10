# core rename TlsTrustMode async/tls/tls.wasm.mbt:20:11

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'TlsTrustMode' 'TlsTrustModeRenamed' --loc 'async/tls/tls.wasm.mbt:20:11'
*** Begin Patch
*** Update File: <WORKDIR>/async/tls/tls.wasm.mbt
@@
 priv struct TlsConnectionHandle(UInt64)
 
 ///|
-priv enum TlsTrustMode {
+priv enum TlsTrustModeRenamed {
   TrustNoVerification = 0
   TrustSystemRoot = 1
   TrustCustomRoot = 2
@@
 const TLS_RENEGOTIATION = -4
 
 ///|
-fn TrustedRoot::mode(self : TrustedRoot) -> TlsTrustMode {
+fn TrustedRoot::mode(self : TrustedRoot) -> TlsTrustModeRenamed {
   match self {
     NoVerification => TrustNoVerification
     SystemRoot => TrustSystemRoot
@@
   host : String,
   host_len~ : Int32 = host.length(),
   sni~ : Bool,
-  trust : TlsTrustMode,
+  trust : TlsTrustModeRenamed,
 ) -> Int32 = "moonbitlang/async" "tls/connection/set_client"
 
 ///|
*** End Patch

```
