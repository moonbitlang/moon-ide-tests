# core find-references TlsTrustMode async/tls/tls.wasm.mbt:20:11

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
$ run_moon_ide moon ide find-references 'TlsTrustMode' --loc 'async/tls/tls.wasm.mbt:20:11'
Found 2 references for symbol 'TlsTrustMode':
<WORKDIR>/async/tls/tls.wasm.mbt:52:45-52:57:
   | const TLS_RENEGOTIATION = -4
   | 
   | ///|
52 | fn TrustedRoot::mode(self : TrustedRoot) -> TlsTrustMode {
   |                                             ^^^^^^^^^^^^
   |   match self {
   |     NoVerification => TrustNoVerification

<WORKDIR>/async/tls/tls.wasm.mbt:79:11-79:23:
   |   host : String,
   |   host_len~ : Int32 = host.length(),
   |   sni~ : Bool,
79 |   trust : TlsTrustMode,
   |           ^^^^^^^^^^^^
   | ) -> Int32 = "moonbitlang/async" "tls/connection/set_client"
   | 

```
