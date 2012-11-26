#!/bin/bash

fontes=fontes
fontesHtml=${fontes}/html
fontesCss=${fontes}/css
binarios=binarios
binariosCss=${binarios}/css

echo ":limpar"
rm -rf ${binarios}

echo ":criarDiretorios"
mkdir -p ${fontes}
mkdir -p ${fontesHtml}
mkdir -p ${fontesCss}
mkdir -p ${binarios}
mkdir -p ${binariosCss}

echo ":compilarFontesCss"
cp -rf ${fontesCss}/* ${binariosCss}

