# rabbita find-references host rabbita\internal\runtime\host_ssr_wbtest.mbt:4:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'host' --loc 'rabbita\internal\runtime\host_ssr_wbtest.mbt:4:7' --target native
Found 2 references for symbol 'host':
<WORKDIR>/rabbita\internal\runtime\host_ssr_wbtest.mbt:17:9-17:13:
   |       )
   |     },
   |   )
17 |   defer host.cleanup()
   |         ^^^^
   |   assert_eq(
   |     host.get_base_uri(),

<WORKDIR>/rabbita\internal\runtime\host_ssr_wbtest.mbt:19:5-19:9:
   |   )
   |   defer host.cleanup()
   |   assert_eq(
19 |     host.get_base_uri(),
   |     ^^^^
   |     "https://example.test/site/uml/index.html?lang=en",
   |   )

```
