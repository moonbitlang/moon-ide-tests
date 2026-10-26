# core find-references TlsTrustMode async\tls\tls.wasm.mbt:20:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'TlsTrustMode' --loc 'async\tls\tls.wasm.mbt:20:11'
Found 2 references for symbol 'TlsTrustMode':
<WORKDIR>/async\tls\tls.wasm.mbt:52:45-52:57:
   | const TLS_RENEGOTIATION = -4
   | 
   | ///|
52 | fn TrustedRoot::mode(self : TrustedRoot) -> TlsTrustMode {
   |                                             ^^^^^^^^^^^^
   |   match self {
   |     NoVerification => TrustNoVerification

<WORKDIR>/async\tls\tls.wasm.mbt:79:11-79:23:
   |   host : String,
   |   host_len~ : Int32 = host.length(),
   |   sni~ : Bool,
79 |   trust : TlsTrustMode,
   |           ^^^^^^^^^^^^
   | ) -> Int32 = "moonbitlang/async" "tls/connection/set_client"
   | 

```
