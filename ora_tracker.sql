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

/*
Leitura do arquivo de configuração com owners, objetos e demais informações
necessárias para a geração dos scripts
*/
@@config/config.sql

/*
Realizar a conexão com o banco de dados
*/
@@system/ot_connect.sql

/*
Configurações gerais do sistema
*/
@@system/ot_config.sql

/*
Buscar datas de atualização dos objetos para consultar objetos 
alterados somente após a última atualização
*/
@@config/ot_datetime.sql

/*
Geração do script DB/exscript.sql, que contém a chamada da criação 
dos objetos encontrados para geração do script de cada um
*/
@@system/ot_export.sql

/*
Geração dos scripts dos objetos encontrados
*/
@@DB/exscript.sql

/*
Atualiza a data de consulta dos objetos no banco
*/
@@system/ot_update_time.sql

/*
Fechar conexão com sqlplus
*/
exit;
