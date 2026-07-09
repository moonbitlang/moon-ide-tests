# rabbita outline

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide outline 'js\cast.mbt'
  6 |#cfg(target="js")
  7 |pub(open) trait Cast {
    |...
 25 |#cfg(target="js")
 26 |extern "js" fn checked_cast_string_ffi(value : Value) -> Nullable[String] =
    |...
 30 |#cfg(target="js")
 31 |extern "js" fn checked_cast_int_ffi(value : Value) -> Nullable[Int] =
    |...
 35 |#cfg(target="js")
 36 |extern "js" fn checked_cast_double_ffi(value : Value) -> Nullable[Double] =
    |...
 40 |#cfg(target="js")
 41 |extern "js" fn checked_cast_bool_ffi(value : Value) -> Nullable[Bool] =
    |...
 45 |#cfg(target="js")
 46 |extern "js" fn checked_cast_array_ffi(value : Value) -> Nullable[Array[Value]] =
    |...
 50 |#cfg(target="js")
 51 |pub impl Cast for String with fn into(value) {
    |...
 56 |#cfg(target="js")
 57 |pub impl Cast for String with fn from(value) {
    |...
 62 |#cfg(target="js")
 63 |pub impl Cast for Int with fn into(value) {
    |...
 68 |#cfg(target="js")
 69 |pub impl Cast for Int with fn from(value) {
    |...
 74 |#cfg(target="js")
 75 |pub impl Cast for Double with fn into(value) {
    |...
 80 |#cfg(target="js")
 81 |pub impl Cast for Double with fn from(value) {
    |...
 86 |#cfg(target="js")
 87 |pub impl Cast for Bool with fn into(value) {
    |...
 92 |#cfg(target="js")
 93 |pub impl Cast for Bool with fn from(value) {
    |...
 98 |#cfg(target="js")
 99 |pub impl[A : Cast] Cast for Array[A] with fn into(value) {
    |...
113 |#cfg(target="js")
114 |pub impl[A : Cast] Cast for Array[A] with fn from(value) {
    |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide outline 'js\null.mbt'
 2 |#cfg(target="js")
 3 |#external
 4 |type Nullable[_]
   |...
 7 |#cfg(target="js")
 8 |pub fn[T] Nullable::is_null(self : Nullable[T]) -> Bool {
   |...
13 |#cfg(target="js")
14 |#deprecated("get_exn does not check for null values. Use unwrap instead", skip_current_package=true)
15 |pub fn[T] Nullable::get_exn(self : Nullable[T]) -> T = "%identity"
   |...
19 |#cfg(target="js")
20 |pub fn[T] Nullable::unwrap(self : Nullable[T]) -> T {
   |...
28 |#cfg(target="js")
29 |pub fn[T] Nullable::to_option(self : Nullable[T]) -> T? {
   |...
35 |#cfg(target="js")
36 |pub fn[T] Nullable::null() -> Nullable[T] {
   |...
41 |#cfg(target="js")
42 |pub fn[T] Nullable::from_option(value : T?) -> Nullable[T] {
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide outline 'js\async.mbt'
 2 |#cfg(target="js")
 3 |pub async fn[T, E : Error] suspend(
 4 |  f : ((T) -> Unit, (E) -> Unit) -> Unit,
 5 |) -> T raise E = "%async.suspend"
   |...
 8 |#cfg(target="js")
 9 |pub fn async_run(f : async () -> Unit noraise) -> Unit = "%async.run"
   |...
19 |#cfg(target="js")
20 |#external
21 |pub type Promise
   |...
24 |#cfg(target="js")
25 |extern "js" fn Promise::wait_ffi(
26 |  self : Promise,
27 |  on_ok : (Value) -> Unit,
28 |  on_err : (Value) -> Unit,
29 |) -> Unit =
   |...
33 |#cfg(target="js")
34 |pub async fn Promise::wait(self : Promise) -> Value {
   |...
47 |#cfg(target="js")
48 |pub fn[T] Promise::unsafe_new(op : async () -> T) -> Promise {
   |...
53 |#cfg(target="js")
54 |extern "js" fn Promise::new_ffi(op : async () -> Value) -> Promise =
   |...
58 |#cfg(target="js")
59 |pub fn[T, E : Error] spawn_detach(op : async () -> T raise E) -> Unit {
   |...
70 |#cfg(target="js")
71 |pub extern "js" fn Promise::all(promises : Array[Promise]) -> Promise = "(ps) => Promise.all(ps)"
   |...
75 |#cfg(target="js")
76 |pub async fn[T] async_all(ops : Array[async () -> T]) -> Array[T] {
   |...
83 |#cfg(target="js")
84 |async fn async_all_raw(ops : Array[async () -> Value]) -> Array[Value] {
   |...
89 |#cfg(target="js")
90 |pub fn async_test(op : async () -> Unit) -> Unit {
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide outline 'js\error.mbt'
 2 |#cfg(target="js")
 3 |pub suberror Error_ {
   |...
 8 |#cfg(target="js")
 9 |extern "js" fn Error_::cause_ffi(self : Value) -> Value = "(self) => self.cause"
   |...
12 |#cfg(target="js")
13 |pub fn Error_::cause(self : Error_) -> Value? {
   |...
21 |#cfg(target="js")
22 |pub impl Show for Error_ with fn output(self, logger) {
   |...
32 |#cfg(target="js")
33 |extern "js" fn Error_::wrap_ffi(
34 |  op : () -> Value,
35 |  on_ok : (Value) -> Unit,
36 |  on_error : (Value) -> Unit,
37 |) -> Unit =
   |...
41 |#cfg(target="js")
42 |pub fn[T] Error_::wrap(
43 |  op : () -> Value,
44 |  map_ok? : (Value) -> T = Value::cast,
45 |) -> T raise Error_ {
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide outline 'js\union.mbt'
  3 |#cfg(target="js")
  4 |#external
  5 |type Union2[_, _]
    |...
  8 |#cfg(target="js")
  9 |pub fn[A : Cast, B] Union2::to0(self : Union2[A, B]) -> A? {
    |...
 14 |#cfg(target="js")
 15 |pub fn[A, B : Cast] Union2::to1(self : Union2[A, B]) -> B? {
    |...
 20 |#cfg(target="js")
 21 |pub fn[A : Cast, B] Union2::from0(value : A) -> Union2[A, B] {
    |...
 26 |#cfg(target="js")
 27 |pub fn[A, B : Cast] Union2::from1(value : B) -> Union2[A, B] {
    |...
 33 |#cfg(target="js")
 34 |#external
 35 |type Union3[_, _, _]
    |...
 38 |#cfg(target="js")
 39 |pub fn[A : Cast, B, C] Union3::to0(self : Union3[A, B, C]) -> A? {
    |...
 44 |#cfg(target="js")
 45 |pub fn[A, B : Cast, C] Union3::to1(self : Union3[A, B, C]) -> B? {
    |...
 50 |#cfg(target="js")
 51 |pub fn[A, B, C : Cast] Union3::to2(self : Union3[A, B, C]) -> C? {
    |...
 56 |#cfg(target="js")
 57 |pub fn[A : Cast, B, C] Union3::from0(value : A) -> Union3[A, B, C] {
    |...
 62 |#cfg(target="js")
 63 |pub fn[A, B : Cast, C] Union3::from1(value : B) -> Union3[A, B, C] {
    |...
 68 |#cfg(target="js")
 69 |pub fn[A, B, C : Cast] Union3::from2(value : C) -> Union3[A, B, C] {
    |...
 75 |#cfg(target="js")
 76 |#external
 77 |type Union4[_, _, _, _]
    |...
 80 |#cfg(target="js")
 81 |pub fn[A : Cast, B, C, D] Union4::to0(self : Union4[A, B, C, D]) -> A? {
    |...
 86 |#cfg(target="js")
 87 |pub fn[A, B : Cast, C, D] Union4::to1(self : Union4[A, B, C, D]) -> B? {
    |...
 92 |#cfg(target="js")
 93 |pub fn[A, B, C : Cast, D] Union4::to2(self : Union4[A, B, C, D]) -> C? {
    |...
 98 |#cfg(target="js")
 99 |pub fn[A, B, C, D : Cast] Union4::to3(self : Union4[A, B, C, D]) -> D? {
    |...
104 |#cfg(target="js")
105 |pub fn[A : Cast, B, C, D] Union4::from0(value : A) -> Union4[A, B, C, D] {
    |...
110 |#cfg(target="js")
111 |pub fn[A, B : Cast, C, D] Union4::from1(value : B) -> Union4[A, B, C, D] {
    |...
116 |#cfg(target="js")
117 |pub fn[A, B, C : Cast, D] Union4::from2(value : C) -> Union4[A, B, C, D] {
    |...
122 |#cfg(target="js")
123 |pub fn[A, B, C, D : Cast] Union4::from3(value : D) -> Union4[A, B, C, D] {
    |...
129 |#cfg(target="js")
130 |#external
131 |type Union5[_, _, _, _, _]
    |...
134 |#cfg(target="js")
135 |pub fn[A : Cast, B, C, D, E] Union5::to0(self : Union5[A, B, C, D, E]) -> A? {
    |...
140 |#cfg(target="js")
141 |pub fn[A, B : Cast, C, D, E] Union5::to1(self : Union5[A, B, C, D, E]) -> B? {
    |...
146 |#cfg(target="js")
147 |pub fn[A, B, C : Cast, D, E] Union5::to2(self : Union5[A, B, C, D, E]) -> C? {
    |...
152 |#cfg(target="js")
153 |pub fn[A, B, C, D : Cast, E] Union5::to3(self : Union5[A, B, C, D, E]) -> D? {
    |...
158 |#cfg(target="js")
159 |pub fn[A, B, C, D, E : Cast] Union5::to4(self : Union5[A, B, C, D, E]) -> E? {
    |...
164 |#cfg(target="js")
165 |pub fn[A : Cast, B, C, D, E] Union5::from0(value : A) -> Union5[A, B, C, D, E] {
    |...
170 |#cfg(target="js")
171 |pub fn[A, B : Cast, C, D, E] Union5::from1(value : B) -> Union5[A, B, C, D, E] {
    |...
176 |#cfg(target="js")
177 |pub fn[A, B, C : Cast, D, E] Union5::from2(value : C) -> Union5[A, B, C, D, E] {
    |...
182 |#cfg(target="js")
183 |pub fn[A, B, C, D : Cast, E] Union5::from3(value : D) -> Union5[A, B, C, D, E] {
    |...
188 |#cfg(target="js")
189 |pub fn[A, B, C, D, E : Cast] Union5::from4(value : E) -> Union5[A, B, C, D, E] {
    |...
195 |#cfg(target="js")
196 |#external
197 |type Union6[_, _, _, _, _, _]
    |...
200 |#cfg(target="js")
201 |pub fn[A : Cast, B, C, D, E, F] Union6::to0(
202 |  self : Union6[A, B, C, D, E, F],
203 |) -> A? {
    |...
208 |#cfg(target="js")
209 |pub fn[A, B : Cast, C, D, E, F] Union6::to1(
210 |  self : Union6[A, B, C, D, E, F],
211 |) -> B? {
    |...
216 |#cfg(target="js")
217 |pub fn[A, B, C : Cast, D, E, F] Union6::to2(
218 |  self : Union6[A, B, C, D, E, F],
219 |) -> C? {
    |...
224 |#cfg(target="js")
225 |pub fn[A, B, C, D : Cast, E, F] Union6::to3(
226 |  self : Union6[A, B, C, D, E, F],
227 |) -> D? {
    |...
232 |#cfg(target="js")
233 |pub fn[A, B, C, D, E : Cast, F] Union6::to4(
234 |  self : Union6[A, B, C, D, E, F],
235 |) -> E? {
    |...
240 |#cfg(target="js")
241 |pub fn[A, B, C, D, E, F : Cast] Union6::to5(
242 |  self : Union6[A, B, C, D, E, F],
243 |) -> F? {
    |...
248 |#cfg(target="js")
249 |pub fn[A : Cast, B, C, D, E, F] Union6::from0(
250 |  value : A,
251 |) -> Union6[A, B, C, D, E, F] {
    |...
256 |#cfg(target="js")
257 |pub fn[A, B : Cast, C, D, E, F] Union6::from1(
258 |  value : B,
259 |) -> Union6[A, B, C, D, E, F] {
    |...
264 |#cfg(target="js")
265 |pub fn[A, B, C : Cast, D, E, F] Union6::from2(
266 |  value : C,
267 |) -> Union6[A, B, C, D, E, F] {
    |...
272 |#cfg(target="js")
273 |pub fn[A, B, C, D : Cast, E, F] Union6::from3(
274 |  value : D,
275 |) -> Union6[A, B, C, D, E, F] {
    |...
280 |#cfg(target="js")
281 |pub fn[A, B, C, D, E : Cast, F] Union6::from4(
282 |  value : E,
283 |) -> Union6[A, B, C, D, E, F] {
    |...
288 |#cfg(target="js")
289 |pub fn[A, B, C, D, E, F : Cast] Union6::from5(
290 |  value : F,
291 |) -> Union6[A, B, C, D, E, F] {
    |...
297 |#cfg(target="js")
298 |#external
299 |type Union7[_, _, _, _, _, _, _]
    |...
302 |#cfg(target="js")
303 |pub fn[A : Cast, B, C, D, E, F, G] Union7::to0(
304 |  self : Union7[A, B, C, D, E, F, G],
305 |) -> A? {
    |...
310 |#cfg(target="js")
311 |pub fn[A, B : Cast, C, D, E, F, G] Union7::to1(
312 |  self : Union7[A, B, C, D, E, F, G],
313 |) -> B? {
    |...
318 |#cfg(target="js")
319 |pub fn[A, B, C : Cast, D, E, F, G] Union7::to2(
320 |  self : Union7[A, B, C, D, E, F, G],
321 |) -> C? {
    |...
326 |#cfg(target="js")
327 |pub fn[A, B, C, D : Cast, E, F, G] Union7::to3(
328 |  self : Union7[A, B, C, D, E, F, G],
329 |) -> D? {
    |...
334 |#cfg(target="js")
335 |pub fn[A, B, C, D, E : Cast, F, G] Union7::to4(
336 |  self : Union7[A, B, C, D, E, F, G],
337 |) -> E? {
    |...
342 |#cfg(target="js")
343 |pub fn[A, B, C, D, E, F : Cast, G] Union7::to5(
344 |  self : Union7[A, B, C, D, E, F, G],
345 |) -> F? {
    |...
350 |#cfg(target="js")
351 |pub fn[A, B, C, D, E, F, G : Cast] Union7::to6(
352 |  self : Union7[A, B, C, D, E, F, G],
353 |) -> G? {
    |...
358 |#cfg(target="js")
359 |pub fn[A : Cast, B, C, D, E, F, G] Union7::from0(
360 |  value : A,
361 |) -> Union7[A, B, C, D, E, F, G] {
    |...
366 |#cfg(target="js")
367 |pub fn[A, B : Cast, C, D, E, F, G] Union7::from1(
368 |  value : B,
369 |) -> Union7[A, B, C, D, E, F, G] {
    |...
374 |#cfg(target="js")
375 |pub fn[A, B, C : Cast, D, E, F, G] Union7::from2(
376 |  value : C,
377 |) -> Union7[A, B, C, D, E, F, G] {
    |...
382 |#cfg(target="js")
383 |pub fn[A, B, C, D : Cast, E, F, G] Union7::from3(
384 |  value : D,
385 |) -> Union7[A, B, C, D, E, F, G] {
    |...
390 |#cfg(target="js")
391 |pub fn[A, B, C, D, E : Cast, F, G] Union7::from4(
392 |  value : E,
393 |) -> Union7[A, B, C, D, E, F, G] {
    |...
398 |#cfg(target="js")
399 |pub fn[A, B, C, D, E, F : Cast, G] Union7::from5(
400 |  value : F,
401 |) -> Union7[A, B, C, D, E, F, G] {
    |...
406 |#cfg(target="js")
407 |pub fn[A, B, C, D, E, F, G : Cast] Union7::from6(
408 |  value : G,
409 |) -> Union7[A, B, C, D, E, F, G] {
    |...
415 |#cfg(target="js")
416 |#external
417 |type Union8[_, _, _, _, _, _, _, _]
    |...
420 |#cfg(target="js")
421 |pub fn[A : Cast, B, C, D, E, F, G, H] Union8::to0(
422 |  self : Union8[A, B, C, D, E, F, G, H],
423 |) -> A? {
    |...
428 |#cfg(target="js")
429 |pub fn[A, B : Cast, C, D, E, F, G, H] Union8::to1(
430 |  self : Union8[A, B, C, D, E, F, G, H],
431 |) -> B? {
    |...
436 |#cfg(target="js")
437 |pub fn[A, B, C : Cast, D, E, F, G, H] Union8::to2(
438 |  self : Union8[A, B, C, D, E, F, G, H],
439 |) -> C? {
    |...
444 |#cfg(target="js")
445 |pub fn[A, B, C, D : Cast, E, F, G, H] Union8::to3(
446 |  self : Union8[A, B, C, D, E, F, G, H],
447 |) -> D? {
    |...
452 |#cfg(target="js")
453 |pub fn[A, B, C, D, E : Cast, F, G, H] Union8::to4(
454 |  self : Union8[A, B, C, D, E, F, G, H],
455 |) -> E? {
    |...
460 |#cfg(target="js")
461 |pub fn[A, B, C, D, E, F : Cast, G, H] Union8::to5(
462 |  self : Union8[A, B, C, D, E, F, G, H],
463 |) -> F? {
    |...
468 |#cfg(target="js")
469 |pub fn[A, B, C, D, E, F, G : Cast, H] Union8::to6(
470 |  self : Union8[A, B, C, D, E, F, G, H],
471 |) -> G? {
    |...
476 |#cfg(target="js")
477 |pub fn[A, B, C, D, E, F, G, H : Cast] Union8::to7(
478 |  self : Union8[A, B, C, D, E, F, G, H],
479 |) -> H? {
    |...
484 |#cfg(target="js")
485 |pub fn[A : Cast, B, C, D, E, F, G, H] Union8::from0(
486 |  value : A,
487 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
492 |#cfg(target="js")
493 |pub fn[A, B : Cast, C, D, E, F, G, H] Union8::from1(
494 |  value : B,
495 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
500 |#cfg(target="js")
501 |pub fn[A, B, C : Cast, D, E, F, G, H] Union8::from2(
502 |  value : C,
503 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
508 |#cfg(target="js")
509 |pub fn[A, B, C, D : Cast, E, F, G, H] Union8::from3(
510 |  value : D,
511 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
516 |#cfg(target="js")
517 |pub fn[A, B, C, D, E : Cast, F, G, H] Union8::from4(
518 |  value : E,
519 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
524 |#cfg(target="js")
525 |pub fn[A, B, C, D, E, F : Cast, G, H] Union8::from5(
526 |  value : F,
527 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
532 |#cfg(target="js")
533 |pub fn[A, B, C, D, E, F, G : Cast, H] Union8::from6(
534 |  value : G,
535 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...
540 |#cfg(target="js")
541 |pub fn[A, B, C, D, E, F, G, H : Cast] Union8::from7(
542 |  value : H,
543 |) -> Union8[A, B, C, D, E, F, G, H] {
    |...

```
