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
Configuração do(s) OWNER(s) dos objetos que serão esportados
A opção All_OWNERS informa ao sistema para exportar os objetos
de todos os owners.
Pode-se informar mais de um owner, separando-os por vírgula.

Opções:
All_OWNERS - Exporta de todos os owners, neste caso informar somente este parâmetro, ex:
  define OWNER_TO_EXPORT=TEST

<outro valor> - Exporta somente dos owners informados, ex:
  define OWNER_TO_EXPORT=TEST,DEV,PRD
*/
define OWNER_TO_EXPORT=TEST

/*
Configuração dos objetos que serão exportados
Opções:
N - Não exporta o objeto
Y - Exporta o tipo de objeto
*/
define EXPORT_TABLE=Y
define EXPORT_VIEW=Y
define EXPORT_TYPE=Y
define EXPORT_PROCEDURE=Y
define EXPORT_FUNCTION=Y
define EXPORT_MATERIALIZED_VIEW=Y
define EXPORT_TRIGGER=Y
define EXPORT_PACKAGE=Y