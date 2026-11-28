# core rename TlsTrustMode async/tls/tls.wasm.mbt:20:11

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'TlsTrustMode' 'TlsTrustModeRenamed' --loc 'async/tls/tls.wasm.mbt:20:11'
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
   host : @os_string.OsString,
   host_len~ : Int32 = host.to_string().length(),
   sni~ : Bool,
-  trust : TlsTrustMode,
+  trust : TlsTrustModeRenamed,
 ) -> Int32 = "moonbitlang/async" "tls/connection/set_client"
 
 ///|
*** End Patch
"" (escaped)
```
