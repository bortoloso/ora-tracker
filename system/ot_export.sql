/*
MIT License

Copyright (c) 2018 Bortoloso

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

set feedback off
set heading off
set termout off
set echo off
set verify off
set Pagesize 0
set linesize 1000
set Trimspool on
--set sqlprompt "-- > "

spool DB/exscript.sql

select 'spool DB/'|| upper(replace(object_type,' ','_'))||'/'||lower(object_name) || '.sql' || chr(13)||chr(10)||
       'SELECT DBMS_METADATA.GET_DDL('''||replace(object_type,' ','_')||''', '''||object_name||''', '''||owner||''') FROM DUAL;' || chr(13)||chr(10)||
       'spool off' ds_comando
  from (
    select object_type
         , object_name
         , owner
      from all_objects a
     where (
             (
              'All_OWNERS' = upper(trim(replace('&OWNER_TO_EXPORT',',',''',''')))
             ) or
             (upper(a.owner) in (
                                select upper(trim(regexp_substr('&OWNER_TO_EXPORT','[^,]+', 1, level))) from dual
                                connect by regexp_substr('&OWNER_TO_EXPORT', '[^,]+', 1, level) is not null
                                )
             )
           )
       and object_type in (
            decode(upper('&EXPORT_TABLE'),'Y','TABLE','X'),
            decode(upper('&EXPORT_VIEW'),'Y','VIEW','X'),
            decode(upper('&EXPORT_TYPE'),'Y','TYPE','X'),
            decode(upper('&EXPORT_TYPE'),'Y','TYPE BODY','X'),
            decode(upper('&EXPORT_PROCEDURE'),'Y','PROCEDURE','X'),
            decode(upper('&EXPORT_FUNCTION'),'Y','FUNCTION','X'),
            decode(upper('&EXPORT_MATERIALIZED_VIEW'),'Y','MATERIALIZED VIEW','X'),
            decode(upper('&EXPORT_TRIGGER'),'Y','TRIGGER','X'),
            decode(upper('&EXPORT_PACKAGE'),'Y','PACKAGE','X'),
            decode(upper('&EXPORT_PACKAGE'),'Y','PACKAGE BODY','X')
            )
       and last_ddl_time >= to_date('&OT_DATETIME','ddmmyyyyhh24miss')
     )
  ;

spool off

