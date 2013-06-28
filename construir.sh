#!/bin/bash

projeto=Estilos
pacoteDoProjeto=estilos

bibliotecas=bibliotecas
binarios=binarios
construcao=construcao
documentacao=documentacao
fontes=fontes
recursos=recursos
testes=testes

binariosCss=${binarios}/css
binariosHtml=${binarios}/html
fontesCss=${fontes}/css
fontesHtml=${fontes}/html

limpar() {
	echo ":limpar";
	rm -rf ${binarios};
	rm -rf ${construcao};
}

criarEstrutura() {
	echo ":criarEstrutura";
	mkdir -p ${binariosCss};
	mkdir -p ${binariosHtml};
	mkdir -p ${construcao};
	mkdir -p ${fontesCss};
	mkdir -p ${fontesHtml};
}

adicionarBibliotecas() {
	echo ":adicionarBibliotecas";
}

compilar() {
	limpar;
	criarEstrutura;
	adicionarBibliotecas;
	echo ":compilar";
	cp -rf ${fontesCss}/* ${binariosCss};
	cp -rf ${fontesHtml}/* ${binariosHtml};
}

construir() {
	compilar;
	echo ":construir";
	cp -rf ${binariosCss}/limpo/limpo.css ${construcao}/limpo.css;
	cp -rf ${binariosCss}/documento/documento.css ${construcao}/documento.css;
	cat ${binariosCss}/documento/secoes.css >> ${construcao}/documento.css;
	cat ${binariosCss}/documento/numeracao.css >> ${construcao}/documento.css;
	cat ${binariosCss}/documento/textual.css >> ${construcao}/documento.css;
	cat ${binariosCss}/documento/tabela.css >> ${construcao}/documento.css;
}

testar() {
	construir;
	echo ":testar";
}

depurar() {
	construir;
	echo ":depurar";
}

executar() {
	construir;
	echo ":executar";
	chromium-browser `find ${binariosHtml} -name *.html`;
}

echo :${pacoteDoProjeto}
if [ -n "$1" ]
then
	$1;
else
	construir;
fi
