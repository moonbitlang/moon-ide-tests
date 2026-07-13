# core find-references profile string\internal\regex_engine\regex.mbt:17:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'profile' --loc 'string\internal\regex_engine\regex.mbt:17:3'
Found 5 references for symbol 'profile':
<WORKDIR>/string\internal\regex_engine\execute.mbt:57:18-57:25:
   |   guard last_index >= 0 && last_index <= input.length() else { panic() }
   |   let symbol_table = self.symbol_table
   |   let prev_cat = category_from_symbol(
57 |     profile=self.profile,
   |                  ^^^^^^^
   |     symbol_repr=self.symbol_repr,
   |     if last_index == 0 {

<WORKDIR>/string\internal\regex_engine\execute.mbt:107:22-107:29:
    |     Failed => None
    |     Running => {
    |       let next_cat = category_from_symbol(
107 |         profile=self.profile,
    |                      ^^^^^^^
    |         symbol_repr=self.symbol_repr,
    |         if pos >= end {

<WORKDIR>/string\internal\regex_engine\regex.mbt:17:3-17:10:
   | 
   | ///|
   | struct Regex {
17 |   profile : Profile
   |   ^^^^^^^
   |   ctx : @automata.Context
   |   expr : @automata.Expr

<WORKDIR>/string\internal\regex_engine\regex.mbt:49:5-49:12:
   |   symbol_repr : ReadOnlyArray[Rechar],
   | ) -> Regex {
   |   {
49 |     profile,
   |     ^^^^^^^
   |     ctx,
   |     expr,

<WORKDIR>/string\internal\regex_engine\states.mbt:81:18-81:25:
   |   symbol : Rechar,
   | ) -> StateId {
   |   let cat = category_from_symbol(
81 |     profile=self.profile,
   |                  ^^^^^^^
   |     symbol_repr=self.symbol_repr,
   |     symbol,

```
