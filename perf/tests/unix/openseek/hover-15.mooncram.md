# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'SelectionsOverlay' --loc 'editor/internal/viewer/browser/view/selections.mbt:10:13' --target js --no-check
///|
/// The package-private selection dynamic overlay state: the prepared per-line
/// HTML (`_renderResult`).
priv struct SelectionsOverlay {
            ^^^^^^^^^^^^^^^^^
            ```moonbit
            struct SelectionsOverlay {
              mut render_result: Array[String]
            }
            ```
            ---
            
             The package-private selection dynamic overlay state: the prepared per-line
             HTML (`_renderResult`).
  mut render_result : Array[String]
}
```
