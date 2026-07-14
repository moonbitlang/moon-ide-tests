# rabbita rename embbed_devtool_css warren\embbed_devtool.mbt:8:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'embbed_devtool_css' 'embbed_devtool_css_renamed' --loc 'warren\embbed_devtool.mbt:8:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren\embbed_devtool.mbt
@@
 
 ///|
 #warnings("-unused_value")
-let embbed_devtool_css : String =
+let embbed_devtool_css_renamed : String =
   #|body {
   #|  margin: 0;
   #|  font-family: system-ui, sans-serif;
*** Update File: <WORKDIR>/warren\main.mbt
@@
   }
   vfs.mount("/index.html", FileContent(shell_html_template))
   vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js))
-  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css))
+  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css_renamed))
 
   @async.with_task_group <| group => {
     let hub = Devhub(port, vfs)
*** End Patch

```
