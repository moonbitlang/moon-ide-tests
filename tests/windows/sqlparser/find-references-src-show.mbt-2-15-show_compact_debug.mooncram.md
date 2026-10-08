# sqlparser find-references show_compact_debug src\show.mbt:2:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'show_compact_debug' --loc 'src\show.mbt:2:15'
Found 112 references for symbol 'show_compact_debug':
<WORKDIR>/src\show.mbt:40:3-40:21:
   | 
   | ///|
   | pub impl Show for Statements with fn output(self, logger) {
40 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:45:3-45:21:
   | 
   | ///|
   | pub impl Show for Statement with fn output(self, logger) {
45 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:50:3-50:21:
   | 
   | ///|
   | pub impl Show for QueryStmt with fn output(self, logger) {
50 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:55:3-55:21:
   | 
   | ///|
   | pub impl Show for SetExpr with fn output(self, logger) {
55 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:60:3-60:21:
   | 
   | ///|
   | pub impl Show for SelectStmt with fn output(self, logger) {
60 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:65:3-65:21:
   | 
   | ///|
   | pub impl Show for SetOperator with fn output(self, logger) {
65 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:70:3-70:21:
   | 
   | ///|
   | pub impl Show for Projection with fn output(self, logger) {
70 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:75:3-75:21:
   | 
   | ///|
   | pub impl Show for Expr with fn output(self, logger) {
75 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:80:3-80:21:
   | 
   | ///|
   | pub impl Show for Literal with fn output(self, logger) {
80 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:85:3-85:21:
   | 
   | ///|
   | pub impl Show for ArrayExpr with fn output(self, logger) {
85 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:90:3-90:21:
   | 
   | ///|
   | pub impl Show for AccessExpr with fn output(self, logger) {
90 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:95:3-95:21:
   | 
   | ///|
   | pub impl Show for Subscript with fn output(self, logger) {
95 |   show_compact_debug(self, logger)
   |   ^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\show.mbt:100:3-100:21:
    | 
    | ///|
    | pub impl Show for Cte with fn output(self, logger) {
100 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:105:3-105:21:
    | 
    | ///|
    | pub impl Show for BinaryOperator with fn output(self, logger) {
105 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:110:3-110:21:
    | 
    | ///|
    | pub impl Show for UnaryOperator with fn output(self, logger) {
110 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:115:3-115:21:
    | 
    | ///|
    | pub impl Show for OrderByExpr with fn output(self, logger) {
115 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:120:3-120:21:
    | 
    | ///|
    | pub impl Show for TableRef with fn output(self, logger) {
120 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:125:3-125:21:
    | 
    | ///|
    | pub impl Show for TableFactor with fn output(self, logger) {
125 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:130:3-130:21:
    | 
    | ///|
    | pub impl Show for TableAlias with fn output(self, logger) {
130 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:135:3-135:21:
    | 
    | ///|
    | pub impl Show for Join with fn output(self, logger) {
135 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:140:3-140:21:
    | 
    | ///|
    | pub impl Show for JoinOperator with fn output(self, logger) {
140 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:145:3-145:21:
    | 
    | ///|
    | pub impl Show for JoinConstraint with fn output(self, logger) {
145 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:150:3-150:21:
    | 
    | ///|
    | pub impl Show for IntervalQualifier with fn output(self, logger) {
150 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:155:3-155:21:
    | 
    | ///|
    | pub impl Show for PrimaryDatetimeField with fn output(self, logger) {
155 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:160:3-160:21:
    | 
    | ///|
    | pub impl Show for DatetimeUnit with fn output(self, logger) {
160 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:165:3-165:21:
    | 
    | ///|
    | pub impl Show for CaseExpr with fn output(self, logger) {
165 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:170:3-170:21:
    | 
    | ///|
    | pub impl Show for WindowSpec with fn output(self, logger) {
170 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:175:3-175:21:
    | 
    | ///|
    | pub impl Show for WindowFrameClause with fn output(self, logger) {
175 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:180:3-180:21:
    | 
    | ///|
    | pub impl Show for WindowFrameUnits with fn output(self, logger) {
180 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:185:3-185:21:
    | 
    | ///|
    | pub impl Show for WindowFrameBound with fn output(self, logger) {
185 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:190:3-190:21:
    | 
    | ///|
    | pub impl Show for CreateTableStmt with fn output(self, logger) {
190 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:195:3-195:21:
    | 
    | ///|
    | pub impl Show for CreateTableDefinition with fn output(self, logger) {
195 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:200:3-200:21:
    | 
    | ///|
    | pub impl Show for ColumnDef with fn output(self, logger) {
200 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:205:3-205:21:
    | 
    | ///|
    | pub impl Show for DataType with fn output(self, logger) {
205 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:210:3-210:21:
    | 
    | ///|
    | pub impl Show for ColumnDefOption with fn output(self, logger) {
210 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:215:3-215:21:
    | 
    | ///|
    | pub impl Show for CreateViewStmt with fn output(self, logger) {
215 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:220:3-220:21:
    | 
    | ///|
    | pub impl Show for ViewColumnDef with fn output(self, logger) {
220 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:225:3-225:21:
    | 
    | ///|
    | pub impl Show for CreateIndexStmt with fn output(self, logger) {
225 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:230:3-230:21:
    | 
    | ///|
    | pub impl Show for IndexMethod with fn output(self, logger) {
230 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:235:3-235:21:
    | 
    | ///|
    | pub impl Show for IndexColumn with fn output(self, logger) {
235 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:240:3-240:21:
    | 
    | ///|
    | pub impl Show for CreateDatabaseStmt with fn output(self, logger) {
240 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:245:3-245:21:
    | 
    | ///|
    | pub impl Show for CreateSchemaStmt with fn output(self, logger) {
245 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:250:3-250:21:
    | 
    | ///|
    | pub impl Show for CreateFunctionStmt with fn output(self, logger) {
250 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:255:3-255:21:
    | 
    | ///|
    | pub impl Show for FunctionParameter with fn output(self, logger) {
255 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:260:3-260:21:
    | 
    | ///|
    | pub impl Show for ParameterMode with fn output(self, logger) {
260 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:265:3-265:21:
    | 
    | ///|
    | pub impl Show for CreateProcedureStmt with fn output(self, logger) {
265 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:270:3-270:21:
    | 
    | ///|
    | pub impl Show for CreateSequenceStmt with fn output(self, logger) {
270 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:275:3-275:21:
    | 
    | ///|
    | pub impl Show for SequenceLimit with fn output(self, logger) {
275 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:280:3-280:21:
    | 
    | ///|
    | pub impl Show for SequenceOwnedBy with fn output(self, logger) {
280 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:285:3-285:21:
    | 
    | ///|
    | pub impl Show for DropViewStmt with fn output(self, logger) {
285 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:290:3-290:21:
    | 
    | ///|
    | pub impl Show for DuplicateTreatment with fn output(self, logger) {
290 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:295:3-295:21:
    | 
    | ///|
    | pub impl Show for TableConstraint with fn output(self, logger) {
295 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:300:3-300:21:
    | 
    | ///|
    | pub impl Show for ObjectName with fn output(self, logger) {
300 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:305:3-305:21:
    | 
    | ///|
    | pub impl Show for Top with fn output(self, logger) {
305 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:310:3-310:21:
    | 
    | ///|
    | pub impl Show for InsertStmt with fn output(self, logger) {
310 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:315:3-315:21:
    | 
    | ///|
    | pub impl Show for InsertSource with fn output(self, logger) {
315 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:320:3-320:21:
    | 
    | ///|
    | pub impl Show for DeleteStmt with fn output(self, logger) {
320 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:325:3-325:21:
    | 
    | ///|
    | pub impl Show for UpdateStmt with fn output(self, logger) {
325 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:330:3-330:21:
    | 
    | ///|
    | pub impl Show for Assignment with fn output(self, logger) {
330 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:335:3-335:21:
    | 
    | ///|
    | pub impl Show for MergeStmt with fn output(self, logger) {
335 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:340:3-340:21:
    | 
    | ///|
    | pub impl Show for MergeSource with fn output(self, logger) {
340 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:345:3-345:21:
    | 
    | ///|
    | pub impl Show for MergeWhenClause with fn output(self, logger) {
345 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:350:3-350:21:
    | 
    | ///|
    | pub impl Show for MergeMatchType with fn output(self, logger) {
350 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:355:3-355:21:
    | 
    | ///|
    | pub impl Show for MergeAction with fn output(self, logger) {
355 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:360:3-360:21:
    | 
    | ///|
    | pub impl Show for TruncateStmt with fn output(self, logger) {
360 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:365:3-365:21:
    | 
    | ///|
    | pub impl Show for DropTableStmt with fn output(self, logger) {
365 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:370:3-370:21:
    | 
    | ///|
    | pub impl Show for DropIndexStmt with fn output(self, logger) {
370 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:375:3-375:21:
    | 
    | ///|
    | pub impl Show for AlterTableStmt with fn output(self, logger) {
375 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:380:3-380:21:
    | 
    | ///|
    | pub impl Show for AlterTableOperation with fn output(self, logger) {
380 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:385:3-385:21:
    | 
    | ///|
    | pub impl Show for AlterIndexStmt with fn output(self, logger) {
385 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:390:3-390:21:
    | 
    | ///|
    | pub impl Show for AlterIndexOperation with fn output(self, logger) {
390 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:395:3-395:21:
    | 
    | ///|
    | pub impl Show for IndexParameter with fn output(self, logger) {
395 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:400:3-400:21:
    | 
    | ///|
    | pub impl Show for ShowStmt with fn output(self, logger) {
400 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:405:3-405:21:
    | 
    | ///|
    | pub impl Show for ShowType with fn output(self, logger) {
405 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:410:3-410:21:
    | 
    | ///|
    | pub impl Show for ShowFilter with fn output(self, logger) {
410 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:415:3-415:21:
    | 
    | ///|
    | pub impl Show for SetStmt with fn output(self, logger) {
415 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:420:3-420:21:
    | 
    | ///|
    | pub impl Show for SetScope with fn output(self, logger) {
420 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:425:3-425:21:
    | 
    | ///|
    | pub impl Show for SetAssignment with fn output(self, logger) {
425 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:430:3-430:21:
    | 
    | ///|
    | pub impl Show for UseStmt with fn output(self, logger) {
430 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:435:3-435:21:
    | 
    | ///|
    | pub impl Show for CopyStmt with fn output(self, logger) {
435 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:440:3-440:21:
    | 
    | ///|
    | pub impl Show for CopySource with fn output(self, logger) {
440 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:445:3-445:21:
    | 
    | ///|
    | pub impl Show for CopyDirection with fn output(self, logger) {
445 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:450:3-450:21:
    | 
    | ///|
    | pub impl Show for CopyTarget with fn output(self, logger) {
450 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:455:3-455:21:
    | 
    | ///|
    | pub impl Show for CopyOption with fn output(self, logger) {
455 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:460:3-460:21:
    | 
    | ///|
    | pub impl Show for CopyFormat with fn output(self, logger) {
460 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:465:3-465:21:
    | 
    | ///|
    | pub impl Show for CopyForceQuote with fn output(self, logger) {
465 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:470:3-470:21:
    | 
    | ///|
    | pub impl Show for OnInsert with fn output(self, logger) {
470 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:475:3-475:21:
    | 
    | ///|
    | pub impl Show for OnConflictClause with fn output(self, logger) {
475 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:480:3-480:21:
    | 
    | ///|
    | pub impl Show for ConflictTarget with fn output(self, logger) {
480 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:485:3-485:21:
    | 
    | ///|
    | pub impl Show for ConflictAction with fn output(self, logger) {
485 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:490:3-490:21:
    | 
    | ///|
    | pub impl Show for SqliteOnConflict with fn output(self, logger) {
490 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:495:3-495:21:
    | 
    | ///|
    | pub impl Show for BeginStmt with fn output(self, logger) {
495 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:500:3-500:21:
    | 
    | ///|
    | pub impl Show for CommitStmt with fn output(self, logger) {
500 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:505:3-505:21:
    | 
    | ///|
    | pub impl Show for RollbackStmt with fn output(self, logger) {
505 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:510:3-510:21:
    | 
    | ///|
    | pub impl Show for SavepointStmt with fn output(self, logger) {
510 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:515:3-515:21:
    | 
    | ///|
    | pub impl Show for ReleaseSavepointStmt with fn output(self, logger) {
515 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:520:3-520:21:
    | 
    | ///|
    | pub impl Show for GrantStmt with fn output(self, logger) {
520 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:525:3-525:21:
    | 
    | ///|
    | pub impl Show for Privilege with fn output(self, logger) {
525 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:530:3-530:21:
    | 
    | ///|
    | pub impl Show for RevokeStmt with fn output(self, logger) {
530 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:535:3-535:21:
    | 
    | ///|
    | pub impl Show for RevokeOption with fn output(self, logger) {
535 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:540:3-540:21:
    | 
    | ///|
    | pub impl Show for LoadDataStmt with fn output(self, logger) {
540 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:545:3-545:21:
    | 
    | ///|
    | pub impl Show for LoadDataDuplicateHandling with fn output(self, logger) {
545 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:550:3-550:21:
    | 
    | ///|
    | pub impl Show for LoadDataFieldsOptions with fn output(self, logger) {
550 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:555:3-555:21:
    | 
    | ///|
    | pub impl Show for LoadDataLinesOptions with fn output(self, logger) {
555 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:560:3-560:21:
    | 
    | ///|
    | pub impl Show for PrepareStmt with fn output(self, logger) {
560 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:565:3-565:21:
    | 
    | ///|
    | pub impl Show for ExecuteStmt with fn output(self, logger) {
565 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:570:3-570:21:
    | 
    | ///|
    | pub impl Show for DeallocateStmt with fn output(self, logger) {
570 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:575:3-575:21:
    | 
    | ///|
    | pub impl Show for SqlParserError with fn output(self, logger) {
575 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:580:3-580:21:
    | 
    | ///|
    | pub impl Show for Keyword with fn output(self, logger) {
580 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:585:3-585:21:
    | 
    | ///|
    | pub impl Show for LexerError with fn output(self, logger) {
585 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:590:3-590:21:
    | 
    | ///|
    | pub impl Show for Token with fn output(self, logger) {
590 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\show.mbt:595:3-595:21:
    | 
    | ///|
    | pub impl Show for ParserError with fn output(self, logger) {
595 |   show_compact_debug(self, logger)
    |   ^^^^^^^^^^^^^^^^^^
    | }
    | 

```
